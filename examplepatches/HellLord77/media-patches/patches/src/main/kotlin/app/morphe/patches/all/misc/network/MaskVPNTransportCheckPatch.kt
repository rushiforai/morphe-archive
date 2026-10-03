package app.morphe.patches.all.misc.network

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/network/patches/MaskVPNTransportPatch;"

val maskVPNTransportPatch = bytecodePatch(
    name = "Mask VPN transport check",
    description = "Masks VPN transport check, allowing to inspect traffic via a proxy.",
    default = false
) {
    extendWith("extensions/network.mpe")

    execute {
        HasTransportMethodCallFingerprint.matchAllMethodIndicesForEach {
            val instruction = getInstruction<FiveRegisterInstruction>(it)
            val reference = instruction.getReference<MethodReference>()!!

            replaceInstruction(
                it, BuilderInstruction35c(
                    Opcode.INVOKE_STATIC,
                    instruction.registerCount,
                    instruction.registerC,
                    instruction.registerD,
                    instruction.registerE,
                    instruction.registerF,
                    instruction.registerG,
                    ImmutableMethodReference(
                        EXTENSION_CLASS,
                        reference.name,
                        listOf(reference.definingClass) + reference.parameterTypes,
                        reference.returnType
                    )
                )
            )
        }
    }
}