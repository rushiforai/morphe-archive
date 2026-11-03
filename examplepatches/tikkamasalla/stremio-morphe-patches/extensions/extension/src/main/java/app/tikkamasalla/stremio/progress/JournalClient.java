package app.tikkamasalla.stremio.progress;

import android.content.Context;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.net.Uri;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import app.tikkamasalla.stremio.introskip.TrackMemory;

/** Reads the progress journal row from the patched Vimu's content provider. Fails soft: null. */
final class JournalClient {
    private static final String AUTHORITY = "net.gtvbox.videoplayer.tikka.progress";
    private static final Uri URI = Uri.parse("content://" + AUTHORITY + "/last");

    private static volatile TracksHolder lastTracks;

    private static final class TracksHolder {
        final String launchId;
        final TrackMemory.Entry entry;

        TracksHolder(String launchId, TrackMemory.Entry entry) {
            this.launchId = launchId;
            this.entry = entry;
        }
    }

    private JournalClient() {
    }

    static TrackMemory.Entry tracksFor(String launchId) {
        try {
            if (launchId == null || launchId.isEmpty()) return null;
            TracksHolder h = lastTracks;
            if (h != null && launchId.equals(h.launchId)) {
                return h.entry;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /** The last journal row, or null (stock Vimu, other players, no row, any error): silent. */
    static JournalPolicy.Row query(Context context) {
        if (context == null) return null;
        try {
            // Only the real Vimu may answer; resolving the provider does not start its process.
            ProviderInfo info = context.getPackageManager().resolveContentProvider(AUTHORITY, 0);
            if (info == null || !"net.gtvbox.videoplayer".equals(info.packageName)) return null;
            Cursor cursor = context.getContentResolver().query(URI, null, null, null, null);
            if (cursor == null) return null;
            try {
                if (!cursor.moveToFirst()) return null;
                JournalPolicy.Row row = new JournalPolicy.Row();
                row.launchId = string(cursor, "launch_id");
                row.videoUrl = string(cursor, "video_url");
                row.stremioVideoId = string(cursor, "stremio_video_id");
                row.state = string(cursor, "state");
                row.endBy = string(cursor, "end_by");
                row.positionMs = number(cursor, "position_ms");
                row.durationMs = number(cursor, "duration_ms");
                row.updatedAt = number(cursor, "updated_at");

                Map<String, Object> extras = new HashMap<>();
                addStringCol(cursor, extras, "tikka.tracks.show");
                addStringCol(cursor, extras, "tikka.tracks.audio_lang");
                addStringCol(cursor, extras, "tikka.tracks.audio_label");
                addStringCol(cursor, extras, "tikka.tracks.sub_lang");
                addStringCol(cursor, extras, "tikka.tracks.sub_label");
                addBoolCol(cursor, extras, "tikka.tracks.sub_off");
                addBoolCol(cursor, extras, "tikka.tracks.manual");

                TrackMemory.Entry entry = TrackMemory.fromExtras(extras);
                if (entry != null && row.launchId != null && !row.launchId.isEmpty()) {
                    lastTracks = new TracksHolder(row.launchId, entry);
                }

                return row;
            } finally {
                cursor.close();
            }
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Same as query() on a daemon thread; gives up after timeoutMs so a caller is never stuck. */
    static JournalPolicy.Row queryBounded(final Context context, long timeoutMs) {
        final AtomicReference<JournalPolicy.Row> out = new AtomicReference<>();
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                out.set(query(context));
            }
        }, "ExtProgressJournal");
        thread.setDaemon(true);
        thread.start();
        try {
            thread.join(timeoutMs);
        } catch (InterruptedException ignored) {
        }
        return out.get();
    }

    private static String string(Cursor c, String name) {
        int i = c.getColumnIndex(name);
        String v = i >= 0 ? c.getString(i) : null;
        return v == null ? "" : v;
    }

    private static long number(Cursor c, String name) {
        int i = c.getColumnIndex(name);
        return i >= 0 ? c.getLong(i) : 0L;
    }

    private static void addStringCol(Cursor c, Map<String, Object> map, String name) {
        int i = c.getColumnIndex(name);
        if (i >= 0 && !c.isNull(i)) {
            map.put(name, c.getString(i));
        }
    }

    private static void addBoolCol(Cursor c, Map<String, Object> map, String name) {
        int i = c.getColumnIndex(name);
        if (i >= 0 && !c.isNull(i)) {
            map.put(name, c.getInt(i) != 0);
        }
    }
}
