package io.github.liongalahad.nuviotv.extension.settings

import org.junit.Assert.assertEquals
import org.junit.Test

class MorpheStoragePathTest {
    @Test fun `primary document path keeps the existing compact label`() {
        assertEquals(
            "Movies/Nuvio",
            MorpheStoragePath.displayLabelForDocumentId(
                "primary:Movies/Nuvio",
                "Internal storage"
            )
        )
    }

    @Test fun `removable document path identifies its selected device`() {
        assertEquals(
            "Samsung SD card/Movies",
            MorpheStoragePath.displayLabelForDocumentId(
                "0000-0000:Movies",
                "Samsung SD card"
            )
        )
    }

    @Test fun `removable document root has an understandable fallback label`() {
        assertEquals(
            "External storage",
            MorpheStoragePath.displayLabelForDocumentId("0000-0000:", null)
        )
    }
}
