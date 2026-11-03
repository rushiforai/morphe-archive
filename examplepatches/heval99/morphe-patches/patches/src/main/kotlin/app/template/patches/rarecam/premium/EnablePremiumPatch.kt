package app.template.patches.rarecam.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_RARECAM
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * RareCam Pro is a RevenueCat entitlement ("rarecam_pro"). The app has a single consumer: a static
 * (CustomerInfo)V that looks the entitlement up, asks `isActive()`, and stores the boolean into a
 * Compose MutableState that every Pro gate reads.
 *
 * The patch loads 1 into that boolean at the point both branches of the check merge, just before
 * the state is written. RevenueCat, the offerings, the purchase screen and the entitlement lookup
 * are left alone; only the local "is this user Pro" answer is forced.
 *
 * Verified 2026-10-27 against 1.0.90 (versionCode 90): see COMPATIBILITY_RARECAM.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks RareCam Pro.",
) {
    compatibleWith(COMPATIBILITY_RARECAM)

    execute {
        val gate = RareCamEntitlementFingerprint.method
        val implementation = gate.implementation
            ?: throw PatchException("${gate.definingClass}->${gate.name} has no implementation")
        val insns = implementation.instructions.toList()

        // The value that gets boxed and stored: the argument of Boolean.valueOf(Z).
        val valueOfIndex = insns.indexOfFirst {
            val call = (it as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == "Ljava/lang/Boolean;" && call.name == "valueOf" &&
                call.parameterTypes.map(CharSequence::toString) == listOf("Z")
        }
        if (valueOfIndex < 0) throw PatchException("${gate.definingClass}->${gate.name} has no Boolean.valueOf(Z)")
        val valueRegister = when (val valueOf = insns[valueOfIndex]) {
            is FiveRegisterInstruction -> valueOf.registerC
            is RegisterRangeInstruction -> valueOf.startRegister
            else -> throw PatchException("unsupported Boolean.valueOf call: ${valueOf.opcode}")
        }

        // Both paths (entitlement missing/expired, and active) reach the state read right before
        // valueOf. Inserting at that instruction moves its labels onto the inserted constant, so
        // the branch target runs it too.
        val storeIndex = valueOfIndex - 1
        val store = insns.getOrNull(storeIndex)
        val storeOpcode = store?.opcode
        val storedField = (store as? ReferenceInstruction)?.reference as? FieldReference
        if (storeOpcode != Opcode.SGET_OBJECT || storedField == null) {
            throw PatchException(
                "${gate.definingClass}->${gate.name}: expected the Pro state read before Boolean.valueOf, " +
                    "got $storeOpcode",
            )
        }

        gate.addInstructionsAtControlFlowLabelChecked(storeIndex, "const/4 v$valueRegister, 0x1")
    }
}
