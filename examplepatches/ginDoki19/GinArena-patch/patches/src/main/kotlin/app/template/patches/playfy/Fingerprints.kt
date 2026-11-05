package app.template.patches.playfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

// ============================================================================
// Playfy TV 1.7 (versionCode 8) fingerprints.
//
// Every fingerprint below was verified instruction-by-instruction against
// the audited stock `classes.dex`. The patch is pinned to this exact build;
// a mismatch aborts patching instead of producing a broken app.
// ============================================================================

/** Class constants — single source of truth for the patch. */
internal const val PLAYFY_APP_CLASS = "Lcom/playfy/tv/App;"
internal const val PLAYFY_NINTYMIN_CLASS = "Lcom/playfy/tv/helpers/NintyMin;"
internal const val PLAYFY_SPLASH_ACTIVITY_CLASS = "Lcom/playfy/tv/activities/SplashActivity;"
internal const val PLAYFY_MAIN_ACTIVITY_CLASS = "Lcom/playfy/tv/activities/MainActivity;"
internal const val PLAYFY_PLAYER_ACTIVITY_CLASS = "Lcom/playfy/tv/activities/PlayerActivity;"
internal const val PLAYFY_APPDATA_CLASS = "Lkd/f;"
internal const val PLAYFY_SPLASH_CALLBACK_CLASS = "Lfd/c0;"
internal const val PLAYFY_ADS_MANAGER_CLASS = "Lid/h;"
internal const val PLAYFY_SNIFFER_CLASS = "Lcf/m;"

// ============================================================================
// 1. Native signature-locked decoders (`NintyMin`)
// ============================================================================

/**
 * Matches `NintyMin.<clinit>()V`, which loads `libumairi-lib.so` and
 * `libnative-lib.so` — the two signer-pinned native config decoders.
 */
internal object NintyMinClinitFingerprint : Fingerprint(
    definingClass = PLAYFY_NINTYMIN_CLASS,
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("native-lib"),
        string("umairi-lib"),
    ),
)

/** Matches the native declaration `NintyMin.ohMyNo(String, Context)String`. */
internal object NintyMinOhMyNoFingerprint : Fingerprint(
    definingClass = PLAYFY_NINTYMIN_CLASS,
    name = "ohMyNo",
    returnType = "Ljava/lang/String;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Landroid/content/Context;",
    ),
)

/** Matches the native declaration `NintyMin.ohMyYes(String, String, Context)String`. */
internal object NintyMinOhMyYesFingerprint : Fingerprint(
    definingClass = PLAYFY_NINTYMIN_CLASS,
    name = "ohMyYes",
    returnType = "Ljava/lang/String;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Landroid/content/Context;",
    ),
)

// ============================================================================
// 2. Splash flow: signer gate, update gate, blocked-apps gate
// ============================================================================

/**
 * Matches `fd.c0.invoke(Object)Object`, the splash config-success callback.
 * It contains all three startup gates patched by this bundle:
 *  - the signer check (server `sig` vs runtime SHA-1 of the signing cert),
 *  - the forced-update version comparison,
 *  - the "blocked apps installed" uninstall-dialog gate.
 */
internal object SplashConfigCallbackFingerprint : Fingerprint(
    definingClass = PLAYFY_SPLASH_CALLBACK_CLASS,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("com.playfy.tv"),
        string("SHA"),
    ),
)

/** Matches `SplashActivity.onCreate(Bundle)V` (notification-permission prompt anchor). */
internal object SplashOnCreateFingerprint : Fingerprint(
    definingClass = PLAYFY_SPLASH_ACTIVITY_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        opcode(Opcode.IF_LT),
        string("android.permission.POST_NOTIFICATIONS", location = MatchAfterImmediately()),
    ),
)

/** Matches `SplashActivity.W()V` — installs the downloaded update APK. */
internal object SplashInstallUpdateFingerprint : Fingerprint(
    definingClass = PLAYFY_SPLASH_ACTIVITY_CLASS,
    name = "W",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("application/vnd.android.package-archive"),
    ),
)

/** Matches `SplashActivity.X()V` — requests the unknown-sources permission for updates. */
internal object SplashUnknownSourcesFingerprint : Fingerprint(
    definingClass = PLAYFY_SPLASH_ACTIVITY_CLASS,
    name = "X",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("android.settings.MANAGE_UNKNOWN_APP_SOURCES"),
    ),
)

// ============================================================================
// 3. Ads (Unity Ads wrapper `id.h` + player pre-roll)
// ============================================================================

/**
 * Matches `id.h.<init>(Context, xf.c, SharedPreferences)V`, which parses the
 * remote ads config and calls `UnityAds.initialize(...)`.
 */
internal object AdsManagerConstructorFingerprint : Fingerprint(
    definingClass = PLAYFY_ADS_MANAGER_CLASS,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lxf/c;",
        "Landroid/content/SharedPreferences;",
    ),
    filters = listOf(
        string("ads"),
        string("UmV3YXJkZWRfQW5kcm9pZA=="),
    ),
)

/**
 * Matches `id.h.b(I, String)Z` — the "should show sponsor/full-banner gate
 * now" decision (placement enabled + frequency cap). Both the splash
 * `FullBannerActivity` gate and the player `SponsorActivity` gate consult it.
 */
internal object AdsShouldShowFingerprint : Fingerprint(
    definingClass = PLAYFY_ADS_MANAGER_CLASS,
    name = "b",
    returnType = "Z",
    parameters = listOf(
        "I",
        "Ljava/lang/String;",
    ),
)

/**
 * Matches `id.h.c(String, I, I, Z)Z` — the per-placement frequency-cap
 * check underneath `b`. `MainActivity` also calls it directly for the
 * external-link gate shown before the player, so stubbing `b` alone is
 * not enough to make playback open directly.
 */
internal object AdsCooldownFingerprint : Fingerprint(
    definingClass = PLAYFY_ADS_MANAGER_CLASS,
    name = "c",
    returnType = "Z",
    parameters = listOf(
        "Ljava/lang/String;",
        "I",
        "I",
        "Z",
    ),
)

/**
 * Matches `id.h.d(LinearLayout)V` — renders the in-app banner (WebView
 * HTML banner or image banner) into the given container.
 */
internal object AdsBannerFingerprint : Fingerprint(
    definingClass = PLAYFY_ADS_MANAGER_CLASS,
    name = "d",
    returnType = "V",
    parameters = listOf("Landroid/widget/LinearLayout;"),
    filters = listOf(
        string("AndroidInterface"),
    ),
)

/**
 * Matches `PlayerActivity.onCreate(Bundle)V`, anchoring the Unity Ads
 * pre-roll call (`UnityAds.show`) executed when playback opens.
 */
internal object PlayerOnCreateFingerprint : Fingerprint(
    definingClass = PLAYFY_PLAYER_ACTIVITY_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Matches `MainActivity.onCreate(Bundle)V`, anchoring the startup Telegram
 * join dialog gate. Stock reads the `tgd` boolean preference; a false value
 * is the state written by the dialog's "don't show again" action and skips
 * inflating `DialogTgJoinBinding` for that launch.
 */
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = PLAYFY_MAIN_ACTIVITY_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("tgd"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
            parameters = listOf("Ljava/lang/String;", "Z"),
            returnType = "Z",
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ, MatchAfterImmediately()),
        methodCall(
            definingClass = "Lcom/playfy/tv/databinding/DialogTgJoinBinding;",
            name = "inflate",
        ),
    ),
)

// ============================================================================
// 4. Push notifications & sniffer-app check
// ============================================================================

/**
 * Matches `App.onCreate()V`. Stock immediately requests the Firebase
 * Messaging component here; when push removal deletes that component's
 * registrar, this call must be skipped or the process crashes before the
 * splash activity can start.
 */
internal object AppOnCreateFingerprint : Fingerprint(
    definingClass = PLAYFY_APP_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("baseUrl"),
        string("https://google.com"),
    ),
)

/**
 * Matches `PushService.c(ic.r)V` (`onMessageReceived`), which displays
 * promotional FCM notifications. Parameter type `Lic/r;` verified against
 * the audited 1.7 (8) DEX.
 */
internal object PushServiceMessageReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/playfy/tv/helpers/PushService;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lic/r;"),
)

/**
 * Matches `cf.m.b(Activity)Z` — the sniffer/capture-app detector. It scans
 * installed packages against a built-in list (HTTP capture tools) and the
 * splash flow refuses to load content when one is present.
 */
internal object SnifferCheckFingerprint : Fingerprint(
    definingClass = PLAYFY_SNIFFER_CLASS,
    name = "b",
    returnType = "Z",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("UmVxYWJsZQ=="),
    ),
)
