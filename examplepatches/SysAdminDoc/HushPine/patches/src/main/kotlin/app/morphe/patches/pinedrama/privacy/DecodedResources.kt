/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.privacy

import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Document

/** `@drawable/c27` or `@com.ss.android.ttmd.video:mipmap/c` as type and name, or null for anything else. */
internal fun appResource(reference: String): Pair<String, String>? {
    val match = Regex("""@(?:([\w.]+):)?(\w+)/([\w.]+)""").matchEntire(reference.trim()) ?: return null
    if (match.groupValues[1] == "android") return null
    return match.groupValues[2] to match.groupValues[3]
}

/** The decoded XML files of [reference] in every configuration, `res/<type>[-qualifiers]/<name>.xml`. */
internal fun decodedXmlFiles(res: File, reference: String): List<File> {
    val (type, name) = appResource(reference) ?: return emptyList()
    return res.listFiles().orEmpty()
        .filter { it.isDirectory && (it.name == type || it.name.startsWith("$type-")) }
        .sortedBy { it.name }
        .map { it.resolve("$name.xml") }
        .filter { it.isFile }
}

/** A read-only parse: the files read here are never written back. */
internal fun readXml(file: File): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)

/**
 * The decoded package directories: the one holding [packageRoot] and its siblings that have a
 * `res` directory. Every resource package decodes to its own directory, and a clash can be in
 * any of them.
 */
internal fun decodedPackageRoots(packageRoot: File): List<File> =
    (listOf(packageRoot) + packageRoot.parentFile?.listFiles().orEmpty()
        .filter { it.isDirectory && it.resolve("res").isDirectory })
        .distinctBy { it.absoluteFile.normalize() }

/** Every `res/<folder>` the decoder wrote, across [roots]. */
internal fun decodedResourceDirectories(roots: List<File>): Set<String> =
    roots.flatMapTo(mutableSetOf()) { root ->
        root.resolve("res").listFiles().orEmpty().filter { it.isDirectory }.map { "res/${it.name}" }
    }

/**
 * Input resource paths that Morphe's resource rebuild can drop: a path whose own file was
 * decoded under another name (the path map renamed it) while another resource's decoded file
 * sits at that same path.
 *
 * <p>The decoder writes every resource file to `res/<type>/<entry name>` and records the
 * original archive path beside it; the rebuild renames each file back. PineDrama's own paths are
 * short folders (`res/b/cfz.xml`), so nothing clashes, and Morphe Manager's merge of an .apkm
 * keeps them. The desktop CLI's merge moves every file into a folder named for its type and
 * keeps the short name, so entry `ac`'s file becomes `res/drawable/a0.xml`, which is also where
 * entry `a0`'s file decodes. On APKMirror's 46.2.3 and 47.0.3 bundles that made 14,468 and
 * 14,925 such clashes, the rebuild lost 1,375 and 1,361 files, all clashing paths, and PineDrama died
 * inflating its first feed layout on the S22 (2026-09-18). Manager's merge of the same bundles
 * and both universal APKs have none and lose nothing. A file kept at its own path (Play's
 * `res/xml/splits0.xml` in a universal APK) is not a clash: its alias is itself.
 */
internal fun renamedPathCollisions(
    entries: Iterable<String>,
    decodedDirectories: Set<String>,
    aliasOf: (String) -> String,
    isDecoded: (String) -> Boolean,
): List<String> = entries.filter { name ->
    // The folder check comes first and is free: a clash can only sit where the decoder writes,
    // and on a clean input none of the archive's folders is one of those.
    name.substringBeforeLast('/', "") in decodedDirectories && aliasOf(name) != name && isDecoded(name)
}
