/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0), ads/prefetch,
 * itself forked from https://github.com/andrewliang25/morphe-patches (Copyright 2026 Andrew Liang, GPL-3.0).
 *
 * Modified for facebook-morphe-patches, 2026.
 */
package app.fbpatches.patches.facebook.ads.prefetch

import app.fbpatches.patches.facebook.shared.handleTargets
import app.fbpatches.patches.facebook.shared.neuterOrReason
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.patch.bytecodePatch

/** Background ad fetchers. Each keeps its real name; each void method enqueues work. */
internal val AD_PREFETCH_SCHEDULERS = listOf(
    // News feed ads channel: periodic WorkManager prefetch and its emerging-surface twin.
    "Lcom/facebook/feed/push/adschannelbackgroundprefetch/FeedAdsChannelBackgroundPrefetchInitializerAppJob;",
    "Lcom/facebook/feed/push/adschannelemergingsurfaceprefetch/FeedAdsChannelEmergingSurfacePrefetchInitializerAppJob;",
    // Reels and Watch.
    "Lcom/facebook/video/videohome/prefetching/ads/background/ReelsAdsBackgroundPrefetchAppJob;",
    // Stories viewer ads.
    "Lcom/facebook/stories/features/ads/prefetch/StoryViewerAdsPrefetchAppInitializationController;",
    "Lcom/facebook/stories/features/ads/prefetch/StoryViewerAdsPrefetchController;",
    // Revalidation of cached ad payloads.
    "Lcom/facebook/addelivery/deliveryvalidation/cachedadsvalidator/NewsFeedAdCacheSyncInitializerAppJob;",
    // On-device ad-ranking ML model.
    "Lcom/facebook/feed/ads/mlranker/MlRankerAppJob;",
)

@Suppress("unused")
val blockAdPrefetchPatch = bytecodePatch(
    name = "Block background ad prefetch",
    description = "Stops the background jobs that download ads and the ad-ranking model before you see them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACEBOOK)

    // Block the schedulers, not the workers: the workers' doWork is renamed and returns an
    // obfuscated Result. WorkManager persists its schedule, so work enqueued by an unpatched build
    // stays until app data is cleared.
    execute {
        handleTargets("Block background ad prefetch", "ad prefetch schedulers", AD_PREFETCH_SCHEDULERS) {
            neuterOrReason(it)
        }
    }
}
