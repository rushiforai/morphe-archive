package app.template.patches.sktech

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

// ============================================================================
// 1. Native Signature-Locked Decryption (`DataHelper`) & App Bootstrap
// ============================================================================
//
// SK Tech TV is a sibling fork of CricZ TV — same signing certificate,
// same DataHelper architecture, same encrypted-config pipeline. Every
// fingerprint below was verified instruction-by-instruction against the
// audited SK Tech TV 2.7 (versionCode 17) DEX.
// ============================================================================

/** Class constants — single source of truth for the patch. */
internal const val SKTECH_DATA_HELPER_CLASS = "Lcom/live/sktechtv/utils/DataHelper;"
internal const val SKTECH_APPLICATION_CLASS = "Lcom/live/sktechtv/app/ProApplication;"
internal const val SKTECH_CONFIG_CLASS = "Lmc/a;"
internal const val SKTECH_CONFIG_PARSER_CLASS = "Lsc/b;"

/**
 * Matches `DataHelper.<clinit>()V`, which loads `libnative-lib.so`.
 * CricZ equivalent: `DataHelperClinitFingerprint` (same structure).
 */
internal object DataHelperClinitFingerprint : Fingerprint(
    definingClass = SKTECH_DATA_HELPER_CLASS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("native-lib"),
    ),
)

/**
 * Matches the native declaration `DataHelper.AppData(Context, String)[B`.
 *
 * CricZ equivalent: `DataHelper.MyApp(Context, String)[B` — same signature,
 * just renamed `MyApp` → `AppData`. The native implementation is the
 * signer-pinned response decoder called before Java AES fallbacks.
 */
internal object DataHelperAppDataFingerprint : Fingerprint(
    definingClass = SKTECH_DATA_HELPER_CLASS,
    name = "AppData",
    returnType = "[B",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
    ),
)

// ============================================================================
// 2. Ads, Redirects, Support Gate & Promo UI
// ============================================================================

/**
 * Matches `sc.b.s(Context, ProApplication, JSONObject)Lmc/a;`, the central
 * `app.txt` JSON parser that populates `banner_ad`, `banner_ad_action`,
 * `supportAd`, `external_ad_*`, and `app_version`.
 *
 * CricZ equivalent: `ParseAppConfigFingerprint` matching `vc.b.v(...)Lpc/a;`.
 */
internal object ParseAppConfigFingerprint : Fingerprint(
    definingClass = SKTECH_CONFIG_PARSER_CLASS,
    name = "s",
    returnType = SKTECH_CONFIG_CLASS,
    parameters = listOf(
        "Landroid/content/Context;",
        SKTECH_APPLICATION_CLASS,
        "Lorg/json/JSONObject;",
    ),
    filters = listOf(
        string("app_version"),
        string("banner_ad"),
        string("supportAd"),
        string("external_ad_url"),
    ),
)

/**
 * Matches `sc.b.w(Context)V`, which launches external Chrome / CustomTabs
 * popunder ads before playback (reads `tv_external_ad_enabled` /
 * `external_ad_enabled` SharedPreferences).
 *
 * CricZ equivalent: `LaunchExternalAdFingerprint` matching `vc.b.A(Context)V`.
 */
internal object LaunchExternalAdFingerprint : Fingerprint(
    definingClass = SKTECH_CONFIG_PARSER_CLASS,
    name = "w",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("tv_external_ad_enabled"),
        string("external_ad_enabled"),
        string("external_ad_url"),
    ),
)

// ============================================================================
// 3. Activities: Notification Prompts, Update Gates & Watermark
// ============================================================================

/**
 * Matches `SplashActivity.onCreate(Bundle)V`, isolating the Android 13+
 * `POST_NOTIFICATIONS` prompt.
 *
 * CricZ equivalent: `SplashOnCreateFingerprint`.
 */
internal object SplashOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/live/sktechtv/activities/SplashActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        opcode(Opcode.IF_LT),
        string("android.permission.POST_NOTIFICATIONS", location = MatchAfterImmediately()),
    ),
)

/**
 * Matches `SplashActivity.A()V`, the real update gate: it compares the
 * remote-config `app_version` (`mc.a.r`) against the installed versionCode
 * and diverts startup to an update fragment when they differ, otherwise it
 * launches `MainActivity` / `TvActivity`.
 *
 * Note: `SplashActivity.z(String)V` is only the config-load error/retry
 * handler (it resets the `api_host` preference and counts retries) — it is
 * NOT an update check, despite superficial similarity to CricZ's layout.
 */
internal object SplashUpdateGateFingerprint : Fingerprint(
    definingClass = "Lcom/live/sktechtv/activities/SplashActivity;",
    name = "A",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * Matches `MainActivity.onCreate(Bundle)V`, anchoring:
 * - `[0]` Android 13+ `POST_NOTIFICATIONS` permission check (`if-lt`),
 * - `[3]` anti-tamper crash-bomb gate (`if-eqz` after `"is_tv"`),
 *
 * Note: SK Tech TV does NOT have a Telegram promo popup (verified — no
 * `tg_hide` / `tg_dialog` strings in app code). The CricZ `[4]` tg_hide
 * anchor is therefore absent here; the corresponding patch block is
 * also removed from `CleanExperiencePatch.kt`.
 *
 * CricZ equivalent: `MainActivityOnCreateFingerprint` (without the tg_hide filter).
 */
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/live/sktechtv/activities/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        opcode(Opcode.IF_LT),
        string("android.permission.POST_NOTIFICATIONS", location = MatchAfterImmediately()),
        string("is_tv"),
        opcode(Opcode.IF_EQZ),
    ),
)

/**
 * Matches `PlayerActivity.w()V`, which intercepts back/exit navigation from
 * deeplink playback if `mc.a.r != versionCode` to show an update fragment
 * instead of `MainActivity`.
 *
 * CricZ equivalent: `PlayerActivityExitUpdateCheckFingerprint` matching
 * `PlayerActivity.v()V`.
 */
internal object PlayerActivityExitUpdateCheckFingerprint : Fingerprint(
    definingClass = "Lcom/live/sktechtv/activities/PlayerActivity;",
    name = "w",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("is_tv"),
        opcode(Opcode.IF_EQ),
    ),
)

/**
 * Matches `WebActivity.onCreate(Bundle)V` — the in-app WebView activity.
 *
 * SK Tech TV uses WebActivity as a generic WebView host. It is not directly
 * an ad surface in the stock app, but remote `app.txt` config could redirect
 * it to ad landing pages. The `disableWebActivity` option stubs onCreate to
 * immediately `finish()` the activity, preventing any remote-config-driven
 * WebView ad from rendering.
 *
 * No CricZ equivalent — WebActivity is unique to SK Tech TV.
 */
internal object WebActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/live/sktechtv/activities/WebActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

// ============================================================================
// 4. Push Notifications (`PushService`)
// ============================================================================

/**
 * Matches `PushService.c(sb.q)V` (`onMessageReceived`), which displays
 * promotional FCM notifications.
 *
 * CricZ equivalent: `PushServiceMessageReceivedFingerprint`.
 * Parameter type `Lsb/q;` verified against the audited 2.7 (17) DEX.
 */
internal object PushServiceMessageReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/live/sktechtv/firebase/PushService;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lsb/q;"),
)

/**
 * Matches `PushService.d()V` (`onNewToken`), which subscribes the device
 * to the `"all"` FCM topic.
 *
 * CricZ equivalent: `PushServiceNewTokenFingerprint`.
 */
internal object PushServiceNewTokenFingerprint : Fingerprint(
    definingClass = "Lcom/live/sktechtv/firebase/PushService;",
    name = "d",
    returnType = "V",
    parameters = emptyList(),
)

// ============================================================================
// 5. Root, Anti-Frida / Sniffer & MITM TrustManager Lockouts
// ============================================================================
//
// All classes below are 1:1 mirrors of CricZ equivalents — same canary
// strings, same hex Frida tags, same TrustManager delegate pattern.
// ============================================================================

/**
 * Matches `oc.b.<clinit>()V`, which probes `System.loadLibrary` for Frida
 * gadget names and sets the `oc.b.a` / `oc.b.b` anti-tamper canary flags
 * read by `MainActivity`.
 *
 * CricZ equivalent: `SnifferDetectorClinitFingerprint` matching `rc.b.<clinit>`.
 * Same `45475a704a6e5a` hex Frida tag.
 */
internal object SnifferDetectorClinitFingerprint : Fingerprint(
    definingClass = "Loc/b;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("45475a704a6e5a"),
    ),
)

/**
 * Matches `oc.b.a(Lh/j;)V`, which scans installed packages for 16
 * HTTP-debugging / sniffer / root-patching apps and populates
 * `ProApplication.G` (the detected sniffer-package label field).
 *
 * CricZ equivalent: `SnifferDetectorScanFingerprint` matching `rc.b.a(h.j)`.
 */
internal object SnifferDetectorScanFingerprint : Fingerprint(
    definingClass = "Loc/b;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lh/j;"),
    filters = listOf(
        string("is_tv"),
    ),
)

/**
 * Matches `nc.a.checkClientTrusted(X509Certificate[], String)V`, which throws
 * `CertificateException("cHJvX2lzX3Bybw==")` if any certificate SubjectDN
 * mentions HttpCanary, SSLCapture, or Packet Capture.
 *
 * CricZ equivalent: `TrustManagerCheckClientFingerprint` matching `qc.b.checkClientTrusted`.
 * Same `SHR0cENhbmFyeQ==` (HttpCanary) and `cHJvX2lzX3Bybw==` (pro_is_pro) canary strings.
 */
internal object TrustManagerCheckClientFingerprint : Fingerprint(
    definingClass = "Lnc/a;",
    name = "checkClientTrusted",
    returnType = "V",
    parameters = listOf(
        "[Ljava/security/cert/X509Certificate;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        string("SHR0cENhbmFyeQ=="),
        string("cHJvX2lzX3Bybw=="),
    ),
)

/**
 * Matches `nc.a.checkServerTrusted(X509Certificate[], String)V`.
 *
 * CricZ equivalent: `TrustManagerCheckServerFingerprint` matching `qc.b.checkServerTrusted`.
 */
internal object TrustManagerCheckServerFingerprint : Fingerprint(
    definingClass = "Lnc/a;",
    name = "checkServerTrusted",
    returnType = "V",
    parameters = listOf(
        "[Ljava/security/cert/X509Certificate;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        string("SHR0cENhbmFyeQ=="),
        string("cHJvX2lzX3Bybw=="),
    ),
)

// ============================================================================
// 6. Support-Activity Sponsor Gate & RootBeer (added in the refined pack)
// ============================================================================

/**
 * Matches `jc.j.T(Lh/j;, String, String, I, Z, Z)V`, the player-launch
 * dispatcher that diverts through the timed `SupportActivity` sponsor
 * screen when the remote `supportAd` URL is set and the reopen interval
 * has elapsed, and otherwise opens `PlayerActivity` / `FloatingPlayer`
 * directly.
 *
 * CricZ equivalent: `OpenPlayerOrSupportGateFingerprint` matching `kc.k.T(...)`.
 */
internal object OpenPlayerOrSupportGateFingerprint : Fingerprint(
    definingClass = "Ljc/j;",
    name = "T",
    returnType = "V",
    parameters = listOf(
        "Lh/j;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "I",
        "Z",
        "Z",
    ),
    filters = listOf(
        string("DataPreferences"),
        string("support_time_ms"),
    ),
)

/**
 * Matches `a7.k.d()Z`, the obfuscated RootBeer aggregate root check
 * (su binaries, root-management apps, dangerous props, native bridge).
 */
internal object RootBeerCheckFingerprint : Fingerprint(
    definingClass = "La7/k;",
    name = "d",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("ro.debuggable"),
    ),
)

/**
 * Matches `RootBeerNative.<clinit>()V`, which loads `libtoolChecker.so`.
 */
internal object RootBeerNativeClinitFingerprint : Fingerprint(
    definingClass = "Lcom/scottyab/rootbeer/RootBeerNative;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("toolChecker"),
    ),
)

/**
 * Matches the native RootBeer bridge `checkForRoot([Ljava/lang/Object;)I`.
 */
internal object RootBeerNativeCheckFingerprint : Fingerprint(
    definingClass = "Lcom/scottyab/rootbeer/RootBeerNative;",
    name = "checkForRoot",
    returnType = "I",
    parameters = listOf("[Ljava/lang/Object;"),
)
