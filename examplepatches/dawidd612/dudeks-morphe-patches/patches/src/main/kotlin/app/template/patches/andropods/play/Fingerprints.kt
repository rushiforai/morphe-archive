package app.template.patches.andropods.play

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * PairIP's static startup entry point. The injected PairIP Application calls this
 * before the app UI is created and displays a Google Play ownership screen for
 * re-signed APKs. The SDK class and method names are intentionally not obfuscated.
 */
object AndroPodsPairIpCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
)

