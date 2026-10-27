package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.twitchpatches.patches.twitch.shared.*

private val barRequests = mapOf(
    "Landroid/view/View;->setSystemUiVisibility(I)V" to "setSystemUiVisibility",
    "Landroid/view/WindowInsetsController;->show(I)V" to "showSystemBars",
)

internal fun BytecodePatchContext.injectUiBarRequests() {
    val matches = mutableListOf<Pair<String, String>>()
    classDefForEach { owner ->
        if (!owner.type.startsWith("Ldev/twitchpatches/extension/")) owner.methods.forEach { method ->
            if (method.references().any { it.toString() in barRequests }) matches.add(owner.type to method.reference)
        }
    }
    val found = mutableSetOf<String>()
    matches.forEach { (owner, reference) ->
        val method = mutableClassDefBy(owner).methods.single { it.reference == reference }
        found.addAll(rewriteUiBarRequests(method))
    }
    require(found == barRequests.keys) { "UI settings: system bar request paths changed." }
}

internal fun rewriteUiBarRequests(method: MutableMethod): Set<String> {
    val found = mutableSetOf<String>()
    method.code().withIndex().forEach { (index, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEach
        val name = barRequests[reference.toString()] ?: return@forEach
        val target = ImmutableMethodReference(UI_SETTINGS, name, listOf(reference.definingClass, "I"), "V")
        method.replaceInstruction(index, when (instruction) {
            is FiveRegisterInstruction -> {
                require(instruction.registerCount == 2) { "UI settings: system bar arguments changed." }
                BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, instruction.registerC, instruction.registerD, 0, 0, 0, target)
            }
            is RegisterRangeInstruction -> {
                require(instruction.registerCount == 2) { "UI settings: system bar range changed." }
                BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, instruction.startRegister, 2, target)
            }
            else -> error("UI settings: unsupported system bar invocation.")
        })
        found.add(reference.toString())
    }
    return found
}
