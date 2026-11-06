package app.revanced.patches.creaastuce

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.revanced.util.indexOfFirstInstructionOrThrow
import app.revanced.util.indexOfFirstInstructionReversedOrThrow
import app.revanced.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun ReferenceInstruction.asMethodRef() = reference as? MethodReference

@Suppress("unused")
val offlineValidationPatch = bytecodePatch(
    name = "Offline Validation Fix",
    description = "Forces offline ticket validations to always succeed and displays them in the ongoing tickets list even when offline."
) {
    compatibleWith("fr.cityway.android.creaastuce"("5.8.74.1938-release-prod"))

    execute {
        // 1. Bypass offline validation constraint checks
        val uw2Class = classDefByOrNull("Luw2;")
            ?: throw Exception("uw2 class not found")
        val mutableUw2 = mutableClassDefBy(uw2Class)
        mutableUw2.methods.find { it.name == "hasAlreadyOfflineValidation" }!!.returnEarly(false)
        mutableUw2.methods.find { it.name == "isTickerNumberValid" }!!.returnEarly(true)
        mutableUw2.methods.find { it.name == "isUserSolvent" }!!.returnEarly(true)

        // 2. Fix offline ongoing tab display (WA0.f)
        val wa0Class = classDefByOrNull("LWA0;")
            ?: throw Exception("WA0 class not found")
        val fMethod = mutableClassDefBy(wa0Class).methods.find { it.name == "f" }
            ?: throw Exception("f method not found")

        // Extract live registers from existing code — survives method body changes
        val firstEmptyIdx = fMethod.indexOfFirstInstructionOrThrow {
            opcode == Opcode.INVOKE_VIRTUAL &&
            (this as? ReferenceInstruction)?.asMethodRef()?.let {
                it.name == "isEmpty" && it.definingClass == "Ljava/util/ArrayList;"
            } == true
        }
        val listReg = (fMethod.getInstruction(firstEmptyIdx) as FiveRegisterInstruction).registerC

        val n4Idx = fMethod.indexOfFirstInstructionOrThrow {
            (this as? ReferenceInstruction)?.asMethodRef()?.let {
                it.name == "a" && it.definingClass == "LN4;"
            } == true
        }
        val n4Reg = (fMethod.getInstruction(n4Idx) as RegisterRangeInstruction).startRegister

        // 2a. Inject N4.a() before FIRST isEmpty → validation block attaches active product
        fMethod.addInstructions(
            firstEmptyIdx,
            "invoke-virtual/range {v$n4Reg .. v$n4Reg}, LN4;->a()Ljava/util/ArrayList;\n" +
            "move-result-object v${listReg - 1}\n" +
            "invoke-virtual {v$listReg, v${listReg - 1}}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z"
        )

        // 2b. cond_42 fallback: remove its isEmpty/move-result/if-nez, inject N4.a()
        val cond42EmptyIdx = fMethod.indexOfFirstInstructionReversedOrThrow {
            opcode == Opcode.INVOKE_VIRTUAL &&
            (this as? ReferenceInstruction)?.asMethodRef()?.let {
                it.name == "isEmpty" && it.definingClass == "Ljava/util/ArrayList;"
            } == true
        }
        val moveIdx = fMethod.indexOfFirstInstructionOrThrow(cond42EmptyIdx + 1) { opcode == Opcode.MOVE_RESULT }
        val jumpIdx = fMethod.indexOfFirstInstructionOrThrow(moveIdx + 1) { opcode == Opcode.IF_NEZ }
        // Remove highest index first
        fMethod.removeInstruction(jumpIdx)
        fMethod.removeInstruction(moveIdx)
        fMethod.removeInstruction(cond42EmptyIdx)
        fMethod.addInstructions(
            cond42EmptyIdx,
            "invoke-virtual/range {v$n4Reg .. v$n4Reg}, LN4;->a()Ljava/util/ArrayList;\n" +
            "move-result-object v${listReg - 1}\n" +
            "invoke-virtual {v$listReg, v${listReg - 1}}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z"
        )

        // 3. Fix validation expiry in Lw2.g()
        val lw2Class = classDefByOrNull("LLw2;")
            ?: throw Exception("Lw2 class not found")
        val gMethod = mutableClassDefBy(lw2Class).methods.find { it.name == "g" }
            ?: throw Exception("g method not found")

        // 3a. Override duration: insert const v6, 0x15180 (86400s = 24h) before calculateEndDate
        val calcIdx = gMethod.indexOfFirstInstructionOrThrow {
            (this as? ReferenceInstruction)?.asMethodRef()?.let {
                it.name == "calculateEndDate" &&
                it.definingClass == "Lfr/cityway/product/domain/infrastructure/date/DateTimeManager;"
            } == true
        }
        gMethod.addInstructions(calcIdx, "const v6, 0x15180")

        // 3b. Null offerEndAcceptationDate (v10 = p7 parameter) → skips getMinimum and PASS expiry
        val getMinIdx = gMethod.indexOfFirstInstructionOrThrow {
            (this as? ReferenceInstruction)?.asMethodRef()?.let {
                it.name == "getMinimum" &&
                it.definingClass == "Lfr/cityway/product/domain/infrastructure/date/DateTimeManager;"
            } == true
        }
        gMethod.addInstructions(getMinIdx - 1, "const/4 v10, 0x0")
    }
}
