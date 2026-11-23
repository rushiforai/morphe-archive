package nl.johninnl.eclipse.auto;

import static org.junit.Assert.assertThrows;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class PinnedCarApiTest {
    @Rule public TemporaryFolder temp = new TemporaryFolder();

    private File apk(String... entries) throws IOException {
        File file = temp.newFile();
        try (ZipOutputStream zip = new ZipOutputStream(new FileOutputStream(file))) {
            for (int i = 0; i < entries.length; i += 2) {
                zip.putNextEntry(new ZipEntry(entries[i]));
                zip.write(entries[i + 1].getBytes(StandardCharsets.UTF_8));
                zip.closeEntry();
            }
        }
        return file;
    }

    private ClassLoader loaderServing(String content) throws IOException {
        File directory = temp.newFolder();
        Files.write(new File(directory, "car-app-api.level").toPath(), content.getBytes(StandardCharsets.UTF_8));
        return new URLClassLoader(new URL[] {directory.toURI().toURL()}, null);
    }

    @Test public void acceptsExactlyOneRootResourceWithThePinnedBytes() throws IOException {
        PinnedCarApi.assertPresent(apk("car-app-api.level", "9\n").getPath(), loaderServing("9\n"));
    }

    @Test public void rejectsAResourceBelowTheApkRoot() throws IOException {
        File archive = apk("car-app-api.level", "9\n", "assets/car-app-api.level", "9\n");
        assertThrows(IllegalStateException.class, () -> PinnedCarApi.assertPresent(archive.getPath(), loaderServing("9\n")));
    }

    @Test public void rejectsAMissingResource() throws IOException {
        File archive = apk("classes.dex", "x");
        assertThrows(IllegalStateException.class, () -> PinnedCarApi.assertPresent(archive.getPath(), loaderServing("9\n")));
    }

    @Test public void rejectsChangedBytesInTheApkOrTheLoader() throws IOException {
        File changed = apk("car-app-api.level", "8\n");
        assertThrows(IllegalStateException.class, () -> PinnedCarApi.assertPresent(changed.getPath(), loaderServing("9\n")));
        File pinned = apk("car-app-api.level", "9\n");
        assertThrows(IllegalStateException.class, () -> PinnedCarApi.assertPresent(pinned.getPath(), loaderServing("9\n9\n")));
    }
}
