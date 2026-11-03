package app.morphe.patches.pinedrama.privacy

import app.morphe.Fixtures
import app.morphe.takes
import com.android.tools.smali.dexlib2.Opcodes
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeTrue
import org.junit.Test

/**
 * The self-package wrapper fingerprint held to the built extension. The extension's own
 * StoreIdentity.packageInfo is static, calls getPackageInfo and caches into a static PackageInfo,
 * which is the wrapper's whole shape. The patcher took PineDrama's V3 only because PineDrama's dex
 * files are searched first; Morphe Desktop's --validate found both and refused the patch.
 */
class StoreIdentityExtensionTest {
    @Test
    fun `the self-package wrapper fingerprint skips the extension's own stand-in`() {
        val stream = javaClass.getResourceAsStream("/extensions/pinedrama.mpe")
        assumeTrue("no built extension dex on the test classpath", stream != null)
        val dex = File.createTempFile("tiktok-extension", ".dex").apply { deleteOnExit() }
        stream!!.use { input -> dex.outputStream().use { input.copyTo(it) } }
        val container = Fixtures.dexContainer(dex, Opcodes.getDefault())
        val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }

        assertTrue("the extension dex has no $STORE_IDENTITY, so this checks nothing", classes.any { it.type == STORE_IDENTITY })
        val taken = classes.flatMap { classDef ->
            classDef.methods.filter { SelfPackageInfoCacheFingerprint.takes(it, classDef) }.map { "${classDef.type}->${it.name}" }
        }
        assertEquals("extension methods the wrapper fingerprint takes", emptyList<String>(), taken)
    }

    private companion object {
        const val STORE_IDENTITY = "Lapp/morphe/extension/pinedrama/privacy/StoreIdentity;"
    }
}
