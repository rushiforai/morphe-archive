package app.pigfoot.patches

import app.pigfoot.patches.camscanner.*
import org.junit.Assert.*
import org.junit.Test

class CamScannerVersionsTest {
    @Test fun exactVersionCodePairsRejectMixedAndUnqualifiedInputs() {
        assertEquals(2, qualifiedCamScannerVersion("7.26.5.2609160000", "72651").cacheResultRegister)
        assertEquals(3, qualifiedCamScannerVersion("7.27.0.2609220000", "72701").cacheResultRegister)
        for ((name, code) in listOf("7.27.0.2609220000" to "72651", "7.26.5.2609160000" to "72701",
                "7.27.5.2610150000" to "72751", "7.28.0" to "72801")) {
            assertThrows(IllegalArgumentException::class.java) { qualifiedCamScannerVersion(name, code) }
        }
    }
    @Test fun newPinsDoNotRelaxOrMutateOldPristineProfile() {
        val old = qualifiedCamScannerVersion("7.26.5.2609160000", "72651")
        val new = qualifiedCamScannerVersion("7.27.0.2609220000", "72701")
        assertEquals(originalClassPins, old.classPins)
        assertEquals(107, new.classPins.size)
        assertEquals(7, originalClassPins.keys.count { old.classPins[it] != new.classPins[it] })
        val account = "Lcom/intsig/comm/account_data/AccountPreference;"
        assertEquals("fd50859c64d48d64c1403215a3d5cfd411c415588dd3bb9ea119466c5279091d", old.classPins[account])
        assertEquals("72eff0c4a0c914664415914eba6e08d6b048bdaee8c2f6c8d78103270c27a007", new.classPins[account])
        assertNotEquals(old.modelPin, new.modelPin)
    }
}
