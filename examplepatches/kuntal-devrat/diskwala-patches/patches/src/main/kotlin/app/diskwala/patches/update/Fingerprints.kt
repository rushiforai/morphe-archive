package app.diskwala.patches.update

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for DiskWala 26.9 (native Kotlin/Compose build).
 *
 * Only two methods are PairIP VM stubs in this build:
 *  - DiskWalaApp.onCreate()V
 *  - MainActivity.onCreate(Landroid/os/Bundle;)V
 *
 * Everything else here is the supporting PairIP key-import/license plumbing
 * that has to be neutralized before the real application code can run.
 */

// PairIP key-import component factory. Returning true makes the factory take
// the "key present" branch and instantiate the manifest-declared
// com.pairip.application.Application through the original CoreComponentFactory
// instead of the empty KeyImportPlaceholderApplication.
internal object KeyImportAppComponentFactoryIsEncryptionKeyPresentFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/vmencryption/KeyImportAppComponentFactory;",
    name = "isEncryptionKeyPresent",
    returnType = "Z"
)

// FirebaseOptions.fromResource() reads its optional GA-tracking resource name
// from a PairIP-encrypted static field. Restore the literal at the sget-object.
internal object FirebaseOptionsFromResourceFingerprint : Fingerprint(
    definingClass = "Ln8/f;",
    name = "a",
    returnType = "Ln8/f;",
    parameters = listOf("Landroid/content/Context;")
)

// kotlinx.coroutines' Node class reads its first AtomicReferenceFieldUpdater
// field name from a PairIP-encrypted static field. Restore the literal.
internal object CoroutinesNodeClinitFingerprint : Fingerprint(
    definingClass = "Lpb/n;",
    name = "<clinit>",
    returnType = "V"
)

// kotlinx.serialization's Int serializer reads its descriptor name from a
// PairIP-encrypted static field. A null name crashes the app the first time
// any deep link (or other JSON payload) containing an Int is serialized.
internal object KotlinxIntSerializerClinitFingerprint : Fingerprint(
    definingClass = "Lkotlinx/serialization/internal/V;",
    name = "<clinit>",
    returnType = "V"
)

// GMS measurement's static param list is missing an experimental-event
// parameter name that PairIP hoisted into an encrypted field.
internal object GmsMeasurementParamsClinitFingerprint : Fingerprint(
    definingClass = "Lq8/a;",
    name = "<clinit>",
    returnType = "V"
)

// WorkManager's SystemJobScheduler tag is another PairIP-hoisted literal.
internal object WorkManagerSystemJobSchedulerClinitFingerprint : Fingerprint(
    definingClass = "Landroidx/work/impl/background/systemjob/SystemJobScheduler;",
    name = "<clinit>",
    returnType = "V"
)

// Room's open-helper appends the closing SQL quote after the identity hash
// through a PairIP-hoisted literal.
internal object RoomOpenHelperWriteIdentityFingerprint : Fingerprint(
    definingClass = "Landroidx/room/P;",
    name = "c",
    returnType = "V",
    parameters = listOf("LK3/d;")
)

// Tink AES/CTR encryption uses a PairIP-hoisted SecretKeySpec algorithm name.
internal object TinkAesCtrEncryptFingerprint : Fingerprint(
    definingClass = "Ll8/d;",
    name = "b",
    returnType = "[B",
    parameters = listOf("[B", "[B")
)

// OkHttp's static header-name table contains one PairIP-hoisted literal.
internal object OkHttpHeadersClinitFingerprint : Fingerprint(
    definingClass = "LMb/c;",
    name = "<clinit>",
    returnType = "V"
)

// OkHttp's status-line parser uses an empty string as the response message
// when the status line has no reason phrase (HTTP/2 synthesizes "HTTP/1.1 200").
// PairIP hoisted that empty literal into a static field that is null at runtime,
// which makes Response.Builder.build() throw "message == null".
internal object OkHttpStatusLineParseFingerprint : Fingerprint(
    definingClass = "LKb/j\$a;",
    name = "a",
    returnType = "LKb/j;",
    parameters = listOf("Ljava/lang/String;")
)

// PairIP startup VM launch (called from the base Application <clinit>).
internal object StartupLauncherLaunchFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    returnType = "V"
)

// PairIP signature checks.
internal object SignatureCheckVerifyIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object SignatureCheckVerifySignatureMatchesFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifySignatureMatches",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)

// PairIP licensing.
internal object LicenseClientCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object LicenseClientInitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList()
)

internal object LicenseClientRetryOrThrowFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "retryOrThrow",
    returnType = "V",
    parameters = listOf("Lcom/pairip/licensecheck/LicenseCheckException;")
)

internal object LicenseClientRetryOrThrowWithFlagsFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "retryOrThrow",
    returnType = "V",
    parameters = listOf(
        "Lcom/pairip/licensecheck/LicenseCheckException;",
        "Z",
        "Z"
    )
)

internal object LicenseActivityShowErrorDialogFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "showErrorDialog",
    returnType = "V"
)

internal object LicenseActivityShowPaywallFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "showPaywallAndCloseApp",
    returnType = "V"
)

// PairIP VM runner, used if any unpatched code path still reaches it.
internal object VMRunnerInvokeFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "[Ljava/lang/Object;")
)

internal object VMRunnerSetContextFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/VMRunner;",
    name = "setContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

// PairIP Application.attachBaseContext performs the license/signature checks
// and ends with an invoke-super to itself in this protected build.
internal object PairIPApplicationAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/application/Application;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

// The two VM-stubbed application entry points.
internal object DiskWalaAppOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/app/DiskWalaApp;",
    name = "onCreate",
    returnType = "V"
)

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/diskwalaapp/app/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

// Launch state used by the Compose root. The one-arg constructor is the
// initial/fallback state; forcing it ready keeps the update/identity gate open.
internal object LaunchStateConstructorIntFingerprint : Fingerprint(
    definingClass = "LA5/f0;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("I")
)

// Canonical LaunchState constructor. Every state update is copied through it,
// so forcing the device-check enum here keeps the app past the attestation
// gate regardless of whether the identity/attestation request succeeds.
internal object LaunchStateConstructorFingerprint : Fingerprint(
    definingClass = "LA5/f0;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Z", "Z", "Lj5/h;", "Z", "Z", "LA5/p;", "LA5/q;", "I")
)

// Root-composable ViewModel that exposes the session-ready StateFlow. The main
// UI is gated on this flag; the real flow only flips after the server-backed
// session/attestation round-trip completes.
internal object SessionGateViewModelConstructorFingerprint : Fingerprint(
    definingClass = "LA5/Y0;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ln5/d;")
)
