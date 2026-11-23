package app.linenotifications.extension;

import android.app.AlertDialog;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import android.util.Base64;
import java.util.ArrayList;
import java.util.List;
import app.linenotifications.extension.core.NotificationPolicy;

/** Runtime switches are opt-in and persist only on this device. */
public final class Settings {
    private static volatile Context application;
    private static final ThreadLocal<java.lang.ref.WeakReference<Object>> menuFragment = new ThreadLocal<>();
    private static final String PREFS = "line_notification_patches_v1";
    public static final String SILENT = "not_too_much_silent";
    public static final String INFO = "more_chat_info";
    public static final String NO_REPLY = "no_reply";
    public static final String READ = "mark_as_read";
    private Settings() {}

    public static void init(Context context) {
        Context app = context.getApplicationContext();
        application = app == null ? context : app;
    }
    static Context context() {
        Context c = application;
        if (c == null) throw new IllegalStateException("Extension not initialized");
        return c;
    }
    static SharedPreferences prefs() { return context().getSharedPreferences(PREFS, Context.MODE_PRIVATE); }
    public static boolean rowIncluded() { return false; }
    public static boolean silentIncluded() { return false; }
    public static boolean infoIncluded() { return false; }
    public static boolean noReplyIncluded() { return false; }
    public static boolean readIncluded() { return false; }
    static boolean enabled(String key) {
        if (application == null) return false;
        boolean included = SILENT.equals(key) ? silentIncluded() : INFO.equals(key) ? infoIncluded()
                : NO_REPLY.equals(key) ? noReplyIncluded() : READ.equals(key) && readIncluded();
        return included && prefs().getBoolean(key, false);
    }
    static NotificationPolicy.Settings values() {
        return new NotificationPolicy.Settings(enabled(SILENT), enabled(INFO), enabled(NO_REPLY), enabled(READ));
    }
    static String encoded(String id) {
        return Base64.encodeToString(id.getBytes(StandardCharsets.UTF_8), Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
    }
    static String mutePrefix(String account) { return "mute:" + encoded(account) + ":"; }
    static String quietKey(String account, String chat) { return "quiet:" + encoded(account) + ":" + encoded(chat); }
    static boolean quiet(String account, String chat) { return prefs().getBoolean(quietKey(account, chat), false); }
    static boolean fullyMuted(String account, String chat) {
        return prefs().contains(mutePrefix(account) + encoded(chat));
    }
    /** Presentation only: the native push subscription stays enabled for quiet rooms. */
    public static boolean menuNotifiable(String chat, boolean nativeValue) {
        if (!enabled(SILENT) || !NativeLine.regularChat(chat)) return nativeValue;
        try {
            String account = NativeLine.account();
            return nativeValue && !quiet(account, chat) && !fullyMuted(account, chat);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return nativeValue; }
    }
    public static boolean interceptToggle(Object fragment, Object callback) {
        return ChatNotifications.interceptToggle(fragment, callback);
    }
    public static boolean interceptChatListToggle(String chat) {
        return ChatNotifications.interceptChatListToggle(chat);
    }
    public static boolean interceptNotificationMute(Context context, Intent intent) {
        if (!enabled(SILENT) || intent == null || !"jp.naver.line.android.access.remote.action.MUTE_CURRENT_CHAT_ACTION".equals(intent.getAction())) return false;
        String chat = intent.getStringExtra("chatId");
        if (!NativeLine.regularChat(chat)) return false;
        ChatNotifications.change(context, chat, ChatNotifications.QUIET, null, () -> {
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            for (StatusBarNotification n : manager.getActiveNotifications()) {
                android.os.Bundle extras = n.getNotification().extras;
                if (extras != null && chat.equals(extras.getString("line.chat.id"))) manager.cancel(n.getTag(), n.getId());
            }
            Notifications.clearSummaries(manager);
        });
        return true;
    }
    /** The original private service handles every action not owned by these patches. */
    public static boolean interceptNotificationAction(Context context, Intent intent) {
        if (ReadActions.handle(context, intent)) return true;
        return interceptNotificationMute(context, intent);
    }
    static void setMuted(String account, String chat, String name, boolean mute) {
        SharedPreferences.Editor editor = prefs().edit();
        String key = mutePrefix(account) + encoded(chat);
        if (mute) editor.putString(key, name == null || name.isEmpty()
                ? Strings.get("line_notify_fallback_chat", "Chat") : name);
        else editor.remove(key);
        editor.apply();
        if (mute) {
            NotificationManager manager = context().getSystemService(NotificationManager.class);
            for (StatusBarNotification n : manager.getActiveNotifications()) {
                android.os.Bundle extras = n.getNotification().extras;
                if (extras != null && chat.equals(extras.getString("line.chat.id"))) manager.cancel(n.getTag(), n.getId());
            }
            Notifications.clearSummaries(manager);
        }
    }

    private static void pruneHiddenNotifications() {
        try {
            String account = NativeLine.account();
            NotificationManager manager = context().getSystemService(NotificationManager.class);
            for (StatusBarNotification n : manager.getActiveNotifications()) {
                android.os.Bundle extras = n.getNotification().extras;
                String chat = extras == null ? null : extras.getString("line.chat.id");
                if (NativeLine.regularChat(chat) && fullyMuted(account, chat)) manager.cancel(n.getTag(), n.getId());
            }
            Notifications.clearSummaries(manager);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }
    public static int titleId() { return context().getResources().getIdentifier("line_notify_settings", "string", context().getPackageName()); }
    public static Integer iconId() { return context().getResources().getIdentifier("line_notify_ic_settings", "drawable", context().getPackageName()); }
    public static List<Object> insertRow(List<?> rows, int index, Object row) {
        ArrayList<Object> copy = new ArrayList<>(rows);
        copy.add(Math.min(index + 1, copy.size()), row);
        return copy;
    }

    static void setEnabled(String key, boolean checked) {
        prefs().edit().putBoolean(key, checked).apply();
        if (SILENT.equals(key)) {
            if (checked) pruneHiddenNotifications();
            ChatNotifications.refreshChatList();
        }
        if (READ.equals(key)) Notifications.refreshReadActions();
    }

    public static void show(Context context) {
        try { new SettingsPage(context).show(); }
        catch (ReflectiveOperationException | RuntimeException ignored) {
            new AlertDialog.Builder(context)
                    .setTitle(Strings.get(context, "line_notify_settings", "Notification patch settings"))
                    .setMessage(Strings.get(context, "line_notify_settings_open_failed",
                            "Unable to open patch settings. Please make sure you are using a supported LINE version."))
                    .setPositiveButton(Strings.get(context, "line_notify_btn_close", "Close"), null).show();
        }
    }

    /** Invoked before the native chat menu adapter is constructed. */
    public static void captureChatMenu(Object fragment) { menuFragment.set(new java.lang.ref.WeakReference<>(fragment)); }
    public static void addChatMenu(java.util.Collection<?> rows) {
        java.lang.ref.WeakReference<Object> ref = menuFragment.get();
        menuFragment.remove();
        if (ref != null && ref.get() != null) addChatMenu(rows, ref.get());
    }

    /** Appends a native menu row, preserving every existing item. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void addChatMenu(java.util.Collection rows, Object fragment) {
        if (!silentIncluded()) return;
        try {
            Context context = (Context) fragment.getClass().getMethod("getContext").invoke(fragment);
            Object data = NativeLine.field(fragment, "e");
            String chat = (String) NativeLine.field(data, "a");
            if (!NativeLine.regularChat(chat)) return;
            String account = NativeLine.account();
            Class<?> callback = NativeLine.type("nt8.l");
            Object click = Proxy.newProxyInstance(context.getClassLoader(), new Class[]{callback}, (proxy, method, args) -> {
                if (method.getName().equals("invoke")) {
                    if (!account.equals(NativeLine.account())) return null;
                    boolean hidden = fullyMuted(account, chat);
                    new AlertDialog.Builder(context)
                            .setTitle(Strings.get(context, "line_notify_hide_chat", "Hide notifications completely"))
                            .setMessage(hidden
                                    ? Strings.get(context, "line_notify_unhide_confirm_msg", "Stop hiding notifications for this chat?")
                                    : Strings.get(context, "line_notify_hide_confirm_msg",
                                            "This chat will not show even silent notifications. It will behave like LINE’s original mute setting."))
                            .setPositiveButton(hidden
                                    ? Strings.get(context, "line_notify_btn_unhide", "Unhide")
                                    : Strings.get(context, "line_notify_btn_hide", "Hide"), (d, w) -> {
                                try { if (account.equals(NativeLine.account())) ChatNotifications.change(context, chat,
                                        hidden ? (quiet(account, chat) ? ChatNotifications.QUIET : ChatNotifications.NORMAL) : ChatNotifications.HIDDEN,
                                        null, null); }
                                catch (ReflectiveOperationException ignored) { }
                            }).setNegativeButton(Strings.get(context, "line_notify_btn_cancel", "Cancel"), null).show();
                    return NativeLine.type("vs8.i0").getField("a").get(null);
                }
                if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (method.getName().equals("equals")) return proxy == args[0];
                return "NotificationMenuClick";
            });
            int layout = context.getResources().getIdentifier("chathistory_menu_text_with_icon_item", "layout", context.getPackageName());
            int title = context.getResources().getIdentifier("line_notify_hide_chat", "string", context.getPackageName());
            if (layout == 0 || title == 0) return;
            Object row = NativeLine.type("d60.z").getConstructor(int.class, int.class, int.class, boolean.class, boolean.class, callback)
                    .newInstance(layout, android.R.drawable.ic_lock_silent_mode, title, true, true, click);
            rows.add(row);
        } catch (ReflectiveOperationException | RuntimeException ignored) { /* Keep the native menu usable. */ }
    }
}
