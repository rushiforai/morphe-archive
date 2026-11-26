package app.linenotifications.extension;

import android.app.AlertDialog;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import android.util.Base64;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import app.linenotifications.extension.core.NotificationPolicy;

/** Runtime switches are opt-in and persist only on this device. */
public final class Settings {
    private static volatile Context application;
    private static final ThreadLocal<java.lang.ref.WeakReference<Object>> menuFragment = new ThreadLocal<>();
    private static final Set<String> RECONCILING_ACCOUNTS = java.util.concurrent.ConcurrentHashMap.newKeySet();
    private static final Set<String> RECONCILED_ACCOUNTS = java.util.concurrent.ConcurrentHashMap.newKeySet();
    private static final String PREFS = "line_notification_patches_v1";
    public static final String SILENT = "not_too_much_silent";
    public static final String MENTION_BYPASS = "silent_mention_bypass";
    public static final String KEYWORD_BYPASS = "silent_keyword_bypass";
    public static final String KEYWORDS = "silent_keywords";
    public static final String INFO = "more_chat_info";
    public static final String INFO_MAX_MESSAGES = "more_chat_info_max_messages";
    public static final String INFO_MEDIA_PREVIEW = "more_chat_info_media_preview";
    public static final String NO_REPLY = "no_reply";
    public static final String READ = "mark_as_read";
    public static final String ACTION_LAYOUT = "notification_action_layout";
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
        boolean included = (SILENT.equals(key) || MENTION_BYPASS.equals(key) || KEYWORD_BYPASS.equals(key)) ? silentIncluded()
                : (INFO.equals(key) || INFO_MEDIA_PREVIEW.equals(key)) ? infoIncluded()
                : NO_REPLY.equals(key) ? noReplyIncluded() : READ.equals(key) && readIncluded();
        return included && prefs().getBoolean(key, false);
    }
    static List<String> keywords() {
        if (application == null || !silentIncluded()) return Collections.emptyList();
        return NotificationPolicy.parseKeywords(prefs().getString(KEYWORDS, ""));
    }
    static boolean keywordBypassActive() { return enabled(KEYWORD_BYPASS) && !keywords().isEmpty(); }
    static boolean mediaPreviewAllowed() { return enabled(INFO) && enabled(INFO_MEDIA_PREVIEW); }
    static void setKeywords(String raw) {
        String normalized = NotificationPolicy.serializeKeywords(NotificationPolicy.parseKeywords(raw));
        prefs().edit().putString(KEYWORDS, normalized).apply();
    }
    static int maxMessages() {
        if (application == null || !infoIncluded()) return NotificationPolicy.DEFAULT_RECENT_MESSAGES;
        return NotificationPolicy.clampMessageCount(
                prefs().getInt(INFO_MAX_MESSAGES, NotificationPolicy.DEFAULT_RECENT_MESSAGES));
    }
    static void setMaxMessages(int count) {
        prefs().edit().putInt(INFO_MAX_MESSAGES, NotificationPolicy.clampMessageCount(count)).apply();
        Notifications.refreshActivePreviews();
    }
    static NotificationPolicy.Settings values() {
        return new NotificationPolicy.Settings(
                enabled(SILENT), enabled(INFO), enabled(NO_REPLY), enabled(READ), maxMessages());
    }
    static String encoded(String id) {
        return Base64.encodeToString(id.getBytes(StandardCharsets.UTF_8), Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
    }
    static String actionLayout() {
        return NotificationPolicy.normalizeActionLayout(
                application == null ? null : prefs().getString(ACTION_LAYOUT, NotificationPolicy.ACTION_LAYOUT_DEFAULT));
    }
    static void setActionLayout(String layoutId) {
        prefs().edit().putString(ACTION_LAYOUT, NotificationPolicy.normalizeActionLayout(layoutId)).apply();
        Notifications.refreshReadActions();
    }
    static boolean hasCustomActions() {
        return application != null && !NotificationPolicy.ACTION_LAYOUT_DEFAULT.equals(actionLayout());
    }
    static boolean readActionActive() {
        return readIncluded() && (enabled(READ) || NotificationPolicy.actionLayoutUsesRead(actionLayout()));
    }
    static String snoozeKey(String account, String chat) { return "snooze:" + encoded(account) + ":" + encoded(chat); }
    static void snooze(String account, String chat, long durationMillis) {
        if (application == null || account == null || account.isEmpty() || !NativeLine.regularChat(chat) || durationMillis <= 0L) return;
        prefs().edit().putLong(snoozeKey(account, chat), System.currentTimeMillis() + durationMillis).apply();
    }
    static void clearSnooze(String account, String chat) {
        if (application == null || account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return;
        prefs().edit().remove(snoozeKey(account, chat)).apply();
    }
    static boolean isSnoozed(String account, String chat) {
        if (application == null || account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return false;
        String key = snoozeKey(account, chat);
        long until = prefs().getLong(key, 0L);
        if (until <= 0L) return false;
        if (NotificationPolicy.isSnoozeActive(until, System.currentTimeMillis())) return true;
        prefs().edit().remove(key).apply();
        return false;
    }
    static boolean hasAnySnooze() {
        if (application == null) return false;
        long now = System.currentTimeMillis();
        for (java.util.Map.Entry<String, ?> entry : prefs().getAll().entrySet()) {
            if (entry.getKey().startsWith("snooze:") && entry.getValue() instanceof Long
                    && NotificationPolicy.isSnoozeActive((Long) entry.getValue(), now)) {
                return true;
            }
        }
        return false;
    }
    static String mutePrefix(String account) { return "mute:" + encoded(account) + ":"; }
    static String pendingHidePrefix(String account) { return "pending_hide:" + encoded(account) + ":"; }
    static String pendingHideKey(String account, String chat) { return pendingHidePrefix(account) + encoded(chat); }
    static String quietKey(String account, String chat) { return "quiet:" + encoded(account) + ":" + encoded(chat); }
    static boolean quiet(String account, String chat) { return prefs().getBoolean(quietKey(account, chat), false); }
    static boolean confirmedMutedOnly(String account, String chat) {
        if (application == null || account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return false;
        return prefs().contains(mutePrefix(account) + encoded(chat))
                || prefs().contains(pendingHideKey(account, chat));
    }
    static boolean fullyMuted(String account, String chat) {
        if (application == null || account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return false;
        if (prefs().contains(mutePrefix(account) + encoded(chat))) return true;
        return reconcilePendingHide(account, chat);
    }

    /** Persists a crash-recovery marker synchronously on the worker before native mute runs. */
    static boolean setPendingHide(String account, String chat, String name) {
        String label = name == null || name.isEmpty()
                ? Strings.get("line_notify_fallback_chat", "Chat") : name;
        return prefs().edit().putString(pendingHideKey(account, chat), label).commit();
    }

    static void clearPendingHide(String account, String chat) {
        prefs().edit().remove(pendingHideKey(account, chat)).apply();
    }

    static void commitHideSuccess(String account, String chat, String name) {
        String label = name == null || name.isEmpty()
                ? Strings.get("line_notify_fallback_chat", "Chat") : name;
        // Preserve quietKey while hidden so unhiding restores the room's prior QUIET vs NORMAL mode.
        prefs().edit()
                .putString(mutePrefix(account) + encoded(chat), label)
                .remove(pendingHideKey(account, chat))
                .apply();
    }

    /**
     * If a previous process exited after starting a native hide request and before the completion
     * callback wrote the local mute key, reconcile it against LINE's persisted per-chat mute state.
     */
    static boolean reconcilePendingHide(String account, String chat) {
        if (application == null || account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return false;
        String key = pendingHideKey(account, chat);
        String pendingName = prefs().getString(key, null);
        if (pendingName == null) return false;
        if (ChatNotifications.isHideInFlight(account, chat)) return false;
        try {
            if (!NotificationPolicy.sameAccount(account, NativeLine.account())) return false;
            boolean nativeMuted = NativeLine.muted(chat);
            if (!NotificationPolicy.sameAccount(account, NativeLine.account())) return false;
            if (nativeMuted) {
                commitHideSuccess(account, chat, pendingName);
                return true;
            }
            clearPendingHide(account, chat);
            return false;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return true;
        }
    }

    static boolean reconcileAllPendingHides(String account) {
        if (application == null || account == null || account.isEmpty()) return false;
        String prefix = pendingHidePrefix(account);
        boolean allResolved = true;
        for (java.util.Map.Entry<String, ?> entry : prefs().getAll().entrySet()) {
            if (entry.getKey().startsWith(prefix) && entry.getValue() instanceof String) {
                try {
                    String chat = new String(
                            Base64.decode(entry.getKey().substring(prefix.length()), Base64.URL_SAFE),
                            StandardCharsets.UTF_8);
                    reconcilePendingHide(account, chat);
                    if (prefs().contains(entry.getKey())) allResolved = false;
                } catch (IllegalArgumentException ignored) { }
            }
        }
        return allResolved;
    }

    static void clearRuntimeStateForTest() {
        RECONCILING_ACCOUNTS.clear();
        RECONCILED_ACCOUNTS.clear();
    }

    static void markNeedsReconcile(String account) {
        if (account != null && !account.isEmpty()) {
            RECONCILED_ACCOUNTS.remove(account);
        }
    }

    /** Reconciles interrupted hides and prunes surviving hidden notifications once per account per process. */
    static void ensureAccountReconciled(String account, boolean asyncPrune) {
        if (application == null || account == null || account.isEmpty() || !enabled(SILENT)) return;
        if (RECONCILED_ACCOUNTS.contains(account)) return;
        if (!RECONCILING_ACCOUNTS.add(account)) return;
        if (asyncPrune) {
            Notifications.reconcileAccountAsync(account);
        } else {
            runAccountReconcile(account);
        }
    }

    static void runAccountReconcile(String account) {
        try {
            if (application == null || account == null || account.isEmpty() || !enabled(SILENT)) return;
            boolean allMarkersResolved = reconcileAllPendingHides(account);
            if (pruneHiddenNotifications(account) && allMarkersResolved) {
                RECONCILED_ACCOUNTS.add(account);
            }
        } finally {
            RECONCILING_ACCOUNTS.remove(account);
        }
    }
    /** Presentation only: replaces generic chat-list attachment labels when More Chat Info is active. */
    public static String chatListLastMessage(String chat, String nativeText, Long lastTime, boolean hasDraft) {
        if (!enabled(INFO) || hasDraft || lastTime == null || !NativeLine.regularChat(chat)) return nativeText;
        try {
            return NativeLine.chatListLastMessage(chat, NativeLine.account(), nativeText, lastTime);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return nativeText;
        }
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
        // Current-account notifications under SILENT use account-bound MuteActions; consume
        // any leftover unbound native mute intent without changing room state.
        return true;
    }
    /** The original private service handles every action not owned by these patches. */
    public static boolean interceptNotificationAction(Context context, Intent intent) {
        if (ReadActions.handle(context, intent)) return true;
        if (SnoozeActions.handle(context, intent)) return true;
        if (MuteActions.handle(context, intent)) return true;
        return interceptNotificationMute(context, intent);
    }
    static void setMuted(String account, String chat, String name, boolean mute) {
        SharedPreferences.Editor editor = prefs().edit();
        String key = mutePrefix(account) + encoded(chat);
        if (mute) editor.putString(key, name == null || name.isEmpty()
                ? Strings.get("line_notify_fallback_chat", "Chat") : name);
        else editor.remove(key);
        editor.apply();
    }

    static boolean pruneHiddenNotifications(String account) {
        if (application == null || account == null || account.isEmpty()) return false;
        try {
            if (!NotificationPolicy.sameAccount(account, NativeLine.account())) return false;
            NotificationManager manager = context().getSystemService(NotificationManager.class);
            if (manager == null) return false;
            Set<String> hiddenChats = new HashSet<>();
            String prefix = mutePrefix(account);
            for (java.util.Map.Entry<String, ?> entry : prefs().getAll().entrySet()) {
                if (entry.getKey().startsWith(prefix) && entry.getValue() instanceof String) {
                    try {
                        String chat = new String(
                                Base64.decode(entry.getKey().substring(prefix.length()), Base64.URL_SAFE),
                                StandardCharsets.UTF_8);
                        if (NativeLine.regularChat(chat) && !ChatNotifications.isHideInFlight(account, chat)) {
                            hiddenChats.add(chat);
                        }
                    } catch (IllegalArgumentException ignored) { }
                }
            }
            if (!hiddenChats.isEmpty()) {
                return Notifications.cancelConfirmedHiddenChats(manager, account, hiddenChats);
            }
            return NotificationPolicy.sameAccount(account, NativeLine.account());
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    private static void pruneHiddenNotifications() {
        try {
            String account = NativeLine.account();
            reconcileAllPendingHides(account);
            pruneHiddenNotifications(account);
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
            Notifications.refreshReadActions();
            ChatNotifications.refreshChatList();
        }
        if (INFO.equals(key)) {
            NativeLine.clearChatListPreviewCache();
            if (!checked) NativeLine.clearMediaPreviewCache(context());
            ChatNotifications.refreshChatList();
        }
        if (INFO_MEDIA_PREVIEW.equals(key)) {
            if (!checked) NativeLine.clearMediaPreviewCache(context());
            Notifications.refreshActivePreviews();
        }
        if (READ.equals(key) || NO_REPLY.equals(key)) Notifications.refreshReadActions();
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
                                try { if (account.equals(NativeLine.account())) ChatNotifications.change(context, account, chat,
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
