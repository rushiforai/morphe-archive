package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.sheet

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/sheet/ToolbarMenus;"

private const val HAS_NO_BEHAVIOUR_METHOD =
    "theSheetHasNoBehaviour(Landroid/view/View;)Z"

@Suppress("unused")
val toolbarMenuCrashPatch = bytecodePatch(
    name = "Stop the toolbar menus closing the app",
    description = "Keeps Sync open when the sort or overflow button in the toolbar is tapped, " +
            "which closes it on some devices.",
    default = true
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        edgeToEdgeInsetsFingerprint.method.apply {
            // The answer has to go somewhere, and nothing is free at the top of a method. What
            // is free is whatever the method writes into before it ever reads it, and this one
            // opens by filling a register with the dialog it belongs to. The sheet is read out
            // of the parameters before that register is touched, and the instruction this
            // returns to fills it again, so nothing downstream can tell.
            val first = getInstruction<Instruction>(0)
            val free = (first as? OneRegisterInstruction)?.registerA
                ?: throw PatchException(
                    "$name does not open by filling a register, so there is none to answer in",
                )

            addInstructionsWithLabels(
                0,
                """
                invoke-static       { p1 }, $EXTENSION_CLASS_DESCRIPTOR->$HAS_NO_BEHAVIOUR_METHOD
                move-result         v$free
                if-eqz              v$free, :material_as_usual
                return-object       p2
                """,
                ExternalLabel("material_as_usual", first),
            )
        }
    }
}
