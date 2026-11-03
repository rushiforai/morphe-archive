/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/feedfilter/Fingerprints.kt
 */
package app.czyeru.patches.tiktok.feedfilter

import app.morphe.patcher.Fingerprint
import app.czyeru.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BASE_LIST_FRAGMENT_PANEL_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;"
private const val AWEME_DESCRIPTOR = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val INSERT_CACHE_WHEN_PLAY_LAG_COMPONENT_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/feed/component/InsertCacheWhenPlayLagComponent;"
private const val REACH_BOTTOM_CACHE_COMPONENT_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/feed/component/ReachBottomCacheComponent;"
private const val SEARCH_MIX_FEED_LIST_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/search/pages/result/topsearch/core/model/SearchMixFeedList;"
private const val SEARCH_MIX_FEED_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/search/pages/result/topsearch/core/model/SearchMixFeed;"
private const val FRIENDS_FEED_RESPONSE_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/friendstab/api/FriendsFeedResponse;"
private const val FRIENDS_FEED_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/feed/model/friends/FriendsFeed;"
private const val BANNER_LIST_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/discover/model/BannerList;"
private const val BANNER_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/discover/model/Banner;"
private const val TRENDING_TOPIC_LIST_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/discover/model/TrendingTopicList;"
private const val MID_AD_RESPONSE_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/commercialize/feed/assem/midad/MidAdResponse;"
private const val USER_DESCRIPTOR = "Lcom/ss/android/ugc/aweme/profile/model/User;"
private const val MATCHED_FRIEND_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/profile/model/MatchedFriendStruct;"

internal object MainFeedResponseFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/FeedApiService;",
    name = "fetchFeedList",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;",
    custom = { method, classDef ->
        classDef.type == "Lcom/ss/android/ugc/aweme/feed/FeedApiService;" &&
            method.parameterTypes.size == 1
    },
)

internal object FeedItemListGetItemsFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;",
    name = "getItems",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.getReference<FieldReference>()?.let { reference ->
                reference.definingClass ==
                    "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;" &&
                    reference.name == "items" &&
                    reference.type == "Ljava/util/List;"
            } == true
        } == true
    },
)

internal object SearchMixFeedResponseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(SEARCH_MIX_FEED_LIST_DESCRIPTOR),
    custom = { method, _ ->
        val fieldReferences = method.implementation?.instructions
            ?.mapNotNull { it.getReference<FieldReference>() }
            ?: emptyList()
        val methodReferences = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()

        fieldReferences.any {
            it.definingClass == SEARCH_MIX_FEED_LIST_DESCRIPTOR &&
                it.name == "mItems" && it.type == "Ljava/util/List;"
        } && methodReferences.any {
            it.definingClass == method.definingClass &&
                it.parameterTypes == listOf(SEARCH_MIX_FEED_DESCRIPTOR) &&
                it.returnType == "Z"
        }
    },
)

internal object FriendsFeedNetworkResponseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("client_read_gids_report_time"),
    custom = { method, _ ->
        val fieldReferences = method.implementation?.instructions
            ?.mapNotNull { it.getReference<FieldReference>() }
            ?: emptyList()
        val methodReferences = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()

        fieldReferences.any {
            it.definingClass == FRIENDS_FEED_RESPONSE_DESCRIPTOR &&
                it.name == "friendFeedData" && it.type == "Ljava/util/List;"
        } && methodReferences.any {
            it.definingClass == FRIENDS_FEED_DESCRIPTOR && it.name == "getAweme" &&
                it.returnType == AWEME_DESCRIPTOR
        }
    },
)

internal object DiscoverBannerResponseFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, _ ->
        val fieldReferences = method.implementation?.instructions
            ?.mapNotNull { it.getReference<FieldReference>() }
            ?: emptyList()
        val methodReferences = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()

        fieldReferences.any {
            it.definingClass == BANNER_LIST_DESCRIPTOR &&
                it.name == "items" && it.type == "Ljava/util/List;"
        } && methodReferences.any {
            it.definingClass == BANNER_DESCRIPTOR &&
                it.name == "setRequestId" &&
                it.parameterTypes == listOf("Ljava/lang/String;")
        }
    },
)

internal object DiscoverTrendingResponseFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.getReference<FieldReference>()?.let { reference ->
                reference.definingClass == TRENDING_TOPIC_LIST_DESCRIPTOR &&
                    reference.name == "items" && reference.type == "Ljava/util/List;"
            } == true
        } == true
    },
)

internal object DiscoverTrendingPairResponseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    strings = listOf("discovery_trending_topic_receive_time"),
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
            method.implementation?.instructions?.any {
                it.getReference<FieldReference>()?.let { reference ->
                    reference.definingClass == TRENDING_TOPIC_LIST_DESCRIPTOR &&
                        reference.name == "items" && reference.type == "Ljava/util/List;"
                } == true
            } == true
    },
)

internal object MidAdResponseFingerprint : Fingerprint(
    definingClass = MID_AD_RESPONSE_DESCRIPTOR,
    name = "getAweme",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = AWEME_DESCRIPTOR,
    parameters = emptyList(),
)

internal object ProfileAdEligibilityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(USER_DESCRIPTOR),
    strings = listOf("profile_ad_experiment"),
    custom = { method, _ ->
        val fieldReferences = method.implementation?.instructions
            ?.mapNotNull { it.getReference<FieldReference>() }
            ?: emptyList()
        val methodReferences = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()

        fieldReferences.any {
            it.definingClass == MATCHED_FRIEND_DESCRIPTOR &&
                it.name == "recType" && it.type == "Ljava/lang/String;"
        } && methodReferences.any {
            it.definingClass == USER_DESCRIPTOR &&
                it.name == "getMatchedFriendStruct" &&
                it.returnType == MATCHED_FRIEND_DESCRIPTOR
        } && methodReferences.any {
            it.definingClass == USER_DESCRIPTOR &&
                it.name == "getFollowStatus" && it.returnType == "I"
        }
    },
)

internal object FollowFeedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;",
    strings = listOf("feed"),
    custom = { method, _ ->
        // Two parameters through 47.4.3; 47.6.3 calls a Kotlin default-arguments form with five.
        method.parameterTypes.size >= 2 && method.implementation?.instructions?.any {
            it.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;" &&
                    reference.name == "getItems"
            } == true
        } == true
    },
)

internal object FollowFeedListGetItemsFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;",
    name = "getItems",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

internal object InsertedFeedItemsFingerprint : Fingerprint(
    definingClass = BASE_LIST_FRAGMENT_PANEL_DESCRIPTOR,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "I",
        "Ljava/lang/String;",
        "Ljava/util/List;",
    ),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()
        val payloadFactory = references.singleOrNull { reference ->
            reference.parameterTypes == listOf(
                "I",
                "Ljava/lang/String;",
                "Ljava/util/List;",
            ) && reference.returnType.startsWith("L")
        }

        payloadFactory != null && references.any { reference ->
            reference.definingClass == BASE_LIST_FRAGMENT_PANEL_DESCRIPTOR &&
                reference.parameterTypes == listOf(payloadFactory.returnType) &&
                reference.returnType == "V"
        }
    },
)

internal object FinalFeedInsertionFingerprint : Fingerprint(
    definingClass = BASE_LIST_FRAGMENT_PANEL_DESCRIPTOR,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf(
        "insertItemList fall to downgrade logic",
        "homepage_hot",
        "ad_rerank",
    ),
    custom = custom@{ method, _ ->
        if (method.parameterTypes.size != 1) return@custom false

        val payloadType = method.parameterTypes.single().toString()
        val instructions = method.implementation?.instructions ?: return@custom false
        val readsPayloadList = instructions.any { instruction ->
            instruction.getReference<FieldReference>()?.let { reference ->
                instruction.opcode == com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT &&
                    reference.definingClass == payloadType &&
                    reference.type == "Ljava/util/List;"
            } == true
        }
        val readsPayloadSource = instructions.any { instruction ->
            instruction.getReference<FieldReference>()?.let { reference ->
                instruction.opcode == com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT &&
                    reference.definingClass == payloadType &&
                    reference.type == "Ljava/lang/String;"
            } == true
        }
        val checksNativeAdState = instructions.any { instruction ->
            instruction.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == "Lcom/ss/android/ugc/aweme/feed/model/Aweme;" &&
                    reference.name == "isAd" &&
                    reference.parameterTypes.isEmpty() &&
                    reference.returnType == "Z"
            } == true
        }

        readsPayloadList && readsPayloadSource && checksNativeAdState
    },
)

/**
 * TikTok 47.2.41 splits the cold-start cache hit into two static methods: one for the golden-house
 * cache and one for the offline-mode cache. Each stores one [FeedItemList] into a static field.
 */
private fun feedItemListStoreCount(method: com.android.tools.smali.dexlib2.iface.Method) =
    method.implementation?.instructions?.count {
        it.opcode == com.android.tools.smali.dexlib2.Opcode.SPUT_OBJECT &&
            it.getReference<FieldReference>()?.type ==
            "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"
    } ?: 0

internal object ColdStartGoldenCachedFeedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("processGoldenVideoHitCache hitCache , time cost "),
    custom = { method, _ -> feedItemListStoreCount(method) == 1 },
)

internal object ColdStartOfflineCachedFeedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("processOfflineVideoHitCache error"),
    custom = { method, _ -> feedItemListStoreCount(method) == 1 },
)

/**
 * Cache-source chain callbacks. Both are `public final V(result)` and walk to the next cache source
 * when the delivered result is unusable (`LX/0Amz;`/`LX/0An2;` on 47.2.41, `LX/0DJI;`/`LX/0bfO;`
 * on 47.4.3). They close with a static call into the chain's singleton, the one they also read for
 * logging, and differ only in what they hand it: the delivery callback passes its own node and
 * checks the node's `next` link before that, the linked one passes `next` straight away.
 */
private fun cacheChainCallbackShape(
    method: com.android.tools.smali.dexlib2.iface.Method,
    linked: Boolean,
): Boolean {
    if (method.parameterTypes.size != 1) return false
    val instructions = method.implementation?.instructions?.toList() ?: return false
    val usesClaimFlag = instructions.any { instruction ->
        instruction.getReference<MethodReference>()?.let {
            it.definingClass == "Ljava/util/concurrent/atomic/AtomicBoolean;" && it.name == "compareAndSet"
        } == true
    }
    if (!usesClaimFlag) return false
    val singleton = instructions.firstOrNull {
        it.opcode == com.android.tools.smali.dexlib2.Opcode.SGET_OBJECT
    }?.getReference<FieldReference>()?.type ?: return false
    val readsSuccessFlag = instructions.any { instruction ->
        instruction.opcode == com.android.tools.smali.dexlib2.Opcode.IGET_BOOLEAN &&
            instruction.getReference<FieldReference>()?.definingClass == method.parameterTypes.single().toString()
    }
    if (!readsSuccessFlag) return false
    val lastStaticIndex = instructions.indexOfLast { it.opcode == com.android.tools.smali.dexlib2.Opcode.INVOKE_STATIC }
    if (lastStaticIndex < 1) return false
    val lastStatic = instructions[lastStaticIndex].getReference<MethodReference>() ?: return false
    if (lastStatic.definingClass != singleton || lastStatic.returnType != "V" || lastStatic.parameterTypes.size != 2) {
        return false
    }
    val previous = instructions[lastStaticIndex - 1]
    val passesNextLink = previous.opcode == com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT &&
        previous.getReference<FieldReference>()?.let { it.definingClass == it.type } == true
    return passesNextLink == linked
}

internal object CacheChainDeliveryFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    custom = { method, _ -> cacheChainCallbackShape(method, linked = false) },
)

internal object CacheChainDeliveryLinkedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    custom = { method, _ -> cacheChainCallbackShape(method, linked = true) },
)

internal object InsertCacheWhenPlayLagFingerprint : Fingerprint(
    definingClass = INSERT_CACHE_WHEN_PLAY_LAG_COMPONENT_DESCRIPTOR,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(AWEME_DESCRIPTOR, "I", "Z"),
    strings = listOf("middle_insert_when_video_lagging"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()

        references.any { reference ->
            reference.definingClass.endsWith("/AwemeBizOptExtKt;") &&
                reference.name == "setAwemeCacheType" &&
                reference.parameterTypes == listOf(AWEME_DESCRIPTOR, "I")
        } && references.any { reference ->
            reference.definingClass.endsWith("/DataLayerAbility;") &&
                reference.parameterTypes.firstOrNull()?.toString() == AWEME_DESCRIPTOR
        }
    },
)

internal object ReachBottomCacheDeliveryFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf(
        "golden_house",
        "offline_video_useout",
        "golden_insert",
    ),
    custom = custom@{ method, classDef ->
        if (method.parameterTypes.size != 1) return@custom false
        if (classDef.fields.none { it.type == REACH_BOTTOM_CACHE_COMPONENT_DESCRIPTOR }) {
            return@custom false
        }

        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: return@custom false
        references.any { reference ->
            reference.definingClass.endsWith("/DataLayerAbility;") &&
                reference.parameterTypes.firstOrNull()?.toString() == AWEME_DESCRIPTOR
        } && references.any { reference ->
            reference.definingClass.endsWith("/IFeedPanelPlatformAbility;") &&
                reference.parameterTypes == listOf(
                    "I",
                    "Ljava/lang/String;",
                    "Ljava/util/List;",
                )
        }
    },
)

private const val PROFILE_AWEME_LIST_FRAGMENT_DESCRIPTOR =
    "Lcom/ss/android/ugc/profile/business/profile/tab/AwemeListFragmentImpl;"
private const val DETAIL_FRAGMENT_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/detail/ui/DetailFragment;"
private const val DETAIL_PAGE_ABILITY_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/detail/platform/IDetailPageAbility;"

internal object ProfileNativeListTransformFingerprint : Fingerprint(
    definingClass = PROFILE_AWEME_LIST_FRAGMENT_DESCRIPTOR,
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/util/List;"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()
        references.any { reference ->
            reference.definingClass == "Lcom/ss/android/ugc/aweme/feed/model/Aweme;" &&
                reference.name == "getAwemeRawAd" &&
                reference.parameterTypes.isEmpty()
        } && references.any { reference ->
            reference.definingClass ==
                "Lcom/ss/android/ugc/aweme/commercialize/profile/talent/ITalentAdRevenueShareService;" &&
                reference.returnType == "Ljava/util/List;"
        }
    },
)

internal object FriendsFeedFinalDeliveryFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/ss/android/ugc/aweme/friendstab/api/FriendsFeedResponse;",
        "Z",
    ),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()
        val fields = method.implementation?.instructions
            ?.mapNotNull { it.getReference<FieldReference>() }
            ?: emptyList()
        fields.any { reference ->
            reference.definingClass ==
                "Lcom/ss/android/ugc/aweme/friendstab/api/FriendsFeedResponse;" &&
                reference.name == "friendFeedData" &&
                reference.type == "Ljava/util/List;"
        } && references.any { reference ->
            reference.parameterTypes == listOf("I", "Z", "Z", "Ljava/util/List;") &&
                reference.returnType == "V"
        } && references.any { reference ->
            reference.definingClass ==
                "Lcom/ss/android/ugc/aweme/friendstab/api/FriendsFeedResponse;" &&
                reference.name == "getAwemeList" &&
                reference.returnType == "Ljava/util/List;"
        }
    },
)

internal object ProfileDetailAdEventFingerprint : Fingerprint(
    definingClass = DETAIL_FRAGMENT_DESCRIPTOR,
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    custom = custom@{ method, _ ->
        if (method.parameterTypes.size != 1) return@custom false

        val eventType = method.parameterTypes.single().toString()
        val instructions = method.implementation?.instructions ?: return@custom false
        val readsListFromEvent = instructions.any { instruction ->
            instruction.getReference<FieldReference>()?.let { reference ->
                instruction.opcode == com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT &&
                    reference.definingClass == eventType &&
                    reference.type == "Ljava/util/List;"
            } == true
        }
        val forwardsListToDetailPager = instructions.any { instruction ->
            instruction.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == DETAIL_PAGE_ABILITY_DESCRIPTOR &&
                    reference.parameterTypes == listOf("Ljava/util/List;") &&
                    reference.returnType == "V"
            } == true
        }

        readsListFromEvent && forwardsListToDetailPager
    },
)

/** `lq(Z)V` on 47.2.41, `fq(Z)V` on 47.4.3: the setter that toggles the right-rail AI slot. */
internal object TakoAiFeedButtonSetVisibleFingerprint : Fingerprint(
    definingClass = "/feed/assem/tikbot/TakoAssem;",
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("right_container_chat_gpt"),
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
