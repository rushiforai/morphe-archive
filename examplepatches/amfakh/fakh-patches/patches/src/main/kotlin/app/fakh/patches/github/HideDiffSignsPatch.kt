/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.HIDE_DIFF_SIGNS
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val DIFF_SIGNS = "Lapp/fakh/extension/github/DiffSigns;"

private const val DIFF_LINE_TYPE = "Lcom/github/service/models/response/type/DiffLineType;"

private const val COMMENT_LEVEL_TYPE = "Lcom/github/service/models/response/fileschanged/CommentLevelType;"

private const val TEXT_VIEW = "Landroid/widget/TextView;"

private const val STRING = "Ljava/lang/String;"

@Suppress("unused")
val hideDiffSignsPatch = patch(
    name = "Hide + and - diff signs",
    description = "Hides the + and - signs on diff lines since additions and deletions are already color coded.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, codeOptionsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(HIDE_DIFF_SIGNS)

        val htmlBinders = mutableListOf<MethodReference>()
        val diffBgColors = mutableListOf<MethodReference>()
        val composeDiffLines = mutableListOf<Pair<String, String>>()

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (!AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
                val types = method.types
                if (method.returnType == "V" && types.size == 6 && types[1] == TEXT_VIEW &&
                    types[2] == STRING && types[4] == "Z" && types[5] == "I" &&
                    method.instructions.any { it.method?.definingClass == "Landroid/text/Html;" }
                ) {
                    htmlBinders += method
                }
                if (method.returnType == "I" && types.size == 3 &&
                    types[0] == DIFF_LINE_TYPE && types[2] == COMMENT_LEVEL_TYPE
                ) {
                    diffBgColors += method
                }
                if (method.returnType == "V" && types.size == 8 &&
                    types[1] == STRING && types[2] == DIFF_LINE_TYPE &&
                    types[3] == "I" && types[4] == "F" && types[7] == "I"
                ) {
                    composeDiffLines += classDef.type to method.name + types.joinToString("")
                }
            }
        }

        val binder = htmlBinders.singleOrNull()
            ?: throw PatchException("Expected one diff HTML binder, found $htmlBinders")
        val bgColor = diffBgColors.singleOrNull()
            ?: throw PatchException("Expected one diff background color helper, found $diffBgColors")
        val (composeType, composeSig) = composeDiffLines.singleOrNull()
            ?: throw PatchException("Expected one Compose diff line, found $composeDiffLines")

        // Hook classic diff line ViewHolders that bind HTML and then look up the diff line background color.
        var hookedHolders = 0
        val targets = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val calls = method.instructions.mapNotNull { it.method }
                if (calls.any { it.smali == binder.smali } && calls.any { it.smali == bgColor.smali }) {
                    targets += classDef.type to method.name + method.parameterTypes.joinToString("")
                }
            }
        }
        targets.forEach { (type, sig) ->
            val method = mutableClassDefBy(type).methods.first {
                it.name + it.parameterTypes.joinToString("") == sig
            }
            val instructions = method.instructions
            val bgIndices = instructions.indices.filter { instructions[it].method?.smali == bgColor.smali }
            val bindIndices = instructions.indices.filter { instructions[it].method?.smali == binder.smali }
            val edits = (bgIndices.map { it to true } + bindIndices.map { it to false }).sortedByDescending { it.first }
            edits.forEach { (index, isBg) ->
                val instr = instructions[index]
                if (isBg) {
                    val typeReg = when (instr) {
                        is FiveRegisterInstruction -> instr.registerC
                        is RegisterRangeInstruction -> instr.startRegister
                        else -> return@forEach
                    }
                    method.addInstructions(
                        index,
                        "invoke-static/range { v$typeReg .. v$typeReg }, $DIFF_SIGNS->apply(Ljava/lang/Object;)V",
                    )
                } else {
                    val viewReg = when (instr) {
                        is FiveRegisterInstruction -> instr.registerD
                        is RegisterRangeInstruction -> instr.startRegister + 1
                        else -> return@forEach
                    }
                    method.addInstructions(
                        index + 1,
                        "invoke-static/range { v$viewReg .. v$viewReg }, $DIFF_SIGNS->track($TEXT_VIEW)V",
                    )
                }
                hookedHolders++
            }
        }
        if (hookedHolders == 0) throw PatchException("Diff line binders not found")

        // Hook Compose diff line renderer.
        val composeMethod = mutableClassDefBy(composeType).methods.first {
            it.name + it.parameterTypes.joinToString("") == composeSig
        }
        composeMethod.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p2 }, $DIFF_SIGNS->hideText(${STRING}Ljava/lang/Object;)$STRING
                move-result-object p1
            """,
        )
    }
}
