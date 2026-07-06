package app.morphe.patches.piko.misc.shim.methods.broadcast.component

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.onReceiveFingerprint
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.cleanup
import app.morphe.patches.piko.util.toJavaClass
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

val componentFactoryPatch = bytecodePatch(
    description = "ComponentFactory",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        ComponentFactoryConstructorFingerprint.let {
            it.method.apply {
                val firstMatch = it.instructionMatches.first()
                val firstClass = firstMatch.instruction
                    .getReference<TypeReference>()!!
                    .type
                val className = firstClass.toJavaClass()
                val firstIndex = firstMatch.index
                val lastIndex = it.instructionMatches.last().index
                val register = getInstruction<OneRegisterInstruction>(lastIndex).registerA

                addInstruction(
                    lastIndex,
                    "const-string v$register, \"$className\""
                )
                removeInstructions(firstIndex, lastIndex)
            }
        }

        val appComponentFactoryClasses = mutableSetOf<String>()
        val isBroadcastReceiver: Instruction.() -> Boolean = {
            opcode == Opcode.NEW_INSTANCE &&
                    getReference<TypeReference>()?.type?.startsWith(COMPONENT_FACTORY_PREFIX) == true
        }

        ComponentFactoryBroadcastReceiverFingerprint.let {
            it.method.apply {
                val firstIndex = indexOfFirstInstructionOrThrow(filter = isBroadcastReceiver)
                val lastIndex = indexOfFirstInstructionReversedOrThrow(filter = isBroadcastReceiver)
                val firstType = getInstruction<ReferenceInstruction>(firstIndex).reference.toString()
                val lastType = getInstruction<ReferenceInstruction>(lastIndex).reference.toString()
                appComponentFactoryClasses.add(firstType)
                appComponentFactoryClasses.add(lastType)
            }
        }

        appComponentFactoryClasses.forEach { appComponentFactoryClass ->
            onReceiveFingerprint(appComponentFactoryClass).method.apply {
                cleanup()
                addInstruction(
                    0,
                    "return-void"
                )
            }
        }
    }
}
