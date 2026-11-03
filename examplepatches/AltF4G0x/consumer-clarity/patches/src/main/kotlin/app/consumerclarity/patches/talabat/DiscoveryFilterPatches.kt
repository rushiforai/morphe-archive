package app.consumerclarity.patches.talabat

import app.morphe.patcher.patch.resourcePatch

private const val CATALOG_ASSET = "assets/consumerclarity/settings.tsv"

private fun discoveryFilter(name: String, description: String, kind: String) = resourcePatch(
    name,
    description,
    false,
) {
    compatibleWith(TALABAT_COMPATIBILITY)
    dependsOn(consistentSortingPatch)
    execute {
        get(CATALOG_ASSET).registerSetting(name, name, description, "Discovery", kind = kind)
    }
}

@Suppress("unused")
val restaurantRatingFilterPatch = discoveryFilter(
    "Restaurant rating filter",
    "Adds a minimum-rating filter for restaurant listings, including 4.0 and 4.5 stars.",
    "restaurant_filter",
)

@Suppress("unused")
val reviewContentFilterPatch = discoveryFilter(
    "Review content filter",
    "Adds minimum-rating and reviews-with-text filters without changing review content.",
    "review_filter",
)
