package app.morphe.patches.instants

import app.morphe.patcher.patch.bytecodePatch

/**
 * The single selectable Instants patch. The parts are unnamed (not loadable on their
 * own) and are pulled in as dependencies:
 *  - [instantsActivityPatch]: records the main activity for the extension.
 *  - [instantsGalleryPatch]: gallery button that posts a picked photo or short video through the camera pipeline.
 *  - [instantsModMarkPatch]: "Mod by Wagg13 - Morphed" row on the About screen (Telegram link).
 *  - [instantsWordmarkPatch]: "WInstants" header logo.
 *  - [instantsIconPatch]: "W" launcher icon.
 *  - [instantsGoBackPatch]: "Go back" button that replays the last Instant that was passed.
 *  - [instantsSaveImagePatch]: "Save to gallery" row (photos and videos) in the friends' Instant overflow menu.
 */
@Suppress("unused")
val instantsModPatch = bytecodePatch(
    name = "Instants Mod",
    description = "Post photos and videos from your gallery (with a square crop editor), replay the last Instant you passed, and save your friends' Instants.",
) {
    compatibleWith(INSTANTS_COMPATIBILITY)

    dependsOn(
        instantsActivityPatch,
        instantsGalleryPatch,
        instantsModMarkPatch,
        instantsWordmarkPatch,
        instantsIconPatch,
        instantsSaveImagePatch,
        instantsGoBackPatch,
    )
}
