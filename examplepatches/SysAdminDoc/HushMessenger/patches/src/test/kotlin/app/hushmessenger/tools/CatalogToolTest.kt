package app.hushmessenger.tools

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
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
import java.util.Properties
import java.util.jar.JarOutputStream
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
        val dependency = patch(description = "Fixture dependency") { }
        val feature = patch("Quoted \"patch\"", "Line one\nLine two", default = false) {
            category("Example")
            dependsOn(dependency)
            compatibleWith(Compatibility("com.example.app", "Example", targets = listOf(
                AppTarget("582", versionCodes = null, minSdk = 28, description = "346611369, 346611423 and 346611438"),
            )))
        }
        val catalog = CatalogTool.catalog("1.2.3", setOf(feature))
        assertEquals(catalog, Json.parseToJsonElement(catalog.toString()))
        val entry = catalog.getValue("patches").jsonArray.single().jsonObject
        assertEquals("Quoted \"patch\"", entry.getValue("name").jsonPrimitive.content)
        assertEquals("Line one\nLine two", entry.getValue("description").jsonPrimitive.content)
        assertFalse(entry.getValue("default").jsonPrimitive.boolean)
        assertEquals("Example", entry.getValue("category").jsonPrimitive.content)
        val dependencyEntry = entry.getValue("dependencies").jsonArray.single().jsonObject
        assertEquals("Patch", dependencyEntry.getValue("type").jsonPrimitive.content)
        assertEquals("Fixture dependency", dependencyEntry.getValue("description").jsonPrimitive.content)
        val target = entry.getValue("compatiblePackages").jsonArray.single().jsonObject.getValue("targets").jsonArray.single().jsonObject
        assertEquals(JsonNull, target.getValue("versionCodes"))
        assertEquals("346611369, 346611423 and 346611438", target.getValue("description").jsonPrimitive.content)
    }

    @Test fun optionsKeepTheirKeyTypeDefaultAndRequirement() {
        val catalog = CatalogTool.catalog("1", setOf(app.hushmessenger.patches.misc.spoofPackageVersionPatch))
        val option = catalog.getValue("patches").jsonArray.single().jsonObject.getValue("options").jsonArray.single().jsonObject
        assertEquals("versionCode", option.getValue("key").jsonPrimitive.content)
        assertEquals("Version number", option.getValue("title").jsonPrimitive.content)
        assertEquals("kotlin.Int", option.getValue("type").jsonPrimitive.content)
        assertEquals(2147483647, option.getValue("default").jsonPrimitive.int)
        assertTrue(option.getValue("required").jsonPrimitive.boolean)
        assertEquals(JsonObject(emptyMap()), option.getValue("values"))
        assertEquals(catalog, Json.parseToJsonElement(catalog.toString()))
    }

    @Test fun catalogOrderIsIndependentOfDiscoveryOrder() {
        val first = patch("A", "First") { }
        val last = patch("Z", "Last") { }
        assertEquals(CatalogTool.catalog("1", linkedSetOf(first, last)), CatalogTool.catalog("1", linkedSetOf(last, first)))
    }

    @Test fun replacingNamedHiddenOrTransitiveDependenciesChangesTheCatalog() {
        fun snapshot(name: String?, description: String?, child: String) = CatalogTool.catalog("1", setOf(
            patch("Feature") {
                dependsOn(patch(name, description) { dependsOn(patch(child) { }) })
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
            .map { it.groupValues[1] }.toSet() + CatalogTool.NON_CONTROL_PATCHES + "Material You theme" + "View stories anonymously" + "Save any story" + "Slide chats in and out" +
            "Bold and italic text"
        assertTrue("people" in CatalogTool.validateDefinitions(patch, ui, manifest, names))
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch.replace("controlPatch(\"people\"", "controlPatch(\"changed\""), ui, manifest, names) }
        val constantKey = assertFailsWith<IllegalArgumentException> {
            CatalogTool.validateDefinitions(patch.replace("controlPatch(\"people\"", "controlPatch(PEOPLE"), ui, manifest, names)
        }
        assertContains(constantKey.message!!, "string literal")
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui.replace("{\"people\",", "{\"changed\","), manifest, names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("hush.feature.people", "hush.feature.changed"), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("hush.feature.people", "hush.feature.growth"), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest.replace("android:value=\"true\"", "android:value=\"false\""), names) }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest, names - "Hide Meta AI") }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validateDefinitions(patch, ui, manifest, names - "Clone install under another package name") }
    }

    @Test fun stringOptionsAreListedInKeyOrder() {
        val entry = CatalogTool.catalog("1", setOf(patch("Clone", default = false) {
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
            CatalogTool.catalog("1", setOf(patch("Untitled") { stringOption("bare", "a", null, null, null, false) }))
        }
    }

    private fun dex(vararg classes: com.android.tools.smali.dexlib2.iface.ClassDef): ByteArray {
        val store = MemoryDataStore()
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.getDefault(), classes.toList()))
        return store.data.copyOf().also { store.close() }
    }

    private val logoCall = "Lapp/hushmessenger/extension/Settings;->logoLongPressed(Landroid/content/Context;)V"

    /** Patch code naming one extension method and two control keys, as the built patches' hook code does. */
    private fun patcherDex(vararg strings: String) = dex(fixtureClass("Lapp/hushmessenger/patches/Fixture;", listOf(
        fixtureMethod("Lapp/hushmessenger/patches/Fixture;->hook()V",
            strings.joinToString("\n") { "const-string v0, \"$it\"" } + "\nreturn-void", 1))))

    private fun extensionDex(method: String = "logoLongPressed", vararg keys: String) = dex(fixtureClass(
        "Lapp/hushmessenger/extension/Settings;", listOf(fixtureMethod(
            "Lapp/hushmessenger/extension/Settings;->$method(Landroid/content/Context;)V",
            keys.joinToString("\n") { "const-string v0, \"$it\"" } + "\nreturn-void", 2))))

    /**
     * A structurally sound extension still has to be this bundle's: one with nothing of HushMessenger's, one missing a
     * method the hooks call and an older one missing a current control are all turned down.
     */
    @Test fun thePackagedExtensionMustHaveWhatThePatchesCall() {
        val keys = setOf("people", "ads")
        val patcher = patcherDex("invoke-static/range {p1 .. p1}, $logoCall", "people", "ads")
        val extension = extensionDex("logoLongPressed", "people", "ads")
        for (data in listOf(patcher, extension)) assertTrue(CatalogTool.validateDex(data) > 0)
        // The method reference and its class.
        assertEquals(2, CatalogTool.validateExtensionContract(patcher, extension, keys))
        val unrelated = assertFailsWith<IllegalArgumentException> { CatalogTool.validateExtensionContract(patcher, patcher, keys) }
        assertEquals("The extension has no Lapp/hushmessenger/extension/Settings;", unrelated.message)
        val missing = assertFailsWith<IllegalArgumentException> {
            CatalogTool.validateExtensionContract(patcher, extensionDex("settingsOpened", "people", "ads"), keys)
        }
        assertEquals("The extension has no $logoCall", missing.message)
        val older = assertFailsWith<IllegalArgumentException> {
            CatalogTool.validateExtensionContract(patcher, extensionDex("logoLongPressed", "people"), keys)
        }
        assertEquals("The extension has no ads control", older.message)
        val stale = assertFailsWith<IllegalArgumentException> {
            CatalogTool.validateExtensionContract(patcherDex("invoke-static/range {p1 .. p1}, $logoCall", "people"), extension, keys)
        }
        assertEquals("The patcher DEX has no ads control", stale.message)
        val nothing = assertFailsWith<IllegalArgumentException> {
            CatalogTool.validateExtensionContract(patcherDex("people", "ads"), extension, keys)
        }
        assertEquals("The patcher DEX names no extension code", nothing.message)
    }

    /** A getter joined on at patch time never sits in the DEX whole, so the check refuses it instead of passing it by. */
    @Test fun anExtensionReferenceFinishedAtPatchTimeIsRefused() {
        val keys = setOf("people")
        val extension = extensionDex("logoLongPressed", "people")
        for (joined in listOf("invoke-static {}, Lapp/hushmessenger/extension/Settings;->",
            "sget v0, Lapp/hushmessenger/extension/MaterialYouTheme;-> v1")) {
            val refused = assertFailsWith<IllegalArgumentException>(joined) {
                CatalogTool.validateExtensionContract(patcherDex("invoke-static/range {p1 .. p1}, $logoCall", joined, "people"), extension, keys)
            }
            assertTrue(refused.message!!.endsWith("at patch time, so it can't be checked"), refused.message)
        }
        // A whole member right after the arrow is an ordinary reference.
        assertEquals(2, CatalogTool.validateExtensionContract(patcherDex("invoke-static/range {p1 .. p1}, $logoCall", "people"), extension, keys))
    }

    @Test fun everyPatchClassInTheJarIsInThePatcherDex() {
        val patcher = patcherDex("people")
        CatalogTool.validatePatcherClasses(listOf("app/hushmessenger/patches/Fixture.class"), patcher)
        assertFailsWith<IllegalArgumentException> {
            CatalogTool.validatePatcherClasses(listOf("app/hushmessenger/patches/Fixture.class", "app/hushmessenger/patches/Newer.class"), patcher)
        }
        assertFailsWith<IllegalArgumentException> { CatalogTool.validatePatcherClasses(emptyList(), patcher) }
    }

    /** Missing on both sides is no match, so the catalog check can't call a bundle fresh by comparing nothing. */
    @Test fun aBundleAndSourceBothWithoutATimestampAreRefused() {
        CatalogTool.requireBundleTimestamp("1790552148000", "1790552148000")
        val missing = assertFailsWith<IllegalArgumentException> { CatalogTool.requireBundleTimestamp(null, null) }
        assertEquals("Source has no bundle timestamp", missing.message)
        val differs = assertFailsWith<IllegalArgumentException> { CatalogTool.requireBundleTimestamp(null, "1790552148000") }
        assertEquals("Bundle timestamp differs from source", differs.message)
        assertFailsWith<IllegalArgumentException> { CatalogTool.requireBundleTimestamp("", "") }
    }

    /** The manifest has to carry this source's timestamp and version, and a bundle and source that both lack a timestamp don't match. */
    @Test fun theBundleManifestMustMatchTheSource() {
        fun manifest(vararg pairs: Pair<String, String>) = java.util.jar.Manifest().apply {
            for ((name, value) in pairs) mainAttributes.putValue(name, value)
        }
        fun source(vararg pairs: Pair<String, String>) = java.util.Properties().apply { for ((name, value) in pairs) setProperty(name, value) }
        val fresh = manifest("Version" to "0.25.0", "Timestamp" to "1790552148000")
        assertEquals("0.25.0", CatalogTool.requireBundleMatchesSource(fresh,
            source("version" to "0.25.0", "bundleTimestampMillis" to "1790552148000")))
        val neither = assertFailsWith<IllegalArgumentException> {
            CatalogTool.requireBundleMatchesSource(manifest("Version" to "0.25.0"), source("version" to "0.25.0"))
        }
        assertEquals("Source has no bundle timestamp", neither.message)
        val stale = assertFailsWith<IllegalArgumentException> {
            CatalogTool.requireBundleMatchesSource(manifest("Version" to "0.25.0"),
                source("version" to "0.25.0", "bundleTimestampMillis" to "1790552148000"))
        }
        assertEquals("Bundle timestamp differs from source", stale.message)
        val older = assertFailsWith<IllegalArgumentException> {
            CatalogTool.requireBundleMatchesSource(fresh, source("version" to "0.26.0", "bundleTimestampMillis" to "1790552148000"))
        }
        assertEquals("Bundle version differs from source", older.message)
        assertFailsWith<IllegalArgumentException> {
            CatalogTool.requireBundleMatchesSource(manifest("Timestamp" to "1790552148000"), source("bundleTimestampMillis" to "1790552148000"))
        }
    }

    /** The check reads its bundle through readBundle, so a stale, unstamped, older or manifest-less bundle is refused there. */
    @Test fun theCatalogCheckReadsOnlyABundleBuiltFromThisSource(@TempDir temporary: Path) {
        val patcher = patcherDex("people")
        val extension = extensionDex("logoLongPressed", "people")
        fun bundle(name: String, vararg attributes: Pair<String, String>): File {
            val file = temporary.resolve(name).toFile()
            file.outputStream().use { out ->
                val zip = if (attributes.isEmpty()) ZipOutputStream(out) else JarOutputStream(out, java.util.jar.Manifest().apply {
                    mainAttributes.putValue("Manifest-Version", "1.0")
                    for ((key, value) in attributes) mainAttributes.putValue(key, value)
                })
                zip.use {
                    for ((entry, data) in listOf("classes.dex" to patcher, "extensions/messenger.mpe" to extension,
                        "app/hushmessenger/patches/Fixture.class" to ByteArray(4))) {
                        it.putNextEntry(ZipEntry(entry))
                        it.write(data)
                        it.closeEntry()
                    }
                }
            }
            return file
        }
        val source = Properties().apply { setProperty("version", "0.25.0"); setProperty("bundleTimestampMillis", "1790552148000") }
        val read = CatalogTool.readBundle(bundle("fresh.mpp", "Version" to "0.25.0", "Timestamp" to "1790552148000"), source)
        assertEquals("0.25.0", read.version)
        assertEquals(listOf("app/hushmessenger/patches/Fixture.class"), read.patchClasses)
        assertContentEquals(patcher, read.patcherDex)
        assertContentEquals(extension, read.extensionDex)
        for ((name, attributes, message) in listOf(
            Triple("stale.mpp", arrayOf("Version" to "0.25.0", "Timestamp" to "1790000000000"), "Bundle timestamp differs from source"),
            Triple("unstamped.mpp", arrayOf("Version" to "0.25.0"), "Bundle timestamp differs from source"),
            Triple("older.mpp", arrayOf("Version" to "0.24.0", "Timestamp" to "1790552148000"), "Bundle version differs from source"),
            Triple("bare.mpp", emptyArray<Pair<String, String>>(), "Bundle has no manifest"),
        )) {
            val refused = assertFailsWith<IllegalArgumentException>(name) { CatalogTool.readBundle(bundle(name, *attributes), source) }
            assertEquals(message, refused.message, name)
        }
        // A source without its own stamp matches nothing, not even a bundle that also has none.
        val unstamped = Properties().apply { setProperty("version", "0.25.0") }
        val neither = assertFailsWith<IllegalArgumentException> { CatalogTool.readBundle(bundle("neither.mpp", "Version" to "0.25.0"), unstamped) }
        assertEquals("Source has no bundle timestamp", neither.message)
    }

    /** A run that refuses its bundle, however early, leaves no success receipt from an earlier run behind. */
    @Test fun aRefusedBundleLeavesNoReceipt(@TempDir temporary: Path) {
        val receipt = temporary.resolve("catalog-evidence.json").toFile()
        receipt.writeText("{\"dexValidated\":true}\n")
        assertFails { CatalogTool.main(arrayOf("check", temporary.resolve("missing.mpp").toString(), temporary.toString(), receipt.path)) }
        assertFalse(receipt.exists())
    }
}
