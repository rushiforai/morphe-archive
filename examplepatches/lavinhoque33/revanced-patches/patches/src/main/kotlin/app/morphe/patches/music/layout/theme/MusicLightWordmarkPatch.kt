/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25
 */
package app.morphe.patches.music.layout.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import app.morphe.patches.music.utils.extension.Constants.UTILS_PATH
import app.morphe.patches.music.utils.resourceid.actionBarLogoRingo2
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TOOLBAR = "Landroid/support/v7/widget/Toolbar;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"

internal fun BytecodePatchContext.installLightMusicWordmarkHook() {
    val toolbar = mutableClassDefByOrNull(TOOLBAR) ?: throw PatchException("Music toolbar not found")
    // The stock no-argument logo setter loads the wordmark resource and forwards its Drawable.
    // Patching the Drawable setter also covers logos selected by the Custom branding patch.
    val setter = toolbar.methods.asSequence()
        .filter { it.parameterTypes.isEmpty() && it.returnType == "V" }
        .mapNotNull { it.implementation?.instructions }
        .filter { instructions ->
            instructions.any { (it as? NarrowLiteralInstruction)?.narrowLiteral?.toLong() == actionBarLogoRingo2 }
        }.flatMap { instructions -> instructions.asSequence().mapNotNull { it.getReference<MethodReference>() } }
        .singleOrNull { it.definingClass == TOOLBAR && it.parameterTypes == listOf(DRAWABLE) && it.returnType == "V" }
        ?: throw PatchException("Music wordmark Drawable setter not found")

    toolbar.methods.single { it.name == setter.name && it.parameterTypes == setter.parameterTypes }.addInstructions(
        0,
        """
            invoke-static/range { p0 .. p1 }, $UTILS_PATH/MusicLightWordmark;->apply(Landroid/view/View;$DRAWABLE)$DRAWABLE
            move-result-object p1
        """,
    )
}
