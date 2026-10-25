package app.template.patches.sofascore.betting

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val hideBettingContentPatch = bytecodePatch(
    name = "Hide betting content",
    description = "Hides odds and betting content.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // 1. The app-wide odds decision: every list, match page and settings check asks it.
        OddsEnabledFingerprint.method.returnEarly(false)

        // 2. The match page's extra odds tabs and blocks (additional odds, odds comparison,
        //    recommended pre-match odds), which follow server flags instead of step 1.
        val flags = mutableClassDefBy(EVENT_HEAD_FLAGS)
        for (getter in EVENT_HEAD_ODDS_FLAGS) {
            val method = flags.methods.singleOrNull {
                it.name == getter && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
            } ?: throw PatchException("$EVENT_HEAD_FLAGS.$getter()Z not found")
            method.returnEarly(false)
        }

        // 3. No Bet365 sign-up link: both callers (the Bet Boost tab and its claim button)
        //    already treat null as "no link" and leave the entry out.
        Bet365SignUpLinkFingerprint.method.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        // 4. The "Promotions" setting off: streaming, ticket and betting promotions.
        PromotionsEnabledFingerprint.method.returnEarly(false)

        // 5. Report odds providers as disabled, so the settings screen hides the odds row that
        //    step 1 leaves without effect.
        OddsProvidersDisabledFingerprint.method.returnEarly(true)
    }
}
