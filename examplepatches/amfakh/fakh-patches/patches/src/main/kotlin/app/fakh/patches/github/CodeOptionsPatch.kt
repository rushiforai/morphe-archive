/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x

private const val CODE_OPTIONS = "Lapp/fakh/extension/github/CodeOptions;"
private const val SCREEN = "Lcom/github/android/settings/codeoptions/CodeOptionsActivity;"
private const val STRING = "Ljava/lang/String;"
private const val CLASS = "Ljava/lang/Class;"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"

/** The content of the Code Options screen, which reads the text of its last switch. */
private object CodeOptionsContentFingerprint : Fingerprint(
    filters = listOf(resourceLiteral(ResourceType.STRING, "settings_code_options_enable_line_wrapping")),
)

/** A new public static method of a class, without a return value. */
private fun staticMethod(owner: String, name: String, parameters: List<String>, registers: Int, smali: String) =
    ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructionsWithLabels(0, smali) }

/** The index of the first instruction that matches, which the screen must have. */
private fun MutableMethod.find(what: String, matches: (Int) -> Boolean) =
    instructions.indices.firstOrNull(matches) ?: throw PatchException("Code options: $what not found")

/**
 * Has the Code Options screen list the switches of the Code section under a Fakh Patches header above its preview,
 * with a copy of its font size slider for the tab width, and show the preview as they set it. The preview stays at the
 * bottom of the screen, below the rows, which scroll. The patches of those switches depend on this one.
 */
internal val codeOptionsPatch = patch {
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val content = CodeOptionsContentFingerprint.method
        val owner = content.definingClass
        val screen = mutableClassDefBy(owner)

        // The call of a switch row after the last row's text: modifier, title, two texts, two styles, checked, listener,
        // padding, color, composer and three flags.
        val literalAt = CodeOptionsContentFingerprint.instructionMatches.first().index
        val rowAt = content.find("the switch row") {
            val types = content.instructions[it].method?.types
            it > literalAt && types?.size == 14 && types[1] == STRING && types[6] == "Z"
        }
        val row = content.instructions[rowAt].method!!
        val function = row.types[7]
        val composer = row.types[10]
        // The composer is the twelfth register of the call, since the color takes two.
        val composerRegister = (content.instructions[rowAt] as? RegisterRangeInstruction)?.startRegister?.plus(11)
            ?: throw PatchException("Code options: switch row registers not found")

        // The font size slider: modifier, listener, stop, composer and flags.
        val slider = screen.methods.singleOrNull {
            it.types == listOf(it.types.firstOrNull(), function, "I", composer, "I") &&
                it.instructions.any { instruction -> instruction.string == "A" }
        } ?: throw PatchException("Code options: the font size slider not found")
        val modifier = slider.types[0]

        // The slider keeps its position in a state of a float, which the extension uses to redraw the screen.
        val stateAt = slider.find("the slider's state") {
            val call = slider.instructions[it].method
            call?.name == "<init>" && call.types == listOf("F")
        }
        val state = slider.instructions[stateAt].method!!.definingClass
        val getter = slider.instructions.mapNotNull { it.method }
            .firstOrNull { it.definingClass == state && it.types.isEmpty() && it.returnType == "F" }
            ?: throw PatchException("Code options: the state's getter not found")
        val setter = classDefByOrNull(state)?.methods
            ?.singleOrNull { it.name != "<init>" && it.types == listOf("F") && it.returnType == "V" }
            ?: throw PatchException("Code options: the state's setter not found")

        val tabSlider = ImmutableMethod(
            owner,
            "fakhTabWidth",
            slider.parameters,
            slider.returnType,
            slider.accessFlags,
            null,
            null,
            MutableMethodImplementation(slider.implementation!!),
        ).toMutable()
        screen.methods.add(tabSlider)

        tabSlider.apply {
            // From the end to the start, so each search sees the places before it unchanged.
            // The app draws the slider again with its own function, which would show the font size slider.
            val againAt = find("the slider's restart") {
                val call = instructions[it].method
                instructions[it].opcode == Opcode.INVOKE_DIRECT && call?.name == "<init>" &&
                    call.types == listOf(modifier, function, "I", "I")
            }
            val again = instructions[againAt] as? Instruction35c
                ?: throw PatchException("Code options: restart registers not found")
            val lambdaType = instructions[againAt].method!!.definingClass
            val createdAt = (againAt downTo 0).first {
                instructions[it].opcode == Opcode.NEW_INSTANCE && instructions[it].typeReference == lambdaType
            }
            val twoArguments = instructions[againAt + 1].field?.type
                ?: throw PatchException("Code options: the restart function not found")
            val lambda = again.registerC
            val listener = again.registerE
            val stop = again.registerF
            val spare = again.registerG
            replaceInstruction(againAt, "const-class v$spare, $owner")
            addInstructions(
                againAt + 1,
                """
                    invoke-static { v$lambda, v$spare, v$listener, v$stop }, $CODE_OPTIONS->restart($CLASS$CLASS${OBJECT}I)$OBJECT
                    move-result-object v$lambda
                    check-cast v$lambda, $twoArguments
                """,
            )
            replaceInstruction(createdAt, "const-class v$lambda, $twoArguments")

            // The labels at both ends of the slider are an A in the smallest and the largest code size; they become the
            // narrowest and the widest tab.
            val labels = instructions.indices.filter { instructions[it].string == "A" }
                .takeIf { it.size == 2 } ?: throw PatchException("Code options: slider labels not found")
            labels.zip(listOf("2", "8")).forEach { (index, label) ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                replaceInstruction(index, "const-string v$register, \"$label\"")
            }
            val stopsAt = find("the slider's stops") { instructions[it].field?.type == LIST }
            val stops = (instructions[stopsAt] as OneRegisterInstruction).registerA
            // The first instruction is replaced rather than removed, so jumps to it stay.
            replaceInstruction(stopsAt, "invoke-static {}, $CODE_OPTIONS->widths()$LIST")
            addInstructions(stopsAt + 1, "move-result-object v$stops")

            // Both labels get the larger size, the second dimension the method loads.
            val sizes = instructions.indices.filter {
                (instructions[it] as? NarrowLiteralInstruction)?.narrowLiteral?.ushr(16) == 0x7f07
            }.takeIf { it.size == 2 } ?: throw PatchException("Code options: label sizes not found")
            val larger = (instructions[sizes[1]] as NarrowLiteralInstruction).narrowLiteral
            val smallRegister = (instructions[sizes[0]] as OneRegisterInstruction).registerA
            replaceInstruction(sizes[0], "const v$smallRegister, $larger")
        }

        // The header is a copy of what the app draws between its last row and its preview: a space and the Preview
        // header, with another text.
        val headerEnd = content.find("the preview header") {
            val types = content.instructions[it].method?.types
            it > rowAt && types?.firstOrNull() == STRING && types.takeLast(3) == listOf("I", "I", "I")
        }
        val headerCode = content.instructions.subList(rowAt + 1, headerEnd + 1)
        val headerText = content.instructions[headerEnd] as? RegisterRangeInstruction
            ?: throw PatchException("Code options: header registers not found")
        val headerComposer = headerCode.firstOrNull {
            it.opcode == Opcode.INVOKE_VIRTUAL && it.method?.definingClass == composer
        } as? Instruction35c ?: throw PatchException("Code options: header composer not found")
        val headerRegisters = headerText.startRegister + headerText.registerCount + 1
        val header = ImmutableMethod(
            owner,
            "fakhHeader",
            listOf(ImmutableMethodParameter(composer, null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            ImmutableMethodImplementation(
                headerRegisters,
                headerCode + ImmutableInstruction10x(Opcode.RETURN_VOID),
                null,
                null,
            ),
        ).toMutable()
        screen.methods.add(header)
        header.apply {
            val textAt = find("the header's text") {
                val call = instructions[it].method
                call?.returnType == STRING && call.types == listOf("I", composer)
            }
            replaceInstruction(textAt, "invoke-static {}, $CODE_OPTIONS->header()$STRING")
            // Some arguments of the text keep the values the app set before its rows, which are zero.
            val zeros = (0 until headerText.registerCount).joinToString("\n") {
                "const/16 v${headerText.startRegister + it}, 0x0"
            }
            addInstructions(
                0,
                "move-object/from16 v${headerComposer.registerC}, p0\n$zeros",
            )
        }

        // The composer's end of a node, with true.
        val endNode = screen.methods.flatMap { it.instructions }.mapNotNull { it.method }
            .filter { it.definingClass == composer && it.types == listOf("Z") && it.returnType == "V" }
            .distinctBy { it.name }
            .singleOrNull() ?: throw PatchException("Code options: the composer's end call not found")

        // The app scrolls the whole screen. Its column no longer does; a column inside it that takes the space left
        // over scrolls the rows instead, so the preview below stays in view.
        val code = content.instructions
        val scrollAt = content.find("the screen's scrolling") {
            val call = code[it].method
            call?.returnType == modifier && call.types.size == 3 && call.types.first() == modifier &&
                call.types.last() == "Z"
        }
        val scroll = code[scrollAt].method!!
        val scrollState = (scrollAt downTo 0).mapNotNull { code[it].method }
            .firstOrNull { it.types == listOf(composer) && it.returnType == scroll.types[1] }
            ?: throw PatchException("Code options: the scroll state not found")
        // What the app does to start its column, from its arrangement to the text of its first row.
        val columnAt = content.find("the screen's column") { it > scrollAt && code[it].opcode == Opcode.SGET_OBJECT }
        val rowsAt = content.find("the first row") {
            it > columnAt && (code[it] as? NarrowLiteralInstruction)?.narrowLiteral?.ushr(16) == 0x7f13
        }
        val columnCode = code.subList(columnAt, rowsAt)
        val composerAt = (columnCode.firstOrNull {
            it.opcode == Opcode.INVOKE_VIRTUAL && it.method?.definingClass == composer
        } as? Instruction35c)?.registerC
        val zero = (columnCode.firstOrNull {
            val types = it.method?.types
            types?.size == 4 && types[2] == composer && types[3] == "I"
        } as? Instruction35c)?.registerF
        val columnModifier = (code[columnAt - 1] as? OneRegisterInstruction)?.registerA
        val weight = slider.instructions.mapNotNull { it.method }
            .firstOrNull { it.name == "<init>" && it.types == listOf("F", "Z") }
        if (composerAt == null || zero == null || columnModifier == null || weight == null) {
            throw PatchException("Code options: the column's parts not found")
        }
        // The extension scrolls the rows to the slider with the state's method that moves it by a distance.
        val scrollBy = classDefByOrNull(scroll.types[1])?.methods
            ?.singleOrNull { it.types == listOf("F") && it.returnType == "F" }
            ?: throw PatchException("Code options: the scroll state's mover not found")
        val startScroll = ImmutableMethod(
            owner,
            "fakhStartScroll",
            listOf(ImmutableMethodParameter(composer, null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            ImmutableMethodImplementation(18, columnCode + ImmutableInstruction10x(Opcode.RETURN_VOID), null, null),
        ).toMutable()
        screen.methods.add(startScroll)
        startScroll.addInstructions(
            0,
            """
                move-object/from16 v$composerAt, p0
                new-instance v0, ${weight.definingClass}
                const/high16 v1, 0x3f800000
                const/4 v2, 0x1
                invoke-direct { v0, v1, v2 }, ${weight.smali}
                invoke-static { v$composerAt }, ${scrollState.smali}
                move-result-object v1
                invoke-static { v1 }, $CODE_OPTIONS->scroller($OBJECT)V
                invoke-static { v0, v1, v2 }, ${scroll.smali}
                move-result-object v$columnModifier
                const/4 v$zero, 0x0
            """,
        )
        screen.methods.add(
            staticMethod(
                owner,
                "fakhEndScroll",
                listOf(composer),
                2,
                """
                    const/4 v0, 0x1
                    invoke-virtual { p0, v0 }, ${endNode.smali}
                    return-void
                """,
            ),
        )

        // The animation the app shows its font size slider with: scope, visible, modifier, two transitions, label,
        // content, composer and two flags. The content is a function of the app that a call before it wraps.
        val animationAt = content.find("the font size slider's animation") {
            val types = code[it].method?.types
            types?.size == 10 && types[1] == "Z" && types[7] == composer
        }
        val animation = code[animationAt].method!!
        val animationScope = code.subList(0, animationAt).mapNotNull { it.field }
            .lastOrNull { it.type == animation.types.first() }
        val wrapAt = (animationAt downTo 0).firstOrNull {
            val call = code[it].method
            call?.types?.size == 3 && call.types[2] == composer && call.returnType == animation.types[6]
        }
        val block = wrapAt?.let { at ->
            (at downTo 0).firstOrNull { code[it].opcode == Opcode.NEW_INSTANCE }
                ?.let { classDefByOrNull(code[it].typeReference!!)?.interfaces?.singleOrNull() }
        }
        if (animationScope == null || wrapAt == null || block == null) {
            throw PatchException("Code options: the animation's parts not found")
        }
        val wrap = code[wrapAt].method!!

        // The rows, then the slider.
        screen.methods.add(
            staticMethod(
                owner,
                "fakhRows",
                listOf(composer),
                18,
                """
                    const-class v0, $function
                    invoke-static { v0 }, $CODE_OPTIONS->rows($CLASS)[$OBJECT
                    move-result-object v16
                    const/4 v15, 0x0
                    :next
                    move-object/from16 v0, v16
                    array-length v0, v0
                    if-ge v15, v0, :slider
                    move-object/from16 v0, v16
                    aget-object v1, v0, v15
                    add-int/lit8 v15, v15, 0x1
                    aget-object v2, v0, v15
                    add-int/lit8 v15, v15, 0x1
                    aget-object v7, v0, v15
                    add-int/lit8 v15, v15, 0x1
                    check-cast v1, $STRING
                    check-cast v2, Ljava/lang/Boolean;
                    invoke-virtual { v2 }, Ljava/lang/Boolean;->booleanValue()Z
                    move-result v6
                    check-cast v7, $function
                    const/4 v0, 0x0
                    const/4 v2, 0x0
                    const/4 v3, 0x0
                    const/4 v4, 0x0
                    const/4 v5, 0x0
                    const/4 v8, 0x0
                    const-wide/16 v9, 0x0
                    move-object/from16 v11, p0
                    const/4 v12, 0x0
                    const/4 v13, 0x0
                    const/16 v14, 0x67d
                    invoke-static/range { v0 .. v14 }, ${row.smali}
                    goto :next
                    :slider
                    invoke-static {}, $CODE_OPTIONS->hasSlider()Z
                    move-result v0
                    if-eqz v0, :done
                    move-object/from16 v7, p0
                    const-class v0, $block
                    const-class v1, $function
                    const-class v2, $owner
                    invoke-static { v0, v1, v2 }, $CODE_OPTIONS->slider($CLASS$CLASS$CLASS)$OBJECT
                    move-result-object v0
                    check-cast v0, ${wrap.types[1]}
                    const v1, 0x66616b01
                    invoke-static { v1, v0, v7 }, ${wrap.smali}
                    move-result-object v6
                    sget-object v0, ${animationScope.smali}
                    invoke-static {}, $CODE_OPTIONS->sliderShown()Z
                    move-result v1
                    const/4 v2, 0x0
                    const/4 v3, 0x0
                    const/4 v4, 0x0
                    const/4 v5, 0x0
                    const v8, 0x180006
                    const/16 v9, 0x1e
                    invoke-static/range { v0 .. v9 }, ${animation.smali}
                    :done
                    return-void
                """,
            ),
        )
        content.addInstructions(
            rowAt + 1,
            """
                invoke-static/range { v$composerRegister .. v$composerRegister }, $owner->fakhHeader($composer)V
                invoke-static/range { v$composerRegister .. v$composerRegister }, $owner->fakhRows($composer)V
                invoke-static/range { v$composerRegister .. v$composerRegister }, $owner->fakhEndScroll($composer)V
            """,
        )
        // The places before the rows, from the later one on.
        content.addInstructions(
            rowsAt,
            "invoke-static/range { v$composerAt .. v$composerAt }, $owner->fakhStartScroll($composer)V",
        )
        val scrolled = (code[scrollAt + 1] as OneRegisterInstruction).registerA
        val unscrolled = (code[scrollAt] as? Instruction35c)?.registerC
            ?: throw PatchException("Code options: the scrolled modifier not found")
        content.replaceInstruction(scrollAt, "move-object/from16 v$scrolled, v$unscrolled")
        content.replaceInstruction(scrollAt + 1, "nop")

        // The preview builds its lines from a list of HTML.
        val preview = screen.methods.singleOrNull {
            it.instructions.any { instruction -> instruction.method?.name == "fromHtml" }
        } ?: throw PatchException("Code options: the preview not found")
        val linesAt = preview.find("the preview's lines") {
            preview.instructions[it].opcode == Opcode.SGET_OBJECT && preview.instructions[it].field?.type == LIST
        }
        val lines = (preview.instructions[linesAt] as OneRegisterInstruction).registerA
        preview.addInstructions(
            linesAt + 1,
            """
                invoke-static/range { v$lines .. v$lines }, $CODE_OPTIONS->lines($LIST)$LIST
                move-result-object v$lines
            """,
        )

        screen.methods.add(
            staticMethod(
                owner,
                "fakhOpen",
                emptyList(),
                4,
                """
                    const-class v0, $state
                    const-string v1, "${getter.name}"
                    const-string v2, "${setter.name}"
                    const-string v3, "${scrollBy.name}"
                    invoke-static { v0, v1, v2, v3 }, $CODE_OPTIONS->open($CLASS$STRING$STRING$STRING)V
                    return-void
                """,
            ),
        )
        val onCreate = mutableClassDefBy(SCREEN).methods.singleOrNull { it.name == "onCreate" }
            ?: throw PatchException("Code options: onCreate not found")
        onCreate.addInstructions(0, "invoke-static {}, $owner->fakhOpen()V")
    }
}
