package dev.jason.gboardpatches.patches.gboard.shared

import com.google.gson.JsonObject
import com.google.gson.JsonParser
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardFieldBinding
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardMethodBinding
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardVersionBindingsSourceTest {
    @Test
    fun `generated binding artifacts are pinned to LF in git attributes`() {
        val attributes = Files.readString(Path.of("../.gitattributes"))

        assertTrue(
            attributes.contains(
                "/patches/src/main/resources/gboard/gboard-version-bindings.json text eol=lf"
            )
        )
        assertTrue(
            attributes.contains(
                "/patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/" +
                    "shared/generated/GboardVersionBindings.kt text eol=lf"
            )
        )
    }

    private data class BindingSnapshot(
        val kind: String,
        val classType: String,
        val name: String,
        val parameterTypes: List<String>? = null,
        val returnType: String? = null,
        val fieldType: String? = null,
    )

    private val compiledBindings = linkedMapOf(
        "flag_bool_getter" to method(GboardVersionBindings.flagBoolGetter),
        "flag_name_field" to field(GboardVersionBindings.flagNameField),
        "gesture_dispatch" to method(GboardVersionBindings.gestureDispatch),
        "keyboard_extension_manager" to method(
            GboardVersionBindings.keyboardExtensionManager
        ),
        "keyboard_provider_request" to method(
            GboardVersionBindings.keyboardProviderRequest
        ),
        "pointer_cancel" to method(GboardVersionBindings.pointerCancel),
        "pointer_owner" to method(GboardVersionBindings.pointerOwner),
        "pointer_reset" to method(GboardVersionBindings.pointerReset),
        "soft_key_bind" to method(GboardVersionBindings.softKeyBind),
    )
    private val compiledPropertyNames = setOf(
        "flagBoolGetter",
        "flagNameField",
        "gestureDispatch",
        "keyboardExtensionManager",
        "keyboardProviderRequest",
        "pointerCancel",
        "pointerOwner",
        "pointerReset",
        "softKeyBind",
    )
    private val expectedConfidence = mapOf(
        "flag_bool_getter" to 1.0,
        "flag_name_field" to 1.0,
        "gesture_dispatch" to 0.9,
        "keyboard_extension_manager" to 1.0,
        "keyboard_provider_request" to 1.0,
        "pointer_cancel" to 0.9,
        "pointer_owner" to 0.9,
        "pointer_reset" to 0.9,
        "soft_key_bind" to 0.9,
    )

    @Test
    fun generatedTargetVersionIsExactly1777() {
        val manifest = parseManifest(loadManifestText())

        assertEquals("17.7.7", GboardVersionBindings.targetVersion)
        assertEquals("17.7.7", manifest.string("target_version"))
    }

    @Test
    fun generatedManifestContainsExactlyNineActiveBindings() {
        val bindings = parseManifest(loadManifestText()).getAsJsonObject("bindings")

        assertEquals(compiledBindings.keys.toSet(), bindings.keySet())
    }

    @Test
    fun compiledGeneratedInventoryContainsExactlyNineActiveBindings() {
        val compiledFields = GboardVersionBindings::class.java.declaredFields
            .filter { field ->
                field.type == GboardMethodBinding::class.java ||
                    field.type == GboardFieldBinding::class.java
            }
            .map { it.name }
            .toSet()

        assertEquals(compiledPropertyNames, compiledFields)
    }

    @Test
    fun classpathManifestExactlyMatchesCompiledGeneratedBindings() {
        assertManifestMatchesCompiled(parseManifest(loadManifestText()))
    }

    @Test
    fun validatorRejectsOneSidedManifestMutations() {
        val original = loadManifestText()
        val mutations = listOf(
            mutateOnce(original, "gboard-version-bindings.v1", "gboard-version-bindings.v2"),
            mutateOnce(
                original,
                "\"target_version\":\"${GboardVersionBindings.targetVersion}\"",
                "\"target_version\":\"unexpected\"",
            ),
            mutateOnce(original, "\"profile_version\":\"1.2.0\"", "\"profile_version\":\"9.9.9\""),
            mutateOnce(
                original,
                GboardVersionBindings.projectionSha256,
                "0".repeat(64),
            ),
            mutateOnce(
                original,
                "\"class_type\":\"${GboardVersionBindings.flagBoolGetter.classType}\"",
                "\"class_type\":\"Lchanged;\"",
            ),
            mutateOnce(
                original,
                "\"method_name\":\"${GboardVersionBindings.flagBoolGetter.name}\"",
                "\"method_name\":\"x\"",
            ),
            mutateOnce(original, "\"kind\":\"method\"", "\"kind\":\"field\""),
            mutateOnce(
                original,
                "\"parameter_types\":[\"Lowd;\",\"J\"]",
                "\"parameter_types\":[\"J\"]",
            ),
            mutateOnce(
                original,
                "\"field_type\":\"Ljava/lang/String;\"",
                "\"field_type\":\"I\"",
            ),
            mutateOnce(
                original,
                "\"return_type\":\"Ljava/lang/Object;\"",
                "\"return_type\":\"V\"",
            ),
            mutateOnce(
                original,
                "\"flag_bool_getter\":",
                "\"unexpected_binding\":",
            ),
            mutateOnce(original, "\"confidence\":1", "\"confidence\":0.5"),
        )

        mutations.forEach { mutated ->
            assertNotEquals(original, mutated)
            assertThrows(AssertionError::class.java) {
                assertManifestMatchesCompiled(parseManifest(mutated))
            }
        }
    }

    private fun assertManifestMatchesCompiled(manifest: JsonObject) {
        assertEquals(
            setOf(
                "format",
                "target_version",
                "profile_version",
                "projection_sha256",
                "bindings",
            ),
            manifest.keySet(),
        )
        assertEquals("gboard-version-bindings.v1", manifest.string("format"))
        assertEquals(
            GboardVersionBindings.targetVersion,
            manifest.string("target_version"),
        )
        assertEquals(
            GboardVersionBindings.profileVersion,
            manifest.string("profile_version"),
        )
        val projectionHash = manifest.string("projection_sha256")
        assertTrue(projectionHash.matches(Regex("[0-9a-f]{64}")))
        assertEquals(GboardVersionBindings.projectionSha256, projectionHash)

        val bindings = manifest.getAsJsonObject("bindings")
        assertEquals(compiledBindings.keys.toSet(), bindings.keySet())
        val compiledFields = GboardVersionBindings::class.java.declaredFields
            .filter { field ->
                field.type == GboardMethodBinding::class.java ||
                    field.type == GboardFieldBinding::class.java
            }
            .map { it.name }
            .toSet()
        assertEquals(compiledPropertyNames, compiledFields)
        compiledBindings.forEach { (key, expected) ->
            val actual = bindings.getAsJsonObject(key)
            val expectedProperties = if (expected.kind == "method") {
                setOf(
                    "kind",
                    "class_type",
                    "method_name",
                    "parameter_types",
                    "return_type",
                    "confidence",
                )
            } else {
                setOf(
                    "kind",
                    "class_type",
                    "field_name",
                    "field_type",
                    "confidence",
                )
            }
            assertEquals("Unexpected properties for $key", expectedProperties, actual.keySet())
            assertEquals("Wrong kind for $key", expected.kind, actual.string("kind"))
            assertEquals(
                "Wrong class descriptor for $key",
                expected.classType,
                actual.string("class_type"),
            )
            if (expected.kind == "method") {
                assertEquals(
                    "Wrong method name for $key",
                    expected.name,
                    actual.string("method_name"),
                )
                val parameters = actual.getAsJsonArray("parameter_types").map { item ->
                    assertTrue(
                        "Non-string parameter descriptor for $key",
                        item.isJsonPrimitive && item.asJsonPrimitive.isString,
                    )
                    item.asString
                }
                assertEquals(
                    "Wrong parameter descriptors for $key",
                    expected.parameterTypes,
                    parameters,
                )
                assertEquals(
                    "Wrong return descriptor for $key",
                    expected.returnType,
                    actual.string("return_type"),
                )
            } else {
                assertEquals(
                    "Wrong field name for $key",
                    expected.name,
                    actual.string("field_name"),
                )
                assertEquals(
                    "Wrong field descriptor for $key",
                    expected.fieldType,
                    actual.string("field_type"),
                )
            }

            val confidence = actual.get("confidence")
            assertTrue(
                "Confidence must be numeric for $key",
                confidence.isJsonPrimitive && confidence.asJsonPrimitive.isNumber,
            )
            assertTrue(
                "Confidence must be in [0,1] for $key",
                confidence.asDouble in 0.0..1.0,
            )
            assertEquals(
                "Unexpected reviewed confidence for $key",
                expectedConfidence.getValue(key),
                confidence.asDouble,
                0.0,
            )
        }
    }

    private fun JsonObject.string(name: String): String {
        val value = get(name)
        assertTrue(
            "$name must be a JSON string",
            value.isJsonPrimitive && value.asJsonPrimitive.isString,
        )
        return value.asString
    }

    private fun loadManifestText(): String {
        val stream = checkNotNull(
            javaClass.classLoader.getResourceAsStream(
                "gboard/gboard-version-bindings.json"
            )
        ) { "Generated Gboard bindings resource is missing from the test classpath" }
        return stream.bufferedReader(StandardCharsets.UTF_8).use { it.readText() }
    }

    private fun parseManifest(text: String): JsonObject =
        JsonParser.parseString(text).asJsonObject

    private fun mutateOnce(source: String, oldValue: String, newValue: String): String {
        assertTrue("Mutation source not found: $oldValue", source.contains(oldValue))
        return source.replaceFirst(oldValue, newValue)
    }

    private fun method(binding: GboardMethodBinding) = BindingSnapshot(
        kind = "method",
        classType = binding.classType,
        name = binding.name,
        parameterTypes = binding.parameterTypes,
        returnType = binding.returnType,
    )

    private fun field(binding: GboardFieldBinding) = BindingSnapshot(
        kind = "field",
        classType = binding.classType,
        name = binding.name,
        fieldType = binding.type,
    )
}
