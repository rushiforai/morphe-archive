package app.morphe.patches.instants

import app.morphe.patcher.patch.bytecodePatch

/**
 * The single selectable Instants patch. The parts are unnamed (not loadable on their
 * own) and are pulled in as dependencies:
 *  - [instantsActivityPatch]: records the main activity for the extension.
 *  - [instantsGalleryPatch]: gallery button that posts a picked photo or short video through the camera pipeline.
 *  - [instantsIconPatch]: replaces launcher icon with custom "W" variant.
 *  - [instantsModMarkPatch]: "Mod by Wagg13 - Morphed" row on the About screen (Telegram link).
 *  - [instantsWordmarkPatch]: "WInstants" header logo.
 *  - [instantsSaveImagePatch]: "Save to gallery" row (photos and videos) in the friends' Instant overflow menu.
 */
@Suppress("unused")
val instantsModPatch = bytecodePatch(
    name = "Instants Mod",
    description = "Adds a gallery button to post photos and videos, and allows saving friends' Instants to your device.",
) {
    compatibleWith(INSTANTS_COMPATIBILITY)

    dependsOn(
        instantsActivityPatch,
        instantsGalleryPatch,
        instantsModMarkPatch,
        instantsWordmarkPatch,
        instantsSaveImagePatch,
        instantsIconPatch,
    )
}
