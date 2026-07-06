package app.paresh.patches.jiohotstar.screenshot

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

// ABConfig.getUseSecureView() — stable non-obfuscated class
object UseSecureViewFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/player/models/config/ABConfig;",
    name = "getUseSecureView",
    returnType = "Z"
)

// Compose FLAG_SECURE — adds FLAG_SECURE (0x2000) to Activity window
object ComposeFlagSecureFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("null cannot be cast to non-null type android.app.Activity"),
        methodCall(definingClass = "Landroid/app/Activity;", name = "getWindow"),
        literal(0x2000),
        methodCall(definingClass = "Landroid/view/Window;", name = "addFlags")
    )
)
