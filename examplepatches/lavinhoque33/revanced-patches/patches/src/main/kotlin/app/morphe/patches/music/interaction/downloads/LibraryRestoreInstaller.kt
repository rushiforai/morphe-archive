/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val LIBRARY_RESTORE = "Lapp/morphe/extension/music/patches/downloads/LibraryRestore;"
private const val STRING = "Ljava/lang/String;"

/** The open step of the tab navigation: the one method of the app that takes a tab id and a command. */
private object TabNavigationFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("FEmusic_search", "hide_search_back_action"),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 2 &&
            method.parameterTypes[0] == STRING
    },
)

private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/** Where a method reads the saved command: `Optional.orElse(start)`, the result cast to the command type. */
private class SavedCommandRead(val orElseIndex: Int, val callIndex: Int)

/**
 * The index of the `Optional.orElse` whose cast result is passed, with a tab id, to [target] (matched by name and
 * parameter types, as the call is made through an interface in some versions), or null when the method does not.
 */
private fun Method.savedCommandRead(target: Method): SavedCommandRead? {
    val code = implementation?.instructions?.toList() ?: return null
    val call = code.indexOfFirst {
        val ref = it.methodRef()
        (it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_INTERFACE) &&
            ref?.name == target.name && ref.parameterTypes == target.parameterTypes && ref.returnType == "V"
    }
    if (call < 0) return null

    val orElse = (0 until call).lastOrNull {
        val ref = code[it].methodRef()
        code[it].opcode == Opcode.INVOKE_VIRTUAL && ref?.name == "orElse" && ref.definingClass == "Lj$/util/Optional;"
    } ?: return null

    val resultIsCast = code.getOrNull(orElse + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        code.getOrNull(orElse + 2)?.opcode == Opcode.CHECK_CAST
    return if (resultIsCast) SavedCommandRead(orElse, call) else null
}

/**
 * Makes the Library tab start at the Library after a restart: the consumer of the saved Library page, which the
 * online restore of the tab runs, hands its command to [LIBRARY_RESTORE] first. Found from the tab navigation method
 * (the strings of its search page) and the one method that reads the saved command with `Optional.orElse` and then
 * opens it; the offline start and the Downloads chip do not go through it. A version that does not match keeps the
 * app's own restore.
 */
internal fun BytecodePatchContext.installLibraryRestore() {
    try {
        val navigation = TabNavigationFingerprint.matchSingle().method
        val consumer = Fingerprint(
            returnType = "V",
            custom = { method, _ -> method.savedCommandRead(navigation) != null },
        ).matchSingle()

        val read = consumer.method.savedCommandRead(navigation)!!
        val code = consumer.method.implementation!!.instructions.toList()
        val orElse = code[read.orElseIndex] as FiveRegisterInstruction
        val result = code[read.orElseIndex + 1] as OneRegisterInstruction
        val commandType = ((code[read.orElseIndex + 2] as ReferenceInstruction).reference as TypeReference).type

        mutableClassDefBy(consumer.classDef.type).findMutableMethodOf(consumer.method).addInstructions(
            read.orElseIndex + 3, """
                invoke-static {v${result.registerA}, v${orElse.registerD}}, $LIBRARY_RESTORE->restoreLibraryStart(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v${result.registerA}
                check-cast v${result.registerA}, $commandType
            """
        )
        printInfo("Library restore: ${consumer.classDef.type}->${consumer.method.name}, " +
            "start ${navigation.definingClass}->${navigation.name}")
    } catch (ex: Exception) {
        printWarn("The Library start after a restart is unavailable on this Music version: ${ex.message}")
    }
}
