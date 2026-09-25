/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/feedfilter/Fingerprints.kt
 */
package app.morphe.patches.tiktok.feedfilter

import app.morphe.patches.tiktok.shared.discovery.TikTokFingerprint as Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * TikTok 46.7.3 For You response post-processing path.
 *
 * The FeedApi class and stable response markers survive the 46.4.3 -> 46.7.3
 * migration, while the obfuscated method name and request type do not. Keep the
 * semantic class/return/string anchors and let the fingerprint follow those
 * obfuscation changes.
 */
internal object ForYouFeedResponseFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/api/FeedApi;",
    returnType = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;",
    strings = listOf("fyp", "first_feed_duration"),
)

/**
 * Cached For You `fetchFeeds` filter. The owner moved from LX/0MPw in 46.4.3
 * to LX/04Js in 46.7.3; the method contract and exact cache-filter strings are
 * stable and are stronger anchors than the obfuscated owner/name.
 */
internal object ForYouCachedFeedFilterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"),
    strings = listOf("fetchFeeds, filter by is ad", "fetchFeeds, filter by is duplicate"),
)

/** Exact cached For You list read (`feed_use_cache_size` / `tryUseCache`). */
internal object ForYouCachedFeedReadFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;",
    parameters = emptyList(),
    strings = listOf("feed_use_cache_size", "tryUseCache list size "),
)

/**
 * Final TikTok 46.7.3 Feed0VVManager commit runnable for the For You feed.
 *
 * 46.7.3 moved the old synthetic run$1 method to an instance Runnable
 * (LX/07fn.run()). The complete semantic commit string set is unchanged, so
 * it remains an exact late-stage FYP/UI handoff anchor without depending on
 * the obfuscated class name.
 */
internal object ForYouFinalCommitFingerprint : Fingerprint(
    name = "run",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    strings = listOf(
        "Feed0VVManager@",
        "full_feed_commit_process_data",
        "homepage_hot",
        "filter_show_ad",
        "filter_installed_ad",
        "fyp",
        "soft_ads",
        "roi2",
    ),
)

internal object FeedItemListGetItemsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/util/List;",
    custom = { method, classDef ->
        classDef.endsWith("/FeedItemList;") &&
            method.name == "getItems" &&
            method.parameterTypes.isEmpty()
    },
)

internal object FollowFeedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;",
    custom = { method, _ ->
        method.parameterTypes.size == 2
    },
)

internal object FollowFeedListGetItemsFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;",
    name = "getItems",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

internal object TakoAiFeedButtonSetVisibleFingerprint : Fingerprint(
    definingClass = "/feed/assem/tikbot/TakoAssem;",
    returnType = "V",
    parameters = listOf("Z"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()

        references.any {
            it.definingClass == "Lcom/bytedance/assem/arch/reused/ReusedUIAssem;" &&
                it.name == "LJJJ" &&
                it.returnType == "Landroid/view/View;"
        } && references.any {
            it.definingClass == "Landroid/view/View;" &&
                it.name == "getVisibility" &&
                it.returnType == "I"
        }
    },
)

internal object FollowFeedPresenterPostProcessFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()
        references.any {
            it.definingClass == "Lcom/ss/android/ugc/aweme/feed/model/Aweme;" &&
                it.name == "isAd"
        } && references.any {
            it.definingClass == "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;" &&
                it.name == "setItems"
        } && references.any {
            it.definingClass == "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;" &&
                it.name == "setInsertedResults"
        }
    },
)

internal object TakoAiFeedButtonBindFingerprint : Fingerprint(
    definingClass = "/feed/assem/tikbot/TakoAssem;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)
