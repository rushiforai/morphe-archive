package app.paresh.patches.jiohotstar.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Dolby Vision support check — unique "dv" string identifies the MediaCodecUtils class
// HDR10 and HDR10+ methods are in the same class with same signature
object IsDolbyVisionSupportedFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;", "Z", "I", "Z"),
    filters = listOf(
        string("dv"),
        string("bklst"),
    )
)
