package app.template.patches.bookly.premium

import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BOOKLY
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Bookly's premium state is a Compose StateFlow of SubscriptionState (Unknown / Free / Active).
 * The RevenueCat listener in the billing client sets Active when the CustomerInfo carries the
 * lifetime entitlement, and Free otherwise; every Pro gate reads the flow.
 *
 * The patch (1) makes the entitlement check answer true, so the listener sets Active, and (2) seeds
 * the manager with Active so the first frames before the first callback are already Pro. RevenueCat,
 * the paywall (Superwall) and the purchase screen are untouched.
 *
 * Verified 2026-10-27 against 2.4.2 (versionCode 505): see COMPATIBILITY_BOOKLY.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Bookly Pro.",
) {
    compatibleWith(COMPATIBILITY_BOOKLY)

    execute {
        BooklyPremiumFingerprint.method.returnEarly(true)

        val manager = mutableClassDefBy(SUBSCRIPTION_MANAGER)
        val init = manager.methods.singleOrNull { it.name == "<init>" && it.implementation != null }
            ?: throw PatchException("$SUBSCRIPTION_MANAGER has no constructor")
        val insns = init.implementation!!.instructions.toList()
        val seed = insns.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.SGET_OBJECT && reference?.type == UNKNOWN_STATE
        }
        if (seed < 0) throw PatchException("$SUBSCRIPTION_MANAGER does not seed $UNKNOWN_STATE")

        init.addInstructionsChecked(
            seed,
            """
                new-instance v0, $ACTIVE_STATE
                invoke-direct {v0}, $ACTIVE_STATE-><init>()V
            """,
        )
        init.removeInstructions(seed + 2, 1)
    }
}

private const val SUBSCRIPTION_MANAGER = "Lcom/twodoorgames/bookly/subscription/SubscriptionManager;"
private const val UNKNOWN_STATE = "Lcom/twodoorgames/bookly/subscription/SubscriptionState\$Unknown;"
private const val ACTIVE_STATE = "Lcom/twodoorgames/bookly/subscription/SubscriptionState\$Active;"
