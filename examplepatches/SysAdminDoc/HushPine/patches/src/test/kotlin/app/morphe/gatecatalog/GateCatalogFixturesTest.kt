/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.gatecatalog

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
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

    @Test
    fun `a static call's arguments line up with its parameters`() {
        val get = ImmutableMethodReference("Lfixture/Settings;", "get", listOf("Ljava/lang/String;", "J"), "J")
        val method = ImmutableMethod(
            "Lfixture/Reader;", "read", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(
                3,
                listOf(
                    ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("key")),
                    ImmutableInstruction21s(Opcode.CONST_WIDE_16, 1, 7),
                    ImmutableInstruction35c(Opcode.INVOKE_STATIC, 3, 0, 1, 2, 0, 0, get),
                    ImmutableInstruction10x(Opcode.RETURN_VOID),
                ),
                null, null,
            ),
        )
        val calls = mutableListOf<GateCatalogGenerator.Call>()
        GateCatalogGenerator.track(method) { calls += it; null }
        val args = calls.single().args
        assertEquals(2, args.size)
        assertEquals("key", (args[0] as GateCatalogGenerator.Str).text)
        assertEquals(7L, (args[1] as GateCatalogGenerator.Num).bits)
    }

    private fun source(className: String): String {
        val repo = if (File("src/main/kotlin").isDirectory) File("..") else File(".")
        val file = File(repo, "extensions/pinedrama/src/main/java/app/morphe/extension/pinedrama/featuregatelab/$className.java")
        assertTrue("$file is missing", file.isFile)
        return file.readText()
    }
}
