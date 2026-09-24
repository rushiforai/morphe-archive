package app.journal.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.journal.patches.shared.Constants.COMPATIBILITY_JOURNAL

// JournalApplication.onCreate() configures RevenueCat with the app's public API key and
// registers the entitlement listener - both anchored on the API key string, a hardcoded
// literal unique to this one call site, so it survives re-obfuscation across app releases.
internal object ConfigureCallFingerprint : Fingerprint(
    strings = listOf("goog_lTEnhXCGEtUdAiDPEyVegYgHdnP"),
)

private fun Instruction.isCompanionSget(): Boolean {
    if (opcode != Opcode.SGET_OBJECT) return false
    val reference = (this as ReferenceInstruction).reference
    return reference is FieldReference &&
        reference.definingClass == "Lcom/revenuecat/purchases/Purchases;" &&
        reference.name == "Companion"
}

private fun Instruction.isRevenueCatVirtualCall(methodName: String): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val reference = (this as ReferenceInstruction).reference
    return reference is MethodReference &&
        reference.definingClass.startsWith("Lcom/revenuecat/purchases/") &&
        reference.name == methodName
}

private fun Instruction.isGetCustomerInfoWithCall(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC) return false
    val reference = (this as ReferenceInstruction).reference
    return reference is MethodReference &&
        reference.definingClass == "Lcom/revenuecat/purchases/ListenerConversionsKt;" &&
        reference.name == "getCustomerInfoWith"
}

@Suppress("unused")
val purgeRevenueCatPatch = bytecodePatch(
    name = "Purge RevenueCat",
    description = "Stops the app from ever talking to RevenueCat's servers: skips SDK " +
        "initialization on startup and neuters the app's periodic \"refresh entitlement\" " +
        "network calls. Requires Unlock premium to also be enabled - without it, premium " +
        "status has no way to ever resolve as active.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_JOURNAL)

    execute {
        // JournalApplication.onCreate(): drop the block that builds a PurchasesConfiguration
        // and calls Purchases.Companion.configure(...).
        val configureMethod = ConfigureCallFingerprint.method

        val configureStart = configureMethod.instructions.indexOfFirst { it.isCompanionSget() }
        if (configureStart == -1) {
            throw PatchException("Could not find the Purchases.Companion reference before configure()")
        }
        val configureEnd = configureMethod.instructions
            .withIndex()
            .drop(configureStart)
            .firstOrNull { (_, instruction) -> instruction.isRevenueCatVirtualCall("configure") }
            ?.index
            ?: throw PatchException("Could not find the Purchases.configure() call")

        configureMethod.removeInstructions(configureStart, configureEnd - configureStart + 1)

        // Same method, further down: drop the block that fetches the shared instance and
        // registers the customer info listener. With configure() gone, getSharedInstance()
        // would throw at runtime anyway, so this call site is dead either way.
        val listenerStart = configureMethod.instructions.indexOfFirst {
            it.isRevenueCatVirtualCall("getSharedInstance")
        }
        if (listenerStart == -1) {
            throw PatchException("Could not find the getSharedInstance() call before setUpdatedCustomerInfoListener()")
        }
        val listenerEnd = configureMethod.instructions
            .withIndex()
            .drop(listenerStart)
            .firstOrNull { (_, instruction) -> instruction.isRevenueCatVirtualCall("setUpdatedCustomerInfoListener") }
            ?.index
            ?: throw PatchException("Could not find the setUpdatedCustomerInfoListener() call")

        configureMethod.removeInstructions(listenerStart, listenerEnd - listenerStart + 1)

        // The app also manually refreshes entitlements from RevenueCat's servers, from at
        // least two compiled coroutine continuations. Both log "refresh_started" right before
        // calling Purchases.sharedInstance.getCustomerInfoWith(...). Which R8-renamed
        // synthetic classes hold them isn't stable across app builds, so find every
        // occurrence by that shared shape instead of hardcoding class names.
        getAllClassesWithString("refresh_started").forEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            classDef.methods.forEach { method ->
                val callIndex = method.implementation
                    ?.instructions
                    ?.indexOfFirst { it.isGetCustomerInfoWithCall() }
                    ?.takeIf { it != -1 }
                    ?: return@forEach

                val mutableMethod = mutableClass.findMutableMethodOf(method)
                val blockStart = mutableMethod.instructions
                    .withIndex()
                    .take(callIndex + 1)
                    .lastOrNull { (_, instruction) -> instruction.isCompanionSget() }
                    ?.index
                    ?: throw PatchException("Could not find the Purchases.Companion reference before getCustomerInfoWith()")

                mutableMethod.removeInstructions(blockStart, callIndex - blockStart + 1)
            }
        }
    }
}
