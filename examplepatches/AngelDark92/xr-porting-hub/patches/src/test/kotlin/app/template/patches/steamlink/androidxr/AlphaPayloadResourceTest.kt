package app.template.patches.steamlink.androidxr

import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotEquals
import kotlin.test.assertTrue

/**
 * Portable pins for the original Alpha-0 payload blobs. The tests read the tracked resources only,
 * so they run on a fresh checkout without any decoded APK tree.
 */
class AlphaPayloadResourceTest {
    @Test
    fun `original alpha0 helpers match their byte pins`() {
        val threeProjection = projectionModeResource(ANDROID_SURFACE_TRIGGER_LIBRARY)
        val twoProjection = projectionModeResource(ANDROID_SURFACE_TRIGGER_5001712_RESOURCE_LIBRARY)
        assertEquals(957_272, threeProjection.size)
        assertEquals("9c17f1ab91dc3d3b6bd958838ab2e6111340472a8e4a9c2a2e5d931b377de619", sha256(threeProjection))
        assertEquals(957_240, twoProjection.size)
        assertEquals("462c367fe2dc27b8f1c3a5c8089d588f704132a0ba1793b9a54158fe1b375933", sha256(twoProjection))
        listOf(threeProjection, twoProjection).forEach { payload ->
            assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), payload.copyOfRange(0, 4))
        }
        assertNotEquals(sha256(threeProjection), sha256(twoProjection))
    }

    @Test
    fun `each alpha0 helper carries only its own build id`() {
        val threeProjection = projectionModeResource(ANDROID_SURFACE_TRIGGER_LIBRARY)
            .toString(Charsets.ISO_8859_1)
        val twoProjection = projectionModeResource(ANDROID_SURFACE_TRIGGER_5001712_RESOURCE_LIBRARY)
            .toString(Charsets.ISO_8859_1)
        assertTrue(threeProjection.contains(ANDROID_SURFACE_TRIGGER_BUILD_ID))
        assertFalse(threeProjection.contains(ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID))
        assertTrue(twoProjection.contains(ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID))
        assertFalse(twoProjection.contains(ANDROID_SURFACE_TRIGGER_BUILD_ID))
    }

    @Test
    fun `alpha0 layer manifest is pinned text with lf endings`() {
        val manifest = projectionModeResource(ANDROID_SURFACE_TRIGGER_MANIFEST)
        assertEquals(404, manifest.size)
        assertEquals("107b2f16c16356db09bd75a86fc706c91d385abdf5382b2f8b621979e55d56a4", sha256(manifest))
        assertFalse(manifest.contains('\r'.code.toByte()))
        val text = manifest.toString(Charsets.UTF_8)
        assertTrue(text.contains("\"library_path\": \"$ANDROID_SURFACE_TRIGGER_LIBRARY\""))
        assertTrue(text.contains(ANDROID_SURFACE_TRIGGER_MODE))
    }

    private fun sha256(bytes: ByteArray) =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
}
