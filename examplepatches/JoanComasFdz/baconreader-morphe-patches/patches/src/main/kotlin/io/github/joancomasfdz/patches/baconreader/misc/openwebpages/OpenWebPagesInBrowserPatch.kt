// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.misc.openwebpages

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.fix.links.ClickableLinkSpanOnClickFingerprint
import io.github.joancomasfdz.patches.baconreader.fix.links.LinkProcessorGetBrowserIntentFingerprint
import io.github.joancomasfdz.patches.baconreader.fix.links.LinkProcessorGetIntentFingerprint
import io.github.joancomasfdz.patches.baconreader.fix.links.RedditSpannerLinkFingerprint
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/openlinks/OpenWebPagesPatch;"

// LinkProcessor opens a web page in BaconReader's own browser, or in the user's browser when "Open links inside app"
// is off, and then images and videos too. This sends a web page to the user's browser either way, and keeps images
// and videos in BaconReader.
@Suppress("unused")
val openWebPagesInBrowserPatch = bytecodePatch(
    name = "Open web pages in the browser",
    description = "Adds a setting that opens links to web pages in your own browser, while images, galleries and " +
        "videos keep opening in BaconReader.",
) {
    dependsOn(sharedExtensionPatch, settingsPatch)

    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        markPatchIncluded("openWebPagesInBrowser")

        LinkProcessorGetIntentFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->webPageIntent(Ljava/lang/Object;)Landroid/content/Intent;
                    move-result-object v0
                    if-eqz v0, :original
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // A post's link button opens through getBrowserIntent(Context, Link) instead.
        LinkProcessorGetBrowserIntentFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->webLinkIntent(Landroid/content/Context;Ljava/lang/Object;)Landroid/content/Intent;
                    move-result-object v0
                    if-eqz v0, :original
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // The link next to a post's title starts LinkProcessor's intent only when it opens BaconReader's browser, so it
        // would drop the intents above and do nothing.
        ClickableLinkSpanOnClickFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, Lcom/onelouder/baconreader/ClickableLinkSpan;->link:Lcom/onelouder/baconreader/reddit/Link;
                    invoke-static { p1, v0 }, $EXTENSION_CLASS_DESCRIPTOR->openWebLink(Landroid/view/View;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // A link in a text opens through LinkProcessor only with "Open links inside app" on, so an image there would
        // open in the browser.
        RedditSpannerLinkFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val index = fingerprint.instructionMatches.first().index
            val register = method.getInstruction<TwoRegisterInstruction>(index).registerA
            method.addInstructions(
                index + 1,
                """
                    invoke-static { v$register, p2 }, $EXTENSION_CLASS_DESCRIPTOR->mediaOpensInApp(ZLjava/lang/Object;)Z
                    move-result v$register
                """,
            )
        }

        // The link button of a post's bar has no label for screen readers.
        ControlbarBaseCreateButtonFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val returnIndex = fingerprint.instructionMatches.first().index
            val button = method.getInstruction<OneRegisterInstruction>(returnIndex).registerA
            method.addInstruction(
                returnIndex,
                "invoke-static { v$button }, $EXTENSION_CLASS_DESCRIPTOR->labelLinkButton(Landroid/view/View;)V",
            )
        }
    }
}
