package semicoloncolonel.mobilestream.patches.yahoonews.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoonews.shared.videoOptOutPatch

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo News 100.1.1 — Show unreleased features.
//
// Several features are switched off for everyone except Yahoo's own testers
// (readiness "internal-only" in the bundle's remote config). Each option turns
// one on by making its getter answer true:
//
//   isFollowEnabled               Follow buttons on stories and publishers,
//                                 and a Following feed among the top tabs.
//   isLocalTabEnabled             the Local news tab. It also needs a local
//                                 TV market, which Yahoo assigns from your
//                                 location, so it shows only once the app has
//                                 location access.
//   isVideoTabEnabled             a Video tab in the bottom bar.
//   isVideoPipContinuousEnabled   picture-in-picture that keeps playing while
//                                 you move around the app.
//   isArticleTtsEnabled           Listen on articles. The audio is generated
//                                 on demand with Yahoo Scout's AI voice, so
//                                 this option and Disable AI cannot both be
//                                 on: whichever runs second fails with a
//                                 message that says so.
//
// Yahoo's servers may not serve everything these screens ask for to a
// regular account.
// ─────────────────────────────────────────────────────────────────────────────

internal const val ARTICLE_TTS_GETTER = "get isArticleTtsEnabled"
internal const val LISTEN_AI_CONFLICT =
    "Listen to articles uses Yahoo Scout's AI voice, so it cannot be used with Disable AI. " +
        "Turn off one of them."

@Suppress("unused")
val showUnreleasedFeaturesPatch = rawResourcePatch(
    name = "Show unreleased features",
    description = "Turns on features Yahoo has not released to everyone. Choose them in the options.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableExpoUpdatesPatch, videoOptOutPatch)

    val follow by booleanOption(
        key = "follow",
        default = true,
        title = "Follow",
        description = "Follow buttons on stories and publishers, and a Following feed among the top tabs.",
    )
    val local by booleanOption(
        key = "local",
        default = true,
        title = "Local tab",
        description = "The Local news tab. It shows only after you allow the app to use your location.",
    )
    val videoTab by booleanOption(
        key = "videoTab",
        default = false,
        title = "Video tab",
        description = "A Video tab in the bottom bar.",
    )
    val continuousPip by booleanOption(
        key = "continuousPip",
        default = false,
        title = "Continuous picture-in-picture",
        description = "A video in picture-in-picture keeps playing while you move around the app.",
    )
    val listen by booleanOption(
        key = "listen",
        default = false,
        title = "Listen to articles",
        description = "Reads articles aloud with an AI voice. Cannot be used with Disable AI.",
    )

    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        if (follow == true) bundle.returnAtStart("get isFollowEnabled", HermesBundle.Value.TRUE)
        if (local == true) bundle.returnAtStart("get isLocalTabEnabled", HermesBundle.Value.TRUE)
        if (videoTab == true) bundle.returnAtStart("get isVideoTabEnabled", HermesBundle.Value.TRUE)
        if (continuousPip == true) bundle.returnAtStart("get isVideoPipContinuousEnabled", HermesBundle.Value.TRUE)
        if (listen == true) {
            if (bundle.returnedAtStart(ARTICLE_TTS_GETTER) == HermesBundle.Value.FALSE) {
                throw PatchException(LISTEN_AI_CONFLICT)
            }
            bundle.returnAtStart(ARTICLE_TTS_GETTER, HermesBundle.Value.TRUE)
        }
        file.writeBytes(bundle.toByteArray())
    }
}
