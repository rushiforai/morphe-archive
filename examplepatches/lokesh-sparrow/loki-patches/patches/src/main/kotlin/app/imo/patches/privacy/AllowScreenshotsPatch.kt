/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.imo.patches.privacy

import app.imo.patches.menu.imoMenuRowPatch
import app.imo.patches.shared.Constants.COMPATIBILITY_IMO
import app.imo.patches.signin.imoSignaturePatch
import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SECURE = "Lapp/loki/extension/LokiSecure;"

/** One call to rewrite: the owner and name it has now, and the helper that replaces it. */
private class Swap(val owner: String, val name: String, val descriptor: String, val helper: String)

private val swaps = listOf(
    Swap("Landroid/view/Window;", "addFlags", "(I)V", "addFlags(Landroid/view/Window;I)V"),
    Swap("Landroid/view/Window;", "setFlags", "(II)V", "setFlags(Landroid/view/Window;II)V"),
    Swap("Landroid/view/SurfaceView;", "setSecure", "(Z)V", "setSecure(Landroid/view/SurfaceView;Z)V"),
)

@Suppress("unused")
val allowScreenshotsPatch = bytecodePatch(
    name = "Allow screenshots (IMO)",
    description = "Lets you take screenshots and record the screen everywhere in IMO, including chat media, " +
        "profile photos, calls and protected chats.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IMO)
    dependsOn(imoSignaturePatch)
    dependsOn(menuFlagPatch("app.loki.menu.screenshots"))
    dependsOn(imoMenuRowPatch)

    execute {
        // IMO blocks screenshots in a dozen places, each under a different obfuscated name. Rather than naming them,
        // every call that could set the secure bit is routed through a helper that drops it.
        var rewritten = 0
        classDefForEach { classDef ->
            // Never touch our own helper: it makes the real calls, and rewriting it would make it call itself.
            if (classDef.type.startsWith("Landroid/") || classDef.type.startsWith("Lkotlin/") ||
                classDef.type.startsWith("Lapp/loki/")) return@classDefForEach
            val hit = classDef.methods.any { method -> method.swapTargets().isNotEmpty() }
            if (!hit) return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                // Walk from the end so earlier indexes stay valid.
                method.swapTargets().sortedByDescending { it.first }.forEach { (index, swap) ->
                    val call = method.implementation!!.instructions.elementAt(index) as FiveRegisterInstruction
                    val registers = when (call.registerCount) {
                        1 -> "{${method.registerName(call.registerC)}}"
                        2 -> "{${method.registerName(call.registerC)}, ${method.registerName(call.registerD)}}"
                        else -> "{${method.registerName(call.registerC)}, ${method.registerName(call.registerD)}, " +
                            "${method.registerName(call.registerE)}}"
                    }
                    method.replaceInstruction(index, "invoke-static $registers, $SECURE->${swap.helper}")
                    rewritten++
                }
            }
        }
        if (rewritten == 0) throw PatchException("IMO: no screenshot block was found to remove")
    }
}

private fun Method.swapTargets(): List<Pair<Int, Swap>> {
    val code = implementation?.instructions ?: return emptyList()
    val found = mutableListOf<Pair<Int, Swap>>()
    code.forEachIndexed { index, instruction ->
        if (instruction !is FiveRegisterInstruction || instruction.opcode.name != "invoke-virtual") return@forEachIndexed
        val target = (instruction as ReferenceInstruction).reference as? MethodReference ?: return@forEachIndexed
        val swap = swaps.firstOrNull {
            it.owner == target.definingClass && it.name == target.name &&
                "(" + target.parameterTypes.joinToString("") + ")" + target.returnType == it.descriptor
        } ?: return@forEachIndexed
        found += index to swap
    }
    return found
}

/**
 * The smali name of [register]: the first `registerCount - parameters` registers are `v`, the parameters after them are
 * `p` (counting `this` for an instance method). Writing `v7` for what the assembler calls `p1` is invalid.
 */
private fun Method.registerName(register: Int): String {
    val parameterWords = parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 as Int } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val locals = implementation!!.registerCount - parameterWords
    return if (register < locals) "v$register" else "p${register - locals}"
}
