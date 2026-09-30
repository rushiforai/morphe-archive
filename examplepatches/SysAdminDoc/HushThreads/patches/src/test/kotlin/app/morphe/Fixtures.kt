/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe

import app.morphe.patches.shared.compat.AppCompatibilities
import java.io.File
import org.junit.Assert.fail
import org.junit.Assume.assumeTrue

/**
 * The vendor Threads builds the fixture tests read, from the folder `HUSHTHREADS_FIXTURE_DIR`
 * names.
 *
 * Unset, every fixture test skips and says which variable to set: the APKs are hundreds of
 * megabytes each and are not in the repository. Set, the folder has to hold what the test reads.
 * A variable pointing at a missing or empty folder is a broken setup, and skipping there would
 * read as a pass. There is no default folder: one used to be a path on the maintainer's machine,
 * which skipped quietly everywhere else and published that machine's layout.
 */
internal object Fixtures {
    const val VARIABLE = "HUSHTHREADS_FIXTURE_DIR"

    /** The files in the fixture folder that [accept] takes, sorted by name. */
    fun files(accept: (File) -> Boolean): List<File> {
        val configured = System.getenv(VARIABLE)
        assumeTrue(
            "$VARIABLE is not set, so the Threads fixture tests skip. Point it at the folder " +
                "that holds the vendor Threads APKs to run them.",
            !configured.isNullOrBlank(),
        )
        val directory = File(configured!!)
        if (!directory.isDirectory) fail("$VARIABLE names $directory, which is not a folder.")
        val found = directory.listFiles()?.filter { it.isFile && accept(it) }?.sortedBy { it.name }.orEmpty()
        if (found.isEmpty()) fail("$VARIABLE names $directory, which holds none of the Threads files this test reads.")
        return found
    }

    /**
     * Every Threads APK in the fixture folder: the files named `threads-*.apk`. The folder may also
     * hold the Instagram build the coexistence checks read, which no Threads test wants.
     */
    fun apks(): List<File> = files { it.extension == "apk" && it.name.startsWith("threads-") }

    /**
     * The Threads builds of every version the bundle declares: `threads-<version>-*` as the vendor
     * ships it (.xapk or .apkm) or merged into one .apk. A declared version with none of them fails.
     */
    fun declaredBuilds(): List<File> =
        AppCompatibilities.threads().single().targets.mapNotNull { it.version }.distinct().flatMap { version ->
            files { it.name.startsWith("threads-$version-") && it.extension in BUILD_EXTENSIONS }
        }

    private val BUILD_EXTENSIONS = setOf("xapk", "apkm", "apk")
}
