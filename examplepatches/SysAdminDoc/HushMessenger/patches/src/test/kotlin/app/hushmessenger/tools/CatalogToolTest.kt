package app.hushmessenger.tools

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.resourcePatch
import app.hushmessenger.patches.controls.fixtureClass
import app.hushmessenger.patches.controls.fixtureMethod
import app.hushmessenger.patches.controls.lifecycleApk
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.file.Path
import java.security.MessageDigest
import java.util.zip.Adler32
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream
import org.junit.jupiter.api.io.TempDir
import kotlinx.serialization.json.*
import kotlin.test.*

class CatalogToolTest {
    @Test fun strippedClassSectionsMayRetainOnlyZeroFilledTails() {
        val store = MemoryDataStore()
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.getDefault(), (0..31).map {
            fixtureClass("Lfixture/Reserve$it;", listOf(fixtureMethod("Lfixture/Reserve$it;->run()V", "return-void", 1)))
        }))
        val data = store.data.copyOf()
        store.close()
        val bytes = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)
        bytes.putInt(96, 1)
        val gap = bytes.getInt(100) + 32
        val dataGap = bytes.getInt(gap + 24)
        data.fill(0, gap, bytes.getInt(108))
        val map = bytes.getInt(52)
        val sections = (0 until bytes.getInt(map)).map { map + 4 + it * 12 }
        for (type in listOf(6, 0x2000)) bytes.putInt(sections.single { bytes.getShort(it).toInt() == type } + 4, 1)
        val dataEnd = sections.map { bytes.getInt(it + 8) }.filter { it > dataGap }.min()
        data.fill(0, dataGap, dataEnd)
        for (corruptAt in listOf(null, gap, dataGap)) {
            data[gap] = 0
            data[dataGap] = 0
            if (corruptAt != null) data[corruptAt] = 1
            MessageDigest.getInstance("SHA-1").digest(data.copyOfRange(32, data.size)).copyInto(data, 12)
            bytes.putInt(8, Adler32().apply { update(data, 12, data.size - 12) }.value.toInt())
            if (corruptAt == null) CatalogTool.validateDex(data)
            else assertFails("Nonzero data cannot be treated as a stripped tail") { CatalogTool.validateDex(data) }
        }
    }

    @Test fun rebuiltApkMustContainParseableManifestResourcesAndEveryDex(@TempDir temporary: Path) {
        val sdk = File(requireNotNull(System.getenv("ANDROID_HOME")))
        val aapt2 = sdk.resolve("build-tools").listFiles()!!.sortedByDescending { it.name }
            .map { it.resolve(if (System.getProperty("os.name").startsWith("Windows")) "aapt2.exe" else "aapt2") }
            .first { it.isFile }
        val valid = lifecycleApk(temporary.resolve("valid"), listOf(fixtureClass("Lfixture/Valid;", listOf(
            fixtureMethod("Lfixture/Valid;->run()V", "return-void", 1)))))
        val entries = ZipFile(valid).use { zip -> zip.entries().asSequence().associate {
            it.name to zip.getInputStream(it).use { stream -> stream.readBytes() }
        } }.toMutableMap()
        entries["classes3.dex"] = entries.getValue("classes.dex")
        val empty = MemoryDataStore()
        DexPool.writeTo(empty, ImmutableDexFile(Opcodes.getDefault(), emptyList()))
        entries["classes2.dex"] = empty.data.copyOf()
        empty.close()
        for (broken in listOf(null, "AndroidManifest.xml", "resources.arsc", "classes.dex", "classes2.dex", "classes3.dex")) {
            val apk = temporary.resolve("${broken ?: "valid"}.apk").toFile()
            ZipOutputStream(apk.outputStream()).use { zip ->
                for ((name, data) in entries) {
                    zip.putNextEntry(ZipEntry(name))
                    zip.write(if (name == broken) "patched".toByteArray() else data)
                    zip.closeEntry()
                }
            }
            if (broken == null) CatalogTool.validateApk(apk, aapt2)
            else assertFails("Malformed $broken must fail") { CatalogTool.validateApk(apk, aapt2) }
        }
    }

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

    @Test fun optionsKeepTheirKeyTypeDefaultAndRequirement() {
        val catalog = CatalogTool.catalog("1", setOf(app.hushmessenger.patches.misc.spoofPackageVersionPatch))
        val option = catalog.getValue("patches").jsonArray.single().jsonObject.getValue("options").jsonArray.single().jsonObject
        assertEquals("versionCode", option.getValue("key").jsonPrimitive.content)
        assertEquals("Version code", option.getValue("title").jsonPrimitive.content)
        assertEquals("kotlin.Int", option.getValue("type").jsonPrimitive.content)
        assertEquals(2147483647, option.getValue("default").jsonPrimitive.int)
        assertTrue(option.getValue("required").jsonPrimitive.boolean)
        assertEquals(JsonObject(emptyMap()), option.getValue("values"))
        assertEquals(catalog, Json.parseToJsonElement(catalog.toString()))
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
            .map { it.groupValues[1] }.toSet() + CatalogTool.NON_CONTROL_PATCHES + "Material You theme" + "View stories anonymously" + "Save any story" + "Slide chats in and out"
        CatalogTool.validateDefinitions(patch, ui, manifest, names)
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch.replace("controlPatch(\"people\"", "controlPatch(\"changed\""), ui, manifest, names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui.replace("{\"people\",", "{\"changed\","), manifest, names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("hush.feature.people", "hush.feature.changed"), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("hush.feature.people", "hush.feature.ads"), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("android:value=\"true\"", "android:value=\"false\""), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest, names - "Hide inbox ads") }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest, names - "Clone install under another package name") }
    }

    @Test fun stringOptionsAreListedInKeyOrder() {
        val entry = CatalogTool.catalog("1", setOf(bytecodePatch("Clone", default = false) {
            stringOption("cloneAppName", "Copy", null, "App name", "The name under the icon.", true) { it != null }
            stringOption("clonePackageName", "com.example.copy", null, "Package name", "The package name.", true) { it != null }
        }))["patches"]!!.jsonArray.single().jsonObject
        assertEquals(false, entry["default"]!!.jsonPrimitive.boolean)
        assertEquals(listOf("cloneAppName", "clonePackageName"), entry["options"]!!.jsonArray.map { it.jsonObject["key"]!!.jsonPrimitive.content })
        assertEquals(JsonObject(linkedMapOf(
            "key" to JsonPrimitive("clonePackageName"),
            "title" to JsonPrimitive("Package name"),
            "description" to JsonPrimitive("The package name."),
            "required" to JsonPrimitive(true),
            "type" to JsonPrimitive("kotlin.String"),
            "default" to JsonPrimitive("com.example.copy"),
            "values" to JsonObject(emptyMap()),
        )), entry["options"]!!.jsonArray[1])
        assertFailsWith<IllegalArgumentException> {
            CatalogTool.catalog("1", setOf(bytecodePatch("Untitled") { stringOption("bare", "a", null, null, null, false) }))
        }
    }
}
