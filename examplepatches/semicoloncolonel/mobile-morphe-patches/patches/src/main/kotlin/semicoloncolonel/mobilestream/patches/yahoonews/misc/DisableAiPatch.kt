package semicoloncolonel.mobilestream.patches.yahoonews.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoonews.shared.videoOptOutPatch

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo News 100.1.1 — Disable AI.
//
// Yahoo's remote config switches each AI feature on from the server. The app
// reads them through getters that the bundle's createRemoteConfigFlags
// defines, and each one now answers false:
//
//   isAskScoutEntryEnabled      Ask Scout, Yahoo's AI answer engine: its tab,
//                               button, sheet, article prompts, and tooltip.
//   areKeyTakeawaysEnabled      the AI "Key takeaways" on story cards.
//   areCommentSummariesEnabled  the AI summaries of the comments.
//
// The "Get answers with Yahoo Scout" announcement is a separate pop-up that
// does not read those flags. startAskScoutAnnouncement and
// recheckAskScoutAnnouncement, which schedule it, now return at once.
//
// Listen on articles reads them with Scout's AI voice. Its getter
// (isArticleTtsEnabled) now answers false; it is already off for regular
// accounts. The Listen option of Show unreleased features turns it on, so
// the two cannot be combined, and whichever runs second fails.
// ─────────────────────────────────────────────────────────────────────────────

private val disableAiInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("get isAskScoutEntryEnabled", HermesBundle.Value.FALSE)
        bundle.returnAtStart("get areKeyTakeawaysEnabled", HermesBundle.Value.FALSE)
        bundle.returnAtStart("get areCommentSummariesEnabled", HermesBundle.Value.FALSE)
        bundle.returnAtStart("startAskScoutAnnouncement", HermesBundle.Value.UNDEFINED)
        bundle.returnAtStart("recheckAskScoutAnnouncement", HermesBundle.Value.UNDEFINED)
        if (bundle.returnedAtStart(ARTICLE_TTS_GETTER) == HermesBundle.Value.TRUE) {
            throw PatchException(LISTEN_AI_CONFLICT)
        }
        bundle.returnAtStart(ARTICLE_TTS_GETTER, HermesBundle.Value.FALSE)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val disableAiPatch = resourcePatch(
    name = "Disable AI",
    description = "Removes Ask Scout and its announcement, the AI key takeaways on stories, and the AI comment summaries.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableAiInBundlePatch, disableExpoUpdatesPatch, videoOptOutPatch)
}
