package app.hushmessenger.tools

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.ReferenceType
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.dexbacked.raw.util.DexAnnotator
import com.android.tools.smali.dexlib2.iface.instruction.DualReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.UnknownInstruction
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import java.io.StringReader
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import java.util.Properties
import java.util.concurrent.TimeUnit
import java.util.jar.JarFile
import java.util.zip.Adler32
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory
import kotlinx.serialization.json.*
import org.w3c.dom.Element
import org.xml.sax.InputSource

/** Local tooling only. This class is excluded from the distributed bundle. */
object CatalogTool {
    private fun dependency(patch: Patch<*>, ancestors: Set<Patch<*>> = emptySet()): JsonObject {
        require(patch !in ancestors) { "Cyclic patch dependency" }
        require(!patch.name.isNullOrBlank() || !patch.description.isNullOrBlank()) {
            "Hidden dependencies need stable descriptions for the public catalog"
        }
        return JsonObject(linkedMapOf(
            "type" to JsonPrimitive(patch.javaClass.simpleName),
            "name" to JsonPrimitive(patch.name),
            "description" to JsonPrimitive(patch.description),
            "dependencies" to JsonArray(patch.dependencies.map { dependency(it, ancestors + patch) }.sortedBy { it.toString() }),
        ))
    }

    private fun optionValue(value: Any?): JsonElement = when (value) {
        null -> JsonNull
        is String -> JsonPrimitive(value)
        is Boolean -> JsonPrimitive(value)
        is Int, is Long -> JsonPrimitive(value as Number)
        else -> throw IllegalArgumentException("Option values of ${value.javaClass.name} need explicit catalog support")
    }

    // Patcher 1.15 deprecates Option.title in favor of name, but its option builders still take a
    // separate key and title, and name returns the key for those options.
    @Suppress("DEPRECATION")
    private fun options(patch: Patch<*>): JsonArray = JsonArray(patch.options.values.sortedBy { it.key }.map { option ->
        require(option.key.isNotBlank() && !option.title.isNullOrBlank() && !option.description.isNullOrBlank()) {
            "Options need a key, title and description for the public catalog"
        }
        JsonObject(linkedMapOf(
            "key" to JsonPrimitive(option.key),
            "title" to JsonPrimitive(option.title),
            "description" to JsonPrimitive(option.description),
            "required" to JsonPrimitive(option.required),
            "type" to JsonPrimitive(option.type.toString()),
            "default" to optionValue(option.default),
            "values" to JsonObject(option.values.orEmpty().entries.sortedBy { it.key }.associate { it.key to optionValue(it.value) }),
        ))
    })

    /** Visible patches that are neither a settings control nor one of the always-on fixes. */
    val NON_CONTROL_PATCHES = setOf("Install beside Meta apps", "Open settings from menu", "Restore screens on re-signed builds",
        "Spoof package version", "Clone install under another package name", "Custom new-message sound")

    fun catalog(version: String, patches: Set<Patch<*>>): JsonObject = JsonObject(linkedMapOf(
        "NOTE" to JsonPrimitive("Generated locally from the built MPP with :patches:generatePatchCatalog. Do not edit by hand."),
        "version" to JsonPrimitive(version),
        "patches" to JsonArray(patches.sortedBy { it.name }.map { patch ->
            require(patch.name != null) { "Unnamed patches need explicit catalog support" }
            JsonObject(linkedMapOf(
                "name" to JsonPrimitive(patch.name),
                "description" to JsonPrimitive(patch.description),
                "default" to JsonPrimitive(patch.default),
                "category" to JsonPrimitive(patch.category),
                "dependencies" to JsonArray(patch.dependencies.map { dependency(it) }.sortedBy { it.toString() }),
                "compatiblePackages" to (patch.compatibility?.let { compatible -> JsonArray(compatible.map { app ->
                    JsonObject(linkedMapOf(
                        "packageName" to JsonPrimitive(app.packageName),
                        "name" to JsonPrimitive(app.name),
                        "description" to JsonPrimitive(app.description),
                        "apkFileType" to JsonPrimitive(app.apkFileType?.name),
                        "appIconColor" to JsonPrimitive(app.appIconColor?.let { "#%06X".format(it) }),
                        "signatures" to (app.signatures?.let { JsonArray(it.sorted().map(::JsonPrimitive)) } ?: JsonNull),
                        "targets" to JsonArray(app.targets.map { target -> JsonObject(linkedMapOf(
                            "version" to JsonPrimitive(target.version),
                            "versionCodes" to (target.versionCodes?.let { codes ->
                                JsonObject(codes.entries.sortedBy { it.key.name }.associate { it.key.name to JsonPrimitive(it.value) })
                            } ?: JsonNull),
                            "isExperimental" to JsonPrimitive(target.isExperimental),
                            "minSdk" to JsonPrimitive(target.minSdk),
                            "description" to JsonPrimitive(target.description),
                        )) }),
                    ))
                }) } ?: JsonNull),
                "options" to options(patch),
            ))
        }),
    ))

    fun validateDefinitions(patchSource: String, uiSource: String, manifest: String, names: Set<String>): Int {
        val declarations = (Regex("""controlPatch\("([a-z_]+)",\s*"([^"]+)"""").findAll(patchSource)
            .map { it.groupValues[1] to it.groupValues[2] } +
            // Standalone patches that use recordControl directly instead of controlPatch:
            sequenceOf("material_you" to "Material You theme", "anonymous_stories" to "View stories anonymously",
                "save_stories" to "Save any story", "chat_animation" to "Slide chats in and out")).toList()
        val uiKeys = Regex("""^\s*\{"([a-z_]+)",""", RegexOption.MULTILINE).findAll(uiSource)
            .map { it.groupValues[1] }.toList()
        val factory = DocumentBuilderFactory.newInstance().apply {
            setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
        }
        val nodes = factory.newDocumentBuilder().parse(InputSource(StringReader(manifest))).getElementsByTagName("meta-data")
        val manifestKeys = (0 until nodes.length).map { nodes.item(it) as Element }
            .filter { it.getAttribute("android:name").startsWith("hush.feature.") }.map {
                require(it.getAttribute("android:value") == "true") { "Feature declarations must be true" }
                it.getAttribute("android:name").removePrefix("hush.feature.")
            }
        val keys = declarations.map { it.first }
        require(keys.isNotEmpty() && keys.distinct().size == keys.size) { "Expected distinct patch control keys" }
        require(uiKeys.size == keys.size && uiKeys.toSet() == keys.toSet()) { "Extension control keys differ from patches" }
        require(manifestKeys.size == keys.size && manifestKeys.toSet() == keys.toSet()) { "Manifest capabilities differ from patches" }
        require(declarations.map { it.second }.toSet().size == keys.size &&
            names == declarations.map { it.second }.toSet() + NON_CONTROL_PATCHES) { "Built patch names differ from control declarations" }
        return keys.size
    }

    fun validateDex(data: ByteArray): Int {
        require(data.size >= 112 && data.copyOfRange(0, 8).toString(Charsets.US_ASCII)
            .matches(Regex("dex\\n0(?:3[5-9]|40)\\u0000"))) { "Invalid DEX header" }
        val bytes = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)
        fun uint(offset: Int) = bytes.getInt(offset).toLong() and 0xffffffffL
        require(uint(32) == data.size.toLong() && uint(36) == 112L && uint(40) == 0x12345678L) { "Invalid DEX size or byte order" }
        require(MessageDigest.getInstance("SHA-1").digest(data.copyOfRange(32, data.size))
            .contentEquals(data.copyOfRange(12, 32))) { "Invalid DEX signature" }
        require(Adler32().apply { update(data, 12, data.size - 12) }.value == uint(8)) { "Invalid DEX checksum" }
        require(uint(44) == 0L && uint(48) == 0L) { "Linked DEX isn't an Android-ready bundle" }
        val sections = listOf(56 to 4, 64 to 4, 72 to 12, 80 to 8, 88 to 8, 96 to 32)
        for ((at, width) in sections) {
            val count = uint(at)
            val offset = uint(at + 4)
            require(if (count == 0L) offset == 0L else offset >= 112 && offset % 4 == 0L &&
                offset + count * width <= data.size) { "Invalid DEX section bounds" }
        }
        require(uint(108) >= 112 && uint(108) + uint(104) == data.size.toLong()) { "Invalid DEX data bounds" }
        val map = uint(52)
        require(map >= uint(108) && map % 4 == 0L && map + 4 <= data.size) { "Invalid DEX map offset" }
        val count = uint(map.toInt())
        require(count > 0 && map + 4 + count * 12 <= data.size) { "Invalid DEX map bounds" }
        val seenSections = mutableSetOf<Int>()
        val mapped = mutableListOf<Triple<Int, Long, Long>>()
        var previous = -1L
        for (index in 0 until count.toInt()) {
            val at = map.toInt() + 4 + index * 12
            val type = bytes.getShort(at).toInt() and 0xffff
            val size = uint(at + 4)
            val offset = uint(at + 8)
            require(bytes.getShort(at + 2).toInt() == 0 && seenSections.add(type) && size > 0 &&
                offset > previous && offset < data.size) { "Invalid DEX map entry" }
            require(type in 0..8 || type in 0x1000..0x1003 || type in 0x2000..0x2006 || type == 0xf000) { "Unknown DEX map section" }
            if (type == 0) require(size == 1L && offset == 0L) { "Invalid DEX header map entry" }
            if (type == 0x1000) require(size == 1L && offset == map) { "Invalid DEX map-list entry" }
            if (type in 1..6) {
                val header = sections[type - 1].first
                require(size == uint(header) && offset == uint(header + 4)) { "DEX map differs from header" }
            }
            previous = offset
            mapped += Triple(type, size, offset)
        }
        require(0 in seenSections && 0x1000 in seenSections) { "Incomplete DEX map" }
        var end = 112L
        for ((index, section) in sections.withIndex()) {
            val (at, width) = section
            if (uint(at) > 0) {
                require(index + 1 in seenSections && uint(at + 4) >= end) { "Missing or overlapping DEX identifier section" }
                end = uint(at + 4) + uint(at) * width
            }
        }
        val dex = DexBackedDexFile.fromInputStream(null, data.inputStream())
        // Lazy class traversal doesn't check unreferenced map data or its claimed counts.
        // Parse each complete section with the pinned library, bounded by the next section.
        for ((index, entry) in mapped.withIndex()) {
            val (type, size, offset) = entry
            val limit = mapped.getOrNull(index + 1)?.third ?: data.size.toLong()
            val alignment = if (type in 0x2000..0x2005 && type != 0x2001) 1 else 4
            val minimum = when (type) {
                0 -> 112L
                1, 2, 7, 0x1001, 0x1002, 0x1003, 0x2000, 0xf000 -> 4L
                3 -> 12L
                4, 5, 8 -> 8L
                6 -> 32L
                0x1000 -> 4 + count * 12
                0x2001, 0x2006 -> 16L
                0x2002 -> 2L
                0x2003, 0x2004 -> 3L
                else -> 1L
            }
            require(offset % alignment == 0L && size * minimum <= limit - offset &&
                (type < 0x1000 || offset >= uint(108))) { "Invalid DEX mapped section extent" }
            if (type == 0x2002) require(size == uint(56)) { "DEX string data count differs from identifiers" }
        }
        val starts = mutableMapOf<Int, MutableSet<Int>>()
        val annotator = object : DexAnnotator(dex, 120) {
            var activeType = 0
            override fun annotate(length: Int, message: String, vararg arguments: Any?) {
                if (length == 0 && message in setOf("[%d] %s", "[%d] %s: %s") &&
                    arguments.getOrNull(1) == requireNotNull(getAnnotator(activeType)).itemName) {
                    require(starts.getOrPut(activeType) { mutableSetOf() }.add(cursor)) { "Overlapping DEX item starts" }
                }
                super.annotate(length, message, *arguments)
            }
        }
        for ((index, entry) in mapped.withIndex()) {
            val (type, _, offset) = entry
            val limit = mapped.getOrNull(index + 1)?.third ?: data.size.toLong()
            annotator.setLimit(offset.toInt(), limit.toInt())
            annotator.activeType = type
            // writeAnnotations catches parser errors for a diagnostic dump. Call the parser directly.
            requireNotNull(annotator.getAnnotator(type)).annotateSection(annotator)
            val parsedEnd = annotator.cursor.toLong()
            val nextType = mapped.getOrNull(index + 1)?.first
            val nextAlignment = if (nextType in 0x2000..0x2005 && nextType != 0x2001) 1 else 4
            // Patcher's STRIP_FAST compacts class_defs and class_data, then zeroes their tails.
            // It preserves section offsets. Every other section still requires minimal padding.
            val strippedTail = type == 6 || type == 0x2000
            require(parsedEnd <= limit && (strippedTail || limit - parsedEnd < nextAlignment) &&
                (parsedEnd.toInt() until limit.toInt()).all { data[it] == 0.toByte() }) {
                "DEX map count leaves unparsed section bytes: type=${type.toString(16)}, parsed=$parsedEnd, limit=$limit, next=$nextType"
            }
            annotator.clearLimit()
        }
        fun reference(offset: Long, type: Int, optional: Boolean = true) {
            require((optional && offset == 0L) || (offset <= Int.MAX_VALUE && starts[type]?.contains(offset.toInt()) == true)) {
                "DEX reference doesn't point to a mapped item start"
            }
        }
        for (index in 0 until uint(56).toInt()) reference(uint(uint(60).toInt() + index * 4), 0x2002, false)
        for (index in 0 until uint(72).toInt()) reference(uint(uint(76).toInt() + index * 12 + 8), 0x1001)
        for (index in 0 until uint(96).toInt()) {
            val at = uint(100).toInt() + index * 32
            reference(uint(at + 12), 0x1001)
            reference(uint(at + 20), 0x2006)
            reference(uint(at + 24), 0x2000)
            reference(uint(at + 28), 0x2005)
        }
        for (at in starts[7].orEmpty()) reference(uint(at), 0x2005, false)
        for (at in starts[0x1002].orEmpty()) for (index in 0 until uint(at).toInt())
            reference(uint(at + 4 + index * 4), 0x1003)
        for (at in starts[0x1003].orEmpty()) for (index in 0 until uint(at).toInt())
            reference(uint(at + 4 + index * 4), 0x2004, false)
        for (at in starts[0x2006].orEmpty()) {
            reference(uint(at), 0x1003)
            val fields = uint(at + 4).toInt()
            val methods = uint(at + 8).toInt()
            val parameters = uint(at + 12).toInt()
            for (index in 0 until fields + methods + parameters)
                reference(uint(at + 20 + index * 8), if (index < fields + methods) 0x1003 else 0x1002, false)
        }
        for (at in starts[0x2001].orEmpty()) reference(uint(at + 8), 0x2003)
        for (at in starts[0x2000].orEmpty()) {
            val reader = dex.dataBuffer.readerAt(at)
            val staticFields = reader.readSmallUleb128()
            val instanceFields = reader.readSmallUleb128()
            val directMethods = reader.readSmallUleb128()
            val virtualMethods = reader.readSmallUleb128()
            repeat(staticFields + instanceFields) { reader.readSmallUleb128(); reader.readSmallUleb128() }
            repeat(directMethods + virtualMethods) {
                reader.readSmallUleb128(); reader.readSmallUleb128()
                reference(reader.readSmallUleb128().toLong(), 0x2001)
            }
        }
        // Dexlib uses lazy views. Force every identifier and the complete class/body data to be read.
        for (type in ReferenceType.STRING..ReferenceType.METHOD_PROTO) for (reference in dex.getReferences(type)) {
            reference.validateReference()
            reference.toString()
        }
        for (reference in dex.callSiteSection + dex.methodHandleSection) {
            reference.validateReference()
            reference.toString()
        }
        val classes = mutableSetOf<String>()
        for (definition in dex.classes) {
            require(classes.add(definition.type)) { "Duplicate DEX class" }
            for (method in definition.methods) for (instruction in method.implementation?.instructions ?: emptyList()) {
                require(instruction !is UnknownInstruction && instruction.codeUnits > 0) { "Unknown DEX instruction" }
                if (instruction is ReferenceInstruction) instruction.reference.validateReference()
                if (instruction is DualReferenceInstruction) instruction.reference2.validateReference()
            }
        }
        val rebuilt = MemoryDataStore()
        try { DexPool.writeTo(rebuilt, dex) } finally { rebuilt.close() }
        return classes.size
    }

    fun validateApk(apk: File, aapt2: File) {
        require(aapt2.isFile) { "Android Build Tools aapt2 is required" }
        ZipFile(apk).use { zip ->
            val entries = zip.entries().asSequence().toList()
            require(entries.map { it.name }.distinct().size == entries.size) { "Duplicate APK entry" }
            require(setOf("AndroidManifest.xml", "resources.arsc", "classes.dex").all { zip.getEntry(it) != null }) {
                "Incomplete APK"
            }
            for (entry in entries.filter { Regex("classes(?:[0-9]+)?\\.dex").matches(it.name) }) {
                try { validateDex(zip.getInputStream(entry).use { it.readBytes() }) }
                catch (error: IllegalArgumentException) { throw IllegalArgumentException("${entry.name}: ${error.message}", error) }
            }
        }
        for (arguments in listOf(listOf("xmltree", "--file", "AndroidManifest.xml"), listOf("resources"))) {
            val process = ProcessBuilder(listOf(aapt2.absolutePath, "dump") + arguments + apk.absolutePath)
                .redirectOutput(ProcessBuilder.Redirect.DISCARD).redirectError(ProcessBuilder.Redirect.INHERIT).start()
            try {
                require(process.waitFor(120, TimeUnit.SECONDS) && process.exitValue() == 0) {
                    "Invalid APK ${arguments.first()}"
                }
            } finally {
                if (process.isAlive) process.destroyForcibly().waitFor()
            }
        }
    }

    @JvmStatic fun main(args: Array<String>) {
        if (args.size == 3 && args[0] == "apk") {
            validateApk(File(args[1]), File(args[2]))
            println("Rebuilt manifest, resources and every DEX passed structural validation")
            return
        }
        require(args.size in 3..4 && args[0] in setOf("generate", "check")) { "Expected generate|check, MPP path, repository root and optional evidence path" }
        require(runCatching { Class.forName("app.hushmessenger.patches.MessengerTarget") }.isFailure) {
            "Loose patch classes are on the tool classpath; refusing to bypass the built MPP"
        }
        val bundle = File(args[1])
        val root = File(args[2])
        val properties = Properties().apply { root.resolve("gradle.properties").reader().use(::load) }
        val version = JarFile(bundle).use { jar ->
            require(jar.getEntry("classes.dex") != null && jar.getEntry("extensions/messenger.mpe") != null) { "Incomplete Android bundle" }
            require(jar.entries().asSequence().map { it.name }.toList().let { it.size == it.toSet().size }) { "Duplicate bundle entry" }
            for (name in listOf("classes.dex", "extensions/messenger.mpe")) {
                require(validateDex(jar.getInputStream(jar.getEntry(name)).use { it.readBytes() }) > 0) {
                    "Bundle DEX contains no classes"
                }
            }
            require(jar.manifest.mainAttributes.getValue("Timestamp") == properties.getProperty("bundleTimestampMillis")) { "Bundle timestamp differs from source" }
            jar.manifest.mainAttributes.getValue("Version")
        }
        require(version == properties.getProperty("version")) { "Bundle version differs from source" }
        val patches = loadPatchesFromJar(setOf(bundle))
        val patchNames = patches.map { requireNotNull(it.name) }.toSet()
        require(patches.size == patchNames.size) { "Duplicate visible patch names" }
        val controls = validateDefinitions(
            root.resolve("patches/src/main/kotlin/app/hushmessenger/patches/controls/MessengerControlsPatch.kt").readText(),
            root.resolve("extensions/messenger/src/main/java/app/hushmessenger/extension/SettingsActivity.java").readText(),
            root.resolve("extensions/messenger/src/main/AndroidManifest.xml").readText(), patchNames,
        )
        val document = catalog(version, patches)
        val output = Json { prettyPrint = true }.encodeToString(JsonObject.serializer(), document) + "\n"
        val report = args.getOrNull(3)?.let(::File) ?: root.resolve("patches/build/reports/catalog-evidence.json")
        report.parentFile.mkdirs()
        val digest = MessageDigest.getInstance("SHA-256").digest(bundle.readBytes()).joinToString("") { "%02x".format(it) }
        val published = root.resolve("patches-list.json")
        if (args[0] == "generate") published.writeText(output)
        else require(published.isFile && Json.parseToJsonElement(published.readText()) == document) {
            "Public catalog differs from the built MPP; run :patches:generatePatchCatalog"
        }
        report.writeText(JsonObject(linkedMapOf("bundle" to JsonPrimitive(bundle.name), "sha256" to JsonPrimitive(digest),
            "dexValidated" to JsonPrimitive(true), "controlCount" to JsonPrimitive(controls), "catalog" to document)).toString() + "\n")
        println("Catalog ${args[0]} passed: ${patches.size} patches, $controls control keys, built bundle $version, DEX structurally checked")
    }
}
