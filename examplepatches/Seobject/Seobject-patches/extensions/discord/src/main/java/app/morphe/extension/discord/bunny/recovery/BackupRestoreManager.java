package app.morphe.extension.discord.bunny.recovery;

import android.content.Context;
import android.net.Uri;
import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.HashSet;
import java.util.Set;

/** Backup creation plus pre-restore snapshot and rollback transaction. */
final class BackupRestoreManager {
    private static final String TAG = "BunnyRecovery";
    private final Context context;
    private final File bunnyRoot;
    private final RecoveryStore store;

    BackupRestoreManager(Context context, RecoveryStore store) {
        this.context = context;
        this.store = store;
        this.bunnyRoot = new File(context.getFilesDir(), "pyoncord");
    }

    byte[] createBytes(String bunnyVersion) throws Exception {
        JSONObject backup = BunnyBackup.create(bunnyRoot, bunnyVersion);
        return backup.toString(2).getBytes(StandardCharsets.UTF_8);
    }

    byte[] createBytes(String bunnyVersion, Set<String> categories) throws Exception {
        JSONObject backup = BunnyBackup.create(bunnyRoot, bunnyVersion, categories);
        return backup.toString(2).getBytes(StandardCharsets.UTF_8);
    }

    void writeBackup(Uri destination, String bunnyVersion) throws Exception {
        writeBackup(destination, bunnyVersion, BunnyBackup.allCategories());
    }

    void writeBackup(Uri destination, String bunnyVersion, Set<String> categories) throws Exception {
        byte[] bytes = createBytes(bunnyVersion, categories);
        try (OutputStream output = context.getContentResolver().openOutputStream(destination, "wt")) {
            if (output == null) throw new IOException("The selected destination could not be opened");
            output.write(bytes);
        }
    }

    BunnyBackup.Validated inspect(Uri source) throws Exception {
        byte[] bytes = readUri(source);
        BunnyBackup.Validated validated = BunnyBackup.validateAndMigrate(bytes);
        return validated;
    }

    void restore(BunnyBackup.Validated backup) throws Exception {
        byte[] before = createBytes("pre-restore");
        BunnyBackup.Validated previous = BunnyBackup.validateAndMigrate(before);
        Set<String> previousPaths = new HashSet<>();
        for (BunnyBackup.Entry entry : previous.entries) previousPaths.add(entry.path);
        writeInternal(store.file("pre-restore.bunnybackup"), before);
        try {
            apply(backup.entries);
        } catch (Throwable failure) {
            Log.e(TAG, "RESTORE_ROLLBACK", failure);
            try {
                apply(previous.entries);
                for (BunnyBackup.Entry imported : backup.entries) {
                    if (!previousPaths.contains(imported.path)) {
                        File added = safeChild(bunnyRoot, imported.path);
                        if (added.exists() && !added.delete()) {
                            throw new IOException("Could not remove partially restored " + imported.path);
                        }
                    }
                }
            } catch (Throwable rollbackFailure) {
                failure.addSuppressed(rollbackFailure);
            }
            if (failure instanceof Exception) throw (Exception) failure;
            throw new IOException("Restore failed", failure);
        }
    }

    void saveKnownGood(String bunnyVersion) throws Exception {
        writeInternal(store.file("last-known-good.bunnybackup"), createBytes(bunnyVersion));
    }

    boolean hasKnownGood() {
        return store.file("last-known-good.bunnybackup").isFile();
    }

    void restoreKnownGood() throws Exception {
        byte[] bytes = readFile(store.file("last-known-good.bunnybackup"));
        restore(BunnyBackup.validateAndMigrate(bytes));
    }

    private void apply(List<BunnyBackup.Entry> entries) throws Exception {
        File stage = store.file("restore-stage");
        clearDirectory(stage);
        if (!stage.isDirectory() && !stage.mkdirs()) throw new IOException("Could not create restore stage");
        try {
            for (BunnyBackup.Entry entry : entries) {
                File staged = safeChild(stage, entry.path);
                writeInternal(staged, entry.data);
            }
            for (BunnyBackup.Entry entry : entries) {
                File staged = safeChild(stage, entry.path);
                File target = safeChild(bunnyRoot, entry.path);
                File temporary = new File(target.getParentFile(), target.getName() + ".recovery-tmp");
                copyFile(staged, temporary);
                RecoveryStore.atomicReplace(temporary, target);
            }
        } finally {
            clearDirectory(stage);
        }
    }

    private byte[] readUri(Uri uri) throws Exception {
        try (InputStream input = context.getContentResolver().openInputStream(uri)) {
            if (input == null) throw new IOException("The selected backup could not be opened");
            return readBounded(input);
        }
    }

    private static byte[] readFile(File file) throws Exception {
        try (InputStream input = new FileInputStream(file)) { return readBounded(input); }
    }

    private static byte[] readBounded(InputStream input) throws Exception {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[16 * 1024];
        int count;
        while ((count = input.read(buffer)) != -1) {
            output.write(buffer, 0, count);
            BunnyBackup.requireImportSize(output.size());
        }
        return output.toByteArray();
    }

    private static File safeChild(File root, String relative) throws Exception {
        File child = new File(root, relative);
        String rootPath = root.getCanonicalPath() + File.separator;
        if (!child.getCanonicalPath().startsWith(rootPath)) throw new IOException("Restore path escaped its root");
        return child;
    }

    private static void writeInternal(File file, byte[] data) throws Exception {
        File parent = file.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new IOException("Could not create " + parent);
        try (FileOutputStream output = new FileOutputStream(file)) {
            output.write(data);
            output.getFD().sync();
        }
    }

    private static void copyFile(File from, File to) throws Exception {
        File parent = to.getParentFile();
        if (parent != null && !parent.isDirectory() && !parent.mkdirs()) throw new IOException("Could not create " + parent);
        try (InputStream input = new FileInputStream(from); OutputStream output = new FileOutputStream(to)) {
            byte[] buffer = new byte[16 * 1024];
            int count;
            while ((count = input.read(buffer)) != -1) output.write(buffer, 0, count);
        }
    }

    private static void clearDirectory(File file) {
        if (!file.exists()) return;
        File[] children = file.listFiles();
        if (children != null) for (File child : children) clearDirectory(child);
        if (!file.delete()) Log.w(TAG, "Could not remove recovery temporary path " + file.getName());
    }
}
