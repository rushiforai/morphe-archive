package semicoloncolonel.mobilestream.patches.cvs.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cvs.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// ─────────────────────────────────────────────────────────────────────────────
// Hide sponsored listings.
//
// CVS 26.11.30 shows sponsored products in four ways, each with its own hook.
//
// Inside search and category results: the search request lists the systems
// the server should leave out (excludeSystemType). The app's own Buy It Again
// and Deals searches leave out the sponsored ones. Every search request is
// built by one constructor, where the list goes through ShoppingAdsFilter,
// which adds the same exclusions.
//
// Around the results: the showcase ad, the sponsored carousel, and the
// Butterfly ad are dropped when the app decides ads are not visible, as it
// does once a sort or filter is chosen. That decision now always reads as
// not visible.
//
// Sponsored shelves: the buy box and featured products on product pages and
// the sponsored carousels on Shop Home and category pages are fetched through
// one use case, which answers "nothing" for a sponsored request, as it does
// when the server has none. Frequently Bought Together comes through the same
// request type and is kept.
//
// Search suggestions: the sponsored suggestion is behind the
// unified-sponsored-search-results flag, which reads as off.
//
// Not covered: the ad banners on Shop Home.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"
private const val SHELF_INPUT = "Lcom/cvs/shop/network/productShelf/usecase/ProductShelfInput"

// The search request's main constructor. excludeSystemType is its seventh
// parameter. The serializer's constructor starts with an int.
internal object SearchInputConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/cvs/shop/network/productSearch/api/models/SearchSponsoredProductFilterInput;",
    name = "<init>",
    returnType = "V",
    custom = { method, _ ->
        val types = method.parameterTypes.map { it.toString() }
        types.size == 25 && types[0] == "Ljava/lang/String;" && types[6] == "Ljava/util/List;"
    },
)

internal object PlpAdVisibilityFingerprint : Fingerprint(
    definingClass = "Lcom/cvs/frontstore/plp/usecase/RealPlpAdVisibilityUseCase;",
    name = "areAdsVisibleFor",
    returnType = "Z",
)

// (page, input, continuation). Two private overloads take two parameters.
internal object ProductShelfFetchFingerprint : Fingerprint(
    definingClass = "Lcom/cvs/shop/network/productShelf/usecase/DefaultProductShelfUseCase;",
    name = "fetchProductShelfDetails",
    returnType = "Ljava/lang/Object;",
    custom = { method, _ -> method.parameterTypes.size == 3 },
)

internal object FeatureFlagValueFingerprint : Fingerprint(
    definingClass = "Lcom/cvs/featureflag/impl/android/RealFeatureFlagManager;",
    name = "getFlagValue",
    returnType = "Ljava/lang/Object;",
    custom = { method, _ -> method.parameterTypes.size == 1 },
)

@Suppress("unused")
val hideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings",
    description = "Removes sponsored products from CVS search results, category pages, " +
        "product pages, and search suggestions.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        SearchInputConstructorFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p7 .. p7 }, $ADS_FILTER->cvsSearchExclusions(Ljava/util/List;)Ljava/util/List;
                move-result-object p7
            """.trimIndent(),
        )

        PlpAdVisibilityFingerprint.method.returnEarly(
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        ProductShelfFetchFingerprint.method.prependGate(
            """
                instance-of v0, p2, $SHELF_INPUT${'$'}SponsoredProductShelfInfo;
                if-eqz v0, :msp_orig
                instance-of v0, p2, $SHELF_INPUT${'$'}SponsoredProductShelfInfo${'$'}FetchFrequentlyBoughtTogether;
                if-nez v0, :msp_orig
                const/4 v0, 0x0
                return-object v0
            """.trimIndent(),
        )

        FeatureFlagValueFingerprint.method.prependGate(
            """
                invoke-static/range { p1 .. p1 }, $ADS_FILTER->isCvsAdFlag(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :msp_orig
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent(),
        )
    }
}
