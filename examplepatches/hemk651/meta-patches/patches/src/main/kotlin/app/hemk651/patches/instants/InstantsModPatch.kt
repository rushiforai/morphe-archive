/*
 * Meta Patches — Instagram Instants: the selectable patch.
 *
 * Ported from Wagg13Patch_Morphe (https://github.com/WaggBR/Wagg13Patch_Morphe)
 * by Wagg13, licensed under the GNU General Public License version 3.
 * Name and description are kept as upstream. The upstream suite's branding
 * parts (the "WInstants" launcher icon, the wordmark and the "Mod by Wagg13"
 * About row) are not ported; only the functional parts are:
 *   - [instantsActivityPatch]: records the main activity for the extension.
 *   - [instantsGalleryPatch]: gallery button that posts a picked photo or
 *     short video through the camera pipeline.
 *   - [instantsSaveImagePatch]: "Save to gallery" row (photos and videos) in
 *     the friends' Instant overflow menu.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.instants

import app.hemk651.patches.shared.MetaCompatibilities
import app.morphe.patcher.patch.patch

/**
 * The selectable Instants patch: gallery posting and saving friends' Instants.
 * Requires Android 10+ for the save flow (MediaStore); the gallery posting
 * works below that.
 */
@Suppress("unused")
val instantsModPatch = patch(
    name = "Instants Mod",
    description = "Adds a gallery button to post photos and videos, and allows saving friends' Instants to your device.",
    default = false
) {
    compatibleWith(MetaCompatibilities.INSTANTS)

    dependsOn(
        instantsActivityPatch,
        instantsGalleryPatch,
        instantsSaveImagePatch,
    )
}
