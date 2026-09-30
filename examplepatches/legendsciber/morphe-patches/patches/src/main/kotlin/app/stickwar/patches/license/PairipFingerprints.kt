package app.stickwar.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val SIG = "Lcom/pairip/SignatureCheck;"
private const val VM = "Lcom/pairip/VMRunner;"
private const val SL = "Lcom/pairip/StartupLauncher;"
private const val LIC = "Lcom/pairip/licensecheck/LicenseClient;"
private const val STATE = "Lcom/pairip/licensecheck/LicenseClient\$LicenseCheckState;"
private const val ACT = "Lcom/pairip/licensecheck/LicenseActivity;"
private const val PROV = "Lcom/pairip/licensecheck/LicenseContentProvider;"
private const val RESP = "Lcom/pairip/licensecheck/LicenseResponseHelper;"
private const val EXIT = "Lcom/pairip/licensecheck/LicenseClient\$1;"

internal object VerifyIntegrityFingerprint : Fingerprint(
    definingClass = SIG,
    name = "verifyIntegrity",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
)

internal object VerifySignatureMatchesFingerprint : Fingerprint(
    definingClass = SIG,
    name = "verifySignatureMatches",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Ljava/lang/String;"),
)

internal object VmRunnerClinitFingerprint : Fingerprint(
    definingClass = VM,
    name = "<clinit>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.STATIC),
    parameters = emptyList(),
)

internal object VmRunnerInvokeFingerprint : Fingerprint(
    definingClass = VM,
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "[Ljava/lang/Object;"),
)

internal object StartupLaunchFingerprint : Fingerprint(
    definingClass = SL,
    name = "launch",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = SL,
            name = "launchCalled",
        ),
    ),
)

internal object CheckLicenseFingerprint : Fingerprint(
    definingClass = LIC,
    name = "checkLicense",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("Cannot check license with null context."),
        methodCall(definingClass = LIC, name = "isIsolatedProcess"),
        string("Skipping license check in isolated process."),
    ),
)

internal object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = LIC,
    name = "initializeLicenseCheck",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = LIC,
            name = "licenseCheckState",
        ),
        methodCall(definingClass = STATE, name = "ordinal"),
        methodCall(definingClass = RESP, name = "validateResponse"),
        methodCall(definingClass = LIC, name = "handleError"),
    ),
)

internal object ProcessResponseFingerprint : Fingerprint(
    definingClass = LIC,
    name = "processResponse",
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;"),
)

internal object StartPaywallActivityFingerprint : Fingerprint(
    definingClass = LIC,
    name = "startPaywallActivity",
    returnType = "V",
)

internal object PerformLocalInstallerCheckFingerprint : Fingerprint(
    definingClass = LIC,
    name = "performLocalInstallerCheck",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("com.android.vending"),
        string("Local install check failed due to wrong installer."),
    ),
)

internal object LicenseActivityOnStartFingerprint : Fingerprint(
    definingClass = ACT,
    name = "onStart",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Landroid/app/Activity;", name = "onStart"),
        string("activitytype"),
        methodCall(definingClass = ACT, name = "showErrorDialog"),
    ),
)

internal object ContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = PROV,
    name = "onCreate",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = LIC, name = "checkLicense"),
    ),
)

internal object ValidateResponseFingerprint : Fingerprint(
    definingClass = RESP,
    name = "validateResponse",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
)

internal object ExitActionFingerprint : Fingerprint(
    definingClass = EXIT,
    name = "run",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/System;", name = "exit"),
    ),
)
