package app.aryplus.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

// ─── Pairip (Play Integrity) license-check bypass ─────────────────────────────
//
// All three classes below live in classes2.dex and are NOT obfuscated (they are
// part of the Pairip SDK which ships with stable class names).
//
// Smali verified: YES (classes2.dex / com/pairip/licensecheck/)

/**
 * LicenseClient.processResponse(int responseCode, Bundle responsePayload)
 *
 * Called by the ILicenseV2ResultListener stub when the Play-licensing service
 * responds.  responseCode == 0 → LICENSED, 2 → NOT_LICENSED, 3 → invalid pkg.
 *
 * Smali:
 *   .method private processResponse(ILandroid/os/Bundle;)V
 *     .registers 6
 *     const/4 v0, 0x3
 *     if-eq p1, v0, :cond_52   ← branches on responseCode
 *     if-nez p1, :cond_26
 *     invoke-static {p2, p1}, LicenseResponseHelper;->validateResponse(...)V
 *     …
 */
object ProcessLicenseResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/pairip/licensecheck/LicenseResponseHelper;",
            name = "validateResponse",
        ),
    ),
)

/**
 * LicenseResponseHelper.validateResponse(Bundle responsePayload, String packageName)
 *
 * Verifies the JWS signature of the license server response.  Throwing here
 * causes handleError() → System.exit().  Returning early skips all checks.
 *
 * Smali:
 *   .method public static validateResponse(Landroid/os/Bundle;Ljava/lang/String;)V
 *     .registers 7
 *     invoke-static {p0}, …->getJwsPartsForLicenseData(…)[Ljava/lang/String;
 *     …
 *     invoke-static {p0, v4, v0, v1}, …->verifySignature(…)V
 *     …
 *     const-string p1, "Package name doesn\'t match."
 */
object ValidateLicenseResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseResponseHelper;",
    name = "validateResponse",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
    filters = listOf(
        string("Package name doesn't match."),
    ),
)

/**
 * LicenseClient.initializeLicenseCheck()
 *
 * Entry point called from the Application; inspects licenseCheckState and
 * may fire a fresh service connection.  The repeatedCheckEnabled field read
 * happens inside processResponse, but we also disable the repeated-check
 * scheduling by patching this method early.
 *
 * We target a stable, non-obfuscated method with a unique string to locate it.
 *
 * Smali:
 *   .method public initializeLicenseCheck()V
 *     .registers 4
 *     sget-object v0, …->licenseCheckState:…
 *     invoke-virtual {v0}, …->ordinal()I
 *     …
 *     invoke-static {v0, p1}, LicenseResponseHelper;->validateResponse(…)V
 */
object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf(),
)
