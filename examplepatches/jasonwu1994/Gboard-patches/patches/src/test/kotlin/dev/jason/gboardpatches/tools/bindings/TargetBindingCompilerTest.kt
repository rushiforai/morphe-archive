package dev.jason.gboardpatches.tools.bindings

import com.google.gson.JsonParser
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class TargetBindingCompilerTest {
    @Test
    fun `valid profile compiles to a deterministic LF projection`() {
        val profile =
            """{"format":"gboard-version-bindings.v1","target_version":"18.0.0","profile_version":"2.0.0","bindings":{"sample_parameter_type":{"kind":"type","source":{"binding":"sample_method","component":"parameter","index":0},"confidence":1},"sample_method":{"kind":"method","class_type":"Lsample/Owner;","method_name":"run","parameter_types":["I"],"return_type":"V","confidence":1}}}"""

        val projection = TargetBindingCompiler.compile(profile)

        assertEquals("18.0.0", projection.targetVersion)
        assertEquals("2.0.0", projection.profileVersion)
        assertEquals(64, projection.sourceSha256.length)
        assertFalse(projection.kotlinSource.contains('\r'))
        assertEquals(projection, TargetBindingCompiler.compile(profile))
        assertEquals(
            """package dev.jason.gboardpatches.patches.gboard.shared.generated

import dev.jason.gboardpatches.patches.gboard.shared.GboardFieldTarget
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.GboardTypeTarget

internal object GboardVersionBindings {
    const val targetVersion = "18.0.0"
    const val profileVersion = "2.0.0"
    const val sourceSha256 = "4cfa24da7ff50824baed933ec3045ab988f62e29d3263be37324509afc332062"

    val `sampleMethod` = GboardMethodTarget(
        classType = "Lsample/Owner;",
        name = "run",
        parameterTypes = listOf("I"),
        returnType = "V",
    )

    val `sampleParameterType` = GboardTypeTarget("I")
}
""",
            projection.kotlinSource,
        )
    }

    @Test
    fun `type roles cannot drift from their source method coordinate`() {
        val profile =
            """{"format":"gboard-version-bindings.v1","target_version":"18.0.0","profile_version":"2.0.0","bindings":{"sample_method":{"kind":"method","class_type":"Lsample/Owner;","method_name":"run","parameter_types":["I"],"return_type":"V","confidence":1},"sample_parameter_type":{"kind":"type","source":{"binding":"sample_method","component":"parameter","index":1},"confidence":1}}}"""

        assertThrows(IllegalArgumentException::class.java) {
            TargetBindingCompiler.compile(profile)
        }
    }

    @Test
    fun `Kotlin keywords are backticked and control characters are rejected before rendering`() {
        val keywordProfile =
            """{"format":"gboard-version-bindings.v1","target_version":"18.0.0","profile_version":"2.0.0","bindings":{"import":{"kind":"method","class_type":"Lsample/Owner;","method_name":"run","parameter_types":[],"return_type":"V","confidence":1}}}"""
        val controlCharacterProfile =
            """{"format":"gboard-version-bindings.v1","target_version":"18.0.0","profile_version":"2.0.0","bindings":{"sample_method":{"kind":"method","class_type":"Lsample/Owner;","method_name":"run\naway","parameter_types":[],"return_type":"V","confidence":1}}}"""

        assertTrue(TargetBindingCompiler.compile(keywordProfile).kotlinSource.contains("val `import` ="))
        assertThrows(IllegalArgumentException::class.java) {
            TargetBindingCompiler.compile(controlCharacterProfile)
        }
    }

    @Test
    fun `invalid descriptors are rejected at the compiler seam`() {
        val profile =
            """{"format":"gboard-version-bindings.v1","target_version":"18.0.0","profile_version":"2.0.0","bindings":{"sample_method":{"kind":"method","class_type":"sample.Owner","method_name":"run","parameter_types":[],"return_type":"V","confidence":1}}}"""

        val error = assertThrows(IllegalArgumentException::class.java) {
            TargetBindingCompiler.compile(profile)
        }

        assertTrue(error.message.orEmpty().contains("sample_method.class_type"))
    }

    @Test
    fun `authoritative profile matches the generated build projection`() {
        val profile = Files.readString(
            Path.of("src/main/resources/gboard/gboard-version-bindings.json"),
            StandardCharsets.UTF_8,
        )
        val generated = Files.readString(
            Path.of(
                "build/generated/sources/versionBindings/kotlin/main/dev/jason/" +
                    "gboardpatches/patches/gboard/shared/generated/GboardVersionBindings.kt"
            ),
            StandardCharsets.UTF_8,
        )

        val projection = TargetBindingCompiler.compile(profile)
        assertEquals(AUTHORITATIVE_SOURCE_SHA256, projection.sourceSha256)
        assertEquals(REQUIRED_BINDINGS, JsonParser.parseString(profile).asJsonObject
            .getAsJsonObject("bindings").keySet())
        assertEquals(projection.kotlinSource, generated)

        val missingRequiredBinding = JsonParser.parseString(profile).asJsonObject
        missingRequiredBinding.getAsJsonObject("bindings").remove("soft_key_bind")
        assertThrows(IllegalArgumentException::class.java) {
            TargetBindingCompiler.compile(missingRequiredBinding.toString())
        }
    }

    private companion object {
        const val AUTHORITATIVE_SOURCE_SHA256 =
            "1fae018db1f194f479b87fff4cc76dc75928506f3528a6f9e192dbc4fab8cbad"
        val REQUIRED_BINDINGS = setOf(
            "advanced_voice_asr_session_reset",
            "advanced_voice_formatter_constructor",
            "advanced_voice_initial_settings",
            "advanced_voice_mdd_provider_constructor",
            "advanced_voice_native_readiness",
            "advanced_voice_s3_network_availability",
            "ai_writing_tools_ambiguity_constructor",
            "ai_writing_tools_classification_run",
            "ai_writing_tools_classifier_init",
            "ai_writing_tools_gen_ai_init",
            "ai_writing_tools_module_predicate",
            "ai_writing_tools_nga_input_refresh",
            "ai_writing_tools_proto_value",
            "ai_writing_tools_smart_edit_init",
            "ai_writing_tools_smart_edit_request",
            "flag_bool_getter",
            "flag_name_field",
            "gesture_dispatch",
            "gesture_dispatcher_type",
            "keyboard_completion_callback_type",
            "keyboard_definition_type",
            "keyboard_extension_manager",
            "keyboard_provider_request",
            "long_press_quick_actions_input_event",
            "pointer_cancel",
            "pointer_owner",
            "pointer_owner_type",
            "pointer_reset",
            "soft_key_bind",
            "soft_key_metadata_type",
        )
    }
}
