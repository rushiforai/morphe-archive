package app.afterglow.patches.interfaceui

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CHIP_SCROLL = "Lakjz;"
private const val OWNER_FIELD = "afterglow_commentsOwner"
private const val POLICY = "$EXTENSION_PACKAGE/interfaceui/CommentsHeaderPolicy;"

/** Retains the native header, animations and commands; only scroll collapse is redirected. */
internal val commentsHeaderHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val bind = Fingerprint(definingClass = "Laizu;", name = "accept", returnType = "V",
            parameters = listOf("Ljava/lang/Object;"), filters = listOf(
                methodCall(smali = "Lakhj;->aq()Z"),
                fieldAccess(smali = "Lakhj;->c:$CHIP_SCROLL", opcode = Opcode.IGET_OBJECT),
                methodCall(smali = "Lakif;->a()Landroid/view/View;"),
                fieldAccess(smali = "$CHIP_SCROLL->b:Landroid/view/View;", opcode = Opcode.IPUT_OBJECT),
                fieldAccess(smali = "$CHIP_SCROLL->a:Landroid/support/v7/widget/RecyclerView;", opcode = Opcode.IPUT_OBJECT),
            )).match()
        val scroll = Fingerprint(definingClass = CHIP_SCROLL, name = "fV", returnType = "V",
            parameters = listOf("Landroid/support/v7/widget/RecyclerView;", "I"), filters = listOf(
                fieldAccess(smali = "$CHIP_SCROLL->i:Laktm;"),
                methodCall(smali = "Laktm;->m(IJZ)Z"),
                methodCall(smali = "$CHIP_SCROLL->l()V"),
                methodCall(smali = "$CHIP_SCROLL->n()V"),
            )).match()
        Fingerprint(definingClass = CHIP_SCROLL, name = "l", returnType = "V", parameters = emptyList(),
            filters = listOf(methodCall(smali = "$CHIP_SCROLL->m(Landroid/animation/Animator\$AnimatorListener;)V"))).method
        Fingerprint(definingClass = CHIP_SCROLL, name = "n", returnType = "V", parameters = emptyList(),
            filters = listOf(methodCall(smali = "$CHIP_SCROLL->o()Z"),
                methodCall(smali = "$CHIP_SCROLL->q(Landroid/view/View;FFII)V"),
                methodCall(smali = "Landroid/animation/AnimatorSet;->start()V"))).method
        Fingerprint(definingClass = "Lakhj;", name = "aG", parameters = emptyList(), returnType = "V",
            strings = listOf("comment-item-section", "PAwatch_mobile_top_level_comments"),
            filters = listOf(fieldAccess(smali = "Lakhh;->p:Lbfgs;"),
                methodCall(smali = "Lajoz;->bJ(Lbfgs;)Ljava/lang/String;"))).method
        Fingerprint(definingClass = "Lajoz;", name = "bJ", parameters = listOf("Lbfgs;"), returnType = "Ljava/lang/String;",
            filters = listOf(fieldAccess(smali = "Lbfgs;->e:I"),
                fieldAccess(smali = "Lbfgs;->f:Ljava/lang/Object;"),
                fieldAccess(smali = "Lbfgm;->d:Ljava/lang/String;"))).method

        val ownerLoad = bind.instructionMatches[1]
        val ownerRegister = (ownerLoad.instruction as TwoRegisterInstruction).registerB
        val controllerRegister = (ownerLoad.instruction as TwoRegisterInstruction).registerA
        val boundView = bind.instructionMatches[3]
        require((boundView.instruction as TwoRegisterInstruction).registerB == controllerRegister
                && (bind.instructionMatches[4].instruction as TwoRegisterInstruction).registerB == controllerRegister
                && bind.method.implementation!!.instructions.toList().subList(ownerLoad.index + 1, boundView.index + 1)
                    .none { ownerRegister in it.writtenRegisters || controllerRegister in it.writtenRegisters }) {
            "Native comments chip binding no longer preserves its current panel owner"
        }
        val collapseCalls = scroll.method.implementation!!.instructions.withIndex().filter {
            ((it.value as? ReferenceInstruction)?.reference as? MethodReference)?.smali == "$CHIP_SCROLL->l()V"
        }.map { it.index }
        require(collapseCalls.size == 2) { "Native comments scroll-collapse call sites changed" }
        val controller = scroll.classDef
        require(controller.superclass == "Lqy;" && controller.fields.none { it.name == OWNER_FIELD }
                && controller.methods.none { it.name.startsWith("afterglow_comments") })
        controller.fields.add(ImmutableField(CHIP_SCROLL, OWNER_FIELD, "Ljava/lang/ref/WeakReference;",
            AccessFlags.PRIVATE.value, null, null, null).toMutable())
        controller.methods.add(ImmutableMethod(CHIP_SCROLL, "afterglow_commentsBind",
            listOf(ImmutableMethodParameter("Lakhj;", null, null)), "V", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null, null, MutableMethodImplementation(3)).toMutable().apply {
            addInstructions(0, """
                new-instance v0, Ljava/lang/ref/WeakReference;
                invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
                iput-object v0, p0, $CHIP_SCROLL->$OWNER_FIELD:Ljava/lang/ref/WeakReference;
                return-void
            """)
        })
        controller.addMethod("afterglow_commentsScrollCollapse", "V", 2, """
            iget-object v0, p0, $CHIP_SCROLL->$OWNER_FIELD:Ljava/lang/ref/WeakReference;
            if-eqz v0, :native
            invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lakhj;
            if-eqz v0, :native
            iget-object v0, v0, Lakhh;->p:Lbfgs;
            if-eqz v0, :native
            invoke-static { v0 }, Lajoz;->bJ(Lbfgs;)Ljava/lang/String;
            move-result-object v0
            invoke-static { v0 }, $POLICY->keepVisible(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :native
            invoke-virtual { p0 }, $CHIP_SCROLL->n()V
            return-void
            :native
            invoke-virtual { p0 }, $CHIP_SCROLL->l()V
            return-void
        """)
        bind.method.addInstruction(boundView.index + 1,
            "invoke-virtual { v$controllerRegister, v$ownerRegister }, $CHIP_SCROLL->afterglow_commentsBind(Lakhj;)V")
        collapseCalls.forEach { index ->
            // The existing fV receiver is p0 at these two calls. Keep its native
            // state bookkeeping and explicit m(listener) lifecycle transitions.
            val receiver = scroll.method.implementation!!.registerCount - 3
            val original = scroll.method.implementation!!.instructions.elementAt(index)
            require((original as? com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction)?.let {
                it.registerCount == 1 && it.registerC == receiver
            } == true) { "Native chip scroll receiver changed" }
            scroll.method.replaceInstruction(index,
                "invoke-virtual/range { p0 .. p0 }, $CHIP_SCROLL->afterglow_commentsScrollCollapse()V")
        }
        println("Afterglow comments header: two scroll-collapse calls; current panel identity and native chip commands retained")
    }
}
