package app.morphe.patches.bongobdandroidtv.content

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.bongobdandroidtv.extension.sharedExtensionPatch
import app.morphe.patches.bongobdandroidtv.shared.Constants.COMPATIBILITY_BONGOANDROIDTV
import app.morphe.util.getReference
import app.morphe.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/bongo/patches/FreeContentPatch;"

@Suppress("unused")
val freeContentPatch = bytecodePatch(
    name = "Free content",
    description = "Use alternative api to get content details.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BONGOANDROIDTV)

    dependsOn(sharedExtensionPatch)

    execute {
        GetVideoDetailsDataInvokerFingerprint.matchAllMethodIndicesForEach {
            if (definingClass == EXTENSION_CLASS) return@matchAllMethodIndicesForEach
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