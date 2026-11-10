package app.zdrgon.patches.diskwala.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Premium status production point — DiskWala 27.3 ───────────────────
//
// DiskWala's subscriptions run through RevenueCat (paywall packages
// $rc_monthly / $rc_three_month / $rc_annual). The app never reads
// RevenueCat's CustomerInfo directly: a census of all 9 dexes shows ZERO
// entitlement reads outside the RevenueCat SDK and one mapper in the
// app's billing manager (classes3.dex):
//
//   Lu5/f;->j(Lcom/revenuecat/purchases/CustomerInfo;)Lu5/b;
//     Lu5/b = PremiumStatus(isPremium:Z, expiresAtMs:Long?,
//                           activeEntitlementIds:List)
//
// Every production of a PremiumStatus from store data goes through that
// one static mapper: the purchase flow, restore, the scheduled premium
// refresh, log-in, and RevenueCat's UpdatedCustomerInfoListener all call
// it. The resulting status is bridged into the session manager (Lo5/d),
// which holds premium as local StateFlows, persists "premium_until" in
// DataStore, and — once a true status lands via Lo5/d;->j(Z, Long) —
// refuses later downgrades. All feature gates (ads, downloads,
// streaming, file names) read that local session state; nothing asks a
// server when the app decides whether Premium is on, and no entitlement
// or feature data is served by a DiskWala backend (the only DiskWala
// hosts in the binary are diskwala.com deep links).
//
// The "tied to the device" paywall line is the RevenueCat app user ID:
// no ANDROID_ID / hardware-ID check exists in the app's own code.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// the dex record for the mapper is PUBLIC | STATIC (0x9), 5 registers.

/** The single CustomerInfo -> PremiumStatus mapper. Pinning it pins the app. */
object PremiumStatusMapperFingerprint : Fingerprint(
    returnType = "Lu5/b;",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    definingClass = "Lu5/f;",
    name = "j"
)

// ── PairIP license funnel (classes2.dex) — launch fix, 2026-11-03 ─────
//
// Mapped from the 27.3 dex after bundle v1.52.0 failed on-device (app
// lands on Play's "Get this app from Play" page):
//
// The manifest Application is PairIP's com.pairip.application
// .Application; its attachBaseContext body is, in order:
//   invoke-static VMRunner.setContext(ctx)
//   invoke-static SignatureCheck.verifyIntegrity(ctx)
//   invoke-static LicenseClient.checkLicense(ctx)
//   invoke-super  Application.attachBaseContext(ctx)
//   return-void
// checkLicense has exactly TWO call sites in the whole app — that
// method and LicenseContentProvider.onCreate, and LicenseContentProvider
// is NOT declared in the manifest (12 providers, all standard SDK
// inits), so the provider entry is inert.
//
// checkLicense posts getInstance(ctx).initializeLicenseCheck() to the
// main thread. initializeLicenseCheck switches on the static
// licenseCheckState (enum order: CHECK_REQUIRED 0, FULL_CHECK_OK 1,
// LOCAL_CHECK_OK 2, LOCAL_CHECK_REPORTED 3, REPEATED_CHECK_REQUIRED 4;
// <clinit> seeds CHECK_REQUIRED). The local installer branch is DEAD
// in this build: localCheckEnabled's encoded initial value is false
// and no instruction in any dex writes it (the field is read exactly
// once, in initializeLicenseCheck). So CHECK_REQUIRED falls through
// to initiateFreshLicensingServiceConnection(false) ->
// bindToLicensingService(false), which binds com.android.vending's
// ILicensingService and sends a LicenseCheckV2 request
// (binder transaction 2) with an ILicenseV2ResultListener.
// LicenseClient$2.verifyLicense forwards the answer to
// processResponse(code, bundle):
//   0 LICENSED     -> state FULL_CHECK_OK (or REPEATED_CHECK_REQUIRED)
//   2 NOT_LICENSED -> startPaywallActivity(): LicenseActivity opens
//                     with activitytype=PAYWALL and the service's
//                     PAYWALL_INTENT PendingIntent — the Play Store
//                     listing, i.e. the "Get this app from Play"
//                     block page Matsen hit. Play answers
//                     NOT_LICENSED for a re-signed, non-Play install.
//   other          -> LicenseCheckException -> handleError ->
//                     startErrorDialogActivity (same activity,
//                     activitytype=ERROR_DIALOG).
// handleTrialEnd is a third trigger (resets state to CHECK_REQUIRED
// and binds afresh); its only caller chain is the caller-less
// TrialClient facade.
//
// The v1.52.0 "Change installer source" companion DID rewrite
// LicenseClient.performLocalInstallerCheck's own
// getInstallingPackageName call site (Desktop audit of the published
// bundle: 21 of 22 installer-getter sites rewritten, the one miss an
// unused TikTok SDK read) — it changed nothing because
// performLocalInstallerCheck is never called: the branch that calls
// it is gated on the never-enabled localCheckEnabled flag.
// Access flags below are verified against the 27.3 classes2.dex.

/**
 * Lcom/pairip/application/Application;->attachBaseContext — PROTECTED
 * (0x0004) in the 27.3 dex; the only attachBaseContext in the class.
 * Its body contains no const-strings, so the match rests on class +
 * name + signature + exact access flags.
 */
object PairipApplicationAttachFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PROTECTED),
)

/**
 * LicenseClient.checkLicense(Landroid/content/Context;)V — PUBLIC
 * STATIC (0x0009); both strings are in the 27.3 method body.
 */
object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    strings = listOf("Cannot check license with null context.", "Skipping license check in isolated process."),
)

/**
 * LicenseClient.initializeLicenseCheck()V — PUBLIC (0x0001); no
 * const-strings in the body; the only method of its name in the class.
 */
object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

/**
 * LicenseClient.handleTrialEnd()V — PROTECTED (0x0004); its log string
 * is in the 27.3 method body.
 */
object HandleTrialEndFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "handleTrialEnd",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PROTECTED),
    strings = listOf("Trial end event triggered; initiating full license check."),
)

/**
 * LicenseClient.processResponse(ILandroid/os/Bundle;)V — PRIVATE
 * (0x0002), the licensing-service verdict handler; both strings are
 * in the 27.3 method body.
 */
object ProcessResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    strings = listOf("License check succeeded.", "PAYWALL_INTENT"),
)

/**
 * LicenseClient.startPaywallActivity(Landroid/app/PendingIntent;)V —
 * PRIVATE (0x0002); both strings are in the 27.3 method body.
 */
object StartPaywallActivityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startPaywallActivity",
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    strings = listOf("paywallintent", "activitytype"),
)

/**
 * LicenseClient.startErrorDialogActivity()V — PRIVATE (0x0002); its
 * "activitytype" extra string is in the 27.3 method body.
 */
object StartErrorDialogActivityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
    strings = listOf("activitytype"),
)

/**
 * LicenseClient.scheduleAppShutdown()V — PRIVATE (0x0002); no
 * const-strings in the body; the only method of its name in the class.
 */
object ScheduleAppShutdownFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "scheduleAppShutdown",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
)

/**
 * LicenseClient$1.run()V — PUBLIC (0x0001); the exitAction Runnable
 * whose whole 27.3 body is System.exit(0); no const-strings.
 */
object ExitActionFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient\$1;",
    name = "run",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

/**
 * LicenseActivity.onStart()V — PUBLIC (0x0001); the activity declares
 * no onCreate, onStart is its only display entry; both strings are in
 * the 27.3 method body.
 */
object LicenseActivityOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "onStart",
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    strings = listOf("activitytype", "Couldn't process license activity correctly."),
)
