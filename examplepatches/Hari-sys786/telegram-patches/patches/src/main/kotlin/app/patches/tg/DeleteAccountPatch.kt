package app.patches.tg

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.patches.tg.TgSupport.desc
import app.patches.tg.TgSupport.methodOrNull
import app.patches.tg.TgSupport.mutableClassOrThrow
import app.patches.tg.TgSupport.replaceMethodBody
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.io.ByteArrayInputStream
import java.util.function.Supplier

/**
 * Bundled smali for the Delete Account feature, ported from the reference
 * tg_deleteaccount_patch.py (Cherrygram DeleteAccountDialog, GPL v2).
 */
internal object DeleteAccountResources {
    private val NAMES = listOf(
        "DeleteAccountDialog.smali",
        "DeleteAccountDialog\$1.smali",
        "DeleteAccountDialog\$2.smali",
        "DeleteAccountDialog\$2\$1.smali",
        "DeleteAccountDialog\$3.smali",
        "DeleteAccountDialog\$4.smali",
    )

    fun smaliClasses(): List<String> = NAMES.map { name ->
        val stream = DeleteAccountResources::class.java.getResourceAsStream("/tg/$name")
            ?: throw PatchException("Bundled smali resource is missing: /tg/$name")
        stream.use { it.readBytes().toString(Charsets.UTF_8) }
    }

    fun dex(): ByteArray = TgSupport.assembleDex(smaliClasses())
}

private const val SETTINGS_ACTIVITY = "org/telegram/ui/SettingsActivity"

/**
 * Patch 19 — Delete Account dialog (Cherrygram port).
 *
 * Adds six classes (assembled to DEX at patch time and merged as an extension) and wires a red
 * "Delete Account" sub-item (id = 3) into Settings, dispatching to DeleteAccountDialog.
 */
@Suppress("unused")
val deleteAccountPatch = bytecodePatch(
    name = "Delete Account dialog",
    description = "Adds a Settings entry that opens a Cherrygram-style Delete Account dialog " +
        "(red 20s countdown, deletes all dialogs, calls account.deleteAccount, then logs out).",
    default = true,
) {
    compatibleWith(*TG_COMPATIBILITY)
    extendWith(Supplier { ByteArrayInputStream(DeleteAccountResources.dex()) })

    execute {
        // 1) SettingsActivity.createView: inject the "Delete Account" sub-item before the
        //    `new-instance v2, Lorg/telegram/ui/SettingsActivity${'$'}4;` instruction.
        val settings = mutableClassOrThrow(desc(SETTINGS_ACTIVITY))
        val createView = settings.methodOrNull("createView", listOf("Landroid/content/Context;"))
            ?: throw PatchException("SettingsActivity.createView(Context) not found")
        val impl = createView.implementation
            ?: throw PatchException("SettingsActivity.createView has no implementation")
        val anchorIndex = impl.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lorg/telegram/ui/SettingsActivity\$4;"
        }
        if (anchorIndex < 0) {
            throw PatchException("SettingsActivity.createView: SettingsActivity\$4 anchor not found")
        }
        createView.addInstructions(
            anchorIndex,
            """
                iget-object v2, v0, Lorg/telegram/ui/SettingsActivity;->otherItem:Lorg/telegram/ui/ActionBar/ActionBarMenuItem;
                sget v5, Lorg/telegram/messenger/R${'$'}drawable;->msg_delete:I
                const-string v6, "Delete Account"
                const/4 v7, 0x3
                invoke-virtual {v2, v7, v5, v6}, Lorg/telegram/ui/ActionBar/ActionBarMenuItem;->addSubItem(IILjava/lang/CharSequence;)Lorg/telegram/ui/ActionBar/ActionBarMenuSubItem;
                move-result-object v2
                const/high16 v5, -0x10000
                invoke-virtual {v2, v5}, Lorg/telegram/ui/ActionBar/ActionBarMenuSubItem;->setTextColor(I)V
            """.trimIndent(),
        )

        // 2) SettingsActivity$2.onItemClick: dispatch id == 3 to the dialog (original semantics kept).
        replaceMethodBody(
            classType = desc("org/telegram/ui/SettingsActivity\$2"),
            name = "onItemClick",
            parameters = listOf("I"),
            locals = 1,
            body = """
                const/4 v0, -0x1
                if-ne p1, v0, :cond_9
                iget-object p1, p0, Lorg/telegram/ui/SettingsActivity${'$'}2;->this${'$'}0:Lorg/telegram/ui/SettingsActivity;
                invoke-virtual {p1}, Lorg/telegram/ui/ActionBar/BaseFragment;->finishFragment()V
                return-void
                :cond_9
                const/4 v0, 0x3
                if-ne p1, v0, :cond_delacct
                iget-object p1, p0, Lorg/telegram/ui/SettingsActivity${'$'}2;->this${'$'}0:Lorg/telegram/ui/SettingsActivity;
                invoke-static {p1}, Lorg/telegram/ui/DeleteAccountDialog;->showDeleteAccountDialog(Lorg/telegram/ui/ActionBar/BaseFragment;)V
                return-void
                :cond_delacct
                const/4 v0, 0x2
                if-ne p1, v0, :cond_16
                iget-object p1, p0, Lorg/telegram/ui/SettingsActivity${'$'}2;->this${'$'}0:Lorg/telegram/ui/SettingsActivity;
                new-instance v0, Lorg/telegram/ui/LogoutActivity;
                invoke-direct {v0}, Lorg/telegram/ui/LogoutActivity;-><init>()V
                invoke-static {p1, v0}, Lorg/telegram/ui/SettingsActivity;->access${'$'}600(Lorg/telegram/ui/SettingsActivity;Lorg/telegram/ui/ActionBar/BaseFragment;)V
                :cond_16
                return-void
            """.trimIndent(),
        )
    }
}
