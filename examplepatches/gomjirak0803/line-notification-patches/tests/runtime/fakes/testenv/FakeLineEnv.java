package testenv;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Shared state for fake LINE reflection APIs and fake SQLite tables during JVM tests. */
public final class FakeLineEnv {
    public static final class ChatRow {
        public String name;
        public String readUp;
        public int unread;
        public boolean nativeMuted;

        public ChatRow(String name, String readUp, int unread, boolean nativeMuted) {
            this.name = name;
            this.readUp = readUp;
            this.unread = unread;
            this.nativeMuted = nativeMuted;
        }
    }

    public static final class MessageRow {
        public final long id;
        public final int type;
        public final String chatId;
        public final String serverId;
        public final long createdTime;
        public final String fromMid;
        public final String content;
        public final Integer attType;
        public final String parameter;
        public final String locationName;
        public final String locationAddress;
        public final String localUri;

        public MessageRow(long id, int type, String chatId, String serverId, long createdTime,
                          String fromMid, String content, Integer attType, String parameter,
                          String locationName, String locationAddress, String localUri) {
            this.id = id;
            this.type = type;
            this.chatId = chatId;
            this.serverId = serverId;
            this.createdTime = createdTime;
            this.fromMid = fromMid;
            this.content = content;
            this.attType = attType;
            this.parameter = parameter;
            this.locationName = locationName;
            this.locationAddress = locationAddress;
            this.localUri = localUri;
        }
    }

    public static final class ContactRow {
        public final String displayName;
        public final String picturePath;

        public ContactRow(String displayName, String picturePath) {
            this.displayName = displayName;
            this.picturePath = picturePath;
        }
    }

    public static final class NativeMuteCall {
        public final String chatId;
        public final boolean desiredEnabled;

        public NativeMuteCall(String chatId, boolean desiredEnabled) {
            this.chatId = chatId;
            this.desiredEnabled = desiredEnabled;
        }
    }

    public static final class GlideRequestRecord {
        public final Object model;
        public final co.l strategy;
        public final Boolean onlyCache;
        public final int overrideWidth;
        public final int overrideHeight;
        public final boolean circleCrop;
        public final int submitWidth;
        public final int submitHeight;

        public GlideRequestRecord(Object model, co.l strategy, Boolean onlyCache,
                                  int overrideWidth, int overrideHeight, boolean circleCrop,
                                  int submitWidth, int submitHeight) {
            this.model = model;
            this.strategy = strategy;
            this.onlyCache = onlyCache;
            this.overrideWidth = overrideWidth;
            this.overrideHeight = overrideHeight;
            this.circleCrop = circleCrop;
            this.submitWidth = submitWidth;
            this.submitHeight = submitHeight;
        }
    }

    public static volatile String activeAccount = "u_acc_1";
    public static volatile boolean previewsAllowed = true;
    public static volatile boolean throwOnPreviewsAllowed = false;
    public static volatile boolean throwOnMessageQuery = false;
    public static volatile boolean nextNativeMuteSuccess = true;
    public static volatile boolean deferNativeMuteCallback = false;
    public static volatile boolean deferNativeReadCallback = false;
    public static volatile int nativeReadSubscribeCalls = 0;
    public static volatile Runnable onAvatarLoad = null;
    public static volatile Runnable onPreviewsAllowedCheck = null;
    public static volatile Runnable onMutedCheck = null;
    public static final Map<String, ChatRow> CHATS = new HashMap<String, ChatRow>();
    public static final List<MessageRow> MESSAGES = new ArrayList<MessageRow>();
    public static final Map<String, ContactRow> CONTACTS = new HashMap<String, ContactRow>();
    public static final List<NativeMuteCall> NATIVE_MUTE_CALLS = new ArrayList<NativeMuteCall>();
    public static final List<j34.l> READ_CLEANUP_CALLS = new ArrayList<j34.l>();
    public static final List<GlideRequestRecord> GLIDE_REQUESTS = new ArrayList<GlideRequestRecord>();
    public static final List<String> QUERIES = new ArrayList<String>();
    public static int chatListRefreshCount = 0;
    private static long nextRowId = 1L;
    private static kotlin.coroutines.Continuation pendingContinuation;
    private static String pendingMuteChat;
    private static boolean pendingMuteDesired;
    private static java.util.concurrent.CountDownLatch deferredMuteInstalled;
    private static q08.b pendingReadObserver;
    private static String pendingReadChat;

    private FakeLineEnv() {}

    public static synchronized void reset() {
        activeAccount = "u_acc_1";
        previewsAllowed = true;
        throwOnPreviewsAllowed = false;
        throwOnMessageQuery = false;
        nextNativeMuteSuccess = true;
        deferNativeMuteCallback = false;
        deferNativeReadCallback = false;
        nativeReadSubscribeCalls = 0;
        onAvatarLoad = null;
        onPreviewsAllowedCheck = null;
        onMutedCheck = null;
        CHATS.clear();
        MESSAGES.clear();
        CONTACTS.clear();
        NATIVE_MUTE_CALLS.clear();
        READ_CLEANUP_CALLS.clear();
        GLIDE_REQUESTS.clear();
        QUERIES.clear();
        chatListRefreshCount = 0;
        nextRowId = 1L;
        pendingContinuation = null;
        pendingMuteChat = null;
        deferredMuteInstalled = null;
        pendingReadObserver = null;
        pendingReadChat = null;
    }

    public static synchronized java.util.concurrent.CountDownLatch prepareDeferredNativeMute() {
        deferNativeMuteCallback = true;
        deferredMuteInstalled = new java.util.concurrent.CountDownLatch(1);
        return deferredMuteInstalled;
    }

    public static synchronized List<NativeMuteCall> getNativeMuteCallsSnapshot() {
        return new ArrayList<NativeMuteCall>(NATIVE_MUTE_CALLS);
    }

    public static synchronized List<String> getQueriesSnapshot() {
        return new ArrayList<String>(QUERIES);
    }

    public static synchronized void addMessage(String chatId, String serverId, long createdTime,
                                               String fromMid, String content, Integer attType, String parameter) {
        MESSAGES.add(new MessageRow(nextRowId++, 1, chatId, serverId, createdTime, fromMid,
                content, attType, parameter, null, null, null));
    }

    public static synchronized Object handleNativeMuteCall(String chatId, boolean desiredEnabled,
                                                           kotlin.coroutines.Continuation cont) {
        NATIVE_MUTE_CALLS.add(new NativeMuteCall(chatId, desiredEnabled));
        if (deferNativeMuteCallback) {
            pendingContinuation = cont;
            pendingMuteChat = chatId;
            pendingMuteDesired = desiredEnabled;
            if (deferredMuteInstalled != null) {
                deferredMuteInstalled.countDown();
            }
            return rm8.a.COROUTINE_SUSPENDED;
        }
        if (nextNativeMuteSuccess) {
            ChatRow row = CHATS.get(chatId);
            if (row != null) row.nativeMuted = !desiredEnabled;
            return ln3.u.c.a;
        }
        return new Object();
    }

    public static synchronized void completeDeferredNativeMute(boolean success) {
        kotlin.coroutines.Continuation cont = pendingContinuation;
        String chatId = pendingMuteChat;
        boolean desired = pendingMuteDesired;
        pendingContinuation = null;
        pendingMuteChat = null;
        if (cont != null) {
            if (success) {
                ChatRow row = CHATS.get(chatId);
                if (row != null) row.nativeMuted = !desired;
                cont.resumeWith(ln3.u.c.a);
            } else {
                cont.resumeWith(new Object());
            }
        }
    }

    public static synchronized void recordReadCleanup(j34.l[] targets) {
        if (targets == null) return;
        for (j34.l target : targets) {
            if (target != null) READ_CLEANUP_CALLS.add(target);
        }
    }

    public static synchronized List<j34.l> getReadCleanupCallsSnapshot() {
        return new ArrayList<j34.l>(READ_CLEANUP_CALLS);
    }

    public static void handleNativeReadCall(String chatId, q08.b observer) {
        synchronized (FakeLineEnv.class) {
            nativeReadSubscribeCalls++;
        }
        observer.b(new r08.b() {
            @Override public void dispose() {}
        });
        boolean defer;
        synchronized (FakeLineEnv.class) {
            defer = deferNativeReadCallback;
            if (defer) {
                pendingReadObserver = observer;
                pendingReadChat = chatId;
                return;
            }
            ChatRow row = CHATS.get(chatId);
            if (row != null) row.unread = 0;
        }
        observer.onComplete();
    }

    public static void completeDeferredNativeRead(Throwable error) {
        q08.b obs;
        String chatId;
        synchronized (FakeLineEnv.class) {
            obs = pendingReadObserver;
            chatId = pendingReadChat;
            pendingReadObserver = null;
            pendingReadChat = null;
            if (obs != null && error == null) {
                ChatRow row = CHATS.get(chatId);
                if (row != null) row.unread = 0;
            }
        }
        if (obs != null) {
            if (error == null) {
                obs.onComplete();
            } else {
                obs.onError(error);
            }
        }
    }

    public static synchronized void recordGlideRequest(Object model, co.l strategy, Boolean onlyCache,
                                                       int overrideWidth, int overrideHeight, boolean circleCrop,
                                                       int submitWidth, int submitHeight) {
        GLIDE_REQUESTS.add(new GlideRequestRecord(
                model, strategy, onlyCache, overrideWidth, overrideHeight, circleCrop, submitWidth, submitHeight));
    }

    public static synchronized List<GlideRequestRecord> getGlideRequestsSnapshot() {
        return new ArrayList<GlideRequestRecord>(GLIDE_REQUESTS);
    }
}
