package app.pigfoot.patches

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import org.junit.Assert.*
import org.junit.Test

class BundleContractTest {
    @Test fun extensionContainsOnlyTheInjectedHelper() {
        val artifact = File("build/libs").listFiles()!!.single {
            it.name.endsWith(".mpp") && !it.name.contains("sources") && !it.name.contains("javadoc")
        }
        ZipFile(artifact).use { zip ->
            assertNotNull(zip.getEntry("classes.dex"))
            val bytes = zip.getInputStream(zip.getEntry("extensions/railsgo-bus.mpe")).readBytes()
            val dex = DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes))
            assertEquals(setOf("Lv5/RailsGoBusUpdate;"), dex.classes.map { it.type }.toSet())
            assertFalse(zip.entries().asSequence().any { it.name.startsWith("v5/") || it.name.startsWith("t0/") })
        }
    }
}
