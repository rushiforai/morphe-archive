package app.masajid.patches.pairip

import app.masajid.patches.shared.Constants
import app.masajid.patches.shared.returnTrue
import app.masajid.patches.shared.returnVoid
import app.morphe.patcher.patch.bytecodePatch

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"
private const val RESPONSE_VALIDATOR = "Lcom/pairip/licensecheck/ResponseValidator;"

/**
 * PairIP blocks a re-signed / side-loaded build: `LicenseClient.performLocalInstallerCheck`
 * only passes for `com.android.vending` installs or system apps, and
 * `LicenseContentProvider.onCreate` starts `initializeLicenseCheck()` before any app code.
 *
 * The PairIP classes are NOT obfuscated, so they are addressed by their real names.
 */
@Suppress("unused")
val bypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Disables PairIP license/install-source verification so a re-signed build can run.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MASAJID)

    execute {
        mutableClassDefByOrNull(LICENSE_CLIENT)?.let { licenseClient ->
            licenseClient.methods.firstOrNull { it.name == "initializeLicenseCheck" }?.returnVoid()
            licenseClient.methods.firstOrNull { it.name == "checkLicense" }?.returnVoid()
            licenseClient.methods.firstOrNull { it.name == "connectToLicensingService" }?.returnVoid()
            licenseClient.methods.firstOrNull { it.name == "processResponse" }?.returnVoid()
            licenseClient.methods.firstOrNull { it.name == "startPaywallActivity" }?.returnVoid()
            licenseClient.methods.firstOrNull { it.name == "performLocalInstallerCheck" }?.returnTrue()
        }

        mutableClassDefByOrNull(RESPONSE_VALIDATOR)
            ?.methods?.firstOrNull { it.name == "validateResponse" }?.returnVoid()
    }
}
