/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.feed

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

/**
 * AndroidComposeView.dispatchTouchEvent(MotionEvent): every touch that enters a Compose screen.
 */
private object ComposeDispatchTouchEventFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/platform/AndroidComposeView;",
    name = "dispatchTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

@Suppress("unused")
val copyTextPatch = bytecodePatch(
    name = "Copy text",
    description = "Long press a post, comment or any other text to select and copy it in place, like on Reddit.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isCopyTextIncluded")

        // R8 removed Compose's SelectionContainer from LinkedIn, so the Compose text can't be made selectable.
        // The extension watches for long presses instead, lays a selectable copy of the text over it, and drops
        // the rest of the gesture so lifting the finger doesn't open the post.
        ComposeDispatchTouchEventFingerprint.method.apply {
            // At method entry every local register is free, so v0 can be used as scratch.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p1 }, $EXTENSION_PACKAGE/CopyTextPatch;->onTouchEvent(Landroid/view/View;Landroid/view/MotionEvent;)Z
                    move-result v0
                    if-eqz v0, :dispatch
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("dispatch", getInstruction(0))
            )
        }
    }
}
