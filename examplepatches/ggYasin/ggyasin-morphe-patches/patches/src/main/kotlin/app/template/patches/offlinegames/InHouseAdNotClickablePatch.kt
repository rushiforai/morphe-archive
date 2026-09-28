package app.template.patches.offlinegames

import app.morphe.patcher.patch.rawResourcePatch

/** Disables HouseAdPopupView.OpenStorePage, preserving ClosePressed and its reward callback. */
@Suppress("unused")
val inHouseAdNotClickablePatch = rawResourcePatch(
    name = "In-house ad not clickable",
    description = "Stops the in-house ad from opening the Play Store when tapped, so " +
        "an accidental click does not leave the game. The ad and its close button " +
        "are otherwise unchanged.",
    default = false,
) {
    compatibleWith(OFFLINE_GAMES_COMPATIBILITY)
    dependsOn(offlineGamesNativeLoaderPatch)

    execute {
        patchOfflineGamesLibrary(listOf(houseAdStoreRedirect))
    }
}
