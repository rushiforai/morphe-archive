package app.onlynazril.patches.tiktok.feedfilter

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

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
    custom = { method, classDef ->
        method.implementation != null &&
            method.parameterTypes.size == 1 &&
            classDef.interfaces.any { it == I_FEED_API }
    },
)

/**
 * Every list that becomes the page's items — the write the fetch hook cannot cover.
 *
 * The fetch's return is not the last write. `FeedItemList#setItems` has 66 callers on 47.0.3: the
 * feed stack rebuilds the list on insert, rerank and cache restore, so an ad or an out-of-range
 * video that arrives after the fetch is one the return hook never sees.
 *
 * Matched on the field it writes as well as on its name: this is a real-named model accessor, and
 * the write to `items` is what makes it the setter being hooked rather than a namesake.
 */
internal val FeedItemListSetItemsFingerprint = Fingerprint(
    definingClass = FEED_ITEM_LIST,
    name = "setItems",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                instruction.getReference<FieldReference>()?.let {
                    it.definingClass == FEED_ITEM_LIST && it.name == "items"
                } == true
        } == true
    },
)

/**
 * The page's copy — the third write to `items`, and the one that is not a setter call.
 *
 * `clone()` writes the new page's `items` field directly, so a copy taken from a page the filter
 * never saw — a cache restored without a fetch — is invisible to both other hooks. Eleven callers
 * on 47.0.3, and the copy is what gets displayed when the app keeps the original back.
 */
internal val FeedItemListCloneFingerprint = Fingerprint(
    definingClass = FEED_ITEM_LIST,
    name = "clone",
    returnType = FEED_ITEM_LIST,
    parameters = emptyList(),
)

/**
 * The pager's own item model — the list the feed actually renders, of which the fetched page is
 * only a snapshot.
 *
 * `X.07zq#getData` on 47.0.3 sets a page's items three times: the parsed list, the clone, then
 * `X.07zo#getItems()` — the model's own list, which overwrites everything the first two hooks
 * removed. So filtering the page is filtering a copy; the items have to be stopped where they enter
 * the model instead.
 *
 * Matched by the set of method names it carries, not by its (obfuscated) class name: this is the
 * one class that both exposes the list (`getItems`, `getListCount`) and takes items in
 * (`insertItemList`, `setItems`).
 */
internal val PAGER_MODEL_METHODS = listOf("getItems", "getListCount", "insertItemList", "setItems")
internal const val PAGER_MODEL_INSERT = "insertItemList"
internal const val PAGER_MODEL_SET = "setItems"
