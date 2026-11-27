package local.waze.aainstaller;

import android.content.*;
import android.database.*;
import android.net.Uri;
import android.os.*;
import android.provider.OpenableColumns;
import java.io.*;

/** A read-only, single-file provider restricted to shell and Google Package Installer. */
public final class ApkProvider extends ContentProvider {
    public boolean onCreate() { return true; }
    private File file(Uri uri) {
        int uid = Binder.getCallingUid();
        boolean allowed = uid == 2000 || uid == android.os.Process.myUid();
        String[] packages = getContext().getPackageManager().getPackagesForUid(uid);
        if (packages != null) for (String name : packages)
            if ("com.google.android.packageinstaller".equals(name)) allowed = true;
        if (!allowed) throw new SecurityException("Only Android's installer can read the staged APK");
        String token = getContext().getSharedPreferences("install", 0).getString("token", "");
        if (!token.matches("[a-f0-9]{32}") || !uri.getPath().equals("/apk/" + token))
            throw new SecurityException("Expired APK token");
        return new File(getContext().getFilesDir(), "pending.apk");
    }
    public String getType(Uri uri) { file(uri); return "application/vnd.android.package-archive"; }
    public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sort) {
        File apk = file(uri);
        String[] columns = projection != null ? projection : new String[]{OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE};
        MatrixCursor result = new MatrixCursor(columns); Object[] row = new Object[columns.length];
        for (int i = 0; i < columns.length; i++) {
            if (OpenableColumns.DISPLAY_NAME.equals(columns[i])) row[i] = "Waze.apk";
            if (OpenableColumns.SIZE.equals(columns[i])) row[i] = apk.length();
        }
        result.addRow(row); return result;
    }
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        File apk = file(uri);
        if (!"r".equals(mode)) throw new SecurityException("Read only");
        return ParcelFileDescriptor.open(apk, ParcelFileDescriptor.MODE_READ_ONLY);
    }
    public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
    public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
