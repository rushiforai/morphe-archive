package app.revanced.extension.rif;

import android.content.ContentProvider;
import android.content.ContentProviderClient;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.os.Build;
import android.util.Log;

import java.lang.reflect.Field;
import java.util.Locale;

/**
 * rif's history database, browserhistory.db, as used by its UriHistoryProvider.
 * <p>
 * Based on Arnaumes' "Import history" patch (github.com/Arnaumes/revanced-rif-import-history), GPL-3.0.
 */
final class HistoryDatabase {
    static final String TABLE = "uri_history";
    /** rif's history database file (UriHistoryProvider). */
    static final String NAME = "browserhistory.db";

    private static final String TAG = "RifHistoryImport";
    /** UriHistoryProvider's database version. */
    private static final int VERSION = 2;
    private static final String AUTHORITY_STRING = "uri_history_authority";

    private static SQLiteOpenHelper fallbackHelper;

    private HistoryDatabase() {
    }

    /**
     * Opens the history database for writing.
     * <p>
     * Prefers rif's own open helper, taken from its UriHistoryProvider, so the import shares rif's connection
     * instead of competing with it for the database lock. If that isn't possible, opens the same file with a
     * helper that creates rif's exact schema.
     */
    static synchronized SQLiteDatabase openWritable(Context context) {
        SQLiteOpenHelper helper = providerHelper(context);
        if (helper == null) {
            Log.w(TAG, "rif's history provider is unavailable, opening " + NAME + " directly");
            if (fallbackHelper == null) fallbackHelper = new RifSchemaHelper(context.getApplicationContext());
            helper = fallbackHelper;
        }
        return helper.getWritableDatabase();
    }

    /** Closes the fallback helper, if it was used. */
    static synchronized void closeFallback() {
        if (fallbackHelper != null) {
            fallbackHelper.close();
            fallbackHelper = null;
        }
    }

    /** Tells rif's screens observing the history (e.g. read posts) that it changed, like rif's provider does. */
    static void notifyChanged(Context context) {
        String authority = authority(context);
        if (authority == null) return;
        context.getContentResolver().notifyChange(Uri.parse("content://" + authority + "/urihistoryitems"), null);
    }

    private static String authority(Context context) {
        int id = context.getResources().getIdentifier(AUTHORITY_STRING, "string", context.getPackageName());
        return id == 0 ? null : context.getString(id);
    }

    /**
     * rif's history provider runs in the app's process, so its open helper can be read from it. The field is found
     * by type because rif is obfuscated.
     */
    private static SQLiteOpenHelper providerHelper(Context context) {
        String authority = authority(context);
        if (authority == null) return null;

        ContentProviderClient client = context.getContentResolver().acquireContentProviderClient(authority);
        if (client == null) return null;
        try {
            ContentProvider provider = client.getLocalContentProvider();
            if (provider == null) return null;

            for (Class<?> type = provider.getClass(); type != null && type != ContentProvider.class;
                 type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (!SQLiteOpenHelper.class.isAssignableFrom(field.getType())) continue;
                    field.setAccessible(true);
                    SQLiteOpenHelper helper = (SQLiteOpenHelper) field.get(provider);
                    if (helper != null && NAME.equals(helper.getDatabaseName())) return helper;
                }
            }
        } catch (Exception e) {
            Log.w(TAG, "Could not get rif's history database helper", e);
        } finally {
            release(client);
        }
        return null;
    }

    @SuppressWarnings("deprecation")
    private static void release(ContentProviderClient client) {
        if (Build.VERSION.SDK_INT >= 24) {
            client.close();
        } else {
            client.release();
        }
    }

    /** Same database, schema and settings as rif's UriHistoryProvider helper. */
    private static final class RifSchemaHelper extends SQLiteOpenHelper {
        RifSchemaHelper(Context context) {
            super(context, NAME, null, VERSION);
        }

        @Override
        public void onConfigure(SQLiteDatabase db) {
            super.onConfigure(db);
            // rif turns off write-ahead logging on Android 9+.
            if (Build.VERSION.SDK_INT >= 28) db.disableWriteAheadLogging();
        }

        @Override
        public void onCreate(SQLiteDatabase db) {
            db.execSQL("CREATE TABLE " + TABLE + " (_id INTEGER PRIMARY KEY, uri TEXT, referer TEXT, "
                    + "accessed INTEGER, access_count INTEGER, thread_id TEXT);");
            db.execSQL(String.format(Locale.ENGLISH, "CREATE INDEX %s_uri_idx ON %s(uri);", TABLE, TABLE));
            db.execSQL(String.format(Locale.ENGLISH, "CREATE INDEX %s_thread_id_idx ON %s(thread_id);", TABLE, TABLE));
        }

        @Override
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            // rif has no upgrades for this database either.
        }
    }
}
