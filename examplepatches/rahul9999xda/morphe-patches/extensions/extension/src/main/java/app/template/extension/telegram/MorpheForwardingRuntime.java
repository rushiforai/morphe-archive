package app.template.extension.telegram;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import app.template.extension.forwarding.ForwardingCoordinator;
import app.template.extension.forwarding.ForwardingMessage;
import app.template.extension.forwarding.ForwardingRule;
import app.template.extension.forwarding.TelegramMessageGateway;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Connects Morphe forwarding rules to Telegram's already-authenticated account stack.
 * Current Telegram 13.3.1 Android/Web R8 names are selected by the patch's startup hook;
 * older profiles remain available for already-supported builds.
 * The no-argument entry point is retained for older, unobfuscated targets.
 */
public final class MorpheForwardingRuntime {
    private static final int PROFILE_UNSET = -2;
    private static final int PROFILE_LEGACY = -1;
    private static final int PROFILE_TELEGRAM_ANDROID_1331 = 0;
    private static final int PROFILE_TELEGRAM_WEB_1331 = 1;

    private static final ArrayList<Object> OBSERVERS = new ArrayList<>();
    private static final Set<Integer> REGISTERED_ACCOUNTS = new HashSet<>();
    private static volatile boolean installed;
    private static int activeProfile = PROFILE_UNSET;
    private static int installRetryCount;
    private static volatile String lastAccountRegistrationError = "";
    private static final int MAX_INSTALL_RETRIES = 20;
    private static volatile ForwardingCoordinator coordinator;
    private static volatile SharedPreferencesForwardingRuleStore store;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean FIRST_INCOMING_REPORTED = new AtomicBoolean(false);
    private static final AtomicBoolean PAYLOAD_ERROR_REPORTED = new AtomicBoolean(false);
    private static final AtomicBoolean MESSAGE_ADAPTER_ERROR_REPORTED = new AtomicBoolean(false);
    private static final AtomicBoolean SECRET_FILTER_ERROR_REPORTED = new AtomicBoolean(false);

    private MorpheForwardingRuntime() { }

    /** Legacy entry point kept for previously supported Telegram/Plus builds. */
    public static synchronized void install() {
        installInternal(PROFILE_LEGACY);
    }

    /** Called by the 13.3.1 Telegram Android/Web patch with its exact R8 profile. */
    public static synchronized void install(int profile) {
        if (profile != PROFILE_TELEGRAM_ANDROID_1331 && profile != PROFILE_TELEGRAM_WEB_1331) {
            installInternal(PROFILE_LEGACY);
            return;
        }
        installInternal(profile);
    }

    private static synchronized void installInternal(int profile) {
        if (installed && activeProfile == profile) return;
        if (activeProfile != profile) {
            // A process only contains one Telegram application variant. Ignore stale retry
            // callbacks from a previously selected profile rather than mixing mappings.
            if (activeProfile != PROFILE_UNSET) return;
            activeProfile = profile;
        }
        try {
            Context context = applicationContext(profile);
            if (context == null) {
                updateRuntimeStatus("Waiting for Telegram application context");
                scheduleInstallRetry(profile);
                return;
            }
            MorpheRulesBackup.schedule(context);
            if (store == null) store = new SharedPreferencesForwardingRuleStore(context);
            updateRuntimeStatus("Registering Telegram message listener");
            if (coordinator == null) {
                // Keep event matching ordered, but isolate the two delivery modes. A slow
                // FORWARD operation must not stall COPY rules and vice versa. Every queue is
                // bounded; rejected work is counted by the coordinator instead of disappearing.
                ThreadPoolExecutor eventExecutor = createQueue("MorpheEvents", 256);
                ThreadPoolExecutor forwardExecutor = createQueue("MorpheForward", 128);
                ThreadPoolExecutor copyExecutor = createQueue("MorpheCopy", 128);
                coordinator = new ForwardingCoordinator(store, new NativeGateway(profile),
                        eventExecutor, forwardExecutor, copyExecutor);
                coordinator.start();
            }

            RuntimeProfile mapping = RuntimeProfile.forId(profile);
            ClassLoader loader = context.getClassLoader();
            Class<?> notificationClass = Class.forName(mapping.notificationClass, false, loader);
            Class<?> delegateClass = Class.forName(mapping.delegateClass, false, loader);
            Method getInstance = notificationClass.getMethod(mapping.notificationGetInstance, int.class);
            Method addObserver = notificationClass.getMethod(mapping.notificationAddObserver, delegateClass, int.class);
            int maxAccounts = mapping.maxAccounts;

            for (int account = 0; account < maxAccounts; account++) {
                if (REGISTERED_ACCOUNTS.contains(account)) continue;
                try {
                    Object center = getInstance.invoke(null, account);
                    Object observer = Proxy.newProxyInstance(loader, new Class<?>[]{delegateClass},
                            new NotificationHandler(account, mapping.eventId, mapping));
                    addObserver.invoke(center, observer, mapping.eventId);
                    OBSERVERS.add(observer);
                    REGISTERED_ACCOUNTS.add(account);
                } catch (Throwable accountError) {
                    // Keep successful account registrations and retry missing slots only.
                    // Surface the failure class: otherwise a broken account slot looks like
                    // a healthy listener with fewer accounts and is impossible to diagnose
                    // without ADB/logcat.
                    lastAccountRegistrationError = unwrap(accountError).getClass().getSimpleName();
                }
            }
            installed = REGISTERED_ACCOUNTS.size() >= maxAccounts;
            if (!installed) {
                String status = "Listener partially registered: " + REGISTERED_ACCOUNTS.size() + "/" + maxAccounts + " accounts";
                if (!lastAccountRegistrationError.isEmpty()) status += "; last error: " + lastAccountRegistrationError;
                updateRuntimeStatus(status);
                scheduleInstallRetry(profile);
            } else {
                installRetryCount = 0;
                lastAccountRegistrationError = "";
                updateRuntimeStatus("Ready — listening on " + REGISTERED_ACCOUNTS.size() + " Telegram accounts");
            }
        } catch (Throwable error) {
            // A version mismatch must never be allowed to interrupt Telegram startup.
            installed = false;
            updateRuntimeStatus("Listener setup failed: " + unwrap(error).getClass().getSimpleName());
            scheduleInstallRetry(profile);
        }
    }

    private static ThreadPoolExecutor createQueue(final String name, int capacity) {
        return new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS,
                new ArrayBlockingQueue<Runnable>(capacity), command -> {
                    Thread thread = new Thread(command, name);
                    thread.setPriority(Thread.NORM_PRIORITY - 1);
                    return thread;
                }, new ThreadPoolExecutor.AbortPolicy());
    }

    private static void scheduleInstallRetry(final int profile) {
        if (installRetryCount >= MAX_INSTALL_RETRIES) return;
        installRetryCount++;
        MAIN.postDelayed(new Runnable() {
            @Override public void run() { MorpheForwardingRuntime.installInternal(profile); }
        }, 15000L);
    }

    private static void updateRuntimeStatus(String status) {
        SharedPreferencesForwardingRuleStore current = store;
        if (current != null) current.setRuntimeStatus(status);
    }

    private static Context applicationContext(int profile) {
        RuntimeProfile mapping = RuntimeProfile.forId(profile);
        try {
            Class<?> appClass = Class.forName(mapping.applicationClass);
            Field field = appClass.getField(mapping.applicationContextField);
            Object value = field.get(null);
            return value instanceof Context ? (Context) value : null;
        } catch (Throwable ignored) { return null; }
    }

    private static boolean isSecretDialog(long dialogId, RuntimeProfile mapping, ClassLoader loader) {
        try {
            // Telegram 13.3.1's fork-specific R8 pass no longer exposes the old
            // DialogObject helper under i5/h5. Secret dialog IDs are encoded in
            // the upper 32 bits; normal user/group/channel dialog IDs are not.
            if (mapping.dialogIdClass == null || mapping.dialogIdClass.isEmpty()) {
                // Telegram encodes encrypted-chat dialog IDs with a positive, non-zero
                // high 32-bit component. Ordinary group/channel dialog IDs are negative
                // (sign-extended), so testing only the high bits incorrectly classifies
                // every group and channel as a secret chat and silently drops automation.
                return dialogId > 0L && (dialogId >> 32) != 0L;
            }
            Class<?> type = Class.forName(mapping.dialogIdClass, false, loader);
            Method method = type.getMethod(mapping.dialogIdMethod, long.class);
            return Boolean.TRUE.equals(method.invoke(null, dialogId));
        } catch (Throwable error) {
            // Fail closed: if this client variant's secret-chat predicate cannot be resolved,
            // do not pass the message to the automation engine. Surface the reason in Settings.
            if (SECRET_FILTER_ERROR_REPORTED.compareAndSet(false, true)) {
                updateRuntimeStatus("Safety filter unavailable; automation paused: " + unwrap(error).getClass().getSimpleName());
            }
            return true;
        }
    }

    private static final class NotificationHandler implements InvocationHandler {
        private final int accountId;
        private final int eventId;
        private final RuntimeProfile mapping;

        NotificationHandler(int accountId, int eventId, RuntimeProfile mapping) {
            this.accountId = accountId;
            this.eventId = eventId;
            this.mapping = mapping;
        }

        @Override public Object invoke(Object proxy, Method method, Object[] args) {
            if ("toString".equals(method.getName())) return "MorpheNotificationObserver";
            if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
            if ("equals".equals(method.getName())) return proxy == (args == null ? null : args[0]);
            if (!"didReceivedNotification".equals(method.getName()) || args == null || args.length < 3) return null;
            try {
                int id = ((Number) args[0]).intValue();
                if (id != eventId || !(args[2] instanceof Object[])) return null;
                Object[] payload = (Object[]) args[2];
                if (payload.length < 2 || !(payload[0] instanceof Number)) {
                    if (PAYLOAD_ERROR_REPORTED.compareAndSet(false, true)) {
                        updateRuntimeStatus("Listener active but Telegram message payload was unexpected");
                    }
                    return null;
                }
                // NotificationCenter.didReceivedNewMessages (event 1) carries
                // [dialogId, ArrayList<MessageObject>, isBroadcast, scheduled, ...].
                // Index 2 is the broadcast flag, NOT the scheduled flag. Filtering it
                // suppressed channel/broadcast updates and silently stopped automation
                // for those sources. Only skip scheduled messages at index 3.
                // Accept a single MessageObject as well for alternate update paths.
                if (payload.length > 3 && Boolean.TRUE.equals(payload[3])) return null;
                long dialogId = ((Number) payload[0]).longValue();
                List<?> messages;
                if (payload[1] instanceof List) {
                    messages = (List<?>) payload[1];
                } else if (isNativeMessageObject(payload[1], mapping)) {
                    messages = Collections.singletonList(payload[1]);
                } else {
                    if (PAYLOAD_ERROR_REPORTED.compareAndSet(false, true)) {
                        updateRuntimeStatus("Listener active but Telegram message object was unexpected");
                    }
                    return null;
                }
                if (messages.isEmpty()) return null;
                Object firstMessage = null;
                for (Object candidate : messages) if (candidate != null) { firstMessage = candidate; break; }
                if (firstMessage == null) return null;
                ClassLoader loader = firstMessage.getClass().getClassLoader();
                if (isSecretDialog(dialogId, mapping, loader)) return null;
                int converted = 0;
                for (Object nativeMessage : messages) {
                    ForwardingMessage message = toForwardingMessage(accountId, dialogId, nativeMessage, mapping);
                    if (message != null) {
                        converted++;
                        if (coordinator != null) coordinator.onIncomingMessage(message);
                    }
                }
                if (converted > 0 && FIRST_INCOMING_REPORTED.compareAndSet(false, true)) {
                    updateRuntimeStatus("Listener active — Telegram incoming messages detected");
                }
            } catch (Throwable error) {
                if (PAYLOAD_ERROR_REPORTED.compareAndSet(false, true)) {
                    updateRuntimeStatus("Listener update failed: " + unwrap(error).getClass().getSimpleName());
                }
            }
            return null;
        }
    }

    private static boolean isNativeMessageObject(Object value, RuntimeProfile mapping) {
        if (value == null) return false;
        try {
            value.getClass().getField(mapping.messageOwnerField);
            return true;
        } catch (Throwable ignored) { return false; }
    }

    private static ForwardingMessage toForwardingMessage(int accountId, long dialogId,
                                                           Object messageObject, RuntimeProfile mapping) {
        if (messageObject == null) return null;
        try {
            Class<?> messageType = messageObject.getClass();
            Object owner = messageType.getField(mapping.messageOwnerField).get(messageObject);
            if (owner == null) return null;
            Class<?> ownerType = owner.getClass();
            if (ownerType.getField("out").getBoolean(owner)) return null;
            if (ownerType.getField("action").get(owner) != null) return null;
            boolean protectedContent = ownerType.getField("noforwards").getBoolean(owner);
            if (isSecretDialog(dialogId, mapping, messageType.getClassLoader())) return null;

            Object idValue = ownerType.getField("id").get(owner);
            int messageId = ((Number) idValue).intValue();
            CharSequence richText = null;
            try {
                Object value = messageType.getField(mapping.messageTextField).get(messageObject);
                if (value instanceof CharSequence) richText = (CharSequence) value;
            } catch (Throwable ignored) { }
            String text = richText == null ? "" : richText.toString();
            if (text.isEmpty()) {
                Object raw = ownerType.getField("message").get(owner);
                if (raw != null) text = String.valueOf(raw);
            }
            // FORWARD follows Telegram's own eligibility predicate. COPY remains a
            // separate text-resend operation and does not claim to be a native forward.
            boolean canForward = false;
            try {
                canForward = Boolean.TRUE.equals(messageType.getMethod(mapping.messageCanForwardMethod).invoke(messageObject));
            } catch (Throwable ignored) { /* fail closed for forward mode */ }
            // The Bypass content restrictions patch changes Telegram's native noforwards
            // predicates/field reads. Trust MessageObject.canForwardMessage() after that
            // patch: it retains Telegram's other eligibility checks while allowing
            // protected channel messages. Do not reapply the raw noforwards bit here.
            return new ForwardingMessage(accountId, dialogId, messageId, text,
                    false, false, false, protectedContent, canForward,
                    messageObject);
        } catch (Throwable error) {
            if (MESSAGE_ADAPTER_ERROR_REPORTED.compareAndSet(false, true)) {
                updateRuntimeStatus("Message adapter failed: " + unwrap(error).getClass().getSimpleName());
            }
            return null;
        }
    }


    private static Field findField(Class<?> type, String name) {
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            try { return c.getDeclaredField(name); } catch (Throwable ignored) { }
        }
        return null;
    }

    private static final class NativeGateway implements TelegramMessageGateway {
        private final RuntimeProfile mapping;
        NativeGateway(int profile) { mapping = RuntimeProfile.forId(profile); }

        @Override public void forward(final int accountId, final ForwardingMessage source,
                                      final long destinationChatId, final boolean showSenderName,
                                      final ResultCallback callback) {
            // FORWARD alone uses Telegram's native forwardMessages RPC. The copy path
            // below never enters this method or the q0(...) overload.
            enqueueNativeForward(accountId, source, destinationChatId,
                    false, !showSenderName, callback);
        }

        @Override public void copy(final int accountId, final ForwardingMessage source,
                                   final long destinationChatId, final boolean showSenderName,
                                   final ResultCallback callback) {
            // COPY is a new outgoing message, not a forward with drop_author set.
            // Current R8 webpage previews use Telegram's c0(MessageObject, ...) new-message
            // composer so the original TL_webPage and entities are retained. Plain text
            // continues through a0(...); media continues through its separate params path.
            dispatchOnMain(new Runnable() {
                @Override public void run() {
                    try {
                        Object nativeMessage = source.getNativeMessage();
                        if (nativeMessage == null) throw new IllegalStateException("Original Telegram message is unavailable");
                        ClassLoader loader = nativeMessage.getClass().getClassLoader();
                        Class<?> helperClass = Class.forName(mapping.sendHelperClass, false, loader);
                        if (mapping.currentR8 && (isWebPagePreview(nativeMessage, mapping)
                                || hasNativeEntities(nativeMessage, mapping))) {
                            // Webpage previews and messages with native formatting/link entities
                            // must use Telegram's MessageObject composer. The CharSequence-only
                            // a0 path can lose TL_messageEntityTextUrl targets. c0 builds a fresh
                            // outgoing message; it is not forwardMessages/q0 and does not retain sender metadata.
                            Object helper = helperClass.getMethod(mapping.sendHelperInstance, int.class)
                                    .invoke(null, accountId);
                            if (!tryNativeWebPageCopy(helperClass, helper, nativeMessage,
                                    destinationChatId, mapping, loader)) {
                                throw new NoSuchMethodException("Native webpage-preview COPY method not found");
                            }
                        } else if (mapping.currentR8 && isTextOrWebPagePreview(nativeMessage, mapping)) {
                            // Plain text COPY remains on Telegram's existing text composer.
                            // This path is already working and is intentionally not changed.
                            CharSequence richText = readNativeRichText(nativeMessage, mapping);
                            if (richText == null || richText.length() == 0) {
                                throw new IllegalStateException("Original Telegram rich text is unavailable for COPY");
                            }
                            Class<?> accountClass = Class.forName(mapping.accountInstanceClass, false, loader);
                            Object account = accountClass.getMethod(mapping.accountInstanceFactory, int.class).invoke(null, accountId);
                            Method textCopy = helperClass.getDeclaredMethod(mapping.copyMethod, accountClass,
                                    CharSequence.class, long.class, long.class, boolean.class, int.class, int.class);
                            if (!java.lang.reflect.Modifier.isStatic(textCopy.getModifiers())) {
                                throw new NoSuchMethodException("Telegram native text composer is not static: " + mapping.copyMethod);
                            }
                            textCopy.setAccessible(true);
                            // Verified from Telegram 13.3.1 DEX: a0(AccountInstance,
                            // CharSequence, long dialogId, long topicId, boolean notify,
                            // int scheduleDate, int scheduleRepeatPeriod). The destination
                            // dialogId must be the FIRST long argument; ordinary chats use
                            // topicId=0 as the SECOND long argument.
                            textCopy.invoke(null, account, richText, destinationChatId, 0L, false, 0, 0);
                        } else {
                            // Native media COPY still uses the independent new-message
                            // SendMessageParams path. It never falls back to q0/forwardMessages.
                            Object helper = helperClass.getMethod(mapping.sendHelperInstance, int.class).invoke(null, accountId);
                            if (mapping.currentR8) {
                                if (!trySendParamsCopy(helperClass, helper, nativeMessage,
                                        destinationChatId, source.getSourceChatId())) {
                                    throw new NoSuchMethodException("Native media SendMessageParams copy factory not found or ambiguous");
                                }
                            } else if (!tryLegacySendParamsCopy(helperClass, helper, nativeMessage, destinationChatId)) {
                                throw new NoSuchMethodException("Legacy SendMessageParams copy factory not found");
                            }
                        }
                        if (callback != null) callback.onQueued();
                    } catch (Throwable error) {
                        updateRuntimeStatus("Copy request failed: " + unwrap(error).getClass().getSimpleName());
                        if (callback != null) callback.onFailure(unwrap(error));
                    }
                }
            }, callback, "Copy");
        }

        private void enqueueNativeForward(final int accountId, final ForwardingMessage source,
                                          final long destinationChatId, final boolean dropMedia,
                                          final boolean dropAuthor, final ResultCallback callback) {
            dispatchOnMain(new Runnable() {
                @Override public void run() {
                    try {
                        Object nativeMessage = source.getNativeMessage();
                        if (nativeMessage == null) throw new IllegalStateException("Original Telegram message is unavailable");
                        ClassLoader loader = nativeMessage.getClass().getClassLoader();
                        Class<?> helperClass = Class.forName(mapping.sendHelperClass, false, loader);
                        Object helper = mapping.currentR8
                                ? helperClass.getMethod(mapping.sendHelperInstance, int.class).invoke(null, accountId)
                                : helperClass.getMethod("getInstance", int.class).invoke(null, accountId);
                        Method method = mapping.currentR8
                                ? currentForwardMethod(helperClass, mapping)
                                : legacyForwardMethod(helperClass, nativeMessage.getClass());
                        ArrayList<Object> messages = new ArrayList<>(Collections.singletonList(nativeMessage));
                        // This method is FORWARD-only. The current R8 q0 overload has
                        // separate dropMedia and dropAuthor arguments; COPY never reaches it.
                        boolean firstFlag = dropAuthor;
                        boolean secondFlag = mapping.currentR8 ? dropMedia : false;
                        method.invoke(helper, messages, destinationChatId,
                                firstFlag, secondFlag, false, 0, 0, nativeMessage, -1, 0L, 0L, null);
                        // q0 returns a local message identifier (Int), not a Boolean
                        // success flag. Do not reject zero/negative IDs: Telegram's send
                        // queue may legitimately use them. A thrown exception is the
                        // reliable indication that invocation failed before local enqueue.
                        if (callback != null) callback.onQueued();
                    } catch (Throwable error) {
                        updateRuntimeStatus("Forward request failed: " + unwrap(error).getClass().getSimpleName());
                        if (callback != null) callback.onFailure(unwrap(error));
                    }
                }
            }, callback, "Forward");
        }

        private static CharSequence readNativeRichText(Object nativeMessage, RuntimeProfile mapping) {
            try {
                Field field = findField(nativeMessage.getClass(), mapping.messageTextField);
                if (field == null) return null;
                field.setAccessible(true);
                Object value = field.get(nativeMessage);
                return value instanceof CharSequence ? (CharSequence) value : null;
            } catch (Throwable ignored) { return null; }
        }

        private static boolean isWebPagePreview(Object nativeMessage, RuntimeProfile mapping) {
            try {
                Field ownerField = findField(nativeMessage.getClass(), mapping.messageOwnerField);
                if (ownerField == null) return false;
                ownerField.setAccessible(true);
                Object owner = ownerField.get(nativeMessage);
                if (owner == null) return false;
                Field mediaField = findField(owner.getClass(), "media");
                if (mediaField == null) return false;
                mediaField.setAccessible(true);
                Object media = mediaField.get(owner);
                if (media == null) return false;
                Field webpageField = findField(media.getClass(), "webpage");
                if (webpageField == null) return false;
                webpageField.setAccessible(true);
                return webpageField.get(media) != null;
            } catch (Throwable ignored) { return false; }
        }

        /** Returns true when the source TL_message carries formatting or link entities. */
        private static boolean hasNativeEntities(Object nativeMessage, RuntimeProfile mapping) {
            try {
                Field ownerField = findField(nativeMessage.getClass(), mapping.messageOwnerField);
                if (ownerField == null) return false;
                ownerField.setAccessible(true);
                Object owner = ownerField.get(nativeMessage);
                if (owner == null) return false;
                Field entitiesField = findField(owner.getClass(), "entities");
                if (entitiesField == null) return false;
                entitiesField.setAccessible(true);
                Object entities = entitiesField.get(owner);
                return entities instanceof List && !((List<?>) entities).isEmpty();
            } catch (Throwable ignored) { return false; }
        }

        /**
         * Uses Telegram's native MessageObject-to-new-message composer. Resolve c0 by its
         * structural DEX signature instead of RuntimeProfile.suggestionParamsClass: that
         * profile field does not match the final c0 parameter in the Telegram 13.3.1 APK.
         * The method takes (MessageObject, long, long, long, Suggestions); the first long
         * is destination dialogId and the remaining two are zero for an immediate send.
         */
        private static boolean tryNativeWebPageCopy(Class<?> helperClass, Object helper,
                                                     Object nativeMessage, long destinationChatId,
                                                     RuntimeProfile mapping, ClassLoader loader) throws Exception {
            Method copy = null;
            for (Method candidate : helperClass.getDeclaredMethods()) {
                Class<?>[] p = candidate.getParameterTypes();
                if (!"c0".equals(candidate.getName()) || p.length != 5
                        || p[0] != nativeMessage.getClass()
                        || p[1] != long.class || p[2] != long.class || p[3] != long.class
                        || p[4].isPrimitive()) {
                    continue;
                }
                if (copy != null) {
                    throw new IllegalStateException("Ambiguous native MessageObject COPY composer");
                }
                copy = candidate;
            }
            if (copy == null) return false;
            copy.setAccessible(true);
            copy.invoke(helper, nativeMessage, destinationChatId, 0L, 0L, null);
            return true;
        }

        private static boolean isTextOrWebPagePreview(Object nativeMessage, RuntimeProfile mapping) {
            try {
                Field ownerField = findField(nativeMessage.getClass(), mapping.messageOwnerField);
                if (ownerField == null) return false;
                ownerField.setAccessible(true);
                Object owner = ownerField.get(nativeMessage);
                if (owner == null) return false;
                Field mediaField = findField(owner.getClass(), "media");
                if (mediaField == null) return true;
                mediaField.setAccessible(true);
                Object media = mediaField.get(owner);
                if (media == null) return true;
                // Telegram's 13.3.1 generated type is TL_messageMediaWebPage. Keep
                // this explicit because R8 renames SendMessagesHelper/MessageObject but
                // leaves the generated TLRPC media type and its webpage field intact.
                for (Class<?> type = media.getClass(); type != null && type != Object.class;
                     type = type.getSuperclass()) {
                    String mediaName = type.getName().toLowerCase(java.util.Locale.ROOT);
                    if (mediaName.contains("tl_messagemediawebpage") || mediaName.contains("webpage")) {
                        return true;
                    }
                    Field webpageField = findField(type, "webpage");
                    if (webpageField != null) {
                        webpageField.setAccessible(true);
                        return webpageField.get(media) != null;
                    }
                }
                return false;
            } catch (Throwable ignored) { return false; }
        }

        /** Finds the current R8-renamed SendMessageParams factory by its native input type. */
        private static boolean trySendParamsCopy(Class<?> helperClass, Object helper, Object nativeMessage,
                                                  long destinationChatId, long sourceDialogId) throws Exception {
            Class<?> messageClass = nativeMessage.getClass();
            Class<?> paramsClass = null;
            Method factory = null;
            for (Class<?> nested : helperClass.getDeclaredClasses()) {
                for (Method candidate : nested.getDeclaredMethods()) {
                    if (!java.lang.reflect.Modifier.isStatic(candidate.getModifiers())
                            || !"of".equals(candidate.getName()) || candidate.getParameterTypes().length != 1
                            || !candidate.getParameterTypes()[0].isAssignableFrom(messageClass)) continue;
                    if (factory != null) throw new IllegalStateException("Ambiguous native SendMessageParams factory");
                    factory = candidate;
                    paramsClass = nested;
                }
            }
            if (factory == null || paramsClass == null) return false;
            factory.setAccessible(true);
            Object params = factory.invoke(null, nativeMessage);
            Field peer = findField(paramsClass, "peer");
            if (peer != null && peer.getType() == long.class) {
                peer.setAccessible(true);
                peer.setLong(params, destinationChatId);
            } else {
                // Some builds rename the peer field. Only rewrite a unique long field
                // whose original value equals the source dialog; never guess among fields.
                Field candidate = null;
                for (Class<?> type = paramsClass; type != null && type != Object.class; type = type.getSuperclass()) {
                    for (Field field : type.getDeclaredFields()) {
                        if (field.getType() != long.class) continue;
                        field.setAccessible(true);
                        if (field.getLong(params) == sourceDialogId) {
                            if (candidate != null) throw new IllegalStateException("Ambiguous source dialog field in copy parameters");
                            candidate = field;
                        }
                    }
                }
                if (candidate == null) return false;
                candidate.setLong(params, destinationChatId);
            }
            Method send = null;
            for (Method candidate : helperClass.getMethods()) {
                if ("sendMessage".equals(candidate.getName())
                        && candidate.getParameterTypes().length == 1
                        && candidate.getParameterTypes()[0] == paramsClass) {
                    if (send != null) throw new IllegalStateException("Ambiguous native sendMessage(params) overload");
                    send = candidate;
                }
            }
            if (send == null) return false;
            send.setAccessible(true);
            send.invoke(helper, params);
            return true;
        }

        private static boolean tryLegacySendParamsCopy(Class<?> helperClass, Object helper,
                                                        Object nativeMessage, long destinationChatId) throws Exception {
            ClassLoader loader = nativeMessage.getClass().getClassLoader();
            Class<?> paramsClass = Class.forName("org.telegram.messenger.SendMessagesHelper$SendMessageParams", false, loader);
            Method factory = paramsClass.getMethod("of", nativeMessage.getClass());
            Object params = factory.invoke(null, nativeMessage);
            Field peer = findField(paramsClass, "peer");
            if (peer == null || peer.getType() != long.class) return false;
            peer.setAccessible(true);
            peer.setLong(params, destinationChatId);
            Method send = helperClass.getMethod("sendMessage", paramsClass);
            send.invoke(helper, params);
            return true;
        }

        private static Method currentForwardMethod(Class<?> helperClass,
                                                   RuntimeProfile mapping) throws NoSuchMethodException, ClassNotFoundException {
            ClassLoader loader = helperClass.getClassLoader();
            Class<?> forwardOptionsClass = Class.forName(mapping.forwardOptionsClass, false, loader);
            // Telegram 13.3.1 q0 has the verified 12-parameter R8 signature:
            // ArrayList, dialogId, 3 flags, 2 ints, MessageObject, int, 2 longs,
            // then the fork-specific topic/reply descriptor (oj / kj).
            // Do not retain the obsolete 13.2.2 two-descriptor overload assumption.
            Class<?> messageClass = Class.forName(mapping.currentR8
                    ? (mapping.applicationClass.endsWith(".t0") ? "org.telegram.messenger.jj" : "org.telegram.messenger.fj")
                    : "org.telegram.messenger.MessageObject", false, loader);
            Method method = helperClass.getMethod(mapping.forwardMethod, ArrayList.class, long.class,
                    boolean.class, boolean.class, boolean.class, int.class, int.class,
                    messageClass, int.class, long.class, long.class, forwardOptionsClass);
            method.setAccessible(true);
            return method;
        }

        private static Method legacyForwardMethod(Class<?> helperClass, Class<?> messageClass) throws NoSuchMethodException {
            for (Method method : helperClass.getMethods()) {
                Class<?>[] p = method.getParameterTypes();
                if (!"sendMessage".equals(method.getName()) || p.length != 12) continue;
                if (p[0] == ArrayList.class && p[1] == long.class && p[2] == boolean.class
                        && p[3] == boolean.class && p[4] == boolean.class && p[5] == int.class
                        && p[6] == int.class && p[7].isAssignableFrom(messageClass)
                        && p[8] == int.class && p[9] == long.class && p[10] == long.class) {
                    method.setAccessible(true);
                    return method;
                }
            }
            throw new NoSuchMethodException("Legacy native SendMessagesHelper forward overload not found");
        }

        private static void dispatchOnMain(Runnable runnable, ResultCallback callback, String operation) {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                runnable.run();
            } else if (!MAIN.post(runnable)) {
                IllegalStateException rejected = new IllegalStateException(
                        "Telegram main-thread queue rejected the " + operation.toLowerCase(java.util.Locale.ROOT) + " request");
                updateRuntimeStatus(rejected.getMessage());
                if (callback != null) callback.onFailure(rejected);
            }
        }
    }

    private static Throwable unwrap(Throwable error) {
        return error instanceof InvocationTargetException && ((InvocationTargetException) error).getCause() != null
                ? ((InvocationTargetException) error).getCause() : error;
    }

    private static final class RuntimeProfile {
        final boolean currentR8;
        final String applicationClass, applicationContextField;
        final String notificationClass, delegateClass, notificationGetInstance, notificationAddObserver;
        final int eventId, maxAccounts;
        final String messageOwnerField, messageTextField, messageCanForwardMethod, dialogIdClass, dialogIdMethod;
        final String sendHelperClass, sendHelperInstance, forwardMethod, forwardOptionsClass, suggestionParamsClass;
        final String accountInstanceClass, accountInstanceFactory, copyMethod, sendParamsClass;

        RuntimeProfile(boolean currentR8, String applicationClass, String applicationContextField,
                       String notificationClass, String delegateClass, String notificationGetInstance,
                       String notificationAddObserver, int eventId, int maxAccounts,
                       String messageOwnerField, String messageTextField, String messageCanForwardMethod,
                       String dialogIdClass, String dialogIdMethod, String sendHelperClass,
                       String sendHelperInstance, String forwardMethod, String forwardOptionsClass,
                       String suggestionParamsClass, String accountInstanceClass, String accountInstanceFactory, String copyMethod,
                       String sendParamsClass) {
            this.currentR8 = currentR8;
            this.applicationClass = applicationClass;
            this.applicationContextField = applicationContextField;
            this.notificationClass = notificationClass;
            this.delegateClass = delegateClass;
            this.notificationGetInstance = notificationGetInstance;
            this.notificationAddObserver = notificationAddObserver;
            this.eventId = eventId;
            this.maxAccounts = maxAccounts;
            this.messageOwnerField = messageOwnerField;
            this.messageTextField = messageTextField;
            this.messageCanForwardMethod = messageCanForwardMethod;
            this.dialogIdClass = dialogIdClass;
            this.dialogIdMethod = dialogIdMethod;
            this.sendHelperClass = sendHelperClass;
            this.sendHelperInstance = sendHelperInstance;
            this.forwardMethod = forwardMethod;
            this.forwardOptionsClass = forwardOptionsClass;
            this.suggestionParamsClass = suggestionParamsClass;
            this.accountInstanceClass = accountInstanceClass;
            this.accountInstanceFactory = accountInstanceFactory;
            this.copyMethod = copyMethod;
            this.sendParamsClass = sendParamsClass;
        }

        static RuntimeProfile forId(int id) {
            // 13.3.1 exact targets verified from Telegram 73461 and Web 73469 DEX:
            // Application context: t0.b / s0.b; NotificationCenter: ss in both APKs;
            // delegate: ns in both APKs; didReceivedNewMessages event ID: 1; ss.l0 (49) is unrelated.
            // MessageObject: jj / fj; selected account is
            // UserConfig y10.t0 / a20.t0. Native send helper is nz / pz.
            if (id == PROFILE_TELEGRAM_ANDROID_1331) return new RuntimeProfile(true,
                    "org.telegram.messenger.t0", "b", "org.telegram.messenger.ss",
                    "org.telegram.messenger.ns", "f", "b", 1, 4, "k", "v", "w",
                    "", "", "org.telegram.messenger.nz", "C", "q0", "org.telegram.messenger.oj", "",
                    "org.telegram.messenger.a", "a", "a0", null);
            if (id == PROFILE_TELEGRAM_WEB_1331) return new RuntimeProfile(true,
                    "org.telegram.messenger.s0", "b", "org.telegram.messenger.ss",
                    "org.telegram.messenger.ns", "f", "b", 1, 4, "k", "v", "w",
                    "", "", "org.telegram.messenger.pz", "C", "q0", "org.telegram.messenger.kj", "",
                    "org.telegram.messenger.a", "a", "a0", null);
            return new RuntimeProfile(false,
                    "org.telegram.messenger.ApplicationLoader", "applicationContext",
                    "org.telegram.messenger.NotificationCenter",
                    "org.telegram.messenger.NotificationCenter$NotificationCenterDelegate",
                    "getInstance", "addObserver", 1, 4, "messageOwner", "messageText", "canForwardMessage",
                    "org.telegram.messenger.DialogObject", "isEncryptedDialog",
                    "org.telegram.messenger.SendMessagesHelper", "getInstance", "sendMessage", "", "",
                    "", "", "", "org.telegram.messenger.SendMessagesHelper$SendMessageParams");
        }
    }
}
