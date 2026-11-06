package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.booleanOption
import java.security.MessageDigest

/** Experimental, version-pinned modules for XP Hero 26.2.0. */
private object XP130 {
    const val COST = "assets/bin/Data/c48bf6e962b374c2d829c84217571712"
    const val PRODUCTS = "assets/bin/Data/9724a45587522461cb852200a35b8362"
    // Original 27.0.0 XAPK, SHA-256 validated separately.
    const val COST_27 = "assets/bin/Data/179681ef212334eb2bbada9b18361707"
    const val PRODUCTS_27 = "assets/bin/Data/cb943993aad0a47aebbe7ec0a060976a"
    const val HERO_LEVEL = "assets/bin/Data/00199bb5af76d48728e982d6a69b40eb"
    const val HERO_STAR = "assets/bin/Data/02ce5273e9c794059afe2ada0670d172"
    const val HERO_STAR_27 = "assets/bin/Data/ad2670771b384455ebef2391d9ec5592"
    const val HERO_EVOLVE = "assets/bin/Data/c71e9b16a78284852b30650ca0ebbf2e"
    // Verified against the original XP Hero 27.0.0 base APK (93 data rows).
    const val HERO_EVOLVE_27 = "assets/bin/Data/f7768fb39186946c1becf3280715fc7b"
    const val HERO_EVOLVE_27_SHA = "b1b798d3f78de28869c7e40cf29751dfa12947221bd34fdc8b823ef96b5cfd5f"

    private const val PRODUCT_HASH = "ff0afd7f54a04fe9af0cdcbf3c9c149d8e7d867c7743a6d7399f50166e24ec22"
    private const val PRODUCT_HASH_27 = "1ccede689d592a34e60cea15a2d5a53d4c5f8f9b0fd27bbdfc25b38a0487d586"
    // Hash calculated after zeroing only verified non-IAP, per-item cost fields.
    // Allows multiple independent store modules to modify this one Unity asset.
    private const val NORMALIZED_COST_HASH = "56bb8ae552d1a7cf39518c905dcabeaa5c2fa868ac0df75be7b0014adf763b49"
    private const val NORMALIZED_COST_HASH_27 = "cc3f32818330d55de11167fdde0eb58c32992acd978a9eaba40d2d910a14e7fb"

    private val productPattern = Regex("""\{"category_id":"(\d+)","cost_group_id":"(\d+)",[^{}]*\}""")
    private val pricePattern = Regex("""\{"cost_param":"(\d+)","cost_type":"(\d+)","cost_value":"(\d+)","group_id":"(\d+)","id":"(\d+)","max_purchase_count":"(-?\d+)","org_price_iap":"(\d+)","priority":"(\d+)"\}""")

    private fun digest(data: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(data).joinToString("") { "%02x".format(it) }

    private fun zero(m: MatchResult): String {
        val old = m.groupValues[3]
        return m.value.replace("\"cost_value\":\"$old\"", "\"cost_value\":\"${"0".repeat(old.length)}\"")
    }

    /**
     * XP Hero 27.0.0 rebuilds Unity Data filenames. Locate the evolution
     * table by its existing fields instead of assuming the 26.2.0 asset name.
     * Reject ambiguous/partial matches; never modify an unverified file.
     */
    fun patchHeroEvolve(pinned: java.io.File) {
        val legacyHash = "f66705315246f8b730793a6964a6d148deb9b86a119bb1d232b801bd7201ffb9"
        val fields = arrayOf("Cost_Amount1", "Cost_Amount2", "Cost_Piece")

        // Keep the original 26.2.0 path + hash behavior unchanged.
        if (pinned.isFile) {
            val original = pinned.readBytes()
            if (digest(original) == legacyHash) {
                pinned.writeBytes(hero(original, legacyHash, 92, *fields))
                return
            }
        }

        val directory = pinned.parentFile
        check(directory != null && directory.isDirectory) {
            "XP Hero Unity Data directory was not found: ${pinned.parent}"
        }
        val patterns = fields.map { field -> Regex("\"" + Regex.escape(field) + "\":\"[0-9]+\"") }
        val candidates = directory.walkTopDown().maxDepth(2)
            .filter { it.isFile && it.length() in 1L..(32L * 1024 * 1024) }
            .mapNotNull { file ->
                val bytes = runCatching { file.readBytes() }.getOrNull() ?: return@mapNotNull null
                val data = String(bytes, Charsets.ISO_8859_1)
                val counts = patterns.map { it.findAll(data).count() }
                if (counts.all { it >= 92 && it <= 512 } && counts.distinct().size == 1) {
                    Triple(file, bytes, counts.first())
                } else null
            }.take(2).toList()
        check(candidates.size == 1) {
            "Expected exactly one XP Hero evolution asset; found ${candidates.size}. No files changed."
        }
        val (file, bytes, rowCount) = candidates.single()
        // Existing hero() field matching, exact row-count checks and
        // in-place byte-length validation remain untouched.
        file.writeBytes(hero(bytes, digest(bytes), rowCount, *fields))
    }

    fun store(costBytes: ByteArray, productBytes: ByteArray, categoryIds: Set<Int>,
              expectedRowCount: Int, other: Boolean = false): ByteArray {
        val productDigest = digest(productBytes)
        val v27 = productDigest == PRODUCT_HASH_27
        require(v27 || productDigest == PRODUCT_HASH) { "Unsupported XP Hero product asset" }
        val products = productPattern.findAll(String(productBytes, Charsets.ISO_8859_1)).toList()
        check(products.size == (if (v27) 801 else 777)) { "Unexpected product table" }
        val selectedGroups = products.filter {
            val category = it.groupValues[1].toInt()
            if (other) category !in categoryIds else category in categoryIds
        }.map { it.groupValues[2].toInt() }.toSet()

        val original = String(costBytes, Charsets.ISO_8859_1)
        check(pricePattern.findAll(original).count() == (if (v27) 855 else 829)) {
            "Unexpected shop price table"
        }
        val normalized = pricePattern.replace(original) {
            if (it.groupValues[2] == "1" && it.groupValues[7] == "0") zero(it) else it.value
        }
        val expectedCostHash = if (v27) NORMALIZED_COST_HASH_27 else NORMALIZED_COST_HASH
        require(digest(normalized.toByteArray(Charsets.ISO_8859_1)) == expectedCostHash) {
            "Unexpected differences in game cost table"
        }
        var visited = 0
        val resultText = pricePattern.replace(original) {
            if (it.groupValues[4].toInt() in selectedGroups &&
                it.groupValues[2] == "1" && it.groupValues[7] == "0") {
                visited++
                zero(it)
            } else it.value
        }
        check(visited == expectedRowCount) { "Unexpected shop cost count $visited" }
        val result = resultText.toByteArray(Charsets.ISO_8859_1)
        check(result.size == costBytes.size) { "Shop resource size changed" }
        return result
    }

    fun hero(data: ByteArray, expectedHash: String, expectedRows: Int, vararg fields: String): ByteArray {
        require(digest(data) == expectedHash) { "Unexpected hero data asset" }
        var value = String(data, Charsets.ISO_8859_1)
        for (field in fields) {
            val expression = Regex("(\"" + Regex.escape(field) + "\":\")([0-9]+)(\")")
            val matches = expression.findAll(value).count()
            check(matches == expectedRows) { "Unexpected $field count: $matches" }
            value = expression.replace(value) {
                it.groupValues[1] + "0".repeat(it.groupValues[2].length) + it.groupValues[3]
            }
        }
        val result = value.toByteArray(Charsets.ISO_8859_1)
        check(result.size == data.size) { "Hero asset size changed" }
        return result
    }

    /**
     * Diagnostic fallback for hero star upgrades that display a zero cost
     * yet do not complete. Use INSTEAD of the zero-piece Hero Upgrade patch.
     * This intentionally costs ONE hero piece, so it is not a free upgrade.
     * It helps distinguish game logic rejecting zero from other validation.
     */
    fun heroUpgradeOnePiece(data: ByteArray): ByteArray {
        val sha = digest(data)
        val v27 = sha == "4ad3a365ac10ec3ae2314f0c089ba5803bb4a4fb1265c8eb868be765987f90e1"
        require(v27 || sha == "818570c2ec087bab93583352fbe6e6ff9dd859b5f06cd14b9d1995842467df87") {
            "Unsupported hero star-upgrade asset"
        }
        val text = String(data, Charsets.ISO_8859_1)
        val price = Regex("(\\\"Cost1_Amount\\\":\\\")([0-9]+)(\\\")")
        check(price.findAll(text).count() == (if (v27) 156 else 144)) {
            "Unexpected star upgrade row count"
        }
        val rewritten = price.replace(text) { match ->
            match.groupValues[1] + "0".repeat(match.groupValues[2].length - 1) +
                "1" + match.groupValues[3]
        }
        val bytes = rewritten.toByteArray(Charsets.ISO_8859_1)
        check(bytes.size == data.size) { "Asset length changed" }
        return bytes
    }
}

// Non-IAP shop categories; the optional modules may be enabled together.







/**
 * One Morphe module with six independent on/off switches.
 * All eligible records are non-IAP. Exact asset hashes and category row
 * counts are validated by the tested XP130.store editor.
 */
@Suppress("unused")
val xpHeroFreeShops = rawResourcePatch(
    name = "XP Hero | Free Shops",
    description = "Choose which shop categories have zero in-game currency prices. Open patch settings for six toggles.",
    default = false,
) {
    compatibleWith(XP_HERO)

    val dailyGems = booleanOption(
        key = "dailyGemShop", default = true, title = "Daily Gem Shop",
        description = "Zero 300 non-IAP Daily Gem Shop prices.",
    )
    val chests = booleanOption(
        key = "chestShops", default = true, title = "Chest Shops",
        description = "Zero 20 chest shop prices.",
    )
    val tokens = booleanOption(
        key = "tokenShop", default = true, title = "Token Shop",
        description = "Zero 27 red-token shop prices.",
    )
    val invasion = booleanOption(
        key = "invasionShop", default = true, title = "Invasion Shop",
        description = "Zero 38 Invasion Shop prices.",
    )
    val exchange = booleanOption(
        key = "exchangeShop", default = true, title = "Exchange Shop",
        description = "Zero the 24 in-game material Exchange prices.",
    )
    val otherShops = booleanOption(
        key = "otherShops", default = true, title = "Other Shops",
        description = "Zero 27 additional local non-IAP shop prices.",
    )

    execute {
        val v27Costs = get(XP130.COST_27)
        val v27Products = get(XP130.PRODUCTS_27)
        val v27 = v27Costs.isFile && v27Products.isFile
        val selected = listOf(
            Triple(dailyGems.value == true, setOf(15), 300),
            Triple(chests.value == true, setOf(4, 8), if (v27) 24 else 20),
            Triple(tokens.value == true, setOf(34), 27),
            Triple(invasion.value == true, setOf(9), 38),
            Triple(exchange.value == true, setOf(6, 7), 24),
        )
        val extra = otherShops.value == true
        if (selected.any { it.first } || extra) {
            val shopCosts = if (v27) v27Costs else get(XP130.COST)
            val productData = (if (v27) v27Products else get(XP130.PRODUCTS)).readBytes()
            var bytes = shopCosts.readBytes()
            for ((enabled, categories, expected) in selected) {
                if (enabled) bytes = XP130.store(bytes, productData, categories, expected)
            }
            if (extra) {
                bytes = XP130.store(bytes, productData,
                    setOf(15, 4, 8, 34, 9, 6, 7), 27, true)
            }
            shopCosts.writeBytes(bytes)
        }
    }
}

@Suppress("unused")
val xp130FreeHeroLevel = rawResourcePatch(
    name = "XP Hero | Free Hero Level Up", description = "Experimental: zero hero level-up resource costs.", default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val file = get(XP130.HERO_LEVEL)
        file.writeBytes(XP130.hero(file.readBytes(),
            "8d0ca15a7aaf9971fdebb962199af037f7493ed14002ee2565e16dded89c2e0b", 126, "Cost_Amount_1"))
    }
}


@Suppress("unused")
val xp130FreeHeroEvolve = rawResourcePatch(
    name = "XP Hero | Free Hero Evolve", description = "Experimental: zero hero evolution materials and pieces.", default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val v27 = get(XP130.HERO_EVOLVE_27)
        if (v27.isFile) {
            // Exact v27 path, hash and row count. No heuristic scanning needed.
            v27.writeBytes(XP130.hero(v27.readBytes(), XP130.HERO_EVOLVE_27_SHA, 93,
                "Cost_Amount1", "Cost_Amount2", "Cost_Piece"))
        } else {
            // Preserve the original v26.2.0 implementation and fallback.
            XP130.patchHeroEvolve(get(XP130.HERO_EVOLVE))
        }
    }
}


/**
 * Confirmed in-game: hero upgrades for one shard. The abandoned zero-cost
 * variant was removed because its Upgrade button did nothing.
 */
@Suppress("unused")
val xp131OnePieceHeroUpgradeTest = rawResourcePatch(
    name = "XP Hero | Hero Upgrade (1 Shard - Fallback)",
    description = "Confirmed working fallback; costs one shard. Disable when selecting Free Hero Upgrade (0 Shards).",
    default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val v27 = get(XP130.HERO_STAR_27)
        val file = if (v27.isFile) v27 else get(XP130.HERO_STAR)
        file.writeBytes(XP130.heroUpgradeOnePiece(file.readBytes()))
    }
}
