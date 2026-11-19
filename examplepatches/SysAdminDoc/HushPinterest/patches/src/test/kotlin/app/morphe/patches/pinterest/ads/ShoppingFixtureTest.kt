/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import org.junit.Assert.*
import org.junit.Test
import org.junit.experimental.categories.Category

@Category(FixtureTests::class)
class ShoppingFixtureTest {
    @Test fun `each declared build retains shoppable pins featured boards and typed shopping stories`() {
        for (build in Fixtures.declaredBuilds()) {
            var shoppable = false
            var featured = false
            var spotlight = false
            val spotlightEnums = mutableSetOf<String>()
            val storyTypes = mutableSetOf<String>()
            val featuredTypes = mutableSetOf<String>()
            val sponsoredTypes = mutableSetOf<String>()
            FixtureDex.forEach(build) { dex ->
                dex.classes.filter { it.type.startsWith("Lcom/pinterest/api/model/") }.forEach { model ->
                    val json = model.fields.associateBy { it.json() }
                    if ("ai_disclosures" in json && json["is_shoppable"]?.type == "Ljava/lang/Boolean;") shoppable = true
                    json["featured_board_metadata"]?.let {
                        featured = true
                        featuredTypes += it.type
                    }
                    if (json["is_sponsored_content"]?.type == "Ljava/lang/Boolean;") sponsoredTypes += model.type
                    if (model.fields.any { it.name == "SHOPPING_SPOTLIGHT" && it.json() == "shopping_spotlight" }) {
                        spotlight = true
                        if (model.superclass == "Ljava/lang/Enum;") spotlightEnums += model.type
                    }
                    json["story_type"]?.let { storyTypes += it.type }
                }
            }
            assertTrue("${build.name}: no shoppable pin label", shoppable)
            assertTrue("${build.name}: no featured board metadata", featured)
            assertTrue("${build.name}: no typed shopping spotlight", spotlight)
            // Hide ads reads this flag inside the board's metadata (Ads.isSponsoredBoard).
            assertTrue("${build.name}: featured board metadata has no sponsored flag ($featuredTypes)",
                featuredTypes.any { it in sponsoredTypes })
            // Hide ads reads this enum's constant name (Ads.isSpotlight), not just the JSON text.
            assertTrue("${build.name}: no story_type field typed as the spotlight enum ($storyTypes)",
                storyTypes.any { it in spotlightEnums })
        }
    }
}
