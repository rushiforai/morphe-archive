/*
 * Meta Patches — shared constants of the Instagram Instants upload patch.
 *
 * The gallery-upload mechanism is the one of the Instants Mod for
 * Instagram Instants (ported from Wagg13Patch_Morphe
 * (https://github.com/WaggBR/Wagg13Patch_Morphe) by Wagg13, GPL-3); this
 * patch applies it to the main Instagram app, which shares the Instants
 * camera code but has no trace strings left in it, so the fingerprints are
 * structural (see Fingerprints.kt).
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.instantsupload

/**
 * The native bridge class of the gallery upload, merged with the app through
 * the shared extension (`extensions/extension.mpe`). The same helpers serve
 * the Instants app and the main app.
 */
internal const val GALLERY_HELPER =
    "Lapp/hemk651/meta/extension/instants/InstantsGalleryHelper;"

/** The camera's view model, kept unobfuscated in both apps. */
internal const val CAMERA_VIEW_MODEL =
    "Lcom/instagram/quicksnap/camera/domain/QuickSnapCameraViewModel;"
