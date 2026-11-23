package patches.upflix

import app.morphe.patcher.patch.loadPatchesFromJar
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeTrue
import org.junit.Test
import java.io.File

/**
 * Proves the built .mpp advertises the Upflix patches. This is exactly how Morphe
 * enumerates a bundle: loadPatchesFromJar over the module's classes.
 */
class UpflixBundleRegistrationTest {

    @Test
    fun `bundle contains the upflix patches for com douglas upflix`() {
        val libs = File("build/libs")
        val bundle = libs.listFiles { f ->
            f.name.endsWith(".mpp") &&
                !f.name.contains("sources") && !f.name.contains("javadoc")
        }?.maxByOrNull { it.lastModified() }
        assumeTrue("no patch bundle built yet", bundle != null)

        val patches = loadPatchesFromJar(setOf(bundle!!))
        val names = patches.mapNotNull { it.name }
        println("bundle: ${bundle.name} (${bundle.length()} bytes)")
        println("patches discovered: ${names.size}")

        val upflix = patches.filter { patch ->
            patch.compatibility?.any { it.packageName == "com.douglas.upflix" } == true
        }
        println("upflix-compatible: " + upflix.mapNotNull { it.name })

        assertTrue("Upflix patches missing from bundle", upflix.isNotEmpty())
        assertTrue(
            "Disable ads and tracking missing",
            upflix.any { it.name == "Disable ads and tracking" },
        )
        assertTrue(
            "Disable Play license check missing",
            upflix.any { it.name == "Disable Play license check" },
        )
    }
}
