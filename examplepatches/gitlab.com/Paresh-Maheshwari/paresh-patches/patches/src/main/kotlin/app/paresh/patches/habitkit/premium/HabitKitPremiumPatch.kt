package app.paresh.patches.habitkit.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.paresh.patches.habitkit.shared.Constants.COMPATIBILITY_HABITKIT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXT = "Lapp/paresh/extension/habitkit/EntitlementMapPatch;"

@Suppress("unused")
val habitKitPremiumPatch = bytecodePatch(
    name = "HabitKit Premium",
    description = "Unlocks all premium features."
) {
    compatibleWith(COMPATIBILITY_HABITKIT)
    extendWith("extensions/extension.mpp")

    execute {
        // Force existing entitlements/subscriptions active (covers expired purchases)
        EntitlementIsActiveFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
        SubscriptionInfoIsActiveFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Free users have no entitlements, so inject a fake active one into the
        // map sent to the Flutter layer before it is returned.
        EntitlementInfosMapFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                addInstructions(index, """
                    invoke-static {v$register}, $EXT->injectEntitlement(Ljava/util/Map;)Ljava/util/Map;
                    move-result-object v$register
                """)
            }
        }
    }
}
