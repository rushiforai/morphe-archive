package com.dmoniak.patches.instagram

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramAddSettings = bytecodePatch(
    name = "Add settings - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds settings to control preferences are patching",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Add settings - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramAllowUserNetworkCertificate = bytecodePatch(
    name = "Allow user network certificate - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Allows user network certificate for whitehat testing",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Allow user network certificate - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramChangeLikeAnimation = bytecodePatch(
    name = "Change like animation - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Change the animation to one from existing Rings like animations",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Change like animation - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramChangeVersionCode = bytecodePatch(
    name = "Change version code - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Changes the version code of the app. This will turn off app store updates and allows downgrading an existing app install to an older app version.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Change version code - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramClone = bytecodePatch(
    name = "Clone - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Changes the package name and the app name. This allows you to install the patched app alongside the original Instagram app. Caution: Do not select the official Morphe's \"Change package name\" universal patch.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Clone - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramCopyComment = bytecodePatch(
    name = "Copy comment - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds a button to copy comments on posts and reels.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Copy comment - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramCustomSharingDomain = bytecodePatch(
    name = "Custom sharing domain - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Allows for using custom domains when sharing posts, reels and stories.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Custom sharing domain - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramCustomiseStoryRingSize = bytecodePatch(
    name = "Customise story ring size - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Customise story ring size - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramCustomiseStoryTimestamp = bytecodePatch(
    name = "Customise story timestamp - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Customise the timestamp that shows when the story was posted",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Customise story timestamp - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableReelsScrolling = bytecodePatch(
    name = "Disable Reels scrolling - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Disables the endless scrolling behavior in Instagram Reels, preventing swiping to the next Reel. Note: On a clean install, the 'Tip' animation may appear but will stop on its own after a few seconds.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable Reels scrolling - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableAds = bytecodePatch(
    name = "Disable ads - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable ads - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableAnalytics = bytecodePatch(
    name = "Disable analytics - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Block analytics that are sent to Instagram/Facebook servers.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable analytics - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableComments = bytecodePatch(
    name = "Disable comments - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable comments - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableDiscoverPeople = bytecodePatch(
    name = "Disable discover people - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Disables discover people section on user profile",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable discover people - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableDoubleTapLike = bytecodePatch(
    name = "Disable double tap like - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Disable double tap like on post, reel, comment and message",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable double tap like - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableExplore = bytecodePatch(
    name = "Disable explore - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable explore - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableHighlights = bytecodePatch(
    name = "Disable highlights - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable highlights - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableOnboardingPermissionPrompts = bytecodePatch(
    name = "Disable onboarding permission prompts - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Prevents contacts and location permission onboarding prompts from appearing.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable onboarding permission prompts - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableScreenshotDetection = bytecodePatch(
    name = "Disable screenshot detection - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Disables screenshots detection in DM",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable screenshot detection - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableStories = bytecodePatch(
    name = "Disable stories - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable stories - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableStoryFlipping = bytecodePatch(
    name = "Disable story flipping - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Disable automatic flipping/moving to next story",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable story flipping - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableSwipeToCreate = bytecodePatch(
    name = "Disable swipe to create - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Prevents opening the creation screen by swiping right on the home tab.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable swipe to create - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableTypingStatus = bytecodePatch(
    name = "Disable typing status - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable typing status - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDisableVideoAutoplay = bytecodePatch(
    name = "Disable video autoplay - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable video autoplay - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDownloadMedia = bytecodePatch(
    name = "Download media - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds ability to download posts, reels, stories and highlights",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Download media - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramDownloadVoiceMessage = bytecodePatch(
    name = "Download voice message - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enables ability to download voice messages",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Download voice message - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramExternalDownloader = bytecodePatch(
    name = "External downloader - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds support to share post links directly to external downloader",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing External downloader - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramFilterStories = bytecodePatch(
    name = "Filter stories - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Filter stories to hide based on different categories",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Filter stories - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramFriendshipStatusIndicator = bytecodePatch(
    name = "Friendship status indicator - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds a follows you back status label on the profile page andshows a detailed friendship status breakdown on click",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Friendship status indicator - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramHideGroupCreationButtonOnSharesheet = bytecodePatch(
    name = "Hide group creation button on sharesheet - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide group creation button on sharesheet - Instagram (Experimental) patch...")
    }
}

