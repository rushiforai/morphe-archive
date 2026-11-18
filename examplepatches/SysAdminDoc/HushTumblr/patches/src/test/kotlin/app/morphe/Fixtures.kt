/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe

import app.morphe.patcher.apk.ApkMerger
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.apksig.ApkVerifier
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.TableBlock
import com.reandroid.arsc.value.ResTableMapEntry
import com.reandroid.arsc.value.ValueItem
import com.reandroid.arsc.value.DataType
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest
import java.util.zip.ZipFile
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Assume.assumeTrue

/**
 * The JUnit category of every test that opens a vendor Tumblr APK. `:patches:test` leaves these
 * out and stays quick; `:patches:fixtureTest` runs only these. A class whose tests all read the APKs
 * carries it, and a class with one such test among others puts it on that test alone.
 */
interface FixtureTests

/**
 * The vendor Tumblr builds the fixture tests read, from the folder `HUSHTUMBLR_FIXTURE_DIR`
 * names.
 *
 * Unset, every fixture test skips and says which variable to set: the APKs are hundreds of
 * megabytes each and are not in the repository. Set, the folder has to hold what the test reads.
 * A variable pointing at a missing or empty folder is a broken setup, and skipping there would
 * read as a pass. There is no default folder: one used to be a path on the maintainer's machine,
 * which skipped quietly everywhere else and published that machine's layout.
 * The push gate sets [REQUIRED_VARIABLE], so an unavailable fixture can never become a skip there.
 * `:patches:test` sets [TASK_PROPERTY] to `refuse`, so a test that reads the APKs without the
 * [FixtureTests] category fails there, whether the folder is set or not, instead of slowing the
 * quick task down or skipping out of the fixture run.
 */
internal object Fixtures {
    const val VARIABLE = "HUSHTUMBLR_FIXTURE_DIR"
    const val REQUIRED_VARIABLE = "HUSHTUMBLR_REQUIRE_FIXTURES"
    const val TASK_PROPERTY = "hushtumblr.fixtures"

    /** The files in the fixture folder that [accept] takes, sorted by name. */
    fun files(accept: (File) -> Boolean): List<File> {
        if (System.getProperty(TASK_PROPERTY) == "refuse") {
            fail("This test reads the vendor Tumblr APKs, which :patches:test leaves to :patches:fixtureTest. " +
                "Give it @Category(FixtureTests::class).")
        }
        val configured = System.getenv(VARIABLE)
        if (configured.isNullOrBlank() && System.getenv(REQUIRED_VARIABLE) == "1") {
            fail("$VARIABLE is required by the push gate. Restore the vendor Tumblr APKs and rerun :patches:fixtureTest.")
        }
        assumeTrue(
            "$VARIABLE is not set, so the Tumblr fixture tests skip. Point it at the folder " +
                "that holds the vendor Tumblr APKs to run them.",
            !configured.isNullOrBlank(),
        )
        val directory = File(configured!!)
        if (!directory.isDirectory) fail("$VARIABLE names $directory, which is not a folder.")
        val found = directory.listFiles()?.filter { it.isFile && accept(it) }?.sortedBy { it.name }.orEmpty()
        if (found.isEmpty()) fail("$VARIABLE names $directory, which holds none of the Tumblr files this test reads.")
        return found
    }

    /** Every Tumblr APK in the fixture folder: the files named `tumblr-*.apk`. */
    fun apks(): List<File> = files { it.extension == "apk" && it.name.startsWith("tumblr-") }

    /**
     * The Tumblr builds of every version the bundle declares: `tumblr-<version>-<code>.apk`, the
     * universal APK with every density and ABI in one file. The `.apkm` beside it is the split
     * bundle a user downloads, signed with Tumblr's key. Tumblr ships no universal APK, so this one
     * is merged from that bundle and carries no signature that verifies; [signedForm] stands it on
     * the bundle's. A declared version with none of them fails.
     */
    fun declaredBuilds(): List<File> =
        AppCompatibilities.tumblr().single().targets.mapNotNull { it.version }.distinct().flatMap { version ->
            files { it.name.startsWith("tumblr-$version-") && it.extension == "apk" }
        }

    /** The APKMirror bundles in the fixture folder: the files named `tumblr-*.apkm`. */
    fun bundles(): List<File> = files { it.extension == "apkm" && it.name.startsWith("tumblr-") }

    private val manifests = FixtureCache { apk ->
        ApkModule.loadApkFile(apk).use { module ->
            val manifest = module.androidManifest
            // References in the manifest resolve against the APK's own resource table.
            manifest.setPackageBlock(module.tableBlock.pickOne())
            manifest.serializeToXml()
        }
    }

    /**
     * The decoded manifest of [apk] as XML text, the way the resource patch reads it. Loading the
     * resource table is the slow part, so it happens once per build and test JVM; each caller parses
     * the text into a document of its own and can edit that freely.
     */
    fun manifest(apk: File): String = manifests[apk]

    /** A signed APK and the name a failure gives it. */
    class Signed(val name: String, val file: File)

    private val signedForms = FixtureCache { apk -> readSignedForm(apk) }

    /**
     * The signed APK that vouches for the universal [apk], for a check of who signed it.
     *
     * An APK that verifies vouches for itself. One that doesn't has to be the merge of the APKMirror
     * bundle of the same name beside it: merging rewrites the resource table and the manifest, so
     * no signature survives it. Its code has to be that bundle's byte for byte, every dex file the
     * same as base.apk's and every native library the same as its split's, and every other file but
     * the manifest and resource table has to be one of the bundle's (res files by content, since the
     * merge can rename their folders). It also has to be the whole merge: the bundle's APKs are
     * merged here, and the universal APK has to hold that merge's files under the same names with
     * the same bytes, and a resource table that says the same ([holdToMerge]). Then the bundle's base.apk, signed by Tumblr, stands for it. An APK that doesn't verify and isn't such a merge
     * fails, so a re-signed or edited build can't pass for Tumblr's.
     */
    fun signedForm(apk: File): Signed = signedForms[apk]

    private fun readSignedForm(apk: File): Signed {
        val result = ApkVerifier.Builder(apk).build().verify()
        if (result.isVerified) return Signed(apk.name, apk)
        val bundle = File(apk.parentFile, apk.nameWithoutExtension + ".apkm")
        if (!bundle.isFile) {
            fail("${apk.name} does not verify (${result.errors}), and no ${bundle.name} beside it holds the signed " +
                "build it could have been merged from.")
        }
        val base = File.createTempFile("fixture-signed-base", ".apk").apply { deleteOnExit() }
        val expectedLibraries = sortedMapOf<String, String>()
        // Every name and digest the bundle's APKs carry, and the digests of their res files.
        val signedEntries = HashSet<String>()
        val signedResources = HashSet<String>()
        ZipFile(bundle).use { zip ->
            val apks = zip.entries().asSequence().filter { it.name.endsWith(".apk") }.toList()
            val baseEntry = apks.singleOrNull { it.name == "base.apk" }
                ?: throw AssertionError("${bundle.name} holds no base.apk")
            zip.getInputStream(baseEntry).use { input -> base.outputStream().use { input.copyTo(it) } }
            for (entry in apks) {
                val split = if (entry === baseEntry) base else File.createTempFile("fixture-split", ".apk")
                try {
                    if (split !== base) zip.getInputStream(entry).use { input -> split.outputStream().use { input.copyTo(it) } }
                    val carried = ZipFile(split).use { digests(it) { true } }
                    for ((name, digest) in carried) {
                        signedEntries += "$name\u0000$digest"
                        if (name.startsWith("res/")) signedResources += digest
                        if (!name.startsWith("lib/")) continue
                        assertTrue("${bundle.name}: $name is in two of its APKs", expectedLibraries.put(name, digest) == null)
                    }
                } finally {
                    if (split !== base) split.delete()
                }
            }
        }
        val signedCode = ZipFile(base).use { digests(it, ::isDex) }
        assertTrue("${bundle.name}!base.apk holds no dex", signedCode.isNotEmpty())
        val merged = ZipFile(apk).use { digests(it) { true } }
        assertEquals("${apk.name} does not verify, and its dex files aren't ${bundle.name}'s base.apk's",
            signedCode, merged.filterKeys(::isDex).toSortedMap())
        assertEquals("${apk.name} does not verify, and its native libraries aren't ${bundle.name}'s",
            expectedLibraries, merged.filterKeys { it.startsWith("lib/") }.toSortedMap())
        // The merger copies everything else, though a res file can lose a -v4 or -v21 qualifier
        // from its folder name, so res files are matched by content. Only the manifest and the
        // resource table are rebuilt. scripts/common.ps1 (Open-AuthenticInput) holds a universal
        // APK to the same rule.
        val foreign = merged.filter { (name, digest) ->
            when {
                name == "AndroidManifest.xml" || name == "resources.arsc" -> false
                name.startsWith("res/") -> digest !in signedResources
                else -> "$name\u0000$digest" !in signedEntries
            }
        }.keys
        assertTrue("${apk.name} does not verify, and ${foreign.take(5)} in it aren't in any APK of ${bundle.name}",
            foreign.isEmpty())
        holdToMerge(apk, merged, bundle)
        return Signed("${bundle.name}!base.apk", base)
    }

    /**
     * Holds the universal [apk], whose entries are [merged], to the merge of [bundle]'s APKs.
     *
     * Being made of the bundle's files doesn't make an APK the bundle's merge: one that left an
     * asset out passed, and so did one with a signed res file under another's name or a resource
     * table missing what the splits add. So the bundle is merged here by the patcher's own merger,
     * with the arguments the CLI and scripts/MergeSplits.java pass, and the universal APK has to
     * hold exactly that merge's files with the same bytes. The merge is what drops a qualifier from
     * a res folder or keeps one copy of a file two APKs carry, so nothing here counts the APKs'
     * files. The resource table is compared by what it says ([tableValues]) rather than by its
     * bytes: the test classpath holds two builds of ARSCLib, and which one writes the merge's table
     * here depends on their order, while the scripts' merge is always written by the CLI's own.
     * scripts/common.ps1 (Open-AuthenticInput) holds a universal APK to the same rule.
     */
    private fun holdToMerge(apk: File, merged: Map<String, String>, bundle: File) {
        val splits = Files.createTempDirectory("fixture-splits").toFile()
        val trusted = File.createTempFile("fixture-trusted-merge", ".apk")
        try {
            ZipFile(bundle).use { zip ->
                for (entry in zip.entries().asSequence().filter { it.name.endsWith(".apk") }) {
                    zip.getInputStream(entry).use { input ->
                        File(splits, File(entry.name).name).outputStream().use { input.copyTo(it) }
                    }
                }
            }
            ApkMerger().merge(splits, trusted, true, null, true, null, false)
            val expected = ZipFile(trusted).use { digests(it) { true } }
            val missing = expected.keys - merged.keys
            assertTrue("${apk.name} does not verify, and it has no ${missing.take(5)}, which the merge of ${bundle.name} holds",
                missing.isEmpty())
            val extra = merged.keys - expected.keys
            assertTrue("${apk.name} does not verify, and ${extra.take(5)} in it aren't in the merge of ${bundle.name}",
                extra.isEmpty())
            val changed = expected.filter { (name, digest) -> name != "resources.arsc" && merged[name] != digest }.keys
            assertTrue("${apk.name} does not verify, and ${changed.take(5)} in it aren't the ones the merge of ${bundle.name} holds",
                changed.isEmpty())
            val expectedTable = tableValues(trusted)
            val table = tableValues(apk)
            val moved = (expectedTable.keys + table.keys).filter { expectedTable[it] != table[it] }
            assertTrue("${apk.name} does not verify, and its resource table isn't the one the merge of ${bundle.name} holds, " +
                "at ${moved.take(5)}", moved.isEmpty())
        } finally {
            trusted.delete()
            splits.deleteRecursively()
        }
    }

    /**
     * Every value [apk]'s resource table holds, as text, by resource id and configuration. A string
     * is its text and not its place in the string pool, so two tables that say the same give the
     * same map however each was written.
     */
    private fun tableValues(apk: File): Map<String, String> {
        val table = ZipFile(apk).use { zip -> zip.getInputStream(zip.getEntry("resources.arsc")).use { TableBlock.load(it) } }
        val values = sortedMapOf<String, String>()
        for (pack in table.listPackages()) {
            for (pair in pack.listSpecTypePairs()) {
                for (resource in pair.resources) {
                    for (entry in resource) {
                        if (entry == null || entry.isNull) continue
                        val key = "%08x %s/%s [%s]".format(resource.resourceId, resource.type, resource.name, entry.resConfig.qualifiers)
                        values[key] = if (entry.isComplex) {
                            val bag = entry.tableEntry as ResTableMapEntry
                            "parent ${bag.parentId}: " + bag.joinToString { "${it.nameId}=${valueText(it)}" }
                        } else {
                            valueText(entry.resValue)
                        }
                    }
                }
            }
        }
        return values
    }

    private fun valueText(value: ValueItem?): String = when {
        value == null -> "none"
        value.dataType == DataType.STRING -> "\"${value.dataAsString}\""
        else -> "${value.dataType}:${value.data}"
    }

    private fun isDex(name: String): Boolean = Regex("classes\\d*\\.dex").matches(name)

    /** The SHA-256 of every entry of [zip] whose name [accept] takes, by name. */
    private fun digests(zip: ZipFile, accept: (String) -> Boolean): Map<String, String> =
        zip.entries().asSequence().filter { !it.isDirectory && accept(it.name) }.associate { entry ->
            val digest = MessageDigest.getInstance("SHA-256")
            zip.getInputStream(entry).use { input ->
                val buffer = ByteArray(1 shl 16)
                while (true) {
                    val read = input.read(buffer)
                    if (read < 0) break
                    digest.update(buffer, 0, read)
                }
            }
            entry.name to digest.digest().joinToString("") { "%02x".format(it) }
        }.toSortedMap()
}

/**
 * One value per fixture file for the life of the test JVM, made by [read] the first time a file is
 * asked for and again only when its size or modification time changes. A Tumblr build is over eighty
 * megabytes, and reading it once per test instead of once per run was most of the fixture
 * tests' time. [reads] counts the reads, for the test that holds the cache to that.
 */
internal class FixtureCache<V>(private val read: (File) -> V) {
    private class Entry<T>(val length: Long, val modified: Long, val value: T)

    private val entries = HashMap<String, Entry<V>>()
    private val counts = HashMap<String, Int>()

    operator fun get(file: File): V {
        return synchronized(this) {
            val path = file.canonicalPath
            val length = file.length()
            val modified = file.lastModified()
            val cached = entries[path]
            if (cached != null && cached.length == length && cached.modified == modified) return cached.value
            // The old value goes first, so a changed build is never held twice.
            entries.remove(path)
            val value = read(file)
            entries[path] = Entry(length, modified, value)
            counts[path] = (counts[path] ?: 0) + 1
            value
        }
    }

    fun reads(file: File): Int = synchronized(this) { counts[file.canonicalPath] ?: 0 }
}
