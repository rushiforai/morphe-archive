package app.riky.patches.capcut

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Central VIP gate. `SubscribeImpl.isVip()` delegates to the native
 * `VipSubscribeManager.g()` (the single source of truth for the VIP flag).
 * Forcing the Java wrapper to return true unlocks premium client-side.
 */
internal object SubscribeImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

/**
 * Alternate VIP wrapper (`PayVipImpl` implements `ISubscribe`). Forces it too
 * so every call-site that resolves the interface to this impl sees VIP.
 */
internal object PayVipImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/editor/proxy/PayVipImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

// Writer of the "isCracking" flag in SharedPreferences. Invoked by the native
// CrackingInterceptor when a modified/unofficial build is detected. No-op'ing
// it prevents the flag from ever being set (best-effort against the security
// notice; the notice may also be driven directly by the server check_risk
// response via a native-shown WebView).
internal object CrackingWriteFingerprint : Fingerprint(
    definingClass = "Lcom/vega/launcher/network/interceptors/CrackingInterceptor;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I")
)

// Entry point of the ByteDance risk SDK that shows the VerifyDialog (a WebView
// rendering the server's "app is modified / not official" notice). Returning
// true immediately prevents the dialog/callback chain from ever launching it.
internal object RiskControlExecuteFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/bdturing/verify/RiskControlService;",
    name = "execute",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(
        "Lcom/bytedance/bdturing/verify/request/AbstractRequest;",
        "Lcom/bytedance/bdturing/BdTuringCallback;"
    )
)

// Host activity that renders the "app not secure / download from official
// store" Lynx modal (channel image_lynx_global_unsafe_pkg_modal), launched via
// a capcut://main/lynx_trans?...&channel=... deep link. Finishing it on that
// channel suppresses the modal while leaving normal web pages untouched.
internal object WebActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/vega/web/WebActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// Same crack-guide modal is also hosted by the generic LynxActivity (and, by
// delegation, TransLynxActivity). Suppress it there too via the channel check.
internal object LynxActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/vega/main/LynxActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// Additional VIP/premium fingerprints
internal object LemonSubscribeImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/editor/proxy/SubscribeImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.NATIVE),
    returnType = "Z",
    parameters = listOf()
)

internal object UserVipInfoIsVipUserFingerprint : Fingerprint(
    definingClass = "Lcom/lm/components/subscribe/config/UserVipInfo;",
    name = "isVipUser",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object RetouchUserVipInfoFFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/subscribe/api/data/UserVipInfo;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object RetouchUserVipInfoOFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/subscribe/api/data/UserVipInfo;",
    name = "o",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object SubscribeImplIsVipSuspendForceFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "x",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;")
)

internal object RetouchSubscribeApiImplCFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/subscribe/impl/SubscribeApiImpl;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object RetouchSubscribeApiImplIFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/subscribe/impl/SubscribeApiImpl;",
    name = "i",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object RetouchSubscribeApiImplOFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/subscribe/impl/SubscribeApiImpl;",
    name = "o",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object BusinessManagerAFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "A",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object BusinessManagerVFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "v",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object BusinessManagerWFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "w",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Z")
)

internal object BusinessManagerXFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "x",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object BusinessManagerTFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/wrapper/BusinessManager;",
    name = "t",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/lemon/lv/clipmonetize/data/VipState;",
    parameters = listOf()
)

internal object VipStateIsAnyVIPFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/data/VipState;",
    name = "isAnyVIP",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object VegaSubscribeImplIsVipFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "isVip",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object VegaSubscribeImplGFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object VegaSubscribeImplIFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "i",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object VegaSubscribeImplLFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "l",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object VegaSubscribeImplMFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "m",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object VegaSubscribeImplPFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "p",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object VegaSubscribeImplQFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscribe/SubscribeImpl;",
    name = "q",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object UserInfoServiceVipStateFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/clipmonetize/biz/userinfoapi/UserInfoServiceServiceImpl;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Lcom/lemon/lv/clipmonetize/data/VipState;",
    parameters = listOf(),
)

internal object SubscribeFacadeIsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/xt/retouch/account/api/subscribe/SubscribeFacade;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
)

internal object WatermarkTrailerConfigInitFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/config/WatermarkTrailerConfig;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Z", "Z"),
)

internal object NoLoginDiversionPCActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/vega/ug/ui/NoLoginDiversionPCActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

internal object DiversionPCActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/vega/ug/ui/DiversionPCActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

internal object UserSubscribeInfoGetFlagFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/data/UserSubscribeInfo;",
    name = "getFlag",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object UserSubscribeInfoGetLevelFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/clipmonetize/data/UserSubscribeInfo;",
    name = "getLevel",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf()
)

internal object BaseMainActivityInitMainTab6InvokeFingerprint : Fingerprint(
    definingClass = "Lcom/vega/main/BaseMainActivity\$initMainTab\$6;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

internal object BaseMainActivityInitMainTab7InvokeFingerprint : Fingerprint(
    definingClass = "Lcom/vega/main/BaseMainActivity\$initMainTab\$7;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

internal object BaseMainActivityInitMainTab10InvokeFingerprint : Fingerprint(
    definingClass = "Lcom/vega/main/BaseMainActivity\$initMainTab\$10;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

internal object AISoundEffectAbBFingerprint : Fingerprint(
    definingClass = "Lcom/vega/edit/base/aisound/config/AISoundEffectAb;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object HomeBotBannerFragmentOnCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/vega/main/home/banner/HomeBotBannerFragment;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;"
    )
)

internal object OverseaHomeTopBannerFragmentOnCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/vega/main/home/topbar/OverseaHomeTopBannerFragment;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;"
    )
)

internal object AppLogInitFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/applog/AppLog;",
    name = "init",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/bytedance/applog/InitConfig;")
)

internal object AppLogOnEvent1Fingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/applog/AppLog;",
    name = "onEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object AppLogOnEvent2Fingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/applog/AppLog;",
    name = "onEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

internal object AppLogOnEvent3Fingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/applog/AppLog;",
    name = "onEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "J", "J")
)

internal object AppLogOnEvent4Fingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/applog/AppLog;",
    name = "onEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "J", "J", "Lorg/json/JSONObject;")
)

internal object AppLogOnEventV31Fingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/applog/AppLog;",
    name = "onEventV3",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object AppLogOnEventV32Fingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/applog/AppLog;",
    name = "onEventV3",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;")
)

internal object AppLogOnEventV33Fingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/applog/AppLog;",
    name = "onEventV3",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;")
)

internal object HeliosEnvImplInitFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/helios/sdk/HeliosEnvImpl;",
    name = "e",
    returnType = "V",
    parameters = listOf(
        "Lcom/bytedance/pumbaa/monitor/adapter/MonitorServiceImpl\$init\$1;",
        "LX/"
    ),
    custom = { method, _ ->
        // The second parameter is an obfuscated ByteDance type (e.g. LX/3Dp;)
        // whose name changes every build, so match it loosely by prefix.
        method.parameterTypes.size == 2 && method.parameterTypes[1].startsWith("LX/")
    }
)

internal object AppsFlyerAnalyticsStartFingerprint : Fingerprint(
    definingClass = "Lcom/vega/launcher/report/AppsFlyerAnalytics;",
    name = "f",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;")
)
internal object ExportHighDefinitionConfigGetEnableFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/config/ExportHighDefinitionConfig;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object SlowMotionSourceGetListFingerprint : Fingerprint(
    definingClass = "Lcom/vega/edit/speed/data/SlowMotionSource;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/List;",
    parameters = listOf()
)

internal object SmartCompleteFrameUtilIsEntryVisibleFingerprint : Fingerprint(
    definingClass = "Lcom/vega/edit/utils/SmartCompleteFrameUtil;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf()
)

internal object ComposeSubscribeActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscription/widget/ComposeSubscribeActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

/** Gate for post-export bottom banner carousel on ExportSuccessPanel. */
internal object BottomBannerHelperIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/vega/export/banner/BottomBannerHelper;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

internal object BottomBannerHelperShowFingerprint : Fingerprint(
    definingClass = "Lcom/vega/export/banner/BottomBannerHelper;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/ViewGroup;", "Landroid/view/View;", "Z")
)

/** Remote-settings gate for export campaign checkbox / join-campaign promos. */
internal object ExportCampaignEnableConfigIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/config/ExportCampaignEnableConfig;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

/** Alternate export-banner path when BottomBannerHelper gate is off (PcGuide opt entrance). */
internal object PcGuideBannerOptEntranceAbIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/lemon/lv/config/PcGuideBannerOptEntranceAb;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

/** Populates export_banner_layout carousel on the new export result page. */
internal object ResourcePositionAreaLoadResourceFingerprint : Fingerprint(
    definingClass = "Lcom/vega/export/edit/resultpage/respos/ResourcePositionArea${'$'}loadResource${'$'}1;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

internal object ImageResourcePositionAreaLoadResourceFingerprint : Fingerprint(
    definingClass = "Lcom/vega/export/edit/resultpage/respos/ImageResourcePositionArea${'$'}loadResource${'$'}1;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

/** Hides export_banner_layout as soon as ResourcePositionArea is constructed. */
internal object ResourcePositionAreaInitFingerprint : Fingerprint(
    definingClass = "Lcom/vega/export/edit/resultpage/respos/ResourcePositionArea;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Z")
)

/** Master gate for server-driven home hero promo titles (V4/V5). */
internal object HomeBackgroundHelperIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/vega/main/home/bg/HomeBackgroundHelper;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf()
)

/** Hides Pro/SSVIP diamonds on BusinessMarkView (e.g. Riduci rumore). */
internal object BusinessMarkViewRefreshFingerprint : Fingerprint(
    definingClass = "Lcom/vega/subscriptionapi/swidget/BusinessMarkView;",
    name = "j",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Z")
)
