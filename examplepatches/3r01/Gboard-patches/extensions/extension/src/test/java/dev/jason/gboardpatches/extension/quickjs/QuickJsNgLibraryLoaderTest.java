package dev.jason.gboardpatches.extension.quickjs;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;

import java.io.File;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

@RunWith(RobolectricTestRunner.class)
public final class QuickJsNgLibraryLoaderTest {
    private Path testRoot;
    private Context context;

    @Before
    public void setUp() throws Exception {
        testRoot = Files.createTempDirectory("quickjs-loader-test");
        context = new PayloadContext(RuntimeEnvironment.getApplication(), testRoot.toFile());
    }

    @After
    public void tearDown() throws Exception {
        if (testRoot == null) {
            return;
        }
        try (java.util.stream.Stream<Path> paths = Files.walk(testRoot)) {
            paths.sorted(Comparator.reverseOrder()).forEach(path -> {
                path.toFile().setWritable(true);
                try {
                    Files.deleteIfExists(path);
                } catch (Exception exception) {
                    throw new IllegalStateException(exception);
                }
            });
        }
    }

    @Test
    public void newlyMaterializedPayloadIsReadOnlyBeforeSystemLoad() throws Exception {
        File payload = materializePayload();

        assertTrue(payload.isFile());
        assertFalse("Android 17 rejects writable System.load() files", payload.canWrite());
    }

    @Test
    public void matchingWritableCacheIsReadOnlyBeforeReuse() throws Exception {
        File payload = materializePayload();
        assertTrue(payload.setWritable(true));
        assertTrue(payload.canWrite());

        File reusedPayload = materializePayload();

        assertFalse("cached payload must be hardened before reuse", reusedPayload.canWrite());
    }

    @Test
    public void staleReadOnlyTemporaryPayloadIsReplaced() throws Exception {
        File payload = materializePayload();
        File temporaryPayload = new File(payload.getParentFile(), payload.getName() + ".tmp");
        assertTrue(payload.setWritable(true));
        assertTrue(payload.renameTo(temporaryPayload));
        assertTrue(temporaryPayload.setReadOnly());

        File replacement = materializePayload();

        assertTrue(replacement.isFile());
        assertFalse(replacement.canWrite());
        assertFalse(temporaryPayload.exists());
    }

    private File materializePayload() throws Exception {
        Method method = QuickJsNgLibraryLoader.class.getDeclaredMethod(
                "materializePayload", Context.class);
        method.setAccessible(true);
        return (File) method.invoke(null, context);
    }

    private static final class PayloadContext extends ContextWrapper {
        private final File root;

        private PayloadContext(Context base, File root) {
            super(base);
            this.root = root;
        }

        @Override
        public File getDir(String name, int mode) {
            File directory = new File(root, "app_" + name);
            if (!directory.exists() && !directory.mkdirs()) {
                throw new IllegalStateException("failed to create " + directory);
            }
            return directory;
        }
    }
}
