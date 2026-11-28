/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.ICON_ONLY_BUTTONS
import app.fakh.patches.github.shared.Constants.ICON_ONLY_LIST_BUTTON
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BUTTONS = "Lapp/fakh/extension/github/IconButtons;"

private const val STRING = "Ljava/lang/String;"

private const val LIST = "Ljava/util/List;"

/** The content of the "Finish your review" button, which reads that text. */
private object ReviewButtonFingerprint : Fingerprint(
    filters = listOf(resourceLiteral(ResourceType.STRING, "issue_pr_review_review_finish")),
)

/** The content of the "Re-run" buttons of Actions, which reads that text. */
private object RerunButtonFingerprint : Fingerprint(
    filters = listOf(resourceLiteral(ResourceType.STRING, "actions_rerun_check_button_label")),
)

/** The content of the "Commit changes" button, which reads that text. */
private object CommitButtonFingerprint : Fingerprint(
    filters = listOf(resourceLiteral(ResourceType.STRING, "commit_changes_button_label")),
)

/** The content of a repository's "Add to list" button, which reads that text while the repository is in no list. */
private object ListButtonFingerprint : Fingerprint(
    filters = listOf(resourceLiteral(ResourceType.STRING, "lists_add_to_list")),
)

/** Whether this draws an icon: `(painter, contentDescription, Modifier, tint, Composer, Int, Int)`. */
private val Instruction.isIcon
    get() = method?.types?.let { it.size == 7 && it[1] == STRING && it[3] == "J" && it[5] == "I" && it[6] == "I" } == true

/** Whether this is `Modifier.padding(start, top, end, bottom)` with its default mask. */
private val Instruction.isPadding
    get() = method?.let {
        it.types == listOf(it.returnType, "F", "F", "F", "F", "I") && it.returnType.startsWith("L")
    } == true

/**
 * The places of the padding after the icon, the icon and the upper-casing of the text in the content of a button with
 * an icon, or null when this method draws no such content.
 */
private fun buttonContent(instructions: List<Instruction>): Triple<Int, Int, Int>? {
    instructions.forEachIndexed { upperAt, instruction ->
        val call = instruction.method ?: return@forEachIndexed
        if (call.definingClass != STRING || call.name != "toUpperCase") return@forEachIndexed
        val from = maxOf(0, upperAt - 30)
        val iconAt = (from until upperAt).lastOrNull { instructions[it].isIcon } ?: return@forEachIndexed
        val paddingAt = (from until iconAt).lastOrNull { instructions[it].isPadding } ?: return@forEachIndexed
        // An optional icon is boxed, which tells this content from one whose icon is always there.
        if ((paddingAt until iconAt).any { instructions[it].method?.name == "intValue" }) {
            return Triple(paddingAt, iconAt, upperAt)
        }
    }
    return null
}

/** Drops the text of a button with an icon when it is a floating one, and the space between the two. */
private fun MutableMethod.hideText(places: Triple<Int, Int, Int>) {
    val (paddingAt, iconAt, upperAt) = places
    val instructions = implementation!!.instructions.toList()
    val label = (instructions[upperAt] as Instruction35c).registerC
    if ((paddingAt until upperAt).any {
            val between = instructions[it]
            between.opcode.setsRegister() && (between as OneRegisterInstruction).registerA == label
        }
    ) {
        throw PatchException("Button content: the label register changes before the text")
    }
    val gap = (instructions[paddingAt] as? RegisterRangeInstruction)?.startRegister?.plus(3)
        ?: throw PatchException("Button content: padding registers not found")
    val description = (instructions[iconAt] as? RegisterRangeInstruction)?.startRegister?.plus(1)
        ?: throw PatchException("Button content: icon registers not found")

    // From the last place to the first, so the earlier ones stay where they were found. The registers changed for a
    // call get their value back, since later code may read them again.
    addInstructions(
        iconAt + 1,
        """
            const/16 v$description, 0x0
            invoke-static/range { v$label .. v$label }, $BUTTONS->text($STRING)$STRING
            move-result-object v$label
        """,
    )
    addInstructions(
        iconAt,
        """
            invoke-static/range { v$label .. v$label }, $BUTTONS->description($STRING)$STRING
            move-result-object v$description
        """,
    )
    addInstructions(paddingAt + 2, "const/high16 v$gap, 0x41000000")
    addInstructions(
        paddingAt,
        """
            invoke-static/range { v$label .. v$label }, $BUTTONS->gap($STRING)F
            move-result v$gap
        """,
    )
}

/**
 * Drops the text of the buttons in this method that upper-case their label and end in a menu arrow, and gives the arrow
 * the label to read out. The extension leaves every other upper-cased text as it is.
 */
private fun MutableMethod.hideMenuText(): Int {
    val instructions = implementation!!.instructions.toList()
    var hidden = 0
    instructions.indices.reversed().forEach { upperAt ->
        val call = instructions[upperAt].method ?: return@forEach
        if (call.definingClass != STRING || call.name != "toUpperCase") return@forEach
        // The arrow is the next icon, drawn before the code leaves this branch.
        val arrowAt = (upperAt + 1 until instructions.size)
            .takeWhile { instructions[it].opcode.canContinue() }
            .firstOrNull { instructions[it].isIcon } ?: return@forEach
        val text = (instructions[upperAt + 1] as OneRegisterInstruction).registerA
        val description = (instructions[arrowAt] as? RegisterRangeInstruction)?.startRegister?.plus(1)
            ?: throw PatchException("Menu button: arrow registers not found")

        addInstructions(arrowAt + 1, "const/16 v$description, 0x0")
        addInstructions(
            arrowAt,
            """
                invoke-static {}, $BUTTONS->menuDescription()$STRING
                move-result-object v$description
            """,
        )
        addInstructions(
            upperAt + 2,
            """
                invoke-static/range { v$text .. v$text }, $BUTTONS->menuText($STRING)$STRING
                move-result-object v$text
            """,
        )
        hidden++
    }
    return hidden
}

@Suppress("unused")
val iconOnlyButtonsPatch = patch(
    name = "Icon-only floating buttons",
    description = "Shows floating buttons, such as Comment, Re-run and Commit changes, without their text.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(ICON_ONLY_BUTTONS)
        val contents = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                if (buttonContent(instructions) != null) contents += classDef.type to method.name
            }
        }
        if (contents.isEmpty()) throw PatchException("Button content not found")
        contents.forEach { (type, name) ->
            val method = mutableClassDefBy(type).methods.first {
                it.name == name && buttonContent(it.implementation?.instructions?.toList().orEmpty()) != null
            }
            method.hideText(buttonContent(method.implementation!!.instructions.toList())!!)
        }

        // The matches of one fingerprint are one per method, and both labels can be read in the same one.
        val menus = listOf(RerunButtonFingerprint, CommitButtonFingerprint).map { fingerprint ->
            fingerprint.matchAll().map { it.method }.ifEmpty { throw PatchException("Menu button not found") }
        }
        menus.flatten().distinct().forEach {
            if (it.hideMenuText() == 0) throw PatchException("Menu button content not found in ${it.definingClass}")
        }

        // The review button keeps its icon and the arrow of its menu.
        var reviews = 0
        ReviewButtonFingerprint.matchAll().forEach { match ->
            val method = match.method
            val instructions = method.implementation!!.instructions.toList()
            val literalAt = match.instructionMatches.first().index
            val iconAt = (literalAt downTo 0).firstOrNull { instructions[it].isIcon } ?: return@forEach
            val textAt = (literalAt until instructions.size).first {
                instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT
            }
            val text = (instructions[textAt] as OneRegisterInstruction).registerA
            val description = (instructions[iconAt] as RegisterRangeInstruction).startRegister + 1

            method.addInstructions(
                textAt + 1,
                """
                    invoke-static/range { v$text .. v$text }, $BUTTONS->reviewText($STRING)$STRING
                    move-result-object v$text
                """,
            )
            method.addInstructions(iconAt + 1, "const/16 v$description, 0x0")
            method.addInstructions(
                iconAt,
                """
                    invoke-static {}, $BUTTONS->reviewDescription()$STRING
                    move-result-object v$description
                """,
            )
            reviews++
        }
        if (reviews == 0) throw PatchException("Finish your review button not found")
    }
}

/**
 * The places that stretch the Add to list button: the row of Star and Add to list weighs that button, and the
 * repository header weighs the whole row. Each pair is a method and the index of its call that takes the weight's fill
 * flag last.
 */
private fun listWeights(): List<Pair<Method, Int>> {
    val content = ListButtonFingerprint.method.definingClass
    val methods = mutableListOf<Method>()
    classDefForEach { methods += it.methods }
    fun Method.callAt(target: Method) = instructions.indexOfFirst {
        val call = it.method
        call?.definingClass == target.definingClass && call.name == target.name && call.types == target.types
    }
    fun one(what: String, matches: (Method) -> Boolean) =
        methods.singleOrNull(matches) ?: throw PatchException("Add to list button: $what not found")

    // (modifier, lists, onClick, composer, flags)
    val button = one("the button") { method ->
        method.types.size == 5 && method.types[1] == LIST &&
            method.instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == content }
    }
    // (modifier, starred, lists, ...)
    val row = one("its row") {
        it.types.size > 5 && it.types[1] == "Z" && it.types[2] == LIST && it.callAt(button) >= 0
    }
    val wrapper = one("the wrapper of its row") { it !== row && it.types == row.types && it.callAt(row) >= 0 }

    val rowWeightAt = (row.callAt(button) downTo 0).firstOrNull {
        val call = row.instructions[it].method
        call?.name == "<init>" && call.types == listOf("F", "Z")
    } ?: throw PatchException("Add to list button: its weight not found")
    val weight = row.instructions[rowWeightAt].method!!.definingClass

    fun Method.weighsAt() = instructions.indexOfFirst {
        val call = it.method
        call?.returnType == weight && call.types.takeLast(2) == listOf("F", "Z")
    }
    val header = one("the repository header") { it.callAt(wrapper) >= 0 && it.weighsAt() >= 0 }
    return listOf(row to rowWeightAt, header to header.weighsAt())
}

/** Has the extension decide the fill flag that the call at [index] takes as its last argument. */
private fun MutableMethod.decideFill(index: Int) {
    val call = implementation!!.instructions.toList()[index] as? Instruction35c
        ?: throw PatchException("Add to list button: weight registers not found")
    val fill = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)
        .take(call.registerCount)
        .last()
    addInstructions(
        index,
        """
            invoke-static/range { v$fill .. v$fill }, $BUTTONS->listFill(Z)Z
            move-result v$fill
        """,
    )
}

@Suppress("unused")
val iconOnlyListButtonPatch = patch(
    name = "Icon-only Add to list button",
    description = "Shows the Add to list button of a repository without its text, as small as the icon buttons beside " +
        "it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(ICON_ONLY_LIST_BUTTON)

        // The content upper-cases its label, then makes the padding that keeps the label away from the icon.
        val method = ListButtonFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val upperAt = (ListButtonFingerprint.instructionMatches.first().index until instructions.size).firstOrNull {
            val call = instructions[it].method
            call?.definingClass == STRING && call.name == "toUpperCase"
        } ?: throw PatchException("Add to list button: the upper-casing of its text not found")
        val paddingAt = (upperAt until instructions.size).firstOrNull {
            instructions[it].method?.types == listOf("F", "F", "F", "F", "I")
        } ?: throw PatchException("Add to list button: the padding of its text not found")
        val label = (instructions[upperAt + 1] as OneRegisterInstruction).registerA
        val padding = instructions[paddingAt] as? Instruction35c
            ?: throw PatchException("Add to list button: padding registers not found")
        val gap = padding.registerC
        if (gap in listOf(padding.registerD, padding.registerE, padding.registerF)) {
            throw PatchException("Add to list button: the start padding shares its register")
        }

        listWeights().forEach { (weighed, at) ->
            mutableClassDefBy(weighed.definingClass).methods.single {
                it.name == weighed.name && it.parameterTypes == weighed.parameterTypes
            }.decideFill(at)
        }

        // From the later place to the earlier one, so the earlier one stays where it was found.
        method.addInstructions(
            paddingAt,
            """
                invoke-static/range { v$gap .. v$gap }, $BUTTONS->listGap(F)F
                move-result v$gap
            """,
        )
        method.addInstructions(
            upperAt + 2,
            """
                invoke-static/range { v$label .. v$label }, $BUTTONS->listText($STRING)$STRING
                move-result-object v$label
            """,
        )
    }
}
