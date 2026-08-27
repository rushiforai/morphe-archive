package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Forces PokeRaid's existing ad strategy resolver to return Disabled.
 *
 * This does not modify:
 * - hasAdsFreePlan
 * - subscriptions
 * - ad-removal package responses
 * - expiry timestamps
 *
 * Instead, every ad placement resolves to PokeRaid's existing
 * AdLoadStrategy.Disabled singleton.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable Ads",
    description = "Disables ads locally using PokeRaid's built-in Disabled ad strategy.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKERAID)

    execute {
        val strategyResolverClass = mutableClassDefBy(
            "Lcom/facebook/imagepipeline/nativecode/b;"
        )

        strategyResolverClass.methods
            .firstOrNull {
                it.name == "l" &&
                    it.parameterTypes.size == 2 &&
                    it.parameterTypes[0] == "Lcr/d;" &&
                    it.parameterTypes[1] == "Ljava/lang/String;" &&
                    it.returnType == "Lcr/o;"
            }
            ?.addInstructions(
                0,
                """
                sget-object v0, Lcr/h;->INSTANCE:Lcr/h;
                return-object v0
                """.trimIndent()
            )
    }
}