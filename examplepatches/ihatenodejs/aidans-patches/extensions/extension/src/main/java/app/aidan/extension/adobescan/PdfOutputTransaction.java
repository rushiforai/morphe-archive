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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Journaled non-destructive transaction manager for multi-input Combine and Office Export operations.
 * Input files and database rows are never rollback targets.
 * State machine: PREPARING -> VALIDATED -> PUBLISHING -> PUBLISHED
 */
public class PdfOutputTransaction {

    private static final String TAG = "PdfOutputTx";

    public static final String DIR_NAME = "aidan-scan-output-tx";
    public static final String PHASE_PREPARING = "PREPARING";
    public static final String PHASE_VALIDATED = "VALIDATED";
    public static final String PHASE_PUBLISHING = "PUBLISHING";
    public static final String PHASE_PUBLISHED = "PUBLISHED";

    public static class InputSnapshot {
        public long documentId;
        public String path;
        public String sha256;
        public long size;

        public InputSnapshot() {}

        public InputSnapshot(long documentId, String path, String sha256, long size) {
            this.documentId = documentId;
            this.path = path;
            this.sha256 = sha256;
            this.size = size;
        }
    }

    public static class JournalRecord {
        public int version = 1;
        public long operationId;
        public int operation; // COMBINE, EXPORT_DOCX, EXPORT_XLSX, EXPORT_PPTX
        public List<InputSnapshot> inputs = new ArrayList<>();
        public String stagePath;
        public String outputSha256;
        public long outputSize;
        public String displayName;
        public String newDocumentId; // for combine
        public String newDocumentPath; // for combine
        public String exportPath; // for export
        public String phase = PHASE_PREPARING;

        public String toJson() {
            final StringBuilder sb = new StringBuilder();
            sb.append("{\n");
            sb.append("  \"version\": ").append(version).append(",\n");
            sb.append("  \"operationId\": ").append(operationId).append(",\n");
            sb.append("  \"operation\": ").append(operation).append(",\n");
            sb.append("  \"stagePath\": ").append(quote(stagePath)).append(",\n");
            sb.append("  \"outputSha256\": ").append(quote(outputSha256)).append(",\n");
            sb.append("  \"outputSize\": ").append(outputSize).append(",\n");
            sb.append("  \"displayName\": ").append(quote(displayName)).append(",\n");
            sb.append("  \"newDocumentId\": ").append(quote(newDocumentId)).append(",\n");
            sb.append("  \"newDocumentPath\": ").append(quote(newDocumentPath)).append(",\n");
            sb.append("  \"exportPath\": ").append(quote(exportPath)).append(",\n");
            sb.append("  \"phase\": ").append(quote(phase)).append(",\n");
            sb.append("  \"inputCount\": ").append(inputs.size());
            for (int i = 0; i < inputs.size(); i++) {
                final InputSnapshot in = inputs.get(i);
                sb.append(",\n  \"in_").append(i).append("_docId\": ").append(in.documentId);
                sb.append(",\n  \"in_").append(i).append("_path\": ").append(quote(in.path));
                sb.append(",\n  \"in_").append(i).append("_sha256\": ").append(quote(in.sha256));
                sb.append(",\n  \"in_").append(i).append("_size\": ").append(in.size);
            }
            sb.append("\n}");
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
            if (map.containsKey("operation")) record.operation = Integer.parseInt(map.get("operation"));
            record.stagePath = map.get("stagePath");
            record.outputSha256 = map.get("outputSha256");
            if (map.containsKey("outputSize")) record.outputSize = Long.parseLong(map.get("outputSize"));
            record.displayName = map.get("displayName");
            record.newDocumentId = map.get("newDocumentId");
            record.newDocumentPath = map.get("newDocumentPath");
            record.exportPath = map.get("exportPath");
            record.phase = map.get("phase");

            int inputCount = 0;
            if (map.containsKey("inputCount")) {
                inputCount = Integer.parseInt(map.get("inputCount"));
            }
            for (int i = 0; i < inputCount; i++) {
                final InputSnapshot in = new InputSnapshot();
                final String docKey = "in_" + i + "_docId";
                final String pathKey = "in_" + i + "_path";
                final String hashKey = "in_" + i + "_sha256";
                final String sizeKey = "in_" + i + "_size";
                if (map.containsKey(docKey)) in.documentId = Long.parseLong(map.get(docKey));
                in.path = map.get(pathKey);
                in.sha256 = map.get(hashKey);
                if (map.containsKey(sizeKey)) in.size = Long.parseLong(map.get(sizeKey));
                record.inputs.add(in);
            }
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
    private final File stageFile;

    public PdfOutputTransaction(final File baseDir, final JournalRecord record) {
        this.baseDir = baseDir;
        this.record = record;
        this.journalFile = new File(baseDir, record.operationId + ".output-journal");
        this.journalTmpFile = new File(baseDir, record.operationId + ".output-journal.tmp");
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

    public static PdfOutputTransaction begin(
            final File baseDir,
            final long operationId,
            final int operation,
            final List<File> inputFiles,
            final List<Long> documentIds,
            final String displayName) throws IOException {

        if (!baseDir.exists()) {
            baseDir.mkdirs();
        }

        if (inputFiles == null || inputFiles.isEmpty()) {
            throw new IOException("No input files provided for output transaction");
        }

        final JournalRecord record = new JournalRecord();
        record.operationId = operationId;
        record.operation = operation;
        record.displayName = displayName;
        record.phase = PHASE_PREPARING;

        final String ext = (operation == NativePdfEngine.COMBINE) ? ".pdf"
                : (operation == NativePdfEngine.EXPORT_DOCX) ? ".docx"
                : (operation == NativePdfEngine.EXPORT_XLSX) ? ".xlsx" : ".pptx";
        record.stagePath = new File(baseDir, operationId + "-stage" + ext).getAbsolutePath();

        for (int i = 0; i < inputFiles.size(); i++) {
            final File file = inputFiles.get(i);
            if (file == null || !file.exists() || !file.isFile() || file.length() <= 0) {
                throw new IOException("Input file does not exist or is empty: " + file);
            }
            final String hash = sha256(file);
            if (hash == null) {
                throw new IOException("Failed to hash input file: " + file.getAbsolutePath());
            }
            final long docId = (documentIds != null && i < documentIds.size()) ? documentIds.get(i) : 0L;
            record.inputs.add(new InputSnapshot(docId, file.getAbsolutePath(), hash, file.length()));
        }

        final PdfOutputTransaction tx = new PdfOutputTransaction(baseDir, record);
        tx.writeJournal();
        return tx;
    }

    public File getStageFile() {
        return stageFile;
    }

    public JournalRecord getRecord() {
        return record;
    }

    public boolean validateStageOutput() throws IOException {
        if (stageFile == null || !stageFile.exists() || !stageFile.isFile()) {
            Log.e(TAG, "Stage file missing at validation: " + stageFile);
            return false;
        }

        final long size = stageFile.length();
        if (size <= 0) {
            Log.e(TAG, "Stage file is empty: " + stageFile);
            return false;
        }

        final String hash = sha256(stageFile);
        if (hash == null) {
            Log.e(TAG, "Failed to hash stage file: " + stageFile);
            return false;
        }

        record.outputSize = size;
        record.outputSha256 = hash;
        record.phase = PHASE_VALIDATED;
        writeJournal();
        return true;
    }

    public boolean revalidateSources() {
        for (InputSnapshot in : record.inputs) {
            final File file = new File(in.path);
            if (!file.exists() || !file.isFile() || file.length() != in.size) {
                Log.w(TAG, "Input source changed or missing: " + in.path);
                return false;
            }
            final String currentHash = sha256(file);
            if (!in.sha256.equals(currentHash)) {
                Log.w(TAG, "Input source hash mismatch: " + in.path);
                return false;
            }
        }
        return true;
    }

    public void markPublishing(String destinationPath, String destinationId) throws IOException {
        record.phase = PHASE_PUBLISHING;
        if (record.operation == NativePdfEngine.COMBINE) {
            record.newDocumentPath = destinationPath;
            record.newDocumentId = destinationId;
        } else {
            record.exportPath = destinationPath;
        }
        writeJournal();
    }

    public void markPublished() throws IOException {
        record.phase = PHASE_PUBLISHED;
        writeJournal();
        deleteJournal();
        cleanupStageFile();
    }

    public void abort() {
        cleanupStageFile();
        deleteJournal();
    }

    public void cleanupStageFile() {
        if (stageFile != null && stageFile.exists()) {
            stageFile.delete();
        }
    }

    private void writeJournal() throws IOException {
        final String json = record.toJson();
        try (final FileWriter fw = new FileWriter(journalTmpFile)) {
            fw.write(json);
            fw.flush();
        }
        fsyncFile(journalTmpFile);

        if (!journalTmpFile.renameTo(journalFile)) {
            copyFile(journalTmpFile, journalFile);
            journalTmpFile.delete();
            fsyncFile(journalFile);
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

    public static void recoverAll(final File baseDir) {
        if (!baseDir.exists()) return;

        final File[] journalFiles = baseDir.listFiles(new FilenameFilter() {
            @Override
            public boolean accept(final File dir, final String name) {
                return name.endsWith(".output-journal");
            }
        });

        if (journalFiles == null) return;

        for (final File jf : journalFiles) {
            try {
                final String json = readFile(jf);
                final JournalRecord rec = JournalRecord.fromJson(json);
                final PdfOutputTransaction tx = new PdfOutputTransaction(baseDir, rec);
                tx.recover();
            } catch (final Exception e) {
                Log.e(TAG, "Failed to recover journal " + jf.getName() + ", cleaning up", e);
                jf.delete();
            }
        }
    }

    private void recover() {
        Log.i(TAG, "Recovering output operation " + record.operationId + " in phase " + record.phase);

        if (PHASE_PREPARING.equals(record.phase) || PHASE_VALIDATED.equals(record.phase)) {
            // Never published, clean up staging file
            cleanupStageFile();
            deleteJournal();
        } else if (PHASE_PUBLISHING.equals(record.phase)) {
            if (record.operation == NativePdfEngine.COMBINE) {
                // If the published document file exists and matches outputSha256, keep it
                if (record.newDocumentPath != null) {
                    final File newDoc = new File(record.newDocumentPath);
                    if (newDoc.exists() && record.outputSha256 != null && record.outputSha256.equals(sha256(newDoc))) {
                        Log.i(TAG, "Recovered successfully published combine document: " + record.newDocumentPath);
                    } else if (newDoc.exists()) {
                        newDoc.delete();
                    }
                }
            }
            cleanupStageFile();
            deleteJournal();
        } else if (PHASE_PUBLISHED.equals(record.phase)) {
            cleanupStageFile();
            deleteJournal();
        }
    }

    public static String sha256(final File file) {
        if (file == null || !file.exists()) return null;
        try (final InputStream is = new FileInputStream(file)) {
            final MessageDigest md = MessageDigest.getInstance("SHA-256");
            final byte[] buffer = new byte[65536];
            int read;
            while ((read = is.read(buffer)) != -1) {
                md.update(buffer, 0, read);
            }
            final byte[] digest = md.digest();
            final StringBuilder sb = new StringBuilder();
            for (final byte b : digest) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (final NoSuchAlgorithmException | IOException e) {
            Log.e(TAG, "Failed to compute SHA-256 for " + file.getAbsolutePath(), e);
            return null;
        }
    }

    private static void copyFile(final File src, final File dst) throws IOException {
        try (final FileInputStream in = new FileInputStream(src);
             final FileOutputStream out = new FileOutputStream(dst);
             final FileChannel inChannel = in.getChannel();
             final FileChannel outChannel = out.getChannel()) {
            inChannel.transferTo(0, inChannel.size(), outChannel);
        }
    }

    private static void fsyncFile(final File file) {
        try (final FileOutputStream fos = new FileOutputStream(file, true)) {
            fos.getFD().sync();
        } catch (final Exception ignored) {}
    }

    private static String readFile(final File file) throws IOException {
        final StringBuilder sb = new StringBuilder();
        try (final BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
        }
        return sb.toString();
    }
}
