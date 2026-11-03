package net.gtvbox.videoplayer;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Binder;
import android.util.Log;

/**
 * Read-only endpoint for the progress journal (contract v1): content://net.gtvbox.videoplayer.tikka.progress/last
 * answers one row, only to Stremio (com.stremio.one, or com.stremio.one.morphe for a side-by-side install); every other caller gets an empty cursor.
 */
public class ProgressJournalProvider extends ContentProvider {
    public static final String AUTHORITY = "net.gtvbox.videoplayer.tikka.progress";
    static final String CALLER = "com.stremio.one";
    static final String CALLER_MORPHE = "com.stremio.one.morphe";
    static final String[] COLUMNS = concat(new String[] {
            "launch_id", "video_url", "stremio_video_id", "position_ms",
            "duration_ms", "state", "end_by", "updated_at"
    }, VimuTracks.JOURNAL_COLUMNS);
    private static final String TAG = "VimuResult";

    @Override
    public boolean onCreate() {
        return true;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs,
            String sortOrder) {
        MatrixCursor cursor = new MatrixCursor(COLUMNS, 1);
        boolean ok = false;
        String caller = "null";
        try {
            String callingPackage = null;
            String[] uidPackages = null;
            try {
                callingPackage = getCallingPackage();
            } catch (Throwable ignored) {
            }
            Context ctx = getContext();
            try {
                if (ctx != null) {
                    uidPackages = ctx.getPackageManager().getPackagesForUid(Binder.getCallingUid());
                }
            } catch (Throwable ignored) {
            }
            if (callingPackage != null) {
                caller = callingPackage;
            } else if (uidPackages != null && uidPackages.length > 0) {
                caller = uidPackages[0];
            }
            ok = callerAllowed(callingPackage, uidPackages);
            if (ok && ctx != null && uri != null && "/last".equals(uri.getPath())) {
                Object[] row = row(ctx.getSharedPreferences(ProgressJournal.PREFS, Context.MODE_PRIVATE));
                if (row != null) cursor.addRow(row);
            }
        } catch (Throwable error) {
            Log.w(TAG, "journal query", error);
        }
        Log.i(TAG, "journal q caller=" + caller + " ok=" + ok);
        return cursor;
    }

    private static boolean isCaller(String pkg) {
        return CALLER.equals(pkg) || CALLER_MORPHE.equals(pkg);
    }

    static boolean callerAllowed(String callingPackage, String[] uidPackages) {
        if (isCaller(callingPackage)) return true;
        if (uidPackages != null) {
            for (String pkg : uidPackages) {
                if (isCaller(pkg)) return true;
            }
        }
        return false;
    }

    private static String[] concat(String[] a, String[] b) {
        String[] all = new String[a.length + b.length];
        System.arraycopy(a, 0, all, 0, a.length);
        System.arraycopy(b, 0, all, a.length, b.length);
        return all;
    }

    /** The eight journal values plus the seven tikka.tracks.* values in column order, or null while no row with a duration exists yet. */
    static Object[] row(SharedPreferences p) {
        if (p == null) return null;
        long duration = p.getLong("duration_ms", 0L);
        if (duration <= 0L) return null;
        Object[] base = {
                p.getString("launch_id", ""),
                p.getString("video_url", ""),
                p.getString("stremio_video_id", ""),
                p.getLong("position_ms", 0L),
                duration,
                p.getString("state", ""),
                p.getString("end_by", ""),
                p.getLong("updated_at", 0L)
        };
        Object[] tracks = VimuTracks.journalValues(p);
        Object[] all = new Object[base.length + tracks.length];
        System.arraycopy(base, 0, all, 0, base.length);
        System.arraycopy(tracks, 0, all, base.length, tracks.length);
        return all;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        throw new UnsupportedOperationException();
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException();
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException();
    }
}
