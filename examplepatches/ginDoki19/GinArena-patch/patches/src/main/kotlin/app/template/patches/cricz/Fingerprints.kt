package app.template.patches.cricz

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

// ============================================================================
// 1. Native Signature-Locked Decryption (`DataHelper`) & App Bootstrap
// ============================================================================

/**
 * Matches `DataHelper.<clinit>()V`, which loads `libnative-lib.so` (`DataHelper.MyApp`).
 */
internal object DataHelperClinitFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/utils/DataHelper;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("native-lib"),
    ),
)

/**
 * Matches `App.<init>()V`, which seeds fallback `pc.a` config fields (including default promo marquee text).
 */
internal object AppInitFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/app/App;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("CricZ TV, we are still working on it to provide more better result."),
    ),
)

// ============================================================================
// 2. Ads, Redirects, NanoHTTPD Banner Server, Support Gate & Promo UI
// ============================================================================

/**
 * Matches `vc.b.v(Context, App, JSONObject)pc.a`, the central `app.txt` JSON parser that populates
 * `banner_ad`, `banner_ad_action`, `supportAd`, `external_ad_*`, `player_text`, `message`, and `app_version`.
 */
internal object ParseAppConfigFingerprint : Fingerprint(
    definingClass = "Lvc/b;",
    name = "v",
    returnType = "Lpc/a;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/pro/cricztv/app/App;",
        "Lorg/json/JSONObject;",
    ),
    filters = listOf(
        string("player_text"),
        string("banner_ad"),
        string("supportAd"),
        string("external_ad_url"),
    ),
)

/**
 * Matches `vc.b.A(Context)V`, which launches external Chrome / CustomTabs popunder ads before playback.
 */
internal object LaunchExternalAdFingerprint : Fingerprint(
    definingClass = "Lvc/b;",
    name = "A",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("tv_external_ad_enabled"),
        string("external_ad_enabled"),
        string("external_ad_url"),
    ),
)

/**
 * Matches `hc.h.g()Z`, which decides whether the Events `RecyclerView` adapter injects `"adpro*"`
 * banner cards and starts the local `qc.k` (`NanoHTTPD` port `1120`) ad server.
 */
internal object MatchAdapterBannerEnabledFingerprint : Fingerprint(
    definingClass = "Lhc/h;",
    name = "g",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("<script"),
        string("*ad"),
    ),
)

/**
 * Matches `kc.k.T(h.j, String, String, int, boolean, boolean)V`, which intercepts stream opens
 * to launch the 10-second `SupportActivity` sponsor countdown gate before `PlayerActivity`.
 */
internal object OpenPlayerOrSupportGateFingerprint : Fingerprint(
    definingClass = "Lkc/k;",
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
        string("isPlayerActivity"),
        string("DataPreferences"),
        string("support_time_ms"),
        methodCall(
            definingClass = "Landroid/content/Intent;",
            name = "getBooleanExtra",
        ),
    ),
)

/**
 * Matches `mc.i.E()V` (Events home fragment setup), which binds the top scrolling promo marquee card.
 */
internal object EventsFragmentSetupFingerprint : Fingerprint(
    definingClass = "Lmc/i;",
    name = "E",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/widget/TextView;",
            name = "setSelected",
        ),
    ),
)

// ============================================================================
// 3. Activities: Notification Prompts, Telegram Dialog, Update Gates & Watermark
// ============================================================================

/**
 * Matches `SplashActivity.onCreate(Bundle)V`, isolating the Android 13+ `POST_NOTIFICATIONS` prompt.
 */
internal object SplashOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/activities/SplashActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("player_called"),
        opcode(Opcode.IF_LT),
        string("android.permission.POST_NOTIFICATIONS", location = MatchAfterImmediately()),
    ),
)

/**
 * Matches `SplashActivity.z()V`, which compares `pc.a.q` (`app_version`) against `versionCode`
 * and diverts startup to `mc.z` (forced/optional update fragment) instead of `MainActivity`/`TvActivity`.
 */
internal object SplashUpdateCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/activities/SplashActivity;",
    name = "z",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.IF_LE),
        methodCall(
            definingClass = "La7/j;",
            name = "p",
        ),
    ),
)

/**
 * Matches `MainActivity.onCreate(Bundle)V`, anchoring:
 * - `[0]` Android 13+ `POST_NOTIFICATIONS` permission check (`if-lt`),
 * - `[3]` anti-tamper crash-bomb gate (`if-eqz` after `"is_tv"`),
 * - `[4]` startup `"Join Telegram"` dialog check (`"tg_hide"` / `dialog_telegram`).
 */
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/activities/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        opcode(Opcode.IF_LT),
        string("android.permission.POST_NOTIFICATIONS", location = MatchAfterImmediately()),
        string("is_tv"),
        opcode(Opcode.IF_EQZ),
        string("tg_hide"),
    ),
)

/**
 * Matches `TvActivity.onCreate(Bundle)V`, isolating the Android 13+ `POST_NOTIFICATIONS` prompt.
 */
internal object TvActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/activities/TvActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        opcode(Opcode.IF_LT),
        string("android.permission.POST_NOTIFICATIONS", location = MatchAfterImmediately()),
    ),
)

/**
 * Matches `PlayerActivity.onCreate(Bundle)V`, where the player promo marquee card (`message_card`)
 * and `playerTxt` watermark are initialized.
 */
internal object PlayerActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/activities/PlayerActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("fromSplash"),
    ),
)

/**
 * Matches `PlayerActivity.v()V`, which intercepts back/exit navigation from deeplink playback
 * if `pc.a.q != versionCode` to show `update_fragment_container` instead of `MainActivity`.
 */
internal object PlayerActivityExitUpdateCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/activities/PlayerActivity;",
    name = "v",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("is_tv"),
        opcode(Opcode.IF_EQ),
    ),
)

// ============================================================================
// 4. Push Notifications (`PushService`)
// ============================================================================

/**
 * Matches `PushService.c(sb.o)V` (`onMessageReceived`), which displays promotional FCM notifications.
 */
internal object PushServiceMessageReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/firebase/PushService;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lsb/o;"),
)

/**
 * Matches `PushService.d()V` (`onNewToken`), which subscribes the device to the `"all"` FCM topic.
 */
internal object PushServiceNewTokenFingerprint : Fingerprint(
    definingClass = "Lcom/pro/cricztv/firebase/PushService;",
    name = "d",
    returnType = "V",
    parameters = emptyList(),
)

// ============================================================================
// 5. Root, Anti-Frida / Sniffer & MITM TrustManager Lockouts
// ============================================================================

/**
 * Matches `b8.h.r(h.j, String, qc.j, boolean)V`, which runs RootBeer (`a7.l` / `libtoolChecker.so`)
 * plus shell `getprop`/`mount`/`which su` checks and blocks network requests on rooted devices.
 */
internal object RootCheckRequestWrapperFingerprint : Fingerprint(
    definingClass = "Lb8/h;",
    name = "r",
    returnType = "V",
    parameters = listOf(
        "Lh/j;",
        "Ljava/lang/String;",
        "Lqc/j;",
        "Z",
    ),
    filters = listOf(
        opcode(Opcode.IF_EQZ),
        string("\\A"),
    ),
)

/**
 * Matches `rc.b.<clinit>()V`, which probes `System.loadLibrary` for Frida gadget names and sets
 * the `rc.b.a` / `rc.b.b` anti-tamper canary flags read by `MainActivity`.
 */
internal object SnifferDetectorClinitFingerprint : Fingerprint(
    definingClass = "Lrc/b;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("45475a704a6e5a"),
    ),
)

/**
 * Matches `rc.b.a(h.j)V`, which scans installed packages for 16 HTTP-debugging / sniffer /
 * root-patching apps and populates `App.P.K`.
 */
internal object SnifferDetectorScanFingerprint : Fingerprint(
    definingClass = "Lrc/b;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lh/j;"),
    filters = listOf(
        string("is_tv"),
    ),
)

/**
 * Matches `p4.v.O(PlayerActivity)Z`, which blocks playback with a forced-exit dialog whenever
 * `App.P.K` is non-null.
 */
internal object PlayerSnifferGateFingerprint : Fingerprint(
    definingClass = "Lp4/v;",
    name = "O",
    returnType = "Z",
    parameters = listOf("Lcom/pro/cricztv/activities/PlayerActivity;"),
    filters = listOf(
        string("VImZIF=="),
    ),
)

/**
 * Matches `qc.b.checkClientTrusted(X509Certificate[], String)V`, which throws `CertificateException("cHJvX2lzX3Bybw==")`
 * if any certificate SubjectDN mentions HttpCanary, SSLCapture, or Packet Capture.
 */
internal object TrustManagerCheckClientFingerprint : Fingerprint(
    definingClass = "Lqc/b;",
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
 * Matches `qc.b.checkServerTrusted(X509Certificate[], String)V`, which throws `CertificateException("cHJvX2lzX3Bybw==")`
 * if any certificate SubjectDN mentions HttpCanary, SSLCapture, or Packet Capture.
 */
internal object TrustManagerCheckServerFingerprint : Fingerprint(
    definingClass = "Lqc/b;",
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

/**
 * Matches `androidx.fragment.app.e.c(String, boolean)V` (`SplashActivity` `app.txt` callback),
 * isolating the `ka.c.G(externalFilesDir)` wipe and `"cHJvX2lzX3Bybw=="` permanent error lockout.
 */
internal object SplashCallbackErrorTrapFingerprint : Fingerprint(
    definingClass = "Landroidx/fragment/app/e;",
    name = "c",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
    ),
    filters = listOf(
        string("app_versions"),
        methodCall(
            definingClass = "Lka/c;",
            name = "G",
        ),
        string("cHJvX2lzX3Bybw=="),
        opcode(Opcode.IF_NEZ),
    ),
)
