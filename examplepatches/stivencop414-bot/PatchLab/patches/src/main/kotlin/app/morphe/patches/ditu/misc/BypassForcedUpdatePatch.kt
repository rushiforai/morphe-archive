package app.morphe.patches.ditu.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object UpdateCheckFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(name = "getForceUpdateVersion"),
        methodCall(name = "getSoftUpdateVersion"),
        methodCall(definingClass = "Lcom/caracol/streaming/common/e;", name = "isUpdateAvailable"),
    ),
)

@Suppress("unused")
val bypassForcedUpdatePatch = patch(
    name = "Bypass forced update",
    description = "Disables the client forced-update decision while retaining optional update checks. Server-side version requirements can still apply.",
    default = true,
) {
    category("Misc")
    compatibleWith(*AppCompatibilities.ditu())
    execute {
        val matches = UpdateCheckFingerprint.matchAll().toList()
        if (matches.size != 1) throw PatchException("Expected exactly one update decision method; found ${matches.size}")
        val method = matches.single().method
        val insns = method.instructions.toList()
        val force = insns.indexOfFirst { it.getReference<MethodReference>()?.name == "getForceUpdateVersion" }
        val soft = insns.indexOfFirst { it.getReference<MethodReference>()?.name == "getSoftUpdateVersion" }
        val checks = insns.indices.filter {
            val ref = insns[it].getReference<MethodReference>()
            ref?.definingClass == "Lcom/caracol/streaming/common/e;" && ref.name == "isUpdateAvailable"
        }
        if (checks.size != 2 || force < 0 || soft <= force || checks[0] !in (force + 1) until soft || checks[1] <= soft) {
            throw PatchException("Unexpected forced/optional update decision layout in ${method.definingClass}->${method.name}")
        }
        val index = checks.first() + 1
        val result = insns.getOrNull(index) as? OneRegisterInstruction
        if (result == null || insns[index].opcode != Opcode.MOVE_RESULT || result.registerA > 15) {
            throw PatchException("Unexpected forced-update result register in ${method.definingClass}->${method.name}")
        }
        method.replaceInstruction(index, BuilderInstruction11n(Opcode.CONST_4, result.registerA, 0))
    }
}
