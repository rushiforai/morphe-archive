package app.gwp.patches.google.workprofile

import app.gwp.patches.google.microg.microgSupportPatch
import app.gwp.patches.shared.Constants.COMPATIBILITY_GOOGLE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

private val logger = Logger.getLogger("AllowWorkProfilePatch")

@Suppress("unused")
val allowWorkProfilePatch = patch(
    name = "Allow work profile",
    description = "Lets Gemini run in a work profile (Shelter, Island, Secure Folder) instead of " +
        "asking to use the personal profile (errors 19 and 900009) or opening the web app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE)
    dependsOn(microgSupportPatch)

    execute {
        // 1. Central managed-profile check reports "not a managed profile" (error 900009 path).
        ManagedProfileCheckFingerprint.matchAll(1..1).single().method.returnEarly(false)

        // 2. Gemini eligibility: force the existing "work profile allowed" flag to true (error 19 path).
        RobinEligibilityFingerprint.matchAll(1..1).single().let { match ->
            val fieldRead = match.instructionMatches[0]
            val branch = match.instructionMatches[1]
            val register = fieldRead.getInstruction<OneRegisterInstruction>().registerA
            if (branch.getInstruction<OneRegisterInstruction>().registerA != register) {
                throw PatchException("Work profile flag is not the tested register")
            }
            // const/16 has the same size as iget-boolean (2 code units): offsets and branches are kept.
            match.method.replaceInstruction(fieldRead.index, "const/16 v$register, 0x1")
            logger.info("Forced ${fieldRead.fieldReference} to true")
        }

        // 3. Do not redirect work-profile users to the web app: neutralize the closest conditional
        //    branch before the "Trampolining to web app" log (if-eqz -> never taken as "work profile").
        WorkProfileWebTrampolineFingerprint.matchAll(1..1).single().let { match ->
            val method = match.method
            val instructions = method.instructions.toList()
            val logIndex = instructions.indexOfFirst {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == WEB_TRAMPOLINE_LOG
            }
            val branchIndex = (logIndex downTo maxOf(0, logIndex - 60)).firstOrNull {
                instructions[it].opcode == Opcode.IF_EQZ || instructions[it].opcode == Opcode.IF_NEZ
            } ?: throw PatchException("No branch before the web trampoline")
            val branch = instructions[branchIndex]
            val register = (branch as OneRegisterInstruction).registerA
            if (register > 15) throw PatchException("Unexpected wide register v$register")
            // if-eqz: register = 0 jumps past the redirect; if-nez: register = 1 does the same.
            val value = if (branch.opcode == Opcode.IF_EQZ) 0 else 1
            method.addInstructions(branchIndex, "const/4 v$register, 0x$value")
            logger.info("Skipped web trampoline (${branch.opcode} v$register)")
        }
    }
}
