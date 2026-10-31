package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.gestures

import app.morphe.patcher.Fingerprint

internal const val PLAYER_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/views/video/CustomExoPlayerView;"

/**
 * Builds the player as a layout names it. It builds the view a video is drawn on and returns,
 * with nothing branching around the return, which is why the gestures are put in place here
 * rather than at the end of the building itself: that jumps from the middle of one of its two
 * paths straight to its return.
 */
internal val playerFromALayoutFingerprint = Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == PLAYER_CLASS && method.name == "<init>"
    },
)

/** Builds the player where code asks for one, saying whether it may be zoomed. */
internal val playerBuiltInCodeFingerprint = Fingerprint(
    parameters = listOf("Landroid/content/Context;", "Z"),
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == PLAYER_CLASS && method.name == "<init>"
    },
)
