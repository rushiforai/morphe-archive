/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.CONVENTIONAL_COMMITS
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
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CONVENTIONAL = "Lapp/fakh/extension/github/ConventionalCommits;"

private const val STRING = "Ljava/lang/String;"

private const val CHARS = "Ljava/lang/CharSequence;"

private const val SET_TEXT = "Landroid/widget/TextView;->setText($CHARS)V"

private const val TEXT_VIEW = "Landroid/widget/TextView;"

private const val MAP = "Ljava/util/Map;"

private const val FROM_HTML = "Landroid/text/Html;->fromHtml($STRING" +
    "ILandroid/text/Html\$ImageGetter;Landroid/text/Html\$TagHandler;)Landroid/text/Spanned;"

/** A place where a text view is given a title, right after reading it from its model. */
private data class TitleView(val type: String, val signature: String, val index: Int, val text: Int)

/** The headline of a commit row: the first string its constructor stores. */
private fun headlineOf(model: String) =
    classDefByOrNull(model)!!.methods.single { it.name == "<init>" && !AccessFlags.SYNTHETIC.isSet(it.accessFlags) }
        .instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field }
        .firstOrNull { it.type == STRING } ?: throw PatchException("Commit headline not found in $model")

/** The calls that put [title] on a text view. */
private fun titleViews(title: FieldReference): List<TitleView> {
    val found = mutableListOf<TitleView>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val instructions = method.instructions
            for (index in 1 until instructions.size) {
                if (instructions[index].method?.smali != SET_TEXT) continue
                val call = instructions[index] as? FiveRegisterInstruction ?: continue
                val read = instructions[index - 1]
                if (read.opcode != Opcode.IGET_OBJECT || read.field?.smali != title.smali) continue
                if ((read as TwoRegisterInstruction).registerA != call.registerD) continue
                found += TitleView(
                    classDef.type,
                    method.name + method.parameterTypes.joinToString(""),
                    index,
                    call.registerC,
                )
            }
        }
    }
    return found
}

/** Whether one of the class's toString strings is [text]. */
private fun ClassDef.printsAs(text: String) =
    methods.any { method -> method.name == "toString" && method.instructions.any { it.string == text } }

/** The only class whose toString has [text]. */
private fun modelPrinting(text: String): ClassDef {
    val found = mutableListOf<ClassDef>()
    classDefForEach { if (it.printsAs(text)) found += it }
    return found.singleOrNull() ?: throw PatchException("Expected one class printing $text, found ${found.size}")
}

/**
 * Adds methods to the class of the app's formatted title, a text with its inline images. `fakhText` returns a text with a
 * commit prefix styled, using the app's text builder, and `fakhLabel` does so for a whole formatted title.
 * `fakhMarkedText` does so only for the marked title of an issue or pull request.
 */
private fun addLabelMethod(title: ClassDef, formatter: Method) {
    val type = title.type
    val constructor = title.methods.single { it.name == "<init>" }
    val text = constructor.parameterTypes[0].toString()
    val images = constructor.parameterTypes[1].toString()
    val fields = constructor.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field }
    val textField = fields.single { it.type == text }
    val imagesField = fields.single { it.type == images }

    // The builder is what the formatter joins the title with.
    val builder = formatter.instructions.mapNotNull { it.method }
        .first { it.parameterTypes.map(CharSequence::toString) == listOf(text) && it.returnType == "V" }
        .definingClass
    val builderMethods = classDefByOrNull(builder)?.methods ?: throw PatchException("Text builder $builder not found")
    fun builderCall(what: String, parameters: (List<String>) -> Boolean, returns: (String) -> Boolean) =
        builderMethods.singleOrNull {
            it.name != "<init>" && !AccessFlags.SYNTHETIC.isSet(it.accessFlags) &&
                parameters(it.parameterTypes.map(CharSequence::toString)) && returns(it.returnType)
        } ?: throw PatchException("Text builder: $what not found")
    var style: ClassDef? = null
    classDefForEach { classDef -> if (classDef.printsAs("SpanStyle(color=")) style = classDef }
    val span = style ?: throw PatchException("Text span style not found")
    val create = span.methods.singleOrNull { method ->
        method.name == "<init>" && method.parameterTypes.size == 15 &&
            method.parameterTypes.first().toString() == "J" && method.parameterTypes.last().toString() == "I"
    } ?: throw PatchException("Text span style constructor not found")

    val push = builderCall("push style", { it == listOf(span.type) }, { it == "I" })
    val pop = builderCall("pop", { it == listOf("I") }, { it == "V" })
    val add = builderCall("add text", { it == listOf(STRING) }, { it == "V" })
    val addStyled = builderCall("add styled text", { it == listOf(text) }, { it == "V" })
    val build = builderCall("build", { it.isEmpty() }, { it == text })
    // The text's own subSequence is renamed; the one CharSequence asks for is a bridge to it.
    val cut = classDefByOrNull(text)?.methods?.singleOrNull {
        !AccessFlags.SYNTHETIC.isSet(it.accessFlags) && it.returnType == text &&
            it.parameterTypes.map(CharSequence::toString) == listOf("I", "I")
    } ?: throw PatchException("Text part not found")

    fun method(name: String, parameters: List<String>, returns: String, registers: Int, smali: String) =
        ImmutableMethod(
            type,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returns,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructionsWithLabels(0, smali) }

    val owner = mutableClassDefBy(type)
    // A span style with a text color and a background; every other argument keeps its default.
    owner.methods.add(
        method(
            "fakhStyle",
            listOf("J", "J"),
            span.type,
            24,
            """
                new-instance v0, ${span.type}
                move-wide/from16 v1, p0
                const-wide/16 v3, 0x0
                const/4 v5, 0x0
                const/4 v6, 0x0
                const/4 v7, 0x0
                const/4 v8, 0x0
                const/4 v9, 0x0
                const-wide/16 v10, 0x0
                const/4 v12, 0x0
                const/4 v13, 0x0
                const/4 v14, 0x0
                move-wide/from16 v15, p2
                const/16 v17, 0x0
                const/16 v18, 0x0
                const v19, 0xf7fe
                invoke-direct/range { v0 .. v19 }, ${span.type}-><init>(${create.parameterTypes.joinToString("")})V
                return-object v0
            """,
        ),
    )
    // The scope takes only a text color, so its background bit stays set.
    owner.methods.add(
        method(
            "fakhColor",
            listOf("J"),
            span.type,
            22,
            """
                new-instance v0, ${span.type}
                move-wide/from16 v1, p0
                const-wide/16 v3, 0x0
                const/4 v5, 0x0
                const/4 v6, 0x0
                const/4 v7, 0x0
                const/4 v8, 0x0
                const/4 v9, 0x0
                const-wide/16 v10, 0x0
                const/4 v12, 0x0
                const/4 v13, 0x0
                const/4 v14, 0x0
                const-wide/16 v15, 0x0
                const/16 v17, 0x0
                const/16 v18, 0x0
                const v19, 0xfffe
                invoke-direct/range { v0 .. v19 }, ${span.type}-><init>(${create.parameterTypes.joinToString("")})V
                return-object v0
            """,
        ),
    )
    owner.methods.add(
        method(
            "fakhText",
            listOf(text),
            text,
            10,
            """
                move-object v0, p0
                invoke-virtual { v0 }, Ljava/lang/Object;->toString()$STRING
                move-result-object v1
                invoke-static { v1 }, $CONVENTIONAL->label($STRING)$STRING
                move-result-object v2
                if-eqz v2, :keep
                new-instance v3, $builder
                invoke-direct { v3 }, $builder-><init>()V
                const/4 v4, 0x0
                invoke-static { v1 }, $CONVENTIONAL->start($STRING)I
                move-result v5
                invoke-virtual { v0, v4, v5 }, $text->${cut.name}(II)$text
                move-result-object v4
                invoke-virtual { v3, v4 }, $builder->${addStyled.name}($text)V
                invoke-static { v1 }, $CONVENTIONAL->foreground($STRING)J
                move-result-wide v4
                invoke-static { v1 }, $CONVENTIONAL->background($STRING)J
                move-result-wide v6
                invoke-static { v4, v5, v6, v7 }, $type->fakhStyle(JJ)${span.type}
                move-result-object v4
                invoke-virtual { v3, v4 }, $builder->${push.name}(${span.type})I
                move-result v4
                invoke-virtual { v3, v2 }, $builder->${add.name}($STRING)V
                invoke-virtual { v3, v4 }, $builder->${pop.name}(I)V
                invoke-static {}, $CONVENTIONAL->gray()J
                move-result-wide v4
                invoke-static { v4, v5 }, $type->fakhColor(J)${span.type}
                move-result-object v4
                invoke-virtual { v3, v4 }, $builder->${push.name}(${span.type})I
                move-result v4
                invoke-static { v1 }, $CONVENTIONAL->scope($STRING)$STRING
                move-result-object v5
                invoke-virtual { v3, v5 }, $builder->${add.name}($STRING)V
                invoke-virtual { v3, v4 }, $builder->${pop.name}(I)V
                invoke-static { v1 }, $CONVENTIONAL->length($STRING)I
                move-result v4
                invoke-virtual { v1 }, $STRING->length()I
                move-result v5
                invoke-virtual { v0, v4, v5 }, $text->${cut.name}(II)$text
                move-result-object v4
                invoke-virtual { v3, v4 }, $builder->${addStyled.name}($text)V
                invoke-virtual { v3 }, $builder->${build.name}()$text
                move-result-object v4
                return-object v4
                :keep
                return-object p0
            """,
        ),
    )
    owner.methods.add(
        method(
            "fakhMarkedText",
            listOf(text),
            text,
            2,
            """
                invoke-virtual { p0 }, Ljava/lang/Object;->toString()$STRING
                move-result-object v0
                invoke-static { v0 }, $CONVENTIONAL->isMarked($STRING)Z
                move-result v0
                if-eqz v0, :keep
                invoke-static { p0 }, $type->fakhText($text)$text
                move-result-object p0
                :keep
                return-object p0
            """,
        ),
    )
    owner.methods.add(
        method(
            "fakhLabel",
            listOf(type),
            type,
            4,
            """
                iget-object v0, p0, ${textField.smali}
                invoke-static { v0 }, $type->fakhText($text)$text
                move-result-object v1
                if-eq v0, v1, :keep
                iget-object v0, p0, ${imagesField.smali}
                new-instance v2, $type
                invoke-direct { v2, v1, v0 }, $type-><init>($text$images)V
                return-object v2
                :keep
                return-object p0
            """,
        ),
    )
}

/** The field of [model] that holds a title: the string number [position], from zero, that its constructor stores. */
private fun titleString(model: ClassDef, position: Int) =
    // The other constructors only delegate to the one that stores the fields.
    model.methods.filter { it.name == "<init>" }
        .map { method -> method.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field } }
        .maxBy { it.size }.filter { it.type == STRING }.getOrNull(position)
        ?: throw PatchException("Title not found in ${model.type}")

/** The registers a value of [type] takes. */
private fun width(type: String) = if (type == "J" || type == "D") 2 else 1

/** The smali that copies a value of [type] from one register to another. */
private fun move(type: String, to: String, from: String) = when {
    type == "J" || type == "D" -> "move-wide/from16 $to, $from"
    type.startsWith("L") || type.startsWith("[") -> "move-object/from16 $to, $from"
    else -> "move/from16 $to, $from"
}

/** Material's text takes the images as its parameter number 16, which its default bits count from. */
private const val IMAGES_DEFAULT = 16

/**
 * Has Compose's text of a plain string draw a marked title with its label: it formats the title and hands it to the
 * overload that takes a formatted text and its images, with the same other arguments. R8 dropped the parameters no
 * caller of an overload sets, so one only the formatted text has is passed empty, to take its default.
 *
 * @param plain The overload taking a string.
 * @param rich The overload taking a formatted text, whose parameters add the images.
 * @param formatter The app's method that makes a formatted title from a string.
 */
private fun labelPlainText(title: ClassDef, plain: Method, rich: Method, formatter: String) {
    val constructor = title.methods.single { it.name == "<init>" }
    val text = constructor.parameterTypes[0].toString()
    val images = constructor.parameterTypes[1].toString()
    val fields = constructor.instructions.filter { it.opcode == Opcode.IPUT_OBJECT }.mapNotNull { it.field }
    val textField = fields.single { it.type == text }
    val imagesField = fields.single { it.type == images }

    val plainTypes = plain.parameterTypes.map(CharSequence::toString)
    val richTypes = rich.parameterTypes.map(CharSequence::toString)
    val imagesAt = richTypes.indexOf(MAP)
    // The last of the integers after the composer says which arguments take their default; the others say which changed.
    val firstInt = richTypes.indexOfLast { it != "I" } + 1
    val registers = plainTypes.runningFold(0) { total, type -> total + width(type) }

    // v0 and v1 are scratch, and the arguments of the call start at v2.
    var next = 2
    val copies = richTypes.mapIndexed { index, type ->
        val to = "v$next"
        next += width(type)
        val from = if (index < imagesAt) index else index - 1
        when {
            index == 0 -> move(type, to, "v0")
            index == imagesAt -> move(type, to, "v1")
            index >= firstInt && index < richTypes.lastIndex -> "const/16 $to, 0x0"
            index < firstInt - 1 && plainTypes[from] != type -> "const/16 $to, 0x0"
            index == richTypes.lastIndex -> {
                // The default bits from the images on move up by one, leaving theirs unset.
                val mask = "p${registers[from]}"
                """
                    const v0, ${(1 shl IMAGES_DEFAULT) - 1}
                    move/from16 v1, $mask
                    and-int v0, v1, v0
                    shr-int/lit8 v1, v1, $IMAGES_DEFAULT
                    shl-int/lit8 v1, v1, ${IMAGES_DEFAULT + 1}
                    or-int v0, v0, v1
                    move/from16 $to, v0
                """
            }
            else -> move(type, to, "p${registers[from]}")
        }
    }
    // The default bits use v0 and v1, so the text and the images are copied out of them before.
    val owner = mutableClassDefBy(plain.definingClass)
    val helper = "fakhMarked"
    owner.methods.add(
        ImmutableMethod(
            owner.type,
            helper,
            plainTypes.map { ImmutableMethodParameter(it, null, null) },
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(next + registers.last()),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $formatter
                    move-result-object v0
                    invoke-static { v0 }, ${title.type}->fakhLabel(${title.type})${title.type}
                    move-result-object v0
                    iget-object v1, v0, ${imagesField.smali}
                    iget-object v0, v0, ${textField.smali}
                    ${copies.joinToString("\n")}
                    invoke-static/range { v2 .. v${next - 1} }, ${rich.definingClass}->${rich.name}(${richTypes.joinToString("")})V
                    return-void
                """,
            )
        },
    )

    val method = owner.methods.first { it.name == plain.name && it.parameterTypes == plain.parameterTypes }
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $CONVENTIONAL->isMarked($STRING)Z
            move-result v0
            if-eqz v0, :plain
            invoke-static/range { p0 .. p${registers.last() - 1} }, ${owner.type}->$helper(${plainTypes.joinToString("")})V
            return-void
        """,
        ExternalLabel("plain", method.getInstruction(0)),
    )
}

/**
 * Labels the titles of issues and pull requests, in lists, in the inbox and at the top of their pages. A list turns the HTML of a
 * title into a text, which then goes through `fakhMarkedText`. A page draws the plain title with Compose's text, which
 * formats a marked one itself. Whoever hands them the title of an issue or pull request marks it first.
 */
private fun labelListsAndPages(title: ClassDef, formatter: String) {
    val constructor = title.methods.single { it.name == "<init>" }
    val text = constructor.parameterTypes[0].toString()
    fun Instruction.convertsHtml() = method?.let {
        it.returnType == text &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/text/Spannable;", "Z")
    } == true

    val composables = mutableListOf<Method>()
    val texts = mutableListOf<Pair<Method, Method>>()
    classDefForEach { classDef ->
        val drawing = classDef.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.parameterTypes.isNotEmpty()
        }
        composables += drawing.filter { method ->
            method.parameterTypes.any { it.toString() == STRING } &&
                method.instructions.any { it.method?.smali == FROM_HTML } &&
                method.instructions.any { it.convertsHtml() }
        }
        // The two overloads of Material's text, which end in three integers: the formatted one also takes the images,
        // and at most one other parameter differs, an object.
        drawing.filter { it.parameterTypes[0].toString() == text }.forEach { rich ->
            val types = rich.parameterTypes.map(CharSequence::toString)
            if (types.count { it == MAP } != 1 || types.takeLast(3) != listOf("I", "I", "I")) return@forEach
            val others = types.drop(1) - MAP
            drawing.forEach plain@{ plain ->
                val offered = plain.parameterTypes.map(CharSequence::toString)
                if (offered[0] != STRING || offered.size != others.size + 1) return@plain
                val differing = offered.drop(1).zip(others).filter { (one, other) -> one != other }
                if (differing.size <= 1 && differing.all { (one, other) -> one.startsWith("L") && other.startsWith("L") }) {
                    texts += plain to rich
                }
            }
        }
    }
    if (composables.isEmpty()) throw PatchException("Title composables not found")
    if (texts.isEmpty()) throw PatchException("Compose text not found")

    composables.forEach { composable ->
        val method = mutableClassDefBy(composable.definingClass).methods.first {
            it.name == composable.name && it.parameterTypes == composable.parameterTypes
        }
        method.instructions.indices.filter { method.instructions[it].convertsHtml() }.asReversed().forEach { index ->
            val register = (method.instructions[index + 1] as OneRegisterInstruction).registerA
            method.addInstructions(
                index + 2,
                """
                    invoke-static/range { v$register .. v$register }, ${title.type}->fakhMarkedText($text)$text
                    move-result-object v$register
                """,
            )
        }
    }
    texts.forEach { (plain, rich) -> labelPlainText(title, plain, rich, formatter) }

    val drawn = (composables + texts.map { it.first }).map { composable ->
        composable.definingClass + "->" + composable.name +
            composable.parameterTypes.joinToString("", "(", ")") + composable.returnType
    }.toSet()
    // The rows keep the title's HTML as their second string, and an inbox row also draws its first, the plain title,
    // when it has no HTML. The page's header keeps the plain title as its fourth.
    val inbox = modelPrinting("NotificationItemView(title=")
    val header = modelPrinting("IssueOrPullRequestDetailHeaderData(avatarUrl=")
    listOf(
        titleString(modelPrinting("ListItemPullRequest(title="), 1) to true,
        titleString(modelPrinting("ListItemIssue(title="), 1) to true,
        titleString(inbox, 1) to true,
        titleString(inbox, 0) to true,
        titleString(header, 3) to false,
    ).forEach { (field, inList) ->
        val readers = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            if (classDef.type == field.definingClass) return@classDefForEach
            classDef.methods.forEach { method ->
                // A list's title is also copied between models, so only what draws it counts.
                if (method.instructions.any { it.field?.smali == field.smali } &&
                    (!inList || method.instructions.any { it.method?.smali in drawn })
                ) {
                    readers += classDef.type to method.name + method.parameterTypes.joinToString("")
                }
            }
        }
        if (readers.isEmpty()) throw PatchException("Nothing draws ${field.smali}")
        readers.forEach { (type, signature) ->
            val method = mutableClassDefBy(type).methods.first {
                it.name + it.parameterTypes.joinToString("") == signature
            }
            method.instructions.indices.filter {
                method.instructions[it].opcode == Opcode.IGET_OBJECT &&
                    method.instructions[it].field?.smali == field.smali
            }.asReversed().forEach { index ->
                val value = (method.instructions[index] as TwoRegisterInstruction).registerA
                method.addInstructions(
                    index + 1,
                    """
                        invoke-static/range { v$value .. v$value }, $CONVENTIONAL->mark($STRING)$STRING
                        move-result-object v$value
                    """,
                )
            }
        }
    }
}

@Suppress("unused")
val conventionalCommitsPatch = patch(
    name = "Conventional commits",
    description = "Titles of commits, issues, pull requests and notifications such as feat(auth): add login show their type as a colored label.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(CONVENTIONAL_COMMITS)
        val title = modelPrinting("EmojiInlineContent(annotatedText=")
        val commit = modelPrinting("SimpleCommit(id=").type
        val row = modelPrinting("ListItemCommit(messageHeadline=")

        // The list of commits formats a title where it reads it from a commit. The timeline sets it on a text view.
        val composed = mutableListOf<Triple<String, String, List<Int>>>()
        val formatters = mutableSetOf<String>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.instructions
                if (instructions.none { it.field?.definingClass == commit && it.opcode == Opcode.IGET_OBJECT }) {
                    return@forEach
                }
                val calls = instructions.indices.filter { index ->
                    instructions[index].method?.let {
                        it.returnType == title.type && it.parameterTypes.map(CharSequence::toString) == listOf(STRING)
                    } == true && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
                        instructions.subList(maxOf(0, index - 12), index).any { it.field?.definingClass == commit }
                }
                if (calls.isNotEmpty()) {
                    composed += Triple(classDef.type, method.name + method.parameterTypes.joinToString(""), calls)
                    calls.forEach { formatters += instructions[it].method!!.smali }
                }
            }
        }
        val timeline = titleViews(headlineOf(row.type))
        // The activity list on Home also uses a text view. Its model's third string is the title.
        val activity = titleViews(titleString(modelPrinting("RecentActivity(actor="), 2))
        if (formatters.size != 1) throw PatchException("Commit list title not found: $composed, $formatters")
        if (timeline.isEmpty()) throw PatchException("Commit timeline title not found")
        if (activity.isEmpty()) throw PatchException("Home activity title not found")

        val formatterType = formatters.single().substringBefore("->")
        val formatterName = formatters.single().substringAfter("->")
        val formatter = classDefByOrNull(formatterType)!!.methods.single {
            "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == formatterName
        }
        addLabelMethod(title, formatter)

        fun find(type: String, signature: String) = mutableClassDefBy(type).methods.first {
            it.name + it.parameterTypes.joinToString("") == signature
        }
        composed.forEach { (type, signature, calls) ->
            val method = find(type, signature)
            calls.sortedDescending().forEach { index ->
                val register = (method.instructions[index + 1] as OneRegisterInstruction).registerA
                method.addInstructions(
                    index + 2,
                    """
                        invoke-static/range { v$register .. v$register }, ${title.type}->fakhLabel(${title.type})${title.type}
                        move-result-object v$register
                    """,
                )
            }
        }
        (timeline + activity).groupBy { it.type to it.signature }.forEach { (target, places) ->
            val method = find(target.first, target.second)
            places.sortedByDescending { it.index }.forEach {
                method.addInstructions(
                    it.index + 1,
                    "invoke-static/range { v${it.text} .. v${it.text} }, $CONVENTIONAL->restyle($TEXT_VIEW)V",
                )
            }
        }
        // Last, because it moves instructions in methods the places above were found in.
        labelListsAndPages(title, formatters.single())
    }
}
