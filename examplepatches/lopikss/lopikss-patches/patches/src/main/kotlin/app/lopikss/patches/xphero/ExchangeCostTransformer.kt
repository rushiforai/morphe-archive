package app.lopikss.patches.xphero

import app.lopikss.patches.shared.UnityCostTableEditor
import app.lopikss.patches.shared.UnityCostTableEditor.PriceRule

/**
 * XP Hero 26.2.0 adapter for the reusable Unity JSON cost-table editor.
 * Match against the original asset; do not blindly patch other app versions.
 */
internal object ExchangeCostTransformer {
    const val ASSET_PATH = "assets/bin/Data/c48bf6e962b374c2d829c84217571712"

    private const val ORIGINAL_SHA256 =
        "4e36ede85e3927f9f98ad3e3ae28a5e3362f1676da4c95e1ed33f6df263e26ac"

    // ShopProductData categories 6 / 7: upgrade and enhancement materials.
    // 3 is the gem currency param, and 1 is the per-item cost type.
    private val priceRules = listOf(
        PriceRule(1011, 50), PriceRule(1013, 100), PriceRule(1014, 500),
        PriceRule(1021, 50), PriceRule(1023, 100), PriceRule(1024, 500),
        PriceRule(1031, 50), PriceRule(1033, 100), PriceRule(1034, 500),
        PriceRule(1041, 50), PriceRule(1043, 100), PriceRule(1044, 500),
        PriceRule(1051, 50), PriceRule(1053, 100), PriceRule(1054, 500),
        PriceRule(1061, 50), PriceRule(1063, 100), PriceRule(1064, 500),
        PriceRule(1071, 50), PriceRule(1073, 100), PriceRule(1074, 500),
        PriceRule(1081, 100), PriceRule(1083, 200), PriceRule(1084, 1000),
    )

    fun transform(original: ByteArray): ByteArray = UnityCostTableEditor.rewrite(
        original = original,
        expectedSha256 = ORIGINAL_SHA256,
        currencyParam = 3,
        costType = 1,
        rules = priceRules,
    )
}
