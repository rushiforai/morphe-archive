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
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import org.junit.Assert.*
import org.junit.Test
import org.junit.experimental.categories.Category

@Category(FixtureTests::class)
class ShoppingFixtureTest {
    private fun Field.json(): String? = annotations.flatMap { it.elements }.firstNotNullOfOrNull {
        if (it.name == "value") (it.value as? StringEncodedValue)?.value else null
    }

    @Test fun `each declared build retains shoppable pins featured boards and typed shopping stories`() {
        for (build in Fixtures.declaredBuilds()) {
            var shoppable = false
            var featured = false
            var spotlight = false
            FixtureDex.forEach(build) { dex ->
                dex.classes.filter { it.type.startsWith("Lcom/pinterest/api/model/") }.forEach { model ->
                    val json = model.fields.associateBy { it.json() }
                    if ("ai_disclosures" in json && json["is_shoppable"]?.type == "Ljava/lang/Boolean;") shoppable = true
                    if ("featured_board_metadata" in json) featured = true
                    if (model.fields.any { it.name == "SHOPPING_SPOTLIGHT" && it.json() == "shopping_spotlight" }) spotlight = true
                }
            }
            assertTrue("${build.name}: no shoppable pin label", shoppable)
            assertTrue("${build.name}: no featured board metadata", featured)
            assertTrue("${build.name}: no typed shopping spotlight", spotlight)
        }
    }
}
