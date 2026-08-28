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

    /*
     * BUNNY_TRUE_RESTORE_REPLACEMENT_V2
     *
     * A restore recreates the selected categories exactly. Files that exist
     * now but did not exist in the backup are removed transactionally.
     */
    void restore(BunnyBackup.Validated backup) throws Exception {
        Set<String> selected =
                backup.selectedCategories();

        byte[] before =
                createBytes(
                        "pre-restore"
                );

        BunnyBackup.Validated previous =
                BunnyBackup.validateAndMigrate(
                        before
                );

        Set<String> previousPaths =
                new HashSet<>();

        for (BunnyBackup.Entry entry : previous.entries) {
            previousPaths.add(
                    entry.path
            );
        }

        writeInternal(
                store.file(
                        "pre-restore.bunnybackup"
                ),
                before
        );

        try {
            pruneSelectedPortableFiles(
                    selected,
                    backup.entries
            );

            apply(
                    backup.entries
            );

            verifySelectedSnapshot(
                    selected,
                    backup.entries
            );
        } catch (Throwable failure) {
            Log.e(
                    TAG,
                    "RESTORE_ROLLBACK",
                    failure
            );

            try {
                /*
                 * The pre-restore archive is a complete Bunny snapshot, so it
                 * restores both overwritten files and files pruned above.
                 */
                apply(
                        previous.entries
                );

                for (BunnyBackup.Entry imported : backup.entries) {
                    if (!previousPaths.contains(imported.path)) {
                        File added =
                                restoreTarget(imported.path);

                        if (
                                added.exists()
                                        && !added.delete()
                        ) {
                            throw new IOException(
                                    "Could not remove partially restored "
                                            + imported.path
                            );
                        }
                    }
                }
            } catch (Throwable rollbackFailure) {
                failure.addSuppressed(
                        rollbackFailure
                );
            }

            if (failure instanceof Exception) {
                throw (Exception) failure;
            }

            throw new IOException(
                    "Restore failed",
                    failure
            );
        }
    }

    /*
     * BUNNY_PENDING_COLD_RESTORE_V1
     *
     * Never replace Bunny's live storage while its JS proxies are still
     * running. Stage the validated archive under Recovery-owned storage,
     * restart the Android process, then apply it before Bunny JS bootstraps.
     */
    /*
     * BUNNY_EXTERNAL_PENDING_RESTORE_V5
     */
    void stageRestore(BunnyBackup.Validated backup) throws Exception {
        if (
                backup == null
                        || backup.entries == null
                        || backup.entries.isEmpty()
        ) {
            throw new IOException("The Bunny backup contains no persistent data");
        }

        byte[] bytes = backup.root.toString().getBytes(StandardCharsets.UTF_8);
        BunnyBackup.Validated verified = BunnyBackup.validateAndMigrate(bytes);

        if (verified.entries.size() != backup.entries.size()) {
            throw new IOException(
                    "The staged Bunny restore did not preserve every item"
            );
        }

        writeInternal(pendingRestoreFile(), bytes);
    }

    void stageKnownGoodRestore() throws Exception {
        File knownGood =
                store.file("last-known-good.bunnybackup");

        byte[] bytes =
                readFile(knownGood);

        BunnyBackup.Validated validated =
                BunnyBackup.validateAndMigrate(bytes);

        stageRestore(validated);
    }

    /*
     * BUNNY_EXTERNAL_PENDING_APPLY_V5
     */
    boolean applyPendingRestoreIfPresent() throws Exception {
        File pending = pendingRestoreFile();
        File legacy = store.file("pending-restore.bunnybackup");

        File source =
                pending.isFile()
                        ? pending
                        : (legacy.isFile() ? legacy : null);

        if (source == null) {
            return false;
        }

        byte[] bytes = readFile(source);
        BunnyBackup.Validated validated = BunnyBackup.validateAndMigrate(bytes);

        restore(validated);

        if (source.exists() && !source.delete()) {
            throw new IOException(
                    "The staged Bunny restore applied but its pending marker could not be removed"
            );
        }

        if (!source.equals(pending) && pending.exists()) {
            pending.delete();
        }

        if (!source.equals(legacy) && legacy.exists()) {
            legacy.delete();
        }

        return true;
    }

    /*
     * BUNNY_EXTERNAL_PENDING_DISCARD_V5
     */
    void discardPendingRestore() {
        File[] candidates = {
                pendingRestoreFile(),
                store.file("pending-restore.bunnybackup")
        };

        for (File pending : candidates) {
            if (pending.exists() && !pending.delete()) {
                Log.w(
                        TAG,
                        "Could not remove failed pending Bunny restore"
                );
            }
        }
    }

    /*
     * BUNNY_PRE_RECOVERY_STATIC_APPLY_V5
     */
    private File pendingRestoreFile() {
        return new File(
                context.getNoBackupFilesDir(),
                "bunny-pending-restore.bunnybackup"
        );
    }

    static boolean applyPendingRestoreBeforeRecoveryInit(
            Context context
    ) throws Exception {
        if (context == null) {
            return false;
        }

        RecoveryStore store = new RecoveryStore(context);
        BackupRestoreManager manager =
                new BackupRestoreManager(context, store);

        return manager.applyPendingRestoreIfPresent();
    }

    static void discardPendingRestoreBeforeRecoveryInit(
            Context context
    ) {
        if (context == null) {
            return;
        }

        try {
            RecoveryStore store = new RecoveryStore(context);

            new BackupRestoreManager(
                    context,
                    store
            ).discardPendingRestore();
        } catch (Throwable error) {
            Log.w(
                    TAG,
                    "Could not discard pre-init Bunny restore",
                    error
            );
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

    /*
     * BUNNY_TRUE_RESTORE_PRUNE_HELPERS_V1
     */
    private void pruneSelectedPortableFiles(
            Set<String> selected,
            List<BunnyBackup.Entry> desired
    ) throws Exception {
        JSONObject currentRoot =
                BunnyBackup.create(
                        bunnyRoot,
                        "pre-restore-prune",
                        selected
                );

        BunnyBackup.Validated current =
                BunnyBackup.validateAndMigrate(
                        currentRoot
                                .toString()
                                .getBytes(
                                        StandardCharsets.UTF_8
                                )
                );

        Set<String> desiredPaths =
                new HashSet<>();

        for (BunnyBackup.Entry entry : desired) {
            desiredPaths.add(
                    entry.path
            );
        }

        for (BunnyBackup.Entry entry : current.entries) {
            if (desiredPaths.contains(entry.path)) {
                continue;
            }

            File obsolete =
                    restoreTarget(entry.path);

            if (
                    obsolete.exists()
                            && !obsolete.delete()
            ) {
                throw new IOException(
                        "Could not remove current Bunny data absent from backup: "
                                + entry.path
                );
            }
        }
    }

    private void verifySelectedSnapshot(
            Set<String> selected,
            List<BunnyBackup.Entry> expected
    ) throws Exception {
        JSONObject currentRoot =
                BunnyBackup.create(
                        bunnyRoot,
                        "post-restore-verify",
                        selected
                );

        BunnyBackup.Validated current =
                BunnyBackup.validateAndMigrate(
                        currentRoot
                                .toString()
                                .getBytes(
                                        StandardCharsets.UTF_8
                                )
                );

        if (current.entries.size() != expected.size()) {
            throw new IOException(
                    "Restored Bunny snapshot entry count does not match backup"
            );
        }

        for (int index = 0; index < expected.size(); index++) {
            BunnyBackup.Entry wanted =
                    expected.get(index);

            BunnyBackup.Entry actual =
                    current.entries.get(index);

            if (
                    !wanted.path.equals(actual.path)
                            || !java.util.Arrays.equals(
                                    wanted.data,
                                    actual.data
                            )
            ) {
                throw new IOException(
                        "Restored Bunny snapshot differs at "
                                + wanted.path
                );
            }
        }
    }

    /*
     * BUNNY_REAL_DOCUMENTS_APPLY_V6
     */
    private void apply(List<BunnyBackup.Entry> entries) throws Exception {
        File stage =
                store.file(
                        "restore-stage"
                );

        clearDirectory(
                stage
        );

        if (
                !stage.isDirectory()
                        && !stage.mkdirs()
        ) {
            throw new IOException(
                    "Could not create restore stage"
            );
        }

        try {
            for (BunnyBackup.Entry entry : entries) {
                File staged =
                        safeChild(
                                stage,
                                entry.path
                        );

                writeInternal(
                        staged,
                        entry.data
                );
            }

            for (BunnyBackup.Entry entry : entries) {
                File staged =
                        safeChild(
                                stage,
                                entry.path
                        );

                File target =
                        restoreTarget(
                                entry.path
                        );

                File parent =
                        target.getParentFile();

                if (
                        parent != null
                                && !parent.isDirectory()
                                && !parent.mkdirs()
                ) {
                    throw new IOException(
                            "Could not create restore target directory "
                                    + parent
                    );
                }

                File temporary =
                        new File(
                                parent,
                                target.getName()
                                        + ".recovery-tmp"
                        );

                copyFile(
                        staged,
                        temporary
                );

                RecoveryStore.atomicReplace(
                        temporary,
                        target
                );

                byte[] verified =
                        readFile(
                                target
                        );

                if (
                        !java.util.Arrays.equals(
                                verified,
                                entry.data
                        )
                ) {
                    throw new IOException(
                            "Restored Bunny file verification failed at "
                                    + entry.path
                    );
                }
            }
        } finally {
            clearDirectory(
                    stage
            );
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

    /*
     * BUNNY_REAL_DOCUMENTS_RESTORE_TARGET_V6
     *
     * Bunny JS uses Discord RTNFileManager DocumentsDirPath, which is
     * Context.getFilesDir(). Logical vd_mmkv/* entries therefore belong in
     * files/vd_mmkv, while loader/native Bunny entries remain in pyoncord.
     */
    private File restoreTarget(
            String logicalPath
    ) throws Exception {
        if (
                logicalPath != null
                        && logicalPath.startsWith(
                                "vd_mmkv/"
                        )
        ) {
            String relative =
                    logicalPath.substring(
                            "vd_mmkv/".length()
                    );

            File mmkvRoot =
                    new File(
                            context.getFilesDir(),
                            "vd_mmkv"
                    );

            return safeChild(
                    mmkvRoot,
                    relative
            );
        }

        return safeChild(
                bunnyRoot,
                logicalPath
        );
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
