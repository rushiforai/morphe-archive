// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.e2e

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val TOOLBAR = "Landroidx/appcompat/widget/Toolbar;"
private const val MESSAGE_MANAGER = "Lcom/onelouder/baconreader/data/MessageManager;"
private const val MENU_LABEL = "Navigate up"
private const val ENVELOPE_LABEL = "Navigate up, orange envelope"

// Both of updateDrawer's toolbar.setNavigationIcon(id): logged out, the menu icon; logged in, the
// envelope while MessageManager has new messages, else the menu icon.
internal object DrawerHandlerUpdateDrawerFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/DrawerHandler;",
    name = "updateDrawer",
    returnType = "V",
)

// With unread messages, the main screen's left-menu button shows an orange envelope instead of the
// menu icon, an image UiAutomator can't tell apart: both buttons are "Navigate up". The e2e tests
// of "Fix unread messages" check the envelope by the button's description, which this names.
@Suppress("unused")
val e2eInboxEnvelopeLabelPatch = bytecodePatch(
    name = "E2E inbox envelope label",
    description = "Test only: adds \"orange envelope\" to the left-menu button's description while it shows the orange envelope.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    execute {
        val method = DrawerHandlerUpdateDrawerFingerprint.method
        val instructions = method.instructions.toList()
        val newMessages = instructions.indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC &&
                it.getReference<MethodReference>()?.let { call -> call.definingClass == MESSAGE_MANAGER && call.name == "getNewMessages" } == true
        }
        val navigationIcons = instructions.indices.filter { index ->
            val call = instructions[index].takeIf { it.opcode == Opcode.INVOKE_VIRTUAL }?.getReference<MethodReference>()
            call?.definingClass == TOOLBAR && call.name == "setNavigationIcon" && call.parameterTypes == listOf("I")
        }
        if (newMessages < 0 || navigationIcons.size != 2) {
            throw PatchException("updateDrawer has no MessageManager.getNewMessages() or not two setNavigationIcon(int)")
        }

        // From the last, so the earlier one's index holds.
        navigationIcons.sortedDescending().forEach { index ->
            val call = method.getInstruction<FiveRegisterInstruction>(index)
            val toolbar = call.registerC
            // The icon's id is written over right after the call: free to use.
            val free = call.registerD
            val next = method.getInstruction(index + 1)
            if (next.opcode != Opcode.NEW_INSTANCE || (next as OneRegisterInstruction).registerA != free) {
                throw PatchException("The register of setNavigationIcon's id isn't written over after it")
            }

            val label = if (index > newMessages) {
                // The app's own condition for the envelope.
                """
                    invoke-static { }, $MESSAGE_MANAGER->getNewMessages()Z
                    move-result v$free
                    if-eqz v$free, :menu
                    const-string v$free, "$ENVELOPE_LABEL"
                    goto :set
                    :menu
                    const-string v$free, "$MENU_LABEL"
                    :set
                """
            } else {
                """
                    const-string v$free, "$MENU_LABEL"
                """
            }
            method.addInstructionsWithLabels(
                index + 1,
                label + """
                    invoke-virtual { v$toolbar, v$free }, $TOOLBAR->setNavigationContentDescription(Ljava/lang/CharSequence;)V
                """,
            )
        }
    }
}
