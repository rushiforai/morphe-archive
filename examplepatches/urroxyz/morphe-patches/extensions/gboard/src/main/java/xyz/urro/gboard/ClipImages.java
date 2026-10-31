package xyz.urro.gboard;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.File;
import java.io.FileNotFoundException;

/** Read grants let Gboard paste a received image without exposing the rest of its private files. */
public final class ClipImages extends ContentProvider {
    @Override public boolean onCreate() { return true; }
    static File directory(android.content.Context context) {
        File directory = new File(context.getFilesDir(), "urro_clipcascade_images");
        if (!directory.exists() && !directory.mkdirs()) throw new IllegalStateException("Cannot create image cache");
        return directory;
    }
    static Uri uri(android.content.Context context, String filename) {
        try {
            android.content.pm.ProviderInfo[] providers = context.getPackageManager().getPackageInfo(context.getPackageName(), android.content.pm.PackageManager.GET_PROVIDERS).providers;
            if (providers != null) for (android.content.pm.ProviderInfo provider : providers) {
                if (ClipImages.class.getName().equals(provider.name)) return new Uri.Builder().scheme("content").authority(provider.authority).appendPath(filename).build();
            }
        } catch (android.content.pm.PackageManager.NameNotFoundException exception) { throw new IllegalStateException(exception); }
        throw new IllegalStateException("ClipCascade image provider is not registered");
    }
    static android.graphics.Bitmap thumbnail(android.content.Context context, Uri uri) throws java.io.IOException {
        android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        try (java.io.InputStream input = context.getContentResolver().openInputStream(uri)) {
            android.graphics.BitmapFactory.decodeStream(input, null, options);
        }
        if (options.outWidth <= 0 || options.outHeight <= 0) throw new java.io.IOException("Invalid clipboard image");
        options.inSampleSize = 1;
        while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > 512) options.inSampleSize *= 2;
        options.inJustDecodeBounds = false;
        try (java.io.InputStream input = context.getContentResolver().openInputStream(uri)) {
            android.graphics.Bitmap bitmap = android.graphics.BitmapFactory.decodeStream(input, null, options);
            if (bitmap == null) throw new java.io.IOException("Could not decode clipboard image");
            return bitmap;
        }
    }

    private File file(Uri uri) throws FileNotFoundException {
        String name = uri.getLastPathSegment();
        if (name == null || !name.matches("[0-9]+\\.(png|jpg|webp|gif)") || uri.getPathSegments().size() != 1) throw new FileNotFoundException();
        File file = new File(directory(getContext()), name);
        if (!file.isFile()) throw new FileNotFoundException();
        return file;
    }
    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new FileNotFoundException("Read-only clipboard image");
        return ParcelFileDescriptor.open(file(uri), ParcelFileDescriptor.MODE_READ_ONLY);
    }
    @Override public String getType(Uri uri) {
        String name = uri.getLastPathSegment();
        if (name == null) return null;
        if (name.endsWith(".png")) return "image/png";
        if (name.endsWith(".jpg")) return "image/jpeg";
        if (name.endsWith(".webp")) return "image/webp";
        if (name.endsWith(".gif")) return "image/gif";
        return null;
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
        try {
            File file = file(uri);
            String[] columns = projection == null ? new String[]{OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE} : projection;
            MatrixCursor cursor = new MatrixCursor(columns);
            Object[] row = new Object[columns.length];
            for (int i = 0; i < columns.length; i++) row[i] = OpenableColumns.DISPLAY_NAME.equals(columns[i]) ? file.getName() : OpenableColumns.SIZE.equals(columns[i]) ? file.length() : null;
            cursor.addRow(row); return cursor;
        } catch (FileNotFoundException ignored) { return null; }
    }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
