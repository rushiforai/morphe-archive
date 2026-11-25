package nl.johninnl.gboard;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileOutputStream;

import org.junit.Test;

public class ParakeetStoreTest {
    @Test
    public void sealsTheRuntimeLibrarySoAndroidLoadsIt() throws Exception {
        // Android 17 refuses System.load of a file the app can still write (THROW_ERROR_FOR_WRITABLE_DCL).
        File library = File.createTempFile("libsherpa", ".so");
        try {
            try (FileOutputStream out = new FileOutputStream(library)) {
                out.write(1);
            }
            assertTrue(library.canWrite());
            assertTrue(ParakeetStore.sealLibrary(library));
            assertFalse(library.canWrite());
            assertTrue(library.canRead());
            assertTrue(ParakeetStore.sealLibrary(library));
            assertTrue("a sealed library can still be replaced", library.delete());
        } finally {
            library.delete();
        }
    }
}
