package app.template.patches.onedm

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode

internal const val BROWSER_APP = "Lacr/browser/lightning/app/BrowserApp;"
internal const val LIFECYCLE_LISTENER = "Lacr/browser/lightning/app/ActivityLifecycleListener;"
internal const val MYAPP = "Lacr/browser/lightning/activity/MyAppCompatActivity;"
internal const val BROWSER_ACTIVITY = "Lacr/browser/lightning/activity/BrowserActivity;"
internal const val BANNER_MANAGER = "Lacr/browser/lightning/view/BannerManager;"
internal const val ACR_BANNER_VIEW = "Lacr/browser/lightning/view/BannerView;"
internal const val MAIN_ACTIVITY = "Lidm/internet/download/manager/MainActivity;"
internal const val MAIN_ACTIVITY_FRAGMENT = "Lidm/internet/download/manager/MainActivity\$a;"
internal const val AMAZON_SERVICE = "Lidm/internet/download/manager/amazon/AmazonService;"
internal const val CHECK_APP_VERSION = "Lidm/internet/download/manager/CheckAppVersion;"
internal const val LEGACY_START_PAGE = "Lacr/browser/lightning/constant/StartPage2;"
internal const val SPONSORED_SHORTCUT = "Li/fc;"
internal const val TORRENT_DETAILS = "Lidm/internet/download/manager/TorrentDetails;"
internal const val APPODEAL_BANNER_VIEW = "Lidm/internet/download/manager/AppodealBannerView;"
internal const val IDM_BANNER_VIEW = "Lidm/internet/download/manager/BannerView;"
internal const val NEW_BANNER_VIEW = "Lidm/internet/download/manager/manager/NewBannerView;"
internal const val MAX_HEIGHT_LINEAR_LAYOUT = "Lidm/internet/download/manager/MaxHeightLinearLayout;"
internal const val BANNER_INFO = "Lcom/aspsine/multithreaddownload/core/BannerInfo;"
internal const val PP0 = "Li/pp0;"
internal const val D82 = "Li/d82;"
internal const val X90 = "Li/x90;"
internal const val CONTEXT = "Landroid/content/Context;"
internal const val INTENT = "Landroid/content/Intent;"
internal const val DIALOG_INTERFACE = "Landroid/content/DialogInterface;"
internal const val DISMISS_LISTENER = "Lacr/browser/lightning/view/DismissListener;"

// region App-level ad initialization and banner gates (non-obfuscated app classes)

object MyAppIsShowBannerFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "isShowBanner",
    returnType = "Z",
    parameters = emptyList()
)

object MyAppLoadBannerAdFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "loadBannerAd",
    returnType = "V",
    parameters = emptyList()
)

object MyAppIsShowConsentAndInitializeAdsFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "isShowConsentAndInitializeAds",
    returnType = "Z",
    parameters = emptyList()
)

object MyAppInitializeConsentAndAdsFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "initializeConsentAndAds",
    returnType = "Z",
    parameters = listOf("Ljava/lang/Runnable;")
)

object MyAppInitializeAdsAndRunFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "initializeAdsAndRun",
    returnType = "V",
    parameters = listOf("Ljava/lang/Runnable;")
)

object MyAppStartBannerManagerFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "startBannerManager",
    returnType = "V",
    parameters = emptyList()
)

object MyAppShowBannerAdFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "showBannerAd",
    returnType = "V",
    parameters = emptyList()
)

object MyAppShowBannerAdIfNecessaryFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "showBannerAdIfNecessary",
    returnType = "V",
    parameters = emptyList()
)

object BrowserIsShowBannerFingerprint : Fingerprint(
    definingClass = BROWSER_ACTIVITY,
    name = "isShowBanner",
    returnType = "Z",
    parameters = emptyList()
)

object BrowserIsShowConsentAndInitializeAdsFingerprint : Fingerprint(
    definingClass = BROWSER_ACTIVITY,
    name = "isShowConsentAndInitializeAds",
    returnType = "Z",
    parameters = emptyList()
)

object MainIsShowBannerFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "isShowBanner",
    returnType = "Z",
    parameters = emptyList()
)

object MainIsShowConsentAndInitializeAdsFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "isShowConsentAndInitializeAds",
    returnType = "Z",
    parameters = emptyList()
)

object TorrentDetailsIsShowBannerFingerprint : Fingerprint(
    definingClass = TORRENT_DETAILS,
    name = "isShowBanner",
    returnType = "Z",
    parameters = emptyList()
)

object AmazonServiceIsInitializedFingerprint : Fingerprint(
    definingClass = AMAZON_SERVICE,
    name = "isInitialized",
    returnType = "Z",
    parameters = emptyList()
)

object AmazonServiceHasAdFingerprint : Fingerprint(
    definingClass = AMAZON_SERVICE,
    name = "hasAd",
    returnType = "Z",
    parameters = listOf("F")
)

object AmazonServiceStartFingerprint : Fingerprint(
    definingClass = AMAZON_SERVICE,
    name = "start",
    returnType = "V",
    parameters = listOf("Z")
)

object AmazonServiceFetchFingerprint : Fingerprint(
    definingClass = AMAZON_SERVICE,
    name = "fetch",
    returnType = "V",
    parameters = emptyList()
)

// endregion

// region House/fallback banners & nag prompts

object BannerManagerLoadFingerprint : Fingerprint(
    definingClass = BANNER_MANAGER,
    name = "load",
    returnType = "V",
    parameters = listOf("Z")
)

object BannerManagerResumeFingerprint : Fingerprint(
    definingClass = BANNER_MANAGER,
    name = "resume",
    returnType = "V",
    parameters = emptyList()
)

object BannerManagerPostAdFingerprint : Fingerprint(
    definingClass = BANNER_MANAGER,
    name = "postAd",
    returnType = "V",
    parameters = emptyList()
)

object BannerManagerRepostAdFingerprint : Fingerprint(
    definingClass = BANNER_MANAGER,
    name = "repostAd",
    returnType = "V",
    parameters = emptyList()
)

object BannerManagerSetNetworkAdShowingAndNotifyFingerprint : Fingerprint(
    definingClass = BANNER_MANAGER,
    name = "setNetworkAdShowingAndNotify",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Z")
)

object BannerManagerGetCurrentAdFingerprint : Fingerprint(
    definingClass = BANNER_MANAGER,
    name = "getCurrentAd",
    returnType = BANNER_INFO,
    parameters = emptyList()
)

object AcrBannerViewSetupAdViewFingerprint : Fingerprint(
    definingClass = ACR_BANNER_VIEW,
    name = "setupAdView",
    returnType = "V",
    parameters = emptyList()
)

object AcrBannerViewSetAdFingerprint : Fingerprint(
    definingClass = ACR_BANNER_VIEW,
    name = "setAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/Integer;", BANNER_INFO)
)

object AcrBannerViewOnAdReceivedFingerprint : Fingerprint(
    definingClass = ACR_BANNER_VIEW,
    name = "onAdReceived",
    returnType = "V",
    parameters = listOf("Lacr/browser/lightning/view/DefaultBannerCallback;")
)

object IdmBannerViewOnFinishInflateFingerprint : Fingerprint(
    definingClass = IDM_BANNER_VIEW,
    name = "onFinishInflate",
    returnType = "V",
    parameters = emptyList()
)

object NewBannerViewOnFinishInflateFingerprint : Fingerprint(
    definingClass = NEW_BANNER_VIEW,
    name = "onFinishInflate",
    returnType = "V",
    parameters = emptyList()
)

object AppodealBannerViewSetVisibilityFingerprint : Fingerprint(
    definingClass = APPODEAL_BANNER_VIEW,
    name = "setVisibility",
    returnType = "V",
    parameters = listOf("I")
)

object AppodealBannerViewSetVisibilitySuperFingerprint : Fingerprint(
    definingClass = APPODEAL_BANNER_VIEW,
    name = "setVisibilitySuper",
    returnType = "V",
    parameters = listOf("I")
)

/**
 * Resolves the obfuscated SQLite fallback banner adapter (`Li/l82;` in 20.0) by its
 * stable `getTag() == "FallbackNetwork"` implementation.
 */
object FallbackNetworkTagFingerprint : Fingerprint(
    name = "getTag",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("FallbackNetwork")
)

/**
 * Resolves the daily house-banner SQLite sync helper invoked by `CheckAppVersion`
 * (`BannerInfo` remote ad feed).
 */
object HouseBannerSyncFingerprint : Fingerprint(
    definingClass = "Li/x73;",
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;"
    ),
    strings = listOf(",")
)

/**
 * Resolves `rate_me_maybe`'s startup gate (`Li/gl5;` in 20.0), which otherwise performs
 * main-thread `PackageManager` IPC + synchronous `SharedPreferences.Editor.commit()` `fsync`
 * on every `MainActivity.onCreate()` and displays "Rate 1DM" nag dialogs.
 */
object RateMeMaybeShouldShowFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("PREF_DONT_SHOW_AGAIN", "com.android.vending")
)

// endregion

// region Obfuscated Appodeal/mediation entry points.
// These intentionally use stable SDK calls and descriptors instead of the obfuscated method names.

object OmInitializeFingerprint : Fingerprint(
    definingClass = "Li/om;",
    returnType = "V",
    parameters = listOf(MYAPP, PP0),
    filters = listOf(
        methodCall(
            smali = "Lcom/appodeal/ads/Appodeal;->initialize(Landroid/content/Context;Ljava/lang/String;ILcom/appodeal/ads/initializing/ApdInitializationCallback;)V"
        )
    )
)

object OmCacheFingerprint : Fingerprint(
    definingClass = "Li/om;",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            smali = "Lcom/appodeal/ads/Appodeal;->cache(Landroid/app/Activity;I)V"
        )
    )
)

object OmInterstitialFingerprint : Fingerprint(
    definingClass = "Li/om;",
    returnType = "V",
    parameters = listOf(MYAPP, "Ljava/lang/Runnable;"),
    filters = listOf(
        methodCall(
            definingClass = "Li/b0;",
            name = "<init>",
            parameters = listOf("Li/om;", "Ljava/lang/Runnable;", MYAPP),
            returnType = "V"
        )
    )
)

object OmCanShowFingerprint : Fingerprint(
    definingClass = "Li/om;",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            smali = "Lcom/appodeal/ads/Appodeal;->isLoaded(I)Z"
        )
    )
)

object OmShowWrappersFingerprint : Fingerprint(
    definingClass = "Li/om;",
    returnType = "Z",
    parameters = listOf(MYAPP),
    filters = listOf(
        methodCall(
            definingClass = "Li/nm;",
            name = "<init>",
            parameters = listOf("Li/om;", MYAPP, "I"),
            returnType = "V"
        )
    )
)

// In the official 20.0 base this central helper is Li/x73; (it was Li/y73; in the 20.1 beta).
object CentralFullScreenHelperFingerprint : Fingerprint(
    definingClass = "Li/x73;",
    isStatic = true,
    returnType = "V",
    parameters = listOf(MYAPP, D82, X90),
    filters = listOf(
        methodCall(
            smali = "Lcom/appodeal/ads/Appodeal;->show(Landroid/app/Activity;I)Z"
        )
    )
)

object CentralNetworkBannerHelperFingerprint : Fingerprint(
    definingClass = "Li/x73;",
    isStatic = true,
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Landroid/view/View;"),
    filters = listOf(
        methodCall(
            definingClass = "Li/j5;",
            name = "<init>",
            parameters = listOf("Landroid/app/Activity;", "I"),
            returnType = "V"
        )
    )
)

object Pp0BannerResumeFingerprint : Fingerprint(
    definingClass = PP0,
    returnType = "V",
    parameters = listOf(MYAPP),
    filters = listOf(
        checkCast("Ljava/util/ArrayList;"),
        methodCall(definingClass = "Li/x6;")
    )
)

object Pp0FullScreenSelectorFingerprint : Fingerprint(
    definingClass = PP0,
    returnType = "Z",
    parameters = listOf(MYAPP, D82, "Ljava/lang/Runnable;")
)

object Pp0RefreshTimerFingerprint : Fingerprint(
    definingClass = PP0,
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            smali = "Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V"
        )
    )
)

// endregion

// region Cold-start, lifecycle, startup task, and background-timer fingerprints

object BrowserAppInitAppFingerprint : Fingerprint(
    definingClass = BROWSER_APP,
    name = "initApp",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;", CONTEXT)
)

object LifecycleOnActivityCreatedFingerprint : Fingerprint(
    definingClass = LIFECYCLE_LISTENER,
    name = "onActivityCreated",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Landroid/os/Bundle;")
)

object LifecycleOnActivityResumedFingerprint : Fingerprint(
    definingClass = LIFECYCLE_LISTENER,
    name = "onActivityResumed",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;")
)

object LifecycleOnActivityDestroyedFingerprint : Fingerprint(
    definingClass = LIFECYCLE_LISTENER,
    name = "onActivityDestroyed",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;")
)

object LifecycleOnStateChangedFingerprint : Fingerprint(
    definingClass = LIFECYCLE_LISTENER,
    name = "onStateChanged",
    returnType = "V",
    parameters = listOf("L", "L")
)

/**
 * Matches `MainActivity`'s blocking cold-start worker (`Li/d34;` in 20.0), which spawns
 * `:CheckAppVersion`, subscribes to Firebase promo topics (`notify` / `notify_v2`), and
 * initializes the download database.
 */
object MainStartupTaskDoInBackgroundFingerprint : Fingerprint(
    name = "doInBackground",
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    strings = listOf("notify_v2")
)

object MainActivityOnPauseFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onPause",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Matches the R8-merged `TimerTask`/`Runnable` dispatcher (`Li/q6;` in 20.0) that hosts
 * `MainActivity`'s 1 Hz UI-refresh loop, `BannerView` animations, and `pp0`'s ad waterfall timer.
 */
object RunnableDispatcherRunFingerprint : Fingerprint(
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        checkCast(MAIN_ACTIVITY),
        checkCast(IDM_BANNER_VIEW),
        checkCast(PP0)
    )
)

// endregion

// region Refinements: sale subtitle, drawer upgrade footer, empty banner container

object MainActivityOnCreateNavUpgradeFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        resourceLiteral(ResourceType.ID, "nav_upgrade"),
        methodCall(
            definingClass = "Landroidx/appcompat/app/AppCompatActivity;",
            name = "findViewById",
            parameters = listOf("I"),
            returnType = "Landroid/view/View;",
            location = MatchAfterImmediately()
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately())
    )
)

object MainActivityTitleFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    returnType = "L",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "update_app"),
        resourceLiteral(ResourceType.STRING, "idm_plus_on_sale")
    )
)

object MaxHeightConstructorTwoArgsFingerprint : Fingerprint(
    definingClass = MAX_HEIGHT_LINEAR_LAYOUT,
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;")
)

object MaxHeightConstructorThreeArgsFingerprint : Fingerprint(
    definingClass = MAX_HEIGHT_LINEAR_LAYOUT,
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I")
)

object MaxHeightOnMeasureFingerprint : Fingerprint(
    definingClass = MAX_HEIGHT_LINEAR_LAYOUT,
    name = "onMeasure",
    returnType = "V",
    parameters = listOf("I", "I")
)

// endregion

// region v2.0.0 device-test follow-ups: downloads-home promo bar and browser sponsored tiles

/**
 * The obfuscated updater for the `offer_vpnLL` strip in the downloads fragment. Its boolean
 * argument is the app's own force-hide switch; with false it can display the VPN offer or the
 * other promotional messages identified by the string resources below.
 */
object MainActivityPromoBarFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_FRAGMENT,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "install_shoppers_search_desc"),
        resourceLiteral(ResourceType.STRING, "info_help_telegram"),
        resourceLiteral(ResourceType.STRING, "vpn_offer_x")
    )
)

/**
 * Modern browser start page: `StartPage.getHomepage()` includes a database BannerInfo entry
 * as a sponsored shortcut tile only when this returns true (adType == 1). User-created tiles
 * are stored separately by StartPageShortcutStore and rendered by homepage.js.
 */
object BannerInfoIsTileAdFingerprint : Fingerprint(
    definingClass = BANNER_INFO,
    name = "isTileAd",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Legacy/simple browser start page. The two getIconCss calls receive the first and second
 * remotely configured sponsored-shortcut objects immediately before the HTML is assembled;
 * both the CSS helper and the later link rendering explicitly handle null objects.
 */
object LegacyStartPageHomepageFingerprint : Fingerprint(
    definingClass = LEGACY_START_PAGE,
    name = "getHomepage",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = LEGACY_START_PAGE,
            name = "getIconCss",
            parameters = listOf(SPONSORED_SHORTCUT),
            returnType = "Ljava/lang/String;",
            opcode = Opcode.INVOKE_STATIC
        ),
        methodCall(
            definingClass = LEGACY_START_PAGE,
            name = "getIconCss",
            parameters = listOf(SPONSORED_SHORTCUT),
            returnType = "Ljava/lang/String;",
            opcode = Opcode.INVOKE_STATIC
        )
    )
)

// endregion

// region Browser preset settings and one-time setup prompts

private val BROWSER_SETTINGS_LOADER_STRINGS = listOf(
    "search",
    "search_inc",
    "suggestions_choice",
    "suggestions_choice_inc",
    "rv_img_srch",
    "rv_img_srch_inc",
    "SUGGESTION_GOOGLE"
)

/**
 * The obfuscated 1DM settings loader used when the settings singleton is created or
 * reloaded. It is matched by its descriptor and persisted keys, not by its obfuscated
 * class or method name.
 */
object BrowserSettingsLoaderFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf(CONTEXT),
    strings = BROWSER_SETTINGS_LOADER_STRINGS
)

/**
 * The parallel settings loader used for import/reload. In 20.0 it receives the already
 * decoded settings-map wrapper as its second argument and applies the same fallback
 * rules as [BrowserSettingsLoaderFingerprint].
 */
object BrowserSettingsImportLoaderFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf(CONTEXT, "L"),
    strings = BROWSER_SETTINGS_LOADER_STRINGS
)

/**
 * BrowserActivity's setup-prompt chain (`cas_shown`, `csmss_shown`, `cabs_shown_n`).
 * Matched directly via `"csmss_shown"` without scanning the resource table.
 */
object BrowserActivityOnCreateSetupPromptsFingerprint : Fingerprint(
    definingClass = BROWSER_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf("csmss_shown")
)

/**
 * BrowserActivity's "Set as default browser" prompt builder (`cdbs_shown`).
 */
object BrowserActivityShowDefaultBrowserPromptFingerprint : Fingerprint(
    definingClass = BROWSER_ACTIVITY,
    name = "showDefaultBrowserCheckoutDialog",
    returnType = "V",
    parameters = listOf(INTENT)
)

/**
 * Dismiss listener for the "Set as default browser" prompt (`cdbs_shown`).
 */
object DefaultBrowserPromptDismissFingerprint : Fingerprint(
    superclass = DISMISS_LISTENER,
    name = "onDialogDismiss",
    returnType = "V",
    parameters = listOf(DIALOG_INTERFACE),
    strings = listOf("cdbs_shown")
)

/**
 * Dismiss listener for the "Checkout Accessibility settings..." prompt (`cas_shown`).
 */
object AccessibilityPromptDismissFingerprint : Fingerprint(
    superclass = DISMISS_LISTENER,
    name = "onDialogDismiss",
    returnType = "V",
    parameters = listOf(DIALOG_INTERFACE),
    strings = listOf("cas_shown")
)

/**
 * Dismiss listener for the "Setup shortcut menu strip..." prompt (`csmss_shown`).
 */
object ShortcutMenuStripPromptDismissFingerprint : Fingerprint(
    superclass = DISMISS_LISTENER,
    name = "onDialogDismiss",
    returnType = "V",
    parameters = listOf(DIALOG_INTERFACE),
    strings = listOf("csmss_shown")
)

/**
 * Dismiss listener for the "Setup adblocker..." prompt (`cabs_shown_n`).
 */
object AdblockerPromptDismissFingerprint : Fingerprint(
    superclass = DISMISS_LISTENER,
    name = "onDialogDismiss",
    returnType = "V",
    parameters = listOf(DIALOG_INTERFACE),
    strings = listOf("cabs_shown_n")
)

// endregion

// region Cold-start, Recents persistence & AdBlocker / Userscript Cloud Sync

/**
 * `MainActivity.onBackPressed()` calls `m3524(false, false)` at the fallthrough exit path,
 * which broadcasts `action_main_app_stopped` to `:DownloadService`, calls `finishAndRemoveTask()`
 * (erasing 1DM from Android Recents), and executes `Process.killProcess(myPid())`.
 */
object MainActivityOnBackPressedFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onBackPressed",
    returnType = "V",
    parameters = emptyList()
)

internal const val ADBLOCKER_SETTINGS_INFO =
    "Lcom/aspsine/multithreaddownload/util/AdblockerSettingsInfo;"
internal const val ADBLOCKER_LIST_SOURCE =
    "Lcom/aspsine/multithreaddownload/util/AdblockerListSource;"
internal const val ADBLOCKER_SOURCE_MGMT_ACTIVITY =
    "Lacr/browser/lightning/activity/AdblockerSourceManagementActivity;"
internal const val ADBLOCKER_SOURCE_MGMT_INIT_DATA =
    "Lacr/browser/lightning/activity/AdblockerSourceManagementActivity\$InitData;"
internal const val USER_SCRIPT =
    "Lidm/internet/download/manager/userscript/UserScript;"
internal const val ATOMIC_REFERENCE =
    "Ljava/util/concurrent/atomic/AtomicReference;"
internal const val ATOMIC_INTEGER =
    "Ljava/util/concurrent/atomic/AtomicInteger;"

/**
 * Default AdBlocker settings constructor (`enableAutoUpdate = false`, `filterAutoUpdateIntervalInDays = 7`).
 */
object AdblockerSettingsInfoInitFingerprint : Fingerprint(
    definingClass = ADBLOCKER_SETTINGS_INFO,
    name = "<init>",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Base UI activity `onCreate(Bundle)`, invoked strictly in the UI process right as
 * `BrowserApp.initApp(Application, Context)` completes.
 */
object MyAppOnCreateFingerprint : Fingerprint(
    definingClass = MYAPP,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

/**
 * `Hosts & filters` (`AdblockerSourceManagementActivity`) background database loader.
 */
object AdblockerSourceManagementGetSourcesFingerprint : Fingerprint(
    definingClass = ADBLOCKER_SOURCE_MGMT_ACTIVITY,
    name = "getSourcesFromDataBase",
    returnType = "Ljava/util/List;",
    parameters = listOf(ATOMIC_INTEGER)
)

/**
 * `AdblockerSourceManagementActivity$InitData.doInBackground` (`abau_shown` / `cabs_shown_n`),
 * anchoring the `w53` cached flag and `uc1` Tray boolean setter.
 */
object AdblockerSourceManagementInitDataFingerprint : Fingerprint(
    definingClass = ADBLOCKER_SOURCE_MGMT_INIT_DATA,
    strings = listOf("abau_shown", "cabs_shown_n")
)

/**
 * `Hosts & filters` Update Filters dialog entry point.
 */
object AdblockerSourceManagementShowUpdateDialogFingerprint : Fingerprint(
    definingClass = ADBLOCKER_SOURCE_MGMT_ACTIVITY,
    name = "showUpdateFiltersDialog",
    returnType = "V",
    parameters = listOf("Ljava/util/Collection;", "Z", "Z", "Z")
)

/**
 * Binary AdBlocker engine validator (`Li/j12;->...(Context)Z`), which anchors `Li/j12;`
 * without colliding with `Lyads/j12;` in `classes3.dex`.
 */
object AdblockBinaryEngineValidateFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Z",
    parameters = listOf(CONTEXT),
    strings = listOf("ab_filter_compile.lock", "abnfp.bin", "abcfp.bin", ".bak")
)

/**
 * Settings persistence setter for `abf_auto_download_last_run_new` (`Li/w53;->...(J)V`).
 */
object SettingsSetAdblockLastUpdatedFingerprint : Fingerprint(
    isStatic = false,
    returnType = "V",
    parameters = listOf("J"),
    strings = listOf("abf_auto_download_last_run_new")
)

/**
 * `CheckAppVersion` filter rebuild worker (`ab_rebuild_wanted` + `ACTION_REFRESH_ADBLOCK`),
 * which references `Li/a61;` singleton + `getAllSources(AtomicInteger)ArrayList`.
 */
object CheckAppVersionAdblockRebuildFingerprint : Fingerprint(
    definingClass = CHECK_APP_VERSION,
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("ab_rebuild_wanted", "intent.action.ACTION_REFRESH_ADBLOCK")
)

/**
 * `CheckAppVersion` scheduled AdBlocker auto-update check (`local_1dmfv` / `srv_1dmfv` / `abfauis`).
 */
object CheckAppVersionAdblockUpdateFingerprint : Fingerprint(
    definingClass = CHECK_APP_VERSION,
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("local_1dmfv", "srv_1dmfv", "abfauis")
)

/**
 * `CheckAppVersion` scheduled Userscript auto-update check (`us_update_last_run`).
 */
object CheckAppVersionUserscriptUpdateFingerprint : Fingerprint(
    definingClass = CHECK_APP_VERSION,
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("us_update_last_run")
)

/**
 * `UserScriptManager` (`Li/ug7;`) SQLite constructor (`userscripts.db`).
 */
object UserscriptManagerInitFingerprint : Fingerprint(
    superclass = "Landroid/database/sqlite/SQLiteOpenHelper;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(CONTEXT),
    strings = listOf("userscripts.db", "userscript_data_prefs.xml")
)

/**
 * Per-script update fetcher (`Li/kh7;`), called by both background auto-update
 * and manual "Check for update" (`Li/mf7;`).
 */
object UserscriptSingleUpdateCheckFingerprint : Fingerprint(
    isStatic = true,
    returnType = USER_SCRIPT,
    parameters = listOf(CONTEXT, USER_SCRIPT, "L", ATOMIC_REFERENCE),
    strings = listOf("Missing userscript update metadata", ".meta.js")
)

// endregion

