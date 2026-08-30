package app.diskwala.patches.update

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Fingerprints for forced update / integrity / anti-tamper bypass.
 * Based on decoded smali from DiskWala 24.5 (334):
 * - com.pairip.SignatureCheck.verifyIntegrity / verifySignatureMatches
 * - com.pairip.StartupLauncher.launch + VMRunner.invoke / executeVM
 * - com.diskwalaapp.integrity.PlayIntegrityModule.requestToken
 * - com.facebook.react.bridge.Promise reject paths
 */

internal object SignatureCheckVerifyIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;")
)

internal object SignatureCheckVerifySignatureMatchesFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifySignatureMatches",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Ljava/lang/String;")
)

internal object StartupLauncherLaunchFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNCHRONIZED),
    parameters = listOf()
)

internal object VMRunnerInvokeFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Ljava/lang/String;", "[Ljava/lang/Object;")
)

internal object VMRunnerExecuteVMFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "executeVM",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.NATIVE),
    parameters = listOf("[B", "[Ljava/lang/Object;")
)

internal object PlayIntegrityRequestTokenFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/integrity/PlayIntegrityModule;",
    name = "requestToken",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;"),
    filters = listOf(
        methodCall(
            definingClass = "Lr8/b;",
            name = "a",
            parameters = listOf("Landroid/content/Context;")
        )
    )
)

// Fallback: if PlayIntegrity lambda fails, also patch the lambda that rejects
internal object PlayIntegrityLambdaRejectFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/integrity/PlayIntegrityModule;",
    name = "requestToken\$lambda\$2",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Lcom/facebook/react/bridge/Promise;", "Ljava/lang/Exception;")
)

// PairIP license check: LicenseContentProvider.onCreate -> LicenseClient.checkLicense
// -> LicenseActivity -> Play Store redirect ("Please Download App From App/Play Store").
internal object LicenseContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf()
)

internal object LicenseClientCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "initializeLicenseCheck"
        )
    )
)

// MainApplication clinit that triggers StartupLauncher - used as alternative to patch StartupLauncher
internal object MainApplicationClinitFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/MainApplication;",
    name = "<clinit>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.STATIC),
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/pairip/StartupLauncher;",
            name = "launch"
        )
    )
)
