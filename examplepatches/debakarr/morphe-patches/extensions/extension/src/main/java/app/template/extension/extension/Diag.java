package app.template.extension.extension;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;

/**
 * Debug-only response dumper. When {@link #ENABLED} is true, the first few
 * listing-looking responses are written to
 * {@code /sdcard/Android/data/<package>/files/morphe-dump/} so their JSON
 * shape can be inspected with {@code adb pull}.
 */
final class Diag {

    private Diag() {}

    static final boolean ENABLED = false;
    private static final String TAG = "MorpheSort";
    private static final int MAX_DUMPS = 12;
    private static int sDumps;

    static void dump(String app, String json) {
        if (!ENABLED) return;
        Log.d(TAG, "dump(" + app + ") len=" + (json == null ? -1 : json.length()));
        if (json == null || json.length() < 2000 || sDumps >= MAX_DUMPS) return;
        String lower = json.length() > 400000 ? json.substring(0, 400000).toLowerCase() : json.toLowerCase();
        if (!lower.contains("rating")) return;
        try {
            Context ctx = currentApplication();
            if (ctx == null) {
                Log.d(TAG, "dump: no application context");
                return;
            }
            // External files dir can be unavailable (null) on some ROMs: fall back to internal storage.
            File base = ctx.getExternalFilesDir(null);
            if (base == null) base = ctx.getFilesDir();
            File dir = new File(base, "morphe-dump");
            if (!dir.isDirectory() && !dir.mkdirs()) {
                Log.d(TAG, "dump: cannot create " + dir);
                return;
            }
            int n = ++sDumps;
            File out = new File(dir, app + "-" + n + ".json");
            try (FileOutputStream os = new FileOutputStream(out)) {
                os.write(json.getBytes(StandardCharsets.UTF_8));
            }
            Log.d(TAG, "dumped " + json.length() + " chars to " + out);
        } catch (Throwable t) {
            Log.d(TAG, "dump failed: " + t);
        }
    }

    private static Context currentApplication() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }
}
