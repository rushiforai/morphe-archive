package app.morphe.patches.vix.interaction

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal object FlagSecureWindowFingerprint : Fingerprint(
    filters = listOf(
        literal(0x2000),
        methodCall(definingClass = "Landroid/view/Window;", name = "setFlags"),
    ),
)

internal object LuraVideoViewSetSecureFingerprint : Fingerprint(
    definingClass = "Lcom/akta/luraplayer/ui/LuraVideoView;",
    name = "setSecure\$LuraPlayer",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(definingClass = "Landroid/view/SurfaceView;", name = "setSecure"),
    ),
)

internal object LuraPlayerViewSetSecureFingerprint : Fingerprint(
    definingClass = "Lcom/akta/luraplayer/api/ui/LuraPlayerView;",
    name = "setSecure\$LuraPlayer",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(definingClass = "Lcom/akta/luraplayer/ui/LuraVideoView;", name = "setSecure\$LuraPlayer"),
    ),
)
