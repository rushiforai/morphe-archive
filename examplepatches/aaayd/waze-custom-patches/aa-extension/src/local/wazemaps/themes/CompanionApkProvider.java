package local.wazemaps.themes;

import android.content.*;
import android.database.*;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.*;
import java.nio.file.*;
import java.security.MessageDigest;

/** Private provider: only Android's installer receives a read grant for this exact APK. */
public final class CompanionApkProvider extends ContentProvider {
    static final Uri URI = Uri.parse("content://com.waze.morphe.aa-companion/installer.apk");
    static final String HASH = "e5d442454418efd4ff438b3ed3f6bfa5a3aee78f52616625cb25ce0ec8855b48";
    static final String MIME = "application/vnd.android.package-archive";
    public boolean onCreate() { return true; }
    private static void check(Uri uri) { if (!URI.equals(uri)) throw new IllegalArgumentException("Unknown companion URI"); }
    static synchronized File stage(Context context) throws Exception {
        File target = new File(context.getCacheDir(), "morphe-aa-installer.apk");
        if (target.isFile() && HASH.equals(digest(target))) return target;
        File temporary = new File(context.getCacheDir(), "morphe-aa-installer.tmp");
        try {
            try (InputStream input = context.getAssets().open("morphe/installer/waze-aa-installer.apk")) {
                Files.copy(input, temporary.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
            if (!HASH.equals(digest(temporary))) throw new IOException("Companion APK checksum mismatch");
            Files.move(temporary.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
            return target;
        } finally { temporary.delete(); }
    }
    private static String digest(File file) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (InputStream input = new FileInputStream(file)) {
            byte[] buffer = new byte[16384]; int read;
            while ((read = input.read(buffer)) != -1) digest.update(buffer, 0, read);
        }
        return CompanionInstaller.hex(digest.digest());
    }
    public String getType(Uri uri) { check(uri); return MIME; }
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        check(uri);
        if (!"r".equals(mode)) throw new FileNotFoundException("Read only");
        try { return ParcelFileDescriptor.open(stage(getContext()), ParcelFileDescriptor.MODE_READ_ONLY); }
        catch (Exception error) { throw new FileNotFoundException("Embedded installer unavailable: " + error.getMessage()); }
    }
    public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
        check(uri);
        String[] columns = projection == null ? new String[]{OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE} : projection;
        MatrixCursor result = new MatrixCursor(columns);
        MatrixCursor.RowBuilder row = result.newRow();
        File file = new File(getContext().getCacheDir(), "morphe-aa-installer.apk");
        for (String column : columns) row.add(OpenableColumns.DISPLAY_NAME.equals(column) ? "waze-aa-installer-1.0.0.apk" :
            OpenableColumns.SIZE.equals(column) && file.isFile() ? file.length() : null);
        return result;
    }
    public Uri insert(Uri u, ContentValues v) { throw new UnsupportedOperationException(); }
    public int update(Uri u, ContentValues v, String s, String[] a) { throw new UnsupportedOperationException(); }
    public int delete(Uri u, String s, String[] a) { throw new UnsupportedOperationException(); }
}
