package app.template.patches.structured.misc.license

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_STRUCTURED

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * PairIP license check only (no libpairipcore / VMRunner). The manifest Application is
 * com.pairip.application.Application, whose attachBaseContext calls
 * LicenseClient.checkLicense(Context); a re-signed build fails it before any app code runs, so the
 * check is skipped. Same approach as BeSoccer, LuckyClick and RareCam.
 */
@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable license check",
    description = "Disables the Play Store license check so the app starts.",
) {
    compatibleWith(COMPATIBILITY_STRUCTURED)

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
