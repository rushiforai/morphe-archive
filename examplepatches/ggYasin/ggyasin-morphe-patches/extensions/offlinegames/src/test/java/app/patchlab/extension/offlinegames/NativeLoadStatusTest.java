package app.patchlab.extension.offlinegames;

import org.junit.Test;
import static org.junit.Assert.*;

public class NativeLoadStatusTest {
    private static final String DIR = "/data/user/0/com.JindoBlu.OfflineGames/app_patchlab-native/abc";
    private static String mapping(String path) {
        return "72000000-73000000 r-xp 00000000 08:01 123 " + path + "\n";
    }

    @Test public void expectedMappingMustActuallyBeLoaded() {
        assertTrue(NativeLoadStatus.hasExpectedMapping(mapping(DIR + "/libil2cpp.so"), DIR));
        assertFalse(NativeLoadStatus.hasExpectedMapping("", DIR));
        assertFalse(NativeLoadStatus.hasExpectedMapping(mapping(DIR + "/libunity.so"), DIR));
    }

    @Test public void rejectStockOrMixedLibraries() {
        String stock = mapping("/data/app/installed/lib/arm/libil2cpp.so");
        assertFalse(NativeLoadStatus.hasExpectedMapping(stock, DIR));
        assertFalse(NativeLoadStatus.hasExpectedMapping(stock + mapping(DIR + "/libil2cpp.so"), DIR));
        assertFalse(NativeLoadStatus.hasExpectedMapping(mapping(DIR + "/libil2cpp.so (deleted)"), DIR));
    }
}
