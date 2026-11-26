package deezer.patches

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.patch

private fun featurePatch(name: String, description: String, vararg components: Patch) =
    patch(name = name, description = description) {
        compatibleWith(deezerCompatibility)
        dependsOn(appBasePatch, *components)
    }

@Suppress("unused")
val onDemandPlaybackPatch = featurePatch(
    "Choose tracks on demand",
    "Select tracks in search, albums, playlists, artist pages, profiles, and Deezer recommendations. Restore the last queue and keep the current track playing when starting its mix.",
    collectionTrackSelectionPatch,
    artistTrackSelectionPatch,
    profileTrackSelectionPatch,
    libraryFavoriteTrackSelectionPatch,
    recentlyPlayedPatch,
    searchTrackSelectionPatch,
    playbackRestorePatch,
    mixContinuityPatch,
    smartTrackListSelectionPatch,
    collectionButtonsPatch,
)

@Suppress("unused")
val playerNavigationPatch = featurePatch(
    "Enable player navigation",
    "Enables unlimited track skips, previous and next controls, and seeking within a track.",
    unlimitedSkipsPatch,
    seekPatch,
)

@Suppress("unused")
val playbackQueuePatch = featurePatch(
    "Manage the playback queue",
    "Opens the queue and adds Add to queue and Play Next to supported menus.",
    queuePatch,
    playNextPatch,
)

@Suppress("unused")
val playlistToolsPatch = featurePatch(
    "Search and sort playlists",
    "Adds the native search shortcut to playlist headers and Sort to playlist menus.",
    playlistSearchPatch,
    playlistSortPatch,
)

@Suppress("unused")
val blockAdsPatch = featurePatch(
    "Block ads",
    "Hides banner and native ads and skips visual pre-rolls and audio ad breaks.",
    displayAdsPatch,
    preRollAdsPatch,
    audioAdsPatch,
)

@Suppress("unused")
val hidePremiumOffersPatch = featurePatch(
    "Hide Premium offers",
    "Hides offer pop-ups, the Premium tab, upgrade buttons, and audio quality upgrade prompts.",
    studentOfferPatch,
    premiumTabPatch,
    downloadedMusicOfferPatch,
    audioQualityOffersPatch,
    startupOffersPatch,
)
