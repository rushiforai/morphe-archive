package app.pigfoot.patches

import app.pigfoot.patches.camscanner.matchesCamScannerClassPin
import org.junit.Assert.*
import org.junit.Test

class CamScannerClassPinsTest {
    @Test fun runtime2ReportedPristineClassAcceptsBothQualifiedEncodingsNotArbitraryChanges() {
        val legacy = "be3f3ffd66b04f6f649d04e0cb65ccd6181299c49e3459832b6b08dbd20c2af6"
        val runtime2 = "2290dc7d50c2979b0b4d723e5ab08b3ea6a895612b4462df193051bece7cf2ed"
        assertTrue(matchesCamScannerClassPin(legacy, legacy))
        assertTrue(matchesCamScannerClassPin(legacy, runtime2))
        val changed = (if (runtime2[0] == '0') "1" else "0") + runtime2.substring(1)
        assertFalse(matchesCamScannerClassPin(legacy, changed))
        assertFalse(matchesCamScannerClassPin(legacy, ""))
    }
    @Test fun alternateWriterDoesNotAllowSubstitutingAnotherQualifiedAppVersion() {
        val old = "fd50859c64d48d64c1403215a3d5cfd411c415588dd3bb9ea119466c5279091d"
        val newer = "72eff0c4a0c914664415914eba6e08d6b048bdaee8c2f6c8d78103270c27a007"
        val oldRuntime2 = "f3e1ed610ee370212b7a6931f3c25a8e6dfe2ad972c8f6f5c52b0d7321d4240a"
        val newRuntime2 = "e366dc0fbe47c29b980279ae2ac5eec497a4517ecfb189aec9200dc85cfcfb39"
        assertTrue(matchesCamScannerClassPin(old, oldRuntime2))
        assertTrue(matchesCamScannerClassPin(newer, newRuntime2))
        assertFalse(matchesCamScannerClassPin(old, newRuntime2))
        assertFalse(matchesCamScannerClassPin(newer, oldRuntime2))
        assertFalse(matchesCamScannerClassPin(old, newer))
    }
}
