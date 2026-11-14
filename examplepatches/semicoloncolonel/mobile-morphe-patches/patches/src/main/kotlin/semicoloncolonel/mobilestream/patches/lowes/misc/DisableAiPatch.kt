package semicoloncolonel.mobilestream.patches.lowes.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.lowes.shared.Constants
import semicoloncolonel.mobilestream.patches.lowes.shared.FeatureSwitchReaderFingerprint
import semicoloncolonel.mobilestream.patches.lowes.shared.switchGate
import semicoloncolonel.mobilestream.patches.shared.misc.AI_FILTER
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate

// ─────────────────────────────────────────────────────────────────────────────
// Disable AI (OPT-IN, default OFF).
//
// Lowe's 26.10.7 switches Mylow, its AI assistant, with ENABLE_STREAMING_CHAT:
// with it off, the chat manager reports "MyLow disabled" and opens nothing.
// The Mylow button in the top bar, Mylow in store mode, Mylow dictation, the
// AI overview above search results, and the AI summary of reviews each have
// their own switch. All of them read as off (AiFeatureFilter.isLowesAiSwitch).
//
// Not touched: ENABLE_GOOGLE_CHAT, the customer service chat.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off Mylow, the AI overview in search, and AI review summaries.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        FeatureSwitchReaderFingerprint.method.prependGate(switchGate("$AI_FILTER->isLowesAiSwitch"))
    }
}
