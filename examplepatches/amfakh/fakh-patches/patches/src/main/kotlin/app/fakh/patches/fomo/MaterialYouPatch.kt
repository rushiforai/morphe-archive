/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.fomo

import app.fakh.patches.fomo.shared.Constants.COMPATIBILITY_FOMO
import app.fakh.patches.fomo.shared.Constants.MATERIAL_YOU
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION = "Lapp/fakh/extension/fomo/MaterialYou;"

/** React Native's `ColorPropConverter.getColor(Object, Context): Integer`, the way every color prop reaches a view. */
private object ColorPropFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/bridge/ColorPropConverter;",
    name = "getColor",
    returnType = "Ljava/lang/Integer;",
    parameters = listOf("Ljava/lang/Object;", "Landroid/content/Context;"),
)

private const val BACKGROUND_STYLE = "Lcom/facebook/react/uimanager/BackgroundStyleApplicator;"

/** The background, border and outline colors of a view are applied here, and they reach it without ColorPropConverter. */
private val viewColorFingerprints = listOf(
    Triple("setBackgroundColor", listOf("Landroid/view/View;", "Ljava/lang/Integer;"), "p1"),
    Triple("setOutlineColor", listOf("Landroid/view/View;", "Ljava/lang/Integer;"), "p1"),
    Triple("setBorderColor", listOf("Landroid/view/View;", "Lcom/facebook/react/uimanager/style/LogicalEdge;", "Ljava/lang/Integer;"), "p2"),
).map { (name, parameters, register) ->
    Triple(Fingerprint(definingClass = BACKGROUND_STYLE, name = name, parameters = parameters), register, if (name == "setBorderColor") "remapBorder" else "remapFor")
}

/** Text colors reach the text spans as plain ints. */
private val spanFingerprints = listOf("ReactForegroundColorSpan", "ReactBackgroundColorSpan").map {
    Fingerprint(definingClass = "Lcom/facebook/react/views/text/internal/span/$it;", name = "<init>", parameters = listOf("I"))
}

/** The color hooks the theme patches share; what they change is decided by the features that are on. */
internal val colorHooksPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
    dependsOn(settingsPatch)

    execute {
        val method = ColorPropFingerprint.method
        val returns = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
        if (returns.isEmpty()) throw PatchException("FOMO: ColorPropConverter.getColor has no return.")
        // Back to front, so the earlier indexes stay valid while instructions are added.
        returns.asReversed().forEach { index ->
            method.addInstructions(
                index,
                """
                    invoke-static { p0, p1 }, $EXTENSION->remap(Ljava/lang/Integer;Landroid/content/Context;)Ljava/lang/Integer;
                    move-result-object p0
                """,
            )
        }
        viewColorFingerprints.forEach { (fingerprint, color, hook) ->
            fingerprint.method.addInstructions(
                0,
                """
                    invoke-static { p0, $color }, $EXTENSION->$hook(Landroid/view/View;Ljava/lang/Integer;)Ljava/lang/Integer;
                    move-result-object $color
                """,
            )
        }
        spanFingerprints.forEach {
            it.method.addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION->remapInt(I)I
                    move-result p1
                """,
            )
        }
    }
}

@Suppress("unused")
val fomoMaterialYouPatch = bytecodePatch(
    name = "Material You",
    description = "Colors the dark theme with your wallpaper colors: tinted background, cards and borders, and the accent for links, buttons and labels.",
) {
    compatibleWith(COMPATIBILITY_FOMO)
    category("Theme")
    dependsOn(colorHooksPatch)

    execute {
        register(MATERIAL_YOU)
    }
}
