package app.morphe.patches.googlephotos.misc.bento

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.googlephotos.misc.extension.sharedExtensionPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

val bentoBadgePatch = bytecodePatch(
    name = "Google One Bento Badge",
    description = "Restores the genuine Google One subscription badge in the Google Photos Bento account menu.",
    default = true,
) {
    compatibleWith(AppCompatibilities.GOOGLE_PHOTOS)
    dependsOn(sharedExtensionPatch)

    execute {
        classDefForEach { classDef ->
            val targetMethod = classDef.methods.find { method ->
                method.isBentoModelBuilder()
            } ?: return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            val mutableMethod = mutableClass.findMutableMethodOf(targetMethod)
            val instructions = targetMethod.implementation?.instructions?.toList() ?: return@classDefForEach

            // 1. Locate fallback site: const/16 vTarget, 0 followed immediately by if-eqz vTarget, ...
            val fallbackIndex = instructions.indexOfFirst { inst ->
                inst.opcode == Opcode.CONST_16 &&
                    (inst as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
                    instructions.getOrNull(instructions.indexOf(inst) + 1)?.let { nextInst ->
                        nextInst.opcode == Opcode.IF_EQZ &&
                            (nextInst as? OneRegisterInstruction)?.registerA == (inst as? OneRegisterInstruction)?.registerA
                    } == true
            }

            if (fallbackIndex == -1) return@classDefForEach

            val targetReg = (instructions[fallbackIndex] as OneRegisterInstruction).registerA

            // 2. Locate Integer.valueOf(I) instruction inside the native builder preceding fallbackIndex
            val valueOfIndex = (fallbackIndex - 1 downTo 0).firstOrNull { i ->
                val inst = instructions[i]
                inst.opcode == Opcode.INVOKE_STATIC &&
                    (inst as? ReferenceInstruction)?.reference?.toString()?.contains("Integer;->valueOf(I)Ljava/lang/Integer;") == true
            } ?: return@classDefForEach

            val intReg = (instructions[valueOfIndex] as? FiveRegisterInstruction)?.registerC ?: return@classDefForEach

            // 3. Locate String constructor invocation inside the builder: <init>(Ljava/lang/String;)V
            val stringInitIndex = (valueOfIndex - 1 downTo 0).firstOrNull { i ->
                val inst = instructions[i]
                inst.opcode == Opcode.INVOKE_DIRECT &&
                    (inst as? ReferenceInstruction)?.reference?.toString()?.contains("<init>(Ljava/lang/String;)V") == true
            } ?: return@classDefForEach

            val stringReg = (instructions[stringInitIndex] as? FiveRegisterInstruction)?.registerD ?: return@classDefForEach

            // 4. Locate entry point of native decoration builder:
            // The earliest NEW_INSTANCE instruction preceding the string constructor
            var entryIndex = -1
            for (i in stringInitIndex - 1 downTo 0) {
                if (instructions[i].opcode == Opcode.NEW_INSTANCE) {
                    entryIndex = i
                } else if (entryIndex != -1) {
                    break
                }
            }

            if (entryIndex == -1) return@classDefForEach

            // 5. Locate account register:
            // Walking backward from entryIndex, find the preceding IGET_BOOLEAN reading isG1Account.
            var accountReg = 14 // default fallback
            for (i in entryIndex - 1 downTo 0) {
                if (instructions[i].opcode == Opcode.IGET_BOOLEAN) {
                    accountReg = (instructions[i] as TwoRegisterInstruction).registerB
                    break
                }
            }

            // 6. Hook fallback site:
            // Intercepts the jump when In-App Reach returns API_DISABLED / empty card.
            // Evaluates active account entitlement and triggers native builder if subscribed.
            mutableMethod.addInstructionsAtControlFlowLabel(
                fallbackIndex,
                """
                invoke-static { v$accountReg }, Lapp/morphe/extension/shared/patches/BentoDecorationPatch;->getBadgeText(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v$stringReg
                if-eqz v$stringReg, :no_badge
                const/4 v$intReg, 1
                goto :build_badge
                :no_badge
                const/16 v$targetReg, 0
                """.trimIndent(),
                ExternalLabel("build_badge", mutableMethod.getInstruction(entryIndex)),
            )
        }
    }
}

private fun Method.isBentoModelBuilder(): Boolean {
    val impl = this.implementation ?: return false
    return impl.instructions.any { inst ->
        inst.opcode == Opcode.CONST && (inst as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f1402cc
    }
}
