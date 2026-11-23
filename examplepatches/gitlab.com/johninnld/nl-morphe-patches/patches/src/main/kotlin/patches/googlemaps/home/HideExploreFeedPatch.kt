package org.ungoogled.patches.maps.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.ungoogled.patches.maps.ui.SHAPES
import org.ungoogled.patches.maps.ui.activityContextHookPatch
import org.ungoogled.patches.maps.ui.markPatched
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.ungoogled.patches.shared.addInstructionsAtLabel

internal val hideExploreFeedPatch = bytecodePatch(
    description = "Hides the home tab's Explore feed sheet (\"Local vibe\"). Can be switched back on " +
        "on the Customization screen.",
) {
    compatibleWith(COMPATIBILITY_MAPS)
    dependsOn(sharedExtensionPatch, activityContextHookPatch)

    execute {
        markPatched("hideExplorePatched")

        // While the switch is on, overwrite v9 with the HIDDEN enum constant at the
        // point every path that could have set it converges, so no matter which
        // path ran, the sheet starts hidden. That point is a branch target (a time
        // check jumps to it), so the check goes AT its label: an earlier version put
        // the override in front of the label, on the fall-through path only, and the
        // sheet stayed visible whenever the time check jumped past it.
        val resolver = if (packageMetadata.versionName == "26.47.00.1022347503")
            ExploreSheetStateFingerprint2647 else ExploreSheetStateFingerprint
        resolver.method.apply {
            val mergePoint = resolver.instructionMatches.last().index
            val merged = implementation!!.instructions[mergePoint]
            if (merged.opcode != Opcode.NEW_INSTANCE) {
                throw PatchException("explore sheet merge point is not the sheet-state construction")
            }
            // The flag borrows the register the merge point itself overwrites (v1 in 26.44,
            // v0 in 26.47), and the sheet state is the destination of the state read right
            // before it (v9 in 26.44, v7 in 26.47), so neither is hardcoded.
            val scratch = (merged as OneRegisterInstruction).registerA
            val stateRead = implementation!!.instructions[mergePoint - 1] as? ReferenceInstruction
                ?: throw PatchException("explore sheet merge point lost its state read")
            val stateField = stateRead.reference as? FieldReference
                ?: throw PatchException("explore sheet merge point's state read is not a field")
            val stateReg = (stateRead as OneRegisterInstruction).registerA
            if (scratch == stateReg) throw PatchException("explore sheet merge point reuses the state register")
            addInstructionsAtLabel(mergePoint, "sget-boolean v$scratch, $SHAPES->HIDE_EXPLORE:Z")
            addInstructionsWithLabels(
                mergePoint + 1,
                """
                    if-eqz v$scratch, :keep_state
                    sget-object v$stateReg, ${stateField.definingClass}->${stateField.name}:${stateField.type}
                """,
                ExternalLabel("keep_state", implementation!!.instructions[mergePoint + 1]),
            )
        }
    }
}
