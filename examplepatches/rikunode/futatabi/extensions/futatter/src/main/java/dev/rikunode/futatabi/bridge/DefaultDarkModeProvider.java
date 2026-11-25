package dev.rikunode.futatabi.bridge;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

/** Seeds the verified Flutter theme preference before the Dart isolate starts. */
public final class DefaultDarkModeProvider extends ContentProvider {
    private static final String MODE = "flutter.themeMode";
    private static final String LEGACY_MODE = "flutter.theme";
    private static final String LEGACY_DARK = "flutter.isDarkTheme";
    private static final String MIGRATED = "flutter.ftutter3";

    @Override public boolean onCreate() {
        Context context = getContext();
        if (context != null) {
            try {
                if (!seed(context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE))) {
                    Log.w("FutatabiTheme", "Default theme write failed");
                }
            } catch (RuntimeException ex) {
                Log.w("FutatabiTheme", "Default theme initialization skipped: " + ex.getClass().getSimpleName());
            }
        }
        return true;
    }

    static boolean seed(SharedPreferences prefs) {
        // Never overwrite a saved choice, even if its value is unfamiliar.
        if (prefs.contains(MODE)) return true;
        boolean migrating = !prefs.contains(MIGRATED);
        if (migrating && (prefs.contains(LEGACY_MODE) || prefs.contains(LEGACY_DARK))) {
            return true; // Let the original app migrate a legacy user's choice.
        }

        SharedPreferences.Editor editor = prefs.edit().putLong(MODE, 1L);
        if (migrating) {
            // Original v3 migration maps legacy theme=2 to themeMode=1.
            // Seed the legacy default as well, otherwise migration resets it to light.
            editor.putLong(LEGACY_MODE, 2L);
        }
        return editor.commit();
    }

    @Override public String getType(Uri uri) { return null; }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
}
