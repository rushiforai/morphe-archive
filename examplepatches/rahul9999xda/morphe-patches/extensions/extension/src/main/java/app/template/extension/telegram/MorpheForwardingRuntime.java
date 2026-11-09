package app.template.extension.telegram;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import app.template.extension.forwarding.ForwardingCoordinator;
import app.template.extension.forwarding.ForwardingMessage;
import app.template.extension.forwarding.ForwardingRule;
import app.template.extension.forwarding.ForwardingRuleStore;
import app.template.extension.forwarding.TelegramMessageGateway;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * Connects the rule engine to Telegram's existing NotificationCenter and SendMessagesHelper.
 * No TDLib client, second login, or separate Telegram session is created.
 */
public final class MorpheForwardingRuntime {
    private static final String NOTIFICATION_CENTER = "org.telegram.messenger.NotificationCenter";
    private static final String USER_CONFIG = "org.telegram.messenger.UserConfig";
    private static final String MESSAGE_OBJECT = "org.telegram.messenger.MessageObject";
    private static final String APPLICATION_LOADER = "org.telegram.messenger.ApplicationLoader";
    private static final ArrayList<Object> OBSERVERS = new ArrayList<>();
    private static final Set<Integer> REGISTERED_ACCOUNTS = new HashSet<>();
    private static volatile boolean installed;
    private static int installRetryCount;
    private static final int MAX_INSTALL_RETRIES = 20;
    private static ForwardingCoordinator coordinator;
    private static SharedPreferencesForwardingRuleStore store;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private MorpheForwardingRuntime() { }

    public static synchronized void install() {
        if (installed) return;
        try {
            Context context = applicationContext();
            if (context == null) {
                scheduleInstallRetry();
                return;
            }
            if (store == null) store = new SharedPreferencesForwardingRuleStore(context);
            if (coordinator == null) {
                Executor executor = Executors.newSingleThreadExecutor(command -> {
                    Thread thread = new Thread(command, "MorpheForwarding");
                    thread.setPriority(Thread.NORM_PRIORITY - 1);
                    return thread;
                });
                coordinator = new ForwardingCoordinator(store, new NativeGateway(), executor);
                coordinator.start();
            }

            ClassLoader loader = context.getClassLoader();
            Class<?> notificationClass = Class.forName(NOTIFICATION_CENTER, false, loader);
            Class<?> delegateClass = Class.forName(NOTIFICATION_CENTER + "$NotificationCenterDelegate", false, loader);
            int eventId = notificationClass.getField("didReceiveNewMessages").getInt(null);
            int maxAccounts = maxAccountCount(loader);
            Method getInstance = notificationClass.getMethod("getInstance", int.class);
            Method addObserver = notificationClass.getMethod("addObserver", delegateClass, int.class);

            // Register independently per account. If one account fails, already-registered
            // accounts remain recorded and will not receive duplicate observer instances
            // when a later startup retry fills in the missing accounts.
            for (int account = 0; account < maxAccounts; account++) {
                if (REGISTERED_ACCOUNTS.contains(account)) continue;
                try {
                    Object center = getInstance.invoke(null, account);
                    Object observer = Proxy.newProxyInstance(loader, new Class<?>[]{delegateClass},
                            new NotificationHandler(account, eventId));
                    addObserver.invoke(center, observer, eventId);
                    OBSERVERS.add(observer);
                    REGISTERED_ACCOUNTS.add(account);
                } catch (Throwable accountError) {
                    // Continue registering other active/inactive account slots.
                }
            }
            installed = REGISTERED_ACCOUNTS.size() >= maxAccounts;
            if (!installed) scheduleInstallRetry();
            else installRetryCount = 0;
        } catch (Throwable error) {
            // Keep Telegram startup safe if a future fork changes an internal API.
            installed = false;
            scheduleInstallRetry();
        }
    }

    private static void scheduleInstallRetry() {
        if (installRetryCount >= MAX_INSTALL_RETRIES) return;
        installRetryCount++;
        MAIN.postDelayed(new Runnable() {
            @Override public void run() { MorpheForwardingRuntime.install(); }
        }, 15000L);
    }

    private static Context applicationContext() {
        try {
            Class<?> loader = Class.forName(APPLICATION_LOADER);
            Field field = loader.getField("applicationContext");
            Object value = field.get(null);
            return value instanceof Context ? (Context) value : null;
        } catch (Throwable ignored) { return null; }
    }

    private static int maxAccountCount(ClassLoader loader) {
        try { return Class.forName(USER_CONFIG, false, loader).getField("MAX_ACCOUNT_COUNT").getInt(null); }
        catch (Throwable ignored) { return 4; }
    }

    private static boolean isAccountActivated(ClassLoader loader, int account) {
        try {
            Class<?> userConfig = Class.forName(USER_CONFIG, false, loader);
            Object instance = userConfig.getMethod("getInstance", int.class).invoke(null, account);
            return Boolean.TRUE.equals(userConfig.getMethod("isClientActivated").invoke(instance));
        } catch (Throwable ignored) { return false; }
    }

    private static final class NotificationHandler implements InvocationHandler {
        private final int accountId;
        private final int eventId;
        NotificationHandler(int accountId, int eventId) { this.accountId = accountId; this.eventId = eventId; }

        @Override public Object invoke(Object proxy, Method method, Object[] args) {
            if ("toString".equals(method.getName())) return "MorpheNotificationObserver";
            if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
            if ("equals".equals(method.getName())) return proxy == (args == null ? null : args[0]);
            if (!"didReceivedNotification".equals(method.getName()) || args == null || args.length < 3) return null;
            try {
                int id = ((Number) args[0]).intValue();
                if (id != eventId || !(args[2] instanceof Object[])) return null;
                Object[] payload = (Object[]) args[2];
                if (payload.length < 2 || !(payload[0] instanceof Number) || !(payload[1] instanceof List)) return null;
                if (payload.length > 2 && Boolean.TRUE.equals(payload[2])) return null; // scheduled messages
                long dialogId = ((Number) payload[0]).longValue();
                if (isSecretDialog(dialogId)) return null;
                List<?> messages = (List<?>) payload[1];
                for (Object message : messages) {
                    ForwardingMessage event = toForwardingMessage(accountId, dialogId, message);
                    if (event != null && coordinator != null) coordinator.onIncomingMessage(event);
                }
            } catch (Throwable ignored) { }
            return null;
        }
    }

    private static ForwardingMessage toForwardingMessage(int accountId, long dialogId, Object messageObject) {
        if (messageObject == null) return null;
        try {
            Class<?> type = messageObject.getClass();
            Object owner = type.getField("messageOwner").get(messageObject);
            if (owner == null) return null;
            Class<?> ownerType = owner.getClass();
            if (ownerType.getField("out").getBoolean(owner)) return null;
            if (ownerType.getField("action").get(owner) != null) return null; // service messages
            boolean protectedContent = ownerType.getField("noforwards").getBoolean(owner);
            if (isSecretDialog(dialogId)) return null;
            // canForwardMessage() is a UI capability heuristic and can return false for
            // channel/media-caption combinations that Telegram's native forward dialog accepts.
            // Keep explicit protected-content enforcement; let SendMessagesHelper validate delivery.
            boolean forwardable = !protectedContent;
            int messageId = ((Number) type.getMethod("getId").invoke(messageObject)).intValue();
            String text = "";
            try {
                Object value = type.getField("messageText").get(messageObject);
                if (value != null) text = value.toString();
            } catch (Throwable ignored) { }
            if (text.isEmpty()) {
                Object value = ownerType.getField("message").get(owner);
                if (value != null) text = String.valueOf(value);
            }
            // Keep media-only MessageObjects in the event pipeline. FORWARD can pass the
            // native MessageObject unchanged; COPY remains text-only and is filtered by the matcher.
            return new ForwardingMessage(accountId, dialogId, messageId, text,
                    false, false, false, protectedContent, forwardable, messageObject);
        } catch (Throwable ignored) { return null; }
    }

    private static boolean isSecretDialog(long dialogId) {
        try {
            Class<?> dialogObject = Class.forName("org.telegram.messenger.DialogObject");
            return Boolean.TRUE.equals(dialogObject.getMethod("isEncryptedDialog", long.class).invoke(null, dialogId));
        } catch (Throwable ignored) { return false; }
    }

    private static final class NativeGateway implements TelegramMessageGateway {
        @Override public void forward(final int accountId, final ForwardingMessage source,
                                      final long destinationChatId, final boolean showSenderName, final ResultCallback callback) {
            dispatchOnMain(new Runnable() {
                @Override public void run() {
                    try {
                        Object messageObject = source.getNativeMessage();
                        if (messageObject == null) throw new IllegalStateException("Original Telegram message is unavailable");
                        ClassLoader loader = messageObject.getClass().getClassLoader();
                        Class<?> helperClass = Class.forName("org.telegram.messenger.SendMessagesHelper", false, loader);
                        Object helper = helperClass.getMethod("getInstance", int.class).invoke(null, accountId);
                        Method method = findForwardMethod(helperClass, messageObject.getClass());
                        ArrayList<Object> messages = new ArrayList<>(Collections.singletonList(messageObject));
                        method.invoke(helper, messages, destinationChatId,
                                !showSenderName, false, false, 0, 0, null, -1, 0L, 0L, null);
                        // The helper's integer is a local message identifier, not a success
                        // boolean (and may be zero/negative in fork-specific implementations).
                        // Count acceptance when invocation returns normally; only an exception
                        // indicates that Telegram rejected the request before enqueueing.
                        if (callback != null) callback.onSuccess();
                    } catch (Throwable error) {
                        if (callback != null) callback.onFailure(unwrap(error));
                    }
                }
            });
        }

        @Override public void copy(final int accountId, final ForwardingMessage source,
                                   final long destinationChatId, final boolean showSenderName, final ResultCallback callback) {
            dispatchOnMain(new Runnable() {
                @Override public void run() {
                    try {
                        Object messageObject = source.getNativeMessage();
                        if (messageObject == null) throw new IllegalStateException("Original Telegram message is unavailable");
                        if (source.getText().trim().isEmpty()) throw new IllegalArgumentException("Only text messages can be copied");
                        ClassLoader loader = messageObject.getClass().getClassLoader();
                        Class<?> helperClass = Class.forName("org.telegram.messenger.SendMessagesHelper", false, loader);
                        Class<?> paramsClass = Class.forName("org.telegram.messenger.SendMessagesHelper$SendMessageParams", false, loader);
                        // Construct a fresh text message. Do not clone the source MessageObject,
                        // which could carry protected-media/forward metadata into the destination.
                        Object params = paramsClass.getMethod("of", String.class, long.class)
                                .invoke(null, source.getText(), destinationChatId);
                        Object owner = messageObject.getClass().getField("messageOwner").get(messageObject);
                        Object entities = null;
                        // Use Telegram's own entity resolver first. It can include formatting
                        // represented by MessageObject.messageText spans, not just raw wire entities.
                        try {
                            entities = messageObject.getClass().getMethod("getEntities").invoke(messageObject);
                        } catch (Throwable ignored) { }
                        if (!(entities instanceof List)) {
                            entities = owner.getClass().getField("entities").get(owner);
                        }
                        if (entities instanceof List) {
                            paramsClass.getField("entities").set(params, new ArrayList<>((List<?>) entities));
                        }
                        Object helper = helperClass.getMethod("getInstance", int.class).invoke(null, accountId);
                        helperClass.getMethod("sendMessage", paramsClass).invoke(helper, params);
                        // The params overload returns void: success here means accepted by
                        // Telegram's local send pipeline, not confirmed server delivery.
                        if (callback != null) callback.onSuccess();
                    } catch (Throwable error) {
                        if (callback != null) callback.onFailure(unwrap(error));
                    }
                }
            });
        }

        private static Method findForwardMethod(Class<?> helperClass, Class<?> messageObjectClass) throws NoSuchMethodException {
            for (Method method : helperClass.getMethods()) {
                Class<?>[] p = method.getParameterTypes();
                if (!"sendMessage".equals(method.getName()) || p.length != 12) continue;
                if (p[0] == ArrayList.class && p[1] == long.class && p[2] == boolean.class
                        && p[3] == boolean.class && p[4] == boolean.class && p[5] == int.class
                        && p[6] == int.class && p[7].isAssignableFrom(messageObjectClass)
                        && p[8] == int.class && p[9] == long.class && p[10] == long.class
                        && p[11].getName().endsWith("MessageSuggestionParams")) {
                    method.setAccessible(true);
                    return method;
                }
            }
            throw new NoSuchMethodException("Native SendMessagesHelper forward overload not found");
        }

        private static void dispatchOnMain(Runnable runnable) {
            if (Looper.myLooper() == Looper.getMainLooper()) runnable.run();
            else MAIN.post(runnable);
        }

        private static Throwable unwrap(Throwable error) {
            return error instanceof java.lang.reflect.InvocationTargetException
                    && ((java.lang.reflect.InvocationTargetException) error).getCause() != null
                    ? ((java.lang.reflect.InvocationTargetException) error).getCause() : error;
        }
    }
}
