/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.SharedPreferences;

import androidx.annotation.Nullable;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Ghost mode: reading a chat or watching a story without telling anyone.
 *
 * <p>Every request Telegram sends passes through one private method of its connection manager, and
 * the patch has that method ask here first. With Ghost mode on, the requests that tell the server a
 * chat was read (private chats, groups, channels, secret chats, comment threads, and a voice or
 * video message played) or a story was seen are dropped before they go out, so the other side never
 * gets the receipt. Telegram's own bookkeeping on this phone runs as usual: the chat still clears
 * its unread count and the story ring still turns grey. Nothing else is touched, and a request of
 * any other kind returns at once without reading a setting.
 *
 * <p>Two more parts hold back what the account says about itself: the typing, recording and
 * uploading status a chat shows, and the online status ({@code account.updateStatus} with offline
 * off). Going offline still goes out, so the account shows as offline. Turning Ghost mode on with
 * its online part, or that part on under Ghost mode, sends every signed-in account offline right
 * away, so nobody sees it online until the server would have timed it out.
 *
 * <p>Opening a channel post, or a channel post forwarded into a chat, counts a view on it. A post
 * someone forwards to just one person counts that person's view, so the view request still goes
 * out under the read receipts part, for the counts, but asks the server not to add this view.
 *
 * <p>Sending a message into a chat tells the server it was read anyway, which this can't change.
 * The newest read kept back in each chat waits here until Telegram restarts (#69). With Read
 * after you reply on, a message sent into that chat lets it out, and the chat list's read receipts
 * button lets out every one the account on screen has. A read sent that way passes the gate once.
 *
 * <p>A broadcast channel's read still goes out. Nobody in a channel sees who read what, so holding
 * it back hid nothing and only left the channel unread on the account's other devices (#65).
 *
 * <p>A chat picked as a Ghost mode exception gets the opposite of the main switch for everything
 * here that names a chat: reads, typing, story views and view counts (#71, {@link GhostChats}). A
 * played voice message's receipt names only the message, so it follows the main switch, and so
 * does online status, which is the account's.
 */
public final class GhostMode {
    private GhostMode() {}

    /** Requests that mark messages read or played for the people who sent them. */
    private static final Set<String> READS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.TLRPC$TL_messages_readHistory",
            "org.telegram.tgnet.TLRPC$TL_channels_readHistory",
            "org.telegram.tgnet.TLRPC$TL_messages_readMessageContents",
            "org.telegram.tgnet.TLRPC$TL_channels_readMessageContents",
            "org.telegram.tgnet.TLRPC$TL_messages_readEncryptedHistory",
            "org.telegram.tgnet.TLRPC$TL_messages_readDiscussion",
            "org.telegram.tgnet.TLRPC$TL_messages_readSavedHistory")));

    /** Requests that tell a story's poster it was seen. */
    private static final Set<String> STORIES = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.tl.TL_stories$TL_stories_readStories",
            "org.telegram.tgnet.tl.TL_stories$TL_stories_incrementStoryViews")));

    /** Requests that show a chat's other side that you're typing, recording or uploading. */
    private static final Set<String> TYPING = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.TLRPC$TL_messages_setTyping",
            "org.telegram.tgnet.TLRPC$TL_messages_setEncryptedTyping")));

    /** The read request of a channel or supergroup, which has an input channel field named channel. */
    private static final String CHANNEL_READ = "org.telegram.tgnet.TLRPC$TL_channels_readHistory";

    /** A private chat's or basic group's read, whose peer field is an input peer. */
    private static final String CHAT_READ = "org.telegram.tgnet.TLRPC$TL_messages_readHistory";

    /** A secret chat's read, whose peer field is an input encrypted chat. */
    private static final String SECRET_READ = "org.telegram.tgnet.TLRPC$TL_messages_readEncryptedHistory";

    /** A secret chat's typing status, whose peer field is an input encrypted chat too. */
    private static final String SECRET_TYPING = "org.telegram.tgnet.TLRPC$TL_messages_setEncryptedTyping";

    /** A supergroup's or channel's played voice message, which names the chat in its channel field. */
    private static final String CHANNEL_CONTENTS = "org.telegram.tgnet.TLRPC$TL_channels_readMessageContents";

    /** A private chat's or basic group's played voice message, which names only the messages. */
    private static final String CONTENTS = "org.telegram.tgnet.TLRPC$TL_messages_readMessageContents";

    /** Messages sent into a chat, each with a peer field like the read of that chat. */
    private static final Set<String> SENDS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.TLRPC$TL_messages_sendMessage",
            "org.telegram.tgnet.TLRPC$TL_messages_sendMedia",
            "org.telegram.tgnet.TLRPC$TL_messages_sendMultiMedia",
            "org.telegram.tgnet.TLRPC$TL_messages_sendInlineBotResult")));

    /** Messages sent into a secret chat. */
    private static final Set<String> SECRET_SENDS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "org.telegram.tgnet.TLRPC$TL_messages_sendEncrypted",
            "org.telegram.tgnet.TLRPC$TL_messages_sendEncryptedFile",
            "org.telegram.tgnet.TLRPC$TL_messages_sendEncryptedMultiMedia")));

    /** The request that sets the account online or offline, which has a boolean field named offline. */
    private static final String STATUS = "org.telegram.tgnet.tl.TL_account$updateStatus";

    /** The request that fetches posts' view counts, adding a view when its boolean field increment is set. */
    private static final String VIEWS = "org.telegram.tgnet.TLRPC$TL_messages_getMessagesViews";

    /** Telegram's mark on a secret chat's dialog ID, {@code DialogObject.makeEncryptedDialogId}. */
    private static final long SECRET_CHAT = 0x4000000000000000L;

    /** What a request is to Ghost mode. */
    enum Kind { READ, STORY, TYPING, ONLINE, VIEW, SEND, OTHER }

    /** A kept-back read and the callback Telegram gave it, which runs once the read goes out. */
    private static final class Held {
        final Object request;
        final Object callback;

        Held(Object request, Object callback) {
            this.request = request;
            this.callback = callback;
        }
    }

    /** The newest read kept back in each chat, by account and then chat, until it's sent. */
    private static final Map<Integer, Map<Long, Held>> HELD = new HashMap<>();

    /** Reads this class is sending itself, each let through the gate once. */
    private static final Set<Object> OURS = Collections.newSetFromMap(new IdentityHashMap<>());

    /** Telegram's side of sending a held read; a test swaps it. */
    interface Requests {
        /** The account on screen. */
        int account() throws ReflectiveOperationException;

        /**
         * Sends [request] from [account] the way Telegram sends any other, [callback] getting the
         * answer; false when this build can't.
         */
        boolean send(int account, Object request, Object callback);

        /** The accounts that are signed in. */
        List<Integer> signedIn();
    }

    static volatile Requests requests = new Requests() {
        @Override public int account() throws ReflectiveOperationException {
            return HostNames.field(Class.forName("org.telegram.messenger.UserConfig"), "selectedAccount").getInt(null);
        }

        @Override public List<Integer> signedIn() {
            List<Integer> found = new ArrayList<>();
            for (Accounts.Entry account : Accounts.signedIn()) found.add(account.index);
            return found;
        }

        @Override public boolean send(int account, Object request, Object callback) {
            return sendRequest(account, request, callback);
        }
    };

    /**
     * {@code ConnectionsManager.getInstance(account).sendRequest(request, callback, 0)}, true once
     * it's sent. The patch writes it; unpatched it sends nothing.
     */
    public static boolean sendRequest(int account, Object request, Object callback) {
        return false;
    }

    /** What a kept-back typing status's callback is told. Telegram ignores the error itself. */
    static final int ERROR_CODE = 400;
    static final String ERROR_TEXT = "GHOST_MODE";

    /**
     * Asked with every request and its callback just before Telegram sends it. True means drop it:
     * the request never goes out and its callback never runs, except a typing status's, which is
     * answered with an error. Never throws.
     */
    public static boolean drop(Object request, Object callback) {
        if (request == null) return false;
        String name = request.getClass().getName();
        Kind kind = kind(name);
        if (kind == Kind.SEND) {
            afterSend(name, request);
            return false;
        }
        if (kind == Kind.VIEW) {
            uncount(request);
            return false;
        }
        if ((kind == Kind.READ || kind == Kind.TYPING) && ours(request)) return false;
        if (kind == Kind.ONLINE) watch();
        if (kind == Kind.ONLINE && !goingOnline(request)) return false;
        if (!keepBack(kind, request)) return false;
        if (kind == Kind.READ) hold(name, request, callback);
        if (kind == Kind.TYPING && callback != null) answer(callback);
        return true;
    }

    /** Whether [request] is a read or typing status sent past the gate, which goes out this once. */
    private static boolean ours(Object request) {
        synchronized (OURS) {
            return OURS.remove(request);
        }
    }

    /**
     * Keeps a kept-back chat read as that chat's newest, for a reply or the read receipts button to
     * send. Nothing is kept while both of those are off.
     */
    private static void hold(String name, Object request, Object callback) {
        if (!CHAT_READ.equals(name) && !CHANNEL_READ.equals(name) && !SECRET_READ.equals(name)) return;
        try {
            if (!Settings.GHOST_READ_AFTER_SEND.get() && !Settings.GHOST_READS_BUTTON.get()) return;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode held read switch read", t);
            return;
        }
        try {
            Long chat = chat(name, request);
            if (chat == null) return;
            int account = requests.account();
            synchronized (HELD) {
                Map<Long, Held> reads = HELD.get(account);
                if (reads == null) HELD.put(account, reads = new HashMap<>());
                reads.put(chat, new Held(request, callback));
            }
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode held read", unreadable);
        }
    }

    /**
     * With Read after you reply on, a message going into a chat lets out the read held there, in a
     * chat Ghost mode covers: every chat but the exceptions while it's on, only those while it's off.
     */
    private static void afterSend(String name, Object request) {
        boolean on;
        try {
            if (!Utils.settingsReady() || !Settings.GHOST_READS.get() || !Settings.GHOST_READ_AFTER_SEND.get()) return;
            on = Settings.GHOST_MODE.get();
            if (!on && !GhostChats.any()) return;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode reply switch read", t);
            return;
        }
        try {
            Long chat = chat(name, request);
            if (chat == null || on == GhostChats.flipped(chat)) return;
            int account = requests.account();
            Held read;
            synchronized (HELD) {
                Map<Long, Held> reads = HELD.get(account);
                read = reads == null ? null : reads.remove(chat);
            }
            if (read != null && send(account, Collections.singletonMap(chat, read)) > 0) {
                HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "reads sent after a reply");
            }
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode reply read", unreadable);
        }
    }

    /**
     * Sends every read held for the account on screen, for the read receipts button: how many
     * chats they covered, or -1 when this build can't send them, which keeps them held.
     */
    static int sendHeld() {
        try {
            int account = requests.account();
            Map<Long, Held> reads;
            synchronized (HELD) {
                reads = HELD.remove(account);
            }
            if (reads == null) return 0;
            int sent = send(account, reads);
            for (int i = 0; i < sent; i++) HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "reads sent from the button");
            return sent < reads.size() ? -1 : sent;
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode held reads", unreadable);
            return -1;
        }
    }

    /** Sends [reads] past the gate, putting back any that didn't go so the next try has them: how many went. */
    private static int send(int account, Map<Long, Held> reads) {
        int sent = 0;
        for (Map.Entry<Long, Held> read : reads.entrySet()) {
            Object request = read.getValue().request;
            synchronized (OURS) {
                OURS.add(request);
            }
            if (requests.send(account, request, read.getValue().callback)) {
                sent++;
                continue;
            }
            synchronized (OURS) {
                OURS.remove(request);
            }
            synchronized (HELD) {
                Map<Long, Held> held = HELD.get(account);
                if (held == null) HELD.put(account, held = new HashMap<>());
                if (!held.containsKey(read.getKey())) held.put(read.getKey(), read.getValue());
            }
        }
        return sent;
    }

    /**
     * Sends a typing status this extension made, like Fake typing's, from [account] past the gate:
     * true once it's sent.
     */
    static boolean sendOwn(int account, Object request) {
        synchronized (OURS) {
            OURS.add(request);
        }
        if (requests.send(account, request, null)) return true;
        synchronized (OURS) {
            OURS.remove(request);
        }
        return false;
    }

    /** Drops every held read, for a test. */
    static void forgetHeld() {
        synchronized (HELD) {
            HELD.clear();
        }
        synchronized (OURS) {
            OURS.clear();
        }
    }

    /**
     * The dialog ID of the chat a read, a send, a typing status, a story view or a view count is
     * for, the way Telegram numbers them: a person's own ID, a group's or channel's negated, a secret
     * chat's with its mark. Null for anything else, like Saved Messages, whose peer names no one.
     */
    static Long chat(String name, Object request) throws ReflectiveOperationException {
        boolean channel = CHANNEL_READ.equals(name) || CHANNEL_CONTENTS.equals(name);
        Object peer = HostNames.field(request.getClass(), channel ? "channel" : "peer").get(request);
        if (peer == null) return null;
        if (SECRET_READ.equals(name) || SECRET_TYPING.equals(name) || SECRET_SENDS.contains(name)) {
            long id = ((Number) HostNames.field(peer.getClass(), "chat_id").get(peer)).longValue();
            return id == 0 ? null : SECRET_CHAT | (id & 0xFFFFFFFFL);
        }
        long id = idOf(peer, "channel_id");
        if (id != 0) return -id;
        if (channel) return null;
        id = idOf(peer, "user_id");
        if (id != 0) return id;
        id = idOf(peer, "chat_id");
        return id != 0 ? -id : null;
    }

    /** The chat [request] is for, null when it names none, like a played voice message, or can't be read. */
    @Nullable
    private static Long chatOf(Object request) {
        String name = request.getClass().getName();
        if (CONTENTS.equals(name)) return null;
        try {
            return chat(name, request);
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode exception chat", unreadable);
            return null;
        }
    }

    /** A peer's ID field, 0 when it has none of that name. Telegram's input peers share one class's fields. */
    private static long idOf(Object peer, String field) throws IllegalAccessException {
        try {
            return ((Number) HostNames.field(peer.getClass(), field).get(peer)).longValue();
        } catch (NoSuchFieldException none) {
            return 0;
        }
    }

    /**
     * Telegram marks a chat as waiting on its typing status until the answer comes back, and sends no
     * other typing there while it waits. A kept-back one never got an answer, so with Hide typing
     * turned off again the chat stayed silent until Telegram restarted. An error answer clears the
     * mark the way a refused request does.
     */
    private static void answer(Object callback) {
        try {
            if (!RequestAnswers.error(callback, ERROR_CODE, ERROR_TEXT)) {
                HookStatus.missingMember(FamilyNames.DISABLE_ANALYTICS, "method", callback.getClass().getName(), "run");
            }
        } catch (Throwable t) {
            // Typing stays hidden without the answer; it comes back when Telegram restarts.
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode typing answer", t);
        }
    }

    /** Whether an update status request says online. Anything unreadable is treated as offline, so it goes out. */
    private static boolean goingOnline(Object request) {
        try {
            return !HostNames.field(request.getClass(), "offline").getBoolean(request);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode online status read", t);
            return false;
        }
    }

    /** Asks a view count request not to add this view, while Ghost mode keeps reads back. It still goes out for the counts. */
    private static void uncount(Object request) {
        try {
            Field increment = HostNames.field(request.getClass(), "increment");
            if (!increment.getBoolean(request) || !keepBack(Kind.VIEW, request)) return;
            increment.setBoolean(request, false);
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode channel views", unreadable);
        }
    }

    /** The settings store {@link #WATCH} listens to. SharedPreferences keeps its listeners weakly, so the listener is a constant. */
    private static SharedPreferences watched;

    private static final SharedPreferences.OnSharedPreferenceChangeListener WATCH = (store, changed) -> {
        if (Settings.GHOST_MODE.key.equals(changed) || Settings.GHOST_ONLINE.key.equals(changed)) goOffline();
    };

    /** Listens for Ghost mode's switches, once settings can be read, so turning them on can send the accounts offline. */
    static void watch() {
        try {
            if (!Utils.settingsReady()) return;
            SharedPreferences store = Setting.preferences.preferences;
            synchronized (WATCH) {
                if (store == null || store == watched) return;
                store.registerOnSharedPreferenceChangeListener(WATCH);
                watched = store;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode switch watch", failure);
        }
    }

    /**
     * With Ghost mode and its online part on, tells the server every signed-in account is offline,
     * which the gate lets out: how many accounts it went for.
     */
    static int goOffline() {
        try {
            if (!Utils.settingsReady() || !Settings.GHOST_MODE.get() || !Settings.GHOST_ONLINE.get()) return 0;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode offline switch read", t);
            return 0;
        }
        int sent = 0;
        try {
            for (int account : requests.signedIn()) {
                Object status = Class.forName(STATUS).getConstructor().newInstance();
                HostNames.field(status.getClass(), "offline").setBoolean(status, true);
                if (requests.send(account, status, null)) sent++;
            }
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode going offline", unreadable);
        }
        for (int i = 0; i < sent; i++) HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "accounts sent offline");
        return sent;
    }

    /** Finds a chat in Telegram's tables; a test swaps it. */
    interface Chats {
        /** The chat the selected account knows by this ID, or null when it knows none. */
        Object chat(long id) throws ReflectiveOperationException;
    }

    static volatile Chats chats = GhostMode::telegramChat;

    /** Whether a request of this kind stays on the phone, counted when it does. */
    static boolean keepBack(Kind kind) {
        return keepBack(kind, null);
    }

    private static boolean keepBack(Kind kind, Object request) {
        if (kind == Kind.OTHER) return false;
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        BooleanSetting part = part(kind);
        boolean on;
        try {
            if (!Utils.settingsReady() || !part.get()) return false;
            on = Settings.GHOST_MODE.get();
            // Online status is the account's, so only a request naming a chat can be an exception's.
            if (request != null && kind != Kind.ONLINE && GhostChats.any() && GhostChats.flipped(chatOf(request))) {
                on = !on;
                HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "exceptions applied");
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode switch read", t);
            return false;
        }
        if (!on) return false;
        if (request != null && broadcastRead(request)) {
            HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "channel reads sent");
            return false;
        }
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, label(kind));
        return true;
    }

    /**
     * Whether a read is a broadcast channel's. A supergroup's read, or one for a channel this phone
     * can't place, stays kept back.
     */
    private static boolean broadcastRead(Object request) {
        if (!CHANNEL_READ.equals(request.getClass().getName())) return false;
        try {
            Object channel = HostNames.field(request.getClass(), "channel").get(request);
            if (channel == null) return false;
            Object chat = chats.chat(HostNames.field(channel.getClass(), "channel_id").getLong(channel));
            return chat != null && HostNames.field(chat.getClass(), "broadcast").getBoolean(chat)
                    && !HostNames.field(chat.getClass(), "megagroup").getBoolean(chat);
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode channel read", unreadable);
            return false;
        }
    }

    private static Object telegramChat(long id) throws ReflectiveOperationException {
        int account = HostNames.field(Class.forName("org.telegram.messenger.UserConfig"), "selectedAccount").getInt(null);
        Class<?> controller = Class.forName("org.telegram.messenger.MessagesController");
        Object instance = HostNames.method(controller, "getInstance", int.class).invoke(null, account);
        return instance == null ? null : HostNames.method(controller, "getChat", Long.class).invoke(instance, id);
    }

    private static BooleanSetting part(Kind kind) {
        switch (kind) {
            case READ:
            case VIEW: return Settings.GHOST_READS;
            case TYPING: return Settings.GHOST_TYPING;
            case ONLINE: return Settings.GHOST_ONLINE;
            default: return Settings.GHOST_STORIES;
        }
    }

    private static String label(Kind kind) {
        switch (kind) {
            case READ: return "read receipts kept back";
            case TYPING: return "typing statuses kept back";
            case ONLINE: return "online statuses kept back";
            case VIEW: return "post views not counted";
            default: return "story views kept back";
        }
    }

    /** Which kind a request class is, by its name, which Telegram's builds keep. */
    static Kind kind(String className) {
        if (READS.contains(className)) return Kind.READ;
        if (STORIES.contains(className)) return Kind.STORY;
        if (TYPING.contains(className)) return Kind.TYPING;
        if (STATUS.equals(className)) return Kind.ONLINE;
        if (VIEWS.equals(className)) return Kind.VIEW;
        if (SENDS.contains(className) || SECRET_SENDS.contains(className)) return Kind.SEND;
        return Kind.OTHER;
    }
}
