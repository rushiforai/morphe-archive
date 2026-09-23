package app.morphe

import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.apksig.internal.apk.AndroidBinXmlParser
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.DexFile
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The view ids the extension looks up by name on the phone, held against the TikTok build the
 * bundle declares.
 *
 * <p>Those lookups happen at run time, so a renamed id used to surface as a switch that did nothing
 * on somebody's phone. Most of the names are the three character ones TikTok's build makes up, and
 * each build hands the same names out again, at nearly the same index, mostly to other views:
 * g6r is 0x7f0a2170 on both 46.9.3 and 47.0.3, the share sheet's on one and the like button's on
 * the other. Every name here exists in every retained build from 46.2.3 on, so a name that
 * resolves proves very little. What `view-id-anchors.txt` adds is an owner, a class with a real
 * name whose code loads the id. VideoDiggAssem loading g6r's id says g6r is still the like button,
 * and a build that hands g6r to something else fails here instead of on a phone. An id that only
 * layout XML sets is held through the layout instead: the feed cell's inflater loads the survey
 * layouts, and the survey card's id has to be one of the ids those layouts set.
 *
 * <p>The table has to list exactly the lookups the code makes, so it can't fall behind the code.
 * Older fixtures only report what they cover, since the bundle doesn't claim them.
 */
class RuntimeViewIdAnchorsTest {
    @Test
    fun `the anchor table lists exactly the view ids the extension looks up`() {
        val table = anchors().map { it.lookup }.toSet()
        val code = lookups()
        assertTrue("could not find any id lookup in the extension", code.isNotEmpty())
        val missing = code - table
        val stale = table - code
        assertTrue(
            "The extension looks these ids up and view-id-anchors.txt doesn't list them. Add a line " +
                "with the package and, where one exists, a class of the target that loads the id:\n" +
                missing.joinToString("\n"),
            missing.isEmpty(),
        )
        assertTrue(
            "view-id-anchors.txt lists lookups the extension no longer makes, or makes with other " +
                "names or in another order:\n" + stale.joinToString("\n"),
            stale.isEmpty(),
        )
    }

    /**
     * A group names one view. Its second name used to be the 46.x name of the same view, tried when
     * the current one found nothing, and on 47.0.3 each of those names some other view, which the
     * fallback then hid or read. A group may keep more than one name only with a reason in
     * [MORE_THAN_ONE_NAME], and that list only shrinks: a group that drops its extra names fails
     * here until its entry goes too.
     */
    @Test
    fun `a group looks up more than one name only for a reason the test records`() {
        val several = anchors().filter { it.names.size > 1 }.map { it.lookup }.toSortedSet()
        assertEquals(
            "Groups that try more than one name. On the target a second name is an older build's " +
                "name for the view, now some other view, so drop it; or record why the group needs " +
                "both in MORE_THAN_ONE_NAME. A recorded group that has one name now loses its entry.",
            MORE_THAN_ONE_NAME.keys.toSortedSet(),
            several,
        )
    }

    @Test
    fun `every anchor resolves on the declared target and its owner loads the id`() {
        val compatibility = AppCompatibilities.tiktok4703().single()
        val version = checkNotNull(compatibility.targets.single().version)
        val targets = Fixtures.files {
            it.extension == "apk" && (it.name.contains("_$version-") || it.name == "tiktok-$version.apk")
        }
        val anchors = anchors()
        for (apk in targets) {
            val coverage = coverage(apk, anchors, checkNotNull(compatibility.packageName))
            // Every group has had an owner since fdaec7f8. A group that only resolves passes
            // whatever view TikTok hands its name to next, so a missing owner fails like a broken one.
            val failures = coverage.filter { it.state != State.OWNED }.map {
                "${it.anchor.lookup}: " +
                    if (it.state == State.UNOWNED) "no owner holds it (${it.detail})" else it.detail
            }
            assertEquals("${apk.name} (the declared $version target)", emptyList<String>(), failures)
            println("${apk.name}: ${coverage.count { it.state == State.OWNED }} owners load their id")
        }
    }

    /**
     * TikTok hands its short names out again on every build, mostly to other views: on 46.7.3 to
     * 46.9.3 no owner loads the id of any name its group lists, and only the ids with real names
     * (desc, title, view_rootview and the like) still hold.
     */
    @Test
    fun `older fixtures report which anchors they cover`() {
        val compatibility = AppCompatibilities.tiktok4703().single()
        val version = checkNotNull(compatibility.targets.single().version)
        val older = Fixtures.apks().filter { !it.name.contains("_$version-") && it.name != "tiktok-$version.apk" }
        val anchors = anchors()
        for (apk in older) {
            val coverage = coverage(apk, anchors, checkNotNull(compatibility.packageName))
            val broken = coverage.filter { it.state == State.BROKEN }
            println("${apk.name}: ${coverage.count { it.state == State.OWNED }} of " +
                "${anchors.count { it.owner != null }} owners load the id of the first name their group " +
                "defines; ${broken.size} groups don't hold")
            broken.forEach { println("  ${it.anchor.lookup}: ${it.detail}") }
        }
        if (older.isEmpty()) println("No fixture older than $version to report on.")
    }

    @Test
    fun `the resource table reader finds entries in every chunk and entry layout it reads`() {
        for ((flags, compact) in listOf(0 to false, SPARSE to false, OFFSET16 to false, 0 to true)) {
            for (layouts in listOf(false, true)) {
                val table = syntheticTable(flags, compact, layouts)
                val label = "type chunk flags $flags, compact entries $compact, layouts $layouts"
                assertEquals(
                    label,
                    mapOf("com.example" to mapOf("first" to listOf(0x7f020000), "third" to listOf(0x7f020002))),
                    ResourceIds.read(table),
                )
                assertEquals(
                    label,
                    if (layouts) mapOf("com.example" to mapOf(
                        0x7f030000 to listOf("res/a/first.xml"), 0x7f030002 to listOf("res/a/third.xml")))
                    else emptyMap(),
                    ResourceIds.files(table, "layout"),
                )
            }
        }
    }

    @Test
    fun `semantic owners reject an unrelated id for every group that needs one`() {
        val version = checkNotNull(AppCompatibilities.tiktok4703().single().targets.single().version)
        val apk = Fixtures.files {
            it.extension == "apk" && (it.name.contains("_$version-") || it.name == "tiktok-$version.apk")
        }.single()
        val wrongNames = mapOf(
            "share/ShareSheetTools.java|ACTIONS_LIST_IDS|a5t" to "k0k",
            "comment/CommentTools.java|DISLIKE_BUTTON_IDS|k0k" to "a5t",
            "comment/CommentTools.java|DISLIKE_ICON_IDS|mmt" to "a5t",
            "captions/CaptionStyle.java|TEXT_ID|dlr" to "k0k",
        )
        val changed = anchors().map { anchor ->
            wrongNames[anchor.lookup]?.let { anchor.copy(names = listOf(it)) } ?: anchor
        }
        val rejected = coverage(apk, changed, checkNotNull(
            AppCompatibilities.tiktok4703().single().packageName,
        )).filter { it.anchor.lookup in wrongNames && it.state == State.BROKEN }
            .map { it.anchor.lookup }.toSet()
        assertEquals(wrongNames.keys, rejected)
    }

    private data class Anchor(
        val lookup: String,
        val names: List<String>,
        val packageSuffix: String,
        val owner: Owner?,
    )

    private sealed interface Owner {
        /** A real-named class loads the id directly. */
        data class ClassLiteral(val className: String) : Owner

        /** A real-named class loads a layout that sets the id. */
        data class LayoutClass(val className: String) : Owner

        /** One method loads both the id and this semantic string. */
        data class MethodString(val value: String) : Owner

        /** A class that declares this real method name loads the id somewhere in that class. */
        data class ClassMethod(val name: String) : Owner
    }

    private enum class State { OWNED, UNOWNED, BROKEN }

    private class Coverage(val anchor: Anchor, val state: State, val detail: String)

    /**
     * Where each anchor stands on one APK: the first name it defines is the one the code will use
     * there, so that is the one its owner has to load.
     */
    private fun coverage(apk: File, anchors: List<Anchor>, appPackage: String): List<Coverage> {
        val tables = ResourceIds.read(apk)
        val classOwners = anchors.mapNotNull { anchor ->
            when (val owner = anchor.owner) {
                is Owner.ClassLiteral -> owner.className
                is Owner.LayoutClass -> owner.className
                else -> null
            }
        }.map(::descriptor).toSet()
        val loaded = literalsLoadedBy(apk, classOwners)
        val semanticIds = anchors.mapNotNull { anchor ->
            if (anchor.owner !is Owner.MethodString && anchor.owner !is Owner.ClassMethod) {
                return@mapNotNull null
            }
            val packageName = if (anchor.packageSuffix == "app") appPackage else "$appPackage.${anchor.packageSuffix}"
            val ids = tables[packageName].orEmpty()
            anchor.names.firstOrNull { it in ids }?.let { ids.getValue(it).singleOrNull() }
        }.toSet()
        val semantic = semanticLiteralsLoadedBy(
            apk,
            semanticIds,
            anchors.mapNotNull { (it.owner as? Owner.MethodString)?.value }.toSet(),
            anchors.mapNotNull { (it.owner as? Owner.ClassMethod)?.name }.toSet(),
        )
        // Every package's layouts in one map: an id carries its package in its top byte.
        val layouts = if (anchors.none { it.owner is Owner.LayoutClass }) emptyMap()
            else ResourceIds.files(apk, "layout").values.fold(mutableMapOf<Int, List<String>>()) { all, one -> all.apply { putAll(one) } }
        val setIn = mutableMapOf<String, Set<Int>>()
        return ZipFile(apk).use { zip -> anchors.map { anchor ->
            val packageName = if (anchor.packageSuffix == "app") appPackage else "$appPackage.${anchor.packageSuffix}"
            val ids = tables[packageName].orEmpty()
            val used = anchor.names.firstOrNull { it in ids }
            val candidates = used?.let { ids.getValue(it) }.orEmpty()
            val owner = anchor.owner
            when {
                used == null -> Coverage(anchor, State.BROKEN, "$packageName defines none of ${anchor.names}")
                // Two entries under one name: an invented short name that is also a real one. The
                // lookup on the phone lands on one of them, and which one is the platform's choice.
                candidates.size > 1 -> Coverage(anchor, State.BROKEN,
                    "$packageName gives $used ${candidates.size} ids, ${candidates.joinToString { hex(it) }}")
                owner == null -> Coverage(anchor, State.UNOWNED, "resolves as $used")
                owner is Owner.LayoutClass -> {
                    val literals = loaded[descriptor(owner.className)]
                        ?: return@map Coverage(anchor, State.BROKEN, "there is no class ${owner.className}")
                    val paths = literals.flatMap { layouts[it].orEmpty() }.distinct()
                    val setting = paths.filter { path ->
                        candidates.single() in setIn.getOrPut(path) { idsSetIn(zip, path) }
                    }
                    when {
                        setting.isNotEmpty() -> Coverage(anchor, State.OWNED,
                            "${owner.className} loads ${setting.first()}, which sets $used")
                        paths.isEmpty() -> Coverage(anchor, State.BROKEN,
                            "${owner.className} loads no layout")
                        else -> Coverage(anchor, State.BROKEN,
                            "none of the ${paths.size} layouts ${owner.className} loads sets " +
                                "${hex(candidates.single())}, the id of $used")
                    }
                }
                owner is Owner.ClassLiteral -> {
                    val literals = loaded[descriptor(owner.className)]
                        ?: return@map Coverage(anchor, State.BROKEN, "there is no class ${owner.className}")
                    if (candidates.single() in literals) {
                        Coverage(anchor, State.OWNED, "${owner.className} loads $used")
                    } else {
                        val others = anchor.names.filter { name -> ids[name].orEmpty().any { it in literals } }
                        Coverage(anchor, State.BROKEN,
                            "${owner.className} doesn't load ${hex(candidates.single())}, the id of $used" +
                                if (others.isEmpty()) ", nor the id of any other name in the group"
                                else "; it loads the id of ${others.joinToString()}")
                    }
                }
                owner is Owner.MethodString -> {
                    val literals = semantic.methodStrings[owner.value].orEmpty()
                    if (candidates.single() in literals) Coverage(anchor, State.OWNED,
                        "a method that names ${owner.value} loads $used")
                    else Coverage(anchor, State.BROKEN,
                        "no method that names ${owner.value} loads ${hex(candidates.single())}, the id of $used")
                }
                owner is Owner.ClassMethod -> {
                    val literals = semantic.classMethods[owner.name].orEmpty()
                    if (candidates.single() in literals) Coverage(anchor, State.OWNED,
                        "a class that declares ${owner.name} loads $used")
                    else Coverage(anchor, State.BROKEN,
                        "no class that declares ${owner.name} loads ${hex(candidates.single())}, the id of $used")
                }
                else -> error("unsupported owner $owner")
            }
        } }
    }

    /** Every android:id a compiled layout sets, on any element. */
    private fun idsSetIn(zip: ZipFile, path: String): Set<Int> {
        val entry = zip.getEntry(path) ?: return emptySet()
        val parser = AndroidBinXmlParser(ByteBuffer.wrap(zip.getInputStream(entry).use { it.readBytes() }))
        val ids = mutableSetOf<Int>()
        while (true) {
            when (parser.next()) {
                AndroidBinXmlParser.EVENT_END_DOCUMENT -> return ids
                AndroidBinXmlParser.EVENT_START_ELEMENT -> for (i in 0 until parser.attributeCount) {
                    if (parser.getAttributeNameResourceId(i) == ANDROID_ID &&
                        parser.getAttributeValueType(i) == AndroidBinXmlParser.VALUE_TYPE_REFERENCE
                    ) ids += parser.getAttributeIntValue(i)
                }
            }
        }
    }

    private fun descriptor(className: String) = "L" + className.replace('.', '/') + ";"

    private fun hex(id: Int) = "0x%08x".format(id)

    private class SemanticLiterals(
        val methodStrings: Map<String, Set<Int>>,
        val classMethods: Map<String, Set<Int>>,
    )

    /**
     * The ids tied to semantics that survive R8: either a string in the same method, or a real
     * method name declared by the class. This is for views whose loaders and layout names are both
     * obfuscated. A literal is indexed only when it is one of [targetIds], so reading the whole APK
     * does not retain the rest of TikTok's constants.
     */
    private fun semanticLiteralsLoadedBy(
        apk: File,
        targetIds: Set<Int>,
        methodStrings: Set<String>,
        classMethods: Set<String>,
    ): SemanticLiterals {
        val byString = methodStrings.associateWith { mutableSetOf<Int>() }.toMutableMap()
        val byMethod = classMethods.associateWith { mutableSetOf<Int>() }.toMutableMap()
        if (targetIds.isEmpty()) return SemanticLiterals(byString, byMethod)

        fun scan(dexFile: DexFile) {
            for (classDef in dexFile.classes) {
                val methods = classDef.methods.toList()
                val declared = methods.map { it.name }.toSet()
                val classHits = mutableSetOf<Int>()
                for (method in methods) {
                    val instructions = method.implementation?.instructions?.toList() ?: continue
                    val hits = instructions.filterIsInstance<NarrowLiteralInstruction>()
                        .map { it.narrowLiteral }.filter { it in targetIds }.toSet()
                    if (hits.isEmpty()) continue
                    classHits += hits
                    val strings = instructions.filterIsInstance<ReferenceInstruction>()
                        .mapNotNull { (it.reference as? StringReference)?.string }.toSet()
                    for (value in methodStrings) if (value in strings) byString.getValue(value) += hits
                }
                for (name in classMethods) {
                    if (name in declared) byMethod.getValue(name) += classHits
                }
            }
        }

        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        for (entry in container.dexEntryNames) scan(container.getEntry(entry)!!.dexFile)
        ZipFile(apk).use { zip ->
            val modules = zip.entries().asSequence().filter { FEATURE_DEX.matches(it.name) }
                .distinctBy { it.name.substringAfterLast('/') }.toList()
            for (module in modules) {
                ZipInputStream(zip.getInputStream(module)).use { inner ->
                    generateSequence { inner.nextEntry }.filter { it.name.matches(Regex("classes\\d*\\.dex")) }
                        .forEach { scan(DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(inner.readBytes()))) }
                }
            }
        }
        return SemanticLiterals(byString, byMethod)
    }

    /**
     * Every literal each of [owners] loads in any of its methods, one dex file at a time: the
     * APK's own and each dynamic feature module's. TikTok ships a module's code as a zip holding
     * its dex, named lib/<abi>/libdex_<module>.so, the same file under every ABI.
     */
    private fun literalsLoadedBy(apk: File, owners: Set<String>): Map<String, Set<Int>> {
        val found = mutableMapOf<String, MutableSet<Int>>()
        if (owners.isEmpty()) return found
        fun scan(dexFile: DexFile) {
            for (classDef in dexFile.classes) {
                if (classDef.type !in owners) continue
                val literals = found.getOrPut(classDef.type) { mutableSetOf() }
                for (method in classDef.methods) {
                    for (instruction in method.implementation?.instructions ?: continue) {
                        when (instruction) {
                            is NarrowLiteralInstruction -> literals += instruction.narrowLiteral
                            is ArrayPayload -> instruction.arrayElements.forEach { literals += it.toInt() }
                        }
                    }
                }
            }
        }
        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        for (entry in container.dexEntryNames) scan(container.getEntry(entry)!!.dexFile)
        ZipFile(apk).use { zip ->
            val modules = zip.entries().asSequence().filter { FEATURE_DEX.matches(it.name) }
                .distinctBy { it.name.substringAfterLast('/') }.toList()
            for (module in modules) {
                ZipInputStream(zip.getInputStream(module)).use { inner ->
                    generateSequence { inner.nextEntry }.filter { it.name.matches(Regex("classes\\d*\\.dex")) }.forEach {
                        scan(DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(inner.readBytes())))
                    }
                }
            }
        }
        return found
    }

    private fun anchors(): List<Anchor> {
        val text = checkNotNull(javaClass.getResourceAsStream("/view-id-anchors.txt")) {
            "view-id-anchors.txt is missing from the test resources"
        }.bufferedReader().readText()
        val anchors = text.lineSequence().map { it.trim() }.filter { it.isNotEmpty() && !it.startsWith("#") }.map { line ->
            val fields = line.split('|')
            assertEquals("a line of view-id-anchors.txt needs five fields: $line", 5, fields.size)
            val (source, group, names, packageSuffix, ownerField) = fields
            assertTrue("bad package in: $line", packageSuffix.matches(Regex("[a-z][a-z0-9_]*")))
            val owner = when {
                ownerField == "-" -> null
                ownerField.startsWith(LAYOUT_OWNER) -> {
                    val className = ownerField.removePrefix(LAYOUT_OWNER)
                    assertTrue("bad layout owner in: $line", className.matches(CLASS_NAME))
                    Owner.LayoutClass(className)
                }
                ownerField.startsWith(METHOD_STRING_OWNER) -> {
                    val value = ownerField.removePrefix(METHOD_STRING_OWNER)
                    assertTrue("empty method string owner in: $line", value.isNotBlank())
                    Owner.MethodString(value)
                }
                ownerField.startsWith(CLASS_METHOD_OWNER) -> {
                    val name = ownerField.removePrefix(CLASS_METHOD_OWNER)
                    assertTrue("bad class method owner in: $line", name.matches(METHOD_NAME))
                    Owner.ClassMethod(name)
                }
                else -> {
                    assertTrue("bad owner in: $line", ownerField.matches(CLASS_NAME))
                    Owner.ClassLiteral(ownerField)
                }
            }
            Anchor(
                lookup = "$source|$group|$names",
                names = names.split(','),
                packageSuffix = packageSuffix,
                owner = owner,
            )
        }.toList()
        val repeated = anchors.groupBy { it.lookup }.filterValues { it.size > 1 }.keys
        assertTrue("lines listed twice: $repeated", repeated.isEmpty())
        return anchors
    }

    /** `source|group|names` for every id the extension looks up by a name written into its code. */
    private fun lookups(): Set<String> {
        val repo = if (File("src/main/kotlin").isDirectory) File("..") else File(".")
        val root = File(repo, EXTENSION)
        assertTrue("could not find the extension sources from ${File(".").absolutePath}", root.isDirectory)
        val found = sortedSetOf<String>()
        root.walkTopDown().filter { it.extension == "java" }.forEach { file ->
            val text = file.readText()
            if (!LOOKS_UP_IDS.containsMatchIn(text)) return@forEach
            val source = file.relativeTo(root).invariantSeparatorsPath
            DECLARATION.findAll(text).forEach { match ->
                val (group, value) = match.destructured
                val names = LITERAL.findAll(value).map { it.groupValues[1] }.toList()
                assertTrue(
                    "$source declares $group as something other than plain string literals: $value",
                    names.isNotEmpty() && value.replace(LITERAL, "").trim('{', '}', ' ', ',', '\n', '\r', '\t').isEmpty(),
                )
                found += "$source|$group|${names.joinToString(",")}"
            }
            INLINE.findAll(text).forEach { found += "$source|inline|${it.groups[1]?.value ?: it.groups[2]!!.value}" }
        }
        return found
    }

    private fun syntheticTable(flags: Int, compact: Boolean, layouts: Boolean): ByteBuffer {
        val out = ByteBuffer.allocate(4096).order(ByteOrder.LITTLE_ENDIAN)
        fun chunk(type: Int, headerSize: Int, body: () -> Unit) {
            val start = out.position()
            out.putShort(type.toShort()).putShort(headerSize.toShort()).putInt(0)
            body()
            while (out.position() % 4 != 0) out.put(0)
            out.putInt(start + 4, out.position() - start)
        }
        fun pool(strings: List<String>) = chunk(0x0001, 28) {
            val start = out.position() - 8
            out.putInt(strings.size).putInt(0).putInt(0x100).putInt(28 + 4 * strings.size).putInt(0)
            val encoded = strings.map { it.toByteArray(Charsets.UTF_8) }
            var offset = 0
            for (bytes in encoded) { out.putInt(offset); offset += bytes.size + 3 }
            check(out.position() - start == 28 + 4 * strings.size)
            for (bytes in encoded) { out.put(bytes.size.toByte()).put(bytes.size.toByte()).put(bytes).put(0) }
        }
        // Entries first at index 0, nothing at 1, third at 2, with key strings 0 and 1. An id entry
        // is written as its header alone; a layout entry carries a string value, the index of its
        // path in the table's pool: a full entry as a Res_value after the header, a compact one in
        // the header's second word, with the value's type in the top byte of its flags.
        fun typeChunk(typeId: Int, withValues: Boolean) = chunk(0x0201, 20 + 4) {
            val start = out.position() - 8
            out.put(typeId.toByte()).put(flags.toByte()).putShort(0)
            val count = if (flags and SPARSE != 0) 2 else 3
            out.putInt(count)
            val entriesStart = out.position()
            out.putInt(0)
            out.putInt(4)
            val size = if (withValues && !compact) 16 else 8
            when {
                flags and SPARSE != 0 -> out.putShort(0).putShort(0).putShort(2).putShort((size / 4).toShort())
                flags and OFFSET16 != 0 -> out.putShort(0).putShort(0xffff.toShort()).putShort((size / 4).toShort()).putShort(0)
                else -> out.putInt(0).putInt(-1).putInt(size)
            }
            out.putInt(entriesStart, out.position() - start)
            for (key in 0..1) {
                // A full entry is its size, its flags and a 32 bit key; a compact one puts
                // a 16 bit key where the size goes and flags it.
                when {
                    compact && withValues -> out.putShort(key.toShort()).putShort((0x0008 or (0x03 shl 8)).toShort()).putInt(key)
                    compact -> out.putShort(key.toShort()).putShort(0x0008).putInt(0)
                    withValues -> out.putShort(8).putShort(0).putInt(key).putShort(8).put(0).put(0x03).putInt(key)
                    else -> out.putShort(8).putShort(0).putInt(key)
                }
            }
        }
        chunk(0x0002, 12) {
            out.putInt(1)
            pool(if (layouts) listOf("res/a/first.xml", "res/a/third.xml") else emptyList())
            chunk(0x0200, 288) {
                val start = out.position() - 8
                out.putInt(0x7f)
                "com.example".forEach { out.putChar(it) }
                repeat(128 - "com.example".length) { out.putChar(0.toChar()) }
                val offsets = out.position()
                out.putInt(0).putInt(0).putInt(0).putInt(0).putInt(0)
                out.putInt(offsets, out.position() - start)
                pool(if (layouts) listOf("attr", "id", "layout") else listOf("attr", "id"))
                out.putInt(offsets + 8, out.position() - start)
                pool(listOf("first", "third"))
                typeChunk(2, withValues = false)
                if (layouts) typeChunk(3, withValues = true)
            }
        }
        out.flip()
        return out
    }

    private companion object {
        const val EXTENSION = "extensions/tiktok/src/main/java/app/morphe/extension/tiktok"
        const val SPARSE = 0x01
        const val OFFSET16 = 0x02

        /** A file that looks views up by resource name. */
        val LOOKS_UP_IDS = Regex("""ResourceIdCache|getIdentifier\([^;]*"id"""")

        /** A constant holding one or more names: `LIKE_BUTTON_IDS = {"g6r", "fws"}`, `NAME_ID = "title"`. */
        val DECLARATION = Regex(
            """static\s+final\s+String(?:\[])?\s+([A-Z][A-Z0-9_]*(?:_IDS?|_RESOURCE_NAMES?))\s*=\s*""" +
                """(?:new\s+String\[]\s*)?(\{[^}]*}|"[^"]*")\s*;"""
        )

        /** A name written straight into a lookup: `resolve(resources, PACKAGE, "view_rootview", false)`. */
        val INLINE = Regex(
            """\.resolve\(\s*(?:[^,;()]|\([^()]*\))+,\s*(?:[^,;()]|\([^()]*\))+,\s*"([^"]+)"|""" +
                """getIdentifier\(\s*"([^"]+)"\s*,\s*"id""""
        )

        val LITERAL = Regex(""""([^"]*)"""")
        val CLASS_NAME = Regex("""[a-z][A-Za-z0-9_]*(\.[A-Za-z_][A-Za-z0-9_$]*)+""")
        val METHOD_NAME = Regex("""[A-Za-z_$][A-Za-z0-9_$]*""")

        /** An owner written `layout:<class>`: the class loads a layout that sets the id. */
        const val LAYOUT_OWNER = "layout:"
        /** An owner written `method-string:<text>`: one method loads the id and the text. */
        const val METHOD_STRING_OWNER = "method-string:"
        /** An owner written `class-method:<name>`: a class declaring the method loads the id. */
        const val CLASS_METHOD_OWNER = "class-method:"
        const val ANDROID_ID = 0x010100d0

        /** A dynamic feature module's code: `lib/arm64-v8a/libdex_df_search_biz.so`. */
        val FEATURE_DEX = Regex("""lib/[^/]+/libdex_[^/]+\.so""")

        /** The groups that may look up more than one name, as `source|group|names`, and why. */
        val MORE_THAN_ONE_NAME = mapOf<String, String>(
        )
    }
}

/**
 * The `id` entries of an APK's resource table, by package name and then entry name, with every id
 * a name has in the order of the entries. A name normally has one. TikTok 47.0.3 gives ten names
 * two or three, some because a made-up short name like `url` or `tv1` matches a real one. And the
 * file each entry of a file type such as `layout` points to. Only as much of the format as that
 * takes: the table's value strings, the package chunks, their type and key string pools and the
 * type chunks, in the dense, sparse and 16 bit offset layouts, with full or compact entries.
 */
internal object ResourceIds {
    private const val STRING_POOL = 0x0001
    private const val TABLE = 0x0002
    private const val PACKAGE = 0x0200
    private const val TYPE = 0x0201
    private const val SPARSE = 0x01
    private const val OFFSET16 = 0x02
    private const val COMPLEX = 0x0001
    private const val COMPACT = 0x0008
    private const val TYPE_STRING = 0x03

    fun read(apk: File): Map<String, Map<String, List<Int>>> = read(tableOf(apk))

    fun read(table: ByteBuffer): Map<String, Map<String, List<Int>>> {
        check(u16(table, 0) == TABLE) { "not a resource table" }
        val packages = linkedMapOf<String, MutableMap<String, MutableList<Int>>>()
        forEachChunk(table, u16(table, 2), table.limit()) { start, type ->
            if (type == PACKAGE) readIds(table, PackageHeader(table, start), packages)
        }
        return packages
    }

    /**
     * The files the entries of [typeName] point to, by package name and then id, one path for each
     * configuration that has one. A layout entry holds a string from the table's own pool: the path
     * of its compiled XML inside the APK.
     */
    fun files(apk: File, typeName: String): Map<String, Map<Int, List<String>>> = files(tableOf(apk), typeName)

    fun files(table: ByteBuffer, typeName: String): Map<String, Map<Int, List<String>>> {
        check(u16(table, 0) == TABLE) { "not a resource table" }
        var values: StringPool? = null
        val packages = linkedMapOf<String, MutableMap<Int, MutableList<String>>>()
        forEachChunk(table, u16(table, 2), table.limit()) { start, type ->
            when (type) {
                STRING_POOL -> if (values == null) values = StringPool(table, start)
                PACKAGE -> readFiles(table, PackageHeader(table, start), typeName,
                    checkNotNull(values) { "a package comes before the table's string pool" }, packages)
                else -> Unit
            }
        }
        return packages
    }

    private fun tableOf(apk: File): ByteBuffer {
        val bytes = ZipFile(apk).use { zip ->
            val entry = checkNotNull(zip.getEntry("resources.arsc")) { "${apk.name} has no resources.arsc" }
            zip.getInputStream(entry).use { it.readBytes() }
        }
        return ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
    }

    private class PackageHeader(table: ByteBuffer, val start: Int) {
        val headerSize = u16(table, start + 2)
        val end = start + table.getInt(start + 4)
        val id = table.getInt(start + 8)
        val name = buildString {
            for (i in 0 until 128) {
                val c = table.getChar(start + 12 + 2 * i)
                if (c == '\u0000') break
                append(c)
            }
        }
        val typeNames = StringPool(table, start + table.getInt(start + 268))
        val keys = StringPool(table, start + table.getInt(start + 276))
        private val typeIdOffset = if (headerSize >= 288) table.getInt(start + 284) else 0

        fun typeId(typeName: String) =
            (0 until typeNames.count).firstOrNull { typeNames[it] == typeName }?.let { it + 1 + typeIdOffset }
    }

    private fun readIds(table: ByteBuffer, header: PackageHeader, into: MutableMap<String, MutableMap<String, MutableList<Int>>>) {
        val idType = header.typeId("id") ?: return
        val ids = into.getOrPut(header.name) { linkedMapOf() }
        forEachChunk(table, header.start + header.headerSize, header.end) { chunk, type ->
            if (type != TYPE || u8(table, chunk + 8) != idType) return@forEachChunk
            forEachEntry(table, chunk) { index, entry ->
                val id = (header.id shl 24) or (idType shl 16) or index
                val sameName = ids.getOrPut(header.keys[keyOf(table, entry)]) { mutableListOf() }
                // Another configuration's chunk repeats the entries; an id is listed once.
                if (id !in sameName) sameName += id
            }
        }
    }

    private fun readFiles(
        table: ByteBuffer,
        header: PackageHeader,
        typeName: String,
        values: StringPool,
        into: MutableMap<String, MutableMap<Int, MutableList<String>>>,
    ) {
        val fileType = header.typeId(typeName) ?: return
        val files = into.getOrPut(header.name) { linkedMapOf() }
        forEachChunk(table, header.start + header.headerSize, header.end) { chunk, type ->
            if (type != TYPE || u8(table, chunk + 8) != fileType) return@forEachChunk
            forEachEntry(table, chunk) { index, entry ->
                val flags = u16(table, entry + 2)
                // A compact entry keeps its value's type in the top byte of its flags and the value
                // where a full entry keeps its key; a full one is followed by a Res_value. A complex
                // entry holds a map, not a file.
                val dataType: Int
                val data: Int
                when {
                    flags and COMPACT != 0 -> { dataType = flags ushr 8; data = table.getInt(entry + 4) }
                    flags and COMPLEX != 0 -> return@forEachEntry
                    else -> {
                        val value = entry + u16(table, entry)
                        dataType = u8(table, value + 3)
                        data = table.getInt(value + 4)
                    }
                }
                if (dataType != TYPE_STRING) return@forEachEntry
                val paths = files.getOrPut((header.id shl 24) or (fileType shl 16) or index) { mutableListOf() }
                val path = values[data]
                if (path !in paths) paths += path
            }
        }
    }

    /** A full entry keeps a 32 bit key after its size and flags; a compact one a 16 bit key first. */
    private fun keyOf(table: ByteBuffer, entry: Int) =
        if (u16(table, entry + 2) and COMPACT != 0) u16(table, entry) else table.getInt(entry + 4)

    private fun forEachEntry(table: ByteBuffer, chunk: Int, each: (index: Int, entry: Int) -> Unit) {
        val flags = u8(table, chunk + 9)
        val count = table.getInt(chunk + 12)
        val entries = chunk + table.getInt(chunk + 16)
        val offsets = chunk + u16(table, chunk + 2)
        for (i in 0 until count) {
            val index: Int
            val offset: Int
            when {
                flags and SPARSE != 0 -> {
                    index = u16(table, offsets + 4 * i)
                    offset = u16(table, offsets + 4 * i + 2) * 4
                }
                flags and OFFSET16 != 0 -> {
                    index = i
                    offset = u16(table, offsets + 2 * i).let { if (it == 0xffff) -1 else it * 4 }
                }
                else -> {
                    index = i
                    offset = table.getInt(offsets + 4 * i)
                }
            }
            if (offset == -1) continue
            each(index, entries + offset)
        }
    }

    private fun forEachChunk(table: ByteBuffer, from: Int, until: Int, each: (start: Int, type: Int) -> Unit) {
        var at = from
        while (at + 8 <= until) {
            val size = table.getInt(at + 4)
            check(size >= 8 && at + size <= until) { "a chunk at $at runs past its parent" }
            each(at, u16(table, at))
            at += size
        }
    }

    private class StringPool(private val table: ByteBuffer, start: Int) {
        val count = table.getInt(start + 8)
        private val utf8 = table.getInt(start + 16) and 0x100 != 0
        private val strings = start + table.getInt(start + 20)
        private val offsets = start + u16(table, start + 2)

        operator fun get(index: Int): String {
            check(index in 0 until count) { "string $index of $count" }
            var at = strings + table.getInt(offsets + 4 * index)
            if (utf8) {
                at += if (u8(table, at) and 0x80 != 0) 2 else 1
                var length = u8(table, at++)
                if (length and 0x80 != 0) length = ((length and 0x7f) shl 8) or u8(table, at++)
                val bytes = ByteArray(length)
                table.get(at, bytes)
                return String(bytes, Charsets.UTF_8)
            }
            var length = u16(table, at)
            at += 2
            if (length and 0x8000 != 0) {
                length = ((length and 0x7fff) shl 16) or u16(table, at)
                at += 2
            }
            return buildString { for (i in 0 until length) append(table.getChar(at + 2 * i)) }
        }
    }

    private fun u8(table: ByteBuffer, at: Int) = table.get(at).toInt() and 0xff
    private fun u16(table: ByteBuffer, at: Int) = table.getShort(at).toInt() and 0xffff
}
