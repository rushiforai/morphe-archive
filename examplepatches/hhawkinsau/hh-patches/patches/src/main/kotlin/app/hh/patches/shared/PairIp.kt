package app.hh.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Short-circuits Google Play Automatic Integrity Protection (PairIP) so a
 * sideloaded / re-signed install is not bounced into the Play Store.
 *
 * On launch PairIP either:
 * - calls LicenseClientV3.onActivityCreate, which opens the store listing, or
 * - runs the older LicenseClient LVL flow, which does the same on failure.
 *
 * Also spoofs the installer package so leftover "were we installed from Play?"
 * tests pass.
 *
 * @return number of call sites rewritten
 */
context(_: BytecodePatchContext)
internal fun disablePairIpPlayStoreRedirect(): Int {
    var patched = 0

    if (LicenseClientV3OnCreateFingerprint.returnVoidEarly()) patched++

    if (ConnectToLicensingServiceFingerprint.returnVoidEarly()) patched++
    if (RetryOrThrowFingerprint.returnVoidEarly()) patched++
    if (InitializeLicenseCheckFingerprint.returnVoidEarly()) patched++
    if (ValidateLicenseResponseFingerprint.returnVoidEarly()) patched++
    if (LicenseResponseHelperFingerprint.returnVoidEarly()) patched++

    ProcessLicenseResponseFingerprint.methodOrNull?.let { method ->
        val responseRegister = if (AccessFlags.STATIC.isSet(method.accessFlags)) "p0" else "p1"
        method.addInstruction(0, "const/4 $responseRegister, 0x0")
        patched++
    }

    if (SignatureCheckFingerprint.returnVoidEarly()) patched++

    OpenPlayStoreFingerprint.matchAllOrNull()?.forEach { match ->
        if (match.method.returnVoidEarly()) patched++
    }

    if (spoofPlayStoreInstaller()) patched++

    return patched
}

private object LicenseClientV3OnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck3/LicenseClientV3;",
    name = "onActivityCreate",
    returnType = "V",
)

private object ConnectToLicensingServiceFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "connectToLicensingService",
    returnType = "V",
)

private object RetryOrThrowFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "retryOrThrow",
    returnType = "V",
)

private object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
)

private object ProcessLicenseResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "processResponse",
)

private object ValidateLicenseResponseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/ResponseValidator;",
    name = "validateResponse",
    returnType = "V",
)

private object LicenseResponseHelperFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseResponseHelper;",
    name = "validateResponse",
    returnType = "V",
)

private object SignatureCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
)

private object OpenPlayStoreFingerprint : Fingerprint(
    name = "openPlayStore",
    returnType = "V",
    custom = { _, classDef -> classDef.type.startsWith("Lcom/pairip/") },
)
