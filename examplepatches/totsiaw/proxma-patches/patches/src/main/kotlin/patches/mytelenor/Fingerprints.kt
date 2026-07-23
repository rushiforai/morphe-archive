package patches.mytelenor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

private const val AD_MOB_RESPONSE_MODEL =
    "Lcom/telenor/pakistan/mytelenor/newstructure/modules/admob/models/AdMobResponseModel;"
private const val AD_MOB_DATA =
    "Lcom/telenor/pakistan/mytelenor/newstructure/modules/admob/models/Data;"
private const val ADMOB_CONFIG =
    "Lcom/telenor/pakistan/mytelenor/newstructure/modules/admob/models/AdmobConfig;"
internal const val ADMOB_SCREENS =
    "Lcom/telenor/pakistan/mytelenor/newstructure/modules/admob/models/AdmobScreens;"

/**
 * The single ad-config chokepoint on the ad controller (obfuscated `Lyq/b;->c()`).
 *
 * Name-agnostic: the controller class/method names are obfuscated (`yq/b`, `c`), but this is the only
 * method in the app that returns `AdmobScreens` while walking the cached remote ad-config:
 *   AdMobResponseModel  ->  Data  ->  AdmobConfig.getAdmobEnabled() (Boolean)
 * The model class names are the app's own stable (non-minified) types, and the three calls appear in
 * this exact order, so the fingerprint anchors on those instead of the obfuscated identifiers.
 *
 * Forcing this method to return null makes every screen getter (b()/d()/e()/getExplore) hand back null,
 * so both consuming fragments (AnswerAndWinTriviaFragment, DailyRewardsFragment) take their
 * "removeAllViews + hide container" branch and never call AdManagerInterstitialAd.load(...).
 * One chokepoint removes banners + interstitials across Daily Rewards, Home, Test Your Skills, Explore.
 */
internal val adConfigScreensFingerprint = Fingerprint(
    returnType = ADMOB_SCREENS,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        // AdMobResponseModel from the cached-config getter (obfuscated Utils/e->n()).
        methodCall(returnType = AD_MOB_RESPONSE_MODEL),
        // AdMobResponseModel -> Data (obfuscated AdMobResponseModel->a()).
        methodCall(definingClass = AD_MOB_RESPONSE_MODEL, returnType = AD_MOB_DATA),
        // AdmobConfig.getAdmobEnabled() -> Boolean (obfuscated AdmobConfig->a()); the gate that
        // decides whether ads are shown. Unique to this method.
        methodCall(definingClass = ADMOB_CONFIG, returnType = "Ljava/lang/Boolean;"),
    ),
)

// ---------------------------------------------------------------------------------------------------
// Tracker init chokepoints (blockTrackersPatch). Each is a `public ... final ()V` initializer wired
// from DaggerApplication.onCreate. Neutralizing each stops the SDK from ever starting.
// All anchors are name-agnostic: the obfuscated wrapper classes (g50/k50/h50) and the minified
// third-party classes are NEVER referenced — anchoring is on stable strings and stable SDK class names.
// ---------------------------------------------------------------------------------------------------

/**
 * Insider init launcher — obfuscated `Lg50/b;->a(Landroid/app/Application;Ljava/lang/String;L)V`
 * (`smali/classes6/g50/b.smali`, called from onCreate `m22512j`).
 *
 * This wrapper only launches a coroutine (`Lg50/b$a;`) that calls `Insider.init(...)`, so the Insider
 * SDK class is not referenced in this method itself. The stable anchor is the pair of Kotlin
 * parameter-name null-check strings ("partnerName", "notificationCallback") emitted by the Insider
 * initializer's `checkNotNullParameter` calls — this exact string pair occurs in only one method in
 * the whole app. No-opping the launcher means the coroutine is never spawned and Insider never inits.
 */
internal val insiderInitFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    // 3rd parameter (notification callback) is an obfuscated Kotlin type -> "L" (any object).
    parameters = listOf("Landroid/app/Application;", "Ljava/lang/String;", "L"),
    filters = listOf(
        string("partnerName"),
        string("notificationCallback"),
    ),
)

/**
 * TikTok Business SDK init worker — obfuscated `Lk50/a;->d(Landroid/content/Context;)V`
 * (`smali/classes6/k50/a.smali`).
 *
 * The onCreate entrypoint `Lk50/a;->c(Context)V` (`m22515m`) is only a coroutine spawner and holds no
 * SDK reference, so it has no name-agnostic anchor. The worker `d()` is where the SDK is actually
 * started: it calls `TikTokBusinessSdk.initializeSdk(TTConfig, TTInitCallback)`. Anchoring on that
 * stable SDK method (the two-arg overload is invoked from exactly this one app method) and no-opping
 * `d()` prevents initialization even though the coroutine still runs.
 */
internal val tiktokInitFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/tiktok/TikTokBusinessSdk;",
            name = "initializeSdk",
        ),
    ),
)

/**
 * Mixpanel session-replay init launcher — obfuscated `Lh50/a;->g(Landroid/app/Application;)V`
 * (`smali/classes6/h50/a.smali`, called from onCreate `m22513k`). (Recon labelled this "Contentsquare"
 * but the shipped smali is Mixpanel Session Replay: token + `MixpanelSDK` log tag.)
 *
 * The launcher builds the Mixpanel instance (`e()`) and starts session replay (`h()`). Every
 * third-party class it touches is minified (`Lcl/b;`, `Lxk/m;`, `Lyk/c$a;`) so none is a valid anchor.
 * The stable anchor is the launcher's own log string "Failed to initialize Mixpanel SDK", which is
 * unique to this method (the worker `h()` uses the distinct "...Session Replay" wording). No-opping the
 * launcher stops both the core Mixpanel instance and session replay.
 */
internal val mixpanelInitFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/app/Application;"),
    filters = listOf(
        string("Failed to initialize Mixpanel SDK"),
    ),
)

// ---------------------------------------------------------------------------------------------------
// Device-validation gate (bypassDeviceValidationPatch).
// ---------------------------------------------------------------------------------------------------

/**
 * Device-validation FAIL callback — obfuscated `Lgq/e$a$a;->a(Ljava/lang/String;)V`
 * (`smali/classes5/gq/e$a$a.smali`), the SOLE implementer of the check-callback interface `Ls50/d$b;`.
 *
 * The app runs a client-side anti-tamper/anti-root/anti-emulator/anti-Frida/anti-Xposed battery
 * (~16 checks in package `s50/`, `AbstractC19758d.a`), driven by ViewModel `gq/e`. On a re-signed /
 * patched build one of those checks trips post-login and this callback fires: it posts TRUE to the
 * FAIL LiveData (`gq/e;->c()`), whose 4 UI observers show the base64-hidden "Device validation failed"
 * toast (resource `promotion_validation_error`) and call `finishAffinity()`, killing the app. The
 * sibling `b()V` on the same class is the PASS path.
 *
 * Name-agnostic anchoring: the class (`gq/e$a$a`), ViewModel (`gq/e`) and both callback method names
 * are r8-obfuscated and change across versions. Stable anchors used here:
 *   - the Kotlin `checkNotNullParameter` null-check string literal "failedCheck" (the FAIL callback's
 *     `String` parameter name; unique in the whole APK — only this one smali file contains it), and
 *   - the failure dispatch itself: `MutableLiveData.postValue(...)`.
 * Combined with the method shape (public, returns V, single `String` param) this matches exactly the
 * one FAIL callback. The obfuscated identifiers are never referenced; the patch resolves the sibling
 * PASS method from the matched method's own defining class at patch time.
 */
internal val deviceValidationFailFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("failedCheck"),
        methodCall(definingClass = "Landroidx/lifecycle/MutableLiveData;", name = "postValue"),
    ),
)
