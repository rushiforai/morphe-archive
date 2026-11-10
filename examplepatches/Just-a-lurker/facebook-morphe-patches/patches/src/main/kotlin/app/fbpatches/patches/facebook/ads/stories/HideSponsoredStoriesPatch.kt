/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * ads/sponsoredstories, itself forked from
 * https://github.com/andrewliang25/morphe-patches (Copyright 2026 Andrew Liang, GPL-3.0).
 *
 * Modified for facebook-morphe-patches, 2026: always on, no settings switch.
 */
package app.fbpatches.patches.facebook.ads.stories

import app.fbpatches.patches.facebook.shared.parameterRegister
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

internal const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"

/*
 * Story buckets pass through a chain of bucket data sources, each taking the organic list and
 * returning it with its own buckets spliced in: (FbUserSession, <flags>, ImmutableList) -> ImmutableList.
 * Returning the input unchanged is what Facebook itself does when a source adds nothing.
 */

/** The clash resolver that orders two ad ("inorganic") buckets landing together. */
internal object InorganicClashResolverFingerprint : Fingerprint(
    returnType = IMMUTABLE_LIST,
    strings = listOf("handling_inorganic_clash"),
)

/** AdBucketDataSourceUtil, the main story ad placement engine. */
internal object AdBucketDataSourceFingerprint : Fingerprint(
    returnType = IMMUTABLE_LIST,
    strings = listOf("uninsertedMainAdsQueue"),
)

/** AdPaginatingBucketStaticInsertionDataSource, which drains pending ad buckets as you paginate. */
internal object AdPaginatingBucketInserterFingerprint : Fingerprint(
    returnType = IMMUTABLE_LIST,
    strings = listOf("AdPaginatingBucketStaticInsertionDataSource.getBuckets"),
)

/** StoryViewerMidCardDataSource, mid-card ads fetched while the viewer is open. */
internal object StoryViewerMidCardFingerprint : Fingerprint(
    returnType = IMMUTABLE_LIST,
    strings = listOf("StoryViewerMidCardDataSource.getBuckets"),
)

@Suppress("unused")
val hideSponsoredStoriesPatch = bytecodePatch(
    name = "Hide sponsored stories",
    description = "Removes ad cards from the story viewer.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACEBOOK)

    execute {
        listOf(
            InorganicClashResolverFingerprint,
            AdBucketDataSourceFingerprint,
            AdPaginatingBucketInserterFingerprint,
            StoryViewerMidCardFingerprint,
        ).forEach { fingerprint ->
            val method = fingerprint.method
            val listParameter = method.parameterTypes.indexOfLast { it.toString() == IMMUTABLE_LIST }
            if (listParameter < 0) {
                throw PatchException(
                    "${method.definingClass}->${method.name} takes no ImmutableList to pass through",
                )
            }
            method.addInstructions(0, "return-object ${method.parameterRegister(listParameter)}")
        }
    }
}
