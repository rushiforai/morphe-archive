package app.afterglow.extension.diagnostics;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.ComponentName;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.File;
import java.io.FileNotFoundException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Comparator;
import java.util.UUID;

/** Unexported provider. Only a chooser recipient granted a snapshot URI can read it. */
public final class DebugLogProvider extends ContentProvider {
    public static final String FILE_NAME = "YTAfterglow-debug-log.txt";
    private static final String DIRECTORY = "afterglow-shared-logs";

    static Uri snapshot(Context context, String body) throws Exception {
        File directory = new File(context.getCacheDir(), DIRECTORY);
        if (!directory.isDirectory() && !directory.mkdirs()) throw new java.io.IOException("Cannot create share directory");
        File[] previous = directory.listFiles(file -> file.isFile() && file.getName().matches("[a-f0-9]{32}\\.txt"));
        if (previous != null && previous.length >= 4) {
            Arrays.sort(previous, Comparator.comparingLong(File::lastModified));
            for (int i = 0; i <= previous.length - 4; i++) Files.deleteIfExists(previous[i].toPath());
        }
        String token = UUID.randomUUID().toString().replace("-", "");
        Files.write(new File(directory, token + ".txt").toPath(), body.getBytes(StandardCharsets.UTF_8));
        String authority = context.getPackageManager().getProviderInfo(
                new ComponentName(context, DebugLogProvider.class), 0).authority.split(";")[0];
        return new Uri.Builder().scheme("content").authority(authority).appendPath("logs").appendPath(token).build();
    }

    private File file(Uri uri) throws FileNotFoundException {
        java.util.List<String> parts = uri.getPathSegments();
        if (parts.size() != 2 || !"logs".equals(parts.get(0)) || !parts.get(1).matches("[a-f0-9]{32}")) {
            throw new FileNotFoundException("Unknown log snapshot");
        }
        File file = new File(new File(getContext().getCacheDir(), DIRECTORY), parts.get(1) + ".txt");
        if (!file.isFile()) throw new FileNotFoundException("Log snapshot expired");
        return file;
    }

    @Override public boolean onCreate() { return true; }
    @Override public String getType(Uri uri) { return "text/plain"; }
    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new FileNotFoundException("Read only");
        return ParcelFileDescriptor.open(file(uri), ParcelFileDescriptor.MODE_READ_ONLY);
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
        File file;
        try { file = file(uri); } catch (FileNotFoundException error) { return null; }
        String[] columns = projection == null ? new String[] { OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE } : projection;
        MatrixCursor result = new MatrixCursor(columns, 1);
        Object[] values = new Object[columns.length];
        for (int i = 0; i < columns.length; i++) {
            if (OpenableColumns.DISPLAY_NAME.equals(columns[i])) values[i] = FILE_NAME;
            else if (OpenableColumns.SIZE.equals(columns[i])) values[i] = file.length();
        }
        result.addRow(values); return result;
    }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException("Read only"); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException("Read only"); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException("Read only"); }
}
