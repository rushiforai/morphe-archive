package app.template.extension.zalo.chat;

import android.content.Context;
import android.util.Base64;
import android.view.View;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.WeakHashMap;

import app.template.extension.zalo.settings.NezumiPrefs;
import app.template.extension.zalo.shared.ZaloEnv;

/** Keeps incoming recalled messages visible and labels them in the chat footer. */
public final class RecalledMessages {
    private RecalledMessages() { }

    private static final Object RECALL_LOCK = new Object();

    private static final WeakHashMap<View, Boolean> RECALL_ROWS = new WeakHashMap<>();

    private static String recallAccount;

    private static Set<String> recalledMessages = new HashSet<>();

    public static boolean shouldKeepIncomingRecall(String senderId, int eventType) {
        boolean enabled = isRecalledMessagesKept(ZaloEnv.appContext());
        String account = ZaloEnv.currentAccount();
        boolean incoming = account != null && !account.isEmpty()
            && senderId != null && !senderId.isEmpty() && !account.equals(senderId);
        boolean keep = enabled && incoming;
        android.util.Log.i("NezumiRecall", "event=" + eventType + " enabled=" + enabled
            + " incoming=" + incoming + " kept=" + keep);
        return keep;
    }

    private static String recallDigest(String value) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(value.getBytes(StandardCharsets.UTF_8));
            return Base64.encodeToString(digest, Base64.NO_WRAP | Base64.URL_SAFE);
        } catch (NoSuchAlgorithmException failure) {
            throw new IllegalStateException(failure);
        }
    }

    private static Set<String> recallKeys(Object messageId) {
        Set<String> keys = new HashSet<>();
        if (messageId == null) return keys;
        try {
            String clientId = (String) messageId.getClass().getField("a").get(messageId);
            String globalId = (String) messageId.getClass().getField("b").get(messageId);
            String ownerId = (String) messageId.getClass().getField("c").get(messageId);
            if (ownerId == null || ownerId.isEmpty()) return keys;
            if (clientId != null && !clientId.isEmpty() && !"0".equals(clientId)) {
                keys.add(recallDigest(new org.json.JSONArray().put(ownerId).put("client").put(clientId).toString()));
            }
            if (globalId != null && !globalId.isEmpty() && !"0".equals(globalId)) {
                keys.add(recallDigest(new org.json.JSONArray().put(ownerId).put("global").put(globalId).toString()));
            }
            return keys;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return keys;
        }
    }

    private static String loadRecallAccount(Context context) {
        String account = ZaloEnv.currentAccount();
        if (account == null || account.isEmpty()) return null;
        String key = "recalled_ids_" + recallDigest(account);
        if (!key.equals(recallAccount)) {
            recalledMessages = new HashSet<>(NezumiPrefs.of(context)
                .getStringSet(key, java.util.Collections.emptySet()));
            recallAccount = key;
        }
        return key;
    }

    public static void markIncomingRecall(Object messageId) {
        Context context = ZaloEnv.appContext();
        Set<String> keys = recallKeys(messageId);
        if (context == null || keys.isEmpty()) return;
        ArrayList<View> rows;
        synchronized (RECALL_LOCK) {
            String accountKey = loadRecallAccount(context);
            if (accountKey == null || !recalledMessages.addAll(keys)) return;
            NezumiPrefs.of(context).edit()
                .putStringSet(accountKey, new HashSet<>(recalledMessages)).apply();
            rows = new ArrayList<>(RECALL_ROWS.keySet());
        }
        for (View row : rows) {
            row.post(() -> refreshRecallRow(row));
        }
        android.util.Log.i("NezumiRecall", "target marked");
    }

    public static boolean isIncomingRecall(Object message) {
        Context context = ZaloEnv.appContext();
        if (context == null || message == null) {
            android.util.Log.i("NezumiRecall", "lookup miss no-context-or-message");
            return false;
        }
        try {
            Set<String> keys = recallKeys(message.getClass().getField("b").get(message));
            synchronized (RECALL_LOCK) {
                boolean hit = !keys.isEmpty() && loadRecallAccount(context) != null
                    && keys.stream().anyMatch(recalledMessages::contains);
                android.util.Log.i("NezumiRecall", "lookup " + (hit ? "hit" : "miss"));
                return hit;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            android.util.Log.i("NezumiRecall", "lookup miss reflection");
            return false;
        }
    }

    public static boolean hasRecallLabel(Object row) {
        try {
            return row != null && isIncomingRecall(row.getClass().getMethod("getMessage").invoke(row));
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    public static String formatRecallTime(View row, String original) {
        if (!hasRecallLabel(row)) {
            android.util.Log.i("NezumiRecall", "footer miss");
            return original;
        }
        android.util.Log.i("NezumiRecall", "footer hit");
        String label = recalledLabel(row.getContext());
        return original == null || original.isEmpty() ? label : original + " - " + label;
    }

    public static void trackRecallRow(View row) {
        if (row == null) return;
        synchronized (RECALL_LOCK) {
            RECALL_ROWS.put(row, Boolean.TRUE);
        }
        android.util.Log.i("NezumiRecall", "row tracked");
    }

    private static void refreshRecallRow(View row) {
        if (!row.isAttachedToWindow() || !hasRecallLabel(row)) return;
        try {
            Class<?> base = Class.forName("com.zing.zalo.ui.chat.chatrow.ChatRow");
            Object message = base.getMethod("getMessage").invoke(row);
            Object binding = base.getField("j").get(row);
            if (message == null || binding == null) return;
            java.lang.reflect.Method bind = null;
            for (java.lang.reflect.Method candidate : base.getMethods()) {
                Class<?>[] types = candidate.getParameterTypes();
                if (candidate.getName().equals("p2") && types.length == 2
                    && types[0].isInstance(message) && types[1].isInstance(binding)) {
                    bind = candidate;
                    break;
                }
            }
            if (bind == null) throw new NoSuchMethodException("p2");
            bind.invoke(row, message, binding);
            // p2 rebinds and requests layout on its own.
            row.requestLayout();
            row.invalidate();
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            android.util.Log.w("NezumiRecall", "row refresh unavailable");
        }
    }

    public static String recalledLabel(Context context) {
        return ZaloEnv.isVietnamese(context) ? "Đã thu hồi" : "Recalled";
    }

    public static boolean isRecalledMessagesKept(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.KEEP_RECALLED_MESSAGES, false);
    }
}
