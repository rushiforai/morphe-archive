package app.template.extension.alerts;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public final class AlertHistory {
    private static final String STORE = "morphe_alert_history";

    private AlertHistory() {}

    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    public static synchronized void record(Context context, String id, String title,
                                           String message, String url) {
        SharedPreferences stored = prefs(context);
        if (stored.contains(id)) return;
        store(stored.edit(), new AlertHistoryEntry(id, title, message, url, System.currentTimeMillis(), true))
                .apply();
    }

    static List<AlertHistoryEntry> entries(Context context) {
        List<AlertHistoryEntry> entries = new ArrayList<>();
        prefs(context).getAll().forEach((id, raw) -> {
            if (!(raw instanceof String)) return;
            try {
                JSONObject value = new JSONObject((String) raw);
                entries.add(new AlertHistoryEntry(id, value.getString("title"), value.getString("message"),
                        value.getString("url"), value.getLong("time"), value.getBoolean("unread")));
            } catch (JSONException error) {
                Log.w("MorpheAlertHistory", "Could not read a history entry", error);
            }
        });
        entries.sort(AlertHistoryEntry.NEWEST_FIRST);
        return entries;
    }

    static synchronized void markRead(Context context, List<AlertHistoryEntry> shown) {
        SharedPreferences stored = prefs(context);
        SharedPreferences.Editor edit = stored.edit();
        for (AlertHistoryEntry entry : shown) {
            if (entry.unread && stored.contains(entry.id)) store(edit, entry.markRead());
        }
        edit.apply();
    }

    static synchronized void clear(Context context, List<AlertHistoryEntry> shown) {
        SharedPreferences.Editor edit = prefs(context).edit();
        for (AlertHistoryEntry entry : shown) edit.remove(entry.id);
        edit.apply();
    }

    private static SharedPreferences.Editor store(SharedPreferences.Editor edit, AlertHistoryEntry entry) {
        try {
            JSONObject value = new JSONObject().put("title", entry.title).put("message", entry.message)
                    .put("url", entry.url).put("time", entry.receivedAt).put("unread", entry.unread);
            edit.putString(entry.id, value.toString());
        } catch (JSONException error) {
            Log.w("MorpheAlertHistory", "Could not save a history entry", error);
        }
        return edit;
    }
}
