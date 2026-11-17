package app.zdrgon.patches.luminar.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Entitlement gate — Luminar 4.6 (versionCode 1014) ──────────────
//
// Luminar (com.skylum.luminar) sells Lifetime ($69.99 one-time,
// SKU com.skylum.luminarandroid.prime_notrial) and Yearly
// ($29.99/yr, 7-day trial, SKU ...12m_prime_7dt). The paywall is
// presented by Superwall, but Superwall is only a MIRROR: the
// source of truth is the Adapty profile, and every premium flag
// is computed locally from it by Skylum code:
//
//   AdaptyProfile -> Ls9;->d(...) / Ls57; statics (the store's own
//     ResultCallbacks Le57;/Lf57; duplicate the same derivation)
//     -> StoreProfile (Lih9;, isPremium / planType)
//     -> Lgw4;->c -> UserPaymentData (Llka;) in the Ls57; StateFlow
//     -> ~24 feature/UI readers of Llka;->c (isPremium), plus the
//        Superwall entitlement mirror (Lfm9;/Lw9;).
//
// Both derivations funnel through two pure DTO getters on the
// Adapty profile model: the premium access level is the FIRST
// access level (IDs "premium" / "premium&prime") whose isActive()
// is true, and planType is LIFETIME when that level's isLifetime()
// is true. Pinning both getters to true makes every refresh —
// startup getProfile, purchase, restore — derive isPremium=true
// and planType=LIFETIME, and the mirror follows. A third pin,
// Subscription.isActive(), additionally lights primeSku and the
// persisted has_store_prime_subscription flag. Adapty's backend
// only supplies profile data; the interpretation is this local
// code, so a server refresh cannot wash the pins out, and the
// store's persisted last-known-premium seed keeps later cold
// starts premium too.
//
// Verified against the exact 4.6 base APK (2026-11-16): all three
// getters are "public final", 1 register (v0 is the receiver; the
// pin overwrites it and returns immediately).
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality.

/** Premium access-level active flag; the derivation's entry condition. */
object AccessLevelIsActiveFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/adapty/models/AdaptyProfile\$AccessLevel;",
    name = "isActive"
)

/** Premium access-level lifetime flag; decides planType = LIFETIME. */
object AccessLevelIsLifetimeFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/adapty/models/AdaptyProfile\$AccessLevel;",
    name = "isLifetime"
)

/** Subscription active flag; lights primeSku / persisted Prime state. */
object SubscriptionIsActiveFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/adapty/models/AdaptyProfile\$Subscription;",
    name = "isActive"
)

// ── Store write points — Luminar 4.6 (round 2) ─────────────────────
//
// The getter pins above are not sufficient on a never-purchaser
// profile: if the Adapty profile carries no "premium" access-level
// entry at all, Ls9;->a / Ls57;->a return null and the derivation
// yields isPremium = false no matter what the pinned getters say
// (on-device v1.79.16: paywall stayed up, Restore Purchase did
// nothing). Round 2 therefore also forces the UserPaymentData at
// every point where one enters the store's StateFlow.
//
// Write-path census (verified 2026-11-16 against the exact 4.6
// base APK): the flow field Ls57;->c is written (iput) only in
// Ls57;-><init>, read (iget) in exactly four places, and a Llka;
// reaches the flow only wrapped in Ll47; — Ll47;-><init>(Llka;)V
// has exactly three call sites, each ending in an unconditional
// Lcd9;->k(null, wrapper) compareAndSet (StateFlowImpl skips the
// expect check for a null expect):
//   1. Ls57;->n — the sink: callers Lgw4;->c x2 (StoreProfile
//      path + the Luwa;->a startup seed), Lun8;->R, Lun8;->f0.
//      Nobody calls n through the Ln47; interface (0 sites).
//   2. Le57;->onResult — the Adapty.getProfile callback; builds
//      its Llka; itself and writes the flow directly, bypassing n.
//   3. Lf57;->onResult — the Adapty.restorePurchases callback;
//      same direct write (why Restore did nothing on device).
// Ls57;->e only reads the flow (getValue). Forcing the Llka; at
// these three points covers every producer.

/** The store sink: n(UserPaymentData, Continuation). */
object StoreSinkFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Llka;", "Lgr1;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Ls57;",
    name = "n"
)

/** Adapty getProfile callback owned by the store; direct flow write. */
object GetProfileCallbackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Le57;",
    name = "onResult"
)

/** Adapty restorePurchases callback owned by the store; direct flow write. */
object RestorePurchasesCallbackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lf57;",
    name = "onResult"
)

// ── PairIP license check — Luminar 4.6 ─────────────────────────────
//
// Stock PairIP licensecheck SDK only (no Skylum signature checks
// anywhere in the Java layer). The manifest Application is
// com.pairip.application.Application, whose attachBaseContext
// calls LicenseClient.checkLicense(Context) — the ONLY trigger in
// the app: a full-dex reference scan found zero references to
// com.pairip.* from any class outside PairIP itself. checkLicense
// binds Play's licensing service and runs the verdict state
// machine; NOT_LICENSED opens PairIP's LicenseActivity paywall.
// No-op the entry point and none of it ever starts.
//
// Verified: checkLicense is "public static", 3 registers.

/** PairIP's single entry point; no-op it and the check never runs. */
object CheckLicenseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense"
)

// ── Telemetry sinks — Luminar 4.6 ──────────────────────────────────
//
// AppsFlyer 7.0.1: AppsFlyerLib is abstract; the concrete SDK
// implementation is Lcom/appsflyer/internal/AFa1tSDK;. The app
// calls getInstance().init(key, listener, context) from
// LuminarApplication.onCreate and getInstance().start() from the
// analytics router (Lxy;->a). Pinning the implementation's init
// (return the receiver) and both start overloads (return-void)
// leaves the SDK uninitialized and never started, so its event
// sends, uninstall token and launcher-data collection never run.
//
// First-party stats: Lw29; builds the stats-api.skylum.com
// endpoints (/app/events, /app/batch-events, /app/apps-flyer,
// /app/hardware, /app/survey/vote) in a/b/c/d, which are the only
// callers of the shared static sender Lw29;->e. a and b are
// suspend functions whose bodies return Lkotlin/Unit; (the Unit
// singleton field is named "a" in this build's dex); c and d
// return Lkotlin/Unit; directly. All four are pinned to return
// Unit immediately, so stats-api is never contacted.
//
// TikTok Business SDK: initialized from LuminarApplication
// .onCreate via TikTokBusinessSdk.initializeSdk(config, callback)
// followed by startTrack() (automatic IAP event tracking was
// enabled). Both entry points are "public static"; pinning them
// (plus the single-arg initializeSdk overload) keeps the SDK
// dead — it never collects the GAID or the install referrer.
//
// Verified against the exact 4.6 base APK (2026-11-16).

/** AppsFlyer implementation init; pinned to return the receiver. */
object AppsFlyerInitFingerprint : Fingerprint(
    returnType = "Lcom/appsflyer/AppsFlyerLib;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/appsflyer/share/AppsFlyerConversionListener;",
        "Landroid/content/Context;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
    name = "init"
)

/** AppsFlyer start, no-arg overload (the one the router calls). */
object AppsFlyerStartFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
    name = "start"
)

/** AppsFlyer start, request-listener overload. */
object AppsFlyerStartListenerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/appsflyer/share/attribution/AppsFlyerRequestListener;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lcom/appsflyer/internal/AFa1tSDK;",
    name = "start"
)

/** Skylum stats sender: apps-flyer attribution event (suspend, returns Unit). */
object StatsSenderAFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Llx5;", "Lvp;", "Lfr1;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lw29;",
    name = "a"
)

/** Skylum stats sender: batch events (suspend, returns Unit). */
object StatsSenderBFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/List;", "Lkotlin/jvm/functions/Function1;", "Lgr1;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lw29;",
    name = "b"
)

/** Skylum stats sender: hardware info (returns Unit). */
object StatsSenderCFingerprint : Fingerprint(
    returnType = "Lkotlin/Unit;",
    parameters = listOf("Ljava/util/Map;", "Ll0;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lw29;",
    name = "c"
)

/** Skylum stats sender: survey vote (returns Unit). */
object StatsSenderDFingerprint : Fingerprint(
    returnType = "Lkotlin/Unit;",
    parameters = listOf("Ljava/util/Map;", "Ll0;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lw29;",
    name = "d"
)

/** TikTok SDK init, config-only overload. */
object TikTokInitializeSdkFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/tiktok/TikTokBusinessSdk\$TTConfig;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/tiktok/TikTokBusinessSdk;",
    name = "initializeSdk"
)

/** TikTok SDK init, config + callback overload (the one onCreate calls). */
object TikTokInitializeSdkCallbackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/tiktok/TikTokBusinessSdk\$TTConfig;",
        "Lcom/tiktok/TikTokBusinessSdk\$TTInitCallback;"
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/tiktok/TikTokBusinessSdk;",
    name = "initializeSdk"
)

/** TikTok event tracking start. */
object TikTokStartTrackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lcom/tiktok/TikTokBusinessSdk;",
    name = "startTrack"
)
