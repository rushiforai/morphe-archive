package patches.deezer

import java.util.Base64
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Guards the hand-carried 9.0.27.3 protected-startup data against truncation or lost entries. */
class StartupCompatibility2703Test {
    @Test
    fun startupStringTableRetainsEveryCapturedApplicationConstant() {
        val table = startupStringValues()
        assertEquals(32, table.size)
        assertEquals(1_560, table.values.sumOf { it.size })
        assertTrue(table.keys.all { it.startsWith("L") && it.endsWith(";") })
        table.forEach { (owner, values) ->
            assertTrue("$owner has no captured values", values.isNotEmpty())
            assertTrue("$owner has an empty field name", values.keys.all { it.isNotEmpty() })
        }
    }

    @Test
    fun nativeRestorationCoversAllThreeSupportedAbisWithoutEmbeddingWholeLibraries() {
        val restores = nativeStartupRestores()
        assertEquals(9, restores.size)
        assertEquals(restores.size, restores.map { it.path }.toSet().size)
        assertEquals(setOf("arm64-v8a", "x86", "x86_64"), restores.map {
            it.path.removePrefix("lib/").substringBefore('/')
        }.toSet())
        restores.forEach { restore ->
            assertTrue(restore.path.startsWith("lib/") && restore.path.endsWith(".so"))
            assertEquals(64, restore.inputHash.length)
            assertEquals(64, restore.outputHash.length)
            assertTrue(restore.outputSize > 0)
            val delta = Base64.getDecoder().decode(restore.delta)
            assertTrue("${restore.path} has no delta", delta.isNotEmpty())
            assertTrue("${restore.path} delta is not compressed", delta[0] == 0x1f.toByte() && delta[1] == 0x8b.toByte())
        }
    }
}
