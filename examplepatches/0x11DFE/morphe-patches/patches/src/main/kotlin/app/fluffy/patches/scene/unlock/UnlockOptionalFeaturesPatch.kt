package app.fluffy.patches.scene.unlock

import app.fluffy.patches.shared.Constants.COMPATIBILITY_SCENE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * "Is FAS available" (tf0.h on 2026.11 PR2): the FAS (frame-aware scheduling,
 * in-game FPS control) entry of the Optional features dialog only appears for
 * cloud "lp"-branch subscribers with an online profile that allows it. The
 * three pref literals pin the method across builds.
 */
object FasSupportFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Z",
    strings = listOf("CLOUD_PROFILE_BRANCH", "lp", "SOURCE_SCENE_ONLINE"),
)

/**
 * The Optional features dialog builder (qp0.onClick on 2026.11 PR2, dn0 on
 * 2026.10 Alpha13). Beside wiring every entry, it computes the gates this
 * patch neutralizes:
 * - right before the "SOURCE_SCENE_ONLINE" const it calls the refresh-rate
 *   support check (instance ()->Z, ne1.f / lb1.h): shown only when the display
 *   exposes a 60Hz mode next to a >60Hz mode - Samsung OneUI panels fail that
 *   probe while supporting rate control fine through the daemon.
 * - the boolean stored from the online-source comparison right after the const
 *   gates the "CPU limiters" entry a few dozen instructions later.
 */
object OptionalFeaturesDialogFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("SOURCE_SCENE_ONLINE", "CLOUD_PROFILE_BRANCH"),
)

@Suppress("unused")
val unlockOptionalFeaturesPatch = patch(
    name = "Unlock optional features",
    description = "Shows the gated Optional features entries: Refresh rate, FAS in games and " +
        "CPU limiters. The gates are cloud-profile and display-API checks, not device " +
        "limits, so the features work locally. Bypass power supply stays hidden without a " +
        "supported charging node.",) {
    compatibleWith(COMPATIBILITY_SCENE)

    execute {
        FasSupportFingerprint.method.returnEarly(true)

        val dialog = OptionalFeaturesDialogFingerprint.method
        val impl = dialog.implementation
            ?: throw PatchException("optional features dialog has no implementation")
        val insns = impl.instructions.toList()

        val constIdx = insns.indexOfFirst { insn ->
            insn.opcode == Opcode.CONST_STRING && insn is ReferenceInstruction &&
                (insn.reference as? StringReference)?.string == "SOURCE_SCENE_ONLINE"
        }
        if (constIdx < 0) {
            throw PatchException("SOURCE_SCENE_ONLINE anchor not found in the dialog builder")
        }

        // The ()->Z invoke just before the anchor is the refresh-rate support
        // check; replace its body with `return true`.
        var rateCheck: MutableMethod? = null
        for (i in constIdx - 1 downTo maxOf(0, constIdx - 4)) {
            val insn = insns[i]
            if (insn.opcode == Opcode.INVOKE_VIRTUAL && insn is Instruction35c) {
                val ref = (insn as ReferenceInstruction).reference as? MethodReference ?: continue
                if (ref.returnType == "Z" && ref.parameterTypes.isEmpty()) {
                    rateCheck = mutableClassDefBy(ref.definingClass).methods.first {
                        it.name == ref.name && it.returnType == "Z" && it.parameters.isEmpty()
                    }
                    break
                }
            }
        }
        rateCheck?.returnEarly(true)
            ?: throw PatchException("refresh-rate support check not found before the anchor")

        // The boolean from the online-source comparison gates the CPU-limiter
        // entry later in the method. Track its register and replace the branch
        // that reads it with a nop; abort if the register is rewritten first.
        val moveInsn = insns.getOrNull(constIdx + 2)
        if (moveInsn?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("online-source comparison result not found after the anchor")
        }
        val gateReg = (moveInsn as OneRegisterInstruction).registerA
        val regWriters = setOf(
            Opcode.MOVE, Opcode.MOVE_OBJECT, Opcode.MOVE_WIDE,
            Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT_WIDE,
            Opcode.CONST, Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST_HIGH16,
            Opcode.CONST_WIDE, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_HIGH16,
            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO,
            Opcode.NEW_INSTANCE, Opcode.CHECK_CAST,
            Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_WIDE, Opcode.IGET_BOOLEAN,
            Opcode.IGET_BYTE, Opcode.IGET_CHAR, Opcode.IGET_SHORT,
            Opcode.SGET, Opcode.SGET_OBJECT, Opcode.SGET_WIDE, Opcode.SGET_BOOLEAN,
            Opcode.SGET_BYTE, Opcode.SGET_CHAR, Opcode.SGET_SHORT,
        )
        for (i in constIdx + 3 until insns.size) {
            val insn = insns[i]
            val reg = (insn as? OneRegisterInstruction)?.registerA
            if (reg == gateReg) {
                if (insn.opcode == Opcode.IF_EQZ) {
                    impl.replaceInstruction(i, BuilderInstruction10x(Opcode.NOP))
                    println("Scene optional features: refresh-rate, FAS and CPU-limiter gates neutralized")
                    return@execute
                }
                if (insn.opcode in regWriters) {
                    throw PatchException(
                        "gate register rewritten before its branch - dialog layout changed",
                    )
                }
            }
        }
        throw PatchException("CPU-limiter visibility branch not found")
    }
}
