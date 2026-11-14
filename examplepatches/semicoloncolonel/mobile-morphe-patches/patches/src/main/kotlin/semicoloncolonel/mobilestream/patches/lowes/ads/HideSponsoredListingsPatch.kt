package semicoloncolonel.mobilestream.patches.lowes.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.lowes.shared.Constants
import semicoloncolonel.mobilestream.patches.lowes.shared.FeatureSwitchReaderFingerprint
import semicoloncolonel.mobilestream.patches.lowes.shared.switchGate
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate

// ─────────────────────────────────────────────────────────────────────────────
// Hide sponsored listings.
//
// Lowe's 26.10.7 asks its search service for sponsored products with the
// enableSponsoredSearch query parameter (SharedProductSearchService). Every
// query parameter passes through Retrofit's RequestBuilder as a (name, value)
// pair. There the value goes through ShoppingAdsFilter, which answers false
// for enableSponsoredSearch, so search results and category pages come back
// without sponsored products.
//
// The sponsored products row on product pages, the ad banner on collection
// pages, and the partner offers after checkout each have a feature switch
// (ShoppingAdsFilter.isLowesAdSwitch). Those switches read as off.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"

// RequestBuilder's (name, value, encoded) query method. The path, header, and
// form methods take the same types, and only this one builds the URL.
internal object RetrofitQueryParameterFingerprint : Fingerprint(
    definingClass = "Lretrofit2/RequestBuilder;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z"),
    returnType = "V",
    strings = listOf("Malformed URL. Base: "),
)

@Suppress("unused")
val hideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings",
    description = "Asks Lowe's search for results without sponsored products, and turns off " +
        "the sponsored row on product pages.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        RetrofitQueryParameterFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p2 }, $ADS_FILTER->lowesQueryParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
            """.trimIndent(),
        )

        FeatureSwitchReaderFingerprint.method.prependGate(switchGate("$ADS_FILTER->isLowesAdSwitch"))
    }
}
