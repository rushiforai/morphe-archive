/*
 * Meta Patches — Remove snooze warning.
 *
 * Ported from InstaFL patcher-core "Remove Snooze Warning"
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut),
 * reworked for the Morphe patcher.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.meta

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.hemk651.patches.shared.MetaCompatibilities
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

@Suppress("unused")
val removeSnoozeWarningPatch = patch(
    name = "Remove snooze warning",
    description = "Removes the \"build expired\" snooze warning dialog that alpha builds show.",
    default = true
) {
    compatibleWith(MetaCompatibilities.INSTAGRAM)

    execute {
        // The lockout duration is calculated as "days since the build release",
        // converted to int right before the dogfooding eligibility controller is
        // constructed. Overriding the converted value with 0 makes the app treat
        // the build as freshly released, so the snooze dialog never appears.
        //
        // Original InstaFL patch replaces the "long-to-int vX, vY" instruction
        // with "const/4 vX, 0x0".
        DogfoodingLockoutFingerprint.let {
            val longToIntMatch = it.instructionMatches.last()
            val register = longToIntMatch
                .getInstruction<TwoRegisterInstruction>()
                .registerA

            // const/4 can only address registers v0-v15; use const for any wider
            // register so the patch stays valid on future builds.
            val replacement = if (register < 16) {
                "const/4 v$register, 0x0"
            } else {
                "const v$register, 0x0"
            }

            it.method.replaceInstruction(longToIntMatch.index, replacement)
        }
    }
}
