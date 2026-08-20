package app.mix.native

import app.morphe.patcher.patch.resourcePatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class NativeLibPatchTest {
    @Test
    fun buildsAResourcePatchWithNormalMetadata() {
        val dependency = resourcePatch(name = "dependency")
        val patch = nativeLibPatch(
            name = "native",
            description = "Native test patch",
            default = false,
        ) {
            libraries("libtest.so")
            dependsOn(dependency)
        }

        assertEquals("native", patch.name)
        assertEquals("Native test patch", patch.description)
        assertEquals(false, patch.default)
        assertTrue(dependency in patch.dependencies)
    }

    @Test
    fun requiresAtLeastOneLibrary() {
        assertFailsWith<IllegalArgumentException> {
            nativeLibPatch(name = "invalid")
        }
    }
}
