package app.hushmessenger.tools

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.hushmessenger.patches.controls.fixtureClass
import app.hushmessenger.patches.controls.fixtureMethod
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import java.util.zip.Adler32
import kotlinx.serialization.json.*
import kotlin.test.*

class CatalogToolTest {
    @Test fun aMethodCannotPointInsideAnotherParsedCodeItem() {
        val store = MemoryDataStore()
        val definition = fixtureClass("Lfixture/Overlapping;", listOf(
            fixtureMethod("Lfixture/Overlapping;->a()V", "return-void", 1),
            fixtureMethod("Lfixture/Overlapping;->b()V", "return-void", 1)))
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.getDefault(), listOf(definition)))
        val changed = store.data.copyOf()
        store.close()
        CatalogTool.validateDex(changed)
        val bytes = ByteBuffer.wrap(changed).order(ByteOrder.LITTLE_ENDIAN)
        val map = bytes.getInt(52)
        val codeEntry = (0 until bytes.getInt(map)).map { map + 4 + it * 12 }
            .single { bytes.getShort(it).toInt() == 0x2001 }
        assertEquals(2, bytes.getInt(codeEntry + 4))
        val code = bytes.getInt(codeEntry + 8)
        val end = (0 until bytes.getInt(map)).map { bytes.getInt(map + 4 + it * 12 + 8) }
            .filter { it > code }.min()
        bytes.putInt(codeEntry + 4, 1)
        bytes.putInt(code + 12, (end - code - 16) / 2)
        MessageDigest.getInstance("SHA-1").digest(changed.copyOfRange(32, changed.size)).copyInto(changed, 12)
        bytes.putInt(8, Adler32().apply { update(changed, 12, changed.size - 12) }.value.toInt())
        assertFails("The second method points inside the first code item") { CatalogTool.validateDex(changed) }
    }

    @Test fun mapDataCountsAndExtentsMustDescribeTheActualBytes() {
        val store = MemoryDataStore()
        val definition = fixtureClass("Lfixture/MapCounts;", listOf(fixtureMethod(
            "Lfixture/MapCounts;->run(I)V", "const-string v0, \"map data\"\nreturn-void", 2)))
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.getDefault(), listOf(definition)))
        val original = store.data
        store.close()
        CatalogTool.validateDex(original)
        val header = ByteBuffer.wrap(original).order(ByteOrder.LITTLE_ENDIAN)
        val map = header.getInt(52)
        for (index in 0 until header.getInt(map)) {
            val at = map + 4 + index * 12
            val type = header.getShort(at).toInt() and 0xffff
            if (type < 0x1001) continue
            val count = header.getInt(at + 4)
            for (size in listOf(-1, count + 1, count - 1)) {
                val changed = original.copyOf()
                val bytes = ByteBuffer.wrap(changed).order(ByteOrder.LITTLE_ENDIAN)
                bytes.putInt(at + 4, size)
                MessageDigest.getInstance("SHA-1").digest(changed.copyOfRange(32, changed.size)).copyInto(changed, 12)
                bytes.putInt(8, Adler32().apply { update(changed, 12, changed.size - 12) }.value.toInt())
                assertFails("Map type $type has false count $size") { CatalogTool.validateDex(changed) }
            }
        }
    }

    @Test fun malformedDexFailsEvenWhenItsChecksumsAreRecomputed() {
        val store = MemoryDataStore()
        val definition = fixtureClass("Lfixture/Example;", listOf(fixtureMethod(
            "Lfixture/Example;->run()V", "const-string v0, \"example\"\nreturn-void", 1)))
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.getDefault(), listOf(definition)))
        val original = store.data
        store.close()
        CatalogTool.validateDex(original)
        val header = ByteBuffer.wrap(original).order(ByteOrder.LITTLE_ENDIAN)
        for (offset in listOf(56, header.getInt(60), header.getInt(100), header.getInt(52))) {
            val changed = original.copyOf()
            val bytes = ByteBuffer.wrap(changed).order(ByteOrder.LITTLE_ENDIAN)
            bytes.putInt(offset, Int.MAX_VALUE)
            MessageDigest.getInstance("SHA-1").digest(changed.copyOfRange(32, changed.size)).copyInto(changed, 12)
            bytes.putInt(8, Adler32().apply { update(changed, 12, changed.size - 12) }.value.toInt())
            assertFails("Corrupt DEX structure at $offset") { CatalogTool.validateDex(changed) }
        }
    }

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
            .map { it.groupValues[1] }.toSet() + "Install beside Meta apps" + "Open settings from menu" + "Restore screens on re-signed builds" + "Material You theme" + "View stories anonymously" + "Save any story" + "Slide chats in and out"
        CatalogTool.validateDefinitions(patch, ui, manifest, names)
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch.replace("controlPatch(\"people\"", "controlPatch(\"changed\""), ui, manifest, names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui.replace("{\"people\",", "{\"changed\","), manifest, names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("hush.feature.people", "hush.feature.changed"), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("hush.feature.people", "hush.feature.ads"), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("android:value=\"true\"", "android:value=\"false\""), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest, names - "Hide inbox ads") }
    }
}
