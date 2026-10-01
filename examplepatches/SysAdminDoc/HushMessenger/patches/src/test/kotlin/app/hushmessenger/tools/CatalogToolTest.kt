package app.hushmessenger.tools

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import kotlinx.serialization.json.*
import kotlin.test.*

class CatalogToolTest {
    @Test fun metadataPreservesEscapingDefaultsDependenciesAndExactTargetDescription() {
        val dependency = resourcePatch(description = "Fixture dependency") { }
        val patch = bytecodePatch("Quoted \"patch\"", "Line one\nLine two", default = false) {
            category("Example")
            dependsOn(dependency)
            compatibleWith(Compatibility("com.example.app", "Example", targets = listOf(
                AppTarget("580", versionCodes = null, minSdk = 28, description = "346013387, 346013440 and 346013442"),
            )))
        }
        val catalog = CatalogTool.catalog("1.2.3", setOf(patch))
        assertEquals(catalog, Json.parseToJsonElement(catalog.toString()))
        val entry = catalog.getValue("patches").jsonArray.single().jsonObject
        assertEquals("Quoted \"patch\"", entry.getValue("name").jsonPrimitive.content)
        assertEquals("Line one\nLine two", entry.getValue("description").jsonPrimitive.content)
        assertFalse(entry.getValue("default").jsonPrimitive.boolean)
        assertEquals("Example", entry.getValue("category").jsonPrimitive.content)
        val dependencyEntry = entry.getValue("dependencies").jsonArray.single().jsonObject
        assertEquals("ResourcePatch", dependencyEntry.getValue("type").jsonPrimitive.content)
        assertEquals("Fixture dependency", dependencyEntry.getValue("description").jsonPrimitive.content)
        val target = entry.getValue("compatiblePackages").jsonArray.single().jsonObject.getValue("targets").jsonArray.single().jsonObject
        assertEquals(JsonNull, target.getValue("versionCodes"))
        assertEquals("346013387, 346013440 and 346013442", target.getValue("description").jsonPrimitive.content)
    }

    @Test fun catalogOrderIsIndependentOfDiscoveryOrder() {
        val first = resourcePatch("A", "First") { }
        val last = resourcePatch("Z", "Last") { }
        assertEquals(CatalogTool.catalog("1", linkedSetOf(first, last)), CatalogTool.catalog("1", linkedSetOf(last, first)))
    }

    @Test fun replacingNamedHiddenOrTransitiveDependenciesChangesTheCatalog() {
        fun snapshot(name: String?, description: String?, child: String) = CatalogTool.catalog("1", setOf(
            bytecodePatch("Feature") {
                dependsOn(resourcePatch(name, description) { dependsOn(resourcePatch(child) { }) })
            },
        ))
        assertNotEquals(snapshot("A", null, "Leaf"), snapshot("B", null, "Leaf"))
        assertNotEquals(snapshot(null, "Capability A", "Leaf"), snapshot(null, "Capability B", "Leaf"))
        assertNotEquals(snapshot(null, "Capability", "Leaf A"), snapshot(null, "Capability", "Leaf B"))
        assertFailsWith<IllegalArgumentException> { snapshot(null, null, "Leaf") }
    }

    @Test fun changedOrDuplicateControlKeysAndCapabilitiesFail() {
        val root = File("..")
        val patch = root.resolve("patches/src/main/kotlin/app/hushmessenger/patches/controls/MessengerControlsPatch.kt").readText()
        val ui = root.resolve("extensions/messenger/src/main/java/app/hushmessenger/extension/SettingsActivity.java").readText()
        val manifest = root.resolve("extensions/messenger/src/main/AndroidManifest.xml").readText()
        val names = Regex("""controlPatch\("[a-z_]+",\s*"([^"]+)"""").findAll(patch)
            .map { it.groupValues[1] }.toSet() + "Install beside Meta apps" + "Open settings from menu" + "Restore screens on re-signed builds" + "Material You theme" + "View stories anonymously" + "Save any story"
        CatalogTool.validateDefinitions(patch, ui, manifest, names)
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch.replace("controlPatch(\"people\"", "controlPatch(\"changed\""), ui, manifest, names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui.replace("{\"people\",", "{\"changed\","), manifest, names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("hush.feature.people", "hush.feature.changed"), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("hush.feature.people", "hush.feature.ads"), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("android:value=\"true\"", "android:value=\"false\""), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest, names - "Hide inbox ads") }
    }
}
