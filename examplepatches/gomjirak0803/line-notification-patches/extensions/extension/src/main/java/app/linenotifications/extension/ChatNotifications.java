package app.linenotifications.extension;

import android.app.NotificationManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.lang.reflect.Proxy;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/** User-triggered room settings. Uses LINE's existing setter; never fetches messages. */
final class ChatNotifications {
    static final int NORMAL = 0, QUIET = 1, HIDDEN = 2;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final Set<String> BUSY = ConcurrentHashMap.newKeySet();
    private ChatNotifications() {}

    static boolean interceptToggle(Object fragment, Object callback) {
        if (!Settings.enabled(Settings.SILENT)) return false;
        try {
            Object data = NativeLine.field(fragment, "e");
            String chat = (String) NativeLine.field(data, "a");
            if (!NativeLine.regularChat(chat)) return false;
            Context context = (Context) fragment.getClass().getMethod("getContext").invoke(fragment);
            String account = NativeLine.account();
            boolean disabled = Settings.quiet(account, chat) || Settings.fullyMuted(account, chat) || NativeLine.muted(chat);
            trace("toggle: native menu intercepted");
            change(context, chat, disabled ? NORMAL : QUIET, callback, null);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            toast(Settings.context(), Strings.get("line_notify_toast_change_failed",
                    "Could not update notification setting. Please try again."));
        }
        // Never fall through to the server mute operation after a failed quiet toggle.
        return true;
    }

    static boolean interceptChatListToggle(String chat) {
        if (!Settings.enabled(Settings.SILENT) || !NativeLine.regularChat(chat)) return false;
        try {
            String account = NativeLine.account();
            boolean disabled = Settings.quiet(account, chat) || Settings.fullyMuted(account, chat) || NativeLine.muted(chat);
            trace("toggle: chat-list menu intercepted");
            change(Settings.context(), chat, disabled ? NORMAL : QUIET, null, null);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            toast(Settings.context(), Strings.get("line_notify_toast_change_failed",
                    "Could not update notification setting. Please try again."));
        }
        // Never fall through to the server mute operation after a failed quiet toggle.
        return true;
    }

    static void refreshChatList() {
        try {
            Class<?> busType = NativeLine.type("com.linecorp.rxeventbus.d");
            Object key = busType.getField("a").get(null);
            Object bus = NativeLine.type("sc0.f").getMethod("a", Context.class, NativeLine.type("sc0.a"))
                    .invoke(null, Settings.context(), key);
            Object event = NativeLine.type("xe8.b").getField("CHAT_LIST").get(null);
            busType.getMethod("b", Object.class).invoke(bus, event);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }

    static void change(Context context, String chat, int mode, Object nativeCallback,
                       java.util.function.Consumer<Boolean> completed) {
        try {
            if (!NativeLine.regularChat(chat)) return;
            String account = NativeLine.account();
            String quietKey = Settings.quietKey(account, chat);
            String hiddenKey = Settings.mutePrefix(account) + Settings.encoded(chat);
            boolean oldQuiet = Settings.quiet(account, chat);
            String oldHidden = Settings.prefs().getString(hiddenKey, null);
            if (!BUSY.add(quietKey)) return;
            trace(mode == QUIET ? "setting: quiet requested" : mode == HIDDEN ? "setting: hidden requested" : "setting: normal requested");
            AtomicBoolean done = new AtomicBoolean();
            java.util.function.Consumer<Boolean> finish = success -> {
                if (!done.compareAndSet(false, true)) return;
                MAIN.post(() -> {
                    if (!success) {
                        SharedPreferences.Editor editor = Settings.prefs().edit().putBoolean(quietKey, oldQuiet);
                        if (oldHidden == null) editor.remove(hiddenKey); else editor.putString(hiddenKey, oldHidden);
                        editor.apply();
                    }
                    BUSY.remove(quietKey);
                    trace(success ? "setting: completed" : "setting: failed");
                    try {
                        if (!account.equals(NativeLine.account())) return;
                        if (success) {
                            Settings.clearSnooze(account, chat);
                            if (mode == HIDDEN) {
                                NotificationManager manager = Settings.context().getSystemService(NotificationManager.class);
                                Notifications.cancelChatNotifications(manager, account, chat);
                            }
                        }
                        if (!success) toast(context, Strings.get(context, "line_notify_toast_change_failed",
                                "Could not update notification setting. Please try again."));
                        else if (nativeCallback != null) {
                            Object result = NativeLine.type("com.linecorp.chathistory.menu.t$a$b")
                                    .getConstructor(boolean.class).newInstance(mode == NORMAL);
                            NativeLine.type("nt8.l").getMethod("invoke", Object.class).invoke(nativeCallback, result);
                        } else toast(context, mode == HIDDEN ? Strings.get(context, "line_notify_toast_hidden", "Notifications hidden completely.")
                                : mode == QUIET ? Strings.get(context, "line_notify_toast_quiet", "Set to silent notifications.")
                                : oldHidden != null ? Strings.get(context, "line_notify_toast_unhidden", "Notifications unhidden.")
                                : Strings.get(context, "line_notify_toast_normal", "Set to normal notifications."));
                    } catch (ReflectiveOperationException | RuntimeException ignored) {
                        toast(context, Strings.get(context, "line_notify_toast_reopen_menu",
                                "Setting updated. Please reopen the chat menu."));
                    }
                    if (success) refreshChatList();
                    if (completed != null) completed.accept(success);
                });
            };
            WORKER.execute(() -> {
                try {
                    if (!account.equals(NativeLine.account())) { finish.accept(false); return; }
                    NativeLine.Chat state = NativeLine.chat(chat);
                    if (state == null) { finish.accept(false); return; }
                    String name = state.name;
                    if (!account.equals(NativeLine.account())) { finish.accept(false); return; }
                    // Install local suppression before enabling push, so a message racing
                    // the native setting update cannot briefly become audible or visible.
                    if (mode != HIDDEN) Settings.prefs().edit().putBoolean(quietKey, mode == QUIET).apply();
                    Settings.setMuted(account, chat, name, mode == HIDDEN);
                    boolean nativeEnabled = !NativeLine.muted(chat);
                    boolean desiredNative = mode != HIDDEN;
                    if (nativeEnabled == desiredNative) {
                        trace("setting: native delivery already matches");
                        finish.accept(true); return;
                    }
                    Object manager = NativeLine.type("wk8.a2").getMethod("a", Context.class, boolean.class)
                            .invoke(null, Settings.context(), false);
                    Object repository = NativeLine.type("wk8.l0").getMethod("r").invoke(manager);
                    Class<?> continuationType = NativeLine.type("kotlin.coroutines.Continuation");
                    Object emptyContext = NativeLine.type("bt8.j").getField("a").get(null);
                    Object successResult = NativeLine.type("ig3.t$c").getField("a").get(null);
                    Object suspended = NativeLine.type("ct8.a").getField("COROUTINE_SUSPENDED").get(null);
                    Object continuation = Proxy.newProxyInstance(Settings.context().getClassLoader(),
                            new Class<?>[]{continuationType}, (proxy, method, args) -> {
                                if (method.getName().equals("getContext")) return emptyContext;
                                if (method.getName().equals("resumeWith")) { finish.accept(successResult.equals(args[0])); return null; }
                                if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                                if (method.getName().equals("equals")) return proxy == args[0];
                                return "NotificationSettingContinuation";
                            });
                    if (!account.equals(NativeLine.account())) { finish.accept(false); return; }
                    trace("setting: calling native setter");
                    Object result = NativeLine.type("ue3.k").getMethod("p", String.class, boolean.class, continuationType)
                            .invoke(repository, chat, desiredNative, new NotificationContinuation(continuation));
                    if (result != suspended) finish.accept(successResult.equals(result));
                } catch (ReflectiveOperationException | RuntimeException ignored) { finish.accept(false); }
            });
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            toast(context, Strings.get(context, "line_notify_toast_change_failed",
                    "Could not update notification setting. Please try again."));
        }
    }

    private static void toast(Context context, String text) {
        MAIN.post(() -> Toast.makeText(context, text, Toast.LENGTH_SHORT).show());
    }
    private static void trace(String stage) {
        if (android.util.Log.isLoggable("LineNotifyPatch", android.util.Log.DEBUG)) android.util.Log.d("LineNotifyPatch", stage);
    }
}
