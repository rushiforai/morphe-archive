/*
 * Same approach as hoo-dles' "Disable Pairip license check" (GPL-3.0):
 * https://github.com/hoo-dles/morphe-patches/tree/main/patches/src/main/kotlin/hoodles/morphe/patches/all/pairip/license
 * CREDIT FOR THE APPROACH GOES TO hoo-dles.
 */

package semicoloncolonel.mobilestream.patches.shared.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne

// Google's Pairip licensing (com.pairip.licensecheck) asks the Play Store
// whether this install came from Play, and blocks the app when it did not.
// Every re-signed app fails that check. This is the on-device license check
// only; it does not touch Play Integrity attestation.

internal object PairipProcessResponseFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type == "Lcom/pairip/licensecheck/LicenseClient;" && method.name == "processResponse"
    },
)

internal object PairipValidateResponseFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        (classDef.type == "Lcom/pairip/licensecheck/LicenseResponseHelper;" ||
            classDef.type == "Lcom/pairip/licensecheck/ResponseValidator;") &&
            method.name == "validateResponse"
    },
)

@Suppress("unused")
val disablePairipLicenseCheckPatch = bytecodePatch(
    name = "Disable Pairip license check",
    description = "Lets the re-signed app start: Google's Pairip license check otherwise blocks " +
        "any copy not installed from the Play Store. Client-side only; it does not bypass Play " +
        "Integrity attestation.",
) {
    compatibleWith(FoxOne.COMPATIBILITY)

    execute {
        PairipProcessResponseFingerprint.method.apply {
            // Turn off the repeated background check: the sget-boolean of
            // repeatedCheckEnabled becomes a constant false, in place.
            val instructions = implementation!!.instructions.toList()
            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.SGET_BOOLEAN) return@forEachIndexed
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.name != "repeatedCheckEnabled") return@forEachIndexed
                val register = (instruction as OneRegisterInstruction).registerA
                replaceInstruction(index, "const/4 v$register, 0x0")
            }
            // Treat every license response as code 0 (licensed).
            addInstructions(0, "const/4 p1, 0x0")
        }
        // Skip the signature check of the license response.
        PairipValidateResponseFingerprint.method.addInstructions(0, "return-void")
    }
}
