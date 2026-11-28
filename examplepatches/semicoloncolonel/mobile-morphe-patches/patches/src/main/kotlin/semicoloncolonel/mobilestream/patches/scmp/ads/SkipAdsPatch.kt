package semicoloncolonel.mobilestream.patches.scmp.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.scmp.shared.Constants

// SCMP 7.2.9 draws its screens with Litho. Every ad, in the news feeds and
// in articles, is an AdvertLayout component, which builds either an Advert
// (Ad Manager banners and native ads, with the "ADVERTISEMENT" label) or a
// SponsorAdvert. Its layout now returns null, which Litho draws as nothing,
// so no ad is requested and no labelled box is left in its place.

internal object AdvertLayoutFingerprint : Fingerprint(
    definingClass = "Lcom/scmp/scmpapp/view/lithography/component/AdvertLayoutSpec;",
    name = "onCreateLayout",
    returnType = "Lcom/facebook/litho/Component;",
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads and their labelled boxes in the news feeds and articles.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        AdvertLayoutFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
    }
}
