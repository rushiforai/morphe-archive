package app.morphe.patches.amazon.AmazonLunaTV

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Fingerprint wykrywający metodę w CodecUtils, w której inicjalizowany jest CodecConfig
 */
object CodecUtilsFingerprint : Fingerprint(
    filters = listOf(
        string("adaptive-playback"),
        string("CodecConfig")
    )
)

val lunaTVFixLagAndCompPatch = bytecodePatch(
    name = "Luna Low Latency Codecs",
    description = "Forces Amazon Luna to avoid codecs not supporting low latency, reducing input lag (based on mocelet patch).",
    default = true
) {
    compatibleWith("com.amazon.spiderpork")

    execute {
        val method = CodecUtilsFingerprint.method
        val instructionsList = method.implementation!!.instructions.toList()

        var targetIndex = -1
        for ((i, insn) in instructionsList.withIndex()) {
            if (insn.opcode == Opcode.INVOKE_DIRECT) {
                val methodRef = (insn as? Instruction35c)?.reference as? MethodReference
                if (methodRef?.definingClass?.contains("CodecConfig") == true && methodRef.name == "<init>") {
                    targetIndex = i
                    break
                }
            }
        }

        if (targetIndex == -1) {
            throw IllegalStateException("CodecConfig constructor invocation not found.")
        }

        method.addInstructions(
            targetIndex + 1,
            """
                invoke-virtual {v0}, Lcom/amazon/spiderpork/streamconfig/codec/CodecConfig;->isLowLatency()Z
                move-result v1
                if-nez v1, :cond_low_latency
                const/4 v1, 0x0
                return-object v1
                :cond_low_latency
            """
        )
    }
}