package semicoloncolonel.mobilestream.patches.wsj.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.wsj.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// The Wall Street Journal 15.12.0 — Hide prediction markets.
//
// WSJ shows Polymarket odds in story cards behind a server feature flag,
// "PolymarketTopStories". The story card mappers already drop every
// Polymarket link when that flag is off, so its getter now always says off.
// ─────────────────────────────────────────────────────────────────────────────

internal object PolymarketTopStoriesEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/dowjones/storycard/StoryCard;",
    name = "isPolymarketTopStoriesEnabled",
    parameters = listOf(),
    returnType = "Z",
)

@Suppress("unused")
val hidePredictionMarketsPatch = bytecodePatch(
    name = "Hide prediction markets",
    description = "Removes Polymarket odds from story cards.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        PolymarketTopStoriesEnabledFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
