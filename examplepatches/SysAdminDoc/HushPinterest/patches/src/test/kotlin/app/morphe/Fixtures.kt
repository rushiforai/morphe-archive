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
import java.io.File
import org.junit.Assert.fail
import org.junit.Assume.assumeTrue

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
 */
internal object Fixtures {
    const val VARIABLE = "HUSHPINTEREST_FIXTURE_DIR"
    const val REQUIRED_VARIABLE = "HUSHPINTEREST_REQUIRE_FIXTURES"

    /** The files in the fixture folder that [accept] takes, sorted by name. */
    fun files(accept: (File) -> Boolean): List<File> {
        val configured = System.getenv(VARIABLE)
        if (configured.isNullOrBlank() && System.getenv(REQUIRED_VARIABLE) == "1") {
            fail("$VARIABLE is required by the push gate. Restore the vendor Pinterest APKs and rerun :patches:test.")
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
}
