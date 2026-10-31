package io.github.emotionbug.patches.runtime;

import android.content.Context;
import android.content.ContextWrapper;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.SQLiteMode;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 29)
@SQLiteMode(SQLiteMode.Mode.NATIVE)
public final class ModelUpdateTest {
    @Rule public final TemporaryFolder temporary = new TemporaryFolder();
    private Context context;
    private SummaryStore store;

    @Before public void open() throws Exception {
        File root = temporary.newFolder();
        context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getNoBackupFilesDir() { return root; }
        };
        store = new SummaryStore(context);
    }

    @After public void close() { store.close(); }

    @Test public void updatedModelNeverReadsPreviousHashCapacityOrMessage() {
        String oldHash = hash("old"), newHash = hash("new");
        ModelDownloadProgress old = new ModelDownloadProgress(oldHash, "old-transfer", "ready", 2590000000L, "Old model ready");
        ModelDownloadProgress current = ModelDownloadProgress.read(old.encode(), newHash, null);
        assertEquals(0, current.bytes);
        assertEquals("absent", current.state);
        assertEquals("", current.message);
        assertEquals(0, ModelDownloadProgress.read(old.encode(), oldHash, "new-transfer").bytes);
        assertEquals(2590000000L, ModelDownloadProgress.read(old.encode(), oldHash, null).bytes);
        assertEquals(0, ModelDownloadProgress.read("", newHash, null).bytes);
    }


    @Test public void failedIntegrityPreservesInstalledModelAndRetryPublishesBeforeCleanup() throws Exception {
        SummaryModel old = model(SummaryModel.Role.GEMMA, "old weights");
        SummaryModel updated = model(SummaryModel.Role.GEMMA, "new weights");
        put(old.file(context), "old weights");
        store.setSetting(old.role.verifiedKey, old.sha256);
        assertTrue(updated.outdated(context, store));
        put(updated.part(context), "bad weights");
        assertThrows(IOException.class, () -> updated.publish(context, store, updated.size, hash("bad weights")));
        assertEquals(old.sha256, store.setting(old.role.verifiedKey, ""));
        assertTrue(old.file(context).isFile());
        assertFalse(updated.file(context).exists());
        Files.delete(updated.part(context).toPath());
        put(updated.part(context), "new weights");
        updated.publish(context, store, updated.size, updated.sha256);
        assertEquals(updated.sha256, store.setting(old.role.verifiedKey, ""));
        assertTrue(old.file(context).isFile());
        assertTrue(updated.file(context).isFile());
        assertFalse(updated.part(context).exists());
        updated.removeObsolete(context);
        assertFalse(old.file(context).exists());
        assertFalse(updated.outdated(context, store));
    }

    @Test public void sizeFailureAndRenameFailureLeaveOldPublicationUntouched() throws Exception {
        SummaryModel old = model(SummaryModel.Role.WHISPER, "old");
        SummaryModel updated = model(SummaryModel.Role.WHISPER, "new");
        put(old.file(context), "old");
        store.setSetting(old.role.verifiedKey, old.sha256);
        put(updated.part(context), "short");
        assertThrows(IOException.class, () -> updated.publish(context, store, 5, hash("short")));
        Files.delete(updated.part(context).toPath());
        put(updated.part(context), "new");
        assertTrue(updated.file(context).mkdir());
        put(new File(updated.file(context), "prevent-replacement"), "x");
        assertThrows(IOException.class, () -> updated.publish(context, store, updated.size, updated.sha256));
        assertEquals(old.sha256, store.setting(old.role.verifiedKey, ""));
        assertTrue(old.file(context).isFile());
    }

    @Test public void gemmaCleanupLeavesWhisperOtherExtensionsAndPartialTransfersUntouched() throws Exception {
        SummaryModel old = model(SummaryModel.Role.GEMMA, "old");
        SummaryModel updated = model(SummaryModel.Role.GEMMA, "new");
        SummaryModel whisper = model(SummaryModel.Role.WHISPER, "speech");
        put(old.file(context), "old");
        put(updated.file(context), "new");
        put(whisper.file(context), "speech");
        File pending = new File(updated.directory(context), hash("pending") + ".part");
        File otherExtension = new File(updated.directory(context), hash("other") + ".bin");
        File unrelated = new File(updated.directory(context), "notes.litertlm");
        put(pending, "partial"); put(otherExtension, "other"); put(unrelated, "unrelated");
        updated.removeObsolete(context);
        assertFalse(old.file(context).exists());
        assertTrue(updated.file(context).isFile());
        assertTrue(whisper.file(context).isFile());
        assertTrue(pending.isFile()); assertTrue(otherExtension.isFile()); assertTrue(unrelated.isFile());
    }

    private static SummaryModel model(SummaryModel.Role role, String bytes) throws Exception {
        return new SummaryModel(role, new JSONObject().put("id", "fixture").put("title", "Fixture model")
                .put("url", "https://example.invalid/model").put("sha256", hash(bytes))
                .put("size", bytes.getBytes(StandardCharsets.UTF_8).length)
                .put("licenseUrl", "https://example.invalid/license").put("licenseName", "Fixture"));
    }
    private static String hash(String bytes) {
        return SummaryModel.hex(SummaryModel.digest().digest(bytes.getBytes(StandardCharsets.UTF_8)));
    }
    private static void put(File file, String bytes) throws IOException {
        if (!file.getParentFile().isDirectory() && !file.getParentFile().mkdirs()) throw new IOException("Unable to create fixture directory");
        Files.write(file.toPath(), bytes.getBytes(StandardCharsets.UTF_8));
    }
}
