package app.patchlab.extension.offlinegames;

import org.junit.Test;
import org.junit.Rule;
import org.junit.rules.TemporaryFolder;
import java.io.File;
import java.nio.file.Files;
import app.patchlab.extension.offlinegames.strictv2.NativeLoadStatus;
import static org.junit.Assert.*;

public class NativeLoadStatusTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();
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

    @Test public void acceptFilesystemAliasButNotSimilarPath() throws Exception {
        File directory = temporary.newFolder("actual directory");
        File alias = new File(temporary.getRoot(), "alias");
        Files.createSymbolicLink(alias.toPath(), directory.toPath());
        assertTrue(NativeLoadStatus.hasExpectedMapping(mapping(directory + "/libil2cpp.so"), alias.toString()));
        assertTrue(NativeLoadStatus.hasExpectedMapping(mapping(alias + "/libil2cpp.so"), directory.toString()));
        assertFalse(NativeLoadStatus.hasExpectedMapping(mapping(directory + "-other/libil2cpp.so"), directory.toString()));
    }

    @Test public void requireAllThreeLibrariesAndExplainWhichOneFailed() {
        String main = mapping(DIR + "/libmain.so");
        String unity = mapping(DIR + "/libunity.so");
        String il2cpp = mapping(DIR + "/libil2cpp.so");
        assertNull(NativeLoadStatus.unityProblem(main + unity + il2cpp, DIR));
        assertTrue(NativeLoadStatus.unityProblem(main + unity, DIR).contains("Missing process mapping for libil2cpp.so"));
        assertTrue(NativeLoadStatus.unityProblem(main + unity + mapping("/data/app/libil2cpp.so"), DIR)
                .contains("Unexpected libil2cpp.so"));
        assertNotNull(NativeLoadStatus.unityProblem(main + unity + il2cpp, null));
    }
}
