package app.morphe.patches.instants

import app.morphe.patcher.patch.bytecodePatch

/**
 * The single selectable Instants patch. The three parts are unnamed (not loadable on their
 * own) and are pulled in as dependencies:
 *  - [instantsGalleryPatch]: gallery button that posts a picked image through the camera pipeline.
 *  - [instantsModMarkPatch]: "Mod by Wagg13 - Morphed" row on the About screen (Telegram link).
 *  - [instantsWordmarkPatch]: "WInstants" header logo.
 */
@Suppress("unused")
val instantsModPatch = bytecodePatch(
    name = "Instants Mod",
    description = "Support for posting photos from the gallery to Instants via the gallery icon on the home screen.",
) {
    compatibleWith(INSTANTS_COMPATIBILITY)

    dependsOn(
        instantsGalleryPatch,
        instantsModMarkPatch,
        instantsWordmarkPatch,
    )
}
