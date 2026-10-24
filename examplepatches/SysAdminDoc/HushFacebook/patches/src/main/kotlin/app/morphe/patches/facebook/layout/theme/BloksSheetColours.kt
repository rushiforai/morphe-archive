/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * The background of a Bloks bottom sheet (issue #37), such as the account switcher the Menu's
 * account name opens. Read from 584 arm64, 2026-10-24, from a heap dump of the open sheet on an
 * emulator and then the dex; the obfuscated names are for reviewers, the code never writes one down.
 *
 * The sheet's container (584 LX/epY;) is a FrameLayout built from two com.facebook.dsp.core.ColorData,
 * each a light and a dark colour the screen sends, and a float[] of corner radii. It paints its rounded
 * background with a drawable it builds from one int (LX/epY;->A00(I)LX/epX;, its one method taking just
 * an int, which sets that int on the drawable's Paint), and a sheet with corners of its own adds a
 * corner view (LX/epc;, a View built from a Context, the radii, an alpha and the same int). In dark
 * mode that int was the ColorData's dark #1F1F20, a grey no FDS token gives, so the sheet stayed grey
 * while the Menu behind it took the palette.
 */

internal const val DSP_COLOR_DATA = "Lcom/facebook/dsp/core/ColorData;"

/** Where the sheet's background colour goes on its way to the drawable and the corner view. */
internal const val SHEET_BACKGROUND = "$MATERIAL_YOU->sheetBackground(I)I"

private const val FRAME_LAYOUT = "Landroid/widget/FrameLayout;"

private const val PAINT_SET_COLOR = "Landroid/graphics/Paint;->setColor(I)V"

/** The corner view's constructor: a Context, the corner radii, an alpha and the colour. */
private val CORNER_VIEW_PARAMETERS = listOf("Landroid/content/Context;", "[F", "F", "I")

private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

private fun Method.calls(): List<MethodReference> =
    implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.orEmpty()

/** Whether [classDef] is the sheet's container: a FrameLayout with two ColorData fields, built from both and a float[]. */
internal fun isBloksSheetContainer(classDef: ClassDef): Boolean =
    classDef.superclass == FRAME_LAYOUT &&
        classDef.fields.count { it.type == DSP_COLOR_DATA } == 2 &&
        classDef.methods.any { method ->
            method.name == "<init>" && method.parameterNames().let { it.count { type -> type == DSP_COLOR_DATA } == 2 && "[F" in it }
        }

/** The container's background builder: its one method taking only an int, which it sets on a Paint. */
internal fun sheetBackgroundBuilder(container: ClassDef): Method {
    val found = container.methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterNames() == listOf("I") &&
            method.calls().any { it.toString() == PAINT_SET_COLOR }
    }
    return found.singleOrNull()
        ?: throw PatchException("${container.type} has ${found.size} methods painting an int, expected the background's one")
}

/** The corner views the container builds: each constructor it calls taking a Context, the radii, an alpha and a colour. */
internal fun sheetCornerViews(container: ClassDef): Set<MethodReference> =
    container.methods.flatMap { method ->
        method.implementation?.instructions?.filter { it.opcode == Opcode.INVOKE_DIRECT }
            ?.mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            ?.filter { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == CORNER_VIEW_PARAMETERS }
            .orEmpty()
    }.toSet()

/**
 * Hands a Bloks sheet's background colour to the extension at the start of the container's background
 * builder and of each corner view's constructor, so the caller's own register keeps Facebook's colour.
 * Refuses unless there is one container. Answers how many methods it hooked.
 */
internal fun BytecodePatchContext.hookBloksSheetBackground(): Int {
    val containers = mutableListOf<String>()
    classDefForEach { classDef -> if (isBloksSheetContainer(classDef)) containers += classDef.type }
    val type = containers.singleOrNull()
        ?: throw PatchException("Found ${containers.size} Bloks sheet containers, expected one")
    val container = mutableClassDefBy(type)
    val builder = sheetBackgroundBuilder(container)
    container.methods.single { it.name == builder.name && it.parameterNames() == listOf("I") }.recolourIntParameter(1)
    val corners = sheetCornerViews(container)
    corners.forEach { view ->
        mutableClassDefBy(view.definingClass).methods
            .single { it.name == "<init>" && it.parameterNames() == CORNER_VIEW_PARAMETERS }
            .recolourIntParameter(CORNER_VIEW_PARAMETERS.size)
    }
    return 1 + corners.size
}

/** The extension's [SHEET_BACKGROUND] on parameter register `p[parameter]`, first thing in the method. */
internal fun MutableMethod.recolourIntParameter(parameter: Int) {
    addInstructions(
        0,
        """
            invoke-static/range { p$parameter .. p$parameter }, $SHEET_BACKGROUND
            move-result p$parameter
        """,
    )
}
