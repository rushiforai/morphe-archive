/*
 * Copyright 2026 Pengusto.
 * See the included NOTICE file for GPLv3 section 7 terms.
 */
package io.github.pengusto.patches.infinity

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// 1.4.123 stops Infinity's subscription launcher, but leaves the wrapper at NO_SUBSCRIPTION (4).
// LoginActivity, BaseActivity and the account picker independently check this same state.
// Only use the local ready state for the supported custom-OAuth build; no purchase is created.
internal fun BytecodePatchContext.disableCustomClientBillingState() {
    if (packageMetadata.packageName != "ml.docilealligator.infinityforreddit.plus" ||
        packageMetadata.versionName != "8.3.4") return

    val login = classDefBy("Lml/docilealligator/infinityforreddit/activities/LoginActivity;")
    val onCreate = login.methods.single { it.name == "onCreate" }
    val stateReads = onCreate.implementation!!.instructions.filter { it.opcode == Opcode.IGET_BYTE }
        .map { (it as ReferenceInstruction).reference as FieldReference }.toList()
    check(stateReads.size == 2 && stateReads.distinctBy { it.toString() }.size == 1) {
        "Infinity 8.3.4 billing state reads changed"
    }
    val state = stateReads.first()
    val wrapper = mutableClassDefBy(state.definingClass)
    check(wrapper.instanceFields.count { it.type == "B" } == 1)

    fun ReferenceInstruction.writesState() =
        (reference as? FieldReference)?.toString() == state.toString()

    val constructor = wrapper.methods.single { it.name == "<init>" && it.parameters.isEmpty() }
    val ctorInstructions = constructor.implementation!!.instructions.toList()
    val write = ctorInstructions.single { it.opcode == Opcode.IPUT_BYTE &&
        (it as ReferenceInstruction).writesState() } as TwoRegisterInstruction
    val constantIndex = ctorInstructions.indexOfFirst {
        it.opcode == Opcode.CONST_4 && (it as OneRegisterInstruction).registerA == write.registerA &&
            (it as NarrowLiteralInstruction).narrowLiteral == 4
    }
    check(constantIndex >= 0) { "Infinity billing initial state changed" }

    val setter = wrapper.methods.single { method ->
        method.name != "<init>" && method.returnType == "V" &&
            method.parameterTypes.toList() == listOf("I") &&
            method.implementation?.instructions?.count { it.opcode == Opcode.IPUT_BYTE &&
                (it as ReferenceInstruction).writesState() } == 1
    }
    check(setter.implementation!!.instructions.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ljava/lang/Integer;" && ref.name == "valueOf"
    }) { "Infinity billing state observer update changed" }

    constructor.replaceInstruction(constantIndex, "const/4 v${write.registerA}, 0x1")
    // Keep the existing LiveData update and byte-field write synchronized, including later callbacks.
    setter.addInstruction(0, "const/4 p1, 0x1")
}
