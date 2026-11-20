package app.aidan.extension.adobescan;

import android.content.Context;
import android.util.Log;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

public class PdfFileTransaction {

    private static final String TAG = "PdfFileTransaction";

    public static final String DIR_NAME = "adobescan-pdf";
    public static final String PHASE_PREPARING = "PREPARING";
    public static final String PHASE_VALIDATED = "VALIDATED";
    public static final String PHASE_FILE_COMMITTED = "FILE_COMMITTED";
    public static final String PHASE_METADATA_COMMITTED = "METADATA_COMMITTED";

    public static class JournalRecord {
        public int version = 1;
        public long operationId;
        public long documentId;
        public int operation;
        public String sourcePath;
        public String snapshotPath;
        public String stagePath;
        public String sourceSha256;
        public String outputSha256;
        public long oldSize;
        public long newSize;
        public int oldProtectionStatus;
        public int newProtectionStatus;
        public String phase;

        public String toJson() {
            final StringBuilder sb = new StringBuilder();
            sb.append("{\n");
            sb.append("  \"version\": ").append(version).append(",\n");
            sb.append("  \"operationId\": ").append(operationId).append(",\n");
            sb.append("  \"documentId\": ").append(documentId).append(",\n");
            sb.append("  \"operation\": ").append(operation).append(",\n");
            sb.append("  \"sourcePath\": ").append(quote(sourcePath)).append(",\n");
            sb.append("  \"snapshotPath\": ").append(quote(snapshotPath)).append(",\n");
            sb.append("  \"stagePath\": ").append(quote(stagePath)).append(",\n");
            sb.append("  \"sourceSha256\": ").append(quote(sourceSha256)).append(",\n");
            sb.append("  \"outputSha256\": ").append(quote(outputSha256)).append(",\n");
            sb.append("  \"oldSize\": ").append(oldSize).append(",\n");
            sb.append("  \"newSize\": ").append(newSize).append(",\n");
            sb.append("  \"oldProtectionStatus\": ").append(oldProtectionStatus).append(",\n");
            sb.append("  \"newProtectionStatus\": ").append(newProtectionStatus).append(",\n");
            sb.append("  \"phase\": ").append(quote(phase)).append("\n");
            sb.append("}");
            return sb.toString();
        }

        private static String quote(final String s) {
            if (s == null) return "null";
            return "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"") + "\"";
        }

        public static JournalRecord fromJson(final String json) {
            final JournalRecord record = new JournalRecord();
            final Map<String, String> map = parseSimpleJson(json);
            if (map.containsKey("version")) record.version = Integer.parseInt(map.get("version"));
            if (map.containsKey("operationId")) record.operationId = Long.parseLong(map.get("operationId"));
            if (map.containsKey("documentId")) record.documentId = Long.parseLong(map.get("documentId"));
            if (map.containsKey("operation")) record.operation = Integer.parseInt(map.get("operation"));
            record.sourcePath = map.get("sourcePath");
            record.snapshotPath = map.get("snapshotPath");
            record.stagePath = map.get("stagePath");
            record.sourceSha256 = map.get("sourceSha256");
            record.outputSha256 = map.get("outputSha256");
            if (map.containsKey("oldSize")) record.oldSize = Long.parseLong(map.get("oldSize"));
            if (map.containsKey("newSize")) record.newSize = Long.parseLong(map.get("newSize"));
            if (map.containsKey("oldProtectionStatus")) record.oldProtectionStatus = Integer.parseInt(map.get("oldProtectionStatus"));
            if (map.containsKey("newProtectionStatus")) record.newProtectionStatus = Integer.parseInt(map.get("newProtectionStatus"));
            record.phase = map.get("phase");
            return record;
        }

        private static Map<String, String> parseSimpleJson(final String json) {
            final Map<String, String> map = new HashMap<>();
            final String[] lines = json.split("\n");
            for (String line : lines) {
                line = line.trim();
                if (line.startsWith("{") || line.startsWith("}")) continue;
                if (line.endsWith(",")) line = line.substring(0, line.length() - 1).trim();
                final int colonIdx = line.indexOf(':');
                if (colonIdx > 0) {
                    String key = line.substring(0, colonIdx).trim();
                    String val = line.substring(colonIdx + 1).trim();
                    if (key.startsWith("\"") && key.endsWith("\"")) {
                        key = key.substring(1, key.length() - 1);
                    }
                    if ("null".equals(val)) {
                        map.put(key, null);
                    } else if (val.startsWith("\"") && val.endsWith("\"")) {
                        val = val.substring(1, val.length() - 1).replace("\\\"", "\"").replace("\\\\", "\\");
                        map.put(key, val);
                    } else {
                        map.put(key, val);
                    }
                }
            }
            return map;
        }
    }

    private final File baseDir;
    private final JournalRecord record;
    private final File journalFile;
    private final File journalTmpFile;
    private final File sourceFile;
    private final File snapshotFile;
    private final File stageFile;

    public PdfFileTransaction(final File baseDir, final JournalRecord record) {
        this.baseDir = baseDir;
        this.record = record;
        this.journalFile = new File(baseDir, record.operationId + ".journal");
        this.journalTmpFile = new File(baseDir, record.operationId + ".journal.tmp");
        this.sourceFile = record.sourcePath != null ? new File(record.sourcePath) : null;
        this.snapshotFile = record.snapshotPath != null ? new File(record.snapshotPath) : null;
        this.stageFile = record.stagePath != null ? new File(record.stagePath) : null;
    }

    public static File getStagingDir(final Context context) {
        final File noBackup = context.getNoBackupFilesDir();
        final File dir = new File(noBackup, DIR_NAME);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        return dir;
    }

    public static PdfFileTransaction begin(
            final File baseDir,
            final long operationId,
            final long documentId,
            final int operation,
            final File sourceFile,
            final int oldStatus,
            final long oldSize,
            final int newStatus) throws IOException {

        if (!baseDir.exists()) {
            baseDir.mkdirs();
        }

        if (sourceFile == null || !sourceFile.exists() || !sourceFile.isFile()) {
            throw new IOException("Source file does not exist or is not a regular file: " + sourceFile);
        }

        final JournalRecord record = new JournalRecord();
        record.operationId = operationId;
        record.documentId = documentId;
        record.operation = operation;
        record.sourcePath = sourceFile.getAbsolutePath();
        record.snapshotPath = new File(baseDir, operationId + "-snapshot.pdf").getAbsolutePath();
        record.stagePath = new File(baseDir, operationId + "-stage.pdf").getAbsolutePath();
        record.oldSize = oldSize;
        record.oldProtectionStatus = oldStatus;
        record.newProtectionStatus = newStatus;
        record.phase = PHASE_PREPARING;

        final PdfFileTransaction tx = new PdfFileTransaction(baseDir, record);
        // Persist initial PREPARING journal before snapshotting
        tx.writeJournal();

        // Validate source stability and create verified snapshot
        final long initialSize = sourceFile.length();
        final long initialMtime = sourceFile.lastModified();
        final String initialHash = sha256(sourceFile);

        if (initialHash == null || initialSize <= 0) {
            tx.cleanupOwnedFiles();
            tx.deleteJournal();
            throw new IOException("Source file is unreadable or empty: " + sourceFile.getAbsolutePath());
        }

        // Copy source to snapshot
        copyFile(sourceFile, tx.snapshotFile);
        fsyncFile(tx.snapshotFile);

        final String snapshotHash = sha256(tx.snapshotFile);
        if (!initialHash.equals(snapshotHash)) {
            tx.cleanupOwnedFiles();
            tx.deleteJournal();
            throw new IOException("Snapshot hash mismatch; snapshotting aborted");
        }

        // Verify source did not mutate during snapshotting
        if (sourceFile.length() != initialSize || sourceFile.lastModified() != initialMtime) {
            tx.cleanupOwnedFiles();
            tx.deleteJournal();
            throw new IOException("Source file modified during snapshotting");
        }

        record.sourceSha256 = initialHash;
        tx.writeJournal();

        return tx;
    }

    public File getSnapshotFile() {
        return snapshotFile;
    }

    public File getStageFile() {
        return stageFile;
    }

    public JournalRecord getRecord() {
        return record;
    }

    public void markValidated(final long outputSize, final String outputSha256) throws IOException {
        markValidated(outputSize, outputSha256, record.newProtectionStatus);
    }

    public void markValidated(
            final long outputSize,
            final String outputSha256,
            final int newProtectionStatus) throws IOException {
        record.newSize = outputSize;
        record.outputSha256 = outputSha256;
        record.newProtectionStatus = newProtectionStatus;
        record.phase = PHASE_VALIDATED;
        writeJournal();
    }

    public void commit(final ScanFileAdapter adapter) throws Exception {
        if (!PHASE_VALIDATED.equals(record.phase)) {
            throw new IllegalStateException("Cannot commit transaction in phase: " + record.phase);
        }

        if (stageFile == null || !stageFile.exists()) {
            throw new IOException("Stage file does not exist: " + stageFile);
        }

        fsyncFile(stageFile);
        fsyncFile(snapshotFile);

        // Verify live source identity and hash
        if (!sourceFile.exists()) {
            throw new IOException("Live source file missing before commit: " + sourceFile);
        }

        final String currentSourceHash = sha256(sourceFile);
        if (!record.sourceSha256.equals(currentSourceHash)) {
            throw new IOException("Live source file modified before commit! Aborting.");
        }

        // Atomic rename stage over live source
        atomicMove(stageFile, sourceFile);
        fsyncDir(sourceFile.getParentFile());

        record.phase = PHASE_FILE_COMMITTED;
        writeJournal();

        // Update Room database metadata
        if (adapter != null) {
            adapter.updateMetadata(
                    record.documentId,
                    record.newProtectionStatus,
                    record.newSize,
                    record.oldProtectionStatus,
                    record.oldSize);
        }

        record.phase = PHASE_METADATA_COMMITTED;
        writeJournal();

        // Cleanup snapshot and stage
        cleanupOwnedFiles();
        fsyncDir(baseDir);

        deleteJournal();
        fsyncDir(baseDir);
    }

    public void rollback(final ScanFileAdapter adapter) {
        Log.w(TAG, "Rolling back operation " + record.operationId + " in phase " + record.phase);
        boolean rollbackSuccessful = false;
        try {
            if (PHASE_FILE_COMMITTED.equals(record.phase)) {
                if (snapshotFile != null && snapshotFile.exists()) {
                    final String snapHash = sha256(snapshotFile);
                    if (record.sourceSha256 != null && record.sourceSha256.equals(snapHash)) {
                        atomicMove(snapshotFile, sourceFile);
                        fsyncDir(sourceFile.getParentFile());
                    } else {
                        throw new IllegalStateException("Snapshot hash mismatch during rollback");
                    }
                }
                if (adapter != null) {
                    adapter.updateMetadata(
                            record.documentId,
                            record.oldProtectionStatus,
                            record.oldSize,
                            record.newProtectionStatus,
                            record.newSize);
                }
            }
            rollbackSuccessful = true;
        } catch (final Throwable t) {
            Log.e(TAG, "Exception during rollback of operation " + record.operationId, t);
        } finally {
            if (rollbackSuccessful) {
                cleanupOwnedFiles();
                deleteJournal();
                fsyncDir(baseDir);
            } else {
                // Do NOT delete snapshot or journal; allow recovery on restart to retry
                Log.e(TAG, "Rollback failed; retaining snapshot and journal for startup recovery");
                if (stageFile != null && stageFile.exists()) {
                    stageFile.delete();
                }
            }
        }
    }

    public static void recover(final File baseDir, final ScanFileAdapter adapter) {
        if (!baseDir.exists() || !baseDir.isDirectory()) return;

        final File[] journals = baseDir.listFiles(new FilenameFilter() {
            @Override
            public boolean accept(final File dir, final String name) {
                return name.endsWith(".journal");
            }
        });

        if (journals == null || journals.length == 0) return;

        for (final File jf : journals) {
            try {
                final String json = readFileToString(jf);
                final JournalRecord rec = JournalRecord.fromJson(json);
                final PdfFileTransaction tx = new PdfFileTransaction(baseDir, rec);
                tx.recoverSingle(adapter);
            } catch (final Throwable t) {
                Log.e(TAG, "Failed to recover journal file: " + jf.getName(), t);
            }
        }
    }

    private void recoverSingle(final ScanFileAdapter adapter) {
        Log.i(TAG, "Recovering operation " + record.operationId + ", phase=" + record.phase);
        final File src = sourceFile;
        final String currentSourceHash = (src != null && src.exists()) ? sha256Quietly(src) : null;

        if (PHASE_PREPARING.equals(record.phase)) {
            // Source was never committed; clean up staging and snapshot
            cleanupOwnedFiles();
            deleteJournal();
            fsyncDir(baseDir);
            return;
        }

        if (PHASE_VALIDATED.equals(record.phase)) {
            if (record.outputSha256 != null && record.outputSha256.equals(currentSourceHash)) {
                record.phase = PHASE_FILE_COMMITTED;
                try {
                    writeJournal();
                } catch (final IOException ignored) {
                }
            } else if (record.sourceSha256 != null && record.sourceSha256.equals(currentSourceHash)) {
                cleanupOwnedFiles();
                deleteJournal();
                fsyncDir(baseDir);
                return;
            } else {
                if (restoreSnapshot(src)) {
                    cleanupOwnedFiles();
                    deleteJournal();
                    fsyncDir(baseDir);
                } else {
                    Log.e(TAG, "Snapshot restoration failed in VALIDATED phase; retaining snapshot and journal");
                }
                return;
            }
        }

        if (PHASE_FILE_COMMITTED.equals(record.phase)) {
            if (record.outputSha256 != null && record.outputSha256.equals(currentSourceHash)) {
                // Live file has valid transformed content; apply desired metadata idempotently
                boolean metadataUpdated = false;
                if (adapter != null) {
                    try {
                        adapter.updateMetadata(
                                record.documentId,
                                record.newProtectionStatus,
                                record.newSize,
                                record.oldProtectionStatus,
                                record.oldSize);
                        metadataUpdated = true;
                    } catch (final Throwable t) {
                        Log.e(TAG, "Failed to reconcile metadata in recovery", t);
                    }
                } else {
                    metadataUpdated = true;
                }

                if (!metadataUpdated) {
                    // Retain journal and snapshot so recovery can be retried on next startup
                    Log.w(TAG, "Leaving transaction journal in place due to failed metadata reconciliation");
                    return;
                }

                record.phase = PHASE_METADATA_COMMITTED;
                try {
                    writeJournal();
                } catch (final IOException ignored) {
                }
                cleanupOwnedFiles();
                deleteJournal();
                fsyncDir(baseDir);
            } else if (record.sourceSha256 != null && record.sourceSha256.equals(currentSourceHash)) {
                // Source still has old hash; clean up
                cleanupOwnedFiles();
                deleteJournal();
                fsyncDir(baseDir);
            } else {
                // Conflict or interrupted file move: restore verified snapshot if possible
                if (restoreSnapshot(src)) {
                    cleanupOwnedFiles();
                    deleteJournal();
                    fsyncDir(baseDir);
                } else {
                    Log.e(TAG, "Snapshot restoration failed in FILE_COMMITTED phase; retaining snapshot and journal");
                    return;
                }
            }
            return;
        }

        if (PHASE_METADATA_COMMITTED.equals(record.phase)) {
            cleanupOwnedFiles();
            deleteJournal();
            fsyncDir(baseDir);
        }
    }

    private boolean restoreSnapshot(final File src) {
        if (snapshotFile != null && snapshotFile.exists() && src != null) {
            final String snapHash = sha256Quietly(snapshotFile);
            if (record.sourceSha256 != null && record.sourceSha256.equals(snapHash)) {
                try {
                    atomicMove(snapshotFile, src);
                    fsyncDir(src.getParentFile());
                    final String restoredHash = sha256Quietly(src);
                    return record.sourceSha256.equals(restoredHash);
                } catch (final IOException e) {
                    Log.e(TAG, "Failed to restore snapshot during recovery", e);
                }
            }
        }
        return false;
    }

    public void cleanupOwnedFiles() {
        if (stageFile != null && stageFile.exists()) {
            stageFile.delete();
        }
        if (snapshotFile != null && snapshotFile.exists()) {
            snapshotFile.delete();
        }
    }

    public void deleteJournal() {
        if (journalTmpFile.exists()) {
            journalTmpFile.delete();
        }
        if (journalFile.exists()) {
            journalFile.delete();
        }
    }

    private void writeJournal() throws IOException {
        final String json = record.toJson();
        try (FileWriter fw = new FileWriter(journalTmpFile)) {
            fw.write(json);
            fw.flush();
        }
        fsyncFile(journalTmpFile);
        atomicMove(journalTmpFile, journalFile);
        fsyncDir(baseDir);
    }

    public static void fsyncFile(final File file) throws IOException {
        if (file == null || !file.exists()) return;
        try (FileOutputStream fos = new FileOutputStream(file, true)) {
            fos.getFD().sync();
        }
    }

    public static void fsyncDir(final File dir) {
        if (dir == null || !dir.isDirectory()) return;
        try (FileChannel ch = FileChannel.open(dir.toPath(), StandardOpenOption.READ)) {
            ch.force(true);
        } catch (final Throwable ignored) {
        }
    }

    public static void atomicMove(final File src, final File dst) throws IOException {
        Files.move(src.toPath(), dst.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
    }

    public static void copyFile(final File src, final File dst) throws IOException {
        Files.copy(src.toPath(), dst.toPath(), StandardCopyOption.REPLACE_EXISTING);
    }

    public static String sha256(final File file) throws IOException {
        if (file == null || !file.exists()) return null;
        try {
            final MessageDigest md = MessageDigest.getInstance("SHA-256");
            try (InputStream is = new FileInputStream(file)) {
                final byte[] buffer = new byte[8192];
                int read;
                while ((read = is.read(buffer)) != -1) {
                    md.update(buffer, 0, read);
                }
            }
            final byte[] digest = md.digest();
            final StringBuilder sb = new StringBuilder();
            for (final byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (final NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    private static String sha256Quietly(final File file) {
        try {
            return sha256(file);
        } catch (final IOException e) {
            return null;
        }
    }

    private static String readFileToString(final File file) throws IOException {
        final StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
        }
        return sb.toString();
    }
}
