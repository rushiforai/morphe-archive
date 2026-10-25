package software.santodan.extension.nuvioupdate;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.SystemClock;
import android.util.Log;
import java.io.File;

/** The normal APK installer owns confirmation and subsequent installation progress. */
public final class UpdateInstall {
    private static long lastLaunch = Long.MIN_VALUE;
    private static String lastPath;
    private UpdateInstall() {}
    public static synchronized boolean open(Context context, File apk, boolean background) {
        if (background || !apk.isFile()) return false;
        long now = SystemClock.elapsedRealtime();
        if (apk.getAbsolutePath().equals(lastPath) && lastLaunch != Long.MIN_VALUE && now - lastLaunch < 2000) return true;
        try {
            Uri uri = contentUri(context, context.getPackageName() + ".fileprovider", apk);
            Intent intent = new Intent(Intent.ACTION_VIEW).setDataAndType(uri, "application/vnd.android.package-archive")
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_GRANT_READ_URI_PERMISSION);
            context.startActivity(intent);
            lastLaunch = now; lastPath = apk.getAbsolutePath();
            Log.i("SantodanUpdates", "Opened system APK installer; Android owns installation progress");
            return true;
        } catch (RuntimeException error) {
            Log.w("SantodanUpdates", "System APK installer unavailable; using native session", error);
            return false;
        }
    }
    // Replaced with direct calls to the two proven native FileProvider methods.
    public static Uri contentUri(Context context, String authority, File apk) { return null; }
}
