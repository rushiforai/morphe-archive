package app.deadcrossing.patches.compat

import app.adebisi.patches.shared.emptySdkPrefixes
import app.adebisi.patches.shared.rewriteOriginalDexThroughDexPool
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull
import kotlin.test.assertTrue

class EmptyYoumiSdksTest {
    @Test
    fun `Youmi class count is locked and the patch is unnamed`() {
        assertEquals("Lnet/youmi/", YOUMI_PREFIX)
        assertEquals(153, YOUMI_CLASSES)
        assertEquals("net.youmi.android.appoffers.YoumiOffersActivity", YOUMI_ACTIVITY)
        assertEquals(listOf("YOUMI_APP_ID", "YOUMI_PASSWORD"), YOUMI_META_KEYS)
        assertNull(emptyYoumiSdksPatch.name)
        assertTrue(YOUMI_PREFIX.startsWith("Lnet/youmi"))
    }

    @Test
    fun `orig dex is rewritten so Youmi URL constants leave the string pool`() {
        assertEquals("rewriteOriginalDexThroughDexPool", ::rewriteOriginalDexThroughDexPool.name)
        assertEquals("emptySdkPrefixes", ::emptySdkPrefixes.name)
        assertTrue(YOUMI_META_KEYS.none { it.contains("IAP", ignoreCase = true) })
    }
}
