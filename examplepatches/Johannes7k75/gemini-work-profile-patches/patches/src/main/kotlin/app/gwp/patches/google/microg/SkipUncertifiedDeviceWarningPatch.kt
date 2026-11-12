package app.gwp.patches.google.microg

import app.gwp.patches.shared.Constants.COMPATIBILITY_GOOGLE
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val UNCERTIFIED_ACTIVITY = "Lcom/google/android/gms/gmscompliance/ui/UncertifiedDeviceActivity;"

@Suppress("unused")
val skipUncertifiedDeviceWarningPatch = patch(
    name = "Skip uncertified device warning",
    description = "Skips the local \"device is not Play Protect certified\" screen that the bundled Google Play " +
        "services client shows with microG. Does not change any device or server certification state.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE)
    dependsOn(microgSupportPatch)

    execute {
        // 1. Compliance check: take the existing "feature disabled" path, which also restores components
        //    that a previous failed check disabled. Gate: Boolean.booleanValue() -> move-result vX -> if-nez vX.
        DeviceComplianceFeatureFingerprint.matchAll(1..1).single().method.let { method ->
            val ins = method.instructions.toList()
            val gates = ins.indices.filter { i ->
                i > 0 && i + 1 < ins.size && ins[i].opcode == Opcode.MOVE_RESULT &&
                    (ins[i - 1] as? ReferenceInstruction)?.reference.toString() == "Ljava/lang/Boolean;->booleanValue()Z" &&
                    ins[i + 1].opcode == Opcode.IF_NEZ &&
                    (ins[i] as OneRegisterInstruction).registerA == (ins[i + 1] as OneRegisterInstruction).registerA
            }
            val gate = gates.singleOrNull() ?: throw PatchException("Expected one compliance gate, found ${gates.size}")
            val register = (ins[gate] as OneRegisterInstruction).registerA
            if (register > 15) throw PatchException("Unexpected wide register v$register")
            // move-result (1 code unit) -> const/4 (1 code unit): offsets are kept.
            method.replaceInstruction(gate, "const/4 v$register, 0x0")
        }

        // 2. Do not launch UncertifiedDeviceActivity: turn "if (!(activity instanceof Uncertified)) { start; finish }"
        //    into an unconditional jump past the launch.
        UncertifiedDeviceRedirectFingerprint.matchAll(1..1).single().method.let { method ->
            val ins = method.instructions.toList()
            val candidates = ins.indices.filter { i ->
                i > 0 && ins[i].opcode == Opcode.IF_NEZ && ins[i - 1].opcode == Opcode.INSTANCE_OF &&
                    (ins[i - 1] as ReferenceInstruction).reference.toString() == UNCERTIFIED_ACTIVITY &&
                    (ins[i] as OneRegisterInstruction).registerA == (ins[i - 1] as OneRegisterInstruction).registerA
            }
            val index = candidates.singleOrNull() ?: throw PatchException("Expected one redirect branch, found ${candidates.size}")

            val addresses = ins.runningFold(0) { address, instruction -> address + instruction.codeUnits }
            val targetIndex = addresses.indexOf(addresses[index] + (ins[index] as OffsetInstruction).codeOffset)
            if (targetIndex <= index) throw PatchException("Unexpected redirect branch target")
            val skipped = ins.subList(index + 1, targetIndex).map { (it as? ReferenceInstruction)?.reference.toString() }
            if ("Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V" !in skipped ||
                "Landroid/app/Activity;->finish()V" !in skipped
            ) throw PatchException("Branch does not skip the warning launch")

            // if-nez and goto/16 are both 2 code units: no relocation of branches or try ranges.
            method.replaceInstruction(
                index,
                BuilderInstruction20t(Opcode.GOTO_16, method.implementation!!.newLabelForIndex(targetIndex)),
            )
        }
    }
}
