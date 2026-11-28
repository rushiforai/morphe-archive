/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.imo.patches.features

import app.imo.patches.menu.imoMenuRowPatch
import app.imo.patches.shared.Constants.COMPATIBILITY_IMO
import app.imo.patches.signin.imoSignaturePatch
import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TABS = "Lapp/loki/extension/LokiTabs;"

/**
 * The emoji row above IMO's chat box is a small helper class (obfuscated) that fills a LinearLayout with suggestions,
 * including a hard-coded dice, and sends one on a tap. Its usage report is the only stable text in it: the event is
 * named "guinan" and carries "text_location".
 */
private val suggestionReport = Fingerprint(
    returnType = "V",
    strings = listOf("text_location", "guinan"),
)

@Suppress("unused")
val hideEmojiSuggestionsPatch = bytecodePatch(
    name = "Hide emoji suggestions (IMO)",
    description = "Removes the row of emojis above the chat box in IMO, where one tap sends the emoji straight away.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IMO)
    dependsOn(imoSignaturePatch)
    dependsOn(menuFlagPatch("app.loki.menu.hidesuggest"))
    dependsOn(imoMenuRowPatch)

    execute {
        // IMO's own code runs unchanged; only the strip's setVisibility calls are routed through a helper, one call for
        // one call, so no branch or return moves. Skipping IMO's code instead crashed the chat screen.
        val strip = mutableClassDefBy(suggestionReport.classDef)
        var rewritten = 0
        strip.methods.forEach { method ->
            method.visibilityCalls().sortedDescending().forEach { index ->
                val call = method.implementation!!.instructions.elementAt(index) as FiveRegisterInstruction
                method.replaceInstruction(
                    index,
                    "invoke-static {${method.registerName(call.registerC)}, ${method.registerName(call.registerD)}}, " +
                        "$TABS->suggestionVisibility(Landroid/view/View;I)V",
                )
                rewritten++
            }
        }
        if (rewritten == 0) throw PatchException("IMO: the suggestion row shows itself nowhere")
    }
}

private fun Method.visibilityCalls(): List<Int> {
    val code = implementation?.instructions ?: return emptyList()
    val found = mutableListOf<Int>()
    code.forEachIndexed { index, instruction ->
        if (instruction !is FiveRegisterInstruction || instruction.opcode.name != "invoke-virtual") return@forEachIndexed
        val target = (instruction as ReferenceInstruction).reference as? MethodReference ?: return@forEachIndexed
        if (target.name == "setVisibility" && target.parameterTypes.joinToString("") == "I" &&
            target.returnType == "V" && instruction.registerCount == 2
        ) found += index
    }
    return found
}

private fun Method.registerName(register: Int): String {
    val parameterWords = parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 as Int } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val locals = implementation!!.registerCount - parameterWords
    return if (register < locals) "v$register" else "p${register - locals}"
}
