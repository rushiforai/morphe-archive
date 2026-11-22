package app.morphe.extension.chmate;

import android.content.Context;
import android.util.AtomicFile;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;

final class GigaFileUploadHistory {
    private static final int LIMIT = 500;

    static synchronized JSONArray load(Context context) {
        try {
            return new JSONArray(new String(file(context).readFully(), StandardCharsets.UTF_8));
        } catch (Exception unavailable) {
            return new JSONArray();
        }
    }

    static synchronized void save(Context context, String snapshot) {
        if (snapshot == null || snapshot.equals("null") || snapshot.length() > 1_000_000) return;
        try {
            JSONArray incoming = new JSONArray(snapshot);
            if (incoming.length() == 0) return;
            JSONArray previous = load(context);
            LinkedHashMap<String, JSONObject> history = new LinkedHashMap<>();
            for (int i = 0; i < previous.length(); i++) {
                JSONObject item = previous.optJSONObject(i);
                if (item != null) history.put(item.optString("url"), item);
            }
            boolean changed = false;
            for (int i = 0; i < Math.min(LIMIT, incoming.length()); i++) {
                JSONObject item = incoming.optJSONObject(i);
                if (item == null) continue;
                String url = item.optString("url"), key = item.optString("key"), name = item.optString("name");
                if (!MediaUploadWebPolicy.gigaShare(url) || !key.matches("[A-Za-z0-9]{1,64}")) continue;
                name = name.substring(0, Math.min(name.length(), 256)).trim();
                JSONObject old = history.get(url);
                if (old != null && key.equals(old.optString("key")) && name.equals(old.optString("name"))) continue;
                history.put(url, new JSONObject().put("url", url).put("key", key).put("name", name)
                        .put("saved", old == null ? System.currentTimeMillis() : old.optLong("saved")));
                changed = true;
            }
            if (!changed) return;
            while (history.size() > LIMIT) history.remove(history.keySet().iterator().next());
            AtomicFile file = file(context);
            FileOutputStream stream = file.startWrite();
            try {
                stream.write(new JSONArray(history.values()).toString().getBytes(StandardCharsets.UTF_8));
                file.finishWrite(stream);
            } catch (Exception failure) {
                file.failWrite(stream);
            }
        } catch (Exception ignored) {
            // A malformed page result must not overwrite existing uploads.
        }
    }

    private static AtomicFile file(Context context) {
        return new AtomicFile(new File(context.getNoBackupFilesDir(), "haiagaru-gigafile-uploads.json"));
    }

    private GigaFileUploadHistory() {}
}
