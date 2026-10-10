/*
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

import app.morphe.patches.shared.compat.AppCompatibilities
import com.reandroid.apk.ApkModule
import java.io.File
import org.junit.Assert.fail
import org.junit.Assume.assumeTrue

/**
 * The JUnit category of every test that opens a vendor Pinterest APK. `:patches:test` leaves these
 * out and stays quick; `:patches:fixtureTest` runs only these. A class whose tests all read the APKs
 * carries it, and a class with one such test among others puts it on that test alone.
 */
interface FixtureTests

/**
 * The vendor Pinterest builds the fixture tests read, from the folder `HUSHPINTEREST_FIXTURE_DIR`
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
    const val VARIABLE = "HUSHPINTEREST_FIXTURE_DIR"
    const val REQUIRED_VARIABLE = "HUSHPINTEREST_REQUIRE_FIXTURES"
    const val TASK_PROPERTY = "hushpinterest.fixtures"

    /** The files in the fixture folder that [accept] takes, sorted by name. */
    fun files(accept: (File) -> Boolean): List<File> {
        if (System.getProperty(TASK_PROPERTY) == "refuse") {
            fail("This test reads the vendor Pinterest APKs, which :patches:test leaves to :patches:fixtureTest. " +
                "Give it @Category(FixtureTests::class).")
        }
        val configured = System.getenv(VARIABLE)
        if (configured.isNullOrBlank() && System.getenv(REQUIRED_VARIABLE) == "1") {
            fail("$VARIABLE is required by the push gate. Restore the vendor Pinterest APKs and rerun :patches:fixtureTest.")
        }
        assumeTrue(
            "$VARIABLE is not set, so the Pinterest fixture tests skip. Point it at the folder " +
                "that holds the vendor Pinterest APKs to run them.",
            !configured.isNullOrBlank(),
        )
        val directory = File(configured!!)
        if (!directory.isDirectory) fail("$VARIABLE names $directory, which is not a folder.")
        val found = directory.listFiles()?.filter { it.isFile && accept(it) }?.sortedBy { it.name }.orEmpty()
        if (found.isEmpty()) fail("$VARIABLE names $directory, which holds none of the Pinterest files this test reads.")
        return found
    }

    /** Every Pinterest APK in the fixture folder: the files named `pinterest-*.apk`. */
    fun apks(): List<File> = files { it.extension == "apk" && it.name.startsWith("pinterest-") }

    /**
     * The Pinterest builds of every version the bundle declares: `pinterest-<version>-<code>.apk`, the
     * universal APK with every density and ABI in one file. A declared version with none of them fails.
     */
    fun declaredBuilds(): List<File> =
        AppCompatibilities.pinterest().single().targets.mapNotNull { it.version }.distinct().flatMap { version ->
            files { it.name.startsWith("pinterest-$version-") && it.extension == "apk" }
        }

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
}

/**
 * One value per fixture file for the life of the test JVM, made by [read] the first time a file is
 * asked for and again only when its size or modification time changes. A Pinterest build is over a
 * hundred megabytes, and reading it once per test instead of once per run was most of the fixture
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
