package app.markpaul099.patches.gboard.misc.identity

import app.markpaul099.patches.shared.Constants.GBOARD_PACKAGE_NAME
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

// SHA-1 of Gboard's original signing certificate, as PackageInfo.signatures reports it
// (the oldest certificate in the rotation lineage), lower case like Gboard encodes it.
private const val GBOARD_ORIGINAL_CERT_SHA1 = "38918a453d07199354f8b19af05ec6562ced5788"

/**
 * Patching re-signs the app, and may rename it, so Gboard would identify itself to
 * Google APIs with the wrong certificate and package. Send the original values instead.
 */
internal val googleApiIdentityPatch = bytecodePatch {
    execute {
        AndroidCertHeadersFingerprint.let {
            val mapCall = it.instructionMatches[3]

            // Arguments: "X-Android-Cert", cert, "X-Android-Package", packageName.
            val (certRegister, packageRegister) = when (val instruction = mapCall.instruction) {
                is FiveRegisterInstruction -> instruction.registerD to instruction.registerF
                is RegisterRangeInstruction -> (instruction.startRegister + 1) to (instruction.startRegister + 3)
                else -> throw it.patchException()
            }

            it.method.addInstructions(
                mapCall.index,
                """
                    const-string v$certRegister, "$GBOARD_ORIGINAL_CERT_SHA1"
                    const-string v$packageRegister, "$GBOARD_PACKAGE_NAME"
                """
            )
        }
    }
}
