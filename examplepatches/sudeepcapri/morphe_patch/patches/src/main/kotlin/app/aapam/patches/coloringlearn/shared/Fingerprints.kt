package app.aapam.patches.coloringlearn.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// Intercept admob.init() — prevents MobileAds SDK from initialising.
// All subsequent load/show calls check isSDKInitialized and return early.
internal object AdmobInitFingerprint : Fingerprint(
    definingClass = "Lplugin/admob/LuaLoader\$Init;",
    name = "invoke",
    returnType = "I",
    parameters = listOf("Lcom/naef/jnlua/LuaState;"),
    filters = listOf(
        string("admob.init(listener, options)"),
    ),
)

// Intercept admob.load() — prevents any ad from being requested or loaded.
internal object AdmobLoadFingerprint : Fingerprint(
    definingClass = "Lplugin/admob/LuaLoader\$Load;",
    name = "invoke",
    returnType = "I",
    parameters = listOf("Lcom/naef/jnlua/LuaState;"),
    filters = listOf(
        string("admob.load(adType, options)"),
    ),
)

// Intercept admob.show() — prevents any loaded ad from being displayed.
internal object AdmobShowFingerprint : Fingerprint(
    definingClass = "Lplugin/admob/LuaLoader\$Show;",
    name = "invoke",
    returnType = "I",
    parameters = listOf("Lcom/naef/jnlua/LuaState;"),
    filters = listOf(
        string("admob.show(adType [, options ])"),
    ),
)

// CoronaRuntime.onWillLoadMain()V — invoked right before main.lua is loaded
internal object CoronaRuntimeWillLoadMainFingerprint : Fingerprint(
    definingClass = "Lcom/ansca/corona/CoronaRuntime;",
    name = "onWillLoadMain",
    returnType = "V",
    parameters = emptyList(),
)

