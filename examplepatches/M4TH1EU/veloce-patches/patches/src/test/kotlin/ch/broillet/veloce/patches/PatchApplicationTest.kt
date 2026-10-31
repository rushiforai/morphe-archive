package ch.broillet.veloce.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import ch.broillet.veloce.patches.audiobookshelf.customBrowserPatch as audiobookshelf
import ch.broillet.veloce.patches.homeassistant.customCarHostPatch as homeassistant
import ch.broillet.veloce.patches.spotify.customBrowserPatch as spotify
import ch.broillet.veloce.patches.waze.customCarHostPatch as waze
import kotlinx.coroutines.runBlocking
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class PatchApplicationTest {
    @get:Rule val temporary = TemporaryFolder()

    private fun apk(prefix: String): File {
        val directory = System.getenv("VELOCE_APK_DIR")?.let(::File)
        assumeTrue("Set VELOCE_APK_DIR to run local APK integration tests", directory?.isDirectory == true)
        return checkNotNull(directory).listFiles()!!.single { it.name.startsWith(prefix) && it.extension == "apk" }
    }

    private fun apply(apk: File, patch: Patch<*>, resourcesOnly: Boolean = false): Unit = runBlocking {
        Patcher(PatcherConfig(apk, temporaryFilesPath = temporary.newFolder(), validate = true)).use { patcher ->
            patcher += setOf(patch)
            patcher().collect { it.exception?.let { failure -> throw failure } }
            val result = patcher.get()
            if (resourcesOnly) assertNotNull(result.resources.resourcesApk)
            else {
                assertTrue(result.dexFiles.isNotEmpty())
                result.dexFiles.forEach { dex -> dex.stream.use { assertTrue(it.read() >= 0) } }
            }
        }
    }

    @Test fun audiobookshelfPatchCompiles() = apply(apk("audiobookshelf"), audiobookshelf)

    @Test fun homeAssistantFullPatchCompiles() = apply(apk("ha-app-full"), homeassistant, resourcesOnly = true)

    @Test fun spotifyPatchCompiles() = apply(apk("com.spotify"), spotify)

    @Test fun wazePatchCompiles() = apply(apk("com.waze"), waze)
}
