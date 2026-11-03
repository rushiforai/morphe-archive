package app.template.patches.mango.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MANGO
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Mango sells Pro as a Play subscription ("mango_pro_yearly") plus a lifetime in-app product
 * ("mango_pro_lifetime"). The billing client keeps the state in a Play-Billing-backed enum
 * (REAL / FREE / EXPIRED / YEARLY / YEARLY_CANCELED / LIFETIME) and seeds a StateFlow with
 * "state is YEARLY, YEARLY_CANCELED or LIFETIME" in its constructor; every Pro gate reads that
 * flow. The patch loads 1 into that seed, so the app starts Pro and stays Pro (the only other
 * writer sets it true on a real purchase).
 *
 * Play Billing, the purchase screen and the cached "billing_cached_is_pro" preference are
 * untouched.
 *
 * Verified 2026-10-27 against 1.64 (versionCode 64): see COMPATIBILITY_MANGO.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Mango Pro.",
) {
    compatibleWith(COMPATIBILITY_MANGO)

    execute {
        val client = MangoBillingClientFingerprint.classDef
        val constructor = client.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.size == 2 && it.implementation != null
        } ?: throw PatchException("${client.type} has no two-argument constructor")
        val insns = constructor.implementation!!.instructions.toList()

        val contains = insns.withIndex().filter { (_, instruction) ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_INTERFACE && call?.name == "contains" &&
                call.returnType == "Z"
        }
        val (index, _) = contains.singleOrNull()
            ?: throw PatchException("${client.type}.<init> has ${contains.size} Set.contains calls")

        val move = insns.getOrNull(index + 1)
        if (move?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("expected move-result after Set.contains, got ${move?.opcode}")
        }
        constructor.addInstructionsChecked(
            index + 2,
            "const/4 v${(move as OneRegisterInstruction).registerA}, 0x1",
        )
    }
}
