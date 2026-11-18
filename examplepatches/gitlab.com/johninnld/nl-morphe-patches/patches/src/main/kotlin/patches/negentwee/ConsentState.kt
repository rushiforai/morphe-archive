package patches.negentwee

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun preserveLocalConsentDecisions() {
    val signature = "a(Ljava/lang/String;Ljava/util/List;Lcom/usercentrics/sdk/v2/consent/data/DataTransferObject;)Ljava/util/ArrayList;"
    val original = exact("Lo83;", signature, 17, 44, 259)
    val owner = target("Lo83;", signature).classDef
    check(owner.methods.none { it.name == "morpheApplyLocalConsent" })
    // Local explicit choices must take effect even after clock rollback or an
    // equal-second choice. Keep the original merge for imported consent/history.
    owner.methods.add(MutableMethod(ImmutableMethod(original.definingClass,
        "morpheApplyLocalConsent", original.parameters, original.returnType,
        original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        original.implementation)).apply {
        implementation!!.replaceInstruction(124,
            BuilderInstruction30t(Opcode.GOTO_32, implementation!!.newLabelForIndex(195)))
    })
    val commit = exact("Lo83;", "b(Ljava/lang/String;Ljava/util/List;Ltcd;Lvcd;)V", 17, 13, 83)
    // v6 remains live as the native action through persistence/notification.
    commit.replaceInstruction(25, "move-object v6, p3")
    commit.addInstructions(26, "iget-object p2, v0, La6b;->b:Ll37;")
    val afterResult = commit.getInstruction(25)
    commit.replaceInstruction(23, "sget-object v6, Ltcd;->UPDATE_SERVICES:Ltcd;")
    commit.addInstructionsWithLabels(24, """
        if-ne p3, v6, :native
        sget-object v6, Lvcd;->EXPLICIT:Lvcd;
        if-ne p4, v6, :native
        invoke-virtual {p0, p1, v5, p2}, Lo83;->morpheApplyLocalConsent(Ljava/lang/String;Ljava/util/List;Lcom/usercentrics/sdk/v2/consent/data/DataTransferObject;)Ljava/util/ArrayList;
        move-result-object p1
        goto/32 :after_result
        :native
        invoke-virtual {p0, p1, v5, p2}, Lo83;->a(Ljava/lang/String;Ljava/util/List;Lcom/usercentrics/sdk/v2/consent/data/DataTransferObject;)Ljava/util/ArrayList;
    """.trimIndent(), ExternalLabel("after_result", afterResult))

    val observer = target("Lhb3;", "invoke(Ljava/lang/Object;)Ljava/lang/Object;").classDef
    check(observer.methods.none { it.name == "morpheConsentMatches" })
    observer.methods.add(MutableMethod(ImmutableMethod("Lhb3;", "morpheConsentMatches",
        listOf(ImmutableMethodParameter("Ljava/util/List;", emptySet(), null),
            ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null)),
        "Z", 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()))).apply {
        addInstructions(0, """
            const/4 v0, 0x0
            invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v1
            :next
            invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :done
            invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2
            check-cast v2, Lcom/usercentrics/sdk/UsercentricsServiceConsent;
            iget-object v3, v2, Lcom/usercentrics/sdk/UsercentricsServiceConsent;->a:Ljava/lang/String;
            invoke-static {v3, p1}, Lc56;->c(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v3
            if-eqz v3, :other
            iget-boolean v3, v2, Lcom/usercentrics/sdk/UsercentricsServiceConsent;->b:Z
            if-eqz v3, :failed
            const/4 v0, 0x1
            goto :next
            :other
            iget-boolean v3, v2, Lcom/usercentrics/sdk/UsercentricsServiceConsent;->g:Z
            iget-boolean v2, v2, Lcom/usercentrics/sdk/UsercentricsServiceConsent;->b:Z
            if-ne v2, v3, :failed
            goto :next
            :done
            return v0
            :failed
            const/4 v0, 0x0
            return v0
        """.trimIndent())
    })

    val home = exact("Lnl/negentwee/ui/features/home/HomeViewModel;", "v()V", 17, 8, 49)
    home.addInstructionsWithLabels(6, """
        iget-object v5, p0, Lnl/negentwee/ui/features/home/HomeViewModel;->q:Lru2;
        iget-object v6, v5, Lru2;->k:Le6;
        sget-object v2, Lru2;->m:[Ljl6;
        const/4 v1, 0x1
        aget-object v2, v2, v1
        invoke-virtual {v6, v5, v2}, Lb6;->o(Lav5;Ljl6;)Ljava/lang/Object;
        move-result-object v2
        check-cast v2, Ljava/lang/Boolean;
        invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
        move-result v1
        if-eqz v1, :continue
        const/4 v0, 0x0
        :continue
        const/4 v1, 0x0
    """.trimIndent())
}
