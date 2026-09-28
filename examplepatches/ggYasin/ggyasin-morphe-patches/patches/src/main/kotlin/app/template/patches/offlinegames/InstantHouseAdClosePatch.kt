package app.template.patches.offlinegames

import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val instantHouseAdClosePatch = rawResourcePatch(
    name = "Instant in-house ad close",
    description = "Shows the house-ad close button on opening, hides the countdown, " +
        "and initializes its counter as complete. Loads patched native code for mounted installs.",
    default = false,
) {
    compatibleWith(OFFLINE_GAMES_COMPATIBILITY)
    dependsOn(offlineGamesNativeLoaderPatch)

    execute {
        patchOfflineGamesLibrary(listOf(houseAdShowClose, houseAdHideCounter, houseAdCounter))
    }
}
