package app.template.patches.cricfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.checkCast
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// ============================================================================
// 1. CashRaven Residential Proxy & Background Service Fingerprints
// ============================================================================

/**
 * Matches stock `App.onCreate()V`, isolating the CashRaven bootstrap block (`android_id` read,
 * `CashRaven.Companion.createManaged`, forced `CashRaven.optIn()`, `CashRavenService.configure`,
 * and `registerActivityLifecycleCallbacks`) ahead of Koin and Firebase RemoteConfig (`cric_api2`).
 */
internal object AppOnCreateFingerprint : Fingerprint(
    definingClass = "/App;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/app/Application;",
            name = "onCreate",
        ),
        string("android_id"),
        methodCall(
            definingClass = "Lio/cashraven/sdk/CashRaven;",
            name = "optIn",
        ),
        methodCall(
            definingClass = "Landroid/app/Application;",
            name = "registerActivityLifecycleCallbacks",
        ),
        string("cric_api2"),
    ),
)

/**
 * Fallback anchor for `App.onCreate()V` when re-patching an already-patched APK or a flavor
 * distributed without CashRaven initialization.
 */
internal object AppOnCreateBaseFingerprint : Fingerprint(
    definingClass = "/App;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/app/Application;",
            name = "onCreate",
        ),
        string("cric_api2"),
    ),
)

/**
 * Matches `App.c(Context)V` — helper that starts `CashRavenService` and `AppExitGuardService`.
 */
internal object AppStartServicesFingerprint : Fingerprint(
    definingClass = "/App;",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        methodCall(
            definingClass = "Lio/cashraven/sdk/CashRaven;",
            name = "isOptedIn",
        ),
        methodCall(
            definingClass = "Lio/cashraven/sdk/CashRavenService\$Companion;",
            name = "start",
        ),
    ),
)

/**
 * Matches `AppExitGuardService.onTaskRemoved(Intent)V`, which calls `CashRavenService.Companion.stop`.
 */
internal object AppExitGuardTaskRemovedFingerprint : Fingerprint(
    definingClass = "/AppExitGuardService;",
    name = "onTaskRemoved",
    returnType = "V",
    parameters = listOf("Landroid/content/Intent;"),
)

/**
 * Matches `CashRavenService.onStartCommand(Intent, int, int)int`.
 */
internal object CashRavenServiceStartFingerprint : Fingerprint(
    definingClass = "Lio/cashraven/sdk/CashRavenService;",
    name = "onStartCommand",
    returnType = "I",
    parameters = listOf("Landroid/content/Intent;", "I", "I"),
)

/**
 * Matches `CrBootReceiver.onReceive(Context, Intent)V`.
 */
internal object CrBootReceiverFingerprint : Fingerprint(
    definingClass = "Lio/cashraven/sdk/CrBootReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;"),
)

/**
 * Matches the navigation drawer `MenuItem` click dispatcher (`xs1.a(MenuItem)Z` in v7.3)
 * on both unpatched (`IF_NE`) and already-patched (`GOTO_32`) APKs, capturing the resource ID
 * constant (`0x7f0a00b3`) for the "Bandwidth Sharing" item.
 */
internal object DrawerMenuClickHandlerFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/view/MenuItem;"),
    filters = listOf(
        string("Share app via"),
        opcode(Opcode.CONST),
        anyInstruction(
            opcode(Opcode.IF_NE, MatchAfterImmediately()),
            opcode(Opcode.GOTO_32, MatchAfterImmediately()),
        ),
        methodCall(
            definingClass = "Lio/cashraven/sdk/CashRaven;",
            name = "isOptedIn",
        ),
    ),
)

// ============================================================================
// 2. Ads, Sponsor Gates, Browser Redirects, Telegram Dialog & Marquee Fingerprints
// ============================================================================

/**
 * Matches Unity Ads `androidx.startup` initializer `AdsSdkInitializer.create(Context)V`.
 */
internal object AdsSdkInitializerFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/services/core/configuration/AdsSdkInitializer;",
    name = "create",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * Locates the central ad manager class (`Lm7;` in v7.3) via its constructor on both unpatched
 * (`IF_EQZ`) and already-patched (`GOTO_32`) APKs.
 */
internal object AdsManagerConstructorFingerprint : Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Landroid/app/Application;",
        "Landroid/content/SharedPreferences;",
        "L",
    ),
    filters = listOf(
        string("ass"),
        anyInstruction(
            opcode(Opcode.IF_EQZ),
            opcode(Opcode.GOTO_32),
        ),
        methodCall(
            definingClass = "Lcom/unity3d/ads/UnityAds;",
            name = "initialize",
        ),
    ),
)

/**
 * Matches `m7.a(int, String)Z` — decides whether `Splash` / `MainActivity` diverts navigation
 * into the `AlertNew` countdown ad activity.
 */
internal object AlertGateCheckFingerprint : Fingerprint(
    classFingerprint = AdsManagerConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("I", "Ljava/lang/String;"),
)

/**
 * Matches `m7.b()Z` — decides whether sponsor banners (`BannerLyBinding`) are displayed
 * in `BasePlayerActivity` and RecyclerView grids.
 */
internal object SponsorBannerEnabledFingerprint : Fingerprint(
    classFingerprint = AdsManagerConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        literal(4),
    ),
)

/**
 * Matches `m7.c(Context, LinearLayout)V` — inflates and loads the sponsor banner WebView/image.
 */
internal object SponsorBannerRenderFingerprint : Fingerprint(
    classFingerprint = AdsManagerConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/widget/LinearLayout;"),
)

/**
 * Matches `m7.d(Activity)V` — schedules full-screen Unity rewarded/interstitial ads.
 */
internal object UnityAdScheduleFingerprint : Fingerprint(
    classFingerprint = AdsManagerConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/unity3d/ads/UnityAds;",
            name = "load",
        ),
    ),
)

/**
 * Matches `m7.e(Context, String)V` — central external browser / ad `WebActivity` launcher.
 */
internal object AdRedirectLaunchFingerprint : Fingerprint(
    classFingerprint = AdsManagerConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

/**
 * Matches `m7.g(MainActivity, String, Function0)V` — pre-playback sponsor gate dispatcher
 * covering `sponsors[1]` (locked channel dialog), `sponsors[2]` (countdown WebActivity),
 * and `sponsors[3]` (browser redirect).
 */
internal object SponsorGateFingerprint : Fingerprint(
    classFingerprint = AdsManagerConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "/MainActivity;",
        "Ljava/lang/String;",
        "L",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/cricfytv/sports/databinding/UnlockDilaogBinding;",
            name = "inflate",
        ),
    ),
)

/**
 * Matches `MainActivity.onCreate(Bundle)V`, anchoring:
 * 0–2. The shared `NavigationView.setNavigationItemSelectedListener` + `getOnBackPressedDispatcher`
 *      sequence executed on both phone/tablet and Android TV (to remove the Bandwidth Sharing item),
 * 3–4. `dialog_alert` + `DialogTgJoinBinding.inflate` (startup Telegram join dialog),
 * 5–6. `fullTries` + `CustomAdFullBinding.inflate` (startup full-screen ad dialog).
 */
internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "/MainActivity;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/material/navigation/NavigationView;",
            name = "setNavigationItemSelectedListener",
        ),
        methodCall(
            definingClass = "Lcom/google/android/material/navigation/NavigationView;",
            name = "setNavigationItemSelectedListener",
        ),
        methodCall(
            definingClass = "Landroidx/activity/ComponentActivity;",
            name = "getOnBackPressedDispatcher",
        ),
        string("dialog_alert"),
        methodCall(
            definingClass = "Lcom/cricfytv/sports/databinding/DialogTgJoinBinding;",
            name = "inflate",
        ),
        string("fullTries"),
        methodCall(
            definingClass = "Lcom/cricfytv/sports/databinding/CustomAdFullBinding;",
            name = "inflate",
        ),
    ),
)

/**
 * Uniquely matches `bh2.N(MessageLyBinding)V` — populates the scrolling `"message"` marquee card
 * on Home, Player, and Floating Player screens and attaches its external browser redirect.
 */
internal object PromoMarqueeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/cricfytv/sports/databinding/MessageLyBinding;"),
)

// ============================================================================
// 3. Anti-Sniffer, Clone/Work-Profile, Forced-Update & Push Spam Fingerprints
// ============================================================================

/**
 * Matches `bh2.d(AppCompatActivity)Z` — scans installed packages for Base64-encoded
 * HTTP/packet capture tools (`UmVxYWJsZQ==` = Reqable, `SHR0cCBDYW5hcnk=` = Http Canary).
 */
internal object PacketSnifferCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Landroidx/appcompat/app/AppCompatActivity;"),
    filters = listOf(
        string("UmVxYWJsZQ=="),
        string("SHR0cCBDYW5hcnk="),
    ),
)

/**
 * Matches stock `Splash.onCreate(Bundle)V`, anchoring the package-name / work-profile (`"999"`) /
 * multi-account clone / packet-sniffer gate, the normal startup config fetch (`U().j()`),
 * and the Android 13+ `POST_NOTIFICATIONS` permission prompt.
 */
internal object SplashOnCreateFingerprint : Fingerprint(
    definingClass = "/Splash;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        string("com.cricfytv.sports"),
        string("999"),
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "finishAffinity",
        ),
        methodCall(
            definingClass = "this",
            parameters = emptyList(),
        ),
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "finishAffinity",
        ),
        opcode(Opcode.IF_LT),
        string("android.permission.POST_NOTIFICATIONS", MatchAfterImmediately()),
    ),
)

/**
 * Fallback anchor for `Splash.onCreate(Bundle)V` when re-patching an already-patched APK.
 */
internal object SplashOnCreateBaseFingerprint : Fingerprint(
    definingClass = "/Splash;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Matches the `Splash` startup observer lambda (`y.invoke(Object)Object` in v7.3) on both
 * unpatched (`IF_LE`) and already-patched (`GOTO_32`) APKs.
 */
internal object UpdateGateObserverFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        checkCast("/Splash;"),
        anyInstruction(
            opcode(Opcode.IF_LE),
            opcode(Opcode.GOTO_32),
        ),
        string("forceUpdate"),
        methodCall(
            definingClass = "/Splash;",
            returnType = "V",
            parameters = emptyList(),
        ),
    ),
)

/**
 * Matches stock `PushService.c(RemoteMessage)V` — preserves `type == 3` silent RemoteConfig refresh
 * (`PUSH_RC`) while anchoring the promo / `ACTION_VIEW` notification path (`"rtstv"`).
 */
internal object PushNotificationHandlerFingerprint : Fingerprint(
    definingClass = "/PushService;",
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("PUSH_RC"),
        opcode(Opcode.RETURN_VOID),
        string("rtstv"),
        string("android.intent.action.VIEW"),
    ),
)

/**
 * Fallback anchor for `PushService.c(RemoteMessage)V` when re-patching an already-truncated APK.
 */
internal object PushNotificationBaseFingerprint : Fingerprint(
    definingClass = "/PushService;",
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        string("PUSH_RC"),
        opcode(Opcode.RETURN_VOID),
    ),
)
