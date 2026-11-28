/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.WHITESPACE_MARKS as WHITESPACE_SWITCH
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WHITESPACE_MARKS = "Lapp/fakh/extension/github/WhitespaceMarks;"

private const val STRING = "Ljava/lang/String;"

private const val DIFF_LINE_TYPE = "Lcom/github/service/models/response/type/DiffLineType;"

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
 * @param function The name of the method of [WHITESPACE_MARKS] that takes and returns a string.
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
                invoke-static/range { v$register .. v$register }, $WHITESPACE_MARKS->$function($STRING)$STRING
                move-result-object v$register
            """,
        )
    }
    return results.size
}

/** Hands the text of each piece of a file or diff line to the extension, before the app replaces its whitespace. */
internal val codeTextPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        // The first string the visitor reads is the text.
        val marked = CodeTextFingerprint.method.mapResults("mark", limit = 1) {
            it.parameterTypes.isEmpty() && it.returnType == STRING && it.name != "toString"
        }
        if (marked != 1) throw PatchException("Code line text read not found: $marked")
    }
}

/**
 * Hands the HTML of each diff line to the extension before the app converts it, where the type of the line is at hand:
 * the callers of [converter] that first pick its syntax colors by that type.
 */
private fun keepSignColumns(converter: MethodReference) {
    val callers = mutableListOf<Pair<String, String>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.instructions.any { it.method?.smali == converter.smali }) {
                callers += classDef.type to method.name + method.types.joinToString("")
            }
        }
    }
    val hooked = callers.count { (type, signature) ->
        val method = mutableClassDefBy(type).methods.first { it.name + it.types.joinToString("") == signature }
        val instructions = method.instructions
        val convertAt = instructions.indexOfFirst { it.method?.smali == converter.smali }
        val colorsAt = (convertAt downTo 0).firstOrNull {
            val call = instructions[it].method
            call?.types == listOf(DIFF_LINE_TYPE) && call.returnType == converter.types[1]
        } ?: return@count false
        val html = (instructions[convertAt] as? Instruction35c)?.registerC
        val lineType = (instructions[colorsAt] as? Instruction35c)?.registerC
        if (html == null || lineType == null) throw PatchException("Diff line registers not found in $type")
        method.addInstructions(
            colorsAt,
            """
                invoke-static { v$html, v$lineType }, $WHITESPACE_MARKS->signColumn(${STRING}Ljava/lang/Object;)$STRING
                move-result-object v$html
            """,
        )
        true
    }
    if (hooked == 0) throw PatchException("Diff line conversions not found")
}

@Suppress("unused")
val showWhitespaceMarksPatch = patch(
    name = "Show whitespace marks",
    description = "Shows spaces as dim dots and tabs as dim » marks in files and diffs. Copied lines stay as they are.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, codeTextPatch, codeOptionsPatch)

    execute {
        register(WHITESPACE_SWITCH)

        // Every string the converter builds, so the finished line gets the symbols; the others hold no marks.
        val shown = CodeLineFingerprint.method.mapResults("show") {
            it.returnType == STRING && it.parameterTypes.map(CharSequence::toString) == listOf(STRING, STRING, STRING)
        }
        if (shown == 0) throw PatchException("Code line result not found")
        keepSignColumns(CodeLineFingerprint.method)

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
                        invoke-static/range { v$register .. v$register }, $WHITESPACE_MARKS->hide($STRING)$STRING
                        move-result-object v$register
                    """,
                )
            }
            results.size
        }
        if (hidden == 0) throw PatchException("Copied line text not found")
    }
}
