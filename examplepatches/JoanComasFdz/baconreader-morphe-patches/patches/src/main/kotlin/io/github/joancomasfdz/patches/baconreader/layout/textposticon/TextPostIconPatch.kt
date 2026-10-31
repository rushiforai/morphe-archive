// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.textposticon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/TextPostIconPatch;"

@Suppress("unused")
val textPostIconPatch = bytecodePatch(
    name = "Text post icon",
    description = "Replaces the expand button of text posts in the post list, which looks like a video " +
        "play button, with a page icon and a chevron that flips when the text is expanded.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        mapOf(
            LINK_HOLDER_CLASS_DESCRIPTOR to
                (LinkHolderConstructorFingerprint to LinkHolderRotateSelftextArrowFingerprint),
            LINK_CARD_HOLDER_CLASS_DESCRIPTOR to
                (LinkCardHolderConstructorFingerprint to LinkCardHolderRotateSelftextArrowFingerprint),
        ).forEach { (holder, fingerprints) ->
            val (constructorFingerprint, rotateSelftextArrowFingerprint) = fingerprints

            // Replace the icon right after "this.next = (ImageView) findViewById(R.id.next)".
            val constructor = constructorFingerprint.method
            val setNextIndex = constructorFingerprint.instructionMatches[0].index
            val buttonRegister = constructor.getInstruction<TwoRegisterInstruction>(setNextIndex).registerA
            constructor.addInstruction(
                setNextIndex + 1,
                "invoke-static { v$buttonRegister }, $EXTENSION_CLASS_DESCRIPTOR->install(Landroid/widget/ImageView;)V",
            )

            // rotateSelftextArrow(expanded, duration): flip the chevron instead of rotating the whole icon.
            val rotateSelftextArrow = rotateSelftextArrowFingerprint.method
            rotateSelftextArrow.addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, $holder->next:Landroid/widget/ImageView;
                    invoke-static { v0, p1, p2 }, $EXTENSION_CLASS_DESCRIPTOR->setExpanded(Landroid/widget/ImageView;ZI)Z
                    move-result v0
                    if-eqz v0, :original
                    iput-boolean p1, p0, $holder->rotated:Z
                    return-void
                """,
                ExternalLabel("original", rotateSelftextArrow.getInstruction(0)),
            )
        }
    }
}
