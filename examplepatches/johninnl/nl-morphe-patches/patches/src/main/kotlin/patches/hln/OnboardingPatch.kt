package patches.hln

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val ROUTER = "Lr9j;"
private const val ROUTE = "b(Landroid/content/Context;Lp9j;Landroid/content/Intent;)V"
private const val TOPICS = "Lcom/kubusapp/onboarding/OnBoardingPushNotificationActivity;"
private const val REGION = "Lcom/kubusapp/region/Region;"

context(context: app.morphe.patcher.patch.BytecodePatchContext)
private fun addOnboardingHelper(name: String, params: List<String>, locals: Int, code: String) {
    val owner = exact(ROUTER, ROUTE).classDef
    check(owner.methods.none { it.name == name }) { "HLN onboarding helper already present: $name" }
    owner.methods.add(MutableMethod(ImmutableMethod(
        ROUTER, name, params.map { ImmutableMethodParameter(it, emptySet(), null) }, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(locals + params.size, emptyList(), emptyList(), emptyList()),
    )).apply { addInstructions(0, code.trimIndent()) })
}

/** Called only by the guarded Skip consent screens execute block. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun skipOnboardingPrompts() {
    exact("La45;", "<init>(B)V")
    exact("Lkaf;", "contains(Ljava/lang/String;)Z")
    exact("Lkaf;", "edit()Landroid/content/SharedPreferences\$Editor;")
    addOnboardingHelper("morpheSeedTopicChoices", emptyList(), 3, """
        new-instance v0, La45;
        const/16 v1, 0x1d
        invoke-direct {v0, v1}, La45;-><init>(B)V
        iget-object v0, v0, La45;->b:Ljava/lang/Object;
        check-cast v0, Lwlg;
        invoke-virtual {v0}, Lwlg;->getValue()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Lkaf;
        const-string v1, "USER_CHANNELS"
        invoke-virtual {v0, v1}, Lkaf;->contains(Ljava/lang/String;)Z
        move-result v2
        if-nez v2, :done
        invoke-virtual {v0}, Lkaf;->edit()Landroid/content/SharedPreferences${'$'}Editor;
        move-result-object v0
        invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;
        move-result-object v2
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences${'$'}Editor;
        invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
        :done
        return-void
    """)
    addOnboardingHelper("morpheContinueGuest", listOf("Landroid/content/Context;"), 2, """
        sget-object v0, Lp9j;->PUSH_NOTIFICATION_SCREEN:Lp9j;
        const/4 v1, 0x0
        invoke-static {p0, v0, v1}, Lr9j;->b(Landroid/content/Context;Lp9j;Landroid/content/Intent;)V
        return-void
    """)

    val router = exact(ROUTER, ROUTE).method
    val original = router.instructions.toList()
    val logins = original.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lox8;" && ref.name == "w" && ref.returnType == "V" &&
            ref.parameterTypes == listOf("Landroid/content/Context;", "Z", "Lcom/dpg/auth/authentication/LoginDrivers;", "I")
    }
    check(logins.size == 2) { "Expected two HLN automatic onboarding login calls, found ${logins.size}" }
    logins.forEach { (index, instruction) ->
        check(instruction.opcode == Opcode.INVOKE_STATIC)
        val caller = (instruction as FiveRegisterInstruction).registerC
        check(caller == router.implementation!!.registerCount - 3) { "HLN login context register changed" }
        router.replaceInstruction(index, "invoke-static {v$caller}, Lr9j;->morpheContinueGuest(Landroid/content/Context;)V")
    }
    val seduction = original.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.CONST_CLASS &&
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Lcom/kubusapp/onboarding/LoginSeductionActivity;"
    }
    check(seduction.size == 1) { "Expected one HLN login-seduction route, found ${seduction.size}" }
    seduction.single().let { (index, instruction) ->
        router.replaceInstruction(index, "const-class v${(instruction as OneRegisterInstruction).registerA}, $TOPICS")
    }
    // Bind to the real original instruction; a trailing injected label can
    // otherwise attach to an unrelated existing label when parsed/emitted.
    router.addInstructionsWithLabels(0, """
        sget-object v0, Lp9j;->PUSH_NOTIFICATION_SCREEN:Lp9j;
        if-ne p1, v0, :originalOnboarding
        invoke-static {}, Lr9j;->morpheSeedTopicChoices()V
    """.trimIndent(), ExternalLabel("originalOnboarding", router.getInstruction(0)))

    val topic = exact(TOPICS, "onCreate(Landroid/os/Bundle;)V").method
    val topicCode = topic.instructions.toList()
    val earlyContinue = topicCode.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == TOPICS && ref.name == "k" && ref.parameterTypes.isEmpty() && ref.returnType == "V"
    }
    val layouts = topicCode.withIndex().filter { (_, instruction) ->
        (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f0d00f7
    }
    check(earlyContinue.size == 1 && layouts.size == 1 && earlyContinue.single().index < layouts.single().index) {
        "HLN topic onboarding lifecycle changed"
    }
    exact(TOPICS, "l(Landroid/os/Bundle;)V")
    exact(TOPICS, "k()V")
    // Keep super/Hilt and the completed-user Main/intent branch. Do not
    // inflate the fragment: its exit callback persists default selections.
    topic.replaceInstruction(earlyContinue.single().index, "nop")
    topic.replaceInstruction(layouts.single().index, "invoke-virtual {p0}, $TOPICS->k()V")
    topic.addInstructions(layouts.single().index + 1, "return-void")

    val state = exact("Lds6;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;").method
    val constructors = state.instructions.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lbs6;" && ref.name == "<init>" &&
            ref.parameterTypes == listOf(REGION, "Z", "Z", "Ljava/lang/String;", "I")
    }
    check(constructors.size == 1) { "Expected one HLN initial city notification state, found ${constructors.size}" }
    exact("Lbs6;", "<init>(${REGION}ZZLjava/lang/String;Z)V")
    constructors.single().let { (index, instruction) ->
        check(instruction.opcode == Opcode.INVOKE_DIRECT_RANGE)
        val start = (instruction as RegisterRangeInstruction).startRegister
        check(start + 5 <= 15) { "HLN region state register layout changed" }
        state.replaceInstruction(index, "const/4 v${start + 3}, 0x0")
        state.addInstructions(index + 1, """
            const/4 v${start + 5}, 0x0
            invoke-direct/range {v$start .. v${start + 5}}, Lbs6;-><init>(${REGION}ZZLjava/lang/String;Z)V
        """.trimIndent())
    }

    val resume = exact("Lcom/kubusapp/onboarding/followablepush/FollowablePushActivity;", "onResume()V").method
    val resumeCode = resume.instructions.toList()
    val copies = resumeCode.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lbs6;" && ref.name == "a" && ref.returnType == "Lbs6;" &&
            ref.parameterTypes == listOf("Lbs6;", "Z", "Z", "Z", "I")
    }
    check(copies.size == 1) { "Expected one HLN city resume state copy, found ${copies.size}" }
    val copy = copies.single()
    val maskRegister = (copy.value as FiveRegisterInstruction).registerG
    val masks = resumeCode.take(copy.index).withIndex().filter { (_, instruction) ->
        (instruction as? OneRegisterInstruction)?.registerA == maskRegister &&
            (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x19
    }
    check(masks.size == 1) { "HLN city resume state mask changed" }
    resume.replaceInstruction(masks.single().index, "const/16 v$maskRegister, 0x1d")
}
