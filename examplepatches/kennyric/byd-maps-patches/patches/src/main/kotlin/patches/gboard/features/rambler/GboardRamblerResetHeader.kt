package patches.gboard.features.rambler

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import patches.gboard.shared.gboardStructuralFingerprint
import patches.gboard.shared.generated.GboardVersionBindings

internal fun MutableMethod.preservePendingRamblerResetCleanup(classes: List<ClassDef>) {
    check(GboardVersionBindings.targetVersion == "18.6.3")
    check(definingClass == "Lfio;" && name == "i" && parameterTypes == listOf("Z") && returnType == "V")
    val byType = classes.associateBy { it.type }
    // Pin the callback constructor/ownership guard and both cancellation paths.
    // es.$cid is private, so the injected code must not read it across classes.
    val reviewed = listOf(
        Triple("Lfio;", "i(Z)V", "2fe7951077c3d00faf4bef22695e5fabc30aa7a69641a99170494ec370594f71"),
        Triple("Lfhy;", "d()V", "a07dea355b07d3c30aa2467e2f9ba6dd0352ba4af303b15fbcb563d0925c2e6a"),
        Triple("Lfhz;", "c(Lfhz;)V", "b4acc7601c5844d0e039c8d10cec8c142ad42b9087a88481c0f631599f05d1a1"),
        Triple("Let;", "<init>(Lfio;Lfhy;Landroid/view/ViewGroup;Landroid/view/View;I)V",
            "5c19aea02bc987e2408a94975116693bb73277f825be55823130a7ba8b520a29"),
        Triple("Let;", "run()V", "efef0e8d3e9f9d5bed35a25fcb1adc3dd395bf20ff6825d343bd85a7af71c153"),
    )
    reviewed.forEach { (owner, signature, expected) ->
        val method = checkNotNull(byType[owner]).methods.single {
            "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == signature
        }
        check(method.toMutable().gboardStructuralFingerprint() == expected) {
            "Unexpected 18.5.4 Rambler cleanup shape: $owner->$signature"
        }
    }
    listOf(
        Triple("Lfio;", "f", "Lfhy;"), Triple("Lfhy;", "e", "Lfhz;"),
        Triple("Lfhz;", "p", "Ljava/lang/Runnable;"),
        Triple("Let;", "b", "Ljava/lang/Object;"), Triple("Let;", "c", "Ljava/lang/Object;"),
    ).forEach { (owner, fieldName, type) ->
        val field = checkNotNull(byType[owner]).fields.single { it.name == fieldName && it.type == type }
        check(field.accessFlags and (AccessFlags.PRIVATE.value or AccessFlags.STATIC.value) == 0) {
            "Inaccessible Rambler cleanup field: $owner->$fieldName"
        }
    }
    val writers = classes.flatMap { owner -> owner.methods.flatMap { method ->
        method.implementation?.instructions?.toList().orEmpty().filter {
            it.opcode == Opcode.IPUT_OBJECT &&
                (it as? ReferenceInstruction)?.reference?.toString() == "Lfsy;->p:Ljava/lang/Runnable;"
        }.map { "${owner.type}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}" }
    } }.groupingBy { it }.eachCount()
    check(writers == mapOf("Lftn;->i(Z)V" to 2, "Lfsx;->d()V" to 1, "Lfsy;->c(Lfsy;)V" to 1)) {
        "Unknown Rambler pending callback writer"
    }
    val instructions = checkNotNull(implementation).instructions.toList()
    val index = instructions.indices.single { index ->
        val instruction = instructions[index]
        val registers = instruction as? TwoRegisterInstruction
        instruction.opcode == Opcode.IGET_OBJECT && registers?.registerA == 14 && registers.registerB == 4 &&
            (instruction as? ReferenceInstruction)?.reference?.toString() == "Lftn;->f:Lggv;" &&
            instructions.getOrNull(index - 1)?.opcode == Opcode.MOVE_OBJECT
    }
    // Only the synchronous fallback. The native code rereads f after cleanup.
    // Clear p first: running the original callback reenters fkl.d() through O().
    addInstructionsWithLabels(index, """
        iget-object v0, v4, Lghl;->f:Lggv;
        if-eqz v0, :morphe_reset_fallback
        iget-object v3, v0, Lggv;->e:Lggw;
        iget-object v5, v3, Lggw;->p:Ljava/lang/Runnable;
        instance-of v6, v5, Les;
        if-eqz v6, :morphe_reset_fallback
        check-cast v5, Les;
        iget-object v6, v5, Les;->b:Ljava/lang/Object;
        if-ne v6, v4, :morphe_reset_fallback
        iget-object v6, v5, Les;->c:Ljava/lang/Object;
        if-ne v6, v0, :morphe_reset_fallback
        iput-object v2, v3, Lggw;->p:Ljava/lang/Runnable;
        invoke-virtual {v5}, Les;->run()V
    """.trimIndent(), ExternalLabel("morphe_reset_fallback", instructions[index]))
}

internal fun MutableMethod.clearRamblerResetHeaderWithoutShowing() {
    check(definingClass == "Lfjo;" && name == "J" && parameterTypes.isEmpty() && returnType == "V")
    val instructions = checkNotNull(implementation).instructions.toList()
    val index = instructions.indices.single {
        (instructions[it] as? ReferenceInstruction)?.reference?.toString() ==
            "Ljtu;->e(Ljava/lang/CharSequence;Lpmt;)V"
    }
    val call = instructions[index] as FiveRegisterInstruction
    val label = instructions.getOrNull(index - 2) as? ReferenceInstruction
    check(call.opcode == Opcode.INVOKE_VIRTUAL && call.registerCount == 3 &&
        (label?.reference as? StringReference)?.string == "" &&
        (label as? OneRegisterInstruction)?.registerA == call.registerD &&
        (instructions.getOrNull(index - 1) as? ReferenceInstruction)?.reference?.toString() ==
            "Lpyb;->a:Lqpi;" &&
        (instructions.getOrNull(index - 1) as? OneRegisterInstruction)?.registerA == call.registerE) {
        "Unexpected Rambler reset header call"
    }
    // e() acquires the voice header before setting text. Reset must only clear
    // the label; its existing b(true)/g(null) calls still release voice UI.
    replaceInstruction(index,
        "invoke-virtual {v${call.registerC}, v${call.registerD}}, Lkwv;->h(Ljava/lang/CharSequence;)V")
}
