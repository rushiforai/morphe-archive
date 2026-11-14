package semicoloncolonel.mobilestream.patches.walmart.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.walmart.shared.Constants
import semicoloncolonel.mobilestream.patches.walmart.shared.forceWalmartFlagsOff

// ─────────────────────────────────────────────────────────────────────────────
// Hide sponsored listings.
//
// Walmart 26.42.2 shows sponsored content in two ways.
//
// Ad surfaces: sponsored product carousels, Sponsored Brand banners,
// sponsored video, display ads, and the sponsored rows on item pages. Each
// has a "request" and a "render" flag in the ads. namespace, read through the
// config API's getBoolean(key, default). The flags in
// ShoppingAdsFilter.isWalmartAdKey read as off, and each ad view then takes
// its own no-ad path. When ads.primaryCCM.enabled is on, one model from the
// server decides instead of the flags. That flag reads as off too, and the
// model is built with its request and render values off in case it is used
// anyway.
//
// Sponsored products inside the results: search and category results have no
// switch for these. Each sponsored product arrives in the results marked with
// sponsoredProduct data. The two result lists are built by the
// SearchResultFragment.ItemStack and SearchResultFragment.Content1
// constructors, where the products go through ShoppingAdsFilter, which leaves
// out the sponsored ones.
//
// Not covered: ads in store mode and in the notification center, which have
// no flag.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"
private const val SEARCH_RESULT =
    "Lcom/walmart/glass/featuresearchitemstackcommon/orchestration/graphql/generated/fragment/SearchResultFragment"

// (reqEnabled, renderEnabled, measure1PEnabled, measure3PEnabled)
internal object PrimaryAdConfigFingerprint : Fingerprint(
    definingClass = "Lcom/walmart/glass/ads/ccm/CcmManager\$PrimaryConfigModel;",
    name = "<init>",
    parameters = listOf("Z", "Z", "Z", "Z"),
    returnType = "V",
)

// (meta, items, content)
internal object ItemStackConstructorFingerprint : Fingerprint(
    definingClass = "$SEARCH_RESULT\$ItemStack;",
    name = "<init>",
    parameters = listOf("$SEARCH_RESULT\$Meta;", "Ljava/util/List;", "$SEARCH_RESULT\$Content;"),
    returnType = "V",
)

// The modular results. Its products are the second list, the tenth parameter.
internal object ModuleContentConstructorFingerprint : Fingerprint(
    definingClass = "$SEARCH_RESULT\$Content1;",
    name = "<init>",
    returnType = "V",
    custom = { method, _ ->
        val types = method.parameterTypes.map { it.toString() }
        types.size == 15 && types[8] == "Ljava/util/List;" && types[9] == "Ljava/util/List;"
    },
)

private fun filterItems(register: String) = """
    invoke-static/range { $register .. $register }, $ADS_FILTER->walmartSearchItems(Ljava/util/List;)Ljava/util/List;
    move-result-object $register
"""

@Suppress("unused")
val hideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings",
    description = "Removes sponsored products from Walmart's search results and category pages, " +
        "and turns off sponsored carousels, banners, and video.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        forceWalmartFlagsOff("isWalmartAdKey")

        PrimaryAdConfigFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
                const/4 p2, 0x0
            """.trimIndent(),
        )

        ItemStackConstructorFingerprint.method.addInstructions(0, filterItems("p2").trimIndent())
        ModuleContentConstructorFingerprint.method.addInstructions(0, filterItems("p10").trimIndent())
    }
}
