package app.template.patches.keyflow

import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.template.patches.shared.Constants.COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode

/**
 * Keyflow 1.5.10 — f6olX Export Unlock (goto bypass).
 *
 * f6olX has six premium-gate sites, each shaped like:
 *
 *     invoke-virtual ..., Lv5YtyUtD;->yMQp6hm(...)Ljava/lang/Object;
 *     move-result-object vX
 *     if-ne vX, vSentinel, :cond_Z        ; premium path  (result != not-premium sentinel)
 *     goto :goto_Y                         ; failure path (returns not-premium)
 *
 * Replacing the failure `goto :goto_Y` with `nop` means:
 *   - if-ne true (Premium)   → jumps to :cond_Z
 *   - if-ne false (not Premium) → falls through to nop, then :cond_Z
 * Both paths reach Premium, so export works.
 */
val f6olXGotoFixPatch = patch(
    name = "Keyflow f6olX Goto Fix",
    description = "Replaces failure goto sites in f6olX with nop so all code paths reach Premium (Keyflow 1.5.10 export).",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        var patched = 0
        classDefForEach { classDef ->
            if (classDef.type != "Lf6olX;") return@classDefForEach

            val mutable = mutableClassDefBy(classDef)
            for (method in mutable.methods.toList()) {
                val impl = method.implementation ?: continue
                val instrs = impl.instructions
                val gotoIndices = mutableListOf<Int>()

                for (i in instrs.indices) {
                    val instr = instrs[i]
                    if (instr.opcode != Opcode.IF_NE) continue
                    if (i + 1 >= instrs.size) continue
                    val next = instrs[i + 1]
                    if (next.opcode != Opcode.GOTO && next.opcode != Opcode.GOTO_16) continue
                    gotoIndices.add(i + 1)
                }

                // Replace in reverse order so indices stay valid
                for (index in gotoIndices.reversed()) {
                    method.replaceInstruction(index, "nop")
                    patched++
                }
            }
        }

        if (patched == 0) {
            throw Error(
                "Keyflow f6olX Goto Fix: no if-ne→goto failure sites found in f6olX — " +
                "expected Keyflow 1.5.10 classes4.dex. Patched $patched site(s)."
            )
        }
    }
}
