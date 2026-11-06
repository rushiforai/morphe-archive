package app.template.patches.ntiles

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private val QUICK_SETTINGS = Compatibility(
    name = "Quick Settings",
    packageName = "it.simonesestito.ntiles",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x2196F3,
    targets = listOf(AppTarget(version = "12.0.3-17888438")),
)

/** Pairip entry after Application attaches the base context. */
private object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
)

/** Private connect path; fixed log string for a stable match. */
private object ConnectToLicensingServiceFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = listOf(),
    strings = listOf("Connecting to the licensing service..."),
)

private object VerifyIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Apk signature is invalid."),
)

private object StartupLauncherFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/StartupLauncher;",
    name = "launch",
    isStatic = true,
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val disablePairipPatch = bytecodePatch(
    name = "Disable Pairip",
    description = "Skips the local license and integrity checks so the app can keep running offline.",
    default = true,
) {
    compatibleWith(QUICK_SETTINGS)

    execute {
        InitializeLicenseCheckFingerprint.method.returnEarly()
        ConnectToLicensingServiceFingerprint.method.returnEarly()
        runCatching { VerifyIntegrityFingerprint.method.returnEarly() }
        runCatching { StartupLauncherFingerprint.method.returnEarly() }
    }
}
