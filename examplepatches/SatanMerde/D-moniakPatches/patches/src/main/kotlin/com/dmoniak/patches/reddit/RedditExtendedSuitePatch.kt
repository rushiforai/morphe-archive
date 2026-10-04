package com.dmoniak.patches.reddit

import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

@Suppress("unused")
val redditAppIcon = bytecodePatch(
    name = "App icon - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to select from the Reddit app icons available in the manifest.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing App icon - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditCustomBrandingNameForReddit = bytecodePatch(
    name = "Custom branding name for Reddit - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Changes the Reddit app name to the name specified in patch options.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Custom branding name for Reddit - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditCustomFont = bytecodePatch(
    name = "Custom font - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to replace Reddit Sans / Roboto with a custom TTF or OTF font file at runtime.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Custom font - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditDisableModernHome = bytecodePatch(
    name = "Disable modern home - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable the modern home UI. This patch works with Reddit 2026.24.0 and earlier.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable modern home - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditDisableScreenshotPopup = bytecodePatch(
    name = "Disable screenshot popup - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to disable the popup that appears when taking a screenshot.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Disable screenshot popup - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditForceSystemFont = bytecodePatch(
    name = "Force system font - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option that renders Reddit with the device system font instead of Reddit Sans / Roboto.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Force system font - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditHideAskButton = bytecodePatch(
    name = "Hide Ask button - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide Ask button in the search bar.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide Ask button - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditHideRedditSearch = bytecodePatch(
    name = "Hide Reddit search - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Permanently hides the Reddit search in the contextual menu. This patch does not work with root mounting",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide Reddit search - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditHideTrendingShelves = bytecodePatch(
    name = "Hide Trending shelves - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide the Trending shelves from feed and search suggestions.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide Trending shelves - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditHideAds = bytecodePatch(
    name = "Hide ads - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide ads.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide ads - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditHideCommunitiesShelf = bytecodePatch(
    name = "Hide communities shelf - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to hide the related or suggested communities shelf in subreddits.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide communities shelf - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditHideNavigationButtons = bytecodePatch(
    name = "Hide navigation buttons - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide buttons in the navigation bar.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide navigation buttons - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditHideSidebarComponents = bytecodePatch(
    name = "Hide sidebar components - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to hide the sidebar components.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Hide sidebar components - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditOpenLinksDirectly = bytecodePatch(
    name = "Open links directly - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to skip over redirection URLs in external links.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Open links directly - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditOpenLinksExternally = bytecodePatch(
    name = "Open links externally - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to always open links in your browser instead of with the in-app-browser.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Open links externally - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditRemoveSubredditDialog = bytecodePatch(
    name = "Remove subreddit dialog - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds options to remove the NSFW community warning and notifications suggestion dialogs by dismissing them automatically.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Remove subreddit dialog - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditSanitizeSharingLinks = bytecodePatch(
    name = "Sanitize sharing links - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to sanitize sharing links by removing tracking query parameters.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Sanitize sharing links - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditShowViewCount = bytecodePatch(
    name = "Show view count - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Adds an option to show the view count of Posts.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Show view count - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditSpoofSignature = bytecodePatch(
    name = "Spoof signature - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Spoofs the signature of the app to fix notification issues.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Spoof signature - Reddit (Experimental) patch...")
    }
}

@Suppress("unused")
val redditStartAsGuest = bytecodePatch(
    name = "Start as guest - Reddit (Experimental)",
    description = "\u26A0\uFE0F [En cours de d\u00E9veloppement / Non test\u00E9] Skips the forced startup login screen using Reddit's native guest browsing mode.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("Executing Start as guest - Reddit (Experimental) patch...")
    }
}

