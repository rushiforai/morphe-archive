/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

object SponsoredPoolAddFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("L", "L"),
    strings = listOf(
        "SponsoredPoolContainerAdapter",
        "Edge type mismatch; not added",
    ),
)

object FeedComponentRenderFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L"),
    strings = listOf("NewsFeedFeedUnitComponent rendering feed unit %s"),
)

object LoggingComponentClassFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("LoggingComponent"),
)

object LoggingComponentRenderFingerprint : Fingerprint(
    classFingerprint = LoggingComponentClassFingerprint,
    returnType = "L",
    parameters = listOf("L"),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions
        if (instructions == null) {
            false
        } else {
            instructions.count { it.opcode == Opcode.IGET_OBJECT } >= 4 &&
                instructions.count { it.opcode == Opcode.RETURN_OBJECT } == 1 &&
                instructions.none { it.opcode == Opcode.NEW_INSTANCE }
        }
    },
)

object FeedUnitCollectionInsertFingerprint : Fingerprint(
    name = "addNewEdgeToCollection",
    returnType = "Z",
    parameters = listOf(
        "Lcom/google/common/collect/ImmutableList\$Builder;",
        "Lcom/facebook/graphql/model/GraphQLFeedUnitEdge;",
        "L",
    ),
    strings = listOf(
        "FeedUnitCollectionManager",
        "Edge not added to FUC",
    ),
)

object VideoHomeFeedUnitSectionItemsFingerprint : Fingerprint(
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;",
        "L",
        "L",
        "L",
        "L",
        "Z",
    ),
    strings = listOf("VideoHomeFeedUnitSectionComponent"),
)

object StoryBucketCardsFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/stories/model/StoryBucket;",
    returnType = "Lcom/google/common/collect/ImmutableList;",
    parameters = emptyList(),
)

object ReelsPagerSnapshotConstructorFingerprint : Fingerprint(
    definingClass = "LX/97Y;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "LX/848;",
        "LX/65N;",
        "LX/65N;",
        "Lcom/google/common/collect/ImmutableList;",
        "Ljava/lang/String;",
        "Ljava/lang/Throwable;",
        "Ljava/lang/Throwable;",
        "J",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
        "Z",
    ),
)

object ReelsCollectionSingleInsertFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "I"),
    strings = listOf("add"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull {
                (it as? ReferenceInstruction)?.reference
                    as? MethodReference
            }
            ?: emptyList()
        references.any {
            it.definingClass == "Ljava/util/List;" &&
                it.name == "add" &&
                it.parameterTypes.map(CharSequence::toString) ==
                listOf("I", "Ljava/lang/Object;")
        } &&
            references.any {
                it.definingClass == "Ljava/util/Collections;" &&
                    it.name == "singleton"
            }
    },
)

object ReelsCollectionBulkInsertFingerprint : Fingerprint(
    classFingerprint = ReelsCollectionSingleInsertFingerprint,
    returnType = "Z",
    parameters = listOf("Ljava/util/Collection;"),
)

object ReelsCollectionReplaceFingerprint : Fingerprint(
    classFingerprint = ReelsCollectionSingleInsertFingerprint,
    returnType = "Z",
    parameters = listOf("L", "I"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            val reference =
                (it as? ReferenceInstruction)?.reference
                    as? MethodReference
            reference?.definingClass == "Ljava/util/List;" &&
                reference.name == "set" &&
                reference.parameterTypes.map(CharSequence::toString) ==
                listOf("I", "Ljava/lang/Object;")
        } == true
    },
)

object ReelsInitialBatchInsertFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/util/List;"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull {
                (it as? ReferenceInstruction)?.reference
                    as? MethodReference
            }
            ?: emptyList()
        references.any {
            it.definingClass == "Ljava/util/List;" &&
                it.name == "addAll" &&
                it.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/util/Collection;")
        } &&
            references.any {
                it.definingClass == "Ljava/util/Map;" &&
                    it.name == "put"
            }
    },
)

object ReelsItemCollectionAdd580Fingerprint : Fingerprint(
    definingClass = "LX/4Xt;",
    name = "A07",
    returnType = "V",
    parameters = listOf("LX/6iZ;", "I"),
)

object ReelsItemCollectionAddAll580Fingerprint : Fingerprint(
    definingClass = "LX/4Xt;",
    name = "A05",
    returnType = "Z",
    parameters = listOf("LX/4Xt;", "Ljava/util/Collection;"),
)

object ReelsItemCollectionAddAllAtIndex580Fingerprint : Fingerprint(
    definingClass = "LX/4Xt;",
    name = "A04",
    returnType = "Z",
    parameters = listOf("I", "Ljava/util/Collection;"),
)

object ReelsNestedCollectionInsertFingerprint : Fingerprint(
    parameters = emptyList(),
    custom = { method, _ ->
        if (method.returnType == "V" || !method.returnType.startsWith("L")) {
            false
        } else {
            val references = method.implementation?.instructions
                ?.mapNotNull {
                    (it as? ReferenceInstruction)?.reference
                        as? MethodReference
                }
                ?: emptyList()
            references.any {
                it.definingClass == "Ljava/util/List;" &&
                    it.name == "add" &&
                    it.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/Object;")
            } &&
                references.any {
                    it.definingClass == "Ljava/util/Collections;" &&
                        it.name == "singleton"
                }
        }
    },
)

object ReelsCurrentModelAccessorFingerprint : Fingerprint(
    definingClass = "LX/97i;",
    name = "A03",
    returnType = "LX/9BL;",
    parameters = listOf("LX/97Y;", "I"),
)

object ReelsAttributionListFingerprint : Fingerprint(
    definingClass = "LX/5IJ;",
    name = "A08",
    returnType = "Lcom/google/common/collect/ImmutableList;",
    parameters = listOf("LX/9BL;"),
)

object ReelsAiTransparencyRenderFingerprint : Fingerprint(
    definingClass = "LX/XUr;",
    name = "render",
    returnType = "LX/3P9;",
    parameters = listOf("LX/1uD;"),
    strings = listOf(
        "XFBFBShortsGenAITransparencyAttribution",
        "android.widget.Button",
    ),
)

object ReelsSponsoredAiTransparencyRenderFingerprint : Fingerprint(
    definingClass = "LX/V6L;",
    name = "render",
    returnType = "LX/3P9;",
    parameters = listOf("LX/1uD;"),
    strings = listOf(
        "FbShortsViewerAdGenAiTransparencyComponentForSponsoredAds",
    ),
)

object ReelsNativeAiPredicateFingerprint : Fingerprint(
    definingClass = "LX/Afs;",
    name = "A03",
    returnType = "Z",
    parameters = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;",
        "LX/9BL;",
    ),
)

object ReelsAuthorDescriptionRenderFingerprint : Fingerprint(
    definingClass = "LX/AXg;",
    name = "A1G",
    returnType = "LX/3P9;",
    parameters = listOf("LX/3Q3;"),
    strings = listOf(
        "FbShortsViewerAuthorAndDescriptionComponent",
        "XFBFBShortsGenAITransparencyAttribution",
    ),
)

object ReelsWatchOnlyInfoRenderFingerprint : Fingerprint(
    definingClass = "LX/Vgq;",
    name = "A1G",
    returnType = "LX/3P9;",
    parameters = listOf("LX/3Q3;"),
    strings = listOf("FbShortsWatchOnlyVideoInfoComponent"),
)

object ReelsDisclosureRenderFingerprint : Fingerprint(
    definingClass = "LX/Pz9;",
    name = "render",
    returnType = "LX/3P9;",
    parameters = listOf("LX/1uD;"),
    strings = listOf(
        "FbShortsViewerDisclosureComponent",
        "creator_marketing",
    ),
)

object FacebookUiStringResolverFingerprint : Fingerprint(
    definingClass = "LX/1yh;",
    name = "A08",
    returnType = "Ljava/lang/String;",
    parameters = listOf("LX/UR2;", "I"),
)

object StoryAdStoreClassFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    strings = listOf("IN_DISC_METADATA_KEY", "AD_BUCKETS_KEY"),
)

object StoryAdBulkFetchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/google/common/collect/ImmutableList;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        "I",
    ),
    strings = listOf("AdsPaginatingNetworkAdBucketFetcher"),
)

object StoryAdDeferredUpdateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("IN_DISC_METADATA_KEY", "AD_BUCKETS_KEY"),
)

object StoryAdInsertionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("bucket_insert", "ads_rti_insertion"),
)

object ReelsSuppressionGateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;",
        "L",
        "L",
        "L",
        "Ljava/lang/Integer;",
    ),
    custom = { method, classDef ->
        if (AccessFlags.STATIC.isSet(method.accessFlags) ||
            classDef.fields.none { it.type == "Lcom/google/common/collect/ImmutableList;" }
        ) {
            false
        } else {
            classDef.methods.count { candidate ->
                val parameters = candidate.parameterTypes.map(CharSequence::toString)
                !AccessFlags.STATIC.isSet(candidate.accessFlags) &&
                    candidate.returnType == "Z" &&
                    parameters.size == 5 &&
                    parameters.first() == "Lcom/facebook/auth/usersession/FbUserSession;" &&
                    parameters.last() == "Ljava/lang/Integer;"
            } == 1
        }
    },
)

object ReelsFetchTriggerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;",
        "L",
        "I",
    ),
    strings = listOf("FBFetchReelsVideoAdsQuery"),
)

object ReelsClientInsertionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "I"),
    strings = listOf("VideoHomeDataControllerImpl.maybeInsertAds"),
)

object ReelsSponsoredPoolFillFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;",
        "L",
        "L",
    ),
    strings = listOf("after_model_added_to_pool"),
)

object ReelsBannerRenderFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L"),
    strings = listOf(
        "ReelsBannerAdsComponent",
        "REELS_BLOKS_BANNER_ADS_RENDER_COMPONENT_TEST_KEY",
    ),
)

object ReelsRootRenderFingerprint : Fingerprint(
    name = "render",
    returnType = "L",
    parameters = listOf("L"),
    strings = listOf("FbShortsAdsRootKComponent"),
)

object Reels580AdsRootRenderFingerprint : Fingerprint(
    definingClass = "LX/BDJ;",
    name = "render",
    returnType = "LX/3Q5;",
    parameters = listOf("LX/2Px;"),
    strings = listOf("FbShortsAdsRootKComponent"),
)

object Reels580BannerAdsRenderFingerprint : Fingerprint(
    definingClass = "LX/MBR;",
    name = "A1F",
    returnType = "LX/3Q5;",
    parameters = listOf("LX/3Qd;"),
    strings = listOf("ReelsBannerAdsComponent"),
)

object Reels580RealTimeIntentRenderFingerprint : Fingerprint(
    definingClass = "LX/T6v;",
    name = "render",
    returnType = "LX/3Q5;",
    parameters = listOf("LX/2Px;"),
    strings = listOf("FbShortsAdsRealTimeIntentComponent"),
)

object Reels580SponsoredInfoRowFingerprint : Fingerprint(
    definingClass = "LX/BFL;",
    name = "A00",
    returnType = "LX/2wL;",
    parameters = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;",
        "LX/88I;",
        "LX/5PU;",
        "LX/CHf;",
        "LX/3Qd;",
        "LX/Cv5;",
        "Ljava/lang/Boolean;",
    ),
    strings = listOf("FbShortsAdsSponsoredInfoRowAnimationKey"),
)

object ReelsRealTimeIntentRenderFingerprint : Fingerprint(
    name = "render",
    returnType = "L",
    parameters = listOf("L"),
    strings = listOf("FbShortsAdsRealTimeIntentComponent"),
)

object MarketplaceVideoAdQueryRenderFingerprint : Fingerprint(
    name = "render",
    returnType = "L",
    parameters = listOf("L"),
    strings = listOf("MarketplaceVideoAdQuery", "MarketplaceVideoAdComponent_"),
)

object MarketplaceVideoAdsRenderFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L"),
    strings = listOf(
        "com.facebook.fbreactcomponents.marketplacevideo.MarketplaceVideoAdsComponentSpec",
    ),
)

object MarketplaceNetworkSendFingerprint : Fingerprint(
    name = "sendRequest",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "D",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Ljava/lang/String;",
        "Z",
        "D",
        "Z",
    ),
    strings = listOf("FBNetworkingModule_React_Native"),
)

object GameAdBridgeFingerprint : Fingerprint(
    name = "postMessage",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    strings = listOf(
        "getinterstitialadasync",
        "getrewardedvideoasync",
        "showadasync",
        "loadbanneradasync",
    ),
)

object NekoPlayableAdActivityCreateFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/neko/playables/activity/NekoPlayableAdActivity;",
    name = "onActivityCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object AudienceNetworkRemoteActivityCreateFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/internal/ipc/AudienceNetworkRemoteActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
