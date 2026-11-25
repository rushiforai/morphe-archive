package app.stayfree.patches.sync

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val LOCAL_SYNC = "Lapp/template/extension/stayfree/LocalSync;"

@Suppress("unused")
val qrPairingProbePatch = bytecodePatch(
    name = "Debug QR pairing path",
    description = "Diagnostic only. Records why StayFree's QR pairing does or does not issue its " +
        "pairing request — the two guards on the scanned code, and the device-group status the " +
        "pairing coroutine checks before it reaches the network — to the same log as \"Local " +
        "device sync\". Leave this off unless you are debugging a pairing failure.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    extendWith("extensions/extension.mpe")

    execute {
        // The pairing lambda reads the code StayFree stashed from the deep link, then checks a
        // captured "this is the QR pairing sheet" boolean:
        //
        //     sget-object vCode, Lg71;->Z:Ljava/lang/String;
        //     if-eqz vCode, :skip
        //     if-eqz pFlag, :skip
        //     …launch the pairing coroutine…
        //     sget-object …, USER_PAIRED_CODE_BY_QR
        //
        // Both conditions failing look identical downstream — nothing happens — but mean opposite
        // things: a null code is a lost stash (the activity was recreated out from under it),
        // while a false flag is the wrong sheet composing. Log both at the guard, so the next
        // pairing attempt distinguishes them, and a log with no PROBE line at all says the lambda
        // never ran.
        val match = QrPairingLaunchFingerprint.matchOrNull()
            ?: throw PatchException("QR pairing launch not found")
        val method = match.method
        val instructions = method.implementation!!.instructions.toList()
        val enumIndex = match.instructionMatches.first().index

        // Walk back to the two guards. The code is loaded by the `sget-object` feeding the first,
        // which is the field the second branch is nested inside.
        val secondIf = (enumIndex - 1 downTo 0).firstOrNull {
            instructions[it].opcode == Opcode.IF_EQZ
        } ?: throw PatchException("QR pairing flag guard not found")
        val firstIf = (secondIf - 1 downTo 0).firstOrNull {
            instructions[it].opcode == Opcode.IF_EQZ
        } ?: throw PatchException("QR pairing code guard not found")

        val codeLoad = instructions[firstIf - 1]
        if (codeLoad.opcode != Opcode.SGET_OBJECT) {
            throw PatchException("Unexpected QR pairing guard shape in ${method.definingClass}")
        }
        val stashedField = (codeLoad as ReferenceInstruction).reference as FieldReference
        if (stashedField.type != "Ljava/lang/String;") {
            throw PatchException("Unexpected stashed code type ${stashedField.type}")
        }

        val codeRegister = (instructions[firstIf] as OneRegisterInstruction).registerA
        val flagRegister = (instructions[secondIf] as OneRegisterInstruction).registerA

        // Pass only the two registers that are already live. The probe takes no tag argument
        // precisely so nothing has to be materialised into a scratch register: this lambda is
        // register-tight, and a patch cannot widen a method's frame, so writing a tag string
        // anywhere would clobber a value the guards are about to test.
        if (codeRegister > 15 || flagRegister > 15) {
            throw PatchException("QR pairing guard registers out of range for invoke-static")
        }

        // Insert ahead of the first guard, where both registers are live and nothing has branched
        // yet, so the probe sees the same values the guards are about to test.
        method.addInstructions(
            firstIf,
            "invoke-static {v$codeRegister, v$flagRegister}, " +
                "$LOCAL_SYNC->probePairingGuard(Ljava/lang/String;Z)V",
        )

        // Second checkpoint: the status gate the pairing coroutine hits immediately after launch.
        //
        //     if (statusFlow.value == NETWORK_CONNECTION_LOST) return
        //
        // The guards above are known to pass and no request follows, so this read — a field
        // access with no suspension, which is why the failure is instant — is the last unobserved
        // branch in between. Log the value the comparison is about to use.
        // Both pairing paths — QR and manual code entry — carry the same gate, and instrumenting
        // both costs nothing: whichever one the user exercises, the log gets the value.
        val gates = PairingStatusGateFingerprint.matchAll()
        if (gates.isEmpty()) throw PatchException("Pairing status gate not found")

        gates.forEach { gate ->
            val gateMethod = gate.method
            val gateInstructions = gateMethod.implementation!!.instructions.toList()
            val lostIndex = gate.instructionMatches.first().index

            // The value under test is produced by the `move-result-object` just before the
            // constant is loaded. Taking the register from there rather than from the `if-ne`
            // keeps this correct whichever operand order R8 emits the comparison in.
            val moveResult = (lostIndex - 1 downTo maxOf(0, lostIndex - 4)).firstOrNull {
                gateInstructions[it].opcode == Opcode.MOVE_RESULT_OBJECT
            } ?: throw PatchException("Pairing status value not found in ${gateMethod.definingClass}")

            val statusRegister = (gateInstructions[moveResult] as OneRegisterInstruction).registerA
            if (statusRegister > 15) {
                throw PatchException("Pairing status register out of range for invoke-static")
            }

            // Insert after the `move-result-object`, where the value is live and nothing has
            // branched yet.
            gateMethod.addInstructions(
                moveResult + 1,
                "invoke-static {v$statusRegister}, " +
                    "$LOCAL_SYNC->probePairingStatus(Ljava/lang/Object;)V",
            )
        }
    }
}
