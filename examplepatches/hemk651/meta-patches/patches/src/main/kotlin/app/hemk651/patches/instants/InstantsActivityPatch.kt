/*
 * Meta Patches — Instagram Instants: activity hook.
 *
 * Ported from Wagg13Patch_Morphe (https://github.com/WaggBR/Wagg13Patch_Morphe)
 * by Wagg13, licensed under the GNU General Public License version 3.
 * Rebranded for Meta Patches (extension package app.hemk651.meta.extension).
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.instants

import app.hemk651.patches.shared.MetaCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/**
 * Records the main activity for the extension (used for starting activities and for toasts).
 * Unnamed: only loaded through [instantsModPatch].
 */
internal val instantsActivityPatch = patch {
    compatibleWith(MetaCompatibilities.INSTANTS)
    extendWith("extensions/extension.mpe")

    execute {
        MoonshotOnCreateFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range {p0 .. p0}, $GALLERY_HELPER->setActivity(Landroid/app/Activity;)V
            """.trimIndent(),
        )
    }
}
