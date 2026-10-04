package app.threadripper.patches.youtube.stall

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * shouldStartPlayback(LoadControl.Parameters) of the app's media3 LoadControl
 * (`alkg.g(cus)` in 21.16.256). It logs its decisions with the "ssp." prefix.
 */
internal object ShouldStartPlaybackFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        string("ssp."),
    ),
)
