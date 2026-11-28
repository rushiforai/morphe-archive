/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.SHOW_COMMIT_TAGS
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val COMMIT_TAGS_CLASS = "Lapp/fakh/extension/github/CommitTags;"

private const val STRING = "Ljava/lang/String;"

private const val LIST = "Ljava/util/List;"

private const val OBJECT = "Ljava/lang/Object;"

/** Anchor in the Commits query right inside `... on Repository {`. */
private const val REPO_ANCHOR = "... on Repository { "

/** GraphQL selection that fetches the latest 100 tags and their target commit ids. */
private const val TAGS_FIELD =
    "fakhTags: refs(refPrefix: \"refs/tags/\", first: 100, orderBy: { field: TAG_COMMIT_DATE, direction: DESC }) " +
        "{ nodes { name repository { id } target { ... on Commit { id } ... on Tag { target { ... on Commit { id } } } } } }"

/** Adds the single `fakhTags` field to a repository fragment parser whose only field is `gitObject`. */
private fun hookSingleFieldParser(type: String, any: MethodReference) {
    val parserClass = mutableClassDefBy(type)
    val parser = parserClass.methods.single { method -> method.instructions.any { it.selectsName } }
    val instructions = parser.instructions
    val selectAt = instructions.indices.single { instructions[it].selectsName }
    val reader = instructions[selectAt].method!!.definingClass
    val readerParam = parser.implementation!!.registerCount - 2

    parserClass.methods.add(
        ImmutableMethod(
            type,
            "fakhTags",
            listOf(ImmutableMethodParameter(reader, null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    invoke-static { p0 }, ${any.smali}
                    move-result-object v0
                    invoke-static { v0 }, $COMMIT_TAGS_CLASS->tags($OBJECT)V
                    return-void
                """,
            )
        },
    )

    val register = (instructions[selectAt + 1] as OneRegisterInstruction).registerA
    val loopTarget = if (instructions[selectAt - 1].opcode == Opcode.SGET_OBJECT) {
        instructions[selectAt - 1]
    } else {
        instructions[selectAt]
    }
    parser.addInstructionsWithLabels(
        selectAt + 2,
        """
            add-int/lit8 v$register, v$register, -1
            if-eqz v$register, :fakh_tags
            add-int/lit8 v$register, v$register, 1
            goto :fakh_done
            :fakh_tags
            invoke-static/range { v$readerParam .. v$readerParam }, $type->fakhTags($reader)V
            goto/32 :fakh_next
        """,
        ExternalLabel("fakh_next", loopTarget),
        ExternalLabel("fakh_done", instructions[selectAt + 2]),
    )

    val classInit = parserClass.methods.single { it.name == "<clinit>" }
    val init = classInit.instructions
    val listAt = init.indices.single { init[it].method?.returnType == LIST }
    val listReg = (init[listAt + 1] as OneRegisterInstruction).registerA
    classInit.addInstructions(
        listAt + 2,
        """
            invoke-static/range { v$listReg .. v$listReg }, $COMMIT_TAGS_CLASS->names($LIST)$LIST
            move-result-object v$listReg
        """,
    )
}

@Suppress("unused")
val showTagsOnCommitsPatch = patch(
    name = "Show tags on commits",
    description = "Displays git tags next to matching commits in commit lists.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(SHOW_COMMIT_TAGS)

        val queries = mutableListOf<Pair<String, String>>()
        val parsers = mutableListOf<String>()
        var commitModel: String? = null
        var metaItem: String? = null
        var formattedTitle: String? = null

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val read = method.instructions.mapNotNull { it.string }
                if (read.any { REPO_ANCHOR in it && "history(first: 25" in it }) {
                    queries += classDef.type to method.name
                }
                if (method.name == "<clinit>" && read == listOf("gitObject") &&
                    classDef.methods.any { other -> other.instructions.any { it.selectsName } }
                ) {
                    parsers += classDef.type
                }
                if (method.name == "toString" && "SimpleCommit(id=" in read) commitModel = classDef.type
                if (method.name == "toString" && read.any { it.startsWith("EmojiInlineContent(annotatedText=") }) {
                    formattedTitle = classDef.type
                }
                if (method.name == "toString" && "SimpleMetadataItem(text=" in read) metaItem = classDef.type
            }
        }
        val commitType = commitModel ?: throw PatchException("SimpleCommit model not found")
        val itemType = metaItem ?: throw PatchException("SimpleMetadataItem not found")
        val titleType = formattedTitle ?: throw PatchException("Formatted title model not found")
        if (queries.isEmpty() || parsers.isEmpty()) {
            throw PatchException("Commits queries or repository parsers not found: $queries, $parsers")
        }

        // Find the app's AnyAdapter reader `(Reader)Object`.
        val reader = mutableClassDefBy(parsers.first()).methods
            .firstNotNullOf { method -> method.instructions.firstOrNull { it.selectsName }?.method?.definingClass }
        var anyReader: Method? = null
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == OBJECT &&
                    method.types == listOf(reader)
                ) {
                    anyReader = method
                }
            }
        }
        val any = anyReader ?: throw PatchException("Any JSON reader not found")

        queries.forEach { (type, name) ->
            mutableClassDefBy(type).methods.filter { it.name == name }.forEach {
                it.addToQuery(REPO_ANCHOR, TAGS_FIELD)
            }
        }
        parsers.forEach { hookSingleFieldParser(it, any) }

        // Find SimpleMetadataItem's composable (`ls9.o`), constructor (`m610.<init>`), padding, and Modifier.Companion.
        val itemClass = classDefByOrNull(itemType) ?: throw PatchException("SimpleMetadataItem class not found")
        val itemInit = itemClass.methods.single { it.name == "<init>" && it.types.size == 8 }
        var chipMethod: MethodReference? = null
        classDefForEach { classDef ->
            if (chipMethod != null) return@classDefForEach
            classDef.methods.forEach { m ->
                val types = m.types
                if (AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
                    types.size == 6 && types[2] == itemType && types[4] == "I" && types[5] == "I"
                ) {
                    chipMethod = m
                }
            }
        }
        val chip = chipMethod ?: throw PatchException("SimpleMetadataItem composable not found")
        val modifier = chip.types[0]
        val composer = chip.types[3]

        // The app's chip leaves room on both sides, which would push a tag in from the avatar above it. The one method
        // that reads a chip's model and pads a modifier sideways asks the extension how much.
        val paddedChips = mutableListOf<Pair<String, String>>()
        fun Instruction.padsSideways() = method?.let {
            it.returnType == modifier && it.types == listOf(modifier, "F", "F", "I")
        } == true
        classDefForEach { classDef ->
            classDef.methods.forEach { m ->
                val body = m.instructions
                if (body.any { it.field?.definingClass == itemType && it.opcode == Opcode.IGET_OBJECT } &&
                    body.any { it.padsSideways() }
                ) {
                    paddedChips += classDef.type to m.name + m.parameterTypes.joinToString("")
                }
            }
        }
        val (chipOwnerType, chipSig) = paddedChips.singleOrNull()
            ?: throw PatchException("Expected one padded chip composable, found $paddedChips")
        val padded = mutableClassDefBy(chipOwnerType).methods.first {
            it.name + it.parameterTypes.joinToString("") == chipSig
        }
        // The method draws other things too, so the chip's padding is the first one after the chip's model is read.
        val chipReadAt = padded.instructions.indexOfFirst {
            it.field?.definingClass == itemType && it.opcode == Opcode.IGET_OBJECT
        }
        val padAt = padded.instructions.indices.firstOrNull { it > chipReadAt && padded.instructions[it].padsSideways() }
            ?: throw PatchException("Chip padding not found")
        val itemRegister = padded.instructions.take(padAt)
            .last { it.field?.definingClass == itemType && it.opcode == Opcode.IGET_OBJECT }
            .let { (it as TwoRegisterInstruction).registerB }
        val roomRegister = (padded.instructions[padAt] as FiveRegisterInstruction).registerD
        if (itemRegister > 15 || roomRegister > 15) {
            throw PatchException("Chip padding registers out of range: $itemRegister, $roomRegister")
        }
        padded.addInstructions(
            padAt,
            """
                invoke-static { v$itemRegister, v$roomRegister }, $COMMIT_TAGS_CLASS->inset(${OBJECT}F)F
                move-result v$roomRegister
            """,
        )

        // The commit row composable (`a0` case 20) reads a commit, composes, and formats the commit's title.
        val commitRows = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { m ->
                val body = m.instructions
                if (body.any { it.field?.definingClass == commitType && it.opcode == Opcode.IGET_OBJECT } &&
                    body.any { it.method?.definingClass == composer } &&
                    body.any { it.method?.returnType == titleType && it.method?.types == listOf(STRING) }
                ) {
                    commitRows += classDef.type to m.name + m.parameterTypes.joinToString("")
                }
            }
        }
        val (rowOwnerType, rowSig) = commitRows.singleOrNull()
            ?: throw PatchException("Expected one commit list row composable, found $commitRows")
        val rowOwner = mutableClassDefBy(rowOwnerType)
        val rowMethod = rowOwner.methods.first { it.name + it.parameterTypes.joinToString("") == rowSig }
        val body = rowMethod.instructions

        val commitIdField = classDefByOrNull(commitType)!!.methods.single { it.name == "<init>" }
            .instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field }
            .first { it.type == STRING }

        val startGroup = body.mapNotNull { it.method }.firstOrNull {
            it.definingClass == composer && it.types == listOf("I") && it.returnType == "V"
        } ?: throw PatchException("Commit row: startGroup not found")
        val endGroup = body.mapNotNull { it.method }.firstOrNull {
            it.definingClass == composer && it.types == listOf("Z") && it.returnType == "V"
        } ?: throw PatchException("Commit row: endGroup not found")
        val companion = body.first {
            it.opcode == Opcode.SGET_OBJECT && it.field?.let { f ->
                f.type == f.definingClass && classDefByOrNull(f.type)?.interfaces?.contains(modifier) == true
            } == true
        }.field!!
        val padding = body.firstNotNullOfOrNull {
            it.method?.takeIf { ref ->
                ref.types == listOf(modifier, "F", "F", "F", "F", "I") && ref.returnType == modifier
            }
        } ?: throw PatchException("Commit row: padding not found")

        // Find the end of the SimpleCommit block: two consecutive `composer.q(true)` (`endGroup(1)`) after reading SimpleCommit.
        val firstCommitRead = body.indexOfFirst { it.opcode == Opcode.IGET_OBJECT && it.field?.definingClass == commitType }
        val commitReg = (body[firstCommitRead] as TwoRegisterInstruction).registerB
        val endPairAt = (firstCommitRead until body.size - 2).firstOrNull { i ->
            body[i].method?.smali == endGroup.smali && body[i + 1].method?.smali == endGroup.smali
        } ?: throw PatchException("Commit row: end of author row and column not found")
        val composerReg = (body[endPairAt] as FiveRegisterInstruction).registerC

        rowOwner.methods.add(
            ImmutableMethod(
                rowOwnerType,
                "fakhCommitTags",
                listOf(
                    ImmutableMethodParameter(commitType, null, null),
                    ImmutableMethodParameter(composer, null, null),
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(14),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        const v0, 0x66616b74
                        invoke-virtual { p1, v0 }, ${startGroup.smali}
                        iget-object v0, p0, ${commitIdField.smali}
                        invoke-static { v0 }, $COMMIT_TAGS_CLASS->text($STRING)$STRING
                        move-result-object v1
                        if-eqz v1, :end

                        new-instance v0, $itemType
                        invoke-static {}, $COMMIT_TAGS_CLASS->icon()I
                        move-result v2
                        invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                        move-result-object v2
                        const/4 v3, 0x0
                        const/4 v4, 0x0
                        const/4 v5, 0x0
                        const/4 v6, 0x0
                        const/4 v7, 0x0
                        const/16 v8, 0xfc
                        invoke-direct/range { v0 .. v8 }, ${itemInit.smali}
                        invoke-static { v0 }, $COMMIT_TAGS_CLASS->chip($OBJECT)V

                        sget-object v1, ${companion.smali}
                        const/4 v2, 0x0
                        const/high16 v3, 0x40800000
                        const/4 v4, 0x0
                        const/4 v5, 0x0
                        const/16 v6, 0xd
                        invoke-static/range { v1 .. v6 }, ${padding.smali}
                        move-result-object v2

                        const/4 v1, 0x0
                        move-object v3, v0
                        move-object/from16 v4, p1
                        const/4 v5, 0x0
                        const/4 v6, 0x1
                        invoke-static/range { v1 .. v6 }, ${chip.smali}

                        :end
                        const/4 v0, 0x0
                        invoke-virtual { p1, v0 }, ${endGroup.smali}
                        return-void
                    """,
                )
            },
        )

        // Capture SimpleCommit right where it is first read (its register is reused later in the block),
        // then draw the tag chip right after closing the author Row (before closing the Column).
        rowOwner.staticFields.add(
            com.android.tools.smali.dexlib2.immutable.ImmutableField(
                rowOwnerType,
                "fakhCommit",
                commitType,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                null,
            ).toMutable(),
        )
        rowOwner.methods.add(
            ImmutableMethod(
                rowOwnerType,
                "fakhSetCommit",
                listOf(ImmutableMethodParameter(commitType, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(1),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        sput-object p0, $rowOwnerType->fakhCommit:$commitType
                        return-void
                    """,
                )
            },
        )
        rowOwner.methods.add(
            ImmutableMethod(
                rowOwnerType,
                "fakhDrawTags",
                listOf(ImmutableMethodParameter(composer, null, null)),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(2),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        sget-object v0, $rowOwnerType->fakhCommit:$commitType
                        invoke-static { v0, p0 }, $rowOwnerType->fakhCommitTags($commitType$composer)V
                        return-void
                    """,
                )
            },
        )
        rowMethod.addInstructions(
            endPairAt + 1,
            "invoke-static/range { v$composerReg .. v$composerReg }, $rowOwnerType->fakhDrawTags($composer)V",
        )
        rowMethod.addInstructions(
            firstCommitRead,
            "invoke-static/range { v$commitReg .. v$commitReg }, $rowOwnerType->fakhSetCommit($commitType)V",
        )
    }
}
