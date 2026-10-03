package app.epxec.patches.notizenwidget

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// ─────────────────────────────────────────────────────────────────────────────
// Fingerprints for NotiZen Widget (com.gustavcaves.notizenwidget)
//
// Architecture (verified in classes.dex):
//
//   b46.b()Z  →  hasUsablePremiumAccess()
//     └── b46.a()Lu36;  →  reads we0 (BillingEntitlementStore)
//           └── we0.b()Z  reads SharedPrefs "premium_monthly_active"
//
//   we0.f(J)V  →  writes premium_monthly_active = false  (revoke)
//   we0.g(J)V  →  writes premium_monthly_active = true   (grant)
//
//   Pairip LicenseClient.processResponse(I, Bundle)  →  Play Integrity check
//
// Strategy:
//   1. NotiZenPremiumReadFingerprint  — patches we0.b()Z to always return true
//   2. NotiZenPremiumWriteFalseFP     — no-ops we0.f(J)V (the revoke writer)
//   3. NotiZenPremiumWriteTrueFP      — (informational, not patched — writing
//                                        true is fine to leave intact)
//   4. NotiZenPairIpFingerprint       — forces responseCode = 0 (LICENSED) in
//                                        Pairip's processResponse
//
// Version notes:
//   v0.1.1782848579 — billing store class was "tc0", write method was b(Z)V
//   v0.1.1790444417 — billing store class is  "we0", write methods are f(J)V / g(J)V
//   classFingerprint on "premium_monthly_active" string is version-agnostic.
// ─────────────────────────────────────────────────────────────────────────────

// Anchors on the "premium_monthly_active" SharedPreferences key present in the
// BillingEntitlementStore class (we0 in v0.1.1790444417, tc0 in earlier builds).
// All three read/write methods in the class reference this string.
private object BillingEntitlementStoreClassFingerprint : Fingerprint(
    strings = listOf("premium_monthly_active")
)

// Matches we0.b()Z — reads SharedPreferences key "premium_monthly_active" and
// returns it as a boolean. Called transitively by b46.b() = hasUsablePremiumAccess().
//
// Smali (classes.dex / we0.smali):
//   .method public final b()Z
//     .registers 3
//     iget-object p0, p0, Lwe0;->prefs:Landroid/content/SharedPreferences;
//     const-string v0, "premium_monthly_active"
//     const/4 v1, 0x0
//     invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(...)Z
//     move-result p0
//     return p0
//
// Parameters = listOf() distinguishes this from the J-param write methods.
object NotiZenPremiumReadFingerprint : Fingerprint(
    classFingerprint = BillingEntitlementStoreClassFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        string("premium_monthly_active"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean"
        )
    )
)

// Matches we0.f(J)V — writes premium_monthly_active = false to SharedPreferences.
// Called by the billing callback when a purchase is not found / revoked.
// No-op'ing this prevents billing validation from ever revoking the premium flag.
//
// Smali (classes.dex / we0.smali):
//   .method public final f(J)V
//     .registers 5
//     iget-object p0, p0, Lwe0;->prefs:Landroid/content/SharedPreferences;
//     invoke-interface {p0}, ...->edit()...
//     const-string v0, "premium_monthly_active"
//     const/4 v1, 0x0                                  ← false
//     invoke-interface {p0, v0, v1}, ...->putBoolean(...)
//     ...
//
// NOTE: parameter is J (long) in v0.1.1790444417+; was Z (boolean) in older builds.
// We distinguish f(J)V from g(J)V via the const/4 0x0 (false) before putBoolean.
// Using anyInstruction is not needed here since the classFingerprint + parameters
// combination already scopes to only one method given the putBoolean filter.
// Both f and g use putBoolean, so we additionally match the SharedPreferences.edit()
// call which appears before the putBoolean in both, then rely on returnType=V + J param.
// The patch no-ops f (false-writer) only; g (true-writer) is left intact.
object NotiZenPremiumWriteFingerprint : Fingerprint(
    classFingerprint = BillingEntitlementStoreClassFingerprint,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("J"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "edit"
        ),
        string("premium_monthly_active"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences\$Editor;",
            name = "putBoolean"
        )
    )
)

// Matches LicenseClient.processResponse(int, Bundle) — Pairip (Play Integrity API)
// license check callback. When responseCode != 0 (NOT_LICENSED or error), the app
// may close or show a paywall. Forcing p1 = 0 (LICENSED) at entry causes the method
// to always take the success path.
//
// Non-obfuscated class name — safe to use definingClass directly.
//
// Smali (classes.dex / com/pairip/licensecheck/LicenseClient.smali):
//   .method private processResponse(ILandroid/os/Bundle;)V
//     .registers 6
//     const/4 v0, 0x3
//     if-eq p1, v0, :cond_55    ← error code path
//     if-nez p1, :cond_26        ← not-licensed path (p1 != 0)
//     ← falls through to LICENSED handling when p1 == 0
object NotiZenPairIpFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE),
    parameters = listOf("I", "Landroid/os/Bundle;"),
)
