package semicoloncolonel.mobilestream.patches.kouponai.ads

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.disableCodePushPatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Hide sponsored cards.
//
// Koupon has no ad network SDK. Its paid placements are banner-ad cards that
// the server mixes into the home feed, drawn by the AdCard component in the
// Hermes bundle. AdCard now renders nothing.
//
// Koupon's over-the-air updates are turned off so that the patched bundle
// stays in use (DisableCodePushPatch).
// ─────────────────────────────────────────────────────────────────────────────

private val hideSponsoredInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("AdCard", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hideSponsoredPatch = resourcePatch(
    name = "Hide sponsored cards",
    description = "Removes the sponsored banner cards from the home feed.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(requireNativeLibsPatch)

    dependsOn(hideSponsoredInBundlePatch, disableCodePushPatch)
}
