package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertSame
import kotlin.test.assertTrue
import java.nio.file.Files

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

    @Test
    fun `missing ids xml receives a valid empty resource document`() {
        val root = Files.createTempDirectory("change-package-ids").toFile()
        try {
            val ids = root.resolve("res/values/ids.xml")
            ensureChangePackageIdsXml(ids)

            assertTrue(ids.isFile)
            assertEquals(CHANGE_PACKAGE_IDS_XML_FALLBACK, ids.readText())
            ensureChangePackageIdsXml(ids)
            assertEquals(CHANGE_PACKAGE_IDS_XML_FALLBACK, ids.readText())
        } finally {
            root.deleteRecursively()
        }
    }
}
