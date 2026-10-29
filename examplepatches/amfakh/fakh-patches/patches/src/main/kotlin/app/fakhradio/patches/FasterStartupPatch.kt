package app.fakhradio.patches

import app.fakhradio.patches.shared.Constants.COMPATIBILITY_RADIO_ID
import app.fakhradio.patches.shared.references
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val LONG_MAX = "Ljava/lang/Long;->max(JJ)J"

/**
 * The splash presenter's `l()`, which reads `MAX_TIME_SPLASH` from remote config.
 * Only used to find the presenter class, whose other names R8 renamed.
 */
private val maxSplashTimeFingerprint = Fingerprint(
    returnType = "J",
    parameters = listOf(),
    strings = listOf("MAX_TIME_SPLASH"),
)

@Suppress("unused")
val fasterStartupPatch = bytecodePatch(
    name = "Faster startup",
    description = "Stops the splash screen from waiting up to 5 seconds on the Firebase Remote Config fetch. The fetch still finishes in the background.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RADIO_ID)
    category("Feature")

    execute {
        // The presenter's o() runs the remote config fetch under
        // withTimeoutOrNull(Long.max(5000, l())) and the splash waits for it,
        // even though only a success listener ends the wait early. A 1 ms
        // timeout still runs the block up to its first suspension (set the
        // defaults, start fetchAndActivate), then lets the splash move on.
        val presenter = maxSplashTimeFingerprint.match().classDef
        val fetch = presenter.methods.singleOrNull { it.references(LONG_MAX) }
            ?: throw PatchException("Splash presenter has no single remote config fetch method")
        val maxIndex = fetch.instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference?.toString() == LONG_MAX
        }
        val timeoutRegister = (fetch.instructions[maxIndex + 1] as OneRegisterInstruction).registerA

        fetch.replaceInstruction(maxIndex + 1, "const-wide/16 v$timeoutRegister, 0x1")
    }
}
