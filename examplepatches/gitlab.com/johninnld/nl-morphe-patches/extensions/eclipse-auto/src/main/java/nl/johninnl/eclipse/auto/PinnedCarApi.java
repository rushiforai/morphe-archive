package nl.johninnl.eclipse.auto;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Check the emitted/installed base APK as well as the resource the library actually reads. */
final class PinnedCarApi {
    private static final String RESOURCE = "car-app-api.level";

    static void assertPresent(String apk, ClassLoader loader) {
        try (ZipFile archive = new ZipFile(apk)) {
            int copies = 0;
            for (Enumeration<? extends ZipEntry> entries = archive.entries(); entries.hasMoreElements();) {
                String name = entries.nextElement().getName();
                if (name.equals(RESOURCE) || name.endsWith("/" + RESOURCE)) {
                    if (!name.equals(RESOURCE)) throw new IllegalStateException("Car API resource is not at the APK root");
                    copies++;
                }
            }
            if (copies != 1) throw new IllegalStateException("Expected exactly one root car API resource");
            try (InputStream packaged = archive.getInputStream(archive.getEntry(RESOURCE))) { assertBytes(packaged); }
            try (InputStream loaded = loader.getResourceAsStream(RESOURCE)) { assertBytes(loaded); }
        } catch (IOException failure) {
            throw new IllegalStateException("Cannot verify pinned car API resource", failure);
        }
    }

    private static void assertBytes(InputStream source) throws IOException {
        if (source == null || source.read() != '9' || source.read() != '\n' || source.read() != -1) {
            throw new IllegalStateException("Car API resource differs from the pinned library");
        }
    }

    private PinnedCarApi() { }
}
