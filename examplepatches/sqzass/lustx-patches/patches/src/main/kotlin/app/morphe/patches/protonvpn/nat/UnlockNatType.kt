/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 */

package app.morphe.patches.protonvpn.nat

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val J3 = "Lil/j3;"
private const val LOCAL_USER_SETTINGS = "Lcom/protonvpn/android/settings/data/LocalUserSettings;"
private const val N2_INIT = "Lil/n2;-><init>"

private object NatTypeGateFingerprint : Fingerprint(
    definingClass = J3,
    name = "invokeSuspend",
    filters = listOf(
        methodCall(
            definingClass = LOCAL_USER_SETTINGS,
            name = "getRandomizedNat",
        ),
    ),
)

internal fun unlockNatType() {
    val match = NatTypeGateFingerprint.match()
    val method = match.method
    val instructions = method.instructions.toList()
    val gate = match.instructionMatches.first().index

    // Walk forward from getRandomizedNat to the first n2 ctor.
    var ctorIndex = -1
    for (i in gate until instructions.size) {
        val ins = instructions[i]
        if (ins.opcode != Opcode.INVOKE_DIRECT_RANGE) continue
        val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        if ("${ref.definingClass}->${ref.name}" == N2_INIT) {
            ctorIndex = i
            break
        }
    }
    if (ctorIndex < 0) {
        throw PatchException("ProtonVPN: no Lil/n2;-><init> after the NAT gate in $J3")
    }

    // n2 signature: (this, Serializable, Z, I, Lil/d;, Integer, I) = 7 regs.
    // Z (restricted) param is at offset 2 from startRegister.
    val ctor = instructions[ctorIndex] as RegisterRangeInstruction
    val zReg = ctor.startRegister + 2

    // Walk backwards from the ctor to find the last write to zReg.
    var assignIndex = -1
    for (i in (ctorIndex - 1) downTo gate) {
        val ins = instructions[i]
        if (ins is OneRegisterInstruction && ins.registerA == zReg) {
            assignIndex = i
            break
        }
    }
    if (assignIndex < 0) {
        throw PatchException("ProtonVPN: no assignment to v$zReg before the NAT n2 ctor in $J3")
    }

    // Verify it's the expected move/from16 (restricted flag copy).
    val assign = instructions[assignIndex]
    if (assign.opcode != Opcode.MOVE_FROM16) {
        throw PatchException(
            "ProtonVPN: expected MOVE_FROM16 at $assignIndex for v$zReg, found ${assign.opcode}",
        )
    }

    // v26 is dead after the ctor — replace in-place, no stash needed.
    method.replaceInstruction(assignIndex, "const/16 v$zReg, 0x0")

    println("[protonvpn] nat: unlocked (ctor@$ctorIndex, zReg=v$zReg, replaced@$assignIndex)")
}
