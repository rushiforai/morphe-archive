package app.template.patches.steamlink.androidxr

import java.io.File
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

class AndroidSurfaceTriggerResourceTest {
    @Test
    fun `production is the only active resolution mode`() {
        assertFalse(projectionModesConflict("", ANDROID_SURFACE_TRIGGER_MODE))
        assertFalse(projectionModesConflict(ANDROID_SURFACE_TRIGGER_MODE, ANDROID_SURFACE_TRIGGER_MODE))
        listOf(
            "android_surface_underside_projection_v1",
            "android_surface_trigger_dfr_rearm_v1",
            "single_projection_reconstruction_v1",
            "single_projection_reconstruction_efficient_v1",
            "single_projection_native_renderer_v1",
            "single_projection_native_renderer_dual_v1",
            "single_projection_native_probe_v1",
            "two_projection_drop_base_v1",
            "three_projection_sampler_proxy_v1",
        ).forEach { retired ->
            assertFalse(projectionModesConflict(retired, ANDROID_SURFACE_TRIGGER_MODE), retired)
        }
    }

    @Test
    fun `surface trigger manifest and source preserve Valve projections`() {
        val manifest = requireNotNull(javaClass.getResource(
            "/steamlink/androidxr/$ANDROID_SURFACE_TRIGGER_MANIFEST",
        )).readText()
        assertTrue(manifest.contains("\"library_path\": \"$ANDROID_SURFACE_TRIGGER_LIBRARY\""))
        assertTrue(manifest.contains("GXR_DISABLE_ANDROID_SURFACE_TRIGGER"))

        val source = source("extensions/resolution-trace-layer/src/android_surface_trigger_passthrough_layer.cpp")
        listOf(
            ANDROID_SURFACE_TRIGGER_MODE,
            ANDROID_SURFACE_TRIGGER_BUILD_ID,
            "XR_KHR_ANDROID_SURFACE_SWAPCHAIN_EXTENSION_NAME",
            "xrCreateSwapchainAndroidSurfaceKHR",
            "ANativeWindow_fromSurface",
            "WINDOW_FORMAT_RGBA_8888",
            "surface_buffer_queued",
            "surface_trigger_frame",
            "XrCompositionLayerQuad triggerQuad{}",
            "copiedLayers[index] = base",
            "!state->passthroughLogged.load",
            "++state->appendedFrames",
            "forcedExtensionAttempt",
            "extensionRequestResult",
            "surfaceFunctionLookupAttempted",
            "surfaceFunctionLoaded",
            "future RGB10_A2 Valve swapchain passes through unchanged",
            "originalPointersPreserved",
            "noCopy",
            "noReconstruction",
            "outputLayerCount",
            "XR_REFERENCE_SPACE_TYPE_VIEW",
            "maxLayerCount < kRequiredLayerCount",
            "GXR_AST_SOURCE_PROJECTION_COUNT",
            "kSourceProjectionCount + 1",
            "layers[kSourceProjectionCount]",
            "XR_SESSION_STATE_VISIBLE",
            "XR_SESSION_STATE_FOCUSED",
            "XR_SWAPCHAIN_USAGE_SAMPLED_BIT",
            "std::shared_ptr<SessionState>",
            "gxr::SessionRegistry<XrSession, SessionState>",
            "sessions.findForFrame(session, renderSessionCache)",
            "if (result != XR_SUCCESS || !data) return result",
            "std::mutex swapchainsMutex",
        ).forEach { invariant -> assertTrue(source.contains(invariant), invariant) }
        listOf("format=0", "sampleCount=0", "faceCount=0", "arraySize=0", "mipCount=0")
            .forEach { invariant -> assertTrue(source.replace(" ", "").contains(invariant), invariant) }
        assertTrue(source.replace(" ", "").contains("output.layers=layers.data()"))
        assertTrue(source.replace(" ", "").contains("constboolappended=!appEnabled"))
        assertFalse(source.contains("info->layers[2]"))
        assertTrue(source.contains("nextCreateApiLayerInstance(createInfo, &next, instance)"))
        assertFalse(source.contains("glDrawArrays"))
        assertFalse(source.contains("glBlitFramebuffer"))
        assertFalse(source.contains("PFN_xrEnumerateSwapchainImages"))
        assertFalse(source.contains("PFN_xrAcquireSwapchainImage"))
        assertFalse(source.contains("PFN_xrWaitSwapchainImage"))
        assertFalse(source.contains("PFN_xrReleaseSwapchainImage"))
        assertFalse(source.contains("XrCompositionLayerQuad quad{}"))
        assertFalse(source.contains("GXR_AST_DFR_REARM"))
        assertFalse(source.contains("surface_trigger_rearm"))
        assertFalse(source.contains("appendedFrames.fetch_add"))
        assertFalse(source.contains("cachedSession.lock()"))
        val registry = source("extensions/resolution-trace-layer/src/session_registry.h")
        assertTrue(registry.contains("generation_.load(std::memory_order_acquire)"))
        assertTrue(registry.contains("generation_.fetch_add(1, std::memory_order_release)"))
        assertTrue(registry.contains("std::map<Handle, std::shared_ptr<State>>"))
        assertTrue(registry.contains("State* findForFrame"))
        assertTrue(registry.contains("cache.registry == this"))

        val patchSource = source(
            "patches/src/main/kotlin/app/template/patches/steamlink/androidxr/OptionalXrPatches.kt",
        )
        assertTrue(patchSource.contains("ANDROID_SURFACE_TRIGGER_MANIFEST"))
        assertTrue(patchSource.contains("retiredNativeProjectionHook(sceneFile.readBytes())"))
        assertFalse(patchSource.contains("STOCK_SCENE_SHA256"))
        assertTrue(patchSource.contains("permission_surface_trace_v1"))
        assertTrue(patchSource.contains("libgxr_pst.so"))
        assertTrue(patchSource.contains("libgxr_nspp.so"))
        assertTrue(patchSource.contains("future RGB10_A2"))
        assertTrue(patchSource.contains("activeProjectionModes.first { it.mode == requestedMode }"))
        assertTrue(patchSource.contains("android_surface_trigger_dfr_rearm_v1"))
        assertTrue(patchSource.contains("libgxr_ast_dfr_rearm.so"))
        assertFalse(patchSource.contains("ANDROID_SURFACE_DFR_REARM_MODE"))
        assertFalse(patchSource.contains("experimentalAndroidSurfaceDfrRearmPatch"))
        assertTrue(patchSource.contains("android_surface_trigger_warmup_omit_v1"))
        assertTrue(patchSource.contains("libgxr_ast_warmup_omit.so"))
        assertFalse(patchSource.contains("nativeProjectionHelperPatch"))
        assertFalse(patchSource.contains("patchNativeEndFrameHelper"))
        assertFalse(patchSource.contains("gxrEndFrame"))
        assertTrue(patchSource.contains("android_surface_underside_projection_v1"))
        assertTrue(patchSource.contains("libgxr_ast_underside.so"))
        assertFalse(patchSource.contains("surfacePlacementOption"))
        assertTrue(xrGalaxyXrHighResolutionPatch.options.isEmpty())
        assertFalse(source.contains("GXR_AST_REPLACE_UNDERSIDE"))
        // Legacy bundles also select this dependency on older unverified topologies. The
        // finalizer must skip before reading/mutating the manifest, just like resource setup.
        val finalizer = patchSource.substringAfter("val xrGalaxyXrHighResolutionPatch")
            .substringAfter("finalize {")
        val guard = finalizer.indexOf("if (!isHighResolutionSteamLinkBuild(")
        assertTrue(guard >= 0 && guard < finalizer.indexOf("document(\"AndroidManifest.xml\")"))
        assertTrue(finalizer.contains("return@finalize"))
    }

    @Test
    fun `5001712 alone selects the 2 projection helper resource`() {
        assertEquals(
            ANDROID_SURFACE_TRIGGER_5001712_RESOURCE_LIBRARY,
            androidSurfaceTriggerResourceLibraryForBuild("2.0.20", "5001712"),
        )
        listOf("5002244", "5002296", "5002313", "5002318", "5002322").forEach {
            assertEquals(
                ANDROID_SURFACE_TRIGGER_LIBRARY,
                androidSurfaceTriggerResourceLibraryForBuild("2.0.22", it),
                it,
            )
        }
        assertEquals(
            ANDROID_SURFACE_TRIGGER_LIBRARY,
            androidSurfaceTriggerResourceLibraryForBuild("2.0.22", "5001712"),
        )
    }

    @Test
    fun `final patch accepts ordinary scene mutations but rejects retired native hooks`() {
        assertNull(retiredNativeProjectionHook("ordinary guarded scene mutation".toByteArray()))
        assertEquals(
            "libgxr_nspp.so",
            retiredNativeProjectionHook("prefix libgxr_nspp.so suffix".toByteArray()),
        )
        assertEquals(
            "libgxr_nqvd.so",
            retiredNativeProjectionHook("prefix libgxr_nqvd.so suffix".toByteArray()),
        )
    }

    @Test
    fun `bundled helper is the surface-only API layer`() {
        val helper = requireNotNull(
            javaClass.getResourceAsStream("/steamlink/androidxr/$ANDROID_SURFACE_TRIGGER_LIBRARY"),
        ).use { it.readBytes() }
        assertContentEquals(byteArrayOf(0x7F, 0x45, 0x4C, 0x46), helper.copyOfRange(0, 4))
        assertEquals(
            "5db15199e6e3bcd5602b4fc04ad4e61a38916a5d1957c3dd25662e4c36c7aebf",
            MessageDigest.getInstance("SHA-256").digest(helper)
                .joinToString("") { "%02x".format(it) },
        )
        val strings = helper.toString(Charsets.ISO_8859_1)
        listOf(
            ANDROID_SURFACE_TRIGGER_MODE,
            ANDROID_SURFACE_TRIGGER_BUILD_ID,
            "XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1",
            "XR_KHR_android_surface_swapchain",
            "xrCreateSwapchainAndroidSurfaceKHR",
            "surface_buffer_queued",
            "surface_trigger_frame",
        ).forEach { invariant -> assertTrue(strings.contains(invariant), invariant) }
        listOf(
            "reconstruction",
            "single_projection_native_probe_v1",
            "decoder_probe_initialized",
            "surface_trigger_warmup_started",
            "surface_trigger_quad_omitted",
            "xrWaitFrame",
            "ATrace_",
            ".debug_info",
        )
            .forEach { retired -> assertFalse(strings.contains(retired), retired) }
    }

    @Test
    fun `5001712 helper is isolated 2 to 3 layer payload`() {
        val helper = requireNotNull(
            javaClass.getResourceAsStream(
                "/steamlink/androidxr/$ANDROID_SURFACE_TRIGGER_5001712_RESOURCE_LIBRARY",
            ),
        ).use { it.readBytes() }
        assertContentEquals(byteArrayOf(0x7F, 0x45, 0x4C, 0x46), helper.copyOfRange(0, 4))
        assertEquals(
            "e40ce72fb3c9e430ed99b949acc1678319120add329ad08e355e2ea448ded60b",
            MessageDigest.getInstance("SHA-256").digest(helper)
                .joinToString("") { "%02x".format(it) },
        )
        val strings = helper.toString(Charsets.ISO_8859_1)
        listOf(
            ANDROID_SURFACE_TRIGGER_MODE,
            ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID,
            "XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1",
            "surface_trigger_frame",
            "surface_trigger_submission",
        ).forEach { invariant -> assertTrue(strings.contains(invariant), invariant) }
        assertFalse(strings.contains(ANDROID_SURFACE_TRIGGER_BUILD_ID))
        assertFalse(strings.contains("sourcePointer2"))
    }

    @Test
    fun `retired projection and permission-matrix resources are absent`() {
        listOf(
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

    private fun source(relativePath: String): String = listOf(
        File(relativePath),
        File("../$relativePath"),
    ).firstOrNull(File::isFile)?.readText() ?: error("Missing source: $relativePath")
}
