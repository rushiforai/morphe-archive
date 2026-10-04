/*
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
 * The vendor Telegram builds the fixture tests read, from the folder `HUSHTELEGRAM_FIXTURE_DIR`
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
    const val VARIABLE = "HUSHTELEGRAM_FIXTURE_DIR"
    const val REQUIRED_VARIABLE = "HUSHTELEGRAM_REQUIRE_FIXTURES"

    /** The files in the fixture folder that [accept] takes, sorted by name. */
    fun files(accept: (File) -> Boolean): List<File> {
        val configured = System.getenv(VARIABLE)
        if (configured.isNullOrBlank() && System.getenv(REQUIRED_VARIABLE) == "1") {
            fail("$VARIABLE is required by the push gate. Restore the vendor Telegram APKs and rerun :patches:test.")
        }
        assumeTrue(
            "$VARIABLE is not set, so the Telegram fixture tests skip. Point it at the folder " +
                "that holds the vendor Telegram APKs to run them.",
            !configured.isNullOrBlank(),
        )
        val directory = File(configured!!)
        if (!directory.isDirectory) fail("$VARIABLE names $directory, which is not a folder.")
        val found = directory.listFiles()?.filter { it.isFile && accept(it) }?.sortedBy { it.name }.orEmpty()
        if (found.isEmpty()) fail("$VARIABLE names $directory, which holds none of the Telegram files this test reads.")
        return found
    }

    /** Every retained APK of a declared Telegram distribution. */
    fun apks(): List<File> = files { file -> file.extension == "apk" &&
        AppCompatibilities.telegram().any { file.name.startsWith("${prefix(it.packageName)}-") } }

    /**
     * The exact universal APK of every declared package, version and code. A web fixture cannot
     * stand in for beta, and a different code of the same version cannot prove either build.
     */
    fun declaredBuilds(): List<File> =
        AppCompatibilities.telegram().flatMap { compatibility ->
            compatibility.targets.flatMap { target ->
                val version = checkNotNull(target.version)
                val codes = checkNotNull(target.versionCodes).values.toSet()
                check(codes.isNotEmpty()) { "${compatibility.packageName} $version has no pinned code" }
                codes.flatMap { code -> files { it.name == "${prefix(compatibility.packageName)}-$version-$code.apk" } }
            }
        }

    fun prefix(packageName: String?): String = when (packageName) {
        AppCompatibilities.TELEGRAM_WEB_PACKAGE -> "telegram-web"
        AppCompatibilities.TELEGRAM_BETA_PACKAGE -> "telegram-beta"
        else -> error("No vendor fixture naming rule for $packageName")
    }
}
