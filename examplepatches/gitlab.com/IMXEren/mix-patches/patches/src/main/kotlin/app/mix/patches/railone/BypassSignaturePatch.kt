package app.mix.patches.railone

import app.mix.patches.all.detection.signature.pms.spoofSignatureVerificationPatch
import app.mix.patches.all.firebase.installations.baseSpoofAndroidCertPatch
import app.mix.patches.railone.shared.Constants.COMPATIBILITY_RAILONE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

const val CERT_SHA1 = "83174593a46d78f3e1d79571c2da71b22cd8f8b9"

@Suppress("unused")
val bypassSignaturePatch = bytecodePatch(
    name = "Bypass signature check",
    description = "Bypasses app anti-tampering protection so to work when signed by a different signature.",
) {
    compatibleWith(COMPATIBILITY_RAILONE)

    dependsOn(
        neutralizeNativeKillPatch,
        spoofSignatureVerificationPatch,
        baseSpoofAndroidCertPatch {
            CERT_SHA1
        }
    )

    execute {
        setResultValue(IsSignatureValidFingerprint, "0x1")

        NativeCheckFingerprint1.method.returnEarly(null)
        NativeCheckFingerprint2.method.returnEarly()

        VulCheckFingerprint1.method.returnEarly()
        VulCheckFingerprint2.method.returnEarly()
    }
}

context(_: BytecodePatchContext)
internal fun setResultValue(fingerprint: Fingerprint, value: String) {
    val method = fingerprint.method
    val insertIndex = fingerprint.instructionMatches[1].index + 1

    val successInstruction = method.instructions
        .drop(insertIndex)
        .firstOrNull { instruction ->
            val reference =
                (instruction as? ReferenceInstruction)?.reference as? MethodReference

            instruction.opcode == Opcode.INVOKE_INTERFACE &&
                    reference?.name == "success" &&
                    reference.parameterTypes == listOf("Ljava/lang/Object;") &&
                    reference.returnType == "V"
        }

    val successReference = (successInstruction as ReferenceInstruction).reference as MethodReference
    val invokeInstruction = successInstruction as FiveRegisterInstruction

    val resultRegister = invokeInstruction.registerC
    val valueRegister = invokeInstruction.registerD

    method.addInstructions(
        insertIndex,
        """
            const/4 v$valueRegister, $value
            invoke-static {v$valueRegister}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
            move-result-object v$valueRegister
            invoke-interface {v$resultRegister, v$valueRegister}, $successReference
            return-void
        """,
    )
}