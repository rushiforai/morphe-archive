/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.COLLAPSE_BOTS
import app.fakh.patches.github.shared.Constants.HIDE_LOW_QUALITY
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val COMMENTS = "Lapp/fakh/extension/github/Comments;"

private const val STRING = "Ljava/lang/String;"

private const val OBJECT = "Ljava/lang/Object;"

private const val LIST = "Ljava/util/List;"

private const val ARRAY_LIST = "Ljava/util/ArrayList;"

/** The name of the HTML getter, by each interface of the comment models. */
private val htmlGetters = mutableMapOf<String, String>()

/**
 * Wraps the HTML getter of the comment model [type]. The model is built from a response fragment, an address and the
 * kind of the comment, and stores five strings, the third of which is the HTML, and two authors, the first of which
 * wrote the comment. It also keeps how that author is related to the repository.
 */
private fun collapse(type: String, author: String) {
    val comment = mutableClassDefBy(type)
    val constructor = comment.methods.single { it.name == "<init>" }
    val stored = constructor.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field }
    val html = stored.filter { it.type == STRING }[2]
    val writer = stored.first { it.type == author }
    val kind = stored.single { it.type == constructor.parameterTypes[2].toString() }
    val association = stored.single { it.type.endsWith("/CommentAuthorAssociation;") }
    val getter = comment.methods.singleOrNull { method ->
        method.parameterTypes.isEmpty() && method.returnType == STRING &&
            method.instructions.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT) &&
            method.instructions.first().field?.name == html.name
    } ?: throw PatchException("Comment HTML getter not found in $type")

    comment.methods.add(
        ImmutableMethod(
            type,
            "fakhBody",
            listOf(ImmutableMethodParameter(type, null, null)),
            STRING,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    iget-object v0, p0, ${writer.smali}
                    iget-object v1, p0, ${html.smali}
                    iget-object v2, p0, ${kind.smali}
                    iget-object v3, p0, ${association.smali}
                    invoke-static { v0, v1, v2, v3 }, $COMMENTS->body($OBJECT$STRING$OBJECT$OBJECT)$STRING
                    move-result-object v0
                    return-object v0
                """,
            )
        },
    )
    comment.interfaces.forEach { htmlGetters[it] = getter.name }
    getter.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p0 }, $type->fakhBody($type)$STRING
            move-result-object v0
            return-object v0
        """,
    )
}

/**
 * Passes the HTML of every comment through the extension, which changes it when one of the patches below asks for it.
 */
private val commentBodyPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        var author: String? = null
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val read = method.instructions.mapNotNull { it.string }
                if (method.name == "toString" && "Author(loginString=" in read) author = classDef.type
            }
        }
        val authorType = author ?: throw PatchException("Comment author model not found")

        // Every comment model: it stores an author and an editor next to five strings, from three arguments.
        val comments = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.interfaces.isEmpty()) return@classDefForEach
            val constructor = classDef.methods.singleOrNull { it.name == "<init>" } ?: return@classDefForEach
            val types = constructor.parameterTypes.map(CharSequence::toString)
            if (types.size != 3 || types[1] != STRING) return@classDefForEach
            val stored = constructor.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field?.type }
            if (stored.count { it == authorType } == 2 && stored.count { it == STRING } == 5) comments += classDef.type
        }
        if (comments.isEmpty()) throw PatchException("Comment models not found")
        comments.forEach { collapse(it, authorType) }
    }
}

/**
 * Adds `fakhNotice(items)` to the class of the timeline builder: when comments were left out, it puts a line saying so,
 * styled like a timeline event, and the space under it at the start of the built items.
 */
private fun addNoticeMethod(builder: MutableMethod) {
    /** The class whose toString starts a text with [start], among those [accept] takes. */
    fun printing(start: String, accept: (String) -> Boolean = { true }): String {
        val found = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { method ->
                    method.name == "toString" && method.instructions.any { it.string?.startsWith(start) == true }
                } && accept(classDef.type)
            ) {
                found += classDef.type
            }
        }
        return found.singleOrNull() ?: throw PatchException("Expected one class printing $start, found $found")
    }

    val created = builder.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.typeReference }
    val event = printing("ListItemSpannableText(uniqueId=")
    val text = printing("SimpleString(value=")
    val space = printing("ListItemSpacer(uniqueId=") { it in created }
    val single = printing("SingleItem(singleItem=")

    fun constructor(type: String, match: (List<String>) -> Boolean) =
        mutableClassDefBy(type).methods.single { it.name == "<init>" && match(it.types) }
    // An event with the usual colors: an id, an icon, a text, a date, the words that can be tapped and the defaults.
    val newEvent = constructor(event) { it.size == 6 && it[0] == STRING && it[4] == LIST && it[5] == "I" }
    val newSpace = constructor(space) { it.size == 3 && it[0] == STRING && it[2] == "Z" }
    val newSingle = constructor(single) { it.size == 1 }
    val sizeType = newSpace.types[1]
    // R8 names the constants in their order, so the first is the one under a comment.
    val size = mutableClassDefBy(sizeType).staticFields.filter { it.type == sizeType }.minByOrNull { it.name }
        ?: throw PatchException("Timeline space sizes not found")

    val owner = builder.definingClass
    mutableClassDefBy(owner).methods.add(
        ImmutableMethod(
            owner,
            "fakhNotice",
            listOf(ImmutableMethodParameter(ARRAY_LIST, null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(9),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $COMMENTS->notice()$STRING
                    move-result-object v1
                    if-eqz v1, :none
                    new-instance v0, $text
                    invoke-direct { v0, v1 }, $text-><init>($STRING)V
                    new-instance v1, $event
                    const-string v2, "fakh_hidden_comments"
                    invoke-static {}, $COMMENTS->icon()I
                    move-result v3
                    move-object v4, v0
                    const/4 v5, 0x0
                    invoke-static {}, Ljava/util/Collections;->emptyList()$LIST
                    move-result-object v6
                    const/16 v7, 0xc
                    invoke-direct/range { v1 .. v7 }, ${newEvent.smali}
                    new-instance v0, $single
                    invoke-direct { v0, v1 }, ${newSingle.smali}
                    const/4 v2, 0x0
                    invoke-virtual { p0, v2, v0 }, $ARRAY_LIST->add(I$OBJECT)V
                    new-instance v1, $space
                    const-string v2, "fakh_hidden_comments_space"
                    sget-object v3, ${size.smali}
                    const/4 v4, 0x1
                    invoke-direct { v1, v2, v3, v4 }, ${newSpace.smali}
                    new-instance v0, $single
                    invoke-direct { v0, v1 }, ${newSingle.smali}
                    const/4 v2, 0x1
                    invoke-virtual { p0, v2, v0 }, $ARRAY_LIST->add(I$OBJECT)V
                    :none
                    return-void
                """,
            )
        },
    )
}

/**
 * Has the builder of issue and pull request timelines leave out the comments the extension marks. It reads the list of
 * items several times, by position too, so every read gets the same filtered list. The built items start with a line
 * saying how many comments are missing.
 */
private fun hideFromTimelines() {
    var timeline: String? = null
    var comment: String? = null
    var header: String? = null
    classDefForEach { classDef ->
        classDef.methods.filter { it.name == "toString" }.forEach { method ->
            val read = method.instructions.mapNotNull { it.string }
            if (read.any { it.startsWith("Timeline(issueOrPullId=") }) timeline = classDef.type
            if (read.any { it.startsWith("TimelineIssueComment(comment=") }) comment = classDef.type
            if (read.any { it.startsWith("ListItemCommentHeader(comment=") }) header = classDef.type
        }
    }
    val timelineType = timeline ?: throw PatchException("Timeline model not found")
    val commentType = comment ?: throw PatchException("Timeline comment model not found")
    val headerType = header ?: throw PatchException("Comment header item not found")

    // The model stores the comment itself first, then its reactions and flags.
    val commentClass = mutableClassDefBy(commentType)
    val commentInterface = commentClass.methods.first { it.name == "<init>" }.parameterTypes[0].toString()
    val field = commentClass.fields.single { it.type == commentInterface }
    val getter = htmlGetters[commentInterface] ?: throw PatchException("Timeline comment HTML getter not found")

    val extension = mutableClassDefBy(COMMENTS)
    val stub = extension.methods.single { it.name == "html" }
    extension.methods.remove(stub)
    extension.methods.add(
        ImmutableMethod(
            COMMENTS,
            stub.name,
            listOf(ImmutableMethodParameter(OBJECT, null, null)),
            STRING,
            stub.accessFlags,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    instance-of v0, p0, $commentType
                    if-eqz v0, :other
                    check-cast p0, $commentType
                    iget-object v0, p0, $commentType->${field.name}:$commentInterface
                    invoke-interface { v0 }, $commentInterface->$getter()$STRING
                    move-result-object v0
                    return-object v0
                    :other
                    const/4 v0, 0x0
                    return-object v0
                """,
            )
        },
    )

    val builders = mutableListOf<Pair<String, String>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val used = method.instructions
            if (used.any { it.opcode == Opcode.INSTANCE_OF && it.typeReference == commentType } &&
                used.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == headerType }
            ) {
                builders += classDef.type to method.name
            }
        }
    }
    val (type, name) = builders.singleOrNull() ?: throw PatchException("Timeline builder not found: $builders")
    val builder = mutableClassDefBy(type).methods.single { method ->
        method.name == name && method.instructions.any { it.typeReference == commentType }
    }
    val reads = builder.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IGET_OBJECT &&
            instruction.field?.let { it.definingClass == timelineType && it.type == LIST } == true
    }
    if (reads.isEmpty()) throw PatchException("Timeline builder does not read the items")
    reads.asReversed().forEach { (index, instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        builder.addInstructions(
            index + 1,
            """
                invoke-static/range { v$register .. v$register }, $COMMENTS->visible($LIST)$LIST
                move-result-object v$register
            """,
        )
    }

    addNoticeMethod(builder)
    builder.instructions.indices.filter { builder.instructions[it].opcode == Opcode.RETURN_OBJECT }.asReversed()
        .forEach { index ->
            val register = (builder.instructions[index] as OneRegisterInstruction).registerA
            // A jump to the return lands on the replaced instruction, so the call goes there.
            builder.replaceInstruction(index, "invoke-static/range { v$register .. v$register }, " +
                "${builder.definingClass}->fakhNotice($ARRAY_LIST)V")
            builder.addInstructions(index + 1, "return-object v$register")
        }
}

@Suppress("unused")
val collapseBotCommentsPatch = patch(
    name = "Collapse bot comments",
    description = "Comments by bots and agents such as Copilot start collapsed. Descriptions stay open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(commentBodyPatch, githubSettingsPatch)

    execute {
        register(COLLAPSE_BOTS)
    }
}

@Suppress("unused")
val hideLowQualityCommentsPatch = patch(
    name = "Hide low-quality comments",
    description = "Hides issue and pull request comments that only say +1, me too or ask for news.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(commentBodyPatch, githubSettingsPatch)

    execute {
        register(HIDE_LOW_QUALITY)
        hideFromTimelines()
    }
}
