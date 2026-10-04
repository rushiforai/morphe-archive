package com.dmoniak.patches.instagram

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramHideNavigationButtons = bytecodePatch(
    name = "Hide navigation buttons - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Hides navigation bar buttons, such as the Reels and Create button.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide navigation buttons - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramHideNotesTray = bytecodePatch(
    name = "Hide notes tray - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Hides notes tray in DM section",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide notes tray - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramHideReshareButton = bytecodePatch(
    name = "Hide reshare button - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Hides the reshare button from both posts and reels.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide reshare button - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramHideStoriesTray = bytecodePatch(
    name = "Hide stories tray - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Hides stories tray from main feed.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide stories tray - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramHideSuggestedContent = bytecodePatch(
    name = "Hide suggested content - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Hides suggested stories, reels, threads (Suggested posts will still be shown).",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide suggested content - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramImproveImageViewing = bytecodePatch(
    name = "Improve image viewing - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Fetches max resolution images from server.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Improve image viewing - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramLimitFeedToFollowingProfiles = bytecodePatch(
    name = "Limit feed to following profiles - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Filters the home feed to display only content from profiles you follow.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Limit feed to following profiles - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramLoopStory = bytecodePatch(
    name = "Loop story - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Replay the current story when it ends",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Loop story - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramMakeEphemeralMediaPermanent = bytecodePatch(
    name = "Make ephemeral media permanent - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Changes unexpired view once, view twice media to permanent view.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Make ephemeral media permanent - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramMarkChatAsReadManually = bytecodePatch(
    name = "Mark chat as read manually - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds option to mark a thread aka message as read manually",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Mark chat as read manually - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramMoreOptionsOnPost = bytecodePatch(
    name = "More options on post - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an overflow menu button to get more options on post/reels, like copy description, copy username etc",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing More options on post - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramMoreOptionsOnProfile = bytecodePatch(
    name = "More options on profile - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds a new button to handle user related data like copy handle, download profile picture etc",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing More options on profile - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramOpenLinksExternally = bytecodePatch(
    name = "Open links externally - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Changes links to always open in your external browser, instead of the in-app browser.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Open links externally - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramRecommendedFlags = bytecodePatch(
    name = "Recommended flags - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Developer flags suggested by the community",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Recommended flags - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramRemoveBuildExpiredPopup = bytecodePatch(
    name = "Remove build expired popup - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Removes the popup that appears after a while, when the app version ages.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Remove build expired popup - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramRemoveEmptyBottomSpace = bytecodePatch(
    name = "Remove empty bottom space - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Removes empty space below bottom navigation bar",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Remove empty bottom space - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramSanitizeShareLinks = bytecodePatch(
    name = "Sanitize share links - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Sanitize share links - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramSaveDeletedMessages = bytecodePatch(
    name = "Save deleted messages - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Captures incoming DMs locally as they arrive from the server and marks them when the sender deletes them.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Save deleted messages - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramSaveMediaComment = bytecodePatch(
    name = "Save media comment - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds a button to save media comments on posts and reels.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Save media comment - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramStoriesAudioAutoplay = bytecodePatch(
    name = "Stories audio autoplay - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Stories audio autoplay - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramTheme = bytecodePatch(
    name = "Theme - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds Material You and AMOLED controls to Piko settings on Android 12 and later. On Android 8–11, it applies a fixed Material You-style theme or an optional AMOLED theme.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Theme - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramUnlockPlusBenefits = bytecodePatch(
    name = "Unlock Plus benefits - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Unlocks 'Plus' subscription benefits that are checked locally. USE IT AT YOUR OWN RISK",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Unlock Plus benefits - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramUnlockDeveloperOptions = bytecodePatch(
    name = "Unlock developer options - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Unlocks developer option by long pressing home icon",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Unlock developer options - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramUnlockEmployeeOptions = bytecodePatch(
    name = "Unlock employee options - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Unlocks all options using by employee for debugging",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Unlock employee options - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramValidateLinks = bytecodePatch(
    name = "Validate links - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Fixes app crashing issue while opening links from a different app",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Validate links - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramViewDmsAnonymously = bytecodePatch(
    name = "View DMs anonymously - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing View DMs anonymously - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramViewLiveAnonymously = bytecodePatch(
    name = "View live anonymously - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing View live anonymously - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramViewStoriesAnonymously = bytecodePatch(
    name = "View stories anonymously - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Enhances application behavior and unlocks additional user controls.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing View stories anonymously - Instagram (Experimental) patch...")
    }
}

@Suppress("unused")
val instagramViewStoryMentions = bytecodePatch(
    name = "View story mentions - Instagram (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Add option to view visible and hidden story mentions.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing View story mentions - Instagram (Experimental) patch...")
    }
}

