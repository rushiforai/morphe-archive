package patches.gboard

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.google.gson.JsonArray
import com.google.gson.JsonElement
import com.google.gson.JsonObject
import com.google.gson.JsonParser
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeTrue
import org.junit.Test
import patches.gboard.shared.generated.GboardVersionBindings

/**
 * The Custom Theme runtime resolves Gboard's theme classes from
 * `gboard-custom-theme-bindings.json`, which the extension build compiles into
 * `GboardCustomThemeVersionBindings`. The patched handlers use [GboardVersionBindings] instead,
 * so the two must describe the same 18.6.3 classes: a stale profile makes every import fail at
 * runtime with "The theme could not be verified or installed", the 18.6.3 bug this test guards.
 *
 * Supply GBOARD_ORIGINAL_APK to also require every declared target to exist in the APK.
 */
class CustomThemeBindingsTest {
    private val profile: JsonObject by lazy {
        JsonParser.parseString(bindingsFile().readText()).asJsonObject
    }

    private fun bindingsFile(): File = listOf(
        File("src/main/resources/gboard/gboard-custom-theme-bindings.json"),
        File("patches/src/main/resources/gboard/gboard-custom-theme-bindings.json"),
    ).firstOrNull(File::isFile)
        ?: error("gboard-custom-theme-bindings.json not found from ${File(".").absolutePath}")

    private fun binding(name: String): JsonObject =
        profile.getAsJsonObject("bindings").getAsJsonObject(name)

    private fun jsonString(name: String, key: String): String =
        binding(name).get(key).asString

    private fun jsonStrings(name: String, key: String): List<String> =
        (binding(name).get(key) as JsonArray).map(JsonElement::getAsString)

    @Test
    fun profileTargetsThePatchedGboardVersion() {
        assertEquals(GboardVersionBindings.targetVersion, profile.get("target_version").asString)
    }

    @Test
    fun runtimeBindingsMatchThePatchedContract() {
        listOf(
            "custom_theme_plus_handler" to GboardVersionBindings.customThemePlusHandler,
            "custom_theme_result_handler" to GboardVersionBindings.customThemeResultHandler,
            "custom_theme_peer_result_handler" to GboardVersionBindings.customThemePeerResultHandler,
            "custom_theme_launcher_launch" to GboardVersionBindings.customThemeLauncherLaunch,
            "custom_theme_validator" to GboardVersionBindings.customThemeValidator,
        ).forEach { (name, target) ->
            assertEquals("$name class", target.ownerDescriptor, jsonString(name, "class_type"))
            assertEquals("$name method", target.name, jsonString(name, "method_name"))
            assertEquals(
                "$name parameters",
                target.parameterTypes,
                jsonStrings(name, "parameter_types"),
            )
            assertEquals("$name return", target.returnType, jsonString(name, "return_type"))
        }

        listOf(
            "custom_theme_fragment_peer_field" to
                GboardVersionBindings.customThemeFragmentPeerField,
            "custom_theme_peer_context_field" to
                GboardVersionBindings.customThemePeerContextField,
            "custom_theme_peer_launcher_field" to
                GboardVersionBindings.customThemePeerLauncherField,
        ).forEach { (name, target) ->
            assertEquals("$name class", target.ownerDescriptor, jsonString(name, "class_type"))
            assertEquals("$name field", target.name, jsonString(name, "field_name"))
            assertEquals("$name field type", target.type, jsonString(name, "field_type"))
        }
    }

    @Test
    fun declaredTargetsExistInTheTargetApk() {
        val path = System.getenv("GBOARD_ORIGINAL_APK")
        assumeTrue(
            "Set GBOARD_ORIGINAL_APK to check the profile against the APK",
            !path.isNullOrBlank(),
        )
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val byType = container.dexEntryNames
            .flatMap { entry -> container.getEntry(entry)!!.dexFile.classes }
            .associateBy { it.type }

        listOf(
            "custom_theme_plus_handler",
            "custom_theme_result_handler",
            "custom_theme_peer_result_handler",
            "custom_theme_launcher_launch",
            "custom_theme_validator",
        ).forEach { name ->
            val owner = byType[jsonString(name, "class_type")]
            assertTrue("$name owner is missing", owner != null)
            val method = owner!!.methods.singleOrNull {
                it.name == jsonString(name, "method_name") &&
                    it.parameterTypes == jsonStrings(name, "parameter_types") &&
                    it.returnType == jsonString(name, "return_type")
            }
            assertTrue("$name target is missing from ${owner.type}", method != null)
        }

        listOf(
            "custom_theme_fragment_peer_field",
            "custom_theme_peer_context_field",
            "custom_theme_peer_launcher_field",
        ).forEach { name ->
            val owner = byType[jsonString(name, "class_type")]
            assertTrue("$name owner is missing", owner != null)
            val field = owner!!.fields.singleOrNull {
                it.name == jsonString(name, "field_name") &&
                    it.type == jsonString(name, "field_type")
            }
            assertTrue("$name target is missing from ${owner.type}", field != null)
        }
    }
}
