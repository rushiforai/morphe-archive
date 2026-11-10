// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.slideshow

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/slideshow/FixSlideShowPatch;"

/**
 * The scroll view the text goes in is made in code: this id, added to the app's ids, names it, so the e2e tests find
 * it. The extension finds it by name.
 */
private val postTextScrollIdResourcePatch = resourcePatch {
    execute {
        document("res/values/ids.xml").use { ids ->
            ids.getElementsByTagName("resources").item(0).appendChild(
                ids.createElement("item").apply {
                    setAttribute("type", "id")
                    setAttribute("name", "baconreader_patches_post_text_scroll")
                },
            )
        }
    }
}

// The Slide Show View shows each post in a page of fixed height, which BaconReader works out from the display's
// size. On newer Android versions that size is the whole screen, status and navigation bars included, so the page
// runs on behind the bottom bar: the end of an image post's text, a gallery's thumbnails and the page's border
// don't show, and the media sits low. An image post's text, expanded, also grows past the page's bottom, where it
// is cut off.
@Suppress("unused")
val fixSlideShowPatch = bytecodePatch(
    name = "Fix slide show",
    description = "Fits each post of the Slide Show View to the screen, and lets a post's long text scroll in it.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, postTextScrollIdResourcePatch)

    execute {
        // The page's layout params, with the height BaconReader worked out, go through the extension on their way out.
        PortraitPageLayoutGetLayoutParamsFingerprint.method.apply {
            val returnIndex = indexOfFirstInstructionReversedOrThrow(Opcode.RETURN_OBJECT)
            val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
            addInstructions(
                returnIndex,
                """
                    invoke-static { p0, v$register }, $EXTENSION_CLASS_DESCRIPTOR->pageLayoutParams(Landroid/view/View;Landroid/view/ViewGroup${'$'}LayoutParams;)Landroid/view/ViewGroup${'$'}LayoutParams;
                    move-result-object v$register
                """,
            )
        }

        // The post's text goes into a scroll view before it is set.
        PostMediaHandlerConstructorFingerprint.method.apply {
            val index = PostMediaHandlerConstructorFingerprint.instructionMatches[0].index
            val textRegister = getInstruction<FiveRegisterInstruction>(index).registerC
            addInstruction(
                index,
                "invoke-static { v$textRegister }, $EXTENSION_CLASS_DESCRIPTOR->scrollText(Landroid/widget/TextView;)V",
            )
        }
    }
}
