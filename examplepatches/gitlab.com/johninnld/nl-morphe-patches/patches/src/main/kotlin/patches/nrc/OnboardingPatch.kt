package patches.nrc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ACTIVITY = "Lpinch/nrcnext/ui/onboarding/OnboardingActivity;"
private const val MODEL = "Lpinch/nrcnext/ui/welcome/OnboardingViewModel;"
private const val PAGE = "Lnl/pinch/nrc/data/model/onboarding/OnboardingPage;"

/** Reuse the exact original Overslaan completion, persistence and navigation. */
context(context: app.morphe.patcher.patch.BytecodePatchContext)
internal fun skipDefaultWelcome() {
    val activity = exact(ACTIVITY, "onCreate", "V", "Landroid/os/Bundle;")
    val model = exact(MODEL, "getStartingPage", PAGE)
    exact(ACTIVITY, "Q", PAGE)
    exact(ACTIVITY, "R", MODEL)
    exact(ACTIVITY, "V", "V", "Z")
    exact(ACTIVITY, "T", "V")
    exact(MODEL, "setWelcomePageShown", "V")
    exact("Lnl/pinch/nrc/data/repositories/welcome/WelcomeRepository;", "didShowWelcomePage", "Z")
    check(activity.classDef.methods.none { it.name == "morpheSkipWelcome" }) { "NRC welcome policy already present" }
    check(model.classDef.methods.none { it.name == "morpheShouldSkipWelcome" }) { "NRC welcome state policy already present" }
    val matches = activity.method.implementation!!.instructions.withIndex().filter { (_, insn) ->
        ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == "Lpinch/nrcnext/consent/ConsentManager;" && it.name == "showWhenNeeded" &&
                it.parameterTypes == listOf("Landroidx/fragment/app/FragmentActivity;", "Lnl/pinch/nrc/analytics/params/ConsentScreen;") && it.returnType == "V"
        } == true
    }
    check(matches.size == 1) { "Expected one NRC onboarding consent readiness dispatch, found ${matches.size}" }
    model.classDef.methods.add(helper(MODEL, "morpheShouldSkipWelcome", "Z", listOf(MODEL), 2, """
        iget-object v0, p0, $MODEL->Z:Lnl/pinch/nrc/data/repositories/welcome/WelcomeRepository;
        invoke-interface {v0}, Lnl/pinch/nrc/data/repositories/welcome/WelcomeRepository;->didShowWelcomePage()Z
        move-result v0
        if-nez v0, :keep
        invoke-virtual {p0}, $MODEL->getStartingPage()$PAGE
        move-result-object v0
        sget-object v1, $PAGE->Login:$PAGE
        if-ne v0, v1, :keep
        const/4 v0, 0x1
        return v0
        :keep
        const/4 v0, 0x0
        return v0
    """))
    activity.classDef.methods.add(helper(ACTIVITY, "morpheSkipWelcome", "Z", listOf(ACTIVITY), 1, """
        invoke-direct {p0}, $ACTIVITY->Q()$PAGE
        move-result-object v0
        if-nez v0, :keep
        invoke-direct {p0}, $ACTIVITY->R()$MODEL
        move-result-object v0
        invoke-static {v0}, $MODEL->morpheShouldSkipWelcome($MODEL)Z
        move-result v0
        if-eqz v0, :keep
        const/4 v0, 0x0
        invoke-direct {p0, v0}, $ACTIVITY->V(Z)V
        invoke-virtual {p0}, Landroid/app/Activity;->finish()V
        const/4 v0, 0x1
        return v0
        :keep
        const/4 v0, 0x0
        return v0
    """))
    val index = matches.single().index + 1
    activity.method.addInstructionsWithLabels(index, """
        invoke-static {p0}, $ACTIVITY->morpheSkipWelcome($ACTIVITY)Z
        move-result v2
        if-eqz v2, :original
        return-void
    """.trimIndent(), ExternalLabel("original", activity.method.getInstruction(index)))
}
