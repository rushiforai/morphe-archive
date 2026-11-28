package app.onlynazril.patches.tiktok.pausesearch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/** The real-named service whose pause item the manager collects. */
internal const val I_PHOTO_SEARCH_SERVICE = "Lcom/ss/android/ugc/aweme/vision/IPhotoSearchService;"

/** The manager's own log tag, the one stable name its obfuscated class carries. */
private const val PAUSE_ITEM_MANAGER_TAG = "PausePanelItemManager"

/** The real-named parameter the visual search tag is bound with. */
internal const val VIDEO_ITEM_PARAMS = "Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"

private const val SEARCH_VISUAL_TAG_TRIGGER =
    "Lcom/ss/android/ugc/aweme/search/entry/visualsearch/ui/SearchVisualTagComponentTrigger;"

/**
 * The pause item manager's constructor: it asks [I_PHOTO_SEARCH_SERVICE] for the image-search item
 * and adds it to its list.
 *
 * The interface method is renamed between builds (`LJII` through 47.8.x, `LJIIIIZZ` on 47.9.1,
 * where `LJII` became an unrelated entry point), so the anchor is the manager's own log tag plus
 * any call to the real-named service. The class name moves too (`X.1QhK` on 47.7.2, `X.1NRr` on
 * 47.7.1, `X.1PB2` on 47.7.3, `X.1MXa` on 47.8.3, `X.1KwK` on 47.9.1).
 */
internal val PauseItemManagerFingerprint = Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf(PAUSE_ITEM_MANAGER_TAG),
    filters = listOf(
        methodCall(definingClass = I_PHOTO_SEARCH_SERVICE),
    ),
)

/**
 * The visual search tag trigger, the second image-search surface. Its `(VideoItemParams) -> boolean`
 * method decides whether the tag is added to the feed's interact area; the method name itself moves
 * (`lq` on 47.7.2, `tq` on 47.7.1, `qq` on 47.7.3), so the real-named class and signature are the anchor.
 */
internal val VisualSearchTagFingerprint = Fingerprint(
    definingClass = SEARCH_VISUAL_TAG_TRIGGER,
    returnType = "Z",
    parameters = listOf(VIDEO_ITEM_PARAMS),
)
