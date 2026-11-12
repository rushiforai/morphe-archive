package app.template.patches.pdb.soul

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import app.template.patches.shared.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * The profile screen (`scf` — route /user/profile/detail) has no chat entry in
 * the stock app: chats only exist for server-created channels (Soul matches,
 * Thought-Bubble messages, Wonder chat), so the app never offers "chat with
 * this user" on a profile. We add it honestly:
 *
 *  1. A "Chat" item in the profile's ⋯ overflow menu (the share / follow /
 *     report / block list built in `scf.onClick`), and
 *  2. a branch in the menu callback (`m9f.onClick`, case 3) that routes it to
 *     the extension: an existing channel with that user opens the real chat
 *     (pdb://pdb.app/chat/{type}:{id}); without one it falls back to the
 *     profile — no fake channel creation (channels are server-made).
 *
 * Our menu id 0x4d0f0001 is outside the app's 0x7f0a**** id space.
 */
private const val MENU_ID = "0x4d0f0001"
private const val ICON = "0x7f0803a5" // ic_menu_group_chat
private const val GRAY_01 = "0x7f0600c4"
private const val FLAGS = "0x1fe0" // same cra flags as the other menu items

@Suppress("unused")
val pdbProfileChatEntryPatch = bytecodePatch(
    name = "Chat button on profiles",
    description = "Adds a 'Chat' entry to the profile screen's ⋯ menu: opens " +
        "your conversation with that user when one exists, otherwise their " +
        "profile (channels are server-created — no fake channel making).",
    default = false,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        // ── 1. menu item in scf.onClick ──
        val scf = mutableClassDefBy("Lscf;")
        val onClick = scf.methods.firstOrNull {
            it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;")
        } ?: throw IllegalStateException("scf.onClick not found")

        val draNew = onClick.indexOfFirstInstruction {
            opcode == Opcode.NEW_INSTANCE &&
                (this as? ReferenceInstruction)?.reference is TypeReference &&
                ((this as ReferenceInstruction).reference as TypeReference).type == "Ldra;"
        }
        if (draNew < 0) throw IllegalStateException("scf.onClick: menu builder (new dra) not found")

        onClick.addInstructions(
            draNew,
            """
            new-instance v4, Lcra;
            const v5, $MENU_ID
            invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v5
            const-string v6, "Chat"
            const v7, $ICON
            invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v7
            invoke-virtual {v0}, Lscf;->b0()Landroid/content/Context;
            move-result-object v8
            const v9, $GRAY_01
            invoke-virtual {v8, v9}, Landroid/content/Context;->getColor(I)I
            move-result v8
            invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v8
            const/4 v9, 0x0
            const/4 v10, 0x0
            const/4 v11, 0x0
            const v12, $FLAGS
            invoke-direct/range {v4 .. v12}, Lcra;-><init>(ILjava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;ILjava/lang/Integer;II)V
            invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            """.trimIndent(),
        )

        // ── 2. click branch in m9f.onClick case 3 ──
        val m9f = mutableClassDefBy("Lm9f;")
        val dispatch = m9f.methods.firstOrNull {
            it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;")
        } ?: throw IllegalStateException("m9f.onClick not found")

        // pswitch_b starts at the sget of Lscf;->z0; the id lands in v1 right
        // after the second getId() call following it.
        val z0Get = dispatch.indexOfFirstInstruction {
            opcode == Opcode.SGET_OBJECT &&
                (this as? ReferenceInstruction)?.reference.toString()
                    .contains("Lscf;->z0") == true
        }
        if (z0Get < 0) throw IllegalStateException("m9f.onClick: scf case (z0 sget) not found")

        var idMove = -1
        val instrs = dispatch.implementation?.instructions ?: throw IllegalStateException("no impl")
        for (i in z0Get + 1 until instrs.size - 1) {
            val ins = instrs[i]
            if (ins.opcode == Opcode.INVOKE_VIRTUAL &&
                (ins as? ReferenceInstruction)?.reference.toString()
                    .contains("Landroid/view/View;->getId()I") == true &&
                instrs[i + 1].opcode == Opcode.MOVE_RESULT
            ) {
                idMove = i + 2 // after `move-result v1` (+ the `const/4 v2, 0`)
                break
            }
        }
        if (idMove < 0) throw IllegalStateException("m9f.onClick: id load not found")

        dispatch.addInstructionsWithLabels(
            idMove,
            """
            const v3, $MENU_ID
            if-ne v1, v3, :morphe_chat_skip
            invoke-virtual {v0}, Lscf;->b0()Landroid/content/Context;
            move-result-object v1
            invoke-virtual/range {v15 .. v15}, Lfaf;->getId()Ljava/lang/String;
            move-result-object v3
            invoke-static {v1, v3}, Lapp/template/extension/pdb/PdbTools;->openChat(Landroid/content/Context;Ljava/lang/String;)V
            return-void
            """.trimIndent(),
            ExternalLabel("morphe_chat_skip", instrs[idMove]),
        )
    }
}
