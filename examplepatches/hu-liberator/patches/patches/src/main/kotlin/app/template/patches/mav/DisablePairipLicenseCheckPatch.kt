package app.template.patches.mav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Verified against hu.mav.emmapp_merged.apk (JADX:
 * com/pairip/application/Application.java, com/pairip/licensecheck/LicenseClient.java).
 *
 * The app's actual Application class (installed by the Pairip app-protection
 * tool at build time) is `com.pairip.application.Application`, which overrides
 * `attachBaseContext` to call `LicenseClient.checkLicense(context)` before
 * anything else runs. That binds to the real Play Store's
 * `com.android.vending.licensing.ILicensingService` and, on a NOT_LICENSED
 * response (guaranteed for a side-loaded/re-signed APK), fires a PendingIntent
 * supplied by Play -- which is the "get this app from the Play Store" redirect
 * -- then force-closes the app. A separate local installer check
 * (InstallSourceInfo.getInstallingPackageName() == "com.android.vending") feeds
 * into the same state machine but isn't itself the redirect.
 *
 * `checkLicense` is a single dedicated static entry point (not shared via a
 * switch with unrelated features), so fully short-circuiting it prevents the
 * entire license-check flow -- installer check, service bind, paywall redirect,
 * and error-dialog shutdown -- from ever starting.
 */
object LicenseCheckEntryPointFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

@Suppress("unused")
val disablePairipLicenseCheckPatch = bytecodePatch(
    name = "Disable Pairip license check",
    description = "Prevents the Pairip-injected Application class from binding to the Play Store licensing service, which would otherwise redirect to / force-close for a side-loaded APK.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        LicenseCheckEntryPointFingerprint.method.addInstructions(0, "return-void")
    }
}
