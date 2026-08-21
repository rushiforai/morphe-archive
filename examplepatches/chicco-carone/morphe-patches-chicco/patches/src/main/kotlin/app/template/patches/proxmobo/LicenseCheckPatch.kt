package app.template.patches.proxmobo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_PROXMOBO
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Fingerprint for [com.pairip.licensecheck.LicenseClient.initializeLicenseCheck].
 *
 * This class is injected into Play Store apps by Google (PairIP / Play app
 * protection) and is NOT obfuscated by the developer, so the fully qualified
 * class name is stable between app targets.
 */
object LicenseClientFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V"
)

/**
 * ProxMobo License Check Bypass
 *
 * ProxMobo is protected by Google's PairIP app licensing service. At startup
 * [com.pairip.licensecheck.LicenseContentProvider] runs the license check which
 * contacts `com.android.vending.licensing.ILicensingService` and, when the app
 * is not licensed through Google Play, launches a paywall / error dialog and
 * exits the app.
 *
 * This patch empties the body of [LicenseClient.initializeLicenseCheck] so the
 * license check is a no-op and the app runs on any device.
 */
@Suppress("unused")
val licenseCheckPatch = bytecodePatch(
    name = "ProxMobo License Check Bypass",
    description = "Disables Google's Play app-licensing (PairIP) check so ProxMobo does not show license errors or close when it is not installed/licensed through Google Play.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PROXMOBO)

    execute {
        LicenseClientFingerprint.method.addInstructions(
            0,
            "return-void"
        )
    }
}