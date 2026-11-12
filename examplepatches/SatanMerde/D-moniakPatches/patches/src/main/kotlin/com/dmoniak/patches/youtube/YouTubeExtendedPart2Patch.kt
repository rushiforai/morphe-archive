package com.dmoniak.patches.youtube

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

val youtubeHidePlayerOverlayButtons = bytecodePatch(
    name = "Hide player overlay buttons - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide the player Cast, Autoplay, Captions, Previous & Next buttons, and to hide or change the opacity of the player control buttons background.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide player overlay buttons - YouTube (Experimental) patch...")
    }
}

val youtubeHideRelatedVideoOverlay = bytecodePatch(
    name = "Hide related video overlay - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide the related video overlay shown when swiping up in fullscreen.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide related video overlay - YouTube (Experimental) patch...")
    }
}

val youtubeHideRelatedVideos = bytecodePatch(
    name = "Hide related videos - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide related videos.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide related videos - YouTube (Experimental) patch...")
    }
}

val youtubeHideStatusBar = bytecodePatch(
    name = "Hide status bar - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide the system status bar. Swipe down from the top edge to show it for a moment.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide status bar - YouTube (Experimental) patch...")
    }
}

val youtubeHideTimestamp = bytecodePatch(
    name = "Hide timestamp - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide the timestamp in the bottom left of the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide timestamp - YouTube (Experimental) patch...")
    }
}

val youtubeHideVideoActionButtons = bytecodePatch(
    name = "Hide video action buttons - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide video action buttons in fullscreen and portrait modes.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide video action buttons - YouTube (Experimental) patch...")
    }
}

val youtubeLoopVideo = bytecodePatch(
    name = "Loop video - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to loop videos and display loop video button in the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Loop video - YouTube (Experimental) patch...")
    }
}

val youtubeMediaNotificationControls = bytecodePatch(
    name = "Media notification controls - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to disable the seekbar and previous/next buttons in the media notification and headphone controls.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Media notification controls - YouTube (Experimental) patch...")
    }
}

val youtubeMiniplayer = bytecodePatch(
    name = "Miniplayer - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to change the in-app minimized player. Patching 21.28.206 and lower has more miniplayer types to choose from.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Miniplayer - YouTube (Experimental) patch...")
    }
}

val youtubeMuteButton = bytecodePatch(
    name = "Mute button - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to show a player button that mutes the video audio.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Mute button - YouTube (Experimental) patch...")
    }
}

val youtubeNavigationBar = bytecodePatch(
    name = "Navigation bar - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide and change the bottom navigation bar (such as the Shorts button) and the upper navigation toolbar.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Navigation bar - YouTube (Experimental) patch...")
    }
}

val youtubeNetworkProxy = bytecodePatch(
    name = "Network proxy - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds settings to route supported network requests through an HTTP or HTTPS proxy. Including this patch may cause connectivity problems on certain devices",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Network proxy - YouTube (Experimental) patch...")
    }
}

val youtubeOpenShortsInRegularPlayer = bytecodePatch(
    name = "Open Shorts in regular player - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to open Shorts in the regular video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Open Shorts in regular player - YouTube (Experimental) patch...")
    }
}

val youtubeOpenChannelOfLiveAvatar = bytecodePatch(
    name = "Open channel of live avatar - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to prevent a channel's current live video from opening when tapping its avatar.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Open channel of live avatar - YouTube (Experimental) patch...")
    }
}

val youtubeOpenLinksExternally = bytecodePatch(
    name = "Open links externally - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to always open links in your browser instead of with the in-app browser.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Open links externally - YouTube (Experimental) patch...")
    }
}

val youtubeOpenSystemShareSheet = bytecodePatch(
    name = "Open system share sheet - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to always open the system share sheet instead of the in-app share sheet.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Open system share sheet - YouTube (Experimental) patch...")
    }
}

val youtubeOpenVideosFullscreen = bytecodePatch(
    name = "Open videos fullscreen - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to automatically open videos in fullscreen portrait or landscape mode.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Open videos fullscreen - YouTube (Experimental) patch...")
    }
}

val youtubeOverrideYoutubeMusicButtons = bytecodePatch(
    name = "Override YouTube Music buttons - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Overrides YouTube Music buttons to open Morphe Music or any compatible third-party client.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Override YouTube Music buttons - YouTube (Experimental) patch...")
    }
}

val youtubePictureInPictureButton = bytecodePatch(
    name = "Picture-in-picture button - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to display a picture-in-picture button in the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Picture-in-picture button - YouTube (Experimental) patch...")
    }
}

val youtubePlayAll = bytecodePatch(
    name = "Play all - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to play all the videos from a channel and to display play all button in the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Play all - YouTube (Experimental) patch...")
    }
}

val youtubePlaybackBuffer = bytecodePatch(
    name = "Playback buffer - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to change the video playback buffer size.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Playback buffer - YouTube (Experimental) patch...")
    }
}

val youtubePlaybackInFeeds = bytecodePatch(
    name = "Playback in feeds - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds the 'Playback in feeds' setting of YouTube to the Morphe settings, where it is always available even if YouTube hides it.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Playback in feeds - YouTube (Experimental) patch...")
    }
}

val youtubePlaybackSpeed = bytecodePatch(
    name = "Playback speed - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to customize available playback speeds, set a default playback speed, and show a speed dialog button in the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Playback speed - YouTube (Experimental) patch...")
    }
}

val youtubePlayerIconStyle = bytecodePatch(
    name = "Player icon style - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to change the style of the player button icons.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Player icon style - YouTube (Experimental) patch...")
    }
}

val youtubePotokenProvider = bytecodePatch(
    name = "PoToken provider - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds option to get PoToken using an external PoToken minter app.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing PoToken provider - YouTube (Experimental) patch...")
    }
}

val youtubeReloadVideo = bytecodePatch(
    name = "Reload video - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to display reload video button in the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Reload video - YouTube (Experimental) patch...")
    }
}

val youtubeRememberLiveStreamPlaybackPosition = bytecodePatch(
    name = "Remember live stream playback position - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to remember the playback position of an ongoing live stream and resume from there when reopening that live stream.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Remember live stream playback position - YouTube (Experimental) patch...")
    }
}

val youtubeRemoveBackgroundPlaybackRestrictions = bytecodePatch(
    name = "Remove background playback restrictions - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Removes restrictions on background playback, including playing kids videos in the background.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Remove background playback restrictions - YouTube (Experimental) patch...")
    }
}

val youtubeRemoveViewerDiscretionDialog = bytecodePatch(
    name = "Remove viewer discretion dialog - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to remove the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Remove viewer discretion dialog - YouTube (Experimental) patch...")
    }
}

val youtubeRestoreOriginalTitles = bytecodePatch(
    name = "Restore original titles - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to show the original video titles, video descriptions and channel descriptions instead of the auto-translated ones.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Restore original titles - YouTube (Experimental) patch...")
    }
}

val youtubeSanitizeSharingLinks = bytecodePatch(
    name = "Sanitize sharing links - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Removes the tracking query parameters from shared links.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Sanitize sharing links - YouTube (Experimental) patch...")
    }
}

val youtubeSaveToWatchLater = bytecodePatch(
    name = "Save to Watch later - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to display save to Watch later button in the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Save to Watch later - YouTube (Experimental) patch...")
    }
}

val youtubeSeekbar = bytecodePatch(
    name = "Seekbar - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to show old seekbar thumbnails, disable precise seeking when swiping up on the seekbar, slide to seek instead of playing at 2x speed when pressing and holding, tapping the player seekbar to seek, hiding the video player seekbar, enabling seeking in live streams, and expanding the live stream DVR duration.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Seekbar - YouTube (Experimental) patch...")
    }
}

val youtubeSettingsMenuFilter = bytecodePatch(
    name = "Settings menu filter - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide items on the standard YouTube settings screen by their visible name.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Settings menu filter - YouTube (Experimental) patch...")
    }
}

val youtubeShortsAutoplay = bytecodePatch(
    name = "Shorts autoplay - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to automatically play the next Short.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Shorts autoplay - YouTube (Experimental) patch...")
    }
}

val youtubeShortsIconStyle = bytecodePatch(
    name = "Shorts icon style - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to change the style of the Shorts action button icons.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Shorts icon style - YouTube (Experimental) patch...")
    }
}

val youtubeSpoofAppVersion = bytecodePatch(
    name = "Spoof app version - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to trick the app into thinking you are running an older version.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Spoof app version - YouTube (Experimental) patch...")
    }
}

val youtubeSpoofDeviceDimensions = bytecodePatch(
    name = "Spoof device dimensions - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to spoof the device dimensions which can unlock higher video qualities.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Spoof device dimensions - YouTube (Experimental) patch...")
    }
}

val youtubeSpoofVideoStreams = bytecodePatch(
    name = "Spoof video streams - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to spoof the client video streams to fix playback.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Spoof video streams - YouTube (Experimental) patch...")
    }
}

val youtubeTheme = bytecodePatch(
    name = "Theme - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options for theming, and settings to change the app foreground and background colors.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Theme - YouTube (Experimental) patch...")
    }
}

val youtubeVideoQuality = bytecodePatch(
    name = "Video quality - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to set default video qualities and always use the advanced video quality menu.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Video quality - YouTube (Experimental) patch...")
    }
}

val youtubeVoiceOverTranslation = bytecodePatch(
    name = "Voice over translation - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds additional voice over languages using text-to-speech synchronized to the video playback.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Voice over translation - YouTube (Experimental) patch...")
    }
}

val youtubeWideSearchBar = bytecodePatch(
    name = "Wide search bar - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds a wide search bar to the top of the home and subscription feed.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Wide search bar - YouTube (Experimental) patch...")
    }
}

