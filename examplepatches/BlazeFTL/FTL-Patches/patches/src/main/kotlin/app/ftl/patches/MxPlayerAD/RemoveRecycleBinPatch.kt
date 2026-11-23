package app.ftl.patches.mxplayerad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val DELETE_CONFIRM_CLASS = "Lapp/ftl/extension/mxplayerad/DeleteConfirm;"

// Delete confirm dialog (next build: com/mxtech/videoplayer/deletefile/a, source "MediaDeleteConfirmDialog.kt").
// Class name is R8 and never pinned. How to find it again, all anchors are real:
//   - non-nested class, source file MediaDeleteConfirmDialog.kt
//   - super is androidx.appcompat.app.* (appcompat AlertDialog, R8 name "d")
//   - one java.util.Collection field (files to delete)
//   - ctor (androidx.fragment.app.*, Z)  -> FragmentActivity + boolean
//   - one field typed androidx.fragment.app.* (the activity, next build: "h"), read off the class, not pinned
//   - callback: the single field whose type is an interface with a (Collection, Z)V method
//     (next build: field "p", type "v49", set by n(ArrayList, a2c))
//
// The old show() override built the replacement dialog with the appcompat Builder
// (androidx/appcompat/app/d$a, AlertController$b fields e/g, methods h/e/n). Those are R8 names and
// were the pinned part and the likely crash cause (their smali was not in the dump, so unverified).
// The confirm dialog is now built in the extension from SDK classes
// only (DeleteConfirm.show); if it returns false or throws, the stock show() runs, so it cannot crash.
private object RecycleBinTileFingerprint : Fingerprint(
    definingClass = "Lcom/mxtech/videoplayer/ad/subscriptions/ui/metab/viewmodels/LocalMePageViewModel;",
    filters = listOf(
        fieldAccess(
            type = "Lcom/mxtech/bin/RecycleBinManager;",
            opcode = Opcode.SGET_OBJECT,
        ),
        fieldAccess(
            type = "Z",
            opcode = Opcode.SGET_BOOLEAN,
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.IF_NEZ, location = MatchAfterImmediately()),
        string("recycleBin", location = MatchAfterWithin(3)),
    ),
)

val removeRecycleBinPatch = bytecodePatch(
    name = "Remove Recycle Bin",
    description = "Deleted files are always removed permanently, whenever this patch is applied - " +
        "there's no safe way to make that half a runtime switch without the stock (unpatched) " +
        "delete-dialog code to fall back to. The Me tab tile itself is a Mod Settings switch: " +
        "off just brings the tile back, it doesn't restore recycling.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER_AD)

    dependsOn(modSettingsPatch, modSettingFlagPatch(KEY_ME_HIDE_RECYCLE_BIN))

    execute {
        val tilesMethod = RecycleBinTileFingerprint.method
        val blockStart = RecycleBinTileFingerprint.instructionMatches[0].index
        val stringIndex = RecycleBinTileFingerprint.instructionMatches[3].index
        val hideTarget = tilesMethod.getInstruction(stringIndex + 3)

        tilesMethod.addInstructionsWithLabels(
            blockStart + 1,
            """
                const-string v1, "$KEY_ME_HIDE_RECYCLE_BIN"
                invoke-static {v1}, $MOD_SETTINGS_CLASS->get(Ljava/lang/String;)Z
                move-result v1
                if-nez v1, :hide
            """.trimIndent(),
            ExternalLabel("hide", hideTarget),
        )

        tilesMethod.addInstructions(
            0,
            """
                const-string v0, "${tilesMethod.name}"
                invoke-static {p0, v0}, $MOD_SETTINGS_CLASS->onTilesOwner(Ljava/lang/Object;Ljava/lang/String;)V
            """.trimIndent(),
        )

        val dialogClass = mutableClassDefBy { classDef ->
            classDef.superclass?.startsWith("Landroidx/appcompat/app/") == true &&
                '$' !in classDef.type &&
                classDef.fields.any { it.type == "Ljava/util/Collection;" } &&
                classDef.methods.any { method ->
                    method.name == "<init>" &&
                        method.parameters.size == 2 &&
                        method.parameters[0].type.startsWith("Landroidx/fragment/app/") &&
                        method.parameters[1].type == "Z"
                }
        }

        val collectionField = dialogClass.fields.first { it.type == "Ljava/util/Collection;" }
        val activityField = dialogClass.fields.firstOrNull { it.type.startsWith("Landroidx/fragment/app/") }
        val superType = dialogClass.superclass ?: "Landroid/app/Dialog;"

        var callbackMethodName = ""
        val callbackField = dialogClass.fields.single { field ->
            val type = classDefByOrNull(field.type) ?: return@single false
            if (!AccessFlags.INTERFACE.isSet(type.accessFlags)) return@single false
            val method = type.methods.firstOrNull { m ->
                m.returnType == "V" &&
                    m.parameterTypes.map { it.toString() } == listOf("Ljava/util/Collection;", "Z")
            } ?: return@single false
            callbackMethodName = method.name
            true
        }

        val onClickListenerType = "Landroid/content/DialogInterface\$OnClickListener;"
        if (onClickListenerType !in dialogClass.interfaces) {
            dialogClass.interfaces.add(onClickListenerType)
        }

        val loadContext = if (activityField != null) {
            "iget-object v0, p0, ${dialogClass.type}->${activityField.name}:${activityField.type}"
        } else {
            "invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;"
        }
        val moveContext = if (activityField != null) "" else "move-result-object v0"

        val showMethod = ImmutableMethod(
            dialogClass.type,
            "show",
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(6),
        ).toMutable()

        showMethod.addInstructions(
            0,
            """
                const-string v0, "$KEY_ME_HIDE_RECYCLE_BIN"
                invoke-static {v0}, $MOD_SETTINGS_CLASS->get(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :stock

                $loadContext
                $moveContext
                invoke-static {v0, p0}, $DELETE_CONFIRM_CLASS->show(Landroid/content/Context;$onClickListenerType)Z
                move-result v0
                if-nez v0, :done

                :stock
                invoke-super {p0}, $superType->show()V

                :done
                return-void
            """.trimIndent(),
        )

        dialogClass.methods.add(showMethod)

        val onClickMethod = ImmutableMethod(
            dialogClass.type,
            "onClick",
            listOf(
                ImmutableMethodParameter("Landroid/content/DialogInterface;", null, null),
                ImmutableMethodParameter("I", null, null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(6),
        ).toMutable()

        onClickMethod.addInstructions(
            0,
            """
                iget-object v0, p0, ${dialogClass.type}->${collectionField.name}:Ljava/util/Collection;
                if-eqz v0, :cond_0

                iget-object v1, p0, ${dialogClass.type}->${callbackField.name}:${callbackField.type}
                if-eqz v1, :cond_0

                const/4 v2, 0x1
                invoke-interface {v1, v0, v2}, ${callbackField.type}->$callbackMethodName(Ljava/util/Collection;Z)V

                :cond_0
                return-void
            """.trimIndent(),
        )

        dialogClass.methods.add(onClickMethod)
    }
}
