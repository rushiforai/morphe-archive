package org.ungoogled.patches.maps.account

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS

internal val hideSectionTitlePatch = bytecodePatch(
    description = "Removes the \"More from this app\" label from the account sheet.",
) {
    compatibleWith(COMPATIBILITY_MAPS)

    execute {
        // Several account-sheet layouts bind the same section-title model through
        // different binder methods (modern list adapter, legacy adapter, and the
        // empty-list variant). Hide the title after setText in each of them.
        var patched = 0
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lorg/ungoogled/")) return@classDefForEach
            for (method in classDef.methods) {
                if (method.returnType != "V" ||
                    method.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
                ) continue
                val instructions = method.implementation?.instructions ?: continue
                val bindsTitle = instructions.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                        ref.definingClass == "Lbsgx;" && ref.name == "D" && ref.returnType == "Ljava/lang/String;"
                    } == true
                }
                if (!bindsTitle) continue
                val mutable = mutableClassDefBy(classDef.type).methods.single {
                    it.name == method.name && it.returnType == method.returnType && it.parameterTypes == method.parameterTypes
                }
                var changed = false
                val original = mutable.implementation!!.instructions.toList()
                for (index in original.indices.reversed()) {
                    val setText = original[index] as? ReferenceInstruction ?: continue
                    val ref = setText.reference as? MethodReference ?: continue
                    if (ref.definingClass != "Landroid/widget/TextView;" || ref.name != "setText") continue
                    val call = setText as? FiveRegisterInstruction ?: continue
                    val textView = call.registerC
                    val scratch = call.registerD
                    mutable.addInstructions(
                        index + 1,
                        """
                            const/16 v$scratch, 0x8
                            invoke-virtual { v$textView, v$scratch }, Landroid/view/View;->setVisibility(I)V
                        """,
                    )
                    changed = true
                }
                if (changed) patched++
            }
        }
        if (patched == 0) throw PatchException("account sheet section-title binder not found")
    }
}
