/*
 * Meta Patches — main Instagram: Instants camera activity hook.
 *
 * Applies the Instants Mod gallery-upload mechanism (ported from
 * Wagg13Patch_Morphe (https://github.com/WaggBR/Wagg13Patch_Morphe) by
 * Wagg13, GPL-3) to the main Instagram app.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.instantsupload

import app.hemk651.patches.shared.MetaCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/**
 * Records the current activity for the extension (used for the gallery button
 * and the picker). The main activity hosts the Instants camera and declares no
 * onCreate of its own, so the base activity of Instagram's fragment activities
 * is hooked instead: it runs for the main activity and re-records the current
 * one whenever another fragment activity opens.
 * Unnamed: only loaded through [uploadInstantsFromGalleryPatch].
 */
internal val instantsUploadActivityPatch = patch {
    compatibleWith(MetaCompatibilities.INSTAGRAM)
    extendWith("extensions/extension.mpe")

    execute {
        InstagramActivityFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range {p0 .. p0}, $GALLERY_HELPER->setActivity(Landroid/app/Activity;)V
            """.trimIndent(),
        )
    }
}
