package app.template.patches.screenrecording

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private val SCREEN_RECORDING = Compatibility(
    name = "Screen Recording App",
    packageName = "de.twokit.screen.recording.app",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xE91E63,
    targets = listOf(AppTarget(version = "1.11")),
)

private object CheckLicenseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Cannot check license with null context."),
)

private object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = listOf(),
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

internal val disablePairipPatch = bytecodePatch {
    compatibleWith(SCREEN_RECORDING)

    execute {
        runCatching { CheckLicenseFingerprint.method.returnEarly() }
        runCatching { InitializeLicenseCheckFingerprint.method.returnEarly() }
        runCatching { VerifyIntegrityFingerprint.method.returnEarly() }
        runCatching { StartupLauncherFingerprint.method.returnEarly() }
    }
}
