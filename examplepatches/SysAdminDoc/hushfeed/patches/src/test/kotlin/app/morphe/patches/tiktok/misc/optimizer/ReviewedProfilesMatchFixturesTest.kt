package app.morphe.patches.tiktok.misc.optimizer

import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile
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
        val problems = mutableListOf<String>()
        for (apk in apks) {
            val present = presentFiles(apk)
            for ((group, profiles) in groups) {
                val wanted = profiles.flatMap { it.files }.map { it.path }.toSet()
                val found = present.filterKeys { it in wanted }
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

    /** Every TikTok APK in the fixture directory, the declared target and the retained newer builds. */
    private fun fixtures(): List<File> {
        val directory = File(System.getenv("HUSHFEED_FIXTURE_DIR") ?: "C:/_claude-backups/tiktok-fixture")
        if (!directory.isDirectory) return emptyList()
        return directory.listFiles()?.filter { it.isFile && it.extension == "apk" }?.sortedBy { it.name } ?: emptyList()
    }

    /** Path to lowercase sha256 for every entry any profile names, when the APK has it. */
    private fun presentFiles(apk: File): Map<String, String> {
        val wanted = groups.values.flatten().flatMap { it.files }.map { it.path }.toSet()
        val digest = MessageDigest.getInstance("SHA-256")
        val result = mutableMapOf<String, String>()
        ZipFile(apk).use { zip ->
            for (path in wanted) {
                val entry = zip.getEntry(path) ?: continue
                digest.reset()
                zip.getInputStream(entry).use { stream ->
                    val buffer = ByteArray(1 shl 16)
                    while (true) {
                        val read = stream.read(buffer)
                        if (read < 0) break
                        digest.update(buffer, 0, read)
                    }
                }
                result[path] = digest.digest().joinToString("") { "%02x".format(it) }
            }
        }
        return result
    }
}
