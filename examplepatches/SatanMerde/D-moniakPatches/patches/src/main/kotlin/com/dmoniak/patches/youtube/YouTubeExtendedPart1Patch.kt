package com.dmoniak.patches.youtube

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeAddToQueue = bytecodePatch(
    name = "Add to queue - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Overrides the feed flyout 'Play next in queue' with the Morphe video queue.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Add to queue - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeAlternativeThumbnails = bytecodePatch(
    name = "Alternative thumbnails - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to replace video thumbnails using the DeArrow API or image captures from the video.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Alternative thumbnails - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeAmbientMode = bytecodePatch(
    name = "Ambient mode - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to bypass power saving restrictions for Ambient mode and disable it entirely or in fullscreen.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Ambient mode - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeAppRefreshRate = bytecodePatch(
    name = "App refresh rate - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to change the app refresh rate.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing App refresh rate - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeBypassImageRegionRestrictions = bytecodePatch(
    name = "Bypass image region restrictions - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to use a different host for user avatar and channel images and can fix missing images that are blocked in some countries.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Bypass image region restrictions - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeBypassLinkRedirects = bytecodePatch(
    name = "Bypass link redirects - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to bypass redirects and open the original link directly.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Bypass link redirects - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeCaptions = bytecodePatch(
    name = "Captions - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable captions from being automatically enabled or to set caption cookies.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Captions - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeChangeFormFactor = bytecodePatch(
    name = "Change form factor - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to change the UI appearance to a phone, tablet, or automotive device.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Change form factor - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeChangeHeader = bytecodePatch(
    name = "Change header - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to change the header logo in the top left corner of the app.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Change header - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeChangeStartPage = bytecodePatch(
    name = "Change start page - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to set which page the app opens in instead of the homepage.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Change start page - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeChannelSearch = bytecodePatch(
    name = "Channel search - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to search inside the channel that is currently open instead of searching all of YouTube.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Channel search - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeCheckWatchHistoryDomainNameResolution = bytecodePatch(
    name = "Check watch history domain name resolution - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Checks if the device DNS server is preventing user watch history from being saved.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Check watch history domain name resolution - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeCopyVideoLink = bytecodePatch(
    name = "Copy video link - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to display buttons in the video player to copy video links.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Copy video link - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeCustomBranding = bytecodePatch(
    name = "Custom branding - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to change the app icon and app name. For mounted (root) installations the branding is applied while patching, because it cannot be changed from the app settings.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Custom branding - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeCustomPlayerOverlayOpacity = bytecodePatch(
    name = "Custom player overlay opacity - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to change the opacity of the video player background when player controls are visible.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Custom player overlay opacity - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableDrcAudio = bytecodePatch(
    name = "Disable DRC audio - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable DRC (Dynamic Range Compression) audio.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable DRC audio - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableShortsResumingOnStartup = bytecodePatch(
    name = "Disable Shorts resuming on startup - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable Shorts from resuming on app startup when Shorts were last being watched.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable Shorts resuming on startup - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableAutoFeedRefresh = bytecodePatch(
    name = "Disable auto feed refresh - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to stop feeds from refreshing automatically after they become outdated.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable auto feed refresh - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableDoubleTapActions = bytecodePatch(
    name = "Disable double tap actions - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable player double tap gestures.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable double tap actions - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableFullscreenGestures = bytecodePatch(
    name = "Disable fullscreen gestures - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to selectively disable gestures for entering and exiting fullscreen mode, and to disable pinch-to-zoom.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable fullscreen gestures - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableHapticFeedback = bytecodePatch(
    name = "Disable haptic feedback - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable haptic feedback in the player for various actions.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable haptic feedback - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableLayoutUpdates = bytecodePatch(
    name = "Disable layout updates - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable server side layout updates and use an older UI.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable layout updates - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisablePlayerPopupPanels = bytecodePatch(
    name = "Disable player popup panels - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable panels (such as live chat) from opening automatically.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable player popup panels - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisablePlaylistAutoplay = bytecodePatch(
    name = "Disable playlist autoplay - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to stop a playlist from automatically advancing to the next video.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable playlist autoplay - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableRollingNumberAnimations = bytecodePatch(
    name = "Disable rolling number animations - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable rolling number animations of video view count, user likes, and upload time.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable rolling number animations - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableScrollingSpeedLimit = bytecodePatch(
    name = "Disable scrolling speed limit - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to remove limits of how fast the home and subscription feed can be scrolled.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable scrolling speed limit - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableSignInToTvPopup = bytecodePatch(
    name = "Disable sign in to TV popup - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to disable the popups asking to sign into or connect to a TV on the same local network.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable sign in to TV popup - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDisableVideoCodecs = bytecodePatch(
    name = "Disable video codecs - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to disable or force HDR, and to disable VP9 codecs.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable video codecs - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDoubleTapToSeek = bytecodePatch(
    name = "Double tap to seek - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds additional double-tap to seek values to the YouTube settings menu.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Double tap to seek - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeDownloads = bytecodePatch(
    name = "Downloads - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds support to download videos with an external downloader app using the in-app download button or a video player action button.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Downloads - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeEnableDebugging = bytecodePatch(
    name = "Enable debugging - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options for debugging and exporting Morphe logs to the clipboard.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Enable debugging - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeExitFullscreenMode = bytecodePatch(
    name = "Exit fullscreen mode - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to automatically exit fullscreen mode when a video reaches the end.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Exit fullscreen mode - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeForceFullscreenLandscape = bytecodePatch(
    name = "Force fullscreen landscape - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to rotate the player to landscape when entering fullscreen mode on tablets and other large screen devices.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Force fullscreen landscape - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeForceOriginalAudio = bytecodePatch(
    name = "Force original audio - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to always use the original audio track.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Force original audio - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeFullscreenVideoScale = bytecodePatch(
    name = "Fullscreen video scale - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to stretch or zoom videos to fill the screen in fullscreen mode.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Fullscreen video scale - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeHideShortsComponents = bytecodePatch(
    name = "Hide Shorts components - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide components related to Shorts.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide Shorts components - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeHideAds = bytecodePatch(
    name = "Hide ads - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide general ads, Premium promotions and video ads.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide ads - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeHideAutoplayPreview = bytecodePatch(
    name = "Hide autoplay preview - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide the autoplay preview at the end of videos.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide autoplay preview - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeHideEndScreenCards = bytecodePatch(
    name = "Hide end screen cards - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide suggested video cards at the end of videos.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide end screen cards - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeHideEndScreenSuggestedVideo = bytecodePatch(
    name = "Hide end screen suggested video - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide the suggested video at the end of videos.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide end screen suggested video - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeHideInfoCards = bytecodePatch(
    name = "Hide info cards - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide info cards that creators add in the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide info cards - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeHideLayoutComponents = bytecodePatch(
    name = "Hide layout components - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide general layout components.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide layout components - YouTube (Experimental) patch...")
    }
}

@Suppress("unused")
val youtubeHidePlayerFlyoutMenuComponents = bytecodePatch(
    name = "Hide player flyout menu components - YouTube (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide menu components that appear when pressing the gear icon in the video player.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide player flyout menu components - YouTube (Experimental) patch...")
    }
}

