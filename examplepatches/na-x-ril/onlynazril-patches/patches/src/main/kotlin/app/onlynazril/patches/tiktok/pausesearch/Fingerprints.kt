package app.onlynazril.patches.tiktok.pausesearch

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * The real-named service whose pause item the manager collects.
 *
 * `LJII()` returns the image-search item; its return type is obfuscated and moves between builds,
 * so it is matched by owner and name rather than by type.
 */
internal const val I_PHOTO_SEARCH_SERVICE = "Lcom/ss/android/ugc/aweme/vision/IPhotoSearchService;"

/** The real-named parameter the visual search tag is bound with. */
internal const val VIDEO_ITEM_PARAMS = "Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"

private const val SEARCH_VISUAL_TAG_TRIGGER =
    "Lcom/ss/android/ugc/aweme/search/entry/visualsearch/ui/SearchVisualTagComponentTrigger;"

/**
 * The pause item manager's constructor: it asks [IPhotoSearchService] for the image-search item
 * and adds it to its list. It is the one constructor in the bundle making that call
 * (`X.1QhK` on 47.7.2, `X.1NRr` on 47.7.1, `X.1PB2` on 47.7.3), which is what keeps the anchor stable while the
 * class and method names rename.
 */
internal val PauseItemManagerFingerprint = Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = I_PHOTO_SEARCH_SERVICE,
            name = "LJII",
        ),
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
