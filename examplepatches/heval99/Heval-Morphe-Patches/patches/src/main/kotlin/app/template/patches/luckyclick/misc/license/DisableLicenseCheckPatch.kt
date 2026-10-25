package app.template.patches.luckyclick.misc.license

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_LUCKYCLICK

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * PairIP license check only (no VM shield: no libpairipcore / VMRunner, no native libs at all).
 * The manifest Application is com.pairip.application.Application, which calls
 * LicenseClient.checkLicense(Context) from attachBaseContext. Re-signed builds fail it and get
 * the "get this app from Play" paywall, so the check is skipped. Same approach as BeSoccer.
 */
@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Disables the Play Store license check so the app starts."
) {
    compatibleWith(COMPATIBILITY_LUCKYCLICK)

    execute {
        mutableClassDefBy(LICENSE_CLIENT).methods.singleOrNull {
            it.name == "checkLicense" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.returnType == "V" &&
                it.implementation != null
        }?.returnEarly() ?: throw PatchException("LicenseClient.checkLicense(Context) not found")
    }
}
