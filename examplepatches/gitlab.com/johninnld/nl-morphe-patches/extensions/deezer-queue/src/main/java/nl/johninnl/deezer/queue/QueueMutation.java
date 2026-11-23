package nl.johninnl.deezer.queue;

import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;

/** Invalidate identity before native SQL can change rows, including the loader-refresh interval. */
public final class QueueMutation {
    private static long epoch;
    private static int writers;
    private static long metadataRefreshes;
    private static String lastChange = "none";
    static final String KEY = "nl.johninnl.deezer.queue.cursorEpoch";
    public static synchronized long version() { return writers == 0 && epoch >= 0 ? epoch : -1; }
    static synchronized void begin() { begin("queue change"); }
    private static synchronized void begin(String reason) { writers++; epoch++; lastChange = reason; }
    static synchronized void end() { epoch++; writers--; }
    static synchronized String describe() { return "lastChange="+lastChange+" retainedMetadataRefreshes="+metadataRefreshes; }
    public static long cursorVersion(Object value) {
        if (!(value instanceof Cursor)) return -1;
        try {
            Bundle extras = ((Cursor) value).getExtras();
            return extras == null ? -1 : extras.getLong(KEY, -1L);
        } catch (RuntimeException unavailable) { return -1; }
    }
    private static boolean rows(Uri uri) {
        if (uri == null || uri.getPathSegments().isEmpty()) return false;
        String path = uri.getPathSegments().get(0);
        return path.equals("tracks") || path.equals("tracks_insert") || path.equals("tracks_replace") ||
            path.equals("unique_tracks") || path.equals("contexts");
    }
    private static boolean identity(ContentValues values) {
        return values != null && identityKeys(values.keySet());
    }
    static boolean identityKeys(Iterable<String> keys) {
        for (String key : keys) {
            String name = key == null ? "" : key.toUpperCase(java.util.Locale.ROOT);
            // Only these two proven metadata columns are exempt. Unknown/rowid/case variants fence.
            if (!name.equals("BOOKMARK") && !name.equals("HEARD_STATUS")) return true;
        }
        return false;
    }
    /**
     * Native IIIlIlIlIlIIllll.llIlIlIlIIlIlll refreshes streaming/track metadata with
     * WHERE MEDIA_ID=? AND MEDIA_TYPE=?. The serializer writes those SAME two values
     * back, but never a queue position or acquisition context. AudioQueueProvider.update
     * deliberately does not notify the queue loaders for this operation. Fencing it
     * would therefore leave both native cursors permanently behind our global epoch.
     */
    static boolean metadataRefresh(Iterable<String> keys, String where, String[] args, String mediaId, String mediaType) {
        if (!"MEDIA_ID=? AND MEDIA_TYPE=?".equals(where) || args == null || args.length != 2 ||
            mediaId == null || mediaId.isEmpty() || mediaType == null || mediaType.isEmpty() ||
            !mediaId.equals(args[0]) || !mediaType.equals(args[1])) return false;
        boolean id = false, type = false;
        for (String key : keys) {
            if (key == null) return false;
            switch (key) {
                case "MEDIA_ID": id = true; break;
                case "MEDIA_TYPE": type = true; break;
                case "MEDIA_VERSION": case "ORIGIN_ID": case "FALLBACK_ID": case "PUID":
                case "TITLE": case "TYPE": case "ALBUM_ID": case "ALBUM_NAME":
                case "ARTIST_ID": case "ARTIST_NAME": case "ARTIST_PICTURE": case "BOOKMARK":
                case "HEARD_STATUS": case "DURATION": case "COVER_INFO": case "COVER_TYPE":
                case "EXTERNAL_URL": case "LYRICS_ID": case "LYRICS_STATUS": case "OPTIONS":
                case "AVAILABLE_FORMATS": case "STREAMING_QUALITY": case "LAST_STREAMING_QUALITY":
                case "STREAMING_URL": case "PAYLOAD": case "EXPLICIT_LYRICS_STATUS":
                case "EXPLICIT_COVER_STATUS": case "TRACK_TOKEN": case "TRACK_TOKEN_EXPIRATION_TIME_MILLIS":
                case "AUTHORS": case "COMPOSERS": case "ARTISTS": case "GAIN": case "TRACK_NUMBER":
                case "DISK_NUMBER": break;
                default: return false;
            }
        }
        return id && type;
    }
    private static String operation(String kind, Uri uri) {
        return kind+":"+(uri==null||uri.getPathSegments().isEmpty()?"unknown":uri.getPathSegments().get(0));
    }
    public static Uri insert(NativeProvider provider, Uri uri, ContentValues values) throws Throwable {
        boolean change = rows(uri); if (change) begin(operation("insert",uri));
        try { return provider.queueInsert(uri, values); } finally { if (change) end(); }
    }
    public static int bulkInsert(NativeProvider provider, Uri uri, ContentValues[] values) throws Throwable {
        boolean change = rows(uri); if (change) begin(operation("bulkInsert",uri));
        try { return provider.queueBulkInsert(uri, values); } finally { if (change) end(); }
    }
    public static int delete(NativeProvider provider, Uri uri, String where, String[] args) throws Throwable {
        boolean change = rows(uri); if (change) begin(operation("delete",uri));
        try { return provider.queueDelete(uri, where, args); } finally { if (change) end(); }
    }
    public static int update(NativeProvider provider, Uri uri, ContentValues values, String where, String[] args) throws Throwable {
        boolean refresh = rows(uri) && values != null && metadataRefresh(values.keySet(),where,args,
            values.getAsString("MEDIA_ID"),values.getAsString("MEDIA_TYPE"));
        if (refresh) synchronized (QueueMutation.class) { metadataRefreshes++; }
        boolean change = rows(uri) && identity(values) && !refresh;
        if (change) begin(operation("update",uri));
        try { return provider.queueUpdate(uri, values, where, args); } finally { if (change) end(); }
    }
    public static Bundle call(NativeProvider provider, String method, String argument, Bundle extras) throws Throwable {
        boolean change = "clear_all".equals(method) || "clear_from_position".equals(method) ||
            "unshuffle".equals(method) || "remove_keys".equals(method) || "clear".equals(method) ||
            "reorder".equals(method) || "shuffle".equals(method);
        if (change) begin("call:"+method);
        try { return provider.queueCall(method, argument, extras); } finally { if (change) end(); }
    }
    public static Cursor query(NativeProvider provider, Uri uri, String[] columns, String where, String[] args, String order) throws Throwable {
        long before = version();
        Cursor cursor = provider.queueQuery(uri, columns, where, args, order);
        if (cursor == null || !rows(uri)) return cursor;
        long after = version();
        return new QueueCursor(cursor, before >= 0 && before == after ? before : -1);
    }
}
