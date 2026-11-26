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

private const val STATE = "Lcom/linkedin/sdui/viewdata/text/ExpansionBehaviorState;"

/** ExpandableTextState(initialText, ellipsis, collapsedText, maxLines, onlyWhenNecessary, ExpansionBehaviorState). */
private val expandableTextState = Fingerprint(
    definingClass = "Lcom/linkedin/android/infra/sdui/components/text/expandableText/ExpandableTextState;",
    name = "<init>",
    custom = { method, _ -> method.parameterTypes.lastOrNull()?.toString() == STATE },
)

@Suppress("unused")
val expandPostsPatch = bytecodePatch(
    name = "Expand posts",
    description = "Adds a switch (off by default) that opens long posts already expanded.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isExpandPostsIncluded")

        // The state is the last parameter; the range form keeps it safe when it sits above v15.
        expandableTextState.method.addInstructions(
            0,
            """
                invoke-static/range { p6 .. p6 }, $EXTENSION_PACKAGE/ExpandPostsPatch;->initialState(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p6
                check-cast p6, $STATE
            """
        )
    }
}
