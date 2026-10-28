package app.dieroboter.patches.world

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

private const val LITE_ACTIVITY = "Lcom/literobtop/LiteRobTopActivity;"

/**
 * The JNI bridge surface of LiteRobTopActivity (extends Cocos2dxActivity,
 * implements the AppLovin MAX listener interfaces). The native game
 * (libcocos2dcpp.so) calls these underscore-prefixed methods to drive ads;
 * every ad surface in the game funnels through them, with the whole MAX
 * mediation stack (Mintegral, BidMachine, InMobi, Unity Ads, IronSource,
 * Vungle, AdMob, Meta) behind them.
 */
object EnableBannerFingerprint : Fingerprint(
    definingClass = LITE_ACTIVITY,
    name = "_enableBanner",
    returnType = "V",
    parameters = listOf()
)

/** See [EnableBannerFingerprint]. Called by the native game to show a fullscreen interstitial. */
object ShowInterstitialFingerprint : Fingerprint(
    definingClass = LITE_ACTIVITY,
    name = "_showInterstitial",
    returnType = "V",
    parameters = listOf()
)

/** See [EnableBannerFingerprint]. The native game asks this before attempting to show an interstitial. */
object HasCachedInterstitialFingerprint : Fingerprint(
    definingClass = LITE_ACTIVITY,
    name = "_hasCachedInterstitial",
    returnType = "Z",
    parameters = listOf()
)

/**
 * LiteRobTopActivity.setupGAM()V — configures and initializes the AppLovin
 * SDK. Among other things it enables AppLovin's terms-and-privacy consent
 * flow: instruction 9 is `const/4 v2, 1`, feeding the
 * AppLovinTermsAndPrivacyPolicyFlowSettings.setEnabled(Z) call at
 * instruction 10 (verified against the 2.2.147 dex). The fingerprint's
 * methodCall filter pins that exact call so a layout change fails the match
 * instead of patching the wrong constant.
 */
object SetupGamFingerprint : Fingerprint(
    definingClass = LITE_ACTIVITY,
    name = "setupGAM",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/applovin/sdk/AppLovinTermsAndPrivacyPolicyFlowSettings;",
            name = "setEnabled"
        )
    )
)

/**
 * AppMetrica's reporter activation entry point. Its only caller in the app is
 * the Yandex mediation glue (yads/eh.invoke), so no-oping the library method
 * itself is equivalent to removing that call. Same technique as the GIF Maker
 * bundle's AppMetrica patch.
 */
object AppMetricaActivateReporterFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/AppMetrica;",
    name = "activateReporter",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lio/appmetrica/analytics/ReporterConfig;")
)

/**
 * AppRater.tryShowRateDialog(Context, String)V — the launch-counted gate
 * that shows the "Thanks for playing!" rate prompt. Its only caller is the
 * delayed BaseRobTopActivity$4 Runnable; app_launched (the launch counter)
 * is called only from BaseRobTopActivity.onCreate, and showRateDialog is
 * called only from here. All return void, nothing consumes a result. The
 * explicit rate action (BaseRobTopActivity$3.run -> openRate) is a separate
 * path.
 */
object AppRaterTryShowRateDialogFingerprint : Fingerprint(
    definingClass = "Lcom/customRobTop/AppRater;",
    name = "tryShowRateDialog",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;")
)
