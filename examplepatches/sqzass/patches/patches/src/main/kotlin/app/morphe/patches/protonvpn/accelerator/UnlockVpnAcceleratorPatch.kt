/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Recon-verified against Proton VPN 5.21.57.0 (Play, installed build):
 *   Lcom/protonvpn/android/settings/data/LocalUserSettings;->getVpnAccelerator()Z
 *   -> Lil/j3;->invokeSuspend (.locals 45)
 *   gate: move-result vS ; if-eqz vS ; if-nez vF   (vS = setting, vF = restriction flag)
 *   row:  invoke-direct/range, Lil/n2;-><init>(...)   — vF is its Z (restricted) arg
 *   vF is live after the row (saved to v13 for the Lil/k2; split-tunneling ctor),
 *   so it is stashed in an unused local and restored after the n2 ctor.
 */

package app.morphe.patches.protonvpn.accelerator

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val J3 = "Lil/j3;"
private const val LOCAL_USER_SETTINGS = "Lcom/protonvpn/android/settings/data/LocalUserSettings;"
private const val N2_INIT = "Lil/n2;-><init>"

private object VpnAcceleratorGateFingerprint : Fingerprint(
    definingClass = J3,
    name = "invokeSuspend",
    filters = listOf(
        methodCall(
            definingClass = LOCAL_USER_SETTINGS,
            name = "getVpnAccelerator",
        ),
    ),
)

internal fun unlockVpnAccelerator() {
    val match = VpnAcceleratorGateFingerprint.match()
    val method = match.method
    val instructions = method.instructions.toList()
    val gate = match.instructionMatches.first().index

    val state = instructions[gate + 1] as OneRegisterInstruction
    val ifEqz = instructions[gate + 2]
    val ifNez = instructions[gate + 3] as OneRegisterInstruction
    val valid = state.opcode == Opcode.MOVE_RESULT &&
        ifEqz.opcode == Opcode.IF_EQZ &&
        ifNez.opcode == Opcode.IF_NEZ &&
        state.registerA == (ifEqz as OneRegisterInstruction).registerA
    if (!valid) {
        throw PatchException("ProtonVPN: VPN Accelerator gate pattern drifted in $J3")
    }
    val flag = ifNez.registerA

    var ctorIndex = -1
    for (i in gate until instructions.size) {
        val ins = instructions[i]
        if (ins.opcode != Opcode.INVOKE_DIRECT_RANGE) continue
        val ref = ins.getReference<MethodReference>() ?: continue
        if ("${ref.definingClass}->${ref.name}" == N2_INIT) {
            ctorIndex = i
            break
        }
    }
    if (ctorIndex < 0) {
        throw PatchException("ProtonVPN: no Lil/n2;-><init> after the accelerator gate in $J3")
    }

    // v<flag> is live past the row, so stash it in a local that is untouched across
    // the gate..ctor window. .locals 45 -> v0..v44; scan every register-bearing insn.
    val window = instructions.subList(gate, ctorIndex + 1)
    val stash = ((flag + 1)..44).first { candidate ->
        window.none { ins -> usesRegister(ins, candidate) }
    }

    method.addInstruction(ctorIndex + 1, "move/from16 v$flag, v$stash")
    method.addInstruction(gate, "const/16 v$flag, 0x0")
    method.addInstruction(gate, "move/from16 v$stash, v$flag")

    println("[protonvpn] accelerator: unlocked (gate@$gate, flag=v$flag, stash=v$stash)")
}

private fun usesRegister(ins: Instruction, reg: Int): Boolean = when (ins) {
    is OneRegisterInstruction -> ins.registerA == reg
    is TwoRegisterInstruction -> ins.registerA == reg || ins.registerB == reg
    is FiveRegisterInstruction -> reg in listOf(
        ins.registerC,
        ins.registerD,
        ins.registerE,
        ins.registerF,
        ins.registerG,
    ).take(ins.registerCount)
    is RegisterRangeInstruction ->
        ins.registerCount > 0 &&
            reg in ins.startRegister until (ins.startRegister + ins.registerCount)
    else -> false
}
