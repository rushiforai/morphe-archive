package app.onlynazril.patches.tiktok.feedfilter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val FEED_FILTER_CLASS =
    "Lapp/onlynazril/extension/tiktok/feedfilter/FeedFilter;"
internal const val FEED_ITEM_LIST = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"
internal const val I_FEED_API = "Lcom/ss/android/ugc/aweme/feed/cache/IFeedApi;"

/**
 * The feed page fetch: the one implementation of `IFeedApi#fetchFeedList`.
 *
 * The anchor is the contract, not the name. The class is real-named today
 * (`com.ss.android.ugc.aweme.feed.FeedApiService`) and the method still is too, but neither is
 * what this matches on: the interface, the single-parameter shape and a body are. The interface
 * declares the same return type with no body, so the body is what keeps the declaration out.
 *
 * Its return is the finished page. The fetch chain is
 * `FeedApiService#fetchFeedList → FeedApi#LIZIZ → FeedApi#LIZ`, and it is `LIZIZ` that reads the
 * page's `hasAd` and `preloadAds`, so by the time this returns the ads are already merged in.
 *
 * The patch calls `matchAllOrNull` rather than reading the single match: a build that grows a
 * second implementation has to fail here, not silently filter one of them.
 */
internal val FeedApiFetchFingerprint = Fingerprint(
    returnType = FEED_ITEM_LIST,
    interfaces = listOf(I_FEED_API),
    custom = { method, _ ->
        method.implementation != null && method.parameterTypes.size == 1
    },
)

/**
 * Every list that becomes a page's items , the generic model, shared by the profile, search and
 * repost lists as well as the feed. Only the ad filter runs here; a count range would hide a
 * profile owner's own posts, but an item marked as an ad belongs nowhere.
 *
 * Matched on the field it writes as well as on its name: this is a real-named model accessor, and
 * the write to `items` is what makes it the setter being hooked rather than a namesake.
 */
internal val FeedItemListSetItemsFingerprint = Fingerprint(
    definingClass = FEED_ITEM_LIST,
    name = "setItems",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        fieldAccess(
            definingClass = FEED_ITEM_LIST,
            name = "items",
            opcode = Opcode.IPUT_OBJECT,
        ),
    ),
)

/**
 * The page's copy , the write to `items` that is not a setter call. Hooked for the ad filter only,
 * for the same reason as the setter above.
 */
internal val FeedItemListCloneFingerprint = Fingerprint(
    definingClass = FEED_ITEM_LIST,
    name = "clone",
    returnType = FEED_ITEM_LIST,
    parameters = emptyList(),
)

/**
 * The feed panel's insert callback: `(int, String, List)`. The name moves between builds
 * (`yX2` on 47.7.1, `xX2` on 47.7.2, `zX2` on 47.7.3), so only the real-named panel class and the shape are
 * matched. The list is what `DataLayerAbility` hands over for an insert, including ads.
 */
internal val FeedPanelInsertFingerprint = Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Ljava/util/List;"),
    custom = { method, _ -> method.implementation != null },
)

/**
 * The direct survey-card insert on the same panel. It does not pass through the callback above:
 * it builds the event itself and inserts a singleton list whose source is the literal
 * `"survey_card"`. The method name moves, so the literal is the anchor.
 */
internal val FeedPanelSurveyFingerprint = Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;",
    returnType = "V",
    parameters = listOf("I", "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is StringReference && reference.string == "survey_card"
        } == true
    },
)

/**
 * The pager's own item model , the list the feed actually renders, of which the fetched page is
 * only a snapshot.
 *
 * `X.07zq#getData` on 47.0.3 sets a page's items three times: the parsed list, the clone, then
 * `X.07zo#getItems()` , the model's own list, which overwrites everything the first two hooks
 * removed. So filtering the page is filtering a copy; the items have to be stopped where they enter
 * the model instead.
 *
 * Matched by the set of method names it carries, not by its (obfuscated) class name: this is the
 * one class that both exposes the list (`getItems`, `getListCount`) and takes items in
 * (`insertItemList`, `setItems`).
 */
internal const val PAGER_MODEL_GET_ITEMS = "getItems"
internal const val PAGER_MODEL_GET_COUNT = "getListCount"
internal const val PAGER_MODEL_INSERT = "insertItemList"
internal const val PAGER_MODEL_SET = "setItems"
internal val PAGER_MODEL_METHODS = listOf(
    PAGER_MODEL_GET_ITEMS,
    PAGER_MODEL_GET_COUNT,
    PAGER_MODEL_INSERT,
    PAGER_MODEL_SET,
)
