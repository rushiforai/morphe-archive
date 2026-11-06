package semicoloncolonel.mobilestream.patches.usatoday.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.usatoday.shared.Constants

// USA TODAY 8.15.0. Every ad path in the app (section fronts, articles,
// galleries, video pre-rolls, Taboola, and the ad-free upsells) first asks
// whether the reader has the "ad_free" feature, and skips building the ad when
// they do, so no slot or label is drawn. The app's config has a switch,
// adConfiguration.enableAdFreedom, that makes "ad_free" always on; USA TODAY
// leaves it off. AdConfiguration.isAdFreedomEnabled() now reports it on.
//
// This only removes ads. Premium articles stay locked.

internal object AdFreedomEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/gannett/android/configuration/impl/AdConfigurationImpl;",
    name = "isAdFreedomEnabled",
    parameters = listOf(),
    returnType = "Z",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads in the feeds, articles, galleries, and videos, and the ad-free upsells.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        AdFreedomEnabledFingerprint.method.returnEarly(
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
