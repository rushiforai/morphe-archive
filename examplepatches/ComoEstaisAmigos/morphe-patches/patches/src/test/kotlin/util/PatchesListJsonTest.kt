package util

import app.ckzorigins.patches.mono.disableTelemetryPatch
import app.ckzorigins.patches.mono.unlimitedAmmoPatch
import app.ckzombies.patches.compat.modernAndroidPatch
import java.io.File
import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class PatchesListJsonTest {
    private val json by lazy {
        val file = File("../patches-list.json")
        assertTrue(file.isFile, file.absolutePath)
        file.readText()
    }

    @Test
    fun `does not serialize unnamed dependencies as class names`() {
        assertFalse("\"dependencies\"" in json)
        assertFalse("BytecodePatch" in json)
        assertFalse("RawResourcePatch" in json)
        assertFalse("ResourcePatch" in json)
    }

    @Test
    fun `descriptions match the Kotlin sources`() {
        assertTrue(unlimitedAmmoPatch.description!! in json)
        assertTrue(disableTelemetryPatch.description!! in json)
        assertTrue(modernAndroidPatch.description!! in json)
        assertFalse("clamp" in json)
        assertFalse("32-bit" in json)
        assertFalse("method bodies" in json)
    }
}
