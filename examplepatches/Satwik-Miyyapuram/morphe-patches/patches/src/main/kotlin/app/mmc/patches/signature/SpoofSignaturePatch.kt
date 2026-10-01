package app.mmc.patches.signature

import app.mmc.patches.shared.Constants.COMPATIBILITY_MMC
import app.mmc.patches.util.mmcLogger
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * ForwardScoutUtility.getSignature(Context)String
 *
 * Returns `PackageManager.getPackageInfo(pkg, GET_SIGNATURES).signatures[0].toCharsString()`.
 * It's exposed to native code through DA2Activity.getPlatformSignature(), which
 * libcocos2dcpp.so calls as ApplicationInterface::getPlatformSignature(), most likely to report
 * app integrity to the game backend.
 */
internal object GetSignatureFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Package signature not found!"),
)

@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof signature",
    description = "Reports the original Play Store signing certificate to the game, so the re-signed " +
        "APK passes the game's integrity check and online play isn't affected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MMC)

    execute {
        val method = GetSignatureFingerprint.methodOrNull
            ?: throw PatchException("Spoof signature: ForwardScoutUtility.getSignature not found")

        // Method has 3 registers (p0 = v2), so v0 is a free local.
        method.addInstructions(
            0,
            """
                const-string v0, "$ORIGINAL_SIGNATURE_CHARS"
                return-object v0
            """,
        )
        mmcLogger.info("Spoof signature: patched ${method.definingClass}->${method.name}")
    }
}
