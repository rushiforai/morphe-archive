package app.zdrgon.patches.contentcam.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Premium state — ContentCam 2.8.0 (versionCode 23) ───────────────
//
// ContentCam (app.contentcam.android) sells Premium as a monthly
// subscription, an annual subscription (7-day trial) and a one-time
// "Lifetime" product ($44.99). Billing is the Play Billing Library
// used directly by the dev's own manager, Ls03; ("ContentCam/
// Billing"), products "contentcam_premium" (the Lifetime one-time
// product) and "contentcam_premium_sub" (the subscriptions). There
// is no RevenueCat/Superwall and no backend: a purchase is verified
// on-device (purchaseState + RSA signature against the embedded
// Play license key, Ls03;->c) and nothing is uploaded anywhere.
//
// The whole Premium state is ONE boolean on that manager:
//
//   Ls03;  field d:Z                 — the entitled flag
//          field e:Lzu3;             — MutableStateFlow built from d
//          field f:Lr63;             — the StateFlow the UI collects
//          SharedPreferences "premium" / key "entitled" — persistence
//
// Verified by full-dex field census (2026-11-16):
//   * d is WRITTEN only in <init> (the persisted value) and in
//     m(Z)V. d is READ only inside <init> and m itself.
//   * m(Z)V is the single producer: it stores its argument to the
//     field, to SharedPreferences and into the flow. Its callers
//     are the purchase-update handler (m(true) after verification)
//     and the restore/query callbacks that re-derive the flag from
//     Play's purchase list at every launch (MainActivity calls
//     Ls03;->n() on start) — the sync that would also write false
//     again if Play stopped returning a purchase.
//   * f is READ at exactly one site in the app: Lsi;->a, the root
//     composable, which collects the flow and threads the boolean
//     through the whole content tree. Every Premium gate — Front/
//     Back, Photos, 4K, 60fps, manual controls, teleprompter,
//     timelapse, unlimited projects, trim in review — hangs off
//     that one collected boolean.
//
// The state carries no plan and no expiry: monthly, annual and
// Lifetime are indistinguishable at read time, so a producer that
// can only store true IS the Lifetime state, with its permanence.
//
// Register facts (from the 2.8.0 dex): m(Z)V has 4 registers; the
// boolean parameter is v3 (instruction 0 is iput-boolean v3, v2,
// d). In <init> the persisted read lands as iput-boolean v0, v4, d
// (instruction 23), immediately followed by the iget that seeds
// the StateFlow — forcing that one store makes the initial flow
// value true from the first frame, before any billing sync runs.
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// m is declared "public final" (0x0011), the constructor is a plain
// "public" constructor (0x10001).

/** The single Premium-state writer. Forcing its argument to true pins the app. */
object EntitledStateWriterFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Ls03;",
    name = "m"
)

/** The billing manager constructor; its persisted-state store seeds the Premium flow. */
object BillingManagerConstructorFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    definingClass = "Ls03;",
    name = "<init>"
)

// ── PairIP license funnel — ContentCam 2.8.0 ────────────────────────
//
// PairIP is present ONLY as its licensecheck SDK: the manifest
// Application is com.pairip.application.Application (a thin
// subclass of the real ContentCamApp) whose attachBaseContext
// calls LicenseClient.checkLicense, and LicenseContentProvider
// .onCreate calls it too. There is NO libpairipcore.so, no VM, no
// StartupLauncher, no SignatureCheck, no vmencryption package,
// and the manifest's appComponentFactory is the stock AndroidX
// one. Both entry points funnel into initializeLicenseCheck:
//
//   CHECK_REQUIRED -> performLocalInstallerCheck (installer must
//     be com.android.vending — a Morphe Manager install fails it)
//     -> bind Play's ILicensingService (checkLicenseV2)
//     -> processResponse(code, bundle):
//          LICENSED     -> state FULL_CHECK_OK
//          NOT_LICENSED -> startPaywallActivity: LicenseActivity
//                          opens the Play Store block page, and
//                          scheduleAppShutdown arms an exit in 30 s
//          errors       -> handleError -> startErrorDialogActivity
//                          (same activity as an error dialog, also
//                          arming the shutdown)
//
// licenseCheckState is read nowhere outside LicenseClient, and
// lambda$handleError$0 returns early when the state is
// FULL_CHECK_OK — the genuine terminal state after a LICENSED
// response (this SDK version has no "OK" value) — so recording
// FULL_CHECK_OK at the funnel is both the bypass and a guard
// against the error path.
//
// NOTE: initializeLicenseCheck is "public"; the other three are
// "private" (reached via synthetic accessors).

/** Check entry point. Recording FULL_CHECK_OK and returning reproduces the genuine licensed steady state; nothing ever binds to Play. */
object InitializeLicenseCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck"
)

/** The verdict handler; code 2 (NOT_LICENSED) is the only route to the paywall. */
object ProcessResponseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse"
)

/** Paywall launcher (LicenseActivity, PAYWALL type); also arms the 30 s app shutdown. */
object StartPaywallActivityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startPaywallActivity"
)

/** Error-dialog launcher (LicenseActivity, ERROR_DIALOG type); also arms the 30 s app shutdown. */
object StartErrorDialogActivityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity"
)
