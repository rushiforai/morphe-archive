package app.noam.extension.geocaching;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Named lists kept on the device. Each holds cache codes; the caches themselves are the ones saved
 * by GcOfflineStore, so every list works offline. "Offline caches" (ALL) is every saved cache.
 */
public final class GcLocalLists {
    public static final String ALL = "NOAM_OFFLINE";
    private static final String PREFIX = "NOAM_L";

    private GcLocalLists() {}

    private static File file() {
        return new File(Utils.context().getFilesDir(), "local_lists.json");
    }

    public static synchronized JSONArray all() {
        try {
            File f = file();
            if (!f.exists()) return new JSONArray();
            try (FileInputStream in = new FileInputStream(f); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
                return new JSONArray(new String(out.toByteArray(), StandardCharsets.UTF_8));
            }
        } catch (Throwable t) {
            Utils.logError("Local lists unreadable", t);
            return new JSONArray();
        }
    }

    private static synchronized void save(JSONArray lists) {
        try (FileOutputStream out = new FileOutputStream(file())) {
            out.write(lists.toString().getBytes(StandardCharsets.UTF_8));
        } catch (Throwable t) {
            Utils.logError("Local lists not saved", t);
        }
    }

    public static boolean isLocal(String code) {
        return code != null && (code.equals(ALL) || code.startsWith(PREFIX));
    }

    public static synchronized String create(String name) {
        JSONArray lists = all();
        String code = PREFIX + System.currentTimeMillis();
        try {
            lists.put(new JSONObject().put("code", code).put("name", name)
                .put("created", System.currentTimeMillis()).put("caches", new JSONArray()));
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
        save(lists);
        return code;
    }

    /** Called before the Lists hub deletes a list on the server: true when it was one of ours. */
    public static boolean deleteIfLocal(String code) {
        if (!isLocal(code)) return false;
        if (ALL.equals(code)) {
            Utils.toast("Offline caches holds every saved cache; remove caches from inside it");
        } else {
            delete(code);
        }
        return true;
    }

    public static synchronized void delete(String code) {
        JSONArray lists = all(), kept = new JSONArray();
        for (int i = 0; i < lists.length(); i++) {
            JSONObject list = lists.optJSONObject(i);
            if (list != null && !code.equals(list.optString("code"))) kept.put(list);
        }
        save(kept);
    }

    public static String name(String code) {
        if (ALL.equals(code)) return "Offline caches";
        JSONObject list = find(all(), code);
        return list == null ? "List" : list.optString("name", "List");
    }

    /** Cache codes in a list, or null for ALL (meaning every saved cache). */
    public static List<String> caches(String code) {
        if (ALL.equals(code)) return null;
        List<String> codes = new ArrayList<>();
        JSONObject list = find(all(), code);
        JSONArray array = list == null ? null : list.optJSONArray("caches");
        if (array != null) for (int i = 0; i < array.length(); i++) codes.add(array.optString(i));
        return codes;
    }

    public static boolean contains(String listCode, String cacheCode) {
        List<String> codes = caches(listCode);
        return codes == null ? GcOfflineStore.isDownloaded(cacheCode) : codes.contains(cacheCode);
    }

    public static synchronized void add(String listCode, String cacheCode) {
        if (ALL.equals(listCode)) return;
        JSONArray lists = all();
        JSONObject list = find(lists, listCode);
        if (list == null) return;
        JSONArray array = list.optJSONArray("caches");
        if (array == null) {
            array = new JSONArray();
            try {
                list.put("caches", array);
            } catch (Exception ignored) {
                return;
            }
        }
        for (int i = 0; i < array.length(); i++) if (cacheCode.equals(array.optString(i))) return;
        array.put(cacheCode);
        save(lists);
    }

    /** Removes from one list; for ALL the saved cache itself is deleted and leaves every list. */
    public static synchronized void remove(String listCode, String cacheCode) {
        JSONArray lists = all();
        for (int l = 0; l < lists.length(); l++) {
            JSONObject list = lists.optJSONObject(l);
            if (list == null || (!ALL.equals(listCode) && !listCode.equals(list.optString("code")))) continue;
            JSONArray array = list.optJSONArray("caches"), kept = new JSONArray();
            if (array == null) continue;
            for (int i = 0; i < array.length(); i++) if (!cacheCode.equals(array.optString(i))) kept.put(array.optString(i));
            try {
                list.put("caches", kept);
            } catch (Exception ignored) {
            }
        }
        save(lists);
        if (ALL.equals(listCode)) GcOfflineStore.delete(cacheCode);
    }

    private static JSONObject find(JSONArray lists, String code) {
        for (int i = 0; i < lists.length(); i++) {
            JSONObject list = lists.optJSONObject(i);
            if (list != null && code.equals(list.optString("code"))) return list;
        }
        return null;
    }

    /** Replaces CreateListActivity's server call: makes the list on the device and returns like the app. */
    public static void createFromActivity(Activity activity) {
        EditText field = firstEditText(activity.getWindow().getDecorView());
        String name = field == null || field.getText() == null ? "" : field.getText().toString().trim();
        if (name.isEmpty()) {
            Utils.toast("Give the List a name");
            return;
        }
        String code = create(name);
        Utils.toast("List \"" + name + "\" created");
        Intent result = new Intent();
        result.putExtra("com.groundspeak.geocaching.intro.activities.CreateListActivity.LIST_CODE", code);
        result.putExtra("com.groundspeak.geocaching.intro.activities.CreateListActivity.LIST_NAME", name);
        activity.setResult(Activity.RESULT_OK, result);
        activity.finish();
    }

    private static EditText firstEditText(View view) {
        if (view instanceof EditText) return (EditText) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText found = firstEditText(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }
}
