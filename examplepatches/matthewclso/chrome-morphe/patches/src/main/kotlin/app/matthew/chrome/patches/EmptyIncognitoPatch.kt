package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

/** Retain the empty private Hub pane while letting Chrome destroy its session. */
val emptyIncognitoPatch = bytecodePatch(
    description = "Keeps the Incognito tab viewer selected after closing its last tab.",
    default = false,
) {
    compatibleWith(chromeCompatibility)
    dependsOn(modeTogglePatch)
    execute {
        requireTarget(packageMetadata)
        val observer = mutableClassDefBy("Ls7d;")
        val empty = observer.methods.single { it.name == "b" && it.parameterTypes.isEmpty() }
        check(empty.implementation!!.registerCount == 13)
        check(empty.implementation!!.instructions.any {
            (it as? ReferenceInstruction)?.reference.toString() == "Lx7d;->Q0:Ly5d;"
        })
        val cleanup = classDefBy("Lv7d;").methods.single { it.name == "run" }
        check(cleanup.implementation!!.instructions.any {
            (it as? ReferenceInstruction)?.reference.toString() == "Lfgr;->q()V"
        })
        // E0 is the focused pane's controller; j0 reports whether it is visible.
        // Keep the visible pane and native new-tab control, but destroy its coordinator
        // just as Chrome does. Retaining it can retain private session storage.
        // Native tab/model/profile destruction and unfocused cleanup are untouched.
        empty.addInstructionsWithLabels(0, """
            iget-object v0, p0, Ls7d;->a:Lx7d;
            iget-object v1, v0, Lfgr;->E0:Lrbc;
            if-eqz v1, :native_cleanup
            iget-object v1, v0, Lfgr;->j0:Ln7i;
            iget-object v1, v1, Ln7i;->U:Ljava/lang/Object;
            check-cast v1, Ljava/lang/Boolean;
            invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
            move-result v1
            if-eqz v1, :native_cleanup
            invoke-virtual {v0}, Lfgr;->q()V
            const/4 v1, -0x1
            iput v1, v0, Lx7d;->P0:I
            return-void
        """.trimIndent(), ExternalLabel("native_cleanup", empty.implementation!!.instructions.first()))

        // The Hub's native new-tab listener normally relies on the active model.
        // After the empty session has ended, use the visible pane to choose the
        // native creator instead. Menu commands and browsing-toolbar clicks keep
        // their explicit/native mode, and native creation performs the selection.
        val listener = mutableClassDefBy("Lpr4;").methods.single { it.name == "onClick" }
        check(listener.hasString("MobileToolbarStackViewNewIncognitoTab"))
        val creator = listener.implementation!!.instructions.withIndex().single {
            (it.value as? ReferenceInstruction)?.reference.toString() == "$ACTIVITY->q(Z)Lamq;"
        }
        val call = creator.value as FiveRegisterInstruction
        check(call.registerC == 1 && call.registerD == 2)
        listener.replaceInstruction(creator.index,
            "invoke-static {v1, v2}, Lapp/matthew/chrome/extension/ModeRouting;->hubNewTabIncognito(Landroid/app/Activity;Z)Z")
        listener.addInstructions(creator.index + 1, """
            move-result v2
            invoke-virtual {v1, v2}, $ACTIVITY->q(Z)Lamq;
        """.trimIndent())
        println("Empty Incognito: retain the focused pane; destroy its coordinator and private session normally")
    }
}
