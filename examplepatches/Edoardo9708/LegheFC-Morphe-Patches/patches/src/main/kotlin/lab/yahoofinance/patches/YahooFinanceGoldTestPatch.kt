package lab.yahoofinance.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** A3 diagnostic: force the local SubscriptionState tier, preserving server feature maps.
 * Can be combined with Remove ads A2. Does not modify purchase/Billing methods.
 * The app may serialize this simulated local state through its normal persistence path.
 */
@Suppress("unused")
val yahooFinanceGoldTestPatch = bytecodePatch(
    name = "Yahoo Finance - GOLD diagnostic A3",
    description = "Experimental: simulates GOLD in local subscription state. Server feature maps remain original; does not establish premium content access.",
    default = false
) {
    compatibleWith(Compatibility(name = "Yahoo Finance", packageName = "com.yahoo.mobile.client.android.finance", targets = listOf(AppTarget(version = "26.21.2"))))
    execute {
        val state = "Lcom/yahoo/mobile/client/android/finance/subscription/y;"
        val tier = "Lcom/yahoo/mobile/client/android/finance/subscription/v2/model/SubscriptionTier;"
        val string = "Ljava/lang/String;"
        val platform = "Lcom/yahoo/mobile/client/android/finance/data/model/Platform;"
        val map = "Ljava/util/Map;"
        val signatures = listOf(
            listOf("I", string, tier, string, string, platform, map),
            listOf(string, tier, string, string, platform, map, string)
        )
        signatures.forEach { parameters ->
            val method = Fingerprint(definingClass = state, name = "<init>", returnType = "V", parameters = parameters).method
            val instructions = requireNotNull(method.implementation).instructions.toList()
            val index = instructions.indices.single { index ->
                val instruction = instructions[index]
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == state && field.name == "b" && field.type == tier
            }
            val register = (instructions[index] as TwoRegisterInstruction).registerA
            method.addInstructions(index, "sget-object v$register, ${tier}->GOLD:$tier")
        }
    }
}
