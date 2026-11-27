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

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
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
        Context context = ZaloEnv.appContext(Patch.KEEP_RECALLED_MESSAGES);
        boolean enabled = isRecalledMessagesKept(context);
        String account = ZaloEnv.currentAccount(Patch.KEEP_RECALLED_MESSAGES);
        boolean incoming = account != null && !account.isEmpty()
            && senderId != null && !senderId.isEmpty() && !account.equals(senderId);
        boolean keep = enabled && incoming;
        String reason = keep ? "keep"
            : context == null ? "no-app-context"
            : !enabled ? "setting-off"
            : account == null || account.isEmpty() ? "no-current-account"
            : senderId == null || senderId.isEmpty() ? "no-sender"
            : "own-message";
        NezumiLog.i(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "event=" + eventName(eventType) + " enabled=" + enabled
            + " incoming=" + incoming + " kept=" + keep + " reason=" + reason);
        return keep;
    }

    private static String eventName(int eventType) {
        return eventType == 0 ? "undo" : eventType == 1 ? "delete-control" : String.valueOf(eventType);
    }

    /**
     * Hooked at the start of the delete-control batch handler ({@code SpecialMessageProcessor.b}).
     * With {@code deferred=true} (socket packets of some batch commands), the app queues the deletes
     * in its pending map instead of calling the per-target handler the keep patch hooks, so those
     * deletes are NOT kept. Log only; behaviour is unchanged.
     */
    public static void traceDeleteBatch(Object message, boolean deferred) {
        try {
            if (message == null) return;
            String sender = null;
            int targets = -1;
            try {
                sender = (String) message.getClass().getField("c").get(message);
                Object payload = message.getClass().getField("I1").get(message);
                if (payload != null) {
                    Object list = payload.getClass().getField("e").get(payload);
                    if (list instanceof java.util.Collection) targets = ((java.util.Collection<?>) list).size();
                }
            } catch (ReflectiveOperationException | RuntimeException failure) {
                NezumiLog.swallowedOnce(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "delete batch fields unavailable", failure);
            }
            String account = ZaloEnv.currentAccount(Patch.KEEP_RECALLED_MESSAGES);
            boolean incoming = account != null && !account.isEmpty()
                && sender != null && !sender.isEmpty() && !account.equals(sender);
            String line = "delete-control batch deferred=" + deferred + " incoming=" + incoming + " targets=" + targets;
            if (deferred && incoming && isRecalledMessagesKept(ZaloEnv.appContext(Patch.KEEP_RECALLED_MESSAGES))) {
                NezumiLog.w(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", line + " -> queued by app, bypasses keep");
            } else {
                NezumiLog.i(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", line);
            }
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "delete batch trace failed", failure);
        }
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
        } catch (ReflectiveOperationException | RuntimeException failure) {
            NezumiLog.swallowedOnce(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "recall keys unavailable", failure);
            return keys;
        }
    }

    private static String loadRecallAccount(Context context) {
        String account = ZaloEnv.currentAccount(Patch.KEEP_RECALLED_MESSAGES);
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
        Context context = ZaloEnv.appContext(Patch.KEEP_RECALLED_MESSAGES);
        if (messageId == null) {
            NezumiLog.w(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "mark skipped: no target id");
            return;
        }
        Set<String> keys = recallKeys(messageId);
        if (context == null || keys.isEmpty()) {
            NezumiLog.w(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "mark skipped: " + (context == null ? "no app context" : "no usable target keys"));
            return;
        }
        ArrayList<View> rows;
        int stored;
        synchronized (RECALL_LOCK) {
            String accountKey = loadRecallAccount(context);
            if (accountKey == null) {
                NezumiLog.w(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "mark skipped: no current account");
                return;
            }
            if (!recalledMessages.addAll(keys)) {
                NezumiLog.i(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "target already marked");
                return;
            }
            NezumiPrefs.of(context).edit()
                .putStringSet(accountKey, new HashSet<>(recalledMessages)).apply();
            rows = new ArrayList<>(RECALL_ROWS.keySet());
            stored = recalledMessages.size();
        }
        for (View row : rows) {
            row.post(() -> refreshRecallRow(row));
        }
        NezumiLog.i(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "target marked keys=" + keys.size() + " stored=" + stored
            + " visibleRows=" + rows.size());
    }

    public static boolean isIncomingRecall(Object message) {
        Context context = ZaloEnv.appContext(Patch.KEEP_RECALLED_MESSAGES);
        if (context == null || message == null) {
            NezumiLog.d(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "lookup miss no-context-or-message");
            return false;
        }
        try {
            Set<String> keys = recallKeys(message.getClass().getField("b").get(message));
            synchronized (RECALL_LOCK) {
                boolean hit = !keys.isEmpty() && loadRecallAccount(context) != null
                    && keys.stream().anyMatch(recalledMessages::contains);
                NezumiLog.d(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "lookup " + (hit ? "hit" : "miss"));
                return hit;
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            NezumiLog.swallowedOnce(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "recall lookup reflection failed", failure);
            return false;
        }
    }

    public static boolean hasRecallLabel(Object row) {
        try {
            return row != null && isIncomingRecall(row.getClass().getMethod("getMessage").invoke(row));
        } catch (ReflectiveOperationException | RuntimeException failure) {
            NezumiLog.swallowedOnce(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "recall label check failed", failure);
            return false;
        }
    }

    public static String formatRecallTime(View row, String original) {
        if (!hasRecallLabel(row)) {
            NezumiLog.d(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "footer miss");
            return original;
        }
        NezumiLog.i(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "footer hit");
        String label = recalledLabel(row.getContext());
        return original == null || original.isEmpty() ? label : original + " - " + label;
    }

    public static void trackRecallRow(View row) {
        if (row == null) return;
        synchronized (RECALL_LOCK) {
            RECALL_ROWS.put(row, Boolean.TRUE);
        }
        NezumiLog.d(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "row tracked");
    }

    private static void refreshRecallRow(View row) {
        if (!row.isAttachedToWindow() || !hasRecallLabel(row)) return;
        NezumiLog.i(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "row refresh");
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
        } catch (ReflectiveOperationException | RuntimeException failure) {
            NezumiLog.w(Patch.KEEP_RECALLED_MESSAGES, "RecalledMessages", "row refresh unavailable", failure);
        }
    }

    public static String recalledLabel(Context context) {
        return ZaloEnv.isVietnamese(Patch.KEEP_RECALLED_MESSAGES, context) ? "Đã thu hồi" : "Recalled";
    }

    public static boolean isRecalledMessagesKept(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.KEEP_RECALLED_MESSAGES, false);
    }
}
