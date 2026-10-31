package xyz.urro.gboard;

import android.content.Context;
import android.content.SharedPreferences;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;
import java.util.List;

/** Remote history stays out of Gboard's local clipboard database and Android's active clipboard. */
final class ClipStore {
    static final class Entry {
        final long id;
        final String text;
        final String type;
        final long time;
        final boolean pinned;
        Entry(long id, String text, long time, boolean pinned, String type) {
            this.id = id; this.text = text; this.time = time; this.pinned = pinned; this.type = type;
        }
    }
    private final SharedPreferences preferences;
    private final Context context;
    ClipStore(Context context) { this.context = context.getApplicationContext(); preferences = context.getSharedPreferences("urro_gboard_remote_clips", Context.MODE_PRIVATE); }

    synchronized List<Entry> entries(long ttl, int limit) {
        List<Entry> entries = read();
        int originalSize = entries.size();
        long cutoff = ttl < 0 ? 0 : System.currentTimeMillis() - ttl;
        entries.removeIf(value -> !value.pinned && value.time < cutoff);
        entries.sort((a, b) -> Long.compare(b.time, a.time));
        int retained = 0;
        for (int i = 0; i < entries.size();) {
            if (!entries.get(i).pinned && ++retained > limit && limit >= 0) entries.remove(i);
            else i++;
        }
        if (entries.size() != originalSize) save(entries);
        return entries;
    }

    synchronized void add(String text, String type, long ttl, int limit) throws Exception {
        List<Entry> entries = entries(ttl, limit);
        String original = text;
        boolean pinned = entries.stream().anyMatch(value -> value.text.equals(original) && value.pinned);
        entries.removeIf(value -> value.text.equals(original));
        long id = -Math.max(System.currentTimeMillis(), preferences.getLong("last_id", 0) + 1);
        if ("image".equals(type)) {
            byte[] encoded = android.util.Base64.decode(text, android.util.Base64.DEFAULT);
            android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            android.graphics.BitmapFactory.decodeByteArray(encoded, 0, encoded.length, options);
            String extension;
            String mime = options.outMimeType;
            if (options.outWidth <= 0 || options.outHeight <= 0 || mime == null) {
                saveDownload(encoded);
                return;
            }
            switch (mime) {
                case "image/png": extension = ".png"; break;
                case "image/jpeg": extension = ".jpg"; break;
                case "image/webp": extension = ".webp"; break;
                case "image/gif": extension = ".gif"; break;
                default: saveDownload(encoded); return;
            }
            java.io.File file = new java.io.File(ClipImages.directory(context), (-id) + extension);
            try (java.io.OutputStream output = new java.io.FileOutputStream(file)) { output.write(encoded); }
            text = ClipImages.uri(context, file.getName()).toString();
        }
        entries.add(0, new Entry(id, text, System.currentTimeMillis(), pinned, type));
        while (limit >= 0 && entries.size() > Math.max(limit, 1) + 100) entries.remove(entries.size() - 1);
        save(entries);
        preferences.edit().putLong("last_id", -id).apply();
    }

    private void saveDownload(byte[] image) throws Exception {
        android.content.ContentValues values = new android.content.ContentValues();
        values.put(android.provider.MediaStore.Downloads.DISPLAY_NAME, "ClipCascade-" + System.currentTimeMillis() + ".image");
        values.put(android.provider.MediaStore.Downloads.MIME_TYPE, "application/octet-stream");
        values.put(android.provider.MediaStore.Downloads.RELATIVE_PATH, android.os.Environment.DIRECTORY_DOWNLOADS + "/ClipCascade");
        values.put(android.provider.MediaStore.Downloads.IS_PENDING, 1);
        android.net.Uri uri = context.getContentResolver().insert(android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
        if (uri == null) throw new java.io.IOException("Could not create download");
        try {
            try (java.io.OutputStream output = context.getContentResolver().openOutputStream(uri)) {
                if (output == null) throw new java.io.IOException("Could not open download");
                output.write(image);
            }
            values.clear(); values.put(android.provider.MediaStore.Downloads.IS_PENDING, 0);
            context.getContentResolver().update(uri, values, null, null);
            new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> android.widget.Toast.makeText(context, "Image saved to Downloads/ClipCascade", android.widget.Toast.LENGTH_LONG).show());
        } catch (Exception exception) {
            context.getContentResolver().delete(uri, null, null);
            throw exception;
        }
    }

    synchronized void update(long id, String text, boolean pinned, boolean delete) {
        List<Entry> entries = read();
        for (int i = 0; i < entries.size(); i++) if (entries.get(i).id == id) {
            Entry old = entries.remove(i);
            if (!delete) entries.add(i, new Entry(id, text, old.time, pinned, old.type));
            save(entries); return;
        }
    }

    synchronized void clear() { save(new ArrayList<>()); }

    private List<Entry> read() {
        List<Entry> result = new ArrayList<>();
        try {
            JSONArray array = new JSONArray(preferences.getString("history", "[]"));
            for (int i = 0; i < array.length(); i++) {
                JSONObject item = array.getJSONObject(i);
                String type = item.optString("type", "text"), text = item.getString("text");
                if (type.equals("image")) text = ClipImages.uri(context, android.net.Uri.parse(text).getLastPathSegment()).toString();
                result.add(new Entry(item.getLong("id"), text, item.getLong("time"), item.optBoolean("pinned"), type));
            }
        } catch (org.json.JSONException exception) {
            android.util.Log.e("UrroGboard", "Remote history could not be read: " + exception.getClass().getSimpleName());
        }
        return result;
    }

    private void save(List<Entry> entries) {
        java.util.Set<String> retained = new java.util.HashSet<>();
        for (Entry entry : entries) if ("image".equals(entry.type)) retained.add(android.net.Uri.parse(entry.text).getLastPathSegment());
        java.io.File[] files = ClipImages.directory(context).listFiles();
        if (files != null) for (java.io.File file : files) if (!retained.contains(file.getName())) file.delete();
        JSONArray array = new JSONArray();
        try {
            for (Entry entry : entries) array.put(new JSONObject().put("id", entry.id).put("text", entry.text).put("time", entry.time).put("pinned", entry.pinned).put("type", entry.type));
        } catch (org.json.JSONException exception) { throw new IllegalStateException(exception); }
        preferences.edit().putString("history", array.toString()).apply();
    }
}
