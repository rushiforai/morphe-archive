package app.threadripper.patches.youtube.preload

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * shouldContinueLoading(LoadControl.Parameters) of the app's media3 LoadControl
 * (`alkg.f(cus)` in 21.16.256). It ends with `this.<lastDecision> = decision; return decision`,
 * and logs its decisions with the "scl." prefix.
 */
internal object ShouldContinueLoadingFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        string("scl."),
    ),
)
