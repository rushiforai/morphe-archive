package app.zdrgon.patches.aodnotify.misc

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ── Pro state production point — aodNotify 6.10 (31710) ───────────────
//
// aodNotify (com.jamworks.alwaysondisplay) sells Pro three ways —
// "sub_weekly" ($2.99/week), "sub_yearly" ($4.99/year) and the one-time
// "aod_onetime" ($6.99) — plus three "aod_coffee*" donation SKUs. Every
// one of them lands in the SAME local entitlement: the default
// SharedPreferences boolean key "100". Billing is Play Billing 7.1.1
// used directly by the dev's own code (no RevenueCat), and nothing in
// the purchase path touches a Jawomo server — activation is purely
// local, restore is a queryPurchases re-derivation at startup.
//
// Exactly three methods write key "100" (full put* census of the
// single base dex, verified 2026-11-08):
//   SettingsOptionsNew.i(List)  — purchase processor: any PURCHASED
//                                 qualifying product -> stores true.
//   SettingsOptions.d(List)     — legacy screen, coffee SKUs -> true.
//   SettingsHome.C(Z)           — the ONLY conditional writer; stores
//                                 its argument. Its sole caller is the
//                                 SettingsHome$i runnable posted by the
//                                 purchase sync SettingsHome.s(List),
//                                 which computes C(S || T) with
//                                 S = "owns a sub" (sub_yearly /
//                                 sub_weekly) and T = "owns one-time"
//                                 (aod_onetime / coffees / other).
//
// S and T are otherwise read only by SettingsHome's own home-screen
// UI (which buy rows to hide). NO feature gate reads them: all 21
// read sites of "100" — an identical Boolean wrapper in every
// settings screen and in the notification service, plus one inline
// read in SettingsHome.B — consult the stored boolean. The tiers are
// NOT distinguished locally for any feature; the only difference
// between a weekly sub and the one-time purchase is what Play keeps
// returning to the sync, which is what the pin takes over.
//
// Polarity is branch-proven (true = Pro, no inversion):
//   SettingsHome.B:  "100" true -> action-bar title "Notify Pro",
//                    false -> "Notify".
//   SettingsHome.g:  x() (="100") true -> house promo suppressed.
//   Writers:         a PURCHASED product stores true.
//
// Pinning C's argument to true makes every sync persist "100" = true
// through the app's own write path (its own apply() and the B()/z()
// UI refresh), i.e. exactly the state a genuine aod_onetime purchase
// produces — with one-time permanence, because C is the only writer
// that can store false and it can now only store true.
//
// (C's tail has a branch that would re-store false if a prefs key
// "prefHidePro" were true; that key is written NOWHERE — no method
// and no preference XML references it — so it reads false on every
// real install and the branch is dead. Noted for completeness.)
//
// NOTE: Morphe fingerprints compare access flags by EXACT equality;
// C is declared "public" in 6.10.

/** The single conditional Pro-state writer. Pinning its input pins the app. */
object ProStateSyncFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/jamworks/alwaysondisplay/SettingsHome;",
    name = "C"
)

// ── PairIP license funnel — aodNotify 6.10 ────────────────────────────
//
// PairIP is present ONLY as the licensecheck SDK: 18 classes, all
// com.pairip.licensecheck.*. There is NO libpairipcore.so (the APK
// has zero native libraries), no PairIP Application stub, no VM, no
// encrypted payload. ResponseValidator is a JWT validator: it checks
// only that the Play licensing service's response is RS256-signed
// with the dev's license key and names this package — there is NO
// signing-certificate check and NO installer check anywhere in this
// variant (and no local branch and no trial machinery, unlike the
// newer SDK in DiskWala 27.3).
//
// Live flow (branch-traced): the manifest-declared
// LicenseContentProvider.onCreate — the framework runs it at every
// cold process start — constructs the app's only LicenseClient and
// calls initializeLicenseCheck. From CHECK_REQUIRED that binds
// com.android.vending's ILicensingService (checkLicenseV2) and the
// verdict lands in processResponse(code, bundle):
//   0 LICENSED     -> state OK
//   2 NOT_LICENSED -> startPaywallActivity: LicenseActivity opens
//                     with the service-supplied PAYWALL_INTENT (the
//                     Play Store listing block page) and the app is
//                     closed behind it
//   other / errors -> handleError -> startErrorDialogActivity: the
//                     same LicenseActivity as an error dialog
// LicenseActivity's only two launchers in the app are those two
// methods, and LicenseClient's only constructor call site is the
// provider — stubbing the four methods below is the complete
// enforcement surface.
//
// NOTE: initializeLicenseCheck is "public"; the other three are
// "private" (reached via synthetic accessors).

/** Check entry point. Recording OK and returning reproduces the genuine success steady state; nothing ever binds to Play. */
object InitializeLicenseCheckFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck"
)

/** The verdict handler; code 2 is the only route to the paywall. */
object ProcessResponseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse"
)

/** Paywall launcher (LicenseActivity, PAYWALL type). */
object StartPaywallActivityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startPaywallActivity"
)

/** Error-dialog launcher (LicenseActivity, ERROR_DIALOG type). */
object StartErrorDialogActivityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    accessFlags = listOf(AccessFlags.PRIVATE),
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity"
)
