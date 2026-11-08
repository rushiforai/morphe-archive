package app.sqzass.patches.shared.cert

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull

class CertExtractorTest {

    @Test
    fun testCertPopulationAndReset() {
        val dummyCert = "dummy-certificate-bytes".toByteArray(Charsets.UTF_8)
        populateFromEncoded(dummyCert, "test")

        assertNotNull(autoSha256)
        assertNotNull(autoSha1)
        assertNotNull(autoBase64Der)
        assertEquals(64, autoSha256?.length)
        assertEquals(40, autoSha1?.length)

        resetCertState()

        assertNull(autoSha256)
        assertNull(autoSha1)
        assertNull(autoBase64Der)
    }
}

