package semicoloncolonel.mobilestream.patches.checkout51.shared

import app.morphe.patcher.Fingerprint

internal const val SHOPPING_ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"

// Checkout 51 9.22.10 turns the offer models from its server into list rows in
// OfferModelToListItemFactory.getListItemsFromOfferModels. The offer list and
// search both build their rows here.
internal object GetListItemsFromOfferModelsFingerprint : Fingerprint(
    definingClass = "Lcom/c51/core/lists/factory/OfferModelToListItemFactory;",
    name = "getListItemsFromOfferModels",
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/util/List;"),
)
