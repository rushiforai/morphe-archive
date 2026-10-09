package app.morphe.patches.tiktok.misc.optimizer

import app.morphe.Fixtures
import java.util.zip.ZipFile
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The core asset strip empties Pitaya's Python runtime on the grounds that nothing left in the
 * APK can load it. Its five libraries link only one another (StrippedLibrariesAreLeavesTest holds
 * that part), and the only code that names them is Pitaya's feature dex, emptied by the same strip.
 * libreschecker lists two of them, the way it lists TTNativeML, which the strip has emptied since
 * 2026-09-17 with TikTok running fine. A build whose own dex or another library starts naming the
 * runtime would load an empty file, so this reads every dex and native library of every fixture
 * for the names. Without a fixture it's skipped rather than passed.
 */
class PythonRuntimeLoadersTest {
    @Test
    fun `only the stripped Pitaya feature names the Python runtime`() {
        val offenders = mutableListOf<String>()
        for (apk in Fixtures.apks()) {
            val holders = sortedSetOf<String>()
            ZipFile(apk).use { zip ->
                for (entry in zip.entries()) {
                    val name = entry.name
                    val scanned = DEX.matches(name) || (name.startsWith("lib/") && name.endsWith(".so"))
                    if (!scanned) continue
                    // Latin-1 maps each byte to one char, so String.contains is a byte search.
                    val text = zip.getInputStream(entry).use { String(it.readBytes(), Charsets.ISO_8859_1) }
                    if (NAMES.any { it in text }) holders += name
                }
            }
            assertTrue("${apk.name}: the scan found Pitaya's feature dex naming nothing, so it reads nothing",
                "lib/arm64-v8a/libdex_df_pitaya.so" in holders)
            holders.filterNot { it.substringAfterLast('/') in ALLOWED }.forEach { offenders += "${apk.name}: $it" }
        }
        assertEquals("code outside the stripped set that names the Python runtime", emptyList<String>(), offenders)
    }

    private companion object {
        val DEX = Regex("""classes\d*\.dex""")
        val NAMES = listOf("pythonA", "BDPythonVM", "BDMicroPythonVM", "py-numpy", "py-cv-numpycv")
        val ALLOWED = setOf(
            "libpythonA.so", "libBDPythonVM.so", "libBDMicroPythonVM.so", "libpy-numpy.so", "libpy-cv-numpycv.so",
            "libdex_df_pitaya.so", "libreschecker.so",
        )
    }
}
