package app.danielthemaniel.patches.campfire

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

// Shared plumbing for the Campfire patches.

internal const val JS_INJECTOR = "Lcom/getcapacitor/JSInjector;"
internal const val STRING = "Ljava/lang/String;"

/** Loads extensions/campfire.dex once, however many Campfire patches are selected. */
internal val campfireExtensionPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_CAMPFIRE)
    extendWith("extensions/campfire.dex")
    execute { }
}

/** Before every `return-object vX`: vX = [filter](vX). [filter] is a static T -> T descriptor. */
internal fun MutableMethod.filterReturns(filter: String) {
    val returns = implementation!!.instructions
        .withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { it.index }
        .reversed() // inserting shifts later indices, so walk backwards
    if (returns.isEmpty()) throw PatchException("No return-object in $name")

    returns.forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructions(
            index,
            """
                invoke-static/range {v$register .. v$register}, $filter
                move-result-object v$register
            """,
        )
    }
}

/**
 * JSInjector.getScriptString() builds the JS Capacitor injects at the top of index.html, before
 * any app script. Each Campfire patch appends its own snippet through this.
 */
internal fun MutableMethod?.orScriptStringNotFound(): MutableMethod =
    this ?: throw PatchException("JSInjector.getScriptString() not found")
