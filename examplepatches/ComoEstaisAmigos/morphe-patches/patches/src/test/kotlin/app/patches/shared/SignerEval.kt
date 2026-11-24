package app.adebisi.patches.shared

import app.ckzorigins.patches.nativelib.NativeEdits as OriginsNative
import app.ckzombies.patches.nativelib.NativeEdits as ZombiesNative
import app.deadcrossing.patches.nativelib.NativeEdits as CrossingNative
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotEquals
import kotlin.test.assertTrue

/**
 * What would have caught a re-signed APK whose native libs are still stock.
 *
 * Lib SHA hashes the files. Copying the publisher's libs into another zip and
 * signing with a different key keeps those hashes. The v1 cert SHA-256 does not.
 */
class SignerEval {
    @Test
    fun `each game's lib SHA and cert SHA are different checks`() {
        assertEquals(64, CrossingNative.MONO_REAL_SHA256.length)
        assertEquals(64, FEELINGTOUCH_CERT_SHA256.length)
        assertNotEquals(CrossingNative.MONO_REAL_SHA256, FEELINGTOUCH_CERT_SHA256)
        assertTrue(FEELINGTOUCH_CERT_SHA256.startsWith("02a90ad1"))

        for (hash in ZombiesNative.STOCK_SHA256.values) {
            assertEquals(64, hash.length)
            assertNotEquals(GLU_MOBILE_CERT_SHA256, hash)
        }
        assertEquals(64, OriginsNative.UNITY_SHA256.length)
        assertEquals(64, OriginsNative.GWALLET_SHA256.length)
        assertNotEquals(OriginsNative.UNITY_SHA256, GLU_MOBILE_CERT_SHA256)
        assertNotEquals(OriginsNative.GWALLET_SHA256, GLU_MOBILE_CERT_SHA256)

        assertEquals(64, GLU_MOBILE_CERT_SHA256.length)
        assertTrue(GLU_MOBILE_CERT_SHA256.startsWith("5926ff8c"))
        assertNotEquals(FEELINGTOUCH_CERT_SHA256, GLU_MOBILE_CERT_SHA256)
    }
}
