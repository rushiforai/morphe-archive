// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.spoilers

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val ELEMENT = "Lcom/onelouder/baconreader/parser/RedditParser\$Element;"

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/spoilers/HideFormattedSpoilersPatch;"

@Suppress("unused")
val hideFormattedSpoilersPatch = bytecodePatch(
    name = "Hide formatted spoilers",
    description = "Hides spoilers (>!...!<) that contain formatting, links or code behind the spoiler box, " +
        "instead of showing them in plain sight.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        // The app only hides a spoiler (<span class="md-spoiler-text">) whose content is a single plain text.
        // Any spoiler with content is one: the box then covers all of its formatted content.
        IsInternalSpoilerFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "class"
                invoke-virtual { p1, v0 }, $ELEMENT->getAttribute(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                const-string v1, "md-spoiler-text"
                invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :not_spoiler
                iget-object v0, p1, $ELEMENT->children:Ljava/util/List;
                if-eqz v0, :not_spoiler
                invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
                move-result v0
                if-nez v0, :not_spoiler
                const/4 v0, 0x1
                return v0
                :not_spoiler
                const/4 v0, 0x0
                return v0
            """,
        )

        // Accessibility reads a hidden spoiler as "spoiler", not its text, which the box only paints over:
        // after the text of a comment or a post is set, and after a tap on a spoiler sets it again.
        listOf(
            CommentHolderUpdateViewFingerprint,
            DetailLinkFragmentUpdateSelftextFingerprint,
            SpoilerClickableSpanOnClickFingerprint,
        ).forEach { fingerprint ->
            val index = fingerprint.instructionMatches[0].index
            fingerprint.method.apply {
                val textViewRegister = getInstruction<FiveRegisterInstruction>(index).registerC
                addInstruction(
                    index + 1,
                    "invoke-static { v$textViewRegister }, $EXTENSION_CLASS_DESCRIPTOR->describe(Landroid/view/View;)V",
                )
            }
        }
    }
}
