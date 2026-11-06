package com.openbubbles.wear.patches

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

internal const val SETTINGS_SCREEN = "Lcom/localob/messaging/app/settings/SettingsScreen_androidKt;"
internal const val ACCOUNT_SECTION = "Lcom/localob/messaging/app/settings/AccountStatusSectionKt;"
private val settingsHook = ImmutableMethodReference("Lcom/openbubbles/wear/patch/PatchSettings;",
    "accountStatusAndPatches", listOf("Landroidx/compose/runtime/Composer;", "I"), "V")

internal fun BytecodePatchContext.addSettingsMenu() {
    val settings = classDefBy(SETTINGS_SCREEN)
    val calls = settings.methods.flatMap { method ->
        method.implementation?.instructions?.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (reference?.definingClass == ACCOUNT_SECTION && reference.name == "AccountStatusSection" &&
                reference.parameterTypes.map(CharSequence::toString) == settingsHook.parameterTypes &&
                reference.returnType == "V") method.name to index else null
        }.orEmpty()
    }
    if (calls.size != 1) throw PatchException("Expected one account settings section; refusing an ambiguous menu hook")
    val (name, index) = calls.single()
    val method = mutableClassDefBy(SETTINGS_SCREEN).methods.single { it.name == name }
    val instruction = method.implementation!!.instructions[index]
    method.replaceInstruction(index, settingsMenuCall(instruction))
}

internal fun settingsMenuCall(instruction: Instruction): BuilderInstruction = when {
    instruction.opcode == Opcode.INVOKE_STATIC && instruction is Instruction35c && instruction.registerCount == 2 ->
        BuilderInstruction35c(instruction.opcode, 2, instruction.registerC, instruction.registerD,
            instruction.registerE, instruction.registerF, instruction.registerG, settingsHook)
    instruction.opcode == Opcode.INVOKE_STATIC_RANGE && instruction is Instruction3rc && instruction.registerCount == 2 ->
        BuilderInstruction3rc(instruction.opcode, instruction.startRegister, 2, settingsHook)
    else -> throw PatchException("Unsupported account settings invocation")
}
