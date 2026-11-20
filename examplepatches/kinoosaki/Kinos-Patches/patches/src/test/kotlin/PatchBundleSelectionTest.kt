import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import org.junit.jupiter.api.io.TempDir
import util.selectPatchBundle
import java.io.File
import java.util.jar.Attributes
import java.util.jar.JarOutputStream
import java.util.jar.Manifest

/**
 * util.selectPatchBundle (used by the smoke tests and generatePatchesList) takes exactly
 * patches-<version>.mpp and checks the version in that archive's own manifest. No APK needed.
 */
class PatchBundleSelectionTest {

    @TempDir
    lateinit var libs: File

    /** A minimal bundle: just a manifest, with [manifestVersion] as Version unless null. */
    private fun bundle(name: String, manifestVersion: String?, modified: Long? = null): File {
        val manifest = Manifest().apply {
            mainAttributes[Attributes.Name.MANIFEST_VERSION] = "1.0"
            if (manifestVersion != null) mainAttributes.putValue("Version", manifestVersion)
        }
        val file = File(libs, name)
        JarOutputStream(file.outputStream(), manifest).use { }
        if (modified != null) file.setLastModified(modified)
        return file
    }

    @Test
    fun `no bundle fails and says how to build it`() {
        val e = assertThrows<IllegalStateException> { selectPatchBundle(libs, "2.0.0-dev.3") }
        assertTrue(e.message!!.contains("patches-2.0.0-dev.3.mpp"), e.message)
        assertTrue(e.message!!.contains(":patches:buildAndroid"), e.message)
    }

    @Test
    fun `the single matching bundle is selected`() {
        val only = bundle("patches-2.0.0-dev.3.mpp", "2.0.0-dev.3")
        assertEquals(only, selectPatchBundle(libs, "2.0.0-dev.3"))
    }

    @Test
    fun `a stale bundle with a newer timestamp is ignored`() {
        val now = System.currentTimeMillis()
        val current = bundle("patches-2.0.0-dev.3.mpp", "2.0.0-dev.3", modified = now - 3_600_000)
        bundle("patches-2.0.0-dev.2.mpp", "2.0.0-dev.2", modified = now)
        bundle("patches-1.19.0.mpp", "1.19.0", modified = now - 60_000)
        assertEquals(current, selectPatchBundle(libs, "2.0.0-dev.3"))
    }

    @Test
    fun `only stale bundles fails and names them`() {
        bundle("patches-2.0.0-dev.2.mpp", "2.0.0-dev.2")
        val e = assertThrows<IllegalStateException> { selectPatchBundle(libs, "2.0.0-dev.3") }
        assertTrue(e.message!!.contains("patches-2.0.0-dev.2.mpp"), e.message)
    }

    @Test
    fun `a manifest version mismatch fails`() {
        bundle("patches-2.0.0-dev.3.mpp", "2.0.0-dev.2")
        val e = assertThrows<IllegalStateException> { selectPatchBundle(libs, "2.0.0-dev.3") }
        assertTrue(e.message!!.contains("manifest Version 2.0.0-dev.2"), e.message)

        bundle("patches-2.0.0.mpp", null)
        assertThrows<IllegalStateException> { selectPatchBundle(libs, "2.0.0") }
    }

    @Test
    fun `the selected bundle is not left open`() {
        bundle("patches-1.0.0.mpp", "1.0.0")
        val selected = selectPatchBundle(libs, "1.0.0")
        // On Windows an open JarFile keeps the file locked and the delete fails.
        assertTrue(selected.delete(), "bundle still locked after selection")
    }
}
