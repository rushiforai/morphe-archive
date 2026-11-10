package app.template.extension.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;

import java.io.File;
import java.io.FileNotFoundException;

public final class SoundProvider extends ContentProvider {
    @Override public boolean onCreate() {
        return true;
    }

    private File soundFile(Uri uri) throws FileNotFoundException {
        if (!"content".equals(uri.getScheme()) || getContext() == null
                || !(getContext().getPackageName() + ".nezumi.sounds").equals(uri.getAuthority())
                || uri.getPathSegments().size() != 1) throw new FileNotFoundException("Invalid sound URI");
        String name = uri.getLastPathSegment();
        if (name == null || !name.matches("nezumi-sound-[A-Za-z0-9_-]+\\.audio")) {
            throw new FileNotFoundException("Invalid sound name");
        }
        File file = new File(getContext().getFilesDir(), name);
        if (!file.isFile()) throw new FileNotFoundException("Missing sound");
        return file;
    }

    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (!"r".equals(mode)) throw new FileNotFoundException("Read-only sound provider");
        return ParcelFileDescriptor.open(soundFile(uri), ParcelFileDescriptor.MODE_READ_ONLY);
    }

    @Override public String getType(Uri uri) {
        return "audio/*";
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection,
            String[] selectionArgs, String sortOrder) {
        try {
            File file = soundFile(uri);
            String[] columns = projection == null
                ? new String[] { OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE } : projection;
            MatrixCursor cursor = new MatrixCursor(columns, 1);
            Object[] values = new Object[columns.length];
            for (int index = 0; index < columns.length; index++) {
                if (OpenableColumns.DISPLAY_NAME.equals(columns[index])) values[index] = file.getName();
                else if (OpenableColumns.SIZE.equals(columns[index])) values[index] = file.length();
            }
            cursor.addRow(values);
            return cursor;
        } catch (FileNotFoundException failure) {
            return null;
        }
    }

    @Override public Uri insert(Uri uri, ContentValues values) {
        throw new UnsupportedOperationException("Read-only sound provider");
    }

    @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("Read-only sound provider");
    }

    @Override public int delete(Uri uri, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException("Read-only sound provider");
    }
}