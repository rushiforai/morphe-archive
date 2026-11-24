package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val DAILY_REWARDS = "Lcom/zong/customercare/view/ui/FragDailyRewards;"

// Direct-claim branch identified by Proxma's UnlockDailyRewardPatch.
// https://github.com/totsiaw/proxma-patches/blob/main/patches/src/main/kotlin/patches/myzong/UnlockDailyRewardPatch.kt
private val dailyRewardTap = Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(DAILY_REWARDS),
    custom = { method, _ ->
        val references = method.implementation?.instructions?.toList().orEmpty()
            .filterIsInstance<ReferenceInstruction>().map { it.reference }
        references.filterIsInstance<StringReference>().any { it.string == "1" } &&
            references.filterIsInstance<MethodReference>().any {
                it.definingClass == "Landroid/os/SystemClock;" && it.name == "elapsedRealtime"
            }
    },
)

val skipDailyRewardAdPatch = bytecodePatch(
    name = "Skip daily reward ad",
    description = "Use My Zong's existing direct-claim branch when tapping the daily reward bubble.",
    default = false,
) {
    category("Startup & rewards")
    compatibleWith(myZongCompatibility)

    execute {
        val method = dailyRewardTap.method
        val instructions = checkNotNull(method.implementation).instructions.toList()
        val comparisons = instructions.indices.filter { index ->
            val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            call?.name == "areEqual" && call.returnType == "Z" &&
                instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT &&
                instructions.getOrNull(index + 2)?.opcode == Opcode.IF_EQZ
        }
        check(comparisons.size == 1) { "Expected one daily reward ad decision" }
        val resultIndex = comparisons.single() + 1
        val result = (instructions[resultIndex] as OneRegisterInstruction).registerA
        val branch = instructions[resultIndex + 1] as OneRegisterInstruction
        check(result == branch.registerA) { "Daily reward branch does not test the comparison result" }
        method.addInstruction(resultIndex + 1, "const/16 v$result, 0x0")
    }
}
