package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertSame

class ChangePackageNamePatchTest {
    @Test
    fun `default explicit and display suffix selections resolve consistently`() {
        val original = "com.valvesoftware.steamlinkvr"

        assertEquals(
            "$original.gxr" to null,
            resolveRenamedPackage(original, "Default"),
        )
        assertEquals(
            "com.example.steamlink" to null,
            resolveRenamedPackage(original, "com.example.steamlink"),
        )
        assertEquals(
            "$original.galaxy_xr" to "Galaxy XR",
            resolveRenamedPackage(original, "Galaxy XR"),
        )
    }

    @Test
    fun `unchanged explicit package is rejected`() {
        assertFailsWith<PatchException> {
            resolveRenamedPackage("com.valvesoftware.steamlinkvr", "com.valvesoftware.steamlinkvr")
        }
    }

    @Test
    fun `bytecode validation dependency runs before manifest rename with the same option`() {
        val dependency = changePackageNamePatch.dependencies.single()

        assertEquals("BytecodePatch", dependency.javaClass.simpleName)
        assertSame(
            changePackageNamePatch.options["packageName"],
            dependency.options["packageName"],
        )
    }
}
