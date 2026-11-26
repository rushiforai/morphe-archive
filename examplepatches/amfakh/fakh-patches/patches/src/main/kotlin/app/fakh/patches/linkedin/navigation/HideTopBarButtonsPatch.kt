/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.navigation

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.FEED_SORT_BUTTON
import app.fakh.patches.linkedin.shared.Constants.SHOW_TOP_BAR_MESSAGING
import app.fakh.patches.linkedin.shared.Constants.SHOW_TOP_BAR_POST
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** HomeBottomNavFragment.onViewCreated(View, Bundle): the home screen with the search bar and its buttons. */
private object HomeViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/HomeBottomNavFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

/**
 * Holds whether the home top bar gets the "Select feed view" button, which the app only shows to members in the EU.
 */
private object FeedSortButtonFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/feed/pages/main/MainFeedSortOrderManagerImpl;",
    name = "<init>",
)

@Suppress("unused")
val hideTopBarButtonsPatch = patch(
    name = "Hide top bar buttons",
    description = "Lets you hide the Post and Messaging buttons of the top bar, and show or hide the EU-only feed sort " +
        "button. In Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feature")
    dependsOn(settingsPatch)

    execute {
        register(SHOW_TOP_BAR_POST, SHOW_TOP_BAR_MESSAGING, FEED_SORT_BUTTON)

        HomeViewCreatedFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/HomeTopBar;->install(Landroid/view/View;)V"
        )

        FeedSortButtonFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst { it.opcode == Opcode.IPUT_BOOLEAN }
            val register = getInstruction<TwoRegisterInstruction>(index).registerA
            addInstructions(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/Settings;->showFeedSortButton(Z)Z
                    move-result v$register
                """,
            )
        }
    }
}
