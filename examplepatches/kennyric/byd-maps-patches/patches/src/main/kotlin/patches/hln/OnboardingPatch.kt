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

private const val ROUTER = "Ligj;"
private const val ROUTE = "b(Landroid/content/Context;Lggj;Ln20;Landroid/content/Intent;)V"
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
    // R8 reshaped this chooser constructor (now synthetic); seed only when the
    // legacy instance accessor still exists.
    val seedTopicChoices = optionalExact("La45;", "<init>(B)V") != null
    exact("Ljef;", "contains(Ljava/lang/String;)Z")
    exact("Ljef;", "edit()Landroid/content/SharedPreferences\$Editor;")
    if (seedTopicChoices) addOnboardingHelper("morpheSeedTopicChoices", emptyList(), 3, """
        new-instance v0, La45;
        const/16 v1, 0x1d
        invoke-direct {v0, v1}, La45;-><init>(B)V
        iget-object v0, v0, La45;->b:Ljava/lang/Object;
        check-cast v0, Luqg;
        invoke-virtual {v0}, Luqg;->getValue()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Ljef;
        const-string v1, "USER_CHANNELS"
        invoke-virtual {v0, v1}, Ljef;->contains(Ljava/lang/String;)Z
        move-result v2
        if-nez v2, :done
        invoke-virtual {v0}, Ljef;->edit()Landroid/content/SharedPreferences${'$'}Editor;
        move-result-object v0
        invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;
        move-result-object v2
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences${'$'}Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences${'$'}Editor;
        invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
        :done
        return-void
    """)
    addOnboardingHelper("morpheContinueGuest", listOf("Landroid/content/Context;", "Ln20;"), 2, """
        invoke-static {p0, p1}, Ligj;->a(Landroid/content/Context;Ln20;)V
        return-void
    """)

    val router = exact(ROUTER, ROUTE).method
    // Every onboarding step except region selection must go straight to the news
    // activity: `Ligj;->a(Context, n20)` persists KEY_ON_BOARDING_COMPLETE, emits
    // tutorial_complete and starts MainActivity.
    //
    // The redirect has to happen at method entry. Replacing the automatic-login
    // call sites (as 9.22.0 did) cannot work here: by the time those branches run,
    // `p2` no longer holds `n20` (it has been overwritten with a screen-name String
    // and then a byte constant), so injecting `{p0, p2}` produced
    // "register v4 has type PositiveByteConstant but expected Reference: n20"
    // and the class was rejected by the verifier.
    val seedTopics = if (seedTopicChoices) "invoke-static {}, Ligj;->morpheSeedTopicChoices()V\n        " else ""
    router.addInstructionsWithLabels(0, """
        sget-object v0, Lggj;->REGION_SELECTION_SCREEN:Lggj;
        if-eq p1, v0, :originalRouter
        ${seedTopics}invoke-static {p0, p2}, Ligj;->morpheContinueGuest(Landroid/content/Context;Ln20;)V
        return-void
    """.trimIndent(), ExternalLabel("originalRouter", router.getInstruction(0)))
    // 9.23.3 routes the login-seduction destination from the onboarding
    // navigation owners rather than inside the router; redirect it to the news
    // activity. It must not fall back to $TOPICS, which is the push-notification
    // screen the reader is not supposed to see either.
    var seduction = 0
    listOf("Lafd;", "Lad8;").forEach { owner ->
        val ownerClass = context.mutableClassDefBy(owner)
        ownerClass.methods.forEach { method: MutableMethod ->
            method.implementation?.instructions?.toList()?.forEachIndexed { index, insn ->
                val type = ((insn as? ReferenceInstruction)?.reference as? TypeReference)?.type
                if (insn.opcode == Opcode.CONST_CLASS &&
                    type == "Lcom/kubusapp/onboarding/LoginSeductionActivity;") {
                    method.replaceInstruction(index,
                        "const-class v${(insn as OneRegisterInstruction).registerA}, Lcom/kubusapp/MainActivity;")
                    seduction++
                }
            }
        }
    }
    check(seduction >= 1) { "HLN login-seduction route not found" }

    val topic = exact(TOPICS, "onCreate(Landroid/os/Bundle;)V").method
    val topicCode = topic.instructions.toList()
    val earlyContinue = topicCode.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == TOPICS && ref.name == "k" && ref.parameterTypes.isEmpty() && ref.returnType == "V"
    }
    val layouts = topicCode.withIndex().filter { (_, instruction) ->
        (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f0d00f5
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

    // 9.23.3 builds the region state inside its own factory; the standalone
    // construction coroutine is gone, so apply this only when it still exists.
    optionalExact("Lds6;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;")?.let { state ->
    val constructors = state.instructions.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Las6;" && ref.name == "<init>" &&
            ref.parameterTypes == listOf(REGION, "Z", "Z", "Ljava/lang/String;", "I")
    }
    // The publisher may relocate this construction; apply it only when the
    // single expected call site is still present.
    exact("Las6;", "<init>(${REGION}ZZLjava/lang/String;Z)V")
    constructors.singleOrNull()?.let { (index, instruction) ->
        check(instruction.opcode == Opcode.INVOKE_DIRECT_RANGE)
        val start = (instruction as RegisterRangeInstruction).startRegister
        check(start + 5 <= 15) { "HLN region state register layout changed" }
        state.replaceInstruction(index, "const/4 v${start + 3}, 0x0")
        state.addInstructions(index + 1, """
            const/4 v${start + 5}, 0x0
            invoke-direct/range {v$start .. v${start + 5}}, Las6;-><init>(${REGION}ZZLjava/lang/String;Z)V
        """.trimIndent())
    }
    }

    val resume = exact("Lcom/kubusapp/onboarding/followablepush/FollowablePushActivity;", "onResume()V").method
    val resumeCode = resume.instructions.toList()
    val copies = resumeCode.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Las6;" && ref.name == "a" && ref.returnType == "Las6;" &&
            ref.parameterTypes == listOf("Las6;", "Z", "Z", "Z", "I")
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
