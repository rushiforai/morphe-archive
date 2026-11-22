package app.rimixyz.patches.seventrack

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_17TRACK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Original 17TRACK signing certificate SHA-1, extracted from META-INF/CERT.RSA
 * of the unpatched APK (subject: O=DEMON NETWORK TECH CO.LTD, C=CN).
 *
 * This is the value Firebase expects. Morphe re-signs the APK with its own
 * certificate, so we feed the original hash back to Firebase.
 */
private const val ORIGINAL_CERT_SHA1 = "161C5B8B940B90A6EA64A39333A4B1DF851C391A"

@Suppress("unused")
val fixFirebaseAfterResignPatch = patch(
    name = "Fix Firebase after re-signing",
    description = "Restores the original certificate SHA-1 so Firebase Auth (Google login) and push notifications keep working after the APK is re-signed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_17TRACK)

    execute {
        // Fix 1: authoritative source of the hash inside FirebaseInstallations.
        // Overriding this method makes every caller receive the original SHA-1.
        FirebaseFingerprintHashFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "$ORIGINAL_CERT_SHA1"
                return-object v0
            """
        )

        // Fix 2: some Firebase SDK versions compute the header value inline and
        // bypass the method above. Overwrite the value passed to addRequestProperty.
        runCatching {
            val method = FirebaseOpenHttpConnectionFingerprint.method
            val list = method.instructions.toList()

            val headerIndex = list.indexOfFirst { instr ->
                (instr as? ReferenceInstruction)?.reference is StringReference &&
                    ((instr as ReferenceInstruction).reference as StringReference).string == "X-Android-Cert"
            }
            if (headerIndex < 0) return@runCatching

            // There are several addRequestProperty calls before the cert header.
            // Pick the first one AFTER the X-Android-Cert string.
            var addIndex = -1
            for (i in headerIndex until list.size) {
                val instr = list[i]
                if (instr.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instr as? ReferenceInstruction)?.reference as? MethodReference)?.name == "addRequestProperty"
                ) {
                    addIndex = i
                    break
                }
            }
            if (addIndex < 0) return@runCatching

            val valueRegister = (list[addIndex] as FiveRegisterInstruction).registerE
            method.addInstruction(addIndex, "const-string v$valueRegister, \"$ORIGINAL_CERT_SHA1\"")
        }
    }
}
