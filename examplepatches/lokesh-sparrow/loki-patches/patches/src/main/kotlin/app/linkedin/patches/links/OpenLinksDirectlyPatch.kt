/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.links

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val URL_UNWRAPPER = "$EXTENSION_PACKAGE/OpenLinksDirectlyPatch;"

/** NavigateToUrlActionViewData(Uri, UrlNavigationType, LegacyFeedUrlTrackingData, boolean, IntStack). */
private val urlAction = Fingerprint(
    definingClass = "Lcom/linkedin/sdui/viewdata/action/NavigateToUrlActionViewData;",
    name = "<init>",
    parameters = listOf("Landroid/net/Uri;", "L", "L", "Z", "L"),
)

/** RichTextUtils.getLinkShimmingLink(String): wraps chat links in linkedin.com/safety/go. */
private val messagingLinkShim = Fingerprint(
    definingClass = "Lcom/linkedin/android/messaging/util/RichTextUtils;",
    name = "getLinkShimmingLink",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
)

@Suppress("unused")
val openLinksDirectlyPatch = bytecodePatch(
    name = "Open links directly",
    description = "Skips LinkedIn's safety/go warning page and opens external links straight away.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isOpenLinksDirectlyIncluded")

        // Swap the Uri before the constructor stores it. Range form, since p1 can be above v15.
        urlAction.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $URL_UNWRAPPER->unwrap(Landroid/net/Uri;)Landroid/net/Uri;
                move-result-object p1
            """
        )

        // Static method, so p0 is the link; the locals are empty at offset 0 and v0 is free to use.
        with(messagingLinkShim.method) {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $URL_UNWRAPPER->skipMessagingShim()Z
                    move-result v0
                    if-eqz v0, :shim
                    return-object p0
                """,
                ExternalLabel("shim", getInstruction(0))
            )
        }
    }
}
