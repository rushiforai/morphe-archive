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

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patches.shared.compat.AppCompatibilities
import java.io.File
import java.util.zip.ZipFile
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
        distributions().any { file.name.startsWith("${prefix(it.packageName)}-") } }

    /**
     * The exact universal APK of every declared package, version and code. A web fixture cannot
     * stand in for the Play build, and a different code of the same version cannot prove either build.
     */
    fun declaredBuilds(): List<File> =
        distributions().flatMap { compatibility ->
            compatibility.targets.flatMap { target ->
                val version = checkNotNull(target.version)
                val codes = checkNotNull(target.versionCodes).values.toSet()
                check(codes.isNotEmpty()) { "${compatibility.packageName} $version has no pinned code" }
                codes.flatMap { code -> files { it.name == "${prefix(compatibility.packageName)}-$version-$code.apk" } }
            }
        }

    fun prefix(packageName: String?): String = when (packageName) {
        AppCompatibilities.TELEGRAM_PACKAGE -> "telegram-play"
        AppCompatibilities.TELEGRAM_WEB_PACKAGE -> "telegram-web"
        AppCompatibilities.PLUS_PACKAGE -> "plus"
        else -> error("No vendor fixture naming rule for $packageName")
    }

    /**
     * The file that carries the vendor's signature. An `.apkm` fixture is its splits merged into one
     * APK, as Manager merges them, and merging drops the signature, so the base APK comes out of the
     * vendor's `.apkm` kept beside it, into a temporary file the caller deletes.
     */
    fun vendorSigned(fixture: File): File {
        val compatibility = AppCompatibilities.telegram().single { fixture.name.startsWith("${prefix(it.packageName)}-") }
        if (compatibility.apkFileType != ApkFileType.APKM) return fixture
        val bundle = File(fixture.parentFile, fixture.nameWithoutExtension + ".apkm")
        if (!bundle.isFile) fail("${fixture.name} needs the vendor's ${bundle.name} beside it")
        val base = File.createTempFile("vendor-base", ".apk")
        ZipFile(bundle).use { zip ->
            val entry = checkNotNull(zip.getEntry("base.apk")) { "${bundle.name} holds no base.apk" }
            zip.getInputStream(entry).use { input -> base.outputStream().use { input.copyTo(it) } }
        }
        return base
    }

    private val callers = StackWalker.getInstance(StackWalker.Option.RETAIN_CLASS_REFERENCE)

    /** Every declared distribution, less Plus Messenger when a [PlusPending] test class is asking. */
    private fun distributions() = if (callers.walk { frames -> frames.anyMatch { frame ->
            generateSequence(frame.declaringClass) { it.enclosingClass }.last().isAnnotationPresent(PlusPending::class.java) } })
        AppCompatibilities.telegramOnly() else AppCompatibilities.telegram()
}

/**
 * A fixture test of patches that are still `telegramOnly()`, whose sites Plus Messenger lays out
 * another way. [Fixtures] leaves the Plus build out of it until those patches are read against Plus.
 */
@Target(AnnotationTarget.CLASS)
@Retention(AnnotationRetention.RUNTIME)
internal annotation class PlusPending
