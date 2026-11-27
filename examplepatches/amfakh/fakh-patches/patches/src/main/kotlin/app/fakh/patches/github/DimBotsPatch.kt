/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.DIM_BOTS
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val BOTS = "Lapp/fakh/extension/github/Bots;"

private const val OBJECT = "Ljava/lang/Object;"

/** The list queries and the starts of their row fragments, up to where the new fields go. */
private val ROWS = listOf(
    "fragment PullRequestItemFragment on PullRequest { __typename id ",
    "fragment IssueListItemFragment on Issue { __typename id ",
)

/** The field names that set the parsers of those rows apart. */
private val ROW_NAMES = listOf(
    setOf("titleHTMLString", "headRepositoryOwner", "isReadByViewer"),
    setOf("closedByPullRequestsReferences", "isReadByViewer", "titleHTML"),
)

/** A method found while walking the classes, to be changed afterwards. */
private data class Target(val type: String, val signature: String)

private val Method.signature get() = name + parameterTypes.joinToString("")

/** The p register of the parameter [index] of a static method. */
private fun Method.register(index: Int) =
    parameterTypes.take(index).sumOf { (if (it.toString() == "J" || it.toString() == "D") 2 else 1).toInt() }

/** The app's `Modifier.alpha`: it returns the modifier itself at 1, and a graphics layer otherwise. */
private fun findAlpha(): Method {
    val found = mutableListOf<Method>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val types = method.parameterTypes.map(CharSequence::toString)
            if (!AccessFlags.STATIC.isSet(method.accessFlags) || types.size != 2 || types[1] != "F" ||
                method.returnType != types[0]
            ) {
                return@forEach
            }
            val instructions = method.instructions
            val opaque = instructions.firstOrNull()?.let {
                it.opcode == Opcode.CONST_HIGH16 &&
                    (it as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral ==
                    1f.toRawBits()
            } == true
            val layer = instructions.mapNotNull { it.method }.singleOrNull()
            // The graphics layer clips here; the shadow of the same shape starts with scales instead.
            if (opaque && layer != null && layer.types.size >= 12 && layer.types.take(4) == listOf(types[0], "F", "F", "F") &&
                instructions.any { it.opcode == Opcode.CMPG_FLOAT || it.opcode == Opcode.CMPL_FLOAT }
            ) {
                found += method
            }
        }
    }
    return found.singleOrNull() ?: throw PatchException("Modifier alpha not found: ${found.map { it.definingClass }}")
}

@Suppress("unused")
val dimBotsPatch = patch(
    name = "Dim bots",
    description = "Commits, issues and pull requests by bots are faded in their lists.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(DIM_BOTS)
        val alpha = findAlpha()
        val modifier = alpha.returnType

        val models = mutableMapOf<String, MutableSet<String>>()
        var anyReader: Method? = null
        val queries = mutableSetOf<Target>()
        val parsers = mutableSetOf<String>()
        val prints = listOf("ListItemPullRequest(title=", "ListItemIssue(title=", "CommitItem(commit=", "SimpleCommit(id=")
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val read = method.instructions.mapNotNull { it.string }
                if (method.name == "toString") {
                    prints.filter { it in read }.forEach { models.getOrPut(it) { mutableSetOf() } += classDef.type }
                }
                if (read.any { text -> ROWS.any { it in text } }) queries += Target(classDef.type, method.signature)
                if (method.name == "<clinit>" && ROW_NAMES.any { read.containsAll(it) } &&
                    classDef.methods.any { other -> other.instructions.any { it.selectsName } }
                ) {
                    parsers += classDef.type
                }
            }
        }
        if (queries.isEmpty() || parsers.isEmpty()) throw PatchException("List queries or parsers not found")
        val reader = mutableClassDefBy(parsers.first()).methods
            .firstNotNullOf { method -> method.instructions.firstOrNull { it.selectsName }?.method?.definingClass }
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == OBJECT &&
                    method.parameterTypes.map(CharSequence::toString) == listOf(reader)
                ) {
                    if (anyReader != null) throw PatchException("More than one reader of any JSON value")
                    anyReader = method
                }
            }
        }
        val any = anyReader ?: throw PatchException("Reader of any JSON value not found")

        fun only(print: String) = models[print]?.singleOrNull()
            ?: throw PatchException("Expected one model printing $print: ${models[print]}")
        val rows = setOf(only("ListItemPullRequest(title="), only("ListItemIssue(title="))
        val simple = only("SimpleCommit(id=")
        // Two items hold a commit; the list of commits holds the one with an author.
        val commitItem = models["CommitItem(commit="].orEmpty().singleOrNull { type ->
            classDefByOrNull(type)!!.fields.any { it.type == simple }
        } ?: throw PatchException("Commit list item not found")
        val items = rows + commitItem

        /** The result of the last padding a row composable adds: the modifier its row is drawn with. */
        fun Method.paddedAt() = instructions.indexOfLast { instruction ->
            instruction.method?.let { it.returnType == modifier && it.types == listOf(modifier, "F") } == true
        }.takeIf { it >= 0 && instructions.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT }

        // The composables that take a row and build the modifier it is drawn with.
        val builders = mutableMapOf<Target, String>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val types = method.parameterTypes.map(CharSequence::toString)
                if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V" ||
                    types.lastOrNull() != "I" || method.paddedAt() == null
                ) {
                    return@forEach
                }
                types.firstOrNull { it in items }?.let { builders[Target(classDef.type, method.signature)] = it }
            }
        }
        if (!builders.values.containsAll(items)) throw PatchException("List rows not found: $builders")

        fun find(target: Target) = mutableClassDefBy(target.type).methods.first { it.signature == target.signature }

        builders.forEach { (target, item) ->
            val method = find(target)
            val padded = method.paddedAt()!!
            val register = (method.instructions[padded + 1] as OneRegisterInstruction).registerA
            val parameter = method.register(method.parameterTypes.map(CharSequence::toString).indexOf(item))
            val owner = mutableClassDefBy(target.type)
            if (owner.methods.none { it.name == "fakhDim" }) {
                // The modifier, faded when the row being composed is a bot's.
                owner.methods.add(
                    ImmutableMethod(
                        target.type,
                        "fakhDim",
                        listOf(ImmutableMethodParameter(modifier, null, null)),
                        modifier,
                        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                        null,
                        null,
                        MutableMethodImplementation(2),
                    ).toMutable().apply {
                        addInstructions(0, "return-object p0")
                        addInstructionsWithLabels(
                            0,
                            """
                                invoke-static {}, $BOTS->fades()Z
                                move-result v0
                                if-eqz v0, :keep
                                const/high16 v0, 0x3f000000
                                invoke-static { p0, v0 }, ${alpha.definingClass}->${alpha.name}(${modifier}F)$modifier
                                move-result-object p0
                            """,
                            ExternalLabel("keep", getInstruction(0)),
                        )
                    },
                )
            }
            method.addInstructions(
                padded + 2,
                """
                    invoke-static/range { v$register .. v$register }, ${target.type}->fakhDim($modifier)$modifier
                    move-result-object v$register
                """,
            )
            method.addInstructions(
                0,
                """
                    move-object/from16 v0, p$parameter
                    invoke-static { v0 }, $BOTS->row($OBJECT)V
                """,
            )
        }

        queries.forEach { target ->
            val method = find(target)
            ROWS.forEach { method.addToQuery(it, "fakhKey: id fakhAuthor: author { __typename }") }
        }
        parsers.forEach { readAddedFields(it, BOTS, "id", "author", any) }
    }
}
