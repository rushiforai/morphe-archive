package app.ckzorigins.patches.compat

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class PropertiesDatTest {
    @Test
    fun `roundtrip keeps the rest of the file and sets OBB_ENABLED to false`() {
        val plain = "FOO=bar\nOBB_ENABLED = true\nBAZ=qux\n"
        val cipher = PropertiesDat.encrypt(plain.toByteArray())
        val updated = PropertiesDat.disableObb(cipher)
        val result = PropertiesDat.decrypt(updated).decodeToString()
        assertEquals("FOO=bar\nOBB_ENABLED = false\nBAZ=qux\n", result)
    }

    @Test
    fun `a line without spaces around the equals sign is still rewritten`() {
        val cipher = PropertiesDat.encrypt("OBB_ENABLED=true\n".toByteArray())
        val result = PropertiesDat.decrypt(PropertiesDat.disableObb(cipher)).decodeToString()
        assertEquals("OBB_ENABLED=false\n", result)
    }

    @Test
    fun `missing OBB_ENABLED fails`() {
        val cipher = PropertiesDat.encrypt("FOO=bar\n".toByteArray())
        assertFailsWith<app.morphe.patcher.patch.PatchException> {
            PropertiesDat.disableObb(cipher)
        }
    }
}
