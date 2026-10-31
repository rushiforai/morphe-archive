package app.aapam.patches.coloringlearn.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.aapam.patches.coloringlearn.shared.Constants
import app.aapam.patches.coloringlearn.shared.CoronaRuntimeWillLoadMainFingerprint

@Suppress("unused")
val unlockAdFreePatch = bytecodePatch(
    name = "Unlock ad-free",
    description = "Hooks CoronaRuntime.onWillLoadMain() to execute a Lua bootstrap script that " +
        "stubs in-app purchases (Tienda.ProductoComprado returning 'S'), hides promo/ad UI buttons, " +
        "and stubs libads.",
) {
    compatibleWith(Constants.COMPATIBILITY_COLORING_LEARN)

    execute {
        val luaScript = """
print('[AAPAM_LOG] Lua bootstrap running')

local function patchTienda(mod)
    if type(mod) == 'table' then
        mod.ProductoComprado = function(...)
            print('[AAPAM_LOG] ProductoComprado returning S')
            return 'S'
        end
    end
    return mod
end

local function patchLibads(mod)
    if type(mod) == 'table' then
        mod.ShowRope = function(...)
            print('[AAPAM_LOG] libads.ShowRope stubbed')
            return false
        end
        mod.ShowAds = function(...)
            print('[AAPAM_LOG] libads.ShowAds stubbed')
            return false
        end
    end
    return mod
end

local default_tienda = patchTienda({})

local cur_mt = getmetatable(_G)
local orig_index = cur_mt and cur_mt.__index
local orig_newindex = cur_mt and cur_mt.__newindex
local new_mt = cur_mt or {}

new_mt.__index = function(t, k)
    if k == 'Tienda' or k == 'tienda' then
        return default_tienda
    end
    if type(orig_index) == 'function' then
        return orig_index(t, k)
    elseif type(orig_index) == 'table' then
        return orig_index[k]
    end
    return nil
end

new_mt.__newindex = function(t, k, v)
    if k == 'Tienda' or k == 'tienda' then
        patchTienda(v)
    end
    if type(orig_newindex) == 'function' then
        orig_newindex(t, k, v)
    elseif type(orig_newindex) == 'table' then
        orig_newindex[k] = v
    else
        rawset(t, k, v)
    end
end

setmetatable(_G, new_mt)

if _G.Tienda then patchTienda(_G.Tienda) end
if _G.tienda then patchTienda(_G.tienda) end

local orig_require = require
_G.require = function(modname)
    local ok, res = pcall(orig_require, modname)
    local lower = type(modname) == 'string' and string.lower(modname) or ''
    if lower == 'tienda' then
        if not ok or type(res) ~= 'table' then
            res = {}
        end
        patchTienda(res)
        if package and type(package.loaded) == 'table' then
            package.loaded[modname] = res
        end
        return res
    elseif lower == 'libads' then
        if not ok or type(res) ~= 'table' then
            res = {}
        end
        patchLibads(res)
        if package and type(package.loaded) == 'table' then
            package.loaded[modname] = res
        end
        return res
    end
    if ok then
        return res
    else
        error(res)
    end
end

local function checkFilename(...)
    local n = select('#', ...)
    for i = 1, math.min(n, 3) do
        local a = select(i, ...)
        if type(a) == 'string' then
            local lower = string.lower(a)
            if string.find(lower, 'btn_rope', 1, true) or
               string.find(lower, 'more_games', 1, true) or
               string.find(lower, 'btn_download', 1, true) or
               string.find(lower, 'remove_ads', 1, true) then
                return true, a
            end
        end
    end
    return false, nil
end

if display then
    local orig_newImage = display.newImage
    if orig_newImage then
        display.newImage = function(...)
            local matched, name = checkFilename(...)
            if matched then
                print('[AAPAM_LOG] display.newImage blocked: ' .. tostring(name))
                local g = display.newGroup()
                g.isVisible = false
                return g
            end
            return orig_newImage(...)
        end
    end

    local orig_newImageRect = display.newImageRect
    if orig_newImageRect then
        display.newImageRect = function(...)
            local matched, name = checkFilename(...)
            if matched then
                print('[AAPAM_LOG] display.newImageRect blocked: ' .. tostring(name))
                local g = display.newGroup()
                g.isVisible = false
                return g
            end
            return orig_newImageRect(...)
        end
    end
end
""".trimIndent()

        val escapedLua = luaScript
            .replace("\\", "\\\\")
            .replace("\"", "\\\"")
            .replace("\r\n", "\n")
            .replace("\n", "\\n")

        CoronaRuntimeWillLoadMainFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "[AAPAM_LOG]"
                const-string v1, "CoronaRuntime.onWillLoadMain() reached"
                invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

                iget-object v0, p0, Lcom/ansca/corona/CoronaRuntime;->fLuaState:Lcom/naef/jnlua/LuaState;
                if-eqz v0, :cond_skip_bootstrap

                const-string v1, "$escapedLua"
                invoke-virtual {v0, v1, v1}, Lcom/naef/jnlua/LuaState;->load(Ljava/lang/String;Ljava/lang/String;)V
                const/4 v1, 0x0
                invoke-virtual {v0, v1, v1}, Lcom/naef/jnlua/LuaState;->call(II)V

                :cond_skip_bootstrap
            """,
        )
    }
}
