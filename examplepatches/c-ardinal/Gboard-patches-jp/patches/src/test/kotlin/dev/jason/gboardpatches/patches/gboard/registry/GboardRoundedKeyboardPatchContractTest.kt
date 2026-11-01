package dev.jason.gboardpatches.patches.gboard.registry

import com.google.gson.JsonParser
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardRoundedKeyboardPatchContractTest {
    @Test
    fun `public patch and catalog expose the stable rounded keyboard contract`() {
        val catalog = JsonParser.parseString(
            Files.readString(root().resolve(CATALOG), StandardCharsets.UTF_8),
        ).asJsonObject
        val feature = catalog.getAsJsonArray("features")
            .map { it.asJsonObject }
            .single { it["feature_id"].asString == "rounded_keyboard_panel" }

        assertEquals("Rounded Keyboard Panel", feature["public_patch_name"].asString)
        assertEquals(
            "dev.jason.gboardpatches.feature.rounded_keyboard_panel",
            feature["feature_marker"].asString,
        )
        assertEquals("version-sensitive", feature["migration_scope"].asString)
        assertEquals(
            listOf("rounded_keyboard_panel.admission", "rounded_keyboard_panel.style"),
            feature.getAsJsonArray("contributions").map {
                it.asJsonObject["contribution_id"].asString
            },
        )
        assertEquals(
            listOf(1800, 1810),
            feature.getAsJsonArray("contributions").map { it.asJsonObject["order"].asInt },
        )
    }

    @Test
    fun `reviewed bindings and bytecode source stay target specific and fail closed`() {
        val bindings = JsonParser.parseString(
            Files.readString(root().resolve(BINDINGS), StandardCharsets.UTF_8),
        ).asJsonObject.getAsJsonObject("bindings")
        val required = setOf(
            "rounded_keyboard_admission",
            "rounded_keyboard_style_resolver",
            "rounded_keyboard_radii_type",
            "rounded_keyboard_radii_constructor",
            "rounded_keyboard_radii_values_field",
            "rounded_keyboard_radii_wrapper_type",
            "rounded_keyboard_radii_wrapper_radii_field",
            "rounded_keyboard_radii_wrapper_first_parameter_field",
            "rounded_keyboard_radii_wrapper_second_parameter_field",
            "rounded_keyboard_radii_wrapper_simple_constructor",
            "rounded_keyboard_radii_wrapper_parameterized_constructor",
        )
        assertTrue(bindings.keySet().containsAll(required))

        val source = Files.readString(root().resolve(BYTECODE), StandardCharsets.UTF_8)
        assertTrue(source.contains("jasondevApplyRoundedKeyboardRadii"))
        assertTrue(source.contains("Expected two rounded keyboard admission returns"))
        assertTrue(source.contains("Expected two rounded keyboard style returns"))
        assertTrue(source.contains("const/high16 v6, 0x42000000"))
        assertFalse(source.contains("XR"))
    }

    @Test
    fun `stock reference scan accepts compressed uniform radii`() {
        val source = Files.readString(root().resolve(BYTECODE), StandardCharsets.UTF_8)

        assertTrue(source.contains("array-length v1, v0"))
        assertTrue(source.contains("if-lez v1, :return_zero"))
        assertTrue(source.contains("if-ge v2, v1, :radii_scanned"))
    }

    @Test
    fun `wrapper scan continues only when exactly one wrapper was found`() {
        val source = Files.readString(root().resolve(BYTECODE), StandardCharsets.UTF_8)

        assertTrue(source.contains("if-gez v2, :return_stock"))
        assertTrue(source.contains("if-ltz v2, :return_stock"))
    }

    @Test
    fun `style helper delegates private field access to the owning classes`() {
        val source = Files.readString(root().resolve(BYTECODE), StandardCharsets.UTF_8)

        assertTrue(source.contains("WRAPPER_REFERENCE_RADIUS_HELPER"))
        assertTrue(source.contains("WRAPPER_COPY_WITH_RADII_HELPER"))
        assertFalse(source.contains("iget-object v4, v3, \$wrapperRadii"))
        assertFalse(source.contains("iget-object v4, v4, \$radiiValues"))
        assertFalse(source.contains("iget-object v4, v3, \$firstParameter"))
        assertFalse(source.contains("iget-object v5, v3, \$secondParameter"))
    }

    private fun root(): Path {
        val working = Path.of("").toAbsolutePath().normalize()
        return generateSequence(working) { it.parent }
            .first { Files.isRegularFile(it.resolve("settings.gradle.kts")) }
    }

    private companion object {
        const val CATALOG =
            "patches/src/main/resources/gboard/gboard-port-product-catalog.json"
        const val BINDINGS =
            "patches/src/main/resources/gboard/gboard-version-bindings.json"
        const val BYTECODE =
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "roundedkeyboard/GboardRoundedKeyboardBytecodePatch.kt"
    }
}
