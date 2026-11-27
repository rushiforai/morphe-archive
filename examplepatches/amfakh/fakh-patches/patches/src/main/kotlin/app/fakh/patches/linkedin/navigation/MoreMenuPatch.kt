/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.navigation

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.GAMES_SHORTCUT
import app.fakh.patches.linkedin.shared.Constants.MORE_TAB_ITEMS
import app.fakh.patches.linkedin.shared.Constants.MOVE_MORE_ITEMS
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/MoreMenu;"

/**
 * The HomeNavPanelFeature lambda that builds the list at the bottom of the Me panel: a divider put first, then
 * "Settings & Privacy" and the Premium row.
 */
private object NavPanelFooterFingerprint : Fingerprint(
    name = "invoke",
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelAggregateResponse;",
            name = "upsellSlotContent",
        ),
        methodCall(definingClass = "Lcom/linkedin/android/home/navpanel/HomeNavPanelDividerViewData;", name = "<init>"),
        methodCall(name = "addItem"),
    )
)

/** HomeNavPanelSectionV2Presenter.onBind(ViewDataBinding): sets the section's click listener. */
private object NavPanelSectionBindFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/navpanel/presenter/HomeNavPanelSectionV2Presenter;",
    name = "onBind",
    returnType = "V",
    parameters = listOf("Landroidx/databinding/ViewDataBinding;"),
)

// The More screen's items are read, and hidden, as they pass through the SDUI filter.

@Suppress("unused")
val moreMenuPatch = patch(
    name = "More tab",
    description = "Lets you hide items of the More tab (Puzzle games, Groups, Events, Newsletters).",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Navigation bar")
    dependsOn(sduiComponentFilterPatch)
    execute { register(MORE_TAB_ITEMS) }
}

@Suppress("unused")
val gamesShortcutPatch = patch(
    name = "Puzzle games shortcut",
    description = "Adds Puzzle games to the shortcuts of the LinkedIn app icon.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Navigation bar")
    dependsOn(sduiComponentFilterPatch)
    execute { register(GAMES_SHORTCUT) }
}

@Suppress("unused")
val moveMoreItemsPatch = patch(
    name = "Show More tab items in profile menu",
    description = "Lists the items of the More tab at the bottom of the profile menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Navigation bar")
    dependsOn(sduiComponentFilterPatch)

    execute {
        register(MOVE_MORE_ITEMS)

        // Right after the divider goes into the footer list, so the items are added above it.
        NavPanelFooterFingerprint.let {
            val index = it.instructionMatches.last().index
            val list = it.method.getInstruction<FiveRegisterInstruction>(index).registerC
            it.method.addInstruction(
                index + 1,
                "invoke-static { v$list }, $EXTENSION_CLASS->addToFooter(Ljava/lang/Object;)V"
            )
        }

        // Point the items' clicks at their pages, after the presenter sets its own listener.
        NavPanelSectionBindFingerprint.method.apply {
            returnIndices(Opcode.RETURN_VOID).forEach { index ->
                replaceInstruction(
                    index,
                    "invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->onSectionBind(Ljava/lang/Object;Ljava/lang/Object;)V"
                )
                addInstruction(index + 1, "return-void")
            }
        }
    }
}
