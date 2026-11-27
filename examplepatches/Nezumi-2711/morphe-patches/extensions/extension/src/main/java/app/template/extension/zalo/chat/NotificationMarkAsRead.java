package app.template.extension.zalo.chat;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.service.notification.StatusBarNotification;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.shared.ZaloEnv;

/**
 * "Mark as read" / "Mark all as read" actions on Zalo conversation notifications.
 *
 * <p>{@link #decorate} runs at the start of Zalo's notification poster (every app notification
 * passes through it) and appends the actions to eligible notifications. Taps are delivered as
 * explicit broadcasts to Zalo's own {@code ZaloReceiver}, whose handler calls {@link #handle} first.
 * Marking reuses Zalo's MarkAsReadConversation use case, which clears local unread, dismisses the
 * conversation's notifications and queues Zalo's own seen ACK (gated by the Hide read receipts hook).
 */
public final class NotificationMarkAsRead {
    private static final String TAG = "NotificationMarkAsRead";

    static final String ACTION_MARK_READ = "app.nezumi.action.MARK_AS_READ";
    static final String ACTION_MARK_ALL_READ = "app.nezumi.action.MARK_ALL_AS_READ";

    private static final String RECEIVER = "com.zing.zalo.receiver.ZaloReceiver";
    private static final String KEY_TYPE = "EXTRA_KEY_TYPE";
    private static final String KEY_SUB_TYPE = "EXTRA_KEY_SUB_TYPE";

    private static final String EXTRA_CONV_ID = "nezumi_conv_id";
    private static final String EXTRA_TYPE = "nezumi_noti_type";
    private static final String EXTRA_SUB_TYPE = "nezumi_noti_sub_type";
    private static final String EXTRA_NOTIFICATION_ID = "nezumi_noti_id";
    private static final String EXTRA_ACCOUNT = "nezumi_account";
    /** Marker put into our Notification.Action extras so a re-posted Notification is not decorated twice. */
    private static final String ACTION_MARKER = "nezumi_mark_read_action";

    /** Zalo uses the notification id as request code; XOR keeps ours distinct and still unique per id. */
    private static final int REQUEST_CODE_SALT = 0x4E5A4D52;
    private static final int REQUEST_CODE_MARK_ALL = 0x4E5A4D41;

    /** Types whose EXTRA_KEY_SUB_TYPE is the conversation id (uid or group_xxx). */
    private static final Set<String> CONVERSATION_TYPES = new HashSet<>(Arrays.asList(
        "chat_1_1", "chat_group", "hidden", "chat_reaction", "group_reaction", "message_error",
        "miss_call_zalo", "miss_call_stranger_zalo"));
    /**
     * Group event types Zalo still maps to channels (kbu). No 26.11.01 code path posts them, so the
     * sub-type is only trusted when it is evidently a group conversation id.
     */
    private static final Set<String> GROUP_EVENT_TYPES = new HashSet<>(Arrays.asList(
        "change_background", "change_group_info", "create_poll", "add_member", "set_admin"));

    /** Colour of Zalo's own notification action icons (icn_notification_action_*.png). */
    private static final int ZALO_ACTION_ICON_COLOR = 0xFF979797;
    private static final int ICON_SIZE_DP = 24;
    /** Outer bubble of Zalo's zds_ic_chat_solid_24 (24x24 viewport). */
    private static final String BUBBLE_SOLID_PATH = "M3.125,21.031L3.126,21.031L3.141,21.018"
        + "C3.155,21.007 3.176,20.988 3.204,20.963C3.26,20.913 3.341,20.837 3.435,20.74"
        + "C3.625,20.543 3.857,20.269 4.044,19.948C4.415,19.312 4.567,18.596 4.025,17.867"
        + "C2.757,16.278 1.9,14.252 1.9,12C1.9,6.635 6.503,2.4 12,2.4C17.497,2.4 22.1,6.635 22.1,12"
        + "C22.1,17.365 17.497,21.6 12,21.6C11.054,21.6 10.207,21.495 9.359,21.283"
        + "C8.742,21.139 8.402,21.247 7.703,21.471L7.544,21.522C6.712,21.786 5.574,22.1 3.5,22.1"
        + "C3.245,22.1 3.018,21.939 2.934,21.699C2.85,21.459 2.926,21.192 3.124,21.032"
        + "L3.124,21.032L3.125,21.032L3.125,21.032L3.125,21.031Z";
    /** Check mark of Zalo's zds_ic_read_message_line_24 (24x24 viewport). */
    private static final String CHECK_PATH = "M16.892,9.393C17.126,9.158 17.126,8.778 16.892,8.544"
        + "C16.657,8.31 16.277,8.31 16.043,8.544L10.467,14.12L7.892,11.544"
        + "C7.657,11.31 7.277,11.31 7.043,11.544C6.809,11.778 6.809,12.158 7.043,12.393"
        + "L10.043,15.393C10.277,15.627 10.657,15.627 10.892,15.393L16.892,9.393Z";
    private static final Pattern PATH_TOKEN = Pattern.compile("[MLHVCZ]|-?\\d*\\.?\\d+");
    private static volatile Icon actionIcon;
    private static volatile boolean iconFailed;

    private NotificationMarkAsRead() { }

    /** Called at the start of Zalo's notification poster with the final id and built Notification. */
    public static void decorate(int id, Notification notification) {
        try {
            if (notification == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.N) return;
            Bundle extras = notification.extras;
            String convId = conversationId(extras);
            if (convId == null) return;
            Context context = ZaloEnv.appContext(Patch.MARK_AS_READ_FROM_NOTIFICATIONS);
            if (context == null) return;

            String type = extras.getString(KEY_TYPE);
            String subType = extras.getString(KEY_SUB_TYPE);
            String account = ZaloEnv.currentAccount(Patch.MARK_AS_READ_FROM_NOTIFICATIONS);
            boolean vietnamese = ZaloEnv.isVietnamese(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, context);

            Intent one = receiverIntent(context, ACTION_MARK_READ, account)
                .putExtra(EXTRA_CONV_ID, convId)
                .putExtra(EXTRA_TYPE, type)
                .putExtra(EXTRA_SUB_TYPE, subType)
                .putExtra(EXTRA_NOTIFICATION_ID, id);
            Notification.Action markRead = action(context,
                vietnamese ? "Đánh dấu đã đọc" : "Mark as read",
                PendingIntent.getBroadcast(context, id ^ REQUEST_CODE_SALT, one, flags()), true);

            Notification.Action markAll = null;
            if (activeConversationCount(context, id, convId) >= 2) {
                Intent all = receiverIntent(context, ACTION_MARK_ALL_READ, account);
                markAll = action(context,
                    vietnamese ? "Đánh dấu tất cả đã đọc" : "Mark all as read",
                    PendingIntent.getBroadcast(context, REQUEST_CODE_MARK_ALL, all, flags()), false);
            }

            // Keep Zalo's inline reply first, then ours, then the remaining Zalo actions, so the
            // system's three-visible-actions limit drops a like/mute shortcut rather than ours.
            List<Notification.Action> replies = new ArrayList<>();
            List<Notification.Action> others = new ArrayList<>();
            if (notification.actions != null) {
                for (Notification.Action existing : notification.actions) {
                    if (existing == null || isOurs(existing)) continue;
                    boolean reply = existing.getRemoteInputs() != null && existing.getRemoteInputs().length > 0;
                    (reply ? replies : others).add(existing);
                }
            }
            List<Notification.Action> result = new ArrayList<>(replies);
            result.add(markRead);
            if (markAll != null) result.add(markAll);
            result.addAll(others);
            notification.actions = result.toArray(new Notification.Action[0]);
        } catch (Throwable failure) {
            NezumiLog.w(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "Unable to add mark as read action", failure);
        }
    }

    /**
     * Called at the start of ZaloReceiver's handler (already on its HandlerThread after app init).
     * Returns true only for our own actions, in which case Zalo's handler is skipped.
     */
    public static boolean handle(Context context, Intent intent) {
        final String action;
        try {
            action = intent == null ? null : intent.getAction();
            if (!ACTION_MARK_READ.equals(action) && !ACTION_MARK_ALL_READ.equals(action)) return false;
        } catch (Throwable failure) {
            NezumiLog.w(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "Unable to inspect receiver intent", failure);
            return false;
        }
        try {
            Context app = context != null && context.getApplicationContext() != null
                ? context.getApplicationContext() : ZaloEnv.appContext(Patch.MARK_AS_READ_FROM_NOTIFICATIONS);
            if (app == null) return true;
            Runnable work = () -> process(app, intent, ACTION_MARK_ALL_READ.equals(action));
            if (Looper.myLooper() == Looper.getMainLooper()) {
                new Thread(work, "nezumi-noti-mark-read").start();
            } else {
                work.run();
            }
        } catch (Throwable failure) {
            NezumiLog.w(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "Mark as read from notification failed", failure);
        }
        return true;
    }

    private static void process(Context context, Intent intent, boolean all) {
        try {
            LinkedHashSet<String> convIds = new LinkedHashSet<>();
            // Notification (tag, id) pairs to dismiss; key is "tag|id" to de-duplicate.
            Map<String, Object[]> dismiss = new LinkedHashMap<>();

            if (all) {
                for (StatusBarNotification sbn : activeNotifications(context)) {
                    String convId = conversationId(sbn.getNotification() == null ? null : sbn.getNotification().extras);
                    if (convId == null) continue;
                    convIds.add(convId);
                    dismiss.put(sbn.getTag() + "|" + sbn.getId(), new Object[] { sbn.getTag(), sbn.getId() });
                }
            } else {
                String convId = intent.getStringExtra(EXTRA_CONV_ID);
                if (!TextUtils.isEmpty(convId)) convIds.add(convId);
                int id = intent.getIntExtra(EXTRA_NOTIFICATION_ID, 0);
                if (id != 0) dismiss.put("null|" + id, new Object[] { null, id });
                String type = intent.getStringExtra(EXTRA_TYPE);
                String subType = intent.getStringExtra(EXTRA_SUB_TYPE);
                if (type != null) {
                    int hashed = Objects.hash(type, subType);
                    dismiss.put("null|" + hashed, new Object[] { null, hashed });
                }
            }

            String tappedAccount = intent.getStringExtra(EXTRA_ACCOUNT);
            String account = ZaloEnv.currentAccount(Patch.MARK_AS_READ_FROM_NOTIFICATIONS);
            boolean sameAccount = tappedAccount == null || account == null || tappedAccount.equals(account);
            if (!sameAccount) {
                NezumiLog.i(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "Account changed since the notification was posted; dismiss only");
            } else if (!convIds.isEmpty()) {
                try {
                    markRead(new ArrayList<>(convIds));
                } catch (Throwable failure) {
                    NezumiLog.w(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "Unable to mark conversations read", failure);
                }
            }
            NezumiLog.i(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, (all ? "Mark all" : "Mark one") + ": conversations=" + convIds.size()
                + ", notifications=" + dismiss.size());

            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (manager == null) return;
            for (Object[] entry : dismiss.values()) {
                try {
                    manager.cancel((String) entry[0], (Integer) entry[1]);
                } catch (Throwable failure) {
                    NezumiLog.swallowedOnce(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "notification cancel failed", failure);
                }
            }
        } catch (Throwable failure) {
            NezumiLog.w(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "Mark as read from notification failed", failure);
        }
    }

    /** MarkAsReadConversation: cfj.A0().L(new hcf(ids)), called once for all ids. */
    private static void markRead(ArrayList<String> ids) throws Exception {
        Object useCase = Class.forName("cfj").getMethod("A0").invoke(null);
        Object request = Class.forName("hcf").getConstructor(List.class).newInstance(ids);
        useCase.getClass().getMethod("L", Object.class).invoke(useCase, request);
    }

    /** Conversation id for an eligible notification, or null. */
    private static String conversationId(Bundle extras) {
        if (extras == null) return null;
        String type = extras.getString(KEY_TYPE);
        String subType = extras.getString(KEY_SUB_TYPE);
        if (type == null || TextUtils.isEmpty(subType)) return null;
        if (CONVERSATION_TYPES.contains(type)) return subType;
        if (GROUP_EVENT_TYPES.contains(type) && subType.startsWith("group_")) return subType;
        return null;
    }

    /** Distinct eligible conversations currently shown, counting the notification being posted. */
    private static int activeConversationCount(Context context, int postingId, String postingConvId) {
        Set<String> convIds = new HashSet<>();
        convIds.add(postingConvId);
        for (StatusBarNotification sbn : activeNotifications(context)) {
            if (sbn.getId() == postingId && sbn.getTag() == null) continue; // replaced by this post
            String convId = conversationId(sbn.getNotification() == null ? null : sbn.getNotification().extras);
            if (convId != null) convIds.add(convId);
        }
        return convIds.size();
    }

    private static StatusBarNotification[] activeNotifications(Context context) {
        try {
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            StatusBarNotification[] active = manager == null ? null : manager.getActiveNotifications();
            if (active != null) return active;
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "active notifications unavailable", failure);
        }
        return new StatusBarNotification[0];
    }

    private static Intent receiverIntent(Context context, String action, String account) {
        Intent intent = new Intent(action).setComponent(new ComponentName(context.getPackageName(), RECEIVER));
        if (account != null) intent.putExtra(EXTRA_ACCOUNT, account);
        return intent;
    }

    private static int flags() {
        return PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE;
    }

    private static Notification.Action action(Context context, String label, PendingIntent intent, boolean markRead) {
        Icon icon = icon(context);
        Notification.Action.Builder builder = new Notification.Action.Builder(icon, label, intent);
        Bundle extras = new Bundle();
        extras.putBoolean(ACTION_MARKER, true);
        builder.addExtras(extras);
        if (markRead && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            builder.setSemanticAction(Notification.Action.SEMANTIC_ACTION_MARK_AS_READ);
        }
        return builder.build();
    }

    private static boolean isOurs(Notification.Action action) {
        Bundle extras = action.getExtras();
        return extras != null && extras.getBoolean(ACTION_MARKER, false);
    }

    /**
     * Zalo's own action icons (icn_notification_action_*) are filled, flat #979797 PNGs, and many OEM
     * shades (HyperOS, ColorOS…) do not tint action icons. Zalo ships no filled "read message" icon, so
     * draw one: the filled bubble of zds_ic_chat_solid_24 with the check of zds_ic_read_message_line_24
     * cut out (even-odd), rendered into a bitmap in Zalo's action colour.
     */
    private static Icon icon(Context context) {
        Icon cached = actionIcon;
        if (cached != null || iconFailed) return cached;
        try {
            int size = Math.round(ICON_SIZE_DP * context.getResources().getDisplayMetrics().density);
            Path path = parsePath(BUBBLE_SOLID_PATH);
            Path check = parsePath(CHECK_PATH);
            check.offset(0f, 0.5f); // centre the check in the solid bubble (its centre is y=12, not 11.5)
            path.addPath(check);
            path.setFillType(Path.FillType.EVEN_ODD);
            Matrix scale = new Matrix();
            scale.setScale(size / 24f, size / 24f);
            path.transform(scale);
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            paint.setColor(ZALO_ACTION_ICON_COLOR);
            paint.setStyle(Paint.Style.FILL);
            Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            new Canvas(bitmap).drawPath(path, paint);
            cached = Icon.createWithBitmap(bitmap);
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.MARK_AS_READ_FROM_NOTIFICATIONS, TAG, "mark as read icon unavailable", failure);
        }
        if (cached == null) iconFailed = true;
        actionIcon = cached;
        return cached;
    }

    /** Minimal parser for absolute M/L/H/V/C/Z path data (all the icon paths above use). */
    private static Path parsePath(String data) {
        Path path = new Path();
        Matcher m = PATH_TOKEN.matcher(data);
        List<String> tokens = new ArrayList<>();
        while (m.find()) tokens.add(m.group());
        char cmd = 'M';
        float x = 0f, y = 0f;
        int i = 0;
        while (i < tokens.size()) {
            String token = tokens.get(i);
            if (token.length() == 1 && Character.isLetter(token.charAt(0))) {
                cmd = token.charAt(0);
                i++;
                if (cmd == 'Z') {
                    path.close();
                    continue;
                }
            }
            switch (cmd) {
                case 'M':
                    x = Float.parseFloat(tokens.get(i++));
                    y = Float.parseFloat(tokens.get(i++));
                    path.moveTo(x, y);
                    cmd = 'L';
                    break;
                case 'L':
                    x = Float.parseFloat(tokens.get(i++));
                    y = Float.parseFloat(tokens.get(i++));
                    path.lineTo(x, y);
                    break;
                case 'H':
                    x = Float.parseFloat(tokens.get(i++));
                    path.lineTo(x, y);
                    break;
                case 'V':
                    y = Float.parseFloat(tokens.get(i++));
                    path.lineTo(x, y);
                    break;
                case 'C':
                    float x1 = Float.parseFloat(tokens.get(i++)), y1 = Float.parseFloat(tokens.get(i++));
                    float x2 = Float.parseFloat(tokens.get(i++)), y2 = Float.parseFloat(tokens.get(i++));
                    x = Float.parseFloat(tokens.get(i++));
                    y = Float.parseFloat(tokens.get(i++));
                    path.cubicTo(x1, y1, x2, y2, x, y);
                    break;
                default:
                    throw new IllegalArgumentException("Unsupported path command " + cmd);
            }
        }
        return path;
    }
}
