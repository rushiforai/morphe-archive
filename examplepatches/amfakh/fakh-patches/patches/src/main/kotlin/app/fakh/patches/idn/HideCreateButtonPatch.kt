/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.fakh.patches.idn.shared.Constants.SHOW_CREATE_BUTTON
import app.fakh.patches.idn.shared.references
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** MainInitRunner's first-run step: shows the tour that points at the Create button, then runs the start-up checks. */
private object CreateButtonTourFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("KEY_PREF_HOME_HIGHLIGHT_CREATE_CONTENT"),
)

/** The constructor of the delegate that runs the "+" button (it animates the CircleToSquareButton); its second parameter is the main screen's view binding. */
private object CreateMenuDelegateFingerprint : Fingerprint(
    name = "<init>",
    custom = { _, classDef ->
        val references = classDef.methods.flatMap { it.references() }
        references.any { it.startsWith("Lcom/idntimes/idntimes/util/component/CircleToSquareButton;->") } &&
            references.any { it.startsWith("Landroid/view/animation/AnimationUtils;->loadAnimation") }
    },
)

@Suppress("unused")
val hideCreateButtonPatch = patch(
    name = "Hide Create button",
    description = "Removes the \"+\" button (write news, start a live stream) from the middle of the navigation bar. The switch is in Fakh Patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Layout")
    dependsOn(settingsPatch)

    execute {
        register(SHOW_CREATE_BUTTON)
        // p2 is the binding. The button and the bottom bar's empty "create" item are hidden at runtime, so the
        // switch can bring them back. The item stays in the menu, because the app disables it and selects the
        // tabs by index.
        CreateMenuDelegateFingerprint.method.addInstruction(
            0,
            "invoke-static { p2 }, $EXTENSION_SETTINGS->applyCreateButton(Ljava/lang/Object;)V",
        )
        // The tour snapshots the Create button and crashes on a fresh install once the button is gone. While it is
        // hidden, skip the tour and run the start-up checks (force logout, app update) it runs when already seen.
        CreateButtonTourFingerprint.method.apply {
            val startupChecks = instructions.firstNotNullOfOrNull {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { reference ->
                    reference.definingClass == definingClass && reference.parameterTypes.isEmpty() && reference.returnType == "V"
                }
            } ?: throw PatchException("IDN: the start-up checks call was not found in the Create button tour.")
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_SETTINGS->hideCreateButton()Z
                    move-result v0
                    if-eqz v0, :tour
                    invoke-virtual { p0 }, $startupChecks
                    return-void
                """,
                ExternalLabel("tour", getInstruction(0)),
            )
        }
    }
}
