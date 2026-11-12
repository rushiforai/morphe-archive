package app.template.patches.steamlink.androidxr

import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

class RetiredProjectionResourcesTest {
    private val alpha0Library = "libgxr_ast.so"
    private val alpha0TwoProjectionLibrary = "libgxr_ast_5001712.so"
    private val alpha0Manifest = "XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json"

    @Test
    fun `bundled alpha0 resources are restored`() {
        listOf(alpha0Library, alpha0TwoProjectionLibrary, alpha0Manifest).forEach { resource ->
            assertNotNull(javaClass.getResourceAsStream("/steamlink/androidxr/$resource"), resource)
        }
    }

    @Test
    fun `retired layer, projection and permission-matrix resources are absent`() {
        listOf(
            "libgxr_foveal_canvas.so",
            "XR_APILAYER_local_GalaxyXR_foveal_canvas.json",
            "libgxr_surface_video.so",
            "libgxr_surface_video_trigger.so",
            "XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json",
            "XR_APILAYER_local_GalaxyXR_surface_video_v1.json",
            "libgxr_asf.so",
            "XR_APILAYER_local_GalaxyXR_android_surface_fovea_v1.json",
            "libgxr_ast_underside.so",
            "XR_APILAYER_local_GalaxyXR_android_surface_underside_projection_v1.json",
            "libgxr_pst.so",
            "XR_APILAYER_local_GalaxyXR_permission_surface_trace_v1.json",
            "libgxr_nqv.so",
            "libgxr_nqvd.so",
            "libgxr_nsp.so",
            "libgxr_nspd.so",
            "libgxr_nspp.so",
            "libgxr_single_projection_reconstruction_efficient_v1.so",
            "XR_APILAYER_local_GalaxyXR_single_projection_reconstruction_efficient_v1.json",
            "libgxr_ast_warmup_omit.so",
            "XR_APILAYER_local_GalaxyXR_android_surface_trigger_warmup_omit_v1.json",
            "libgxr_ast_dfr_rearm.so",
            "XR_APILAYER_local_GalaxyXR_android_surface_trigger_dfr_rearm_v1.json",
        ).forEach { resource ->
            assertNull(javaClass.getResourceAsStream("/steamlink/androidxr/$resource"), resource)
        }
    }

    @Test
    fun `alpha0 trigger is restored while appear on top stays gone`() {
        val optional = source("patches/src/main/kotlin/app/template/patches/steamlink/androidxr/OptionalXrPatches.kt")
        listOf("alpha0HighResolutionTriggerPatch", "name = \"Alpha-0", "androidSurfaceTriggerResourcesPatch",
            "installProjectionModeResources", "projectionModesConflict").forEach { restored ->
            assertTrue(optional.contains(restored), restored)
        }
        listOf("appearOnTopPatch", "name = \"Appear on top", "appearOnTopManifestPatch").forEach { removed ->
            assertFalse(optional.contains(removed), removed)
        }
    }

    @Test
    fun `retired cleanup removes retired layers and keeps active helpers`() {
        val root = java.nio.file.Files.createTempDirectory("retired-projection").toFile()
        try {
            val lib = File(root, "lib").apply { mkdirs() }
            val layers = File(root, "layers").apply { mkdirs() }
            val retired = listOf(
                File(lib, "libgxr_surface_video.so"), File(layers, "XR_APILAYER_local_GalaxyXR_surface_video_v1.json"),
                File(lib, "libgxr_surface_video_trigger.so"),
                File(layers, "XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json"),
                File(lib, "libgxr_foveal_canvas.so"), File(layers, "XR_APILAYER_local_GalaxyXR_foveal_canvas.json"),
            ).onEach { it.writeText("retired") }
            val unrelated = File(lib, "unrelated.so").apply { writeText("preserved") }
            val stockQuad = File(lib, STOCK_QUAD_LIBRARY).apply { writeText("keep") }
            val alpha0 = File(lib, alpha0Library).apply { writeText("keep") }
            repeat(2) { removeRetiredProjectionResources(lib, layers) }
            retired.forEach { assertFalse(it.exists(), it.name) }
            assertEquals("preserved", unrelated.readText())
            assertTrue(stockQuad.isFile)
            assertTrue(alpha0.isFile)
        } finally { root.deleteRecursively() }
    }

    @Test
    fun `alpha0 library names are not treated as a native renderer hook`() {
        assertNull(retiredNativeProjectionHook("prefix $alpha0Library suffix".toByteArray()))
        assertEquals("libgxr_ast_underside.so",
            retiredNativeProjectionHook("prefix libgxr_ast_underside.so suffix".toByteArray()))
    }

    private fun source(relativePath: String): String = listOf(
        File(relativePath),
        File("../$relativePath"),
    ).firstOrNull(File::isFile)?.readText() ?: error("Missing source: $relativePath")
}
