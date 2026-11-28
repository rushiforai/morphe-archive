package app.template.extension.zalo.settings;

import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.Field;
import java.util.HashSet;
import java.util.Set;

public final class AnhpanRecallHelper {
    private static final String RECALL_PREFS = "anhpan_recall_markers";
    private static final String KEY_IDS = "recalled_ids";
    private static final int MAX_IDS = 2048;

    private AnhpanRecallHelper() {}

    private static Context appContext() {
        try {
            return (Context) Class.forName("com.zing.zalo.MainApplication")
                .getMethod("getAppContext")
                .invoke(null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String[] extractKeys(Object messageId) {
        if (messageId == null) return new String[0];
        try {
            Class<?> cls = messageId.getClass();
            String owner = (String) cls.getField("c").get(messageId);
            if (owner == null || owner.isEmpty()) return new String[0];
            String a = (String) cls.getField("a").get(messageId);
            String b = (String) cls.getField("b").get(messageId);
            int count = ((a != null && !a.isEmpty()) ? 1 : 0) + ((b != null && !b.isEmpty()) ? 1 : 0);
            String[] out = new String[count];
            int idx = 0;
            if (a != null && !a.isEmpty()) out[idx++] = owner + "|a|" + a;
            if (b != null && !b.isEmpty()) out[idx] = owner + "|b|" + b;
            return out;
        } catch (Throwable ignored) {
            return new String[0];
        }
    }

    public static boolean shouldRetain(Object messageId) {
        Context ctx = appContext();
        if (!AnhpanPrefs.isKeepRecalledEnabled(ctx)) return false;
        String[] keys = extractKeys(messageId);
        if (keys.length == 0) return true;
        SharedPreferences prefs = ctx.getSharedPreferences(RECALL_PREFS, Context.MODE_PRIVATE);
        Set<String> current = new HashSet<>(prefs.getStringSet(KEY_IDS, new HashSet<>()));
        if (current.size() > MAX_IDS) {
            current.clear();
        }
        for (String k : keys) {
            current.add(k);
        }
        prefs.edit().putStringSet(KEY_IDS, current).apply();
        return true;
    }

    public static String formatTimeLabel(Object chatRow, String timeText) {
        if (timeText == null || timeText.isEmpty() || chatRow == null) return timeText;
        Context ctx = appContext();
        if (!AnhpanPrefs.isKeepRecalledEnabled(ctx)) return timeText;
        try {
            Field msgField = chatRow.getClass().getDeclaredField("i");
            msgField.setAccessible(true);
            Object msgObj = msgField.get(chatRow);
            if (msgObj == null) return timeText;
            Object messageId = msgObj.getClass().getField("b").get(msgObj);
            String[] keys = extractKeys(messageId);
            if (keys.length == 0) return timeText;
            Set<String> saved = ctx.getSharedPreferences(RECALL_PREFS, Context.MODE_PRIVATE)
                .getStringSet(KEY_IDS, null);
            if (saved == null) return timeText;
            for (String k : keys) {
                if (saved.contains(k)) {
                    return timeText + " \u00B7 Recalled";
                }
            }
        } catch (Throwable ignored) {
        }
        return timeText;
    }
}
