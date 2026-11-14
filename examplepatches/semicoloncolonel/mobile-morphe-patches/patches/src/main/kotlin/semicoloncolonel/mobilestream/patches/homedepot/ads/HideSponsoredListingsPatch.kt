package semicoloncolonel.mobilestream.patches.homedepot.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.homedepot.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// ─────────────────────────────────────────────────────────────────────────────
// Hide sponsored listings.
//
// The Home Depot 8.2.6 has two native search and category pages.
//
// The older one asks for sponsored products itself: its search query carries
// additionalSearchParams.sponsored, which the app always sets to true. The
// query's adapter reads it through AdditionalParams.getSponsored(), which now
// answers false, so the results come back without sponsored products.
//
// The newer one gets sponsored products mixed into the page the server sends.
// Every product list is built by the SDUIComponent.ProductList constructor,
// where the children go through ShoppingAdsFilter, which leaves out the
// sponsored ones. Loading more results builds the list the same way.
//
// Not covered: the home page and the web search page, which are web content.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"
private const val OPTIONAL_PRESENT = "Lcom/apollographql/apollo/api/Optional\$Present;"

internal object SponsoredSearchParameterFingerprint : Fingerprint(
    definingClass = "Lcom/thd/type/AdditionalParams;",
    name = "getSponsored",
    parameters = listOf(),
    returnType = "Lcom/apollographql/apollo/api/Optional;",
)

internal object ProductListConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/thehomedepot/kmpgraphql/api/model/SDUIComponent\$ProductList;",
    name = "<init>",
    parameters = listOf(
        "Ljava/lang/String;",
        "I",
        "I",
        "I",
        "I",
        "Ljava/util/List;",
        "Lcom/thehomedepot/kmpgraphql/api/model/SDUIComponent\$ListOrientation;",
        "Z",
    ),
    returnType = "V",
)

@Suppress("unused")
val hideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings",
    description = "Removes sponsored products from The Home Depot's search results and category pages.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // The method has two registers, so p0 is reused once the field is no longer needed.
        SponsoredSearchParameterFingerprint.method.returnEarly(
            """
                new-instance v0, $OPTIONAL_PRESENT
                sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-direct { v0, p0 }, $OPTIONAL_PRESENT-><init>(Ljava/lang/Object;)V
                return-object v0
            """.trimIndent(),
        )

        ProductListConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p6 .. p6 }, $ADS_FILTER->homeDepotProductList(Ljava/util/List;)Ljava/util/List;
                move-result-object p6
            """.trimIndent(),
        )
    }
}
