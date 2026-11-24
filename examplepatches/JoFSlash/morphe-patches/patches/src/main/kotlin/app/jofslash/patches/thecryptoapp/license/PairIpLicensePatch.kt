package app.jofslash.patches.thecryptoapp.license

import app.jofslash.patches.thecryptoapp.shared.Constants.COMPATIBILITY_THECRYPTOAPP
import app.jofslash.patches.thecryptoapp.shared.methodOf
import app.jofslash.patches.thecryptoapp.shared.returnEarly
import app.morphe.patcher.patch.bytecodePatch

// PairIP's Java-only license check. com.pairip.application.Application.attachBaseContext() calls
// LicenseClient.checkLicense(Context) on every start; on a sideloaded / re-signed build it shows a
// paywall and then System.exit(0). It does not re-read the signing certificate, so neutralising this
// one static method is enough to let the patched app launch. No native VM, PlayIntegrity, SafetyNet
// or signature check is involved.
private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

@Suppress("unused")
val pairIpLicensePatch = bytecodePatch(
    name = "Disable PairIP license check",
    description = "Lets the patched app start. Without it the app sees it wasn't installed from the Play " +
            "Store, shows a paywall and closes. Keep it on.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_THECRYPTOAPP)

    execute {
        // public static void checkLicense(Context) -> return-void at once, so no service bind, no
        // paywall, no System.exit.
        methodOf(LICENSE_CLIENT, "checkLicense", listOf("Landroid/content/Context;")).returnEarly()
    }
}
