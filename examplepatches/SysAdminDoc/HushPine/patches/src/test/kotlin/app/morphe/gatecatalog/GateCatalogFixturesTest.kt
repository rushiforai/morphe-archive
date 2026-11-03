/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.gatecatalog

import app.morphe.Fixtures
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The Feature Gate Lab's catalogs are the ones each declared build carries.
 *
 * The Lab shows the running build's rows and moves a rule to another build only where both
 * builds' rows agree, so a catalog that is not what its build holds would carry an override
 * across a change it should have stopped. Until 2026-09-27 the one catalog was 47.0.3's and
 * nothing held it to any build; it was shown on 47.1.3 as well.
 */
class GateCatalogFixturesTest {
    private val tables = listOf(
        "GeneratedFeatureGateCatalog", "GeneratedPlayerFeatureGateCatalog", "GeneratedVeFeatureGateCatalog",
        "GeneratedSettingsManagerCatalog", GateCatalogGenerator.SITES_NAME,
    )

    @Test
    fun `the catalogs name the builds the bundle declares`() {
        val builds = Regex(""""([^"]+)"""").findAll(
            source(GateCatalogGenerator.BUILDS_NAME).substringAfter("BUILDS = {").substringBefore("};"),
        ).map { it.groupValues[1] }.toList()
        assertEquals(Fixtures.declaredVersions(), builds)
        for (table in tables) {
            val stored = GateCatalogGenerator.readJavaSource(source(table))
            assertEquals("$table stores a count for each build", builds.size, stored.counts.size)
            stored.counts.indices.forEach { build ->
                assertEquals("$table's count for ${builds[build]}", stored.counts[build], stored.rowsOf(build).size)
            }
            val sharedSet = stored.shared.toSet()
            stored.own.forEachIndexed { build, rows ->
                assertTrue("$table stores a shared row again as ${builds[build]}'s own", rows.none { it in sharedSet })
            }
        }
    }

    private fun source(className: String): String {
        val repo = if (File("src/main/kotlin").isDirectory) File("..") else File(".")
        val file = File(repo, "extensions/pinedrama/src/main/java/app/morphe/extension/pinedrama/featuregatelab/$className.java")
        assertTrue("$file is missing", file.isFile)
        return file.readText()
    }
}
