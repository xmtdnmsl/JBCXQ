local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/bailib/Roblox/refs/heads/main/main/ESP.lua"))()
ESP.AddFolder("HiderESPFolder")
ESP.AddFolder("HunterESPFolder")
ESP.AddFolder("GlassESPFolder")

local lastUpdate = 0
local updateInterval = 1
local Tabs = {}  -- 初始化 Tabs 表

function gradient(text, startColor, endColor)
    local result = ""
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = "欢迎进入冷寂脚本! 记得进群",
    Icon = "rbxassetid://129260712070622",
    Icond = true,
    Content = "KLNB " .. gradient("NOL", Color3.fromHex("#F8F8FF"), Color3.fromHex("#E1F5FE")) .. " NB",
    Buttons = {
        {
            Title = "Cancel",
            Callback = function() end,
            Variant = "Secondary",
        },
        {
            Title = "Continue",
            Icon = "arrow-right",
            Callback = function() Confirmed = true end,
            Variant = "Primary",
        }
    }
})

repeat wait() until Confirmed

local Window = WindUI:CreateWindow({
    Title = "冷寂",
    Icon = "rbxassetid://129260712070622",
    IconThemed = true,
    Author = "冷寂脚本",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(480, 380),
    Transparent = true,
    Theme = "Light",
    User = {
        Enabled = true,
        Callback = function() print("clicked") end,
        Anonymous = true
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
    KeySystem = {
        Key = { "KL牛逼冷寂牛逼", "冷寂牛逼KL牛逼" },
        Note = "Example Key System. \n\n进群获得卡密398990034",
        URL = "398990034",
        SaveKey = false,
    },
})

Window:CreateTopbarButton("MyCustomButton1", "bird", function() print("clicked 1!") end, 990)
Window:CreateTopbarButton("MyCustomButton3", "battery-plus", function() Window:ToggleFullscreen() end, 989)

Window:EditOpenButton({
    Title = "冷寂脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("00FF87"), Color3.fromHex("A6E3FF")),
    Draggable = true,
})

local Tabs = {}

do
    Tabs.MainTab = Window:Section({Title = "公告", Opened = true})
    Tabs.dnessTab = Tabs.MainTab:Tab({ Title = "公告", Icon = "zap" })
end

Tabs.dnessTab:Button({
    Title = "创作者名单",
    Callback = function()
        Window:Dialog({
            Title = "创作者名单",
            Content = "名单",
            Icon = "bird",
            Buttons = {
                {
                    Title = "冷寂牛逼!",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        print("lol")
                    end,
                },
                {
                    Title = "苏达牛逼!",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        print("Cool")
                    end,
                },
                {              
                Title = "墨.牛逼!",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        print("Cool")
                    end,
                },
                {
                    Title = "风御牛逼!",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function()
                        print("Ok")
                    end,
                },
                {
                    Title = "风雨之间牛逼!",
                    Icon = "bird",
                    Variant = "Tertiary",
                    Callback = function() 
                        print("Awesome")
                    end,
                }
            }
        })
    end,
})

local Tabs = {}

do
    Tabs.MainTab = Window:Section({Title = "通用脚本", Opened = false})
    Tabs.SpeedTab = Tabs.MainTab:Tab({ Title = "通用", Icon = "zap" })
    Tabs.MianTab = Tabs.MainTab:Tab({ Title = "极品通用", Icon = "zap" })
end

Window:SelectTab(1)

Tabs.SpeedTab:Button({
    Title = "飞行",
    Desc = "飞行",
    Callback = function()
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
    end
})

local lastRefresh = 0 -- 记录上次点击时间

Tabs.SpeedTab:Button({
    Title = "自动刷新透视",
    Description = "点击执行 ESP 脚本（10秒冷却）",
    Callback = function()
        local now = tick()
        if now - lastRefresh < 10 then
            warn("请等待 " .. math.floor(10 - (now - lastRefresh)) .. " 秒后再试！")
            return
        end
        
        lastRefresh = now
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
    end
})

Tabs.SpeedTab:Button({
    Title = "玩家传送",
    Description = "点击打开传送面板",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        
        -- 创建UI
        local TeleportUI = Instance.new("ScreenGui")
        TeleportUI.Name = "TeleportUI"
        TeleportUI.Parent = LocalPlayer:WaitForChild("PlayerGui")
        
        -- 悬浮按钮
        local ToggleBtn = Instance.new("ImageButton")
        ToggleBtn.Image = "rbxassetid://3926307971"
        ToggleBtn.ImageRectOffset = Vector2.new(884, 4)
        ToggleBtn.ImageRectSize = Vector2.new(36, 36)
        ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
        ToggleBtn.Position = UDim2.new(0, 20, 0.5, -25)
        ToggleBtn.BackgroundTransparency = 1
        ToggleBtn.Parent = TeleportUI
        
        -- 主窗口
        local MainFrame = Instance.new("Frame")
        MainFrame.Size = UDim2.new(0, 220, 0, 300)
        MainFrame.Position = UDim2.new(0.5, -110, 0.5, -150)
        MainFrame.BackgroundColor3 = Color3.fromRGB(30, 35, 40)
        MainFrame.Visible = false
        MainFrame.Parent = TeleportUI
        
        -- 圆角
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 8)
        UICorner.Parent = MainFrame
        
        -- 标题
        local Title = Instance.new("TextLabel")
        Title.Text = "玩家传送"
        Title.Size = UDim2.new(1, 0, 0, 40)
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1
        Title.Font = Enum.Font.GothamBold
        Title.Parent = MainFrame
        
        -- 玩家列表
        local PlayerList = Instance.new("ScrollingFrame")
        PlayerList.Size = UDim2.new(1, -10, 1, -50)
        PlayerList.Position = UDim2.new(0, 5, 0, 45)
        PlayerList.AutomaticCanvasSize = Enum.AutomaticSize.Y
        PlayerList.ScrollBarThickness = 5
        PlayerList.BackgroundTransparency = 1
        PlayerList.Parent = MainFrame
        
        -- 更新玩家列表
        local function UpdateList()
            for _, v in pairs(PlayerList:GetChildren()) do
                if v:IsA("TextButton") then v:Destroy() end
            end
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local btn = Instance.new("TextButton")
                    btn.Text = player.Name
                    btn.Size = UDim2.new(1, -10, 0, 35)
                    btn.Position = UDim2.new(0, 5, 0, #PlayerList:GetChildren() * 40)
                    btn.BackgroundColor3 = Color3.fromRGB(50, 55, 60)
                    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    btn.Font = Enum.Font.Gotham
                    
                    local btnCorner = Instance.new("UICorner")
                    btnCorner.CornerRadius = UDim.new(0, 4)
                    btnCorner.Parent = btn
                    
                    btn.MouseButton1Click:Connect(function()
                        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character:SetPrimaryPartCFrame(
                                player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                            )
                        end
                    end)
                    
                    btn.Parent = PlayerList
                end
            end
            
            if #PlayerList:GetChildren() == 0 then
                local empty = Instance.new("TextLabel")
                empty.Text = "没有其他玩家"
                empty.Size = UDim2.new(1, 0, 0, 60)
                empty.TextColor3 = Color3.fromRGB(180, 180, 180)
                empty.BackgroundTransparency = 1
                empty.Parent = PlayerList
            end
        end
        
        -- 事件
        ToggleBtn.MouseButton1Click:Connect(function()
            MainFrame.Visible = not MainFrame.Visible
            if MainFrame.Visible then UpdateList() end
        end)
        
        Players.PlayerAdded:Connect(UpdateList)
        Players.PlayerRemoving:Connect(UpdateList)
        
        -- 初始更新
        UpdateList()
    end
})

Tabs.SpeedTab:Button({
    Title = "连跳",
    Desc = "连跳",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
    end
})

Tabs.SpeedTab:Slider({
    Title = "跑步速度",
    Value = {
        Min = 1,
        Max = 100,
        Default = 50,
    },
    Callback = function(value)
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = value
            end
        end
    end
})

Tabs.SpeedTab:Slider({
    Title = "跳跃高度",
    Value = {
        Min = 1,
        Max = 100,
        Default = 50,
    },
    Callback = function(value)
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.JumpPower = value
            end
        end
    end
})

Tabs.SpeedTab:Toggle({
    Title = "连跳",
    Value = false,
    Callback = function(value)
       Jump = value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end
})

Tabs.SpeedTab:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(value)
        WallTp = value
        if value then
            -- 开启穿墙时，监听玩家移动
            game:GetService("RunService").Stepped:Connect(function()
                if WallTp and game.Players.LocalPlayer.Character then
                    local Character = game.Players.LocalPlayer.Character
                    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                    if Humanoid then
                        -- 取消碰撞检测（穿墙核心）
                        for _, part in ipairs(Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    end
                end
            end)
        else
            -- 关闭穿墙时，恢复碰撞
            if game.Players.LocalPlayer.Character then
                for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
})

Tabs.SpeedTab:Button({
    Title = "踏空",
    Desc = "踏空",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "爬墙",
    Desc = "爬墙",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "光影",
    Desc = "光影",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "键盘",
    Desc = "键盘",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "自瞄",
    Desc = "自瞄",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))() 
    end
})

Tabs.SpeedTab:Button({
    Title = "变流畅",
    Desc = "变流畅",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua"))()        
    end
})

Tabs.SpeedTab:Button({
    Title = "子追",
    Desc = "子追",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1AJ69eRG"))()        
    end
})

Tabs.MianTab:Button({
    Title = "控制NPC",
    Desc = "控制NPC",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/fe-source/refs/heads/main/NPC/source/main.Luau"))()        
    end
})

Tabs.MianTab:Button({
    Title = "FE动作脚本",
    Desc = "FE动作脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Emircxy/Lear/refs/heads/main/Lear%20Hub"))()        
    end
})

Tabs.MianTab:Button({
    Title = "超牛逼黑洞脚本",
    Desc = "超牛逼黑洞脚本",
    Callback = function()
    ll(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-AURA/main/kawaii_aura.lua", true))()
end)        
    end
})

Tabs.MianTab:Button({
    Title = "聊天框画画",
    Desc = "聊天框画画",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/_/refs/heads/main/a"))()        
    end
})

Tabs.MianTab:Button({
    Title = "FE防守动作",
    Desc = "FE防守动作",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Saiky988/Saryn-Hub/refs/heads/main/Saryn%Hub%Beta.lua'))()        
    end
})

local Tabs = {}

do
    Tabs.MainTab = Window:Section({Title = "服务器脚本", Opened = false})
    Tabs.modTab = Tabs.MainTab:Tab({ Title = "最强战场", Icon = "zap" })
    Tabs.SvipTab = Tabs.MainTab:Tab({ Title = "被遗弃", Icon = "zap" })
    Tabs.yesTab = Tabs.MainTab:Tab({ Title = "doors", Icon = "zap" })
    Tabs.windowTab = Tabs.MainTab:Tab({ Title = "刀刃球", Icon = "zap" })
    Tabs.pkgTab = Tabs.MainTab:Tab({ Title = "种植花园", Icon = "zap" })
    Tabs.loveTab = Tabs.MainTab:Tab({ Title = "极速脚本", Icon = "zap" })
    Tabs.likeTab = Tabs.MainTab:Tab({ Title = "生存五百天", Icon = "zap" })
    Tabs.wowTab = Tabs.MainTab:Tab({ Title = "一路向西", Icon = "zap" })
    Tabs.rootTab = Tabs.MainTab:Tab({ Title = "Blox Fruit", Icon = "zap" })
    Tabs.yourTab = Tabs.MainTab:Tab({ Title = "战斗战士", Icon = "zap" })
    Tabs.fruitTab = Tabs.MainTab:Tab({ Title = "动感星期五", Icon = "zap" })
    Tabs.kidTab = Tabs.MainTab:Tab({ Title = "忍者传奇", Icon = "zap" })
    Tabs.hubTab = Tabs.MainTab:Tab({ Title = "死铁轨", Icon = "zap" })
    Tabs.qwerTab = Tabs.MainTab:Tab({ Title = "R子", Icon = "zap" })
    Tabs.edgeTab = Tabs.MainTab:Tab({ Title = "巴掌模拟器", Icon = "zap" })
    Tabs.meTab = Tabs.MainTab:Tab({ Title = "3008", Icon = "zap" })
    Tabs.iosTab = Tabs.MainTab:Tab({ Title = "尘土飞扬", Icon = "zap" })
    Tabs.jojoTab = Tabs.MainTab:Tab({ Title = "破坏模拟器", Icon = "zap" })
    Tabs.pyTab = Tabs.MainTab:Tab({ Title = "索纳里亚", Icon = "zap" })
    Tabs.wxTab = Tabs.MainTab:Tab({ Title = "破坏者谜团", Icon = "zap" })
    Tabs.nbTab = Tabs.MainTab:Tab({ Title = "自然灾害", Icon = "zap" })
    Tabs.fETab = Tabs.MainTab:Tab({ Title = "彩虹朋友", Icon = "zap" })
    Tabs.tsbTab = Tabs.MainTab:Tab({ Title = "请捐赠", Icon = "zap" })
    Tabs.ovoTab = Tabs.MainTab:Tab({ Title = "克隆大亨", Icon = "zap" })
    Tabs.nvTab = Tabs.MainTab:Tab({ Title = "内脏与黑火药", Icon = "zap" })
    Tabs.chaTab = Tabs.MainTab:Tab({ Title = "压力", Icon = "zap" })
    Tabs.descTab = Tabs.MainTab:Tab({ Title = "偷走脑红", Icon = "zap" })
    Tabs.jiushiTab = Tabs.MainTab:Tab({ Title = "99夜", Icon = "zap" })
end
end

Tabs.modTab:Button({
    Title = "最强(最牛逼的得先下资源)",
    Desc = "最强(最牛逼的得先下资源)",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/SG_DEMO.lua"))()        
    end
})

Tabs.modTab:Button({
    Title = "最强(火影忍者)",
    Desc = "最强(火影三种角色)",
    Callback = function()
    getgenv().Cutscene = False -- //𝖲𝖤𝖳 𝖨𝖳 "𝖥𝖠𝖫𝖲𝖤" 𝖨𝖥 𝖴 𝖣𝖮𝖭'𝖳 𝖶𝖠𝖭𝖳 𝖢𝖴𝖳𝖲𝖢𝖤𝖭𝖤 𝖠𝖭𝖣 𝖨𝖥 𝖴 𝖶𝖠𝖭𝖳 "𝖳𝖱𝖴𝖤" 𝖨𝖳\

loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/SCRIPTSBYVEUX/refs/heads/main/BoombasticLol.lua.txt"))()        
    end
})

Tabs.modTab:Button({
    Title = "超人脚本",
    Desc = "超人脚本",
    Callback = function()
    -- OmniMan on Saitama
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nova2ezz/OmniManScript/refs/heads/main/Protected_4630876916309035.lua"))()        
    end
})

Tabs.modTab:Button({
    Title = "神秘角色",
    Desc = "神秘角色",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/eEDYWj8p"))()        
    end
})

Tabs.modTab:Button({
    Title = "火车头",
    Desc = "火车头",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/ATrainSounds/refs/heads/main/ATrain.lua"))()        
    end
})

Tabs.modTab:Button({
    Title = "电锯人",
    Desc = "电锯人",
    Callback = function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/CHAINSAW%20MAN/Chainsaw%20Man%20(Obfuscated).txt"))()        
    end
})

Tabs.modTab:Button({
    Title = "KJ脚本",
    Desc = "KJ脚本",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NetlessMade/KJ-TO-JK/refs/heads/main/script.lua"))()        
    end
})

Tabs.modTab:Button({
    Title = "最强2",
    Desc = "最强2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hamletirl/sunjingwoo/refs/heads/main/sunjingwoo"))()        
    end
})

Tabs.modTab:Button({
    Title = "最强3",
    Desc = "最强3",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"))()
-- enjoy
-- Eid Mubarak!!        
    end
})

Tabs.modTab:Button({
    Title = "最强4",
    Desc = "最强4",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()        
    end
})

Tabs.SvipTab:Button({
    Title = "被遗弃(最强)",
    Desc = "被遗弃(最强)",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/sigmaboy-sigma-boy/sigmaboy-sigma-boy/refs/heads/main/StaminaSettings.ESP.PIDC.raw'))()        
    end
})

Tabs.SvipTab:Button({
    Title = "被遗弃2",
    Desc = "被遗弃2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BobJunior1/ForsakenBoi/refs/heads/main/B0bbyHub"))()        
    end
})

Tabs.yesTab:Button({
    Title = "doors(要解卡但是牛逼)",
    Desc = "doors(要解卡但是牛逼)",
    Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/002c19202c9946e6047b0c6e0ad51f84.lua"))()        
    end
})

Tabs.jiushiTab:Button({
    Title = "99",
    Desc = "99",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xmtdnmsl/fgbkknyb/refs/heads/main/LENGJI99.lua"))()        
    end
})

Tabs.yesTab:Button({
    Title = "doors(超级牛逼汉化版)",
    Desc = "doors(超级牛逼汉化版)",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))()        
    end
})

Tabs.windowTab:Button({
    Title = "刀刃球(比较牛逼)",
    Desc = "刀刃球(比较牛逼)",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mzkv/LUNAR/refs/heads/main/BladeBall", true))()        
    end
})

Tabs.windowTab:Button({
    Title = "刀刃球(目前最强)",
    Desc = "刀刃球(目前最强)",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mzkv/LUNAR/refs/heads/main/BladeBall", true))()        
    end
})

Tabs.pkgTab:Button({
    Title = "种植花园",
    Desc = "种植花园",
    Callback = function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()        
    end
})

Tabs.loveTab:Button({
    Title = "极速脚本",
    Desc = "极速脚本",
    Callback = function()
    loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\111\121\115\99\112\47\98\101\116\97\47\109\97\105\110\47\37\69\57\37\56\48\37\57\70\37\69\53\37\66\65\37\65\54\37\69\55\37\56\50\37\66\56\37\69\56\37\66\53\37\66\55\46\108\117\97'))()        
    end
})

Tabs.likeTab:Button({
    Title = "生存五百天2",
    Desc = "生存五百天2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/-Hub-X/main/Speed%20Hub%20X.lua", true))()        
    end
})

Tabs.wowTab:Button({
    Title = "杀戮光环",
    Desc = "杀戮光环",
    Callback = function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/Prohacking12/ac46591ae6546dca1e10a7b3a6847501/raw/6aa7d4b33c73a57b6a28bf296fb40dcdeee052b9/gistfile1.txt", true))()
    end
})

Tabs.rootTab:Button({
    Title = "BF",
    Desc = "BF",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bubu2k/Rubutv/refs/heads/main/RubuHubV3.txt"))()        
    end
})

Tabs.rootTab:Button({
    Title = "BF2",
    Desc = "BF2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinBE"))()        
    end
})

Tabs.rootTab:Button({
    Title = "BF3",
    Desc = "BF3",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()        
    end
})

Tabs.yourTab:Button({
    Title = "战斗战士",
    Desc = "战斗战士",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AndycScpt/ReHydraFix/refs/heads/main/Rehydra.lua"))()        
    end
})

Tabs.fruitTab:Button({
    Title = "动感星期五",
    Desc = "动感星期五",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/ScriptHub/main/Loader"))()        
    end
})

Tabs.fruitTab:Button({
    Title = "动感星期五2",
    Desc = "动感星期五2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nadir3709/RandomScript/main/FunkyFridayMobile"))()        
    end
})

Tabs.kidTab:Button({
    Title = "忍者传奇",
    Desc = "忍者传奇",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XRoLLu/Rolly_Hub/main/open-source-trash-loader.exe.yeah"))()
    end
})

Tabs.hubTab:Button({
    Title = "死铁轨",
    Desc = "死铁轨",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Qiwikox12/stubrawl/refs/heads/main/DeadRails.txt"))()        
    end
})

Tabs.qwerTab:Button({
    Title = "R子",
    Desc = "R子",
    Callback = function()
    loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()        
    end
})

Tabs.qwerTab:Button({
    Title = "R子",
    Desc = "R子",
    Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/69e8ba1202445c3dd5573b1745f345ae.lua"))()        
    end
})

Tabs.qwerTab:Button({
    Title = "R子",
    Desc = "R子",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptsLynX/LynX/main/KeySystem/Loader.lua"))()        
    end
})

Tabs.qwerTab:Button({
    Title = "R子",
    Desc = "R子",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/the%20rake"))()        
    end
})

Tabs.edgeTab:Button({
    Title = "主播同款",
    Desc = "主播同款",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/slapfarmgui/main/main.lua'))()        
    end
})

Tabs.edgeTab:Button({
    Title = "无cd(先用一下技能)",
    Desc = "无cd(先用一下技能)",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/refs/heads/main/NoCooldown'))()        
    end
})

Tabs. edgeTab:Button({
    Title = "巴掌综合中心",
    Desc = "巴掌综合中心",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Guy-that-exists/Hub-that-exists/main/Script"))()        
    end
})

Tabs.edgeTab:Button({
    Title = "一秒一百掌",
    Desc = "一秒一百掌",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/refs/heads/main/SlapFarmOP'))()        
    end
})

Tabs.meTab:Button({
    Title = "3008",
    Desc = "3008",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/welomenchaina/Loader/refs/heads/main/ScriptLoader",true))()        
    end
})

Tabs.meTab:Button({
    Title = "3008 2",
    Desc = "3008 2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/CPP/refs/heads/main/Main.cpp"))()        
    end
})

Tabs.iosTab:Button({
    Title = "尘土飞扬(无敌)",
    Desc = "尘土飞扬(无敌)",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/adustytrip"))()        
    end
})

Tabs.jojoTab:Button({
    Title = "破坏模拟器",
    Desc = "破坏模拟器",
    Callback = function()
    loadstring(game:HttpGet('https://rawscripts.net/raw/Destruction-Simulator-INF-MONEY-20330'))()        
    end
})

Tabs.jojoTab:Button({
    Title = "破坏模拟器",
    Desc = "破坏模拟器",
    Callback = function()
    loadstring(game:HttpGet("https://scripts.waza80.com/script/DestructionSimulator"))()        
    end
})

Tabs.jojoTab:Button({
    Title = "破坏模拟器",
    Desc = "破坏模拟器",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/p1neru/tutor/main/p1ne-injector"))()        
    end
})

Tabs.pyTab:Button({
    Title = "索纳里亚",
    Desc = "索纳里亚",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/alyssagithub/Scripts/refs/heads/main/FrostByte/Initiate.lua"))()        
    end
})

Tabs.wxTab:Button({
    Title = "破坏者谜团",
    Desc = "破坏者谜团",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/OnyxHub-New/OnyxHub/refs/heads/main/mm2'))()        
    end
})

Tabs.nbTab:Button({
    Title = "自然灾害",
    Desc = "自然灾害",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
    end
})

Tabs.nbTab:Button({
    Title = "自然灾害高级",
    Desc = "自然灾害高级",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/9NLK7/93qjoadnlaknwldk/main/main'))()        
    end
})

Tabs.nbTab:Button({
    Title = "自然灾害搬运",
    Desc = "自然灾害搬运",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/73GG/Game-Scripts/main/Natural%20Disaster%20Survival.lua"))()        
    end
})

Tabs.fETab:Button({
    Title = "彩虹朋友1",
    Desc = "彩虹朋友1",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JNHHGaming/Rainbow-Friends/main/Rainbow%20Friends"))()        
    end
})

Tabs.fETab:Button({
    Title = "彩虹朋友2",
    Desc = "彩虹朋友2",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0rainbow'))()        
    end
})

Tabs.tsbTab:Button({
    Title = "请捐赠",
    Desc = "请捐赠",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/heqds/Pls-Donate-Auto-Farm-Script/main/plsdonate.lua'))()        
    end
})

Tabs.ovoTab:Button({
    Title = "克隆大亨管理功能",
    Desc = "克隆大亨管理功能",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/heqds/Pls-Donate-Auto-Farm-Script/main/plsdonate.lua'))()        
    end
})

Tabs.ovoTab:Button({
    Title = "克隆大亨2",
    Desc = "克隆大亨2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HELLLO1073/RobloxStuff/main/CT-Destroyer"))()     
    end
})

Tabs.nvTab:Button({
    Title = "内脏与黑火药",
    Desc = "内脏与黑火药",
    Callback = function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\67\104\105\110\97\81\89\47\83\99\114\105\112\116\115\47\77\97\105\110\47\71\66"))()        
    end
})

Tabs.chaTab:Button({
    Title = "压力",
    Desc = "压力",
    Callback = function()
    loadstring(request({["Url"]="https://raw.githubusercontent.com/9kn-1/preeorrr/main/pressure.luau"}).Body)()     
    end
})

Tabs.descTab:Button({
    Title = "偷走脑红1",
    Desc = "偷走脑红1",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/WinzeTim/timmyhack2/refs/heads/main/stealabrainrot.lua'))()        
    end
})

Tabs.descTab:Button({
    Title = "偷走脑红2",
    Desc = "偷走脑红2",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/egor2078f/lurkhackv4/refs/heads/main/main.lua", true))()        
    end
})

Tabs.descTab:Button({
    Title = "偷走脑红3",
    Desc = "偷走脑红3",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/loader/main/scripts.lua"))()        
    end
})

Tabs.descTab:Button({
    Title = "偷走脑红4",
    Desc = "偷走脑红4",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()        
    end
})

local Tabs = {}

do
    Tabs.MainTab = Window:Section({Title = "墨水游戏", Opened = false})
    Tabs.PlayerTab = Tabs.MainTab:Tab({ Title = "帮助玩家", Icon = "zap" })
    Tabs.MovementTab = Tabs.MainTab:Tab({ Title = "移动", Icon = "zap" })
    Tabs.CombatTab = Tabs.MainTab:Tab({ Title = "战斗", Icon = "zap" })
    Tabs. GameTab = Tabs.MainTab:Tab({ Title = "作弊", Icon = "zap" })
    Tabs. ESPTab = Tabs.MainTab:Tab({ Title = "绘制", Icon = "zap" })
end

Tabs.ESPTab:Toggle({
    Title = "透视假玻璃板",
    Image = "bird",
    Value = false,
    Callback = function(state)
        if state then
            -- 检查路径是否存在
            local glassBridge = workspace:FindFirstChild("GlassBridge")
            if not glassBridge then 
                WindUI:Notify({ Title = "错误", Content = "未找到 GlassBridge" })
                return 
            end
            
            local glassHolder = glassBridge:FindFirstChild("GlassHolder")
            if not glassHolder then
                WindUI:Notify({ Title = "错误", Content = "未找到 GlassHolder" })
                return
            end

            -- 遍历假玻璃
            for _, v in next, glassHolder:GetChildren() do
                if v.Name:find("ClonedPanel") then
                    for _, panelChild in next, v:GetChildren() do
                        for _, glassPart in next, panelChild:GetChildren() do
                            if glassPart.Name == "glasspart" and glassPart:FindFirstChild("TouchInterest") then
                                -- 确认 ESP 库的函数名（可能是 AddESP 或 Add）
                                ESP.AddESP("GlassESPFolder", "假玻璃", glassPart, Color3.new(0, 1, 0))
                                -- 或者：ESP.Add(glassPart, { Name = "假玻璃", Color = Color3.new(0, 1, 0) })
                            end
                        end
                    end
                end
            end
        else
            -- 确认 ESP 库的清空函数（可能是 Clear 或 RemoveFolder）
            ESP.Clear("GlassESPFolder")
            -- 或者：ESP.RemoveFolder("GlassESPFolder")
        end
    end
})

local a = {
    list = {},
    selectname = "",
    autoPush = false
}

for _, v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer then
        table.insert(a.list, v.Name)
    end
end

Tabs.CombatTab:Section({Title = "自动推人"})
Tabs.CombatTab:Dropdown({
    Title = "选择玩家",
    Values = a.list,
    Value = "",
    Callback = function(option)
        a.selectname = option
    end
})

Tabs.CombatTab:Toggle({
    Title = "自动推人",
    Default = false,
    Image = "check",
    Callback = function(state)
        a.autoPush = state
        if state then
            spawn(function()
                while a.autoPush and wait() do
                    local targetPlayer = Players:FindFirstChild(a.selectname)
                    local localChar = LocalPlayer.Character
                    
                    if targetPlayer and targetPlayer.Character and localChar then
                        localChar:MoveTo(targetPlayer.Character:GetPivot().Position)
                        
                        local pushTool = LocalPlayer.Backpack:FindFirstChild("Push")
                        if pushTool then
                            local args = {
                                [1] = "UsingMoveCustom",
                                [2] = pushTool,
                                [4] = {
                                    ["AutoUse"] = true
                                }
                            }
                            ReplicatedStorage.Remotes.UsedTool:FireServer(unpack(args))
                        end
                    end
                end
            end)
        end
    end
})

Tabs.CombatTab:Toggle({
    Title = "自动砍人(捉迷藏)",
    Default = false,
    Image = "check",
    Callback = function(state)
        if state then
            spawn(function()
                while state and wait() do
                    local potentialTargets = {}
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer then
                            if player.Character and player.Character:FindFirstChild("Humanoid") then
                                if player.Character:GetAttribute("IsHunter") == true then
                                    table.insert(potentialTargets, player)
                                end
                            end
                        end
                    end
                    if #potentialTargets > 0 then
                        local targetPlayer = potentialTargets[math.random(1, #potentialTargets)]
                        local localChar = LocalPlayer.Character
                        local targetChar = targetPlayer.Character
                        
                        if localChar and targetChar then
                            localChar:MoveTo(targetChar:GetPivot().Position)
                            
                            local knifeTool = LocalPlayer.Backpack:FindFirstChild("Knife")
                            if knifeTool then
                                local args = {
                                    [1] = "UsingMoveCustom",
                                    [2] = knifeTool,
                                    [4] = {
                                        ["Clicked"] = true
                                    }
                                }
                                ReplicatedStorage.Remotes.UsedTool:FireServer(unpack(args))
                            end
                        end
                    end
                end
            end)
        end
    end
})

Tabs.MovementTab:Section({Title = "属性加成"})
Tabs.MovementTab:Slider({
    Title = "速度提升加成",
    Desc = "Speed Boost",
    Value = {
        Min = 1,
        Max = 500,
        Default = 16,
    },
    Callback = function(Value)
        LocalPlayer.Boosts["Faster Sprint"].Value = Value
    end
})

Tabs.MovementTab:Slider({
    Title = "胜利加成",
    Desc = "Won Boost",
    Value = {
        Min = 1,
        Max = 500,
        Default = 16,
    },
    Callback = function(Value)
        LocalPlayer.Boosts["Won Boost"].Value = Value
    end
})

Tabs.CombatTab:Slider({
    Title = "伤害加成",
    Desc = "Damage Boost",
    Value = {
        Min = 1,
        Max = 500,
        Default = 16,
    },
    Callback = function(Value)
        LocalPlayer.Boosts["Damage Boost"].Value = Value
    end
})

local polygon = {
    Vector2.new(-52, -515),
    Vector2.new(115, -515),
    Vector2.new(115, 84),
    Vector2.new(-216, 84)
}

local function isPointInPolygon(point, poly)
    local inside = false
    local j = #poly
    for i = 1, #poly do
        local xi, zi = poly[i].X, poly[i].Y
        local xj, zj = poly[j].X, poly[j].Y
        if ((zi > point.Y) ~= (zj > point.Y)) and
            (point.X < (xj - xi) * (point.Y - zi) / (zj - zi + 1e-9) + xi) then
            inside = not inside
        end
        j = i
    end
    return inside
end

local function tpTo(cf)
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = cf
    end
end

local function fireProximityPrompt(prompt)
    if fireproximityprompt then
        pcall(fireproximityprompt, prompt)
    elseif prompt and prompt:IsA("ProximityPrompt") then
        prompt:InputHoldBegin()
        task.wait(0.1)
        prompt:InputHoldEnd()
    end
end

Tabs.PlayerTab:Section({Title = "帮助玩家功能"})
Tabs.PlayerTab:Button({
    Title = "帮助玩家到终点，同时你自己也可以(木头人关)",
    Callback = function()
        local foundPlayer = false
        
        if tick() - lastUpdate < updateInterval then
            WindUI:Notify({
                Title = "帮助玩家",
                Content = "操作过于频繁，请稍后再试",
                Icon = "clock",
                Duration = 1,
            })
            return
        end
        lastUpdate = tick()
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local liveChar = workspace:FindFirstChild("Live") and workspace.Live:FindFirstChild(player.Name)
                local hrp = liveChar and liveChar:FindFirstChild("HumanoidRootPart")

                if hrp then
                    local posXZ = Vector2.new(hrp.Position.X, hrp.Position.Z)
                    if isPointInPolygon(posXZ, polygon) then
                        local prompt = hrp:FindFirstChild("CarryPrompt")

                        if prompt and prompt:IsA("ProximityPrompt") and prompt.Enabled then
                            WindUI:Notify({
                                Title = "帮助玩家",
                                Content = "正在帮助: " .. player.Name,
                                Icon = "user-check",
                                Duration = 1,
                            })
                            
                            pcall(function()
                                tpTo(hrp.CFrame + Vector3.new(0, 2, 0))
                                task.wait(0.4)
                                fireProximityPrompt(prompt)
                                task.wait(0.7)
                                tpTo(CFrame.new(-46, 1024, 110))
                            end)
                            
                            WindUI:Notify({
                                Title = "帮助完成",
                                Content = "已完成帮助: " .. player.Name,
                                Icon = "check-circle",
                                Duration = 1,
                            })
                            foundPlayer = true
                            break
                        end
                    end
                end
            end
        end
        
        if not foundPlayer then
            WindUI:Notify({
                Title = "帮助玩家",
                Content = "没有可帮助的玩家",
                Icon = "user-x",
                Duration = 1,
            })
        end
    end
})

Tabs.ESPTab:Section({Title = "透视设置"})
Tabs.ESPTab:Toggle({
    Title = "透视躲藏者",
    Image = "bird",
    Value = false,
    Callback = function(state)
        if state then
            for _,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v:GetAttribute("IsHider") then
                    ESP.AddESP("HiderESPFolder", "躲藏者" .. v.Name, v.Character, Color3.new(0,0,1))
                end
            end
        else
            ESP.Clear("HiderESPFolder")
        end
    end
})

Tabs.ESPTab:Toggle({
    Title = "透视搜查者",
    Image = "bird",
    Value = false,
    Callback = function(state)
        if state then
            for _,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v:GetAttribute("IsHunter") then
                    ESP.AddESP("HunterESPFolder", "搜查者" .. v.Name, v.Character, Color3.new(1,0,0))
                end
            end
        else
            ESP.Clear("HunterESPFolder")
        end
    end
})

Tabs.MovementTab:Toggle({
    Title = "无限跳跃",
    Callback = function(state)
        isInfiniteJumpEnabled = state
    end
})

Tabs.MovementTab:Toggle({
    Title = "穿墙模式",
    Callback = function(state)
        isNoclipEnabled = state
        if not state then
            for part, _ in pairs(noclipParts) do
                if part and part.Parent then
                    part.CanCollide = true
                end
            end
            noclipParts = {}
        end
    end
})

local lastJumpTime = 0
UserInputService.JumpRequest:Connect(function()
    if isInfiniteJumpEnabled and tick() - lastJumpTime > 0.1 then
        lastJumpTime = tick()
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

local lastNoclipCheck = 0
RunService.Stepped:Connect(function()
    if isNoclipEnabled and LocalPlayer.Character then
        if tick() - lastNoclipCheck > 0.1 then
            lastNoclipCheck = tick()
            for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    if part.CanCollide then
                        noclipParts[part] = true
                        part.CanCollide = false
                    end
                end
            end
        end
    end
end)

local isAimbotEnabled = false
local isEspEnabled = false
local aimbotLerpFactor = 0.1
local espCache = {}
local lastEspUpdate = 0

Tabs.CombatTab:Section({Title = "战斗设置"})
Tabs.CombatTab:Toggle({
    Title = "自瞄 (Rebel)",
    Callback = function(state)
        isAimbotEnabled = state
    end
})

Tabs.CombatTab:Toggle({
    Title = "ESP透视 (Rebel)",
    Callback = function(state)
        isEspEnabled = state
        if not isEspEnabled then
            for _, esp in pairs(espCache) do
                if esp and esp.Parent then
                    esp:Destroy()
                end
            end
            espCache = {}
        end
    end
})

local lastCombatUpdate = 0
RunService.RenderStepped:Connect(function()
    local now = tick()
    if now - lastCombatUpdate < updateInterval then return end
    lastCombatUpdate = now
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local rootPart = character.HumanoidRootPart
    local nearestTarget = nil
    local nearestDistance = math.huge

    if now - lastEspUpdate > 0.5 then
        lastEspUpdate = now
        if isEspEnabled then
            for _, model in ipairs(workspace:GetDescendants()) do
                if model:IsA("Model") and not model:IsDescendantOf(Players) and not model:IsDescendantOf(character) then
                    local modelName = model.Name:lower()
                    if modelName:find("guard") or modelName:find("guy") or modelName:find("squid") then
                        local part = model:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local distance = (part.Position - rootPart.Position).Magnitude
                            if distance < nearestDistance then
                                nearestTarget = model
                                nearestDistance = distance
                            end
                            
                            if not espCache[part] then
                                local espBox = Instance.new("BoxHandleAdornment")
                                espBox.Name = "ESP"
                                espBox.Adornee = part
                                espBox.Size = part.Size
                                espBox.Color3 = Color3.fromRGB(255, 0, 0)
                                espBox.AlwaysOnTop = true
                                espBox.ZIndex = 10
                                espBox.Transparency = 0.25
                                espBox.AdornCullingMode = Enum.AdornCullingMode.Never
                                espBox.Parent = part
                                espCache[part] = espBox
                            end
                        end
                    end
                end
            end
        end
    end

    if isAimbotEnabled and nearestTarget then
        local targetPart = nearestTarget:FindFirstChild("Head") or nearestTarget:FindFirstChild("Torso")
        if targetPart then
            local cameraPos = workspace.CurrentCamera.CFrame.Position
            local targetDir = (targetPart.Position - cameraPos).Unit
            local currentCFrame = workspace.CurrentCamera.CFrame
            local newCFrame = currentCFrame:Lerp(CFrame.new(cameraPos, targetPart.Position), aimbotLerpFactor)
            workspace.CurrentCamera.CFrame = newCFrame
        end
    end
end)

local isRedLightGodMode = false
local lastRootPartCFrame = nil
local isGreenLight = false

Tabs.GameTab:Section({Title = "红绿灯模式"})
Tabs.GameTab:Toggle({
    Title = "红绿灯无敌模式",
    Callback = function(state)
        isRedLightGodMode = state
    end
})

Tabs.GameTab:Section({Title = "玻璃桥"})
Tabs.GameTab:Toggle({
    Title = "玻璃桥ESP",
    Callback = function(state)
        pcall(function()
            local GlassHolder = workspace.GlassBridge.GlassHolder
            for _, PanelPair in ipairs(GlassHolder:GetChildren()) do
                for _, Panel in ipairs(PanelPair:GetChildren()) do
                    local GlassPart = Panel:FindFirstChild("glasspart")
                    if GlassPart then
                        if state then
                            local Color = GlassPart:GetAttribute("exploitingisevil") and Color3.fromRGB(248, 87, 87) or Color3.fromRGB(28, 235, 87)
                            GlassPart.Color = Color
                            GlassPart.Transparency = 0
                            GlassPart.Material = Enum.Material.Neon
                        else
                            GlassPart.Color = Color3.fromRGB(106, 106, 106)
                            GlassPart.Transparency = 0.45
                            GlassPart.Material = Enum.Material.SmoothPlastic
                        end
                    end
                end
            end
        end)
    end
})

Tabs.GameTab:Section({Title = "糖饼挑战"})
Tabs.GameTab:Toggle({
    Title = "自动完成糖饼",
    Callback = function(state)
        if state then
            pcall(function()
                local DalgonaClientModule = game.ReplicatedStorage.Modules.Games.DalgonaClient
                for _, Value in ipairs(getreg()) do
                    if typeof(Value) == "function" and islclosure(Value) then
                        if getfenv(Value).script == DalgonaClientModule then
                            if getinfo(Value).nups == 73 then
                                setupvalue(Value, 31, 9e9)
                                break
                            end
                        end
                    end
                end
            end)
        end
    end
})

Tabs.GameTab:Section({Title = "拔河游戏"})
Tabs.GameTab:Toggle({
    Title = "自动拔河",
    Callback = function(state)
        if state then
            pcall(function()
                local TemporaryReachedBindableRemote = ReplicatedStorage.Remotes.TemporaryReachedBindable
                local VALID_PULL_DATA = {["PerfectQTE"] = true}
                while task.wait(0.025) and state do
                    TemporaryReachedBindableRemote:FireServer(VALID_PULL_DATA)
                end
            end)
        end
    end
})

Tabs.GameTab:Section({Title = "社交游戏"})
Tabs.GameTab:Toggle({
    Title = "自动完成社交游戏",
    Callback = function(state)
        if state then
            pcall(function()
                local function OnCharacterAdded(Character)
                    local function OnChildAdded(Object)
                        if Object.ClassName == "RemoteEvent" and Object.Name == "RemoteForQTE" then
                            while task.wait(0.5) and state do
                                if not Object or not Object.Parent then break end
                                pcall(function() Object:FireServer() end)
                            end
                        end
                    end
                    
                    Character.ChildAdded:Connect(OnChildAdded)
                    for _, Object in ipairs(Character:GetChildren()) do
                        task.spawn(OnChildAdded, Object)
                    end
                end
                
                LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)
                if LocalPlayer.Character then
                    task.spawn(OnCharacterAdded, LocalPlayer.Character)
                end
            end)
        end
    end
})

local originalNamecall
if getrawmetatable then
    originalNamecall = hookfunction(getrawmetatable(game).__namecall, newcclosure(function(Instance, ...)
        local Args = {...}

        if getnamecallmethod() == "FireServer" and Instance.ClassName == "RemoteEvent" and Instance.Name == "rootCFrame" then
            if isRedLightGodMode and not isGreenLight and lastRootPartCFrame then
                Args[1] = lastRootPartCFrame
                return originalNamecall(Instance, unpack(Args))
            end
        end

        return originalNamecall(Instance, ...)
    end))
end

pcall(function()
    local TrafficLightImage = LocalPlayer.PlayerGui:WaitForChild("ImpactFrames"):WaitForChild("TrafficLightEmpty")
    isGreenLight = TrafficLightImage.Image == ReplicatedStorage.Effects.Images.TrafficLights.GreenLight.Image

    local RootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    lastRootPartCFrame = RootPart and RootPart.CFrame

    ReplicatedStorage.Remotes.Effects.OnClientEvent:Connect(function(EffectsData)
        if EffectsData.EffectName == "TrafficLight" then
            isGreenLight = EffectsData.GreenLight == true
            local RootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            lastRootPartCFrame = RootPart and RootPart.CFrame
        end
    end)
end)

local function cleanup()
    if originalNamecall and hookfunction then
        pcall(function()
            hookfunction(getrawmetatable(game).__namecall, originalNamecall)
        end)
    end
    
    for part, _ in pairs(noclipParts) do
        if part and part.Parent then
            part.CanCollide = true
        end
    end
    
    for _, esp in pairs(espCache) do
        if esp and esp.Parent then
            esp:Destroy()
        end
    end
    
    ESP.Clear("HiderESPFolder")
    ESP.Clear("HunterESPFolder")
    ESP.Clear("GlassESPFolder")
    
    pcall(function()
        local GlassHolder = workspace.GlassBridge.GlassHolder
        for _, PanelPair in ipairs(GlassHolder:GetChildren()) do
            for _, Panel in ipairs(PanelPair:GetChildren()) do
                local GlassPart = Panel:FindFirstChild("glasspart")
                if GlassPart then
                    GlassPart.Color = Color3.fromRGB(106, 106, 106)
                    GlassPart.Transparency = 0.45
                    GlassPart.Material = Enum.Material.SmoothPlastic
                end
            end
        end
    end)
end

if game.BindToClose then
    pcall(function()
        game:BindToClose(cleanup)
    end)
end