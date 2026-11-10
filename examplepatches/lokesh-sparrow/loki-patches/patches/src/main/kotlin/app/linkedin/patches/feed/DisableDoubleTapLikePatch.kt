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
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val CLICK_CALLBACKS = "Lcom/linkedin/sdui/viewdata/action/ActionListViewData;"

/**
 * ClickActions(onClick, onLongClick, onDoubleClick, ...) of the server driven UI. 4.1.1261 appended
 * onLongClickPhases, and more may follow, so only the leading ActionListViewData parameters are checked.
 */
private val clickActions = Fingerprint(
    definingClass = "Lcom/linkedin/sdui/viewdata/action/ClickActions;",
    name = "<init>",
    custom = { method, _ ->
        method.parameterTypes.size >= 3 && method.parameterTypes.take(3).all { it.toString() == CLICK_CALLBACKS }
    },
)

@Suppress("unused")
val disableDoubleTapLikePatch = bytecodePatch(
    name = "Disable double-tap like",
    description = "A double tap on a post or a photo no longer likes it.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isDisableDoubleTapLikeIncluded")

        // p3 holds onDoubleClick. The range form is needed because p3 can sit above v15.
        clickActions.method.addInstructions(
            0,
            """
                invoke-static/range { p3 .. p3 }, $EXTENSION_PACKAGE/DoubleTapPatch;->filterDoubleClick(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p3
                check-cast p3, $CLICK_CALLBACKS
            """
        )
    }
}
