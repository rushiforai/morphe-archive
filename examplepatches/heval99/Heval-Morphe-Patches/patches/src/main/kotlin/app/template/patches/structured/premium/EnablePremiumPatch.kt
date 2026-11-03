package app.template.patches.structured.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_STRUCTURED
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Structured Pro is a RevenueCat entitlement. The app has one consumer: a static
 * (CustomerInfo)V-shaped mapper that asks `entitlements.active.keySet()` for "pro" and
 * "recurring_tasks" and stores both answers in the state object the UI reads.
 *
 * The patch forces the "pro" answer to true right after the Set.contains call. RevenueCat, the
 * offerings and the purchase screen are left alone; only the local entitlement answer is forced.
 *
 * Verified 2026-10-27 against 3.9.6 (versionCode 30533): see COMPATIBILITY_STRUCTURED.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Structured Pro.",
) {
    compatibleWith(COMPATIBILITY_STRUCTURED)

    execute {
        val mapper = StructuredEntitlementFingerprint.method
        val insns = mapper.implementation?.instructions?.toList()
            ?: throw PatchException("${mapper.definingClass}->${mapper.name} has no implementation")

        val proIndex = insns.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CONST_STRING &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == PRO
        }
        if (proIndex < 0) throw PatchException("${mapper.definingClass}->${mapper.name} has no \"$PRO\"")
        val call = insns.getOrNull(proIndex + 1)
        val callRef = (call as? ReferenceInstruction)?.reference as? MethodReference
        if (call?.opcode != Opcode.INVOKE_INTERFACE || callRef?.name != "contains" ||
            callRef.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/Object;")
        ) {
            throw PatchException("expected Set.contains after \"$PRO\", got ${call?.opcode} $callRef")
        }
        val move = insns.getOrNull(proIndex + 2)
        if (move?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("expected move-result after Set.contains, got ${move?.opcode}")
        }
        val register = (move as OneRegisterInstruction).registerA

        mapper.addInstructionsChecked(proIndex + 3, "const/4 v$register, 0x1")
    }
}
