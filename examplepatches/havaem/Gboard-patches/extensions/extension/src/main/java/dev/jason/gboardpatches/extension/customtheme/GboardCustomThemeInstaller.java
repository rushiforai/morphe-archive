package dev.jason.gboardpatches.extension.customtheme;

import android.content.Context;
import android.content.SharedPreferences;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.Collections;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Validates, atomically installs, and activates one inner Gboard theme archive. */
public final class GboardCustomThemeInstaller {
    private static final String STAGING_PREFIX = ".gboard_patches_theme_";
    private GboardCustomThemeInstaller() { }

    public static File install(Context context, File source, boolean keyBorder) throws Exception {
        ImportedArchive imported = importArchiveWithOwnership(context, source);
        try {
            activate(context, imported.file, keyBorder);
            return imported.file;
        } catch (Exception failure) {
            imported.rollbackActivationFailure();
            throw failure;
        }
    }

    static File importArchive(Context context, File source) throws Exception {
        return importArchiveWithOwnership(context, source).file;
    }

    private static ImportedArchive importArchiveWithOwnership(Context context, File source)
            throws Exception {
        File staging = new File(context.getFilesDir(), STAGING_PREFIX + UUID.randomUUID() + ".part");
        File committed = null;
        boolean created = false;
        try {
            copyBounded(source, staging);
            inspect(staging);
            if (!validateWithGboard(context, staging)) throw new IOException("Gboard rejected the theme archive");
            File duplicate = findDuplicate(context, staging);
            if (duplicate != null) {
                staging.delete();
                committed = duplicate;
            } else {
                committed = atomicCommit(context, staging);
                created = true;
            }
            return new ImportedArchive(committed, created);
        } catch (Exception failure) {
            staging.delete();
            if (created && committed != null) committed.delete();
            throw failure;
        } finally {
            source.delete();
        }
    }

    private static void activate(Context context, File committed, boolean keyBorder)
            throws IOException {
        Context storage = context.createDeviceProtectedStorageContext();
        SharedPreferences preferences = storage.getSharedPreferences(
                context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
        if (!preferences.edit()
                .putString("additional_keyboard_theme", "files:" + committed.getName())
                .putBoolean("enable_key_border", keyBorder)
                .commit()) {
            throw new IOException("Theme preference commit failed");
        }
    }

    static void inspect(File archive) throws IOException {
        boolean metadata = false;
        long total = 0L;
        int count = 0;
        byte[] buffer = new byte[16 * 1024];
        try (ZipFile zip = new ZipFile(archive)) {
            for (ZipEntry entry : Collections.list(zip.entries())) {
                count++;
                if (count > GboardThemeImportContract.MAX_THEME_ENTRY_COUNT) throw new IOException("Too many ZIP entries");
                if (!GboardThemeImportContract.isSafeEntryName(entry.getName())) throw new IOException("Unsafe ZIP entry");
                metadata |= GboardThemeImportContract.isRootMetadata(entry.getName());
                if (entry.isDirectory()) continue;
                long entryLimit = GboardThemeImportContract.isRootMetadata(entry.getName())
                        ? GboardThemeImportContract.MAX_METADATA_BYTES
                        : GboardThemeImportContract.MAX_THEME_ENTRY_BYTES;
                long compressedSize = entry.getCompressedSize();
                long declaredSize = entry.getSize();
                if (compressedSize > 0L && declaredSize > compressedSize * 100L) {
                    throw new IOException("ZIP compression ratio exceeds limit");
                }
                long entryBytes = 0L;
                try (InputStream input = zip.getInputStream(entry)) {
                    int read;
                    while ((read = input.read(buffer)) >= 0) {
                        if (read == 0) continue;
                        entryBytes += read; total += read;
                        if (entryBytes > entryLimit || total > GboardThemeImportContract.MAX_THEME_UNCOMPRESSED_BYTES)
                            throw new IOException("ZIP expansion exceeds limit");
                    }
                }
            }
        }
        if (!metadata) throw new IOException("Theme metadata is missing");
    }

    private static boolean validateWithGboard(Context context, File archive) throws Exception {
        return GboardCustomThemeTargetContract.validateThemeArchive(context, archive);
    }

    private static File atomicCommit(Context context, File staging) throws IOException {
        long now = System.currentTimeMillis();
        for (int attempt = 0; attempt < 100; attempt++) {
            File destination = new File(context.getFilesDir(),
                    GboardThemeImportContract.stockCompatibleFileName(now, attempt));
            if (!destination.exists() && staging.renameTo(destination)) return destination;
        }
        throw new IOException("Cannot atomically commit theme");
    }

    private static File findDuplicate(Context context, File staging) throws Exception {
        File[] candidates = context.getFilesDir().listFiles((dir, name) -> name.startsWith("user_theme_"));
        if (candidates == null) return null;
        byte[] sourceHash = sha256(staging);
        for (File candidate : candidates) {
            if (candidate.isFile() && candidate.length() == staging.length()
                    && MessageDigest.isEqual(sourceHash, sha256(candidate))) return candidate;
        }
        return null;
    }

    private static void copyBounded(File source, File destination) throws IOException {
        long total = 0L;
        byte[] buffer = new byte[32 * 1024];
        try (InputStream input = new FileInputStream(source);
             FileOutputStream output = new FileOutputStream(destination, false)) {
            int read;
            while ((read = input.read(buffer)) >= 0) {
                if (read == 0) continue;
                total += read;
                if (total > GboardThemeImportContract.MAX_INNER_THEME_BYTES) throw new IOException("Theme exceeds size limit");
                output.write(buffer, 0, read);
            }
            output.flush(); output.getFD().sync();
        }
        if (total == 0L) throw new IOException("Theme is empty");
    }

    private static byte[] sha256(File file) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (InputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[32 * 1024];
            int read;
            while ((read = input.read(buffer)) >= 0) if (read > 0) digest.update(buffer, 0, read);
        }
        return digest.digest();
    }

    static final class ImportedArchive {
        final File file;
        private final boolean createdByImport;

        ImportedArchive(File file, boolean createdByImport) {
            this.file = file;
            this.createdByImport = createdByImport;
        }

        void rollbackActivationFailure() {
            if (createdByImport) file.delete();
        }
    }
}
