package app.linenotifications.extension;

import android.app.NotificationManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import app.linenotifications.extension.core.NotificationPolicy;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/** User-triggered room settings. Uses LINE's existing setter; never fetches messages. */
final class ChatNotifications {
    static final int NORMAL = 0, QUIET = 1, HIDDEN = 2;
    static final int HIDE_NONE = 0, HIDE_IN_FLIGHT = 1, HIDE_CONFIRMED = 2;
    private static final int CLAIMED = -1;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final Object STATE_LOCK = new Object();
    private static final Map<NotificationPolicy.ChatKey, Integer> IN_FLIGHT_MODE = new HashMap<>();
    private ChatNotifications() {}

    static boolean isHideInFlight(String account, String chat) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return false;
        synchronized (STATE_LOCK) {
            return Integer.valueOf(HIDDEN).equals(IN_FLIGHT_MODE.get(new NotificationPolicy.ChatKey(account, chat)));
        }
    }

    static boolean isQuietInFlight(String account, String chat) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return false;
        synchronized (STATE_LOCK) {
            return Integer.valueOf(QUIET).equals(IN_FLIGHT_MODE.get(new NotificationPolicy.ChatKey(account, chat)));
        }
    }

    /**
     * Returns in-flight vs confirmed hide state under a single STATE_LOCK section without native I/O.
     * Because worker puts IN_FLIGHT_MODE=HIDDEN before writing pending_hide, and finish() commits or
     * clears prefs before removing IN_FLIGHT_MODE, an in-flight hide is never misclassified as confirmed.
     */
    static int hideDisposition(String account, String chat) {
        if (account == null || account.isEmpty() || !NativeLine.regularChat(chat)) return HIDE_NONE;
        NotificationPolicy.ChatKey key = new NotificationPolicy.ChatKey(account, chat);
        synchronized (STATE_LOCK) {
            if (Integer.valueOf(HIDDEN).equals(IN_FLIGHT_MODE.get(key))) return HIDE_IN_FLIGHT;
            return Settings.confirmedMutedOnly(account, chat) ? HIDE_CONFIRMED : HIDE_NONE;
        }
    }

    static void flushWorkerForTest() {
        try {
            WORKER.submit(() -> { }).get(3L, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new AssertionError("Interrupted while flushing ChatNotifications worker", e);
        } catch (Exception e) {
            throw new AssertionError("Failed or timed out flushing ChatNotifications worker", e);
        }
    }

    static void clearRuntimeStateForTest() {
        flushWorkerForTest();
        synchronized (STATE_LOCK) {
            IN_FLIGHT_MODE.clear();
        }
    }

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
            change(context, account, chat, disabled ? NORMAL : QUIET, callback, null);
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
            change(Settings.context(), account, chat, disabled ? NORMAL : QUIET, null, null);
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
        change(context, null, chat, mode, nativeCallback, completed);
    }

    static void change(Context context, String expectedAccount, String chat, int mode, Object nativeCallback,
                       java.util.function.Consumer<Boolean> completed) {
        try {
            if (!NativeLine.regularChat(chat)) return;
            String account = NativeLine.account();
            if (expectedAccount != null && !NotificationPolicy.sameAccount(expectedAccount, account)) return;
            String quietKey = Settings.quietKey(account, chat);
            String hiddenKey = Settings.mutePrefix(account) + Settings.encoded(chat);
            boolean wasHidden = Settings.fullyMuted(account, chat);
            NotificationPolicy.ChatKey chatKey = new NotificationPolicy.ChatKey(account, chat);
            synchronized (STATE_LOCK) {
                if (IN_FLIGHT_MODE.containsKey(chatKey)) return;
                IN_FLIGHT_MODE.put(chatKey, CLAIMED);
            }
            final String[] resolvedName = new String[1];
            trace(mode == QUIET ? "setting: quiet requested" : mode == HIDDEN ? "setting: hidden requested" : "setting: normal requested");
            AtomicBoolean done = new AtomicBoolean();
            java.util.function.Consumer<Boolean> finish = success -> {
                if (!done.compareAndSet(false, true)) return;
                boolean succeeded = Boolean.TRUE.equals(success);
                // Commit preferences BEFORE clearing IN_FLIGHT_MODE so hideDisposition never sees a gap.
                try {
                    if (succeeded) {
                        if (mode == HIDDEN) {
                            Settings.commitHideSuccess(account, chat, resolvedName[0]);
                        } else {
                            Settings.prefs().edit()
                                    .putBoolean(quietKey, mode == QUIET)
                                    .remove(hiddenKey)
                                    .remove(Settings.pendingHideKey(account, chat))
                                    .apply();
                        }
                        Settings.clearSnooze(account, chat);
                    } else if (mode == HIDDEN) {
                        Settings.clearPendingHide(account, chat);
                    }
                } finally {
                    synchronized (STATE_LOCK) {
                        IN_FLIGHT_MODE.remove(chatKey);
                    }
                }
                trace(succeeded ? "setting: completed" : "setting: failed");
                Runnable postUi = () -> MAIN.post(() -> {
                    boolean activeAccountMatches;
                    try {
                        activeAccountMatches = NotificationPolicy.sameAccount(account, NativeLine.account());
                    } catch (ReflectiveOperationException | RuntimeException ignored) {
                        activeAccountMatches = false;
                    }
                    if (!activeAccountMatches) {
                        if (completed != null) completed.accept(succeeded);
                        return;
                    }
                    try {
                        if (!succeeded) toast(context, Strings.get(context, "line_notify_toast_change_failed",
                                "Could not update notification setting. Please try again."));
                        else if (nativeCallback != null) {
                            Object result = NativeLine.type("com.linecorp.chathistory.menu.t$a$b")
                                    .getConstructor(boolean.class).newInstance(mode == NORMAL);
                            NativeLine.type("nt8.l").getMethod("invoke", Object.class).invoke(nativeCallback, result);
                        } else toast(context, mode == HIDDEN ? Strings.get(context, "line_notify_toast_hidden", "Notifications hidden completely.")
                                : mode == QUIET ? Strings.get(context, "line_notify_toast_quiet", "Set to silent notifications.")
                                : wasHidden ? Strings.get(context, "line_notify_toast_unhidden", "Notifications unhidden.")
                                : Strings.get(context, "line_notify_toast_normal", "Set to normal notifications."));
                    } catch (ReflectiveOperationException | RuntimeException ignored) {
                        toast(context, Strings.get(context, "line_notify_toast_reopen_menu",
                                "Setting updated. Please reopen the chat menu."));
                    }
                    if (succeeded) refreshChatList();
                    if (completed != null) completed.accept(succeeded);
                });
                if (mode == HIDDEN) {
                    if (succeeded) {
                        NotificationManager manager = Settings.context().getSystemService(NotificationManager.class);
                        Notifications.onHideCompletedAsync(manager, account, chat, postUi);
                        return;
                    }
                    Notifications.onHideAborted(account, chat);
                }
                postUi.run();
            };
            try {
                WORKER.execute(() -> {
                    try {
                        if (!NotificationPolicy.sameAccount(account, NativeLine.account())) { finish.accept(false); return; }
                        NativeLine.Chat state = NativeLine.chat(chat);
                        if (state == null) { finish.accept(false); return; }
                        resolvedName[0] = state.name;
                        if (!NotificationPolicy.sameAccount(account, NativeLine.account())) { finish.accept(false); return; }
                        synchronized (STATE_LOCK) {
                            IN_FLIGHT_MODE.put(chatKey, mode);
                        }
                        if (mode == HIDDEN && !Settings.setPendingHide(account, chat, resolvedName[0])) {
                            finish.accept(false);
                            return;
                        }
                        boolean nativeEnabled = !NativeLine.muted(chat);
                        if (!NotificationPolicy.sameAccount(account, NativeLine.account())) { finish.accept(false); return; }
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
                        if (!NotificationPolicy.sameAccount(account, NativeLine.account())) { finish.accept(false); return; }
                        trace("setting: calling native setter");
                        Object result = NativeLine.type("ue3.k").getMethod("p", String.class, boolean.class, continuationType)
                                .invoke(repository, chat, desiredNative, new NotificationContinuation(continuation));
                        if (result != suspended) finish.accept(successResult.equals(result));
                    } catch (ReflectiveOperationException | RuntimeException ignored) { finish.accept(false); }
                });
            } catch (RuntimeException ex) {
                synchronized (STATE_LOCK) {
                    IN_FLIGHT_MODE.remove(chatKey);
                }
                throw ex;
            }
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
