package app.syncpatches.patches.exit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.syncpatches.patches.shared.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val SETTINGS_CLASS = "Lcom/laurencedawson/reddit_sync/singleton/SettingsSingleton\$Settings;"
private const val EXIT_CONFIRMATION_FIELD = "Lcom/laurencedawson/reddit_sync/singleton/SettingsSingleton\$Settings;->exitConfirmation:Z"

/**
 * The MainActivity method that handles BACK key presses and gestures. Contains
 * the drawer-close handling and the "Press BACK again to exit" double press
 * exit confirmation.
 */
object MainKeyUpFingerprint : Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/activities/MainActivity;",
    name = "onKeyUp",
    parameters = listOf(
        "I",
        "Landroid/view/KeyEvent;",
    ),
    returnType = "Z",
    strings = listOf("Press BACK again to exit"),
)

/**
 * Makes Sync exit on the first BACK press / swipe instead of requiring a
 * second one to confirm.
 *
 * `MainActivity.onKeyUp` reads the `exitConfirmation` setting (preference key
 * "exit_preference"); there is no UI for it, it always defaults to true, and
 * while it is on the first BACK press only shows a "Press BACK again to exit"
 * toast and sets a one second window (`c0`) for the second press to finish()
 * the app.
 *
 * Replacing the `iget-boolean` that reads the setting with `const/4 0x0` makes
 * the handler always take the code path that calls `finish()` immediately -
 * exactly what stock does when the (unreachable) preference is off. The
 * drawer-close-on-back behavior before it is untouched, and the now dead
 * `c0` flag and its 1 second reset runnable simply never execute.
 */

@Suppress("unused")
val exitOnSingleBackPatch = bytecodePatch(
    name = "Exit on single back press",
    description = "Makes the app exit on the first back press.",
    default = true,
) {
    compatibleWith(
        Constants.SYNC_FREE,
        Constants.SYNC_PRO,
        Constants.SYNC_DEV,
    )

    execute {
        val method = MainKeyUpFingerprint.method
        val implementation = method.implementation!!

        // Replace the `iget-boolean ..., exitConfirmation:Z` read in the
        // back-press handler with `const/4 <same register>, 0x0` so the
        // immediate-finish branch is always taken.
        var count = 0
        for (index in implementation.instructions.indices) {
            val instruction = implementation.instructions[index]

            if (instruction.opcode != Opcode.IGET_BOOLEAN) continue

            val reference = (instruction as ReferenceInstruction).reference as FieldReference
            if (reference.definingClass != SETTINGS_CLASS || reference.name != "exitConfirmation") continue

            val register = (instruction as TwoRegisterInstruction).registerA
            method.replaceInstruction(index, "const/4 v$register, 0x0")
            count++
        }

        if (count != 1) {
            throw PatchException(
                "Expected 1 exitConfirmation read in Lcom/laurencedawson/reddit_sync/ui/activities/MainActivity;->onKeyUp but found $count"
            )
        }
    }
}
