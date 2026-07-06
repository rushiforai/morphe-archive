package app.paresh.patches.trackit.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.paresh.patches.trackit.shared.Constants.COMPATIBILITY_TRACKIT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val trackitPremiumPatch = bytecodePatch(
    name = "TrackIt Premium",
    description = "Unlocks premium features."
) {
    compatibleWith(COMPATIBILITY_TRACKIT)
    extendWith("extensions/extension.mpp")

    execute {
        // For expired entitlements — force isActive() to return true
        EntitlementInfoIsActiveFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        SubscriptionInfoIsActiveFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // For empty entitlements — inject fake 'ultimate' entitlement into the returned map
        // Intercept every return-object and pass the map through our extension
        EntitlementInfosMapFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                addInstructions(index, """
                    invoke-static {v$register}, Lapp/paresh/extension/trackit/EntitlementMapPatch;->injectEntitlement(Ljava/util/Map;)Ljava/util/Map;
                    move-result-object v$register
                """)
            }
        }
    }
}
