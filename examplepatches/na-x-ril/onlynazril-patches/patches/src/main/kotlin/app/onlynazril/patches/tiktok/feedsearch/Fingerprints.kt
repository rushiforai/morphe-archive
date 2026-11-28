package app.onlynazril.patches.tiktok.feedsearch

import app.morphe.patcher.Fingerprint

/** The real-named parameter each trigger is asked with. */
internal const val VIDEO_ITEM_PARAMS = "Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"

private const val FEED_SEARCH_TRIGGER =
    "Lcom/ss/android/ugc/feed/platform/cell/interact/bottom/bar/FeedSearchBottomBarAssemTrigger;"

private const val FEED_SEARCH_TRIGGER_V2 =
    "Lcom/ss/android/ugc/feed/platform/cell/interact/bottom/bar/FeedSearchBottomBarAssemTriggerV2;"

/**
 * The two versions of the bottom bar trigger. Each has one `(VideoItemParams) -> boolean` method
 * that decides whether the Search · <query> bar is added under the video.
 *
 * The classes are real-named; the method name is obfuscated and moves between builds (`tq` on
 * 47.7.1, `Iq` on 47.9.1), so the signature is the anchor.
 */
internal val FeedSearchTriggerFingerprints = listOf(
    FEED_SEARCH_TRIGGER to Fingerprint(
        definingClass = FEED_SEARCH_TRIGGER,
        returnType = "Z",
        parameters = listOf(VIDEO_ITEM_PARAMS),
    ),
    FEED_SEARCH_TRIGGER_V2 to Fingerprint(
        definingClass = FEED_SEARCH_TRIGGER_V2,
        returnType = "Z",
        parameters = listOf(VIDEO_ITEM_PARAMS),
    ),
)
