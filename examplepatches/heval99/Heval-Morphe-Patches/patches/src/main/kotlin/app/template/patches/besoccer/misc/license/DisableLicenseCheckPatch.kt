package app.template.patches.besoccer.misc.license

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BESOCCER

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * The manifest Application is PairIP's com.pairip.application.Application, whose only job is
 * calling LicenseClient.checkLicense(Context) from attachBaseContext. A re-signed build fails
 * that Play licensing check and gets the "get this app from Play" paywall, so the check is
 * skipped. There is no PairIP VM shield (no libpairipcore / VMRunner) in this app.
 */
@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Skips the Play Store license check so the patched app starts."
) {
    compatibleWith(COMPATIBILITY_BESOCCER)

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
