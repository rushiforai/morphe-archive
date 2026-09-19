package app.template.patches.myfitnesspal.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_MYFITNESSPAL

private fun MutableMethod.forceEnumConstant(field: String, enumType: String) {
    removeInstructions(0, implementation!!.instructions.count())
    addInstructions(
        0,
        """
            sget-object v0, $enumType->$field:$enumType
            return-object v0
        """.trimIndent(),
    )
}

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium+",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(COMPATIBILITY_MYFITNESSPAL)

    execute {
        // Every server feature state now parses to "entitled" + the highest tier.
        EntitlementParserFingerprint.method.forceEnumConstant(
            field = "Entitled",
            enumType = "${ENTITLEMENTS}Entitlement;",
        )
        TierParserFingerprint.method.forceEnumConstant(
            field = "PremiumPlus",
            enumType = "${ENTITLEMENTS}Tier;",
        )
    }
}
