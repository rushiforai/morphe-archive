package app.arylive.patches.arylive.ads

import app.arylive.patches.shared.Constants.ARY_PLUS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * PairIP (Play licensing) blocks sideloaded / resign builds with a
 * "Google Play is enabled / Play Protect" style dialog. Skip the check.
 */
private object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

private object StartErrorDialogFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "startErrorDialogActivity",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val pairIpBypassPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Skips PairIP / Play license dialog so resigned sideload builds can open.",
    default = true,
) {
    compatibleWith(ARY_PLUS)

    execute {
        CheckLicenseFingerprint.method.addInstructions(0, "return-void")
        StartErrorDialogFingerprint.methodOrNull?.addInstructions(0, "return-void")
    }
}
