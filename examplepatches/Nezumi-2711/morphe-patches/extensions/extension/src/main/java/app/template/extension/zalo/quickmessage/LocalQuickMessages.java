package app.template.extension.zalo.quickmessage;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;

/**
 * Helpers for keeping Zalo quick messages entirely local. The patch intercepts the create / update / delete
 * requests and feeds the app's own server-push handlers (ufk.e / ufk.g / ufk.c) with locally built payloads,
 * so the in-memory list, the LiveData and the table_quick_message DB rows are maintained by the app itself.
 * Real server pushes and sync are dropped: the push handlers only run while a local call is in progress.
 */
public final class LocalQuickMessages {
    private LocalQuickMessages() { }

    private static final ThreadLocal<Boolean> LOCAL_CALL = new ThreadLocal<>();

    private static long lastId;

    /** Marks the current thread as applying a local change; push handlers accept calls only in this state. */
    public static void enter() {
        LOCAL_CALL.set(Boolean.TRUE);
    }

    public static void exit() {
        LOCAL_CALL.set(Boolean.FALSE);
    }

    /** False for server-originated calls (socket push), true for calls made by the hooks below. */
    public static boolean isLocalCall() {
        return Boolean.TRUE.equals(LOCAL_CALL.get());
    }

    /** Local ids are positive, monotonic and based on the current time, so they never collide with each other. */
    private static synchronized long nextId() {
        long id = Math.max(System.currentTimeMillis(), lastId + 1);
        lastId = id;
        return id;
    }

    /** Payload equivalent to the "item" the server sends for a newly created quick message. */
    public static JSONObject newItem(String keyword, String text, JSONObject media, int type) {
        return item(nextId(), type, keyword, messageOf(text), media, System.currentTimeMillis());
    }

    /** Payload for an edit: same id and creation time, new keyword / message / media, lastModified = now. */
    public static JSONObject updatedItem(long id, int type, String keyword, JSONObject message,
                                         JSONObject media, long createdTime) {
        long created = createdTime > 0 ? createdTime : System.currentTimeMillis();
        return item(id, type, keyword, message, media, created);
    }

    public static ArrayList<Long> ids(long id) {
        ArrayList<Long> list = new ArrayList<>(1);
        list.add(id);
        return list;
    }

    private static JSONObject messageOf(String text) {
        JSONObject message = new JSONObject();
        try {
            message.put("title", text == null ? "" : text);
        } catch (JSONException failure) {
            NezumiLog.e(Patch.UNLIMITED_QUICK_MESSAGES, "LocalQuickMessages", "quick message text not stored", failure);
        }
        return message;
    }

    private static JSONObject item(long id, int type, String keyword, JSONObject message,
                                   JSONObject media, long createdTime) {
        JSONObject item = new JSONObject();
        try {
            item.put("id", id);
            item.put("type", type);
            item.put("keyword", keyword == null ? "" : keyword);
            if (message != null) item.put("message", message);
            if (media != null) item.put("media", media);
            item.put("createdTime", createdTime);
            item.put("lastModified", System.currentTimeMillis());
        } catch (JSONException failure) {
            NezumiLog.e(Patch.UNLIMITED_QUICK_MESSAGES, "LocalQuickMessages", "quick message item incomplete", failure);
        }
        return item;
    }
}
