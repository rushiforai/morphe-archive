package patches.west

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun applyConsentHelpers() {
    val owner = exact("Lxi5;", "U(Z)Z").classDef
    check(owner.methods.none { it.name == "morpheSaveRegions" })
    val helper = MutableMethod(ImmutableMethod("Lxi5;", "morpheSaveRegions",
        listOf(ImmutableMethodParameter("Lxi5;", emptySet(), null)), "V", 0x9,
        emptySet(), emptySet(), ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    // Reuse the native region preference writer without the mixed U(Z)
    // notification flags, subscription scheduling or measurement side effects.
    helper.addInstructions(0, """
        iget-object v0, p0, Lxi5;->d0:Lq60;
        invoke-virtual {v0}, Lg94;->d()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Ljava/util/List;
        if-eqz v0, :done
        invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
        move-result v2
        if-nez v2, :done
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
        move-result-object v0
        :next
        invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :save
        invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        check-cast v2, Lsy6;
        invoke-virtual {v2}, Lsy6;->b()Z
        move-result v3
        if-eqz v3, :next
        invoke-virtual {v2}, Lsy6;->a()Lez7;
        move-result-object v2
        iget-object v2, v2, Lez7;->a:Ljava/lang/String;
        invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :save
        iget-object p0, p0, Lxi5;->T:Ls67;
        invoke-virtual {p0, v1}, Ls67;->m(Ljava/util/ArrayList;)V
        :done
        return-void
    """.trimIndent())
    owner.methods.add(helper)

    val activity = exact("Lnl/stichtingrpo/news/onboarding/OnboardingActivity;", "onCreate(Landroid/os/Bundle;)V").method
    val continuation = activity.getInstruction(251)
    check(continuation.opcode == Opcode.INVOKE_VIRTUAL &&
        (continuation as ReferenceInstruction).reference.toString() == "Ln90;->u()Lfh8;")
    // Bind to the retained instruction, not a trailing label in a temporary
    // inserted block. Zero regions complete before attaching an empty pager.
    activity.addInstructionsWithLabels(251, """
        invoke-virtual {v2}, Lzi5;->b()I
        move-result v4
        if-nez v4, :west_region_available
        invoke-virtual {p0}, Lnl/stichtingrpo/news/onboarding/OnboardingActivity;->C()V
        return-void
    """.trimIndent(), ExternalLabel("west_region_available", continuation))
}
