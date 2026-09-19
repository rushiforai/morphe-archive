/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/feedfilter/Fingerprints.kt
 */
package app.morphe.patches.tiktok.feedfilter

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BASE_LIST_FRAGMENT_PANEL_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;"
private const val AWEME_DESCRIPTOR = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val INSERT_CACHE_WHEN_PLAY_LAG_COMPONENT_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/feed/component/InsertCacheWhenPlayLagComponent;"
private const val REACH_BOTTOM_CACHE_COMPONENT_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/feed/component/ReachBottomCacheComponent;"

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

internal object FollowFeedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;",
    strings = listOf("feed"),
    custom = { method, _ ->
        method.parameterTypes.size == 2 && method.implementation?.instructions?.any {
            it.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;" &&
                    reference.name == "getItems"
            } == true
        } == true
    },
)

/**
 * No access flags: the patcher compares them exactly, and 46.9.3 marks this getter `public
 * final` where the three builds before it say `public`. The class, name, return type and empty
 * parameter list name one method on every retained build, which is all the flags added.
 */
internal object FollowFeedListGetItemsFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;",
    name = "getItems",
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

internal object ColdStartCachedFeedFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf(
        "processGoldenVideoHitCache hitCache , time cost ",
        "processOfflineVideoHitCache error",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.count {
            it.opcode == com.android.tools.smali.dexlib2.Opcode.SPUT_OBJECT &&
                it.getReference<FieldReference>()?.type ==
                "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"
        } == 4
    },
)

/** Names TikTok's cache-result data class without depending on its R8 descriptor. */
internal object CacheResultClassFingerprint : Fingerprint(
    name = "toString",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("CacheLoadResult(success="),
)

/**
 * Newer cache providers pass every result through this normalizer before a callback sees it.
 * The result and helper descriptors move with R8; Aweme's survey cleanup method does not.
 */
internal object CacheResultNormalizerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    custom = custom@{ method, _ ->
        if (method.parameterTypes.size != 1) return@custom false

        method.implementation?.instructions?.count { instruction ->
            instruction.getReference<MethodReference>()?.let { reference ->
                reference.definingClass == AWEME_DESCRIPTOR &&
                    reference.name == "clearSurveyInfoForCacheConsume" &&
                    reference.parameterTypes.isEmpty() &&
                    reference.returnType == "V"
            } == true
        } == 2
    },
)

internal object CacheChainDeliveryFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    custom = custom@{ method, classDef ->
        if (method.parameterTypes.size != 1 || classDef.fields.count() != 2) return@custom false

        val resultType = method.parameterTypes.single().toString()
        val instructions = method.implementation?.instructions ?: return@custom false
        val fieldReferences = instructions.mapNotNull { it.getReference<FieldReference>() }
        val methodReferences = instructions.mapNotNull { it.getReference<MethodReference>() }
        val ownFieldTypes = classDef.fields.map { it.type }.toSet()

        val readsResultPayload = fieldReferences.any { reference ->
            reference.definingClass == resultType &&
                reference.type.startsWith("L") &&
                reference.type != "Ljava/lang/String;"
        }
        val followsLinkedCacheSource = fieldReferences.any { reference ->
            reference.definingClass in ownFieldTypes && reference.type == reference.definingClass
        }
        val dispatchesNextCacheSource = methodReferences.any { reference ->
            reference.returnType == "V" &&
                reference.parameterTypes.size == 2 &&
                reference.parameterTypes.all { it.toString() in ownFieldTypes }
        }
        val launchesCoroutine = methodReferences.any { reference ->
            reference.parameterTypes.any { it.toString() == "Lkotlin/jvm/functions/Function2;" }
        }

        readsResultPayload && followsLinkedCacheSource &&
            dispatchesNextCacheSource && launchesCoroutine
    },
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

internal object ProfileRefreshResultFingerprint : Fingerprint(
    definingClass = PROFILE_AWEME_LIST_FRAGMENT_DESCRIPTOR,
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "Z"),
    strings = listOf("onRefreshResult: type="),
)

internal object ProfileLoadMoreResultFingerprint : Fingerprint(
    definingClass = PROFILE_AWEME_LIST_FRAGMENT_DESCRIPTOR,
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "Z"),
    strings = listOf("onLoadMoreResult: type="),
)

internal object ProfileLoadLatestResultFingerprint : Fingerprint(
    definingClass = PROFILE_AWEME_LIST_FRAGMENT_DESCRIPTOR,
    returnType = "V",
    parameters = listOf("Ljava/util/List;", "Z"),
    strings = listOf("onLoadLatestResult: type="),
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

private const val MID_AD_COMPONENT_DESCRIPTOR =
    "Lcom/ss/android/ugc/feed/platform/panel/midad/MidAdComponent;"

/**
 * The mid-roll ad component's splice. Given the video on screen and an ad, it finds the video
 * in the pager adapter and puts the ad in its place, logging {@code midroll_ads_show} first.
 * This is the route issue #2 was about: it runs after every list the other feed hooks see, so
 * an ad reached the profile pager while the profile list carried 184 videos with 0 removed.
 *
 * <p>Static on every retained build, with the same five parameters (the video, the ad, a flag,
 * the component and the adapter) and the same event string; the log strings beside it are
 * stripped after 46.2.3, and the method's own name changes on every build, so neither is used.
 */
internal object MidAdReplaceFingerprint : Fingerprint(
    definingClass = MID_AD_COMPONENT_DESCRIPTOR,
    returnType = "V",
    strings = listOf("midroll_ads_show"),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.size == 5 &&
            method.parameterTypes[0].toString() == AWEME_DESCRIPTOR &&
            method.parameterTypes[1].toString() == AWEME_DESCRIPTOR &&
            method.parameterTypes[2].toString() == "Z"
    },
)

/** Where the mid-roll ad component comes to life, so the export carries its family on every run. */
internal object MidAdComponentCreateFingerprint : Fingerprint(
    definingClass = MID_AD_COMPONENT_DESCRIPTOR,
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

private const val USER_DESCRIPTOR = "Lcom/ss/android/ugc/aweme/profile/model/User;"

/** The response of the profile pager's own ad request, a real name on every retained build. */
internal const val PROFILE_AD_RESPONSE_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/commercialize/profile/impl/ad/CommerceProfileAdResponse;"

/**
 * TikTok's own answer to whether a creator's video pager should ask for ads: it reads the
 * `profile_ad_experiment` value and, for some values, the creator's friend match and follow
 * status. On 46.2.3 its only callers are the profile ad module's two request gates, one for
 * each value of the module's `profileAdVersion`.
 *
 * <p>Static `(User)Z` with that string on 46.2.3 through 46.9.3 (`LX/0lk2;->LIZ` on 46.2.3). The
 * only other method carrying the string registers the setting and takes nothing. No access
 * flags: the patcher compares them exactly, and the static flag is checked here instead.
 */
internal object ProfileAdEligibilityFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(USER_DESCRIPTOR),
    strings = listOf("profile_ad_experiment"),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

/**
 * Every bottom banner under a feed video reaches its cell through this getter: the Tako "Ask"
 * banner, the "Search" one, series and drama bars. Named, and without access flags for the
 * reason [FollowFeedListGetItemsFingerprint] gives.
 */
internal object AwemeBannersFingerprint : Fingerprint(
    definingClass = AWEME_DESCRIPTOR,
    name = "getBanners",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

/**
 * The search page's own result list. It arrives parsed, then this method walks its items to
 * stamp the request id on each, which makes it the one place every result passes through
 * before the grid sees it. The field it walks is read directly by forty other methods, so
 * there is nothing later to hook.
 */
internal object SearchResultRequestIdFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/search/pages/result/topsearch/core/model/SearchMixFeedList;",
    name = "setRequestId",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * The Friends tab is its own feed and never arrives as a FeedItemList. Its response carries
 * FriendsFeed wrappers in a real named `friendFeedData` field, and `setRequestId` on that
 * class, which is what the search grid is hooked on, has no callers at all in 46.2.3.
 *
 * Three places are hooked because no single one covers it. The all-arguments constructor
 * catches a response the app builds itself, and the no-argument one delegates to it. It does
 * not catch a response off the wire: gson calls the constructor with defaults and then writes
 * the fields reflectively, so the list is still empty when the constructor returns. For that,
 * the getter and the success callback below run once the fields are populated.
 */
internal object FriendsFeedResponseFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/friendstab/api/FriendsFeedResponse;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "I", "Z", "Ljava/util/List;", "Ljava/lang/String;", "Ljava/lang/String;",
        "Lcom/ss/android/ugc/aweme/feed/model/LogPbBean;", "I", "Ljava/util/List;",
        "Ljava/util/List;", "Ljava/lang/String;",
    ),
)

/** Walks `friendFeedData` itself, so the list is populated by the time it runs. */
internal object FriendsFeedAwemeListFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/friendstab/api/FriendsFeedResponse;",
    name = "getAwemeList",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

/**
 * Where a fetched response is handed to the tab. The class is obfuscated, but the callback
 * kept its name and the body names the response's own field, which is what identifies it.
 */
internal object FriendsFeedSuccessFingerprint : Fingerprint(
    name = "onSuccess",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.getReference<FieldReference>()?.let { reference ->
                reference.definingClass ==
                    "Lcom/ss/android/ugc/aweme/friendstab/api/FriendsFeedResponse;" &&
                    reference.name == "friendFeedData"
            } == true
        } == true
    },
)

internal object TakoAiFeedButtonSetVisibleFingerprint : Fingerprint(
    definingClass = "/feed/assem/tikbot/TakoAssem;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("right_container_chat_gpt"),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.mapNotNull { it.getReference<MethodReference>() }
            ?: emptyList()
        references.any { reference ->
            reference.definingClass == "Landroid/view/View;" &&
                reference.name == "getVisibility" &&
                reference.parameterTypes.isEmpty() &&
                reference.returnType == "I"
        } && references.any { reference ->
            reference.definingClass == "Landroid/view/View;" &&
                reference.name == "isShown" &&
                reference.parameterTypes.isEmpty() &&
                reference.returnType == "Z"
        }
    },
)

/**
 * The bind of the Tako "Ask" strip under a video's caption, a bottom slot on the video cell
 * (issue #6). Named {@code hs} on 46.2.3 and {@code onBind} on the three later builds, so it is
 * found by what it does: it is the one single-Object method on the class that casts its
 * argument to the video's item params before reading the video.
 */
internal object TakoAskBarBindFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/tako/detail/keyframe/ui/TakoDetailKeyFrameBottomAssemAssem;",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == com.android.tools.smali.dexlib2.Opcode.CHECK_CAST &&
                instruction.getReference<com.android.tools.smali.dexlib2.iface.reference.TypeReference>()
                    ?.type == "Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"
        } == true
    },
)

/**
 * The trigger component for the same slot. On some accounts TikTok draws the ask bar through
 * this trigger instead of (or alongside) the slot component. A reporter's export on 0.39.0
 * showed the slot hook never firing while the bar still appeared: the trigger was the one
 * that ran. Its {@code hs} is a bridge into {@code Sp(VideoItemParams)}, which gets the
 * content view and registers a show callback, so hiding the view at the top of the trigger's
 * bind covers both paths.
 *
 * <p>Matched by its defining class and by the {@code CHECK_CAST} to {@code VideoItemParams}
 * inside its body, the same way the slot fingerprint works.
 */
internal object TakoAskBarTriggerBindFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/tako/detail/keyframe/ui/TakoDetailKeyFrameBottomTrigger;",
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"),
    custom = { method, _ ->
        // The name changes on every build (Sp, mr, yr, Kr), but it is always the sole
        // (VideoItemParams)V method that is not the boolean variant (Wp, ur, Dr, Qr). Both
        // sit on the same class with the same parameter; the return type separates them.
        !com.android.tools.smali.dexlib2.AccessFlags.ABSTRACT.isSet(method.accessFlags)
    },
)

/**
 * The feed-level Tako trigger, in the tikbot package rather than the detail keyframe package.
 * A reporter on 0.39.0 still saw the ask bar while the detail-page hook never fired, so the
 * bar was drawn through a different component entirely. This trigger is the one that binds per
 * video on the main scrolling feed and registers the callback that makes the ask bar visible.
 * Same structural pattern as the detail trigger: one {@code (VideoItemParams)V} method, one
 * {@code (VideoItemParams)Z} method, both with names that change on every build.
 */
internal object TakoFeedTriggerBindFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/tikbot/TakoTrigger;",
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"),
    custom = { method, _ ->
        !com.android.tools.smali.dexlib2.AccessFlags.ABSTRACT.isSet(method.accessFlags)
    },
)

/**
 * The roof variant of the feed-level Tako trigger, which sits above the normal trigger and
 * covers the same slot from the "roof" layout position. Same (VideoItemParams)V pattern.
 */
internal object TakoFeedTriggerRoofBindFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/tikbot/TakoTriggerRoof;",
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"),
    custom = { method, _ ->
        !com.android.tools.smali.dexlib2.AccessFlags.ABSTRACT.isSet(method.accessFlags)
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


/** The playlist bar along the bottom of a video that belongs to a series. */
internal object PlaylistBottomBarAvailableFingerprint : Fingerprint(
    definingClass = "/InteractPlayListBottomBarAssem;",
    returnType = "Z",
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;"),
)

/** Answers whether an item is a short drama advert that locks scrolling until it ends. */
internal object DramaBlockingAdFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/impl/DramaBlockingAdServiceImpl;",
    returnType = "Z",
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/Aweme;"),
)

/** Attaches the floating promotional event badge to the feed. */
internal object SpecActTouchpointAttachFingerprint : Fingerprint(
    definingClass = "/specact/SpecActServiceImpl;",
    returnType = "V",
    parameters = listOf("Landroid/view/ViewGroup;", "Landroidx/fragment/app/Fragment;"),
)

private val REC_USER_CARD_PARAMETERS =
    listOf("I", "Ljava/util/List;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;").sorted()

/** The semantic method shape survives R8 reordering its List and String parameters. */
internal fun Method.isRecUserCardInsertion() =
    parameterTypes.map(CharSequence::toString).sorted() == REC_USER_CARD_PARAMETERS

/** Builds the friend recommendation card; a null result is the app's own "nothing to insert". */
internal object RecUserCardInsertFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lkotlin/Pair;",
    strings = listOf("friend_recommend_card"),
    custom = { method, _ -> method.isRecUserCardInsertion() },
)

/** Loads the Lynx view behind an inserted card, which happens before any list filter runs. */
internal object FeedLynxCardLoadFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
        "Ljava/lang/String;",
        "L",
    ),
    strings = listOf("feedDynamicComponentLoadSuccess"),
)

/**
 * The share guide that pops up after a like, asking the reader to share the video with friends.
 * Named {@code O} on 46.2.3, {@code J} on 46.7.3, {@code H} on 46.8.3, {@code D} on 46.9.3;
 * matched by its defining class, parameter shape and the {@code "share_guide"} string it logs.
 * Upstream #22.
 */
internal object ShareGuideFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/panel/FullFeedFragmentPanel;",
    returnType = "V",
    parameters = listOf("I", "Lcom/ss/android/ugc/aweme/feed/model/Aweme;", "Ljava/lang/String;"),
    strings = listOf("share_guide"),
)
