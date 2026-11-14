package semicoloncolonel.mobilestream.patches.yahoonews.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoonews.shared.videoOptOutPatch

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo News 100.1.1 — Disable video autoplay.
//
// The Spotlight and Trending video rails play muted on their own and move to
// the next video when one ends. Yahoo's own autoplay setting (Always, Wi-Fi
// only, Never) is read through autoplayEnabled, which now always answers
// false, so the rails show posters and a video plays when you tap it.
// canAutoAdvance, which moves a rail to the next card, and
// imageAutoAdvanceEnabled, which turns image carousels on their own, also
// answer false.
// ─────────────────────────────────────────────────────────────────────────────

private val disableVideoAutoplayInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("autoplayEnabled", HermesBundle.Value.FALSE)
        bundle.returnAtStart("canAutoAdvance", HermesBundle.Value.FALSE)
        bundle.returnAtStart("imageAutoAdvanceEnabled", HermesBundle.Value.FALSE)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val disableVideoAutoplayPatch = resourcePatch(
    name = "Disable video autoplay",
    description = "Videos play only when you tap them, and video rails and image carousels do not move on their own.",
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableVideoAutoplayInBundlePatch, disableExpoUpdatesPatch, videoOptOutPatch)
}
