package app.template.patches.esexplorer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// ============================================================================
// ES File Explorer Fingerprint Definitions
// Supports v4.4.2.2.1, v4.4.3.5, v4.4.3.7, and older v4.2.1.3.a architectures
// ============================================================================

// ── 1. VIP & LICENSE FINGERPRINTS ───────────────────────────────────────────

internal val IsVipFingerprint = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_BOOLEAN,
            definingClass = "Lcom/estrongs/android/pop/TestActivity;",
        ),
    ),
)

internal val IsLifetimeFingerprint = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(
        string("wx_pay_forever"),
    ),
)

internal val VipExpireTimeFingerprint = Fingerprint(
    returnType = "J",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    classFingerprint = IsVipFingerprint,
)

internal val SignatureCheckFingerprint = Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("3079a983587b13f6861dedfb6fad5502"),
    ),
)

internal val SuppressAlertPrefFingerprint = Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("not_show_falsified_alert"),
    ),
)

internal val AccountInfoIsVipFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/account/model/AccountInfo;",
    name = "getIsVip",
    returnType = "Z",
    parameters = emptyList(),
)

// v4.4.2.x: ESAccountManager is not obfuscated
internal val ESAccountManagerIsLoggedFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/account/util/ESAccountManager;",
    name = "isLogged",
    returnType = "Z",
    parameters = emptyList(),
)

// v4.4.3.x: ESAccountManager obfuscated to 'b'
private const val ES_ACCOUNT_MANAGER_OBFUSCATED = "Lcom/estrongs/android/pop/app/account/util/b;"

internal val LegacyAccountLoginFingerprint = Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == ES_ACCOUNT_MANAGER_OBFUSCATED && method.name == "t"
    },
)

// Legacy v4.2.1.3.a IAP targets
internal val OldPremiumSkuSubscriptionFingerprint = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(string("es_premium_sku")),
)

internal val OldPremiumSkuInAppFingerprint = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(string("es_premium_sku_inapp")),
)

internal val OldSuppressAlertPrefFingerprint = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(string("not_show_falsified_alert")),
)

internal val OldFexApplicationKFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/FexApplication;",
    name = "K",
    returnType = "Z",
    parameters = emptyList(),
)

// ── 2. AD BLOCKING FINGERPRINTS ─────────────────────────────────────────────

internal val AdEntranceTryShowAdFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/cn/AdEntrance;",
    name = "tryShowAd",
    returnType = "V",
)

internal val AdManagerShowInterAdFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/cn/AdManager;",
    name = "showInteractionAd",
    returnType = "V",
)

internal val AdManagerShowPlayerInterAdFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/cn/AdManager;",
    name = "showPlayerInterAd",
    returnType = "V",
)

internal val PlayerAdControlCanShowPauseAdFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/cn/player/PlayerAdControl;",
    name = "canShowVideoPauseAd",
    returnType = "Z",
    parameters = emptyList(),
)

internal val PlayerAdControlCanLoadPauseAdFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/cn/player/PlayerAdControl;",
    name = "canLoadVideoPauseAd",
    returnType = "Z",
    parameters = emptyList(),
)

internal val PlayerAdControlIsInterAdFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/cn/player/PlayerAdControl;",
    name = "isInterAd",
    returnType = "Z",
    parameters = emptyList(),
)

internal val NativeAdConfigGetConfigFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/config/NativeAdConfigProvider;",
    name = "getConfig",
    returnType = "Lorg/json/JSONObject;",
    parameters = emptyList(),
)

internal val VideoAdConfigGetConfigFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/config/VideoAdConfigProvider;",
    name = "getConfig",
    returnType = "Lorg/json/JSONObject;",
    parameters = emptyList(),
)

internal val ChargeSaverAdConfigGetConfigFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/config/ChargeSaverAdConfigProvider;",
    name = "getConfig",
    returnType = "Lorg/json/JSONObject;",
    parameters = emptyList(),
)

// ── 3. TRACKING & TELEMETRY FINGERPRINTS ────────────────────────────────────

internal val UMConfigureInitFingerprint = Fingerprint(
    definingClass = "Lcom/umeng/commonsdk/UMConfigure;",
    name = "init",
    returnType = "V",
)

internal val UMConfigurePreInitFingerprint = Fingerprint(
    definingClass = "Lcom/umeng/commonsdk/UMConfigure;",
    name = "preInit",
    returnType = "V",
)

internal val MobclickAgentOnEventFingerprint = Fingerprint(
    definingClass = "Lcom/umeng/analytics/MobclickAgent;",
    name = "onEvent",
    returnType = "V",
)

internal val FexAppInitStatusReportFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/FexApplication;",
    name = "initStatusRerport",
    returnType = "V",
    parameters = emptyList(),
)

internal val FexAppReportInstallSourceFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/FexApplication;",
    name = "reportEsInstallSource",
    returnType = "V",
    parameters = emptyList(),
)

internal val AdReportActionFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/cn/AdReport;",
    name = "reportAction",
    returnType = "V",
)

internal val AdReportGeneralFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/ad/cn/AdReport;",
    name = "report",
    returnType = "V",
)

// ── 4. LIGHTWEIGHT & FAST LAUNCH FINGERPRINTS ───────────────────────────────

internal val SplashLoadThirdPartyAdFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/openscreenad/NewSplashActivity;",
    name = "loadThirdPartyAd",
    returnType = "V",
    parameters = emptyList(),
)

internal val HomeBackSplashCreateFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/openscreenad/HomeBackSplashActivity;",
    name = "onCreate",
    returnType = "V",
)

internal val PremiumSplashCreateFingerprint = Fingerprint(
    definingClass = "Lcom/estrongs/android/pop/app/openscreenad/PremiumSplashActivity;",
    name = "onCreate",
    returnType = "V",
)

