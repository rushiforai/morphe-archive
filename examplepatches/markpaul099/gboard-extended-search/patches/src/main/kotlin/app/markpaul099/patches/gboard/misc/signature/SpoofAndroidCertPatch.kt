package app.markpaul099.patches.gboard.misc.signature

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

internal const val ORIGINAL_PACKAGE_NAME = "com.google.android.inputmethod.latin"

// SHA-1 of Gboard's original signing certificate, as PackageInfo.signatures reports it
// (the oldest certificate in the rotation lineage), lower case like Gboard encodes it.
private const val ORIGINAL_CERT_SHA1 = "38918a453d07199354f8b19af05ec6562ced5788"

/**
 * Patching re-signs the app, and may rename it, so Gboard would identify itself to
 * Google APIs with the wrong certificate and package. Send the original values instead.
 */
internal val spoofAndroidCertPatch = bytecodePatch {
    execute {
        AndroidCertHeadersFingerprint.let {
            val mapCall = it.instructionMatches[3]
            val instruction = mapCall.instruction

            // Arguments: "X-Android-Cert", cert, "X-Android-Package", packageName.
            val (certRegister, packageRegister) = when (instruction) {
                is FiveRegisterInstruction -> instruction.registerD to instruction.registerF
                is RegisterRangeInstruction -> (instruction.startRegister + 1) to (instruction.startRegister + 3)
                else -> throw it.patchException()
            }

            it.method.addInstructions(
                mapCall.index,
                """
                    const-string v$certRegister, "$ORIGINAL_CERT_SHA1"
                    const-string v$packageRegister, "$ORIGINAL_PACKAGE_NAME"
                """
            )
        }
    }
}
