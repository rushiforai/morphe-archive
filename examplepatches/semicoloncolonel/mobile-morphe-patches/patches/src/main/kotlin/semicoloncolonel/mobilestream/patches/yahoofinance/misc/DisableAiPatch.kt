package semicoloncolonel.mobilestream.patches.yahoofinance.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoofinance.shared.offFlags

// Yahoo Finance 26.22.2 — Disable AI. The flags behind Yahoo Scout (its chat,
// tab, search entry, floating composer, onboarding, and transcript), Ask AI on
// selected text, Article Dig Deeper chat, the AI Analyst on quote pages, and the
// AI insight cards read as off. The list is in FinanceFlags.AI.

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Removes Yahoo Scout and its entry points, Ask AI on selected text, the AI Analyst, and the AI insight cards.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        offFlags("aiOff")
    }
}
