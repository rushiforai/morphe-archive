package app.template.patches.minimalwidgets

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private val MINIMAL_WIDGETS = Compatibility(
    name = "Minimal Widgets",
    packageName = "com.jndapp.minimal.widgets",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x607D8B,
    targets = listOf(AppTarget(version = "2.2.11")),
)

/**
 * LicenseClient.checkLicense(Context).
 * Called at start from Application.attachBaseContext.
 * Fixed log string → stable fingerprint across minor builds.
 */
private object CheckLicenseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Cannot check license with null context."),
)

/**
 * private bindToLicensingService(Z): fixed log string.
 * Extra path coverage when the service bind still runs.
 */
private object BindToLicensingServiceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = listOf("Z"),
    strings = listOf("Connecting to the main licensing service..."),
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
    compatibleWith(MINIMAL_WIDGETS)

    execute {
        CheckLicenseFingerprint.method.returnEarly()
        runCatching { BindToLicensingServiceFingerprint.method.returnEarly() }
        runCatching { VerifyIntegrityFingerprint.method.returnEarly() }
        runCatching { StartupLauncherFingerprint.method.returnEarly() }
    }
}
