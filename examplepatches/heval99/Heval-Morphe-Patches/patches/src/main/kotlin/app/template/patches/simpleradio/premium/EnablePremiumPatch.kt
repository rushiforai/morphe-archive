package app.template.patches.simpleradio.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SIMPLERADIO
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Premium state is entirely local. SimpleRadioBaseActivity.isPremium() returns
 * `mIabService.isInitialized() && mIabService.c()`, and the IAB service answers
 * c() from SharedPreferences: the "iab_premium" boolean OR the
 * "iab_subscription_date_end" timestamp being in the future.
 *
 * The IAB service class is R8-obfuscated (`b9/j` on 6.2.0 - verified with a
 * whole-app scan that it is the only class referencing "iab_premium"), so it is
 * located by that literal, and the check is the only no-arg boolean in it whose
 * body reads the key (sibling no-arg booleans like isInitialized()/j() do not).
 */
object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/streema/simpleradio/SimpleRadioBaseActivity;",
    name = "isPremium",
    returnType = "Z",
    parameters = listOf(),
)

private const val IAB_PREMIUM_KEY = "iab_premium"

private fun BytecodePatchContext.iabServiceClass(): MutableClass {
    val classDef = classDefByStrings(IAB_PREMIUM_KEY).singleOrNull()
        ?: error("Simple Radio IAB service class not found (key '$IAB_PREMIUM_KEY')")
    return mutableClassDefBy(classDef)
}

private fun MutableMethod.readsString(literal: String): Boolean =
    implementation?.instructions?.any { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == literal
    } == true

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Simple Radio Premium (ad-free listening) by forcing the " +
        "local subscription checks to true."
) {
    compatibleWith(COMPATIBILITY_SIMPLERADIO)

    execute {
        // Mandatory anchor: the unobfuscated Activity-level gate every UI call
        // site consults. Fail loudly if a future release renames it.
        IsPremiumFingerprint.method.returnEarly(true)

        // The underlying IAB-service check, located by its stable preference key
        // so R8 rotation cannot break it.
        val iabService = iabServiceClass()
        val premiumCheck = iabService.methods.firstOrNull { method ->
            method.returnType == "Z" && method.implementation != null &&
                method.parameterTypes.isEmpty() && method.readsString(IAB_PREMIUM_KEY)
        } ?: error("Simple Radio premium check not found in ${iabService.type}")

        premiumCheck.returnEarly(true)
    }
}
