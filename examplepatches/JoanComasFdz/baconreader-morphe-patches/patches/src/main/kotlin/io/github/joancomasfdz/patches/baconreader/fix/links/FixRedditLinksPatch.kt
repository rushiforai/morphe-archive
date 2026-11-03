// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.links

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/links/FixRedditLinksPatch;"

// LinkProcessor decides where a tapped Reddit link opens, by the shape of its path, and opens every path it doesn't
// know in its browser. It predates Reddit's share links, /r/<sub>/s/<code>, which say what they open only through a
// redirect. It also opens /comments/<post> and /gallery/<post> in its browser, and a post on a user's profile,
// /user/<user>/comments/<post>, as the profile.
@Suppress("unused")
val fixRedditLinksPatch = bytecodePatch(
    name = "Fix Reddit links",
    description = "Opens Reddit's share links, and links to galleries, to posts without their subreddit and to " +
        "posts on a user's profile, in the app instead of its browser.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch)

    execute {
        LinkProcessorGetIntentFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->intent(Ljava/lang/Object;)Landroid/content/Intent;
                    move-result-object v0
                    if-eqz v0, :original
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // A share link comes back to LinkDispatcher, which waits for its redirect.
        LinkDispatcherProcessingFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->dispatch(Landroid/app/Activity;Landroid/content/Intent;)Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // The link next to a post's title starts LinkProcessor's intent only when it opens the browser, so it dropped
        // the intents above and did nothing.
        ClickableLinkSpanOnClickFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, Lcom/onelouder/baconreader/ClickableLinkSpan;->link:Lcom/onelouder/baconreader/reddit/Link;
                    iget-object v0, v0, Lcom/onelouder/baconreader/reddit/Link;->url:Ljava/lang/String;
                    invoke-static { p1, v0 }, $EXTENSION_CLASS_DESCRIPTOR->open(Landroid/view/View;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :original
                    return-void
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
