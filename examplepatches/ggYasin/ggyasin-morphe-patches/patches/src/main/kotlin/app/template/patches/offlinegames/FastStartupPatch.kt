package app.template.patches.offlinegames

import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val fastOfflineGamesStartupPatch = rawResourcePatch(
    name = "Fast Offline Games startup",
    description = "Stops the loading screen waiting for Firebase/Remote Config and country " +
        "lookup, and initializes ads in the background. Network requests may continue after startup.",
    default = false,
) {
    compatibleWith(OFFLINE_GAMES_COMPATIBILITY)
    dependsOn(offlineGamesNativeLoaderPatch)

    execute {
        patchOfflineGamesLibrary(startupEdits)
    }
}
