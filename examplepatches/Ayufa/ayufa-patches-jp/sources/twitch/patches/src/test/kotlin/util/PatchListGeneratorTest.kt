package util

import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File
import java.util.jar.Attributes
import java.util.jar.JarOutputStream
import java.util.jar.Manifest

class PatchListGeneratorTest {
    @get:Rule
    val temporary = TemporaryFolder()

    @Test
    fun readsOnlyTheSelectedBundleWithSeveralVersionsPresent() {
        bundle("patches-1.0.1.mpp", "1.0.1")
        bundle("patches-1.0.2-dev.1-sources.mpp", "1.0.2-dev.1")
        val current = bundle("patches-1.0.2-dev.1.mpp", "1.0.2-dev.1")
        assertEquals("1.0.2-dev.1", readBundleVersion(current))
    }

    @Test
    fun rejectsMissingBundleWithoutSelectingAnOlderVersion() {
        bundle("patches-1.0.1.mpp", "1.0.1")
        assertThrows(IllegalArgumentException::class.java) {
            readBundleVersion(File(temporary.root, "patches-1.0.2-dev.1.mpp"))
        }
    }

    @Test
    fun rejectsBundleWithoutVersionMetadata() {
        val current = bundle("patches-1.0.2-dev.1.mpp", null)
        assertThrows(IllegalArgumentException::class.java) { readBundleVersion(current) }
    }

    private fun bundle(name: String, version: String?): File {
        val manifest = Manifest().apply {
            mainAttributes[Attributes.Name.MANIFEST_VERSION] = "1.0"
            if (version != null) mainAttributes.putValue("Version", version)
        }
        return temporary.newFile(name).also { file ->
            JarOutputStream(file.outputStream(), manifest).use { }
        }
    }
}
