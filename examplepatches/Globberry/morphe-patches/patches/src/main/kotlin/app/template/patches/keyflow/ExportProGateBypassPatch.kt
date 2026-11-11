package app.template.patches.keyflow

import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.template.patches.shared.Constants.COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.Opcode

/**
 * Keyflow 1.5.10 — Export Pro Gate Bypass.
 *
 * Multi-part bypass for the export Pro check:
 *
 * 1. kCg72Z4t.invokeSuspend: When LP0JcGi9.cdo7kOuyS() returns a Ly5XhdY0 result
 *    (project uses Pro features), kCg72Z4t sets the export state to PRO_REQUIRED.
 *    This patch replaces PRO_REQUIRED and ERROR state assignments with PLAYING so
 *    the export proceeds.
 *
 * 2. ZFJe6vx50.invoke: Bypasses the y88yfJ73C() check that aborts export when it
 *    returns false (goto :cond_8 → SMcDS7U()). Replaces if-eqz v2, :cond_8 with nop
 *    so execution always proceeds past the check.
 *
 * 3. LCWcMAXf.c3oEd: The pre-export function receives an error string parameter
 *    (p0) which it passes to CtCUGg.cdo7kOuyS(). This patch replaces the move-object
 *    of p0 into v4 with const/4 v4, 0x0 (null), so the error string is null and
 *    cdo7kOuyS(null) doesn't trigger an error state, letting the export proceed.
 */
@Suppress("unused")
val exportProGateBypassPatch = patch(
    name = "Keyflow Export Pro Gate Bypass",
    description = "Allows exporting projects that use Pro features by bypassing the Pro gate in the export pipeline.",
    default = true
) {
    compatibleWith(COMPATIBILITY)

    execute {
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // 1. kCg72Z4t.invokeSuspend — replace PRO_REQUIRED and ERROR state assignments
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LkCg72Z4t;") return@classDefForEach

            val mutable = mutableClassDefBy(classDef)

            mutable.methods.firstOrNull { m ->
                m.name == "invokeSuspend" &&
                    m.parameters.size == 1 &&
                    m.parameters[0].type == "Ljava/lang/Object;" &&
                    m.returnType == "Ljava/lang/Object;"
            }?.let { method ->
                val impl = method.implementation ?: return@let
                val instrs = impl.instructions

                for (i in instrs.indices) {
                    val instr = instrs[i]
                    when {
                        instr.opcode == Opcode.SGET_OBJECT &&
                            instr.toString().contains("La82eAByx;->RdpTsF:La82eAByx;") ->
                            method.replaceInstruction(
                                i,
                                "sget-object v0, La82eAByx;->kwEINn3:La82eAByx;"
                            )
                        instr.opcode == Opcode.SGET_OBJECT &&
                            instr.toString().contains("La82eAByx;->Jp4lVJ:La82eAByx;") ->
                            method.replaceInstruction(
                                i,
                                "sget-object v0, La82eAByx;->kwEINn3:La82eAByx;"
                            )
                    }
                }
            }
        }

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // 2. ZFJe6vx50.invoke — bypass y88yfJ73C() check that aborts export
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LZFJe6vx50;") return@classDefForEach

            val mutable = mutableClassDefBy(classDef)

            mutable.methods.firstOrNull { m ->
                m.name == "invoke" &&
                    m.parameters.size == 2 &&
                    m.returnType == "Ljava/lang/Object;"
            }?.let { method ->
                val impl = method.implementation ?: return@let
                val instrs = impl.instructions

                for (i in instrs.indices) {
                    val instr = instrs[i]
                    if (instr.opcode == Opcode.IF_EQZ &&
                        instr.toString().contains(":cond_8")) {
                        method.replaceInstruction(i, "nop")
                    }
                }
            }
        }

        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        // 3. LCWcMAXf.c3oEd — pass null error string instead of the actual error
        // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        classDefForEach { classDef: ClassDef ->
            if (classDef.type != "LCWcMAXf;") return@classDefForEach

            val mutable = mutableClassDefBy(classDef)

            mutable.methods.firstOrNull { m ->
                m.name == "c3oEd" &&
                    m.returnType == "V" &&
                    (m.accessFlags and AccessFlags.STATIC.value) != 0 &&
                    m.parameters.firstOrNull { it.type == "Ljava/lang/String;" } != null
            }?.let { method ->
                val impl = method.implementation ?: return@let
                val instrs = impl.instructions

                for (i in instrs.indices) {
                    val instr = instrs[i]
                    if (instr.opcode == Opcode.MOVE_OBJECT_FROM16 &&
                        instr.toString().contains("v4, p0")) {
                        method.replaceInstruction(i, "const/4 v4, 0x0")
                    }
                }
            }
        }
    }
}
