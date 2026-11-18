package app.polishapps.patches.meteo.license

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.inpost.shared.methodsOf
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.shared.Constants.COMPATIBILITY_METEO_ICM
import app.polishapps.patches.shared.prependReturn

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * Meteo ICM ships the Play Integrity "pairip" license check only (no VM, no native lib).
 * `com.pairip.application.Application.attachBaseContext` calls `LicenseClient.checkLicense`, which asks
 * the Play licensing service about the install. A re-signed or sideloaded build fails that check and
 * pairip opens `LicenseActivity` ("Get this app from Google Play") and then kills the process.
 * The pairip classes keep their names, so both entry points are stubbed directly.
 */
@Suppress("unused")
val bypassLicenseCheckPatch = bytecodePatch(
    name = "Bypass license check",
    description = "Removes the Google Play license check that shows \"Get this app from Google Play\" " +
        "and closes the app when it was not installed from the Play Store.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_METEO_ICM)

    execute {
        val client = classDefBy(LICENSE_CLIENT)

        methodsOf(client) { method ->
            method.name == "checkLicense" && method.returnType == "V" &&
                method.parameterTypeNames() == listOf("Landroid/content/Context;")
        }.singleOrNull()?.prependReturn("return-void")
            ?: throw PatchException("$LICENSE_CLIENT->checkLicense(Context) not found")

        methodsOf(client) { method ->
            method.name == "initializeLicenseCheck" && method.returnType == "V" &&
                method.parameterTypeNames().isEmpty()
        }.singleOrNull()?.prependReturn("return-void")
            ?: throw PatchException("$LICENSE_CLIENT->initializeLicenseCheck() not found")
    }
}
