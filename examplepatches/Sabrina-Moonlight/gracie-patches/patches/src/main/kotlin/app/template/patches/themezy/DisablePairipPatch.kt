package app.template.patches.themezy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private val THEMEZY = Compatibility(
    name = "Themezy",
    packageName = "com.themezy.theme.iconwidgets",
    apkFileType = ApkFileType.APKS_REQUIRED,
    appIconColor = 0x7C4DFF,
    targets = listOf(AppTarget(version = "1.0.9", versionCode = 9)),
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

private object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val disablePairipPatch = bytecodePatch(
    name = "Disable Pairip",
    description = "Skips the local license check so the app can keep running offline.",
    default = true,
) {
    compatibleWith(THEMEZY)

    execute {
        InitializeLicenseCheckFingerprint.method.returnEarly()
        runCatching { ConnectToLicensingServiceFingerprint.method.returnEarly() }
        runCatching { CheckLicenseFingerprint.method.returnEarly() }
    }
}
