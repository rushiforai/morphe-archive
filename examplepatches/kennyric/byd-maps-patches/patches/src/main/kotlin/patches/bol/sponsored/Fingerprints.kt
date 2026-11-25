package patches.bol.sponsored

import app.morphe.patcher.Fingerprint

/**
 * GraphQL input type `SearchInput` (obfuscated: hdj in 2026.22.1).
 * One of its fields is `enableSponsoredProducts: Optional<Boolean>`, which the app sets to
 * `Present(true)` for regular searches. The server then mixes sponsored products into the results.
 */
internal object SearchInputToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("SearchInput(query=", ", enableSponsoredProducts=")
)

/**
 * Product page (PDP) sections, `enum class (value: String)`, with the values used by the
 * `android_config_pdp_phone_configuration` remote config:
 * `advertisement`, `considerationDisplayAd`, `productdisplayad` and `sponsoredproducts` are ads.
 */
internal object PdpSectionEnumFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf("advertisement", "considerationDisplayAd", "productdisplayad", "sponsoredproducts")
)

/**
 * Returns the ordered list of PDP sections: parsed from remote config, or a hardcoded default list.
 */
internal object PdpSectionsFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    strings = listOf("android_config_pdp_phone_configuration")
)

