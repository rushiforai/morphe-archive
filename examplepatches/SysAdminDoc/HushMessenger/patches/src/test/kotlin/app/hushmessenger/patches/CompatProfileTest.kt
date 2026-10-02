package app.hushmessenger.patches

import app.hushmessenger.patches.coexist.expectedDexSitesFor
import app.hushmessenger.patches.controls.BASE_PROFILE
import app.hushmessenger.patches.controls.ControlProfile
import app.hushmessenger.patches.controls.PROFILE_346013370
import app.hushmessenger.patches.controls.controlProfileFor
import com.android.tools.smali.dexlib2.Opcode
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import kotlin.io.path.createDirectories
import kotlin.io.path.listDirectoryEntries
import kotlin.io.path.nameWithoutExtension
import kotlin.io.path.readLines
import kotlin.io.path.readText
import kotlin.io.path.writeLines
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertSame
import kotlin.test.assertTrue
import org.junit.jupiter.api.io.TempDir

/**
 * scripts/profiles records each build CompatReport.java checked. The Kotlin tables must say the
 * same, and CompatReport must turn a record back into the Kotlin that's in the source.
 */
class CompatProfileTest {
    private val profiles = Path.of("../scripts/profiles")

    private fun record(code: Int) = profiles.resolve("$code.txt").readLines().filter { it.isNotBlank() && !it.startsWith("#") }

    private fun controlLines(code: Int) = record(code).filter { it.substringBefore(' ') !in setOf("version", "code", "sha256", "dexSite") }

    /** A profile as the record writes it: hooks sorted by control and method, then the other values in constructor order. */
    private fun ControlProfile.lines() = hooks.toSortedMap().flatMap { (key, ids) -> ids.sorted().map { "hook $key $it" } } + listOf(
        "pluginSentinel $pluginSentinel",
        "preferenceGetter $preferenceGetter",
        "peopleKey $peopleKey",
        "peopleFlagCheck $peopleFlagCheck",
        "subtabsSupplier $subtabsSupplier",
        "browserPreferenceKey $browserPreferenceKey",
        "browserPreferenceIndex $browserPreferenceIndex",
        "adFilterSize $adFilterSize",
        "adFilterExits ${adFilterExits.joinToString(" ")}",
        "bubbleCapabilityGetter $bubbleCapabilityGetter",
        "bubbleRolloutGetter $bubbleRolloutGetter",
        "nativeBubbleRoutes $nativeBubbleRoutes",
    )

    private fun source(file: String) =
        Path.of("src/main/kotlin/app/hushmessenger/patches/$file").readText().replace("\r\n", "\n")

    /** Runs scripts/CompatReport.java (or a copy) as a source file, with the dexlib2 and Guava this build resolved. */
    private fun compatReport(vararg args: String, script: String = "../scripts/CompatReport.java"): Pair<Int, String> {
        val classpath = listOf(Opcode::class.java, Class.forName("com.google.common.collect.ImmutableList"))
            .joinToString(File.pathSeparator) { File(it.protectionDomain.codeSource.location.toURI()).path }
        val java = Path.of(System.getProperty("java.home"), "bin", "java").toString()
        val process = ProcessBuilder(java, "-Dstdout.encoding=UTF-8", "-cp", classpath, script, *args)
            .redirectErrorStream(true).start()
        val output = process.inputStream.readAllBytes().toString(Charsets.UTF_8).replace("\r\n", "\n")
        return process.waitFor() to output
    }

    @Test fun everyRecordedBuildMatchesTheKotlinTables() {
        assertEquals(
            MessengerTarget.VERSION_CODES.sorted(),
            profiles.listDirectoryEntries("*.txt").map { it.nameWithoutExtension.toInt() }.sorted(),
        )
        for ((version, codes) in MessengerTarget.VERSIONS) for (code in codes) {
            assertEquals(listOf("version $version", "code $code"), record(code).take(2), "$code")
            assertEquals(controlProfileFor("$code").lines(), controlLines(code), "$code")
            assertEquals(
                expectedDexSitesFor("$code").toSortedMap().map { (site, name) -> "dexSite $site $name" },
                record(code).filter { it.startsWith("dexSite ") },
                "$code",
            )
        }
    }

    @Test fun record346013370GeneratesItsProfileAndSitesExactlyAsInTheSource(@TempDir dir: Path) {
        assertSame(PROFILE_346013370, controlProfileFor("346013370"))
        // 346013372 shares this mapping, so a copy of the script that knows only this record prints the blocks.
        Files.copy(Path.of("../scripts/CompatReport.java"), dir.resolve("CompatReport.java"))
        dir.resolve("profiles").createDirectories()
        Files.copy(profiles.resolve("346013370.txt"), dir.resolve("profiles/346013370.txt"))
        val (exit, output) = compatReport(
            "--kotlin", dir.resolve("profiles/346013370.txt").toString(), script = dir.resolve("CompatReport.java").toString(),
        )
        assertEquals(0, exit, output)
        val blocks = output.split("\n\n").filter { it.startsWith("internal val ") }.map { it.trimEnd() + "\n" }
        assertEquals(2, blocks.size, output)
        assertTrue(blocks[0].startsWith("internal val PROFILE_346013370 = ControlProfile("), blocks[0])
        assertContains(source("controls/ControlProfiles.kt"), blocks[0])
        assertTrue(blocks[1].startsWith("internal val expectedDexSites346013370 = mapOf("), blocks[1])
        assertContains(source("coexist/InstallBesideMetaAppsPatch.kt"), blocks[1])
    }

    @Test fun readmeListsEveryRecordedBuildWithItsChecksum() {
        val readme = Path.of("../README.md").readText().replace("\r\n", "\n")
        for (code in MessengerTarget.VERSION_CODES) {
            val sha = record(code).single { it.startsWith("sha256 ") }.substringAfter(' ')
            assertContains(readme, "\n$code  $sha\n")
            assertContains(readme, "`$code`")
        }
    }

    @Test fun record346013387MapsToTheBaseProfile() {
        assertEquals(BASE_PROFILE.lines(), controlLines(346013387))
        val (exit, output) = compatReport("--kotlin", "../scripts/profiles/346013387.txt")
        assertEquals(0, exit, output)
        assertFalse("internal val" in output, output)
        val base = "346013354, 346013355, 346013356, 346013394, 346013440, 346013441, 346013442"
        assertContains(output, "the controls match build $base.")
        assertContains(output, "the permission loads match build $base.")
        for (code in base.split(", ") + "346013387") assertSame(BASE_PROFILE, controlProfileFor(code))
    }

    @Test fun aRecordWithUnresolvedControlsListsThemAndGeneratesNothing(@TempDir dir: Path) {
        val broken = dir.resolve("346999999.txt")
        broken.writeLines(profiles.resolve("346013370.txt").readLines()
            .filterNot { it.startsWith("hook ads ") || it.startsWith("browserPreferenceIndex ") }
            .map { if (it == "code 346013370") "code 346999999" else it } + "hook people LX/Extra;->A00()Z")
        val (exit, output) = compatReport("--kotlin", broken.toString())
        assertEquals(1, exit, output)
        assertContains(output, "No profile generated. These controls did not resolve:")
        assertContains(output, "ads: expected 1 hooks, found 0")
        assertContains(output, "people: expected 2 hooks, found 3")
        assertContains(output, "browser: browserPreferenceIndex not found")
        assertFalse("internal val" in output, output)
    }

    @Test fun anApkWhoseControlsDontResolveListsThemAndWritesNoRecord(@TempDir dir: Path) {
        val apk = dir.resolve("changed.apk")
        ZipOutputStream(Files.newOutputStream(apk)).use { it.putNextEntry(ZipEntry("resources.arsc")); it.closeEntry() }
        val saved = dir.resolve("saved").createDirectories()
        val (exit, output) = compatReport(apk.toString(), "--save", saved.toString())
        assertEquals(1, exit, output)
        assertContains(output, "PROFILE: not written. These controls did not resolve:")
        for (key in listOf("ads", "stories", "menu_settings")) assertContains(output, "       $key: expected")
        assertContains(output, "Install beside Meta apps: expected 6 permission loads, found 0")
        assertEquals(emptyList(), saved.listDirectoryEntries())
    }
}
