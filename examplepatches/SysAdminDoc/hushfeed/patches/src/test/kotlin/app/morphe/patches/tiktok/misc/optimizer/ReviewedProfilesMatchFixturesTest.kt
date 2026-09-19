package app.morphe.patches.tiktok.misc.optimizer

import java.io.File
import java.io.InputStream
import java.security.MessageDigest
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeTrue
import org.junit.Test

/**
 * Every reviewed path set has to describe a build that is actually on the desk.
 *
 * <p>A resource strip refuses a build whose files it has not reviewed: the paths it finds must
 * equal one profile's path set and every byte must hash to what that profile recorded. That
 * check used to run for the first time inside the release receipt, thirty minutes in, and
 * twice on 2026-09-17 it was the receipt that found a hash copied from the wrong build (the
 * core asset set on 46.7.3, then the P2P relay set on 46.9.3). This asks the same question of
 * every fixture APK on the machine in a few seconds, and names the entry that is off. Without
 * a fixture it is skipped rather than passed.
 *
 * <p>An .apkm split bundle is read the way Morphe merges one: every split's entries together.
 * That is the shape issue #9's reporter patched, and all four strips refused it.
 */
class ReviewedProfilesMatchFixturesTest {
    private val groups = mapOf(
        "core assets" to coreAssetProfiles,
        "creation tools" to studioAssetProfiles,
        "LIVE extras" to liveAssetProfiles,
        "P2P relay" to p2pRelayProfiles,
    )

    @Test
    fun `every fixture matches one reviewed profile of every strip, byte for byte`() {
        val apks = fixtures()
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())
        val wanted = groups.values.flatten().flatMap { it.files }.map { it.path }.toSet()
        val problems = mutableListOf<String>()
        for (apk in apks) {
            val present = digests(apk) { it in wanted }
            for ((group, profiles) in groups) {
                val paths = profiles.flatMap { it.files }.map { it.path }.toSet()
                val found = present.filterKeys { it in paths }
                assertTrue("$group: ${apk.name} carries none of the reviewed paths", found.isNotEmpty())
                val bySet = profiles.filter { profile -> profile.files.map { it.path }.toSet() == found.keys }
                if (bySet.isEmpty()) {
                    problems += "$group on ${apk.name}: the ${found.size} present paths match no profile's path set " +
                        "(${profiles.joinToString { "${it.label}=${it.files.size}" }})"
                    continue
                }
                val exact = bySet.firstOrNull { profile ->
                    profile.files.all { found[it.path].equals(it.sha256, ignoreCase = true) }
                }
                if (exact == null) {
                    val nearest = bySet.first()
                    val wrong = nearest.files.filter { !found[it.path].equals(it.sha256, ignoreCase = true) }
                    problems += "$group on ${apk.name}: ${nearest.label} lists the right paths but these hashes differ: " +
                        wrong.joinToString { "${it.path} reviewed ${it.sha256.take(12)} actual ${found[it.path]?.take(12)}" }
                }
            }
        }
        assertEquals("reviewed sets that do not describe the fixtures on this machine", emptyList<String>(), problems)
    }

    @Test
    fun `every fixture's language packs match one reviewed inventory`() {
        val apks = fixtures()
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())
        val problems = mutableListOf<String>()
        for (apk in apks) {
            val files = digests(apk) { it.startsWith(LANGUAGE_PREFIX) }
            val directories = files.keys
                .map { it.removePrefix(LANGUAGE_PREFIX).substringBefore('/').lowercase() }
                .toSet()
            val contract = languageInventories.firstOrNull { it.directories == directories }
            if (contract == null) {
                problems += "${apk.name}: ${directories.size} language directories match no reviewed inventory " +
                    "(${languageInventories.joinToString { it.directories.size.toString() }})"
                continue
            }
            // The same two manifests stripVerifiedLanguagePacks builds.
            val paths = files.keys.sorted()
            val pathManifest = sha256(paths.joinToString("") { "$it\n" }.toByteArray())
            val contentManifest = sha256(paths.joinToString("") { "$it\u0000${files[it]}\n" }.toByteArray())
            if (pathManifest != contract.pathManifestSha256) {
                problems += "${apk.name}: language path manifest $pathManifest is not the reviewed one"
            }
            if (contentManifest !in contract.contentManifestSha256) {
                problems += "${apk.name}: language content manifest $contentManifest is not a reviewed one"
            }
        }
        assertEquals("language inventories that do not describe the fixtures", emptyList<String>(), problems)
    }

    /** Every TikTok APK and split bundle in the fixture directory. */
    private fun fixtures(): List<File> {
        val directory = File(System.getenv("HUSHFEED_FIXTURE_DIR") ?: "C:/_claude-backups/tiktok-fixture")
        if (!directory.isDirectory) return emptyList()
        return directory.listFiles()
            ?.filter { it.isFile && (it.extension == "apk" || it.extension == "apkm") }
            ?.sortedBy { it.name } ?: emptyList()
    }

    /**
     * Path to lowercase sha256 for every entry [keep] accepts. For an .apkm, the entries of every
     * split inside it, as a merge would lay them out; a path two splits disagree on fails.
     */
    private fun digests(apk: File, keep: (String) -> Boolean): Map<String, String> {
        val result = mutableMapOf<String, String>()
        fun add(name: String, stream: InputStream) {
            val hash = sha256(stream)
            val previous = result.put(name, hash)
            check(previous == null || previous == hash) { "${apk.name}: two splits carry different $name" }
        }
        ZipFile(apk).use { zip ->
            if (apk.extension != "apkm") {
                zip.entries().asSequence().filter { !it.isDirectory && keep(it.name) }
                    .forEach { entry -> zip.getInputStream(entry).use { add(entry.name, it) } }
                return result
            }
            zip.entries().asSequence().filter { it.name.endsWith(".apk") }.forEach { split ->
                ZipInputStream(zip.getInputStream(split)).use { inner ->
                    while (true) {
                        val entry = inner.nextEntry ?: break
                        if (!entry.isDirectory && keep(entry.name)) add(entry.name, inner)
                    }
                }
            }
        }
        return result
    }

    private fun sha256(stream: InputStream): String {
        val digest = MessageDigest.getInstance("SHA-256")
        val buffer = ByteArray(1 shl 16)
        while (true) {
            val read = stream.read(buffer)
            if (read < 0) break
            digest.update(buffer, 0, read)
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }

    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    private companion object {
        const val LANGUAGE_PREFIX = "assets/strings#lang_"
    }
}
