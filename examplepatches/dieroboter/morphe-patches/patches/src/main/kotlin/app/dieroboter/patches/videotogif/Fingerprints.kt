package app.dieroboter.patches.videotogif

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

private const val PREMIUM_HELPER_PREFS = "Lcom/zipoapps/premiumhelper/a;"
private const val TOTO_MANAGER = "Lcom/zipoapps/premiumhelper/toto/TotoManager;"

/**
 * PremiumHelper 5.3.2's isPremium() — method i()Z on the SDK's SharedPreferences
 * facade (file "premium_helper_data"). Returns true when the persisted
 * "has_active_purchase" flag is set, otherwise falls back to the reviewer-mode
 * state flow in Lxa/H. Every user-facing premium decision in the SDK routes
 * through this method: banner ads (com.zipoapps.ads.banner), interstitials
 * (fa/h), splash routing (PHSplashActivity), paywall screens (xa/y, xa/z),
 * relaunch offers (Ua/h) and premium support.
 *
 * The class/method names are R8-obfuscated but stable for this exact build;
 * the "has_active_purchase" string is unique to this method.
 */
object IsPremiumFingerprint : Fingerprint(
    definingClass = PREMIUM_HELPER_PREFS,
    name = "i",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("has_active_purchase")
    )
)

/**
 * The UMP consent request itself: Ga/h.e(Activity, Continuation) builds the
 * ConsentRequestParameters and calls ConsentInformation.requestConsentInfoUpdate.
 * Both consent entry flows (startup Ga/b, ads-init wrapper Ga/h.b) funnel into it.
 */
object ConsentRequestFingerprint : Fingerprint(
    definingClass = "LGa/h;",
    name = "e",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/app/Activity;", "Ljc/c;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/ump/ConsentInformation;",
            name = "requestConsentInfoUpdate"
        )
    )
)

/**
 * The rate-dialog source gate: Ba/c.l(Ta/k;)Z reads PH_ALLOWED_RATE_DIALOG_SOURCES
 * and decides whether a rate prompt may be shown for a given source. Its only
 * callers are the two rate-prompt drivers (Qa/i.a, Ta/q.c).
 */
object RateDialogGateFingerprint : Fingerprint(
    definingClass = "LBa/c;",
    name = "l",
    returnType = "Z",
    parameters = listOf("LTa/k;"),
    filters = listOf(
        string("PH_ALLOWED_RATE_DIALOG_SOURCES")
    )
)

/** TotoManager.initToto(Continuation) — registers the app-start listener that drives the whole Toto cycle. */
object TotoInitFingerprint : Fingerprint(
    definingClass = TOTO_MANAGER,
    name = "initToto",
    returnType = "Ljava/lang/Object;"
)

/** TotoManager.postConfig(Continuation) — posts device/config data to the Toto backend (also called by PostConfigWorker). */
object TotoPostConfigFingerprint : Fingerprint(
    definingClass = TOTO_MANAGER,
    name = "postConfig",
    returnType = "Ljava/lang/Object;"
)

/** TotoManager.registerFcmToken(String, Continuation) — registers the FCM token for promotional pushes. */
object TotoRegisterFcmTokenFingerprint : Fingerprint(
    definingClass = TOTO_MANAGER,
    name = "registerFcmToken",
    returnType = "Ljava/lang/Object;"
)

/** TotoManager.scheduleRegister(Z)V — schedules TotoRegisterWorker; called from the billing layer on purchase events. */
object TotoScheduleRegisterFingerprint : Fingerprint(
    definingClass = TOTO_MANAGER,
    name = "scheduleRegister",
    returnType = "V",
    parameters = listOf("Z")
)

/**
 * The Singular SDK's only init call site in the app: the PremiumHelper
 * SingularManager coroutine na/e.invokeSuspend calls Singular.init(Context, SingularConfig).
 */
object SingularInitFingerprint : Fingerprint(
    definingClass = "Lna/e;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/singular/sdk/Singular;",
            name = "init"
        )
    )
)

/**
 * AppMetrica's reporter activation entry point. Its only caller in the app is the
 * Yandex mediation glue (yads/eh.invoke), so no-oping the library method itself is
 * equivalent to removing that call — done this way in 1.3.1 because instruction
 * removal inside eh.invoke was the prime suspect for the 1.3.0 splash crash.
 */
object AppMetricaActivateReporterFingerprint : Fingerprint(
    definingClass = "Lio/appmetrica/analytics/AppMetrica;",
    name = "activateReporter",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lio/appmetrica/analytics/ReporterConfig;")
)

/**
 * The settings screen's "Rate us" row: RateUsPreference's real constructor.
 * The row is defined in res/xml/ph_settings.xml (key pref_rate_us) and merely
 * looked up by the settings fragment, so the prompt gate in Ba/c.l never
 * controlled it; hiding it in the constructor (Preference.setVisible, obfuscated
 * to x(Z)V in this build) removes it from the screen.
 */
object RateUsPreferenceConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/zipoapps/premiumhelper/ui/preferences/common/RateUsPreference;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;")
)

/**
 * HomeFactory.a() — builds the home screen bottom bar tool list
 * [HOME_TOOL_RATE, HOME_TOOL_SETTING, HOME_TOOL_FEEDBACK/PREMIUM] as a
 * filled-new-array of L4/j$b. L4/j has this single method; the
 * Aa/I.b([Ljava/lang/Object;) call that wraps the array anchors it.
 */
object HomeToolsFingerprint : Fingerprint(
    definingClass = "LL4/j;",
    name = "a",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "LAa/I;",
            name = "b"
        )
    )
)
