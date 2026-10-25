package app.template.patches.duplila.misc.license

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DUPLILA

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * PairIP license check only (no VM shield: no libpairipcore / VMRunner). The manifest
 * Application is com.pairip.application.Application, which calls
 * LicenseClient.checkLicense(Context) from attachBaseContext (PairIP's LicenseContentProvider
 * calls it too, but is not registered here). Re-signed builds fail it, get the Play paywall and
 * then System.exit, so the check is skipped. Same approach as the BeSoccer patch.
 */
@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Disables the Play Store license check so the app starts."
) {
    compatibleWith(COMPATIBILITY_DUPLILA)

    execute {
        mutableClassDefBy(LICENSE_CLIENT).methods.singleOrNull {
            it.name == "checkLicense" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "V" &&
                it.implementation != null
        }?.returnEarly() ?: throw PatchException("LicenseClient.checkLicense(Context) not found")
    }
}
