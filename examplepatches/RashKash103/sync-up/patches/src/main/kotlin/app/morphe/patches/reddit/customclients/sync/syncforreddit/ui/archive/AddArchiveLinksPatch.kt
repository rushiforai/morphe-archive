package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.archive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/AddArchiveLinksPatch;"

private const val ADD_ROWS_METHOD =
    "addArchiveRows(Landroid/view/View;Ljava/lang/String;)V"

private const val ADD_OPTIONS_METHOD =
    "addLinkOptions($SELECTION_SHEET_CLASS)V"

private const val HANDLE_OPTION_METHOD =
    "handleLinkOption(Ljava/lang/Object;Ljava/lang/String;)Z"

// An abstract class rather than an interface, so its methods take invoke-virtual.
private const val POST_MODEL = "Lxa/d;"
private const val SHEET_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragment_dialogs/bottom/PostMoreBottomSheetFragment;"

@Suppress("unused")
val addArchiveLinksPatch = bytecodePatch(
    name = "Add archive links to menus",
    description = "Adds Wayback Machine and archive.today options to the menus behind a post and " +
            "behind a link.",
    default = true
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        postMoreSheetOnViewCreatedFingerprint.method.apply {
            // Sync reuses p1 as a scratch local two instructions in, so the rows have to be
            // added while it still holds the view that was passed in. Anchored just after the
            // view binding call, which is the last point where that is true.
            val index = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.definingClass == "Lbutterknife/ButterKnife;"
            } + 1

            addInstructions(
                index,
                """
                iget-object         v0, p0, $SHEET_CLASS->P0:$POST_MODEL
                invoke-virtual      { v0 }, $POST_MODEL->e1()Ljava/lang/String;
                move-result-object  v0
                invoke-static       { p1, v0 }, $EXTENSION_CLASS_DESCRIPTOR->$ADD_ROWS_METHOD
                """
            )
        }

        // region The link options sheet, which builds its rows from code.

        // Read the field the click handler takes the link from, rather than naming an
        // obfuscated field here.
        val urlField = linkOptionsClickFingerprint.method.instructions.first {
            it.opcode == Opcode.IGET_OBJECT &&
                    it.getReference<FieldReference>()?.type == "Ljava/lang/String;"
        }.getReference<FieldReference>()!!

        // The rows are built before the sheet is told which link it is for, so the option
        // only records which archive it belongs to and the link is read when it is tapped.
        linkOptionsBuildFingerprint.method.apply {
            // Registered right after Sync's own first row rather than at the end of the method.
            // The sheet puts a link preview above its rows, so options appended last sit below
            // the fold of a sheet that opens collapsed, and are never seen.
            var index = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.name == REGISTER_OPTION_METHOD_NAME
            } + 1
            while (getInstruction(index).opcode == Opcode.MOVE_RESULT_OBJECT ||
                    getInstruction(index).opcode == Opcode.IPUT_OBJECT) {
                index++
            }

            addInstructions(
                index,
                """
                invoke-static       { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$ADD_OPTIONS_METHOD
                """
            )
        }

        linkOptionsClickFingerprint.method.addInstructionsWithLabels(
            0,
            """
            iget-object         v1, p0, ${urlField.definingClass}->${urlField.name}:${urlField.type}
            invoke-static       { p1, v1 }, $EXTENSION_CLASS_DESCRIPTOR->$HANDLE_OPTION_METHOD
            move-result         v0
            if-eqz              v0, :handled_by_sync
            return-void
            """,
            ExternalLabel("handled_by_sync", linkOptionsClickFingerprint.method.getInstruction(0))
        )

        // endregion
    }
}
