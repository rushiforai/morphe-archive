package app.hushmessenger.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Hands the phone's camera app one file in Messenger's cache to write the photo to, and Messenger the same file to read
 * back. Never exported: only Messenger itself and the camera app it grants the one URI to can open it.
 */
public final class CameraProvider extends ContentProvider {
    /** The provider's authority is the package name plus this, on a clone install too. */
    static final String AUTHORITY_SUFFIX = ".hush.camera";
    static final String DIRECTORY = "hush-camera";
    private static final Pattern NAME = Pattern.compile("IMG_\\d{1,19}\\.jpg");

    static File directory(Context context) {
        return new File(context.getCacheDir(), DIRECTORY);
    }

    static Uri uriFor(Context context, File photo) {
        return new Uri.Builder().scheme("content").authority(context.getPackageName() + AUTHORITY_SUFFIX)
            .appendPath(photo.getName()).build();
    }

    /** The one file a URI names, or null for anything that isn't a capture name in this provider's own folder. */
    static File fileFor(Context context, Uri uri) {
        if (uri == null || !"content".equals(uri.getScheme()) || !(context.getPackageName() + AUTHORITY_SUFFIX).equals(uri.getAuthority())) return null;
        List<String> path = uri.getPathSegments();
        if (path.size() != 1 || !NAME.matcher(path.get(0)).matches()) return null;
        return new File(directory(context), path.get(0));
    }

    @Override public boolean onCreate() { return true; }

    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        File photo = fileFor(getContext(), uri);
        if (photo == null) throw new FileNotFoundException("Not a HushMessenger camera photo");
        // Only the camera app writes, and only to a file the capture screen already created.
        if (!photo.isFile()) throw new FileNotFoundException("The photo is gone");
        return ParcelFileDescriptor.open(photo, ParcelFileDescriptor.parseMode(mode));
    }

    @Override public String getType(Uri uri) {
        return fileFor(getContext(), uri) != null ? "image/jpeg" : null;
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
        File photo = fileFor(getContext(), uri);
        if (photo == null || !photo.isFile()) return null;
        String[] columns = projection != null ? projection : new String[] {OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE};
        MatrixCursor cursor = new MatrixCursor(columns, 1);
        Object[] row = new Object[columns.length];
        for (int i = 0; i < columns.length; i++) {
            if (OpenableColumns.DISPLAY_NAME.equals(columns[i])) row[i] = photo.getName();
            else if (OpenableColumns.SIZE.equals(columns[i])) row[i] = photo.length();
        }
        cursor.addRow(row);
        return cursor;
    }

    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
