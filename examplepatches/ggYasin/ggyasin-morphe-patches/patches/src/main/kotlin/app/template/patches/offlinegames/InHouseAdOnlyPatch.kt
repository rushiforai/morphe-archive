package app.template.patches.offlinegames

import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val inHouseAdOnlyPatch = rawResourcePatch(
    name = "In-house ad only",
    description = "Stops Offline Games from requesting rewarded ads, so the game always " +
        "falls back to its own in-house ad. Banners and interstitials are untouched.",
    default = false,
) {
    compatibleWith(OFFLINE_GAMES_COMPATIBILITY)
    dependsOn(offlineGamesNativeLoaderPatch)

    execute {
        patchOfflineGamesLibrary(listOf(rewardedAdFallback, rewardedAdDownload))
    }
}
