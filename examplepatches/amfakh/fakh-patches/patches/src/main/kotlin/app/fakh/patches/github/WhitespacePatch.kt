/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.WHITESPACE as WHITESPACE_SWITCH
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WHITESPACE = "Lapp/fakh/extension/github/Whitespace;"

private const val STRING = "Ljava/lang/String;"

/** The visitor that rewrites each text of a code line's HTML, turning spaces and tabs into non-breaking spaces. */
private object CodeTextFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(" ", " ", "\t", "​"),
)

/** The conversion of a file or diff line's HTML into the HTML the app shows. */
private object CodeLineFingerprint : Fingerprint(
    strings = listOf("<span>", "</span>", "<br/>"),
    custom = { method, _ ->
        method.parameterTypes.size == 3 && method.parameterTypes.first().toString() == STRING &&
            method.parameterTypes.last().toString() == "Z"
    },
)

/** Code taken as plain text from a shown line, such as for copying: it drops the app's zero width spaces. */
private object LineTextFingerprint : Fingerprint(
    strings = listOf("​"),
    custom = { method, _ -> method.implementation?.instructions?.any { it.method?.isFromHtml == true } == true },
)

private val MethodReference.isFromHtml
    get() = definingClass == "Landroid/text/Html;" && name == "fromHtml" && parameterTypes.size == 2

/**
 * Passes the string a call returns through an extension method, after each call that matches.
 *
 * @param function The name of the method of [WHITESPACE] that takes and returns a string.
 * @param match The calls whose result goes through it.
 * @param limit The most calls to change, from the first one on.
 * @return The number of calls changed.
 */
private fun MutableMethod.mapResults(
    function: String,
    limit: Int = Int.MAX_VALUE,
    match: (MethodReference) -> Boolean,
): Int {
    val instructions = implementation!!.instructions.toList()
    val results = instructions.indices.filter { index ->
        index > 0 && instructions[index].opcode == Opcode.MOVE_RESULT_OBJECT &&
            instructions[index - 1].method?.let(match) == true
    }.take(limit)
    results.asReversed().forEach { index ->
        val register = (instructions[index] as OneRegisterInstruction).registerA
        addInstructions(
            index + 1,
            """
                invoke-static/range { v$register .. v$register }, $WHITESPACE->$function($STRING)$STRING
                move-result-object v$register
            """,
        )
    }
    return results.size
}

@Suppress("unused")
val showWhitespacePatch = patch(
    name = "Show whitespace",
    description = "Shows spaces as dim dots and tabs as dim » marks in files and diffs. Copied lines stay as they are.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(WHITESPACE_SWITCH)
        // The text of the line, the first string the visitor reads, before the app replaces its spaces.
        val marked = CodeTextFingerprint.method.mapResults("mark", limit = 1) {
            it.parameterTypes.isEmpty() && it.returnType == STRING && it.name != "toString"
        }
        if (marked != 1) throw PatchException("Code line text read not found: $marked")

        // Every string the converter builds, so the finished line gets the symbols; the others hold no marks.
        val shown = CodeLineFingerprint.method.mapResults("show") {
            it.returnType == STRING && it.parameterTypes.map(CharSequence::toString) == listOf(STRING, STRING, STRING)
        }
        if (shown == 0) throw PatchException("Code line result not found")

        val copies = LineTextFingerprint.matchAll()
        val hidden = copies.sumOf { match ->
            val method = match.method
            val instructions = method.implementation!!.instructions.toList()
            // The toString of the Spanned that fromHtml returns.
            val results = instructions.indices.filter { index ->
                index > 2 && instructions[index].opcode == Opcode.MOVE_RESULT_OBJECT &&
                    instructions[index - 1].method?.name == "toString" &&
                    instructions[index - 3].method?.isFromHtml == true
            }
            results.asReversed().forEach { index ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                method.addInstructions(
                    index + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $WHITESPACE->hide($STRING)$STRING
                        move-result-object v$register
                    """,
                )
            }
            results.size
        }
        if (hidden == 0) throw PatchException("Copied line text not found")
    }
}
