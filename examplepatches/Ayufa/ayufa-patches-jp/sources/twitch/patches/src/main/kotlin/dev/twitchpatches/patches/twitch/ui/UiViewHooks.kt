package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.twitchpatches.patches.twitch.shared.*

internal fun BytecodePatchContext.injectUiViews() {
    uiViewTypes.forEach { (name, base) ->
        val type = "L${name.replace('.', '/')};"
        val parent = "L${base.replace('.', '/')};"
        if (!base.startsWith("android.widget.")) {
            val original = mutableClassDefBy(parent)
            require(original.methods.any { it.name == "<init>" &&
                it.parameterTypes == listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;") }) {
                "UI settings: $base XML constructor changed."
            }
            original.accessFlags = original.accessFlags and AccessFlags.FINAL.value.inv()
        }
        val wrapper = mutableClassDefBy(type)
        val previous = wrapper.superclass
        wrapper.setSuperClass(parent)
        wrapper.methods.forEach { method ->
            method.code().withIndex().filter { (_, instruction) ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == previous
            }.forEach { (index, instruction) ->
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                val replacement = ImmutableMethodReference(parent, reference.name, reference.parameterTypes, reference.returnType)
                method.replaceInstruction(index, when (instruction) {
                    is FiveRegisterInstruction -> BuilderInstruction35c(instruction.opcode, instruction.registerCount,
                        instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG, replacement)
                    is RegisterRangeInstruction -> BuilderInstruction3rc(instruction.opcode, instruction.startRegister, instruction.registerCount, replacement)
                    else -> error("UI settings: unsupported view constructor invocation.")
                })
            }
        }
    }
}
