/*
 * Meta Patches — main Instagram: the selectable Instants upload patch.
 *
 * Applies the gallery-upload mechanism of the Instants Mod (ported from
 * Wagg13Patch_Morphe (https://github.com/WaggBR/Wagg13Patch_Morphe) by
 * Wagg13, GPL-3 like this project) to the main Instagram app: a gallery
 * button on the Instants camera that posts a picked photo or a short video
 * through the camera's own pipeline.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.instantsupload

import app.hemk651.patches.shared.MetaCompatibilities
import app.morphe.patcher.patch.patch

/**
 * Upload instants from the gallery: a gallery button on the Instants camera.
 * Requires the Instants camera of the main app (close-friends stories).
 */
@Suppress("unused")
val uploadInstantsFromGalleryPatch = patch(
    name = "Upload instants from gallary",
    description = "Adds a gallery button to the Instants camera to post photos and videos from your device's gallery.",
    default = false
) {
    compatibleWith(MetaCompatibilities.INSTAGRAM)

    dependsOn(
        instantsUploadActivityPatch,
        instantsUploadGalleryPatch,
    )
}
