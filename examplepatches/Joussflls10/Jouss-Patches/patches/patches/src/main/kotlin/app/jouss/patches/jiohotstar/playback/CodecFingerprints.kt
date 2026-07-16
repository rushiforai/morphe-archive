package app.jouss.patches.jiohotstar.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// 4K resolution support check — checks "4k" blacklist and 3840x2160
object Is4kSupportedFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("4k"),
    )
)

// Video codec support check (h265, vp9, etc.)
object IsCodecSupportedFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(
        string("supportsCodec Picked from cache")
    )
)
