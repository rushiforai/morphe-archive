package app.template.patches.mxplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal const val BH_CLASS = "Lcom/ddx/axx/axx/axx/BH;"
internal const val MEDIA_LIST_FRAGMENT_CLASS = "Lcom/mxtech/videoplayer/list/MediaListFragment;"
internal const val AD_MEDIA_LIST_FRAGMENT_CLASS = "Lcom/mxtech/videoplayer/ad/a;"
internal const val LOCAL_TILES_MANAGER_CLASS = "Lcom/mxtech/videoplayer/ad/local/tiles/LocalTilesManager;"
internal const val TILE_RESOURCES_CLASS = "Lcom/mxtech/videoplayer/ad/online/model/bean/next/TileResources;"
internal const val AD_ACTIVITY_SCREEN_CLASS = "Lcom/mxtech/videoplayer/ad/ActivityScreen;"
internal const val BASE_ACTIVITY_SCREEN_CLASS = "Lcom/mxtech/videoplayer/ActivityScreen;"
internal const val LOCAL_EXIT_AD_TEST_CLASS = "Lcom/mxtech/videoplayer/ad/online/abtest/LocalOnlyExitAdTest;"
internal const val GDPR_LOG_CLASS = "Lcom/mxtech/videoplayer/ad/GdprLog;"
internal const val LOCAL_ME_FRAGMENT_CLASS = "Lcom/mxtech/videoplayer/ad/subscriptions/ui/metab/fragment/LocalMeFragment;"
internal const val LOCAL_ME_BASE_FRAGMENT_CLASS = "Lcom/mxtech/videoplayer/ad/subscriptions/ui/metab/fragment/LocalMeBaseFragment;"
internal const val LOCAL_ME_WHATSAPP_COROUTINE_CLASS = "Lcom/mxtech/videoplayer/ad/subscriptions/ui/metab/fragment/LocalMeFragment\$initWhatsAppStatus\$1;"
internal const val THEME_LIST_ACTIVITY_CLASS = "Lcom/mxtech/videoplayer/ad/online/theme/ui/ThemeListActivity;"
internal const val THEME_LOAD_LOCAL_CLASS = "Lcom/mxtech/videoplayer/ad/online/theme/ui/ThemeListViewModel\$loadDataFromLocal\$2;"
internal const val THEME_LOAD_SERVER_CLASS = "Lcom/mxtech/videoplayer/ad/online/theme/ui/ThemeListViewModel\$loadDataFromServer\$2;"
internal const val TAB_TYPE_CLASS = "Lcom/mxtech/videoplayer/ad/online/tab/home/bean/TabType;"
internal const val CUSTOM_CODEC_CHECKER_CLASS = "Lcom/mxtech/videoplayer/preference/CustomCodecCheckerAsync;"
internal const val DECODER_PREFS_FRAGMENT_CLASS = "Lcom/mxtech/videoplayer/preference/DecoderPreferences\$Fragment;"
internal const val DECODER_PREFS_CODEC_LISTENER_CLASS = "Lcom/mxtech/videoplayer/preference/DecoderPreferences\$b;"

// region 1. JNI Integrity Gate & Crashlytics Bridge

internal object BhClinitFingerprint : Fingerprint(
    definingClass = BH_CLASS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)

internal object FirebaseExceptionRecordFingerprint : Fingerprint(
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;"),
    filters = listOf(
        string("FirebaseCrashlytics component is not present."),
    ),
    custom = { _, classDef -> classDef.sourceFile == "FirebaseExceptionHandler.java" && '$' !in classDef.type },
)

// endregion

// region 2. Monetize-v2 Ad Engine & Placement Managers (Cross-Version 3.3.1 / 3.4.0 / 3.4.1)

internal object AdInitializerNameFingerprint : Fingerprint(
    name = "name",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        string("AdInitializer"),
    ),
    custom = { _, classDef -> classDef.sourceFile == "AdInitializer.kt" && '$' !in classDef.type },
)

internal object AdManagerV2InitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    custom = { methodDef, classDef ->
        classDef.sourceFile == "AdManagerV2.kt" &&
            '$' !in classDef.type &&
            methodDef.parameterTypes.size == 1
    },
)

internal object SharedStateManagerInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    custom = { methodDef, classDef ->
        classDef.sourceFile == "SharedStateManager.kt" &&
            '$' !in classDef.type &&
            methodDef.parameterTypes.size == 1
    },
)

internal object BannerManagerEnabledFingerprint : Fingerprint(
    name = "b",
    returnType = "Z",
    parameters = emptyList(),
    custom = { _, classDef -> classDef.sourceFile == "BannerManager.java" && '$' !in classDef.type },
)

internal object PanelNativeLoadFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(
        string("isNotification"),
    ),
    custom = { _, classDef -> classDef.sourceFile == "PanelNative.java" && '$' !in classDef.type },
)

internal object InterstitialShowFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("key_show_interstitial_ad_tips"),
    ),
    custom = { _, classDef -> classDef.sourceFile == "InterstitialV2.java" && '$' !in classDef.type },
)

internal object RewardedAdPlacementInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    custom = { methodDef, classDef ->
        classDef.sourceFile == "RewardedAdPlacement.java" &&
            '$' !in classDef.type &&
            methodDef.parameterTypes.size == 4
    },
)

internal object TrayNativeInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    custom = { _, classDef -> classDef.sourceFile == "TrayNative.java" && '$' !in classDef.type },
)

internal object VideoRollManagerInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        string("vastTimeOut"),
    ),
    custom = { _, classDef -> classDef.sourceFile == "VideoRollManager.java" && '$' !in classDef.type },
)

internal object OpenAdsShowWelcomeFingerprint : Fingerprint(
    name = "g",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("key_last_show_open_ad_ts"),
    ),
    custom = { _, classDef -> classDef.sourceFile == "OpenAds.kt" && '$' !in classDef.type },
)

internal object WelcomeAdEnabledFingerprint : Fingerprint(
    name = "b",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("shouldWelcomeAdEnabled"),
    ),
    custom = { _, classDef -> classDef.sourceFile == "WelcomeAdFeatureFlag.kt" && '$' !in classDef.type },
)

internal object LocalOnlyExitAdEnableFingerprint : Fingerprint(
    definingClass = LOCAL_EXIT_AD_TEST_CLASS,
    name = "enableInterstitialAd",
    returnType = "Z",
    parameters = emptyList(),
)

internal object ActivityScreenInitFingerprint : Fingerprint(
    definingClass = AD_ACTIVITY_SCREEN_CLASS,
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
)

// endregion

// region 3. GlobalConfig, UMP Splash & Local Folder List Ad/Promo Hooks

internal object GlobalConfigClinitFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("localmusicOpen"),
    ),
    custom = { _, classDef -> classDef.sourceFile == "GlobalConfig.java" && '$' !in classDef.type },
)

internal object NationalUtilGdprRegionFingerprint : Fingerprint(
    name = "a",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("Europe"),
    ),
    custom = { _, classDef -> classDef.sourceFile == "NationalUtil.java" && '$' !in classDef.type },
)

internal object GdprLogClinitFingerprint : Fingerprint(
    definingClass = GDPR_LOG_CLASS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)

internal object MediaListForYouEntryFingerprint : Fingerprint(
    definingClass = MEDIA_LIST_FRAGMENT_CLASS,
    returnType = "Z",
    parameters = listOf("Ljava/util/List;", "Z"),
    filters = listOf(
        string("for_you_entry_enabled"),
    ),
)

internal object AdMediaListAttachFabFingerprint : Fingerprint(
    definingClass = AD_MEDIA_LIST_FRAGMENT_CLASS,
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("fab_local"),
    ),
)

internal object LocalTilesManagerClinitFingerprint : Fingerprint(
    definingClass = LOCAL_TILES_MANAGER_CLASS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)

internal object PromoteViewModelCreateFingerprint : Fingerprint(
    name = "c",
    filters = listOf(
        string("fab_local"),
    ),
    custom = { methodDef, classDef ->
        classDef.sourceFile == "PromoteViewModel.kt" &&
            methodDef.parameterTypes.size == 2 &&
            methodDef.parameterTypes[0] == "Ljava/lang/String;"
    },
)

// endregion

// region 4. Me Page, Navigation Bar, App Theme & Custom Codec Fingerprints

internal object LocalMeOnViewCreatedFingerprint : Fingerprint(
    definingClass = LOCAL_ME_FRAGMENT_CLASS,
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

internal object LocalMeWhatsAppStatusFingerprint : Fingerprint(
    definingClass = LOCAL_ME_WHATSAPP_COROUTINE_CLASS,
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

internal object LocalTabOnCreateFingerprint : Fingerprint(
    name = "Q",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("key_session_start_time"),
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "LocalTabActivityMediaList.java" &&
            '$' !in classDef.type &&
            classDef.superclass != "Ljava/lang/Object;" &&
            classDef.superclass != "Landroid/content/BroadcastReceiver;"
    },
)

internal object BaseMediaPrepareMenuFingerprint : Fingerprint(
    name = "Z",
    returnType = "Z",
    parameters = listOf("Landroid/view/Menu;"),
    custom = { _, classDef ->
        classDef.sourceFile == "ActivityMediaList.java" &&
            '$' !in classDef.type &&
            classDef.superclass == "Lcom/mxtech/videoplayer/b;"
    },
)

internal object ThemeListActivityOnCreateFingerprint : Fingerprint(
    definingClass = THEME_LIST_ACTIVITY_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object ClassicThemeObserverFingerprint : Fingerprint(
    filters = listOf(
        string("Local Classic Theme"),
    ),
)

internal object AppThemeLoadFromLocalFingerprint : Fingerprint(
    definingClass = THEME_LOAD_LOCAL_CLASS,
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

internal object AppThemeLoadFromServerFingerprint : Fingerprint(
    definingClass = THEME_LOAD_SERVER_CLASS,
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

internal object SkinManagerInitFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    custom = { methodDef, classDef ->
        classDef.sourceFile == "SkinManager.java" &&
            !classDef.type.startsWith("Lcom/facebook/") &&
            '$' !in classDef.type &&
            methodDef.parameterTypes.size == 1
    },
)

internal object ThemeLightStrategyFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    custom = { _, classDef ->
        classDef.sourceFile == "ThemeLight.java" && '$' !in classDef.type
    },
)

internal object ThemeStrategyBaseFingerprint : Fingerprint(
    name = "n",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    custom = { _, classDef ->
        classDef.sourceFile == "ThemeStrategyBase.java" && '$' !in classDef.type
    },
)

internal object ResourcesSkinFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/res/Resources;"),
    custom = { _, classDef ->
        classDef.sourceFile == "ResourcesSkin.kt" && '$' !in classDef.type
    },
)

internal object AppCompatUtilsColorFilterFingerprint : Fingerprint(
    returnType = "Landroid/graphics/ColorFilter;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/graphics/drawable/Drawable;",
        "Landroid/graphics/ColorFilter;",
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "AppCompatUtils.java" && '$' !in classDef.type
    },
)

internal object ThemeListClickHandlerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/mxtech/videoplayer/ad/online/model/bean/next/OnlineResource;",
        "Lcom/mxtech/videoplayer/ad/online/model/bean/next/OnlineResource;",
        "I",
    ),
    custom = { _, classDef ->
        classDef.sourceFile == "ThemeListActivity.kt" &&
            !classDef.type.startsWith("Lcom/mxtech/") &&
            '$' !in classDef.type
    },
)

internal object TabTypeClinitFingerprint : Fingerprint(
    definingClass = TAB_TYPE_CLASS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
)

internal object CustomCodecCheckerFingerprint : Fingerprint(
    definingClass = CUSTOM_CODEC_CHECKER_CLASS,
    name = "c",
    returnType = "V",
    parameters = emptyList(),
)

internal object DecoderPrefsFragmentOnCreateFingerprint : Fingerprint(
    definingClass = DECODER_PREFS_FRAGMENT_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object DecoderPrefsCodecResetFingerprint : Fingerprint(
    definingClass = DECODER_PREFS_CODEC_LISTENER_CLASS,
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/content/DialogInterface;", "I"),
)

// endregion
