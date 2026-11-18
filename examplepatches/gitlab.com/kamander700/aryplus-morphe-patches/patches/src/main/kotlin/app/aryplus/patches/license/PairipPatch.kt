package app.aryplus.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags

private val COMPATIBILITY_ARY_PLUS = Compatibility(
    name = "ARY+",
    packageName = "com.release.arylive",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xE50914,
    targets = listOf(
        AppTarget(version = "3.8.1"),
        AppTarget(version = null, isExperimental = true),
    ),
)

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
val pairipPatch = patch(
    name = "Bypass license check",
    description = "Bypasses the Pairip (Play Integrity) client-side license check.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ARY_PLUS)

    execute {
        CheckLicenseFingerprint.method.addInstructions(0, "return-void")
        StartErrorDialogFingerprint.methodOrNull?.addInstructions(0, "return-void")
    }
}
