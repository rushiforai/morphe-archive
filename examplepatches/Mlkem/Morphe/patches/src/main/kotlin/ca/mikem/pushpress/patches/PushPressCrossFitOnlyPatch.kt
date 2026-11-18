package ca.mikem.pushpress.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import ca.mikem.pushpress.patches.Constants.PUSH_PRESS_MEMBERS

private const val EXTENSION_CLASS =
    "Lca/mikem/pushpress/extension/CrossFitOnly;"

/**
 * Forces the API-provided "CrossFit class" item whenever the Class type dropdown is opened
 * on the PushPress Workouts screen. The API response itself is not modified.
 */
@Suppress("unused")
val pushPressCrossFitOnlyPatch = bytecodePatch(
    name = "Workouts: force CrossFit class",
    description = "On the Workouts page, automatically selects CrossFit class from the Class type dropdown.",
    default = true
) {
    compatibleWith(PUSH_PRESS_MEMBERS)
    extendWith("extensions/pushpress-crossfit-only.mpe")

    execute {
        MainActivityConstructorFingerprint.let { fingerprint ->
            val returnIndex = fingerprint.instructionMatches[0].index
            fingerprint.method.addInstructions(
                returnIndex,
                """
                invoke-static {p0}, $EXTENSION_CLASS->install(Landroid/app/Activity;)V
                """
            )
        }
    }
}
