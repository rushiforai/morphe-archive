package app.jofslash.patches.googlehealth.installer

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.jofslash.patches.googlehealth.shared.Redirect
import app.jofslash.patches.googlehealth.shared.redirectCalls
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import java.util.logging.Logger

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/googlehealth/SpoofInstallerPatch;"

@Suppress("unused")
val spoofInstallerPatch = bytecodePatch(
    name = "Spoof installer",
    description = "Reports Google Play as the app installer, so the app doesn't treat the patched app as " +
            "installed from an unknown source.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    extendWith("extensions/extension.mpe")

    execute {
        val changed = redirectCalls(
            listOf(
                Redirect(
                    "Landroid/content/pm/PackageManager;", "getInstallerPackageName",
                    listOf("Ljava/lang/String;"), "Ljava/lang/String;",
                    EXTENSION_CLASS, "getInstallerPackageName",
                ),
                Redirect(
                    "Landroid/content/pm/InstallSourceInfo;", "getInstallingPackageName",
                    listOf(), "Ljava/lang/String;",
                    EXTENSION_CLASS, "getInstallingPackageName",
                ),
            )
        )
        if (changed == 0) throw PatchException("Found no installer checks to change")
        Logger.getLogger("SpoofInstaller").info("Changed $changed installer checks")
    }
}
