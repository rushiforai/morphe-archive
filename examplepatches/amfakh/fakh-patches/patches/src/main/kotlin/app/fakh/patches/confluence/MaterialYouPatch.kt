/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.confluence

import app.fakh.patches.confluence.shared.Constants.COMPATIBILITY_CONFLUENCE
import app.fakh.patches.confluence.shared.Constants.MATERIAL_YOU
import app.fakh.patches.shared.register
import app.fakh.patches.shared.atlassian.ATLASSIAN_RAMP_ACCENTS
import app.fakhradio.patches.shared.writeColors
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val EXTENSION = "Lapp/fakh/extension/confluence/MaterialYou;"

/** React Native's converter of color props; its name is part of React Native's API, so R8 keeps it. */
private const val COLOR_PROP_CONVERTER = "Lcom/facebook/react/bridge/ColorPropConverter;"

/** react-native-svg's base shape, which turns a fill or stroke into a Paint color. */
private const val SVG_SHAPE = "Lcom/horcrux/svg/RenderableView;"

/** Atlassian's brand blue in light and dark, and its dark page gray (0xRRGGBB), found in every color scheme. */
private val SCHEME_ANCHORS = setOf(0x1868DB, 0x669DF1, 0x1F1F21)

private const val FOREGROUND_COLOR_SPAN = "Landroid/text/style/ForegroundColorSpan;"

/**
 * Routes the colors Confluence's React Native screens paint with through the extension, where Material You and pitch
 * black rewrite them. The JavaScript hands colors to Android in three places: the color props of views, the color span
 * of text, and the paint of SVG icons; native Compose screens build theirs in static color schemes. The patches that use it turn their half on in the extension.
 */
internal val colorsPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        // View props (background, border, text input, switch, spinner): every color prop resolves through
        // getColor(Object, Context); the int variant calls it.
        val getColor = mutableClassDefBy(COLOR_PROP_CONVERTER).methods.single {
            it.name == "getColor" && it.returnType == "Ljava/lang/Integer;" && it.parameterTypes.size == 2
        }
        val returns = getColor.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        if (returns.isEmpty()) throw PatchException("ColorPropConverter.getColor has no return")
        returns.reversed().forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            getColor.addInstructions(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->prop(Ljava/lang/Integer;)Ljava/lang/Integer;
                    move-result-object v$register
                """,
            )
        }

        // Text: React Native's color span, the one subclass of ForegroundColorSpan. R8 renames it and, when its
        // constructor only calls the superclass, drops the constructor and calls ForegroundColorSpan's at every
        // `new`, so its color is rewritten at those calls.
        val spans = mutableListOf<String>()
        classDefForEach { if (it.superclass == FOREGROUND_COLOR_SPAN) spans += it.type }
        val span = spans.singleOrNull() ?: throw PatchException("React Native's color span not found in $spans")
        var texts = 0
        listOf(FOREGROUND_COLOR_SPAN, span).flatMap { type ->
            Fingerprint(filters = listOf(methodCall(definingClass = type, name = "<init>"))).matchAllOrNull().orEmpty()
        }.map { it.classDef }.distinctBy { it.type }.forEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                // The type each register was last given by new-instance, to tell the span's calls from other spans'.
                val created = mutableMapOf<Int, String>()
                val calls = instructions.withIndex().filter { (_, instruction) ->
                    if (instruction.opcode == Opcode.NEW_INSTANCE) {
                        created[(instruction as OneRegisterInstruction).registerA] =
                            (instruction as ReferenceInstruction).reference.toString()
                    }
                    instruction.opcode == Opcode.INVOKE_DIRECT &&
                        ((instruction as ReferenceInstruction).reference as MethodReference).let {
                            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
                        } &&
                        created[(instruction as FiveRegisterInstruction).registerC] == span
                }
                calls.reversed().forEach { (index, instruction) ->
                    val color = (instruction as FiveRegisterInstruction).registerD
                    method.addInstructions(
                        index,
                        """
                            invoke-static/range { v$color .. v$color }, $EXTENSION->accent(I)I
                            move-result v$color
                        """,
                    )
                    texts++
                }
            }
        }
        if (texts == 0) throw PatchException("React Native's text color spans not found")

        // Native Compose screens (the page renderer and its links, the emoji picker): their Atlassian color schemes
        // are built in static initializers from packed Compose colors, which R8 renames along with the classes. Every
        // initializer that loads four or more packed colors, one of them an Atlassian blue or gray, has each color
        // rewritten as it is loaded. The smallest is the link scheme: link, pressed, visited and visited pressed.
        var schemes = 0
        classDefForEach { classDef ->
            val initializer = classDef.methods.firstOrNull { it.name == "<clinit>" } ?: return@classDefForEach
            val colors = initializer.implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
                (instruction.opcode == Opcode.CONST_WIDE || instruction.opcode == Opcode.CONST_WIDE_HIGH16) &&
                    (instruction as WideLiteralInstruction).wideLiteral.let { it != 0L && it and 0xFFFFFFFFL == 0L }
            }.orEmpty()
            if (colors.size < 4 || colors.none {
                    ((it.value as WideLiteralInstruction).wideLiteral ushr 32).toInt() and 0xFFFFFF in SCHEME_ANCHORS
                }
            ) return@classDefForEach
            val method = mutableClassDefBy(classDef).methods.first { it.name == "<clinit>" }
            colors.reversed().forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                method.addInstructions(
                    index + 1,
                    """
                        invoke-static/range { v$register .. v${register + 1} }, $EXTENSION->packed(J)J
                        move-result-wide v$register
                    """,
                )
            }
            schemes++
        }
        if (schemes == 0) throw PatchException("The Compose color schemes not found")

        // SVG icons: every Paint color a shape sets, from its fill, stroke or currentColor.
        var paints = 0
        mutableClassDefBy(SVG_SHAPE).methods.forEach { method ->
            val calls = method.implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).let {
                        it.definingClass == "Landroid/graphics/Paint;" && it.name == "setColor" &&
                            it.parameterTypes.map(CharSequence::toString) == listOf("I")
                    }
            }.orEmpty()
            calls.reversed().forEach { (index, instruction) ->
                val color = (instruction as FiveRegisterInstruction).registerD
                method.addInstructions(
                    index,
                    """
                        invoke-static/range { v$color .. v$color }, $EXTENSION->accent(I)I
                        move-result v$color
                    """,
                )
                paints++
            }
        }
        if (paints == 0) throw PatchException("The SVG shapes' paint colors not found")
    }
}

/**
 * The View theme's blues (the switches' thumb and track, dialog buttons), which come from the older Atlassian ramp in
 * the app's color resources.
 */
private val materialYouResourcePatch = patch {
    execute {
        writeColors("values-v31", ATLASSIAN_RAMP_ACCENTS)
    }
}

@Suppress("unused")
val materialYouPatch = patch(
    name = "Material You",
    description = "Uses your wallpaper's colors (Android 12+) in light and dark mode.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CONFLUENCE)
    category("Theme")
    dependsOn(colorsPatch, materialYouResourcePatch, settingsPatch)

    execute {
        register(MATERIAL_YOU)
    }
}
