package arpit.morphe.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.PatchLoader
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import java.io.File

/**
 * Replays the built patch bundle against a real APK/XAPK and fails as soon as any patch — and
 * therefore any fingerprint it depends on — fails to apply.
 *
 * `morphe-patcher` 2.1.0 ships no CLI entrypoint, so the check runs through the patcher API that
 * the Morphe client itself uses. This is the same code path as a user patching the APK, which
 * makes a fingerprint break after an app update (R8 renaming) visible in CI.
 *
 * Driven by `.github/workflows/verify-patches.yml`:
 * `./gradlew :patches:test -Papk=/path/app.apk [-Pmpp=patches/build/libs/patches-x.y.z.mpp]`
 *
 * Without `-Papk` the test skips (local `./gradlew test` stays green); CI always passes it.
 */
class PatchesApplyToApkTest {
    @Test
    fun `patch bundle applies to supplied apk`() = runBlocking {
        val apkPath = System.getProperty("apk")
        if (apkPath.isNullOrBlank()) {
            println("No -Papk supplied; skipping APK verification.")
            return@runBlocking
        }

        val apk = File(apkPath).apply { assertTrue(isFile, "APK not found: $apkPath") }
        val bundle = locateBundle()
        val workspace = File("build/verify-patches-workspace").apply { deleteRecursively() }

        val failures = Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = workspace)).use { patcher ->
            // Mirrors the Morphe client: only patches declaring this APK's package run. Without
            // this every other app's patches (Targapp) fail their fingerprints on this APK.
            val packageName = patcher.context.packageMetadata.packageName
            val applicable = PatchLoader.Jar(setOf(bundle))
                .filter { patch ->
                    val compatibility = patch.compatibility
                    compatibility.isNullOrEmpty() ||
                        compatibility.any { it.packageName == null || it.packageName == packageName }
                }
            assertTrue(applicable.isNotEmpty(), "No patch in the bundle targets $packageName")

            patcher += applicable.toSet()
            patcher.invoke().toList()
                .filter { it.exception != null }
                .map { "${it.patch.name}: ${it.exception?.message}" }
        }

        // The patcher reports per-patch exceptions instead of throwing, so collect them all here.
        assertTrue(failures.isEmpty(), "Patch failures on $apkPath:\n" + failures.joinToString("\n"))
    }

    private fun locateBundle(): File {
        val explicit = System.getProperty("mpp")?.takeIf { it.isNotBlank() }?.let(::File)
        if (explicit != null && explicit.isFile) return explicit

        val libs = File("../patches/build/libs").canonicalFile.listFiles().orEmpty()
        val newest = libs.filter { it.extension == "mpp" }.maxByOrNull { it.lastModified() }
            ?: error("No .mpp bundle in patches/build/libs; run `./gradlew :patches:assembleRelease` first")
        return newest
    }
}
