package semicoloncolonel.mobilestream.patches.bestbuy.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.bestbuy.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide sponsored listings.
//
// Best Buy 26.10.10 already has a request option for searches without
// sponsored listings (disableSponsoredListings) and one for sponsored
// listings past the first page. Every search request now reports the first
// as on and the second as off.
//
// Not covered: the sponsored "Featured products" row in search, which the
// app's JavaScript draws.
// ─────────────────────────────────────────────────────────────────────────────

private const val PRODUCT_SEARCH_REQUEST = "Lcom/bestbuy/restclient/model/request/ProductSearchRequest;"

internal object SponsoredListingsDisabledFingerprint : Fingerprint(
    definingClass = PRODUCT_SEARCH_REQUEST,
    name = "isSponsoredListingsDisabled",
    returnType = "Z",
    parameters = listOf(),
)

internal object MultiPageSponsoredListingsFingerprint : Fingerprint(
    definingClass = PRODUCT_SEARCH_REQUEST,
    name = "isShowMultiPageSponsoredListings",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val hideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings",
    description = "Turns on Best Buy's own option for search results without sponsored listings. The " +
        "sponsored \"Featured products\" row in search still shows. Experimental.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {

        SponsoredListingsDisabledFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        MultiPageSponsoredListingsFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
