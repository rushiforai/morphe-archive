package app.template.patches.gpsmapcamera.misc.license

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_GPSMAPCAMERA

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * PairIP license check only (no libpairipcore / VMRunner / SignatureCheck). The manifest
 * Application is com.pairip.application.Application, whose attachBaseContext calls
 * LicenseClient.checkLicense(Context) before the app's own MyApplication runs; a re-signed build
 * fails it and is sent to LicenseActivity, so the check is skipped. LicenseContentProvider, the
 * only other caller, is not in the manifest. Same approach as Structured and Mango.
 */
@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Disables the Play Store license check so the app starts.",
) {
    compatibleWith(COMPATIBILITY_GPSMAPCAMERA)

    execute {
        val checkLicense = mutableClassDefBy(LICENSE_CLIENT).methods.singleOrNull {
            it.name == "checkLicense" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "V" &&
                it.implementation != null
        } ?: throw PatchException("LicenseClient.checkLicense(Context) not found")
        checkLicense.returnEarly()
    }
}
