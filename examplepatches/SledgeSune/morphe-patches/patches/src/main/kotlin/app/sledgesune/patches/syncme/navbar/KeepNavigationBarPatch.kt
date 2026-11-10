package app.sledgesune.patches.syncme.navbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_SYNCME

/**
 * `AggressiveManager.apply(Activity)` (obfuscated, e.g. `Lzr;->a(Landroid/app/Activity;)V`).
 * Hides the system navigation bar on screens such as the missed-call reminder.
 */
internal object AggressiveModeFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("is_enable_aggressive_mode_for_premium"),
    )
)

@Suppress("unused")
val keepNavigationBarPatch = patch(
    name = "Keep navigation bar",
    description = "Stops \"aggressive mode\" from hiding the phone's navigation bar.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SYNCME)

    execute {
        AggressiveModeFingerprint.method.addInstruction(0, "return-void")
    }
}
