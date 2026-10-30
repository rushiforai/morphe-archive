package patches.negentwee

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val skipConsentScreens = bytecodePatch(
    name = "Skip consent screens",
    description = "Rejects advertising and analytics consent before startup onboarding is selected. Allows local trips, favourites and tickets through 9292's separate functional-data service. Includes ad and tracking controls and preserves native completion handling.",
) {
    dependsOn(originalInput, disableTracking)
    compatibleWith(negentwee)
    execute {
        preserveLocalConsentDecisions()
        val method = exact("Lhb3;", "invoke(Ljava/lang/Object;)Ljava/lang/Object;", 17, 31, 811)
        val ready = method.getInstruction<ReferenceInstruction>(38)
        val stored = method.getInstruction<ReferenceInstruction>(45)
        check(ready.opcode == Opcode.IGET_BOOLEAN && ready.reference.toString() ==
            "Lcom/usercentrics/sdk/UsercentricsReadyStatus;->a:Z")
        check(stored.opcode == Opcode.IGET_OBJECT && stored.reference.toString() ==
            "Lcom/usercentrics/sdk/UsercentricsReadyStatus;->b:Ljava/util/List;")
        // Only this ready-success arm changes. Its existing false branch applies
        // the actual returned decisions and runs the original completion callback.
        // Submit one complete decision set. The SDK stores timestamps in whole
        // seconds and restores the first write when a later write ties it, so
        // deny-all followed by enable-functional can retain functional denial.
        // Native update handling keeps essential services enabled.
        method.replaceInstruction(45, "invoke-static {}, Lvdg;->s()Lydd;")
        method.addInstructionsWithLabels(46, """
            move-result-object v1
            sget-object v3, Lvcd;->EXPLICIT:Lvcd;
            iget-object v4, v0, Lnl/negentwee/ui/features/MainViewModel;->a:Luu2;
            iget-object v4, v4, Luu2;->i:Lzyb;
            invoke-virtual {v4}, Lzyb;->getValue()Ljava/lang/Object;
            move-result-object v4
            check-cast v4, Ljava/lang/String;
            new-instance v5, Ljava/util/ArrayList;
            invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
            invoke-virtual {v1}, Lydd;->c()Ljava/util/ArrayList;
            move-result-object v6
            invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v6
            :decision_loop
            invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z
            move-result v7
            if-eqz v7, :apply_decisions
            invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v7
            check-cast v7, Lcom/usercentrics/sdk/UsercentricsServiceConsent;
            iget-object v7, v7, Lcom/usercentrics/sdk/UsercentricsServiceConsent;->a:Ljava/lang/String;
            invoke-static {v7, v4}, Lc56;->c(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v8
            new-instance v9, Lcom/usercentrics/sdk/UserDecision;
            invoke-direct {v9, v7, v8}, Lcom/usercentrics/sdk/UserDecision;-><init>(Ljava/lang/String;Z)V
            invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
            goto :decision_loop
            :apply_decisions
            invoke-virtual {v1, v5, v3}, Lydd;->f(Ljava/util/List;Lvcd;)Ljava/util/ArrayList;
            move-result-object v1
            invoke-static {v1, v4}, Lhb3;->morpheConsentMatches(Ljava/util/List;Ljava/lang/String;)Z
            move-result v3
            if-nez v3, :approved
            new-instance v3, Ljava/lang/IllegalStateException;
            const-string v5, "Privacy settings could not be saved. Please try again."
            invoke-direct {v3, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
            new-instance v1, Lnl/negentwee/domain/Result${'$'}Error;
            invoke-direct {v1, v3}, Lnl/negentwee/domain/Result${'$'}Error;-><init>(Ljava/lang/Throwable;)V
            goto/32 :consent_error
        """.trimIndent(), ExternalLabel("approved", method.getInstruction(46)),
            ExternalLabel("consent_error", method.getInstruction(52)))
        method.replaceInstruction(38, "const/4 v3, 0x0")

        // An earlier consent rejection can leave this nullable popup flag true.
        // Migrate it before HomeViewModel observes preferences, including while
        // the SDK briefly reports denial. Keep explicit shouldDeleteUserData intact.
        exact("Lru2;", "<init>(Landroid/content/SharedPreferences;Lqg9;Lqn8;)V",
            65537, 5, 23).addInstructions(22, """
                iget-object v0, p0, Lru2;->g:Landroid/content/SharedPreferences;
                invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0
                const-string p1, "shouldShowDeleteUserDataConfirmationPopup"
                invoke-interface {v0, p1}, Landroid/content/SharedPreferences${'$'}Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                const-string p1, "isFunctionalConsentGiven"
                const/4 p2, 0x1
                invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            """.trimIndent())
    }
}
