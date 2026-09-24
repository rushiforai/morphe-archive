package app.journal.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.journal.patches.shared.Constants.COMPATIBILITY_JOURNAL

// RevenueCat's CustomerInfo update callback resolves premium status with
// entitlements.get("premium")?.isActive() ?: false. The class hosting it
// (Lfn3;) and its method name are obfuscated and get renamed every release,
// so anchor on the "premium" entitlement id string plus the isActive() call
// shape instead - both come straight from the RevenueCat SDK contract and
// don't move between app builds.
//
// Note: entitlements.get("premium") returns null for any account that never
// held the entitlement, and the method null-checks it *before* calling
// isActive() - so patching isActive()'s result alone does nothing for free
// accounts, since that null branch skips the isActive() call entirely. Both
// branches (null and non-null) converge on a single
// Boolean.valueOf(Z) call that boxes the final result, so that's the choke
// point to patch instead.
internal object PremiumEntitlementFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("premium"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { it.isEntitlementIsActiveCall() } == true
    },
)

private fun Instruction.isEntitlementIsActiveCall(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val reference = (this as ReferenceInstruction).reference
    return reference is MethodReference &&
        reference.definingClass == "Lcom/revenuecat/purchases/EntitlementInfo;" &&
        reference.name == "isActive"
}

private fun Instruction.isBooleanValueOfCall(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC) return false
    val reference = (this as ReferenceInstruction).reference
    return reference is MethodReference &&
        reference.definingClass == "Ljava/lang/Boolean;" &&
        reference.name == "valueOf" &&
        reference.parameterTypes.singleOrNull() == "Z"
}

// The listener's constructor seeds the "hasPremium" StateFlow with
// Boolean.FALSE before any RevenueCat network response has ever arrived.
// If the device is offline on first launch, entitlementUpdateListener's
// callback (patched above) never fires at all, so this constructor default
// is the only thing standing between a fresh install and a "not premium"
// state - the class implementing RevenueCat's UpdatedCustomerInfoListener
// is a unique, non-obfuscated anchor for finding it.
internal object PremiumListenerConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = emptyList(),
    custom = { _, classDef ->
        classDef.interfaces.contains("Lcom/revenuecat/purchases/interfaces/UpdatedCustomerInfoListener;")
    },
)

private fun Instruction.isBooleanFalseField(): Boolean {
    if (opcode != Opcode.SGET_OBJECT) return false
    val reference = (this as ReferenceInstruction).reference
    return reference is FieldReference &&
        reference.definingClass == "Ljava/lang/Boolean;" &&
        reference.name == "FALSE"
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Forces the RevenueCat \"premium\" entitlement check to always resolve as " +
        "active, including before the app has ever reached RevenueCat's servers.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JOURNAL)

    execute {
        val method = PremiumEntitlementFingerprint.method
        val instructions = method.instructions

        val isActiveIndex = instructions.indexOfFirst { it.isEntitlementIsActiveCall() }
        if (isActiveIndex == -1) {
            throw PatchException("Could not find EntitlementInfo.isActive() call")
        }

        // The null-check branch and the isActive() branch both converge here -
        // this is the one spot that is reached no matter which path was taken.
        val valueOfIndex = instructions
            .withIndex()
            .drop(isActiveIndex)
            .firstOrNull { (_, instruction) -> instruction.isBooleanValueOfCall() }
            ?.index
            ?: throw PatchException("Could not find Boolean.valueOf(Z) call after isActive()")

        val register = (instructions[valueOfIndex] as FiveRegisterInstruction).registerC

        // Force the boxed boolean's source register to true immediately
        // before it's read, regardless of what either branch computed.
        method.addInstructions(
            valueOfIndex,
            "const/4 v$register, 0x1",
        )

        val constructor = PremiumListenerConstructorFingerprint.method
        val constructorInstructions = constructor.instructions

        val falseFieldIndex = constructorInstructions.indexOfFirst { it.isBooleanFalseField() }
        if (falseFieldIndex == -1) {
            throw PatchException("Could not find the Boolean.FALSE default in the listener constructor")
        }

        val defaultRegister = (constructorInstructions[falseFieldIndex] as OneRegisterInstruction).registerA

        constructor.replaceInstruction(
            falseFieldIndex,
            "sget-object v$defaultRegister, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
        )
    }
}
