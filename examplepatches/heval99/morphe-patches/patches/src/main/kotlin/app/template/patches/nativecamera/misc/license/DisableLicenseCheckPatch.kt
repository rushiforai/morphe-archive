package app.template.patches.nativecamera.misc.license

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_NATIVECAMERA

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * PairIP license check only (no VM shield): the manifest Application is
 * com.pairip.application.Application, which calls LicenseClient.checkLicense(Context) from
 * attachBaseContext. Re-signed builds fail it and are bounced to the Play Store, so the check
 * is skipped. Same approach as the BeSoccer patch.
 */
@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Skips the Play Store license check so the patched app starts."
) {
    compatibleWith(COMPATIBILITY_NATIVECAMERA)

    execute {
        mutableClassDefBy(LICENSE_CLIENT).methods.singleOrNull {
            it.name == "checkLicense" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "V" &&
                it.implementation != null
        }?.returnEarly() ?: throw PatchException("LicenseClient.checkLicense(Context) not found")
    }
}
