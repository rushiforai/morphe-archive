/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.Intent;

import androidx.annotation.Nullable;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Bookmarks (#79): Bookmark in a message's long-press menu keeps a note of the message on this
 * phone, and the Bookmarks page opens its chat at that message again.
 *
 * <p>A bookmark is a line of {@link Settings#BOOKMARKS}: the account's user id, the chat, the
 * message, the forum topic, the message's date, when it was bookmarked, and the sender, the chat's
 * name and a short preview as they read then. Nothing reaches Telegram's servers, and a settings
 * file carries the list. Opening one hands Telegram the same request its notifications make, with
 * the message's id, so the chat scrolls to it and marks it the way a reply jump does.
 */
public final class Bookmarks {
    private Bookmarks() {}

    /** How many bookmarks the list keeps. */
    public static final int MAX = 100;
    static final int PREVIEW_CHARS = 80;
    static final int NAME_CHARS = 64;
    private static final int FIELDS = 9;
    private static final char ELLIPSIS = (char) 0x2026;
    /** Telegram's notifications open a chat with this action, made unique so each one is a new request. */
    static final String OPEN_CHAT = "com.tmessages.openchat";
    static final String LAUNCHER = "org.telegram.ui.LaunchActivity";
    /** How long a tap waits for Telegram's storage before it says it couldn't open the chat. */
    private static final long STORAGE_WAIT_SECONDS = 5;

    /** One bookmarked message, as a line of the list holds it. */
    public static final class Entry {
        /** The user id of the account the message is in. */
        public final long owner;
        /** The chat: a user's id, or a group's or channel's as a negative number. */
        public final long dialog;
        public final int message;
        /** The forum topic, 0 outside one. */
        public final long topic;
        /** When the message was sent, in seconds. */
        public final int date;
        /** When it was bookmarked, in milliseconds. */
        public final long saved;
        /** Who sent it, empty when it's the chat itself. */
        public final String sender;
        public final String chat;
        public final String preview;

        Entry(long owner, long dialog, int message, long topic, int date, long saved, String sender, String chat, String preview) {
            this.owner = owner;
            this.dialog = dialog;
            this.message = message;
            this.topic = Math.max(0, topic);
            this.date = date;
            this.saved = saved;
            this.sender = clean(sender, NAME_CHARS);
            this.chat = clean(chat, NAME_CHARS);
            this.preview = clean(preview, PREVIEW_CHARS);
        }

        String line() {
            return owner + "\t" + dialog + "\t" + message + "\t" + topic + "\t" + date + "\t" + saved
                    + "\t" + sender + "\t" + chat + "\t" + preview;
        }

        boolean same(long owner, long dialog, int message) {
            return this.owner == owner && this.dialog == dialog && this.message == message;
        }

        /** The line under the chat's name on the page: who sent it, then the preview. */
        public String shown() {
            return sender.isEmpty() ? preview : L10n.f("%1$s: %2$s", sender, preview);
        }
    }

    /** One line of the list as a bookmark, or null when it isn't one. */
    @Nullable
    static Entry entry(String line) {
        String[] parts = line.split("\t", -1);
        if (parts.length < FIELDS) return null;
        try {
            long owner = Long.parseLong(parts[0]);
            long dialog = Long.parseLong(parts[1]);
            int message = Integer.parseInt(parts[2]);
            if (owner == 0 || dialog == 0 || message <= 0) return null;
            return new Entry(owner, dialog, message, Long.parseLong(parts[3]), Integer.parseInt(parts[4]),
                    Long.parseLong(parts[5]), parts[6], parts[7], parts[8]);
        } catch (NumberFormatException other) {
            return null;
        }
    }

    /** The list's bookmarks, newest first, each message once. A line that isn't one is left out. */
    public static List<Entry> parse(@Nullable String saved) {
        List<Entry> entries = new ArrayList<>();
        if (saved == null || saved.isEmpty()) return entries;
        for (String line : saved.split("\n")) {
            Entry each = entry(line);
            if (each != null && find(entries, each.owner, each.dialog, each.message) < 0) entries.add(each);
        }
        return entries;
    }

    static String join(List<Entry> entries) {
        StringBuilder out = new StringBuilder();
        for (Entry each : entries) {
            if (out.length() > 0) out.append('\n');
            out.append(each.line());
        }
        return out.toString();
    }

    private static int find(List<Entry> entries, long owner, long dialog, int message) {
        for (int i = 0; i < entries.size(); i++) if (entries.get(i).same(owner, dialog, message)) return i;
        return -1;
    }

    /** Whether the list holds the message. */
    static boolean has(@Nullable String saved, long owner, long dialog, int message) {
        return find(parse(saved), owner, dialog, message) >= 0;
    }

    /** The list with [entry] first and any older copy of it gone, or null when it's full. */
    @Nullable
    static String added(@Nullable String saved, Entry entry) {
        List<Entry> entries = parse(saved);
        int at = find(entries, entry.owner, entry.dialog, entry.message);
        if (at >= 0) entries.remove(at);
        else if (entries.size() >= MAX) return null;
        entries.add(0, entry);
        return join(entries);
    }

    /** The list without the message. */
    static String removed(@Nullable String saved, long owner, long dialog, int message) {
        List<Entry> entries = parse(saved);
        int at = find(entries, owner, dialog, message);
        if (at >= 0) entries.remove(at);
        return join(entries);
    }

    /**
     * The phone's list with a settings file's added: each message once, the phone's own copy kept,
     * newest bookmark first, and the oldest left out past {@link #MAX}.
     */
    public static String merged(@Nullable String mine, @Nullable String file) {
        List<Entry> all = parse(mine);
        for (Entry each : parse(file)) {
            if (find(all, each.owner, each.dialog, each.message) < 0) all.add(each);
        }
        // Stable, so a bookmark saved at the same moment keeps the phone's first.
        Collections.sort(all, (a, b) -> Long.compare(b.saved, a.saved));
        return join(all.size() > MAX ? all.subList(0, MAX) : all);
    }

    /** Each bookmark's line, newest first, the way a settings file holds them. */
    public static List<String> lines(@Nullable String saved) {
        List<String> lines = new ArrayList<>();
        for (Entry each : parse(saved)) lines.add(each.line());
        return lines;
    }

    /** The list a settings file's lines make, or null when there are too many or one isn't a bookmark. */
    @Nullable
    public static String fromLines(List<String> lines) {
        if (lines.size() > MAX) return null;
        List<Entry> entries = new ArrayList<>();
        for (String line : lines) {
            if (line == null || line.indexOf('\n') >= 0 || line.indexOf('\r') >= 0) return null;
            Entry each = entry(line);
            if (each == null) return null;
            if (find(entries, each.owner, each.dialog, each.message) < 0) entries.add(each);
        }
        return join(entries);
    }

    /** How many bookmarks the list holds. */
    public static int count(@Nullable String saved) {
        return parse(saved).size();
    }

    /** One line of text at most [max] characters long, its breaks and tabs turned into spaces. */
    static String clean(@Nullable String text, int max) {
        if (text == null) return "";
        StringBuilder out = new StringBuilder();
        boolean space = false;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (Character.isWhitespace(c) || Character.isSpaceChar(c)) {
                space = out.length() > 0;
                continue;
            }
            if (space) out.append(' ');
            space = false;
            out.append(c);
        }
        if (out.length() <= max) return out.toString();
        int end = max - 1;
        // Never half a character.
        if (Character.isHighSurrogate(out.charAt(end - 1))) end--;
        return out.substring(0, end).trim() + ELLIPSIS;
    }

    /** Whether the menu offers Bookmark: the switch is on, the build has it, and the message has an id of its own in a chat this can open. */
    static boolean offered(Object message) {
        try {
            return MessageMenu.on(Settings.MESSAGE_MENU_BOOKMARKS) && PatchFamily.Capability.BOOKMARKS.installed()
                    && MessageMenu.id(message) > 0 && !apart(message) && !MessageMenu.secret(MessageMenu.dialog(message))
                    && MessageMenu.selfId(MessageMenu.account(message)) != 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "bookmark item", failure);
            return false;
        }
    }

    /** Whether the message is bookmarked already. */
    static boolean marked(Object message) {
        try {
            return has(Settings.BOOKMARKS.savedValue(), MessageMenu.selfId(MessageMenu.account(message)),
                    MessageMenu.dialog(message), MessageMenu.id(message));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "bookmark item", failure);
            return false;
        }
    }

    /** The menu item's words, Remove bookmark when the message is bookmarked. */
    static String label(Object message) {
        return marked(message) ? L10n.t("Remove bookmark") : L10n.t("Bookmark");
    }

    static int icon(Object message) {
        return marked(message) ? unmarkIcon() : markIcon();
    }

    /** The bookmark the menu makes of the message, read from it now. */
    static Entry of(Object message, long owner) {
        int account = MessageMenu.account(message);
        long dialog = MessageMenu.dialog(message);
        long from = MessageMenu.sender(message);
        String sender = from == 0 || from == dialog ? "" : from == owner ? L10n.t("You") : MessageMenu.title(account, from);
        return new Entry(owner, dialog, MessageMenu.id(message), dialog < 0 ? topic(message) : 0, MessageMenu.date(message),
                System.currentTimeMillis(), sender, MessageMenu.title(account, dialog), preview(message));
    }

    /** The message's words, or its file's name, or what kind of message it is. */
    static String preview(Object message) {
        String text = MessageMenu.text(message);
        if (text != null && !clean(text, PREVIEW_CHARS).isEmpty()) return text;
        String name = MessageMenu.documentName(message);
        if (name != null && !name.isEmpty()) return name;
        if (MessageMenu.photo(message)) return L10n.t("Photo");
        if (MessageMenuTools.video(message)) return L10n.t("Video");
        return L10n.t("Message");
    }

    /** The menu's tap: the message is bookmarked, or its bookmark goes when it has one. */
    static void toggle(Context context, Object message) {
        String said;
        try {
            long owner = MessageMenu.selfId(MessageMenu.account(message));
            long dialog = MessageMenu.dialog(message);
            int id = MessageMenu.id(message);
            if (owner == 0 || dialog == 0 || id <= 0) throw new IllegalStateException("the message has no place to open");
            Entry entry = of(message, owner);
            // Read and written in one queued task, so two quick taps don't drop each other's change.
            if (Utils.runInOrderOnBackgroundThread(() -> MessageMenu.feedback(context, save(context, entry)))) return;
            said = L10n.t(context, "Couldn't save the bookmark. Try again.");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "bookmark", failure);
            said = L10n.t(context, "Couldn't save the bookmark. Try again.");
        }
        MessageMenu.feedback(context, said);
    }

    /** Adds [entry], or takes it out when it's there, and says how that went. */
    static synchronized String save(@Nullable Context context, Entry entry) {
        String said;
        try {
            String saved = Settings.BOOKMARKS.savedValue();
            boolean removing = has(saved, entry.owner, entry.dialog, entry.message);
            String next = removing ? removed(saved, entry.owner, entry.dialog, entry.message) : added(saved, entry);
            said = next == null ? L10n.f(context, "You can keep up to %1$d bookmarks.", MAX)
                    : !Settings.BOOKMARKS.saveCommitted(next) ? L10n.t(context, "Couldn't save the bookmark. Try again.")
                    : removing ? L10n.t(context, "Bookmark removed.") : L10n.t(context, "Bookmarked.");
            if (next != null) HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, removing ? "bookmark removed" : "message bookmarked");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "saving a bookmark", failure);
            said = L10n.t(context, "Couldn't save the bookmark. Try again.");
        }
        return said;
    }

    /**
     * The page's remove: the bookmark goes whatever the switch says, since the tap is the request.
     *
     * @return whether the list reached the disk
     */
    public static synchronized boolean remove(Entry entry) {
        try {
            String saved = Settings.BOOKMARKS.savedValue();
            if (!has(saved, entry.owner, entry.dialog, entry.message)) return true;
            if (!Settings.BOOKMARKS.saveCommitted(removed(saved, entry.owner, entry.dialog, entry.message))) return false;
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "bookmark removed from the page");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "removing a bookmark", failure);
            return false;
        }
    }

    /** Whether the side menu shows its Bookmarks row: the build has it and the switch is on. */
    public static boolean rowShown() {
        try {
            return PatchFamily.Capability.BOOKMARKS.installed() && MessageMenu.on(Settings.MESSAGE_MENU_BOOKMARKS);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "bookmarks row", failure);
            return false;
        }
    }

    /** What this phone has of a bookmark's chat. */
    enum Place { GONE, LEFT, OPEN, FORUM }

    /** Telegram's accounts and tables; a test swaps them. */
    interface Tables {
        /** The signed-in account for the user id, or -1. */
        int account(long owner);

        /** What [account] has of the chat. Called off the main thread. */
        Place chat(int account, long dialog) throws Exception;

        /** Whether [account]'s storage still holds the message. Called off the main thread and Telegram's storage queue. */
        boolean message(int account, long dialog, int message) throws Exception;
    }

    static volatile Tables tables = new TelegramTables();

    /** Where a tap on a bookmark goes: the account and topic to open it in, and what to say first. */
    static final class Route {
        /** -1 when the chat doesn't open. */
        final int account;
        final long topic;
        @Nullable final String said;

        Route(int account, long topic, @Nullable String said) {
            this.account = account;
            this.topic = topic;
            this.said = said;
        }
    }

    static Route route(Tables in, Entry entry) throws Exception {
        int account = in.account(entry.owner);
        Place place = account < 0 ? Place.GONE : in.chat(account, entry.dialog);
        String refused = account < 0 ? L10n.t("That account isn't signed in here.")
                : place == Place.GONE ? L10n.t("That chat isn't on this phone anymore.")
                : place == Place.LEFT ? L10n.t("You're not in that chat anymore.") : null;
        if (refused != null) return new Route(-1, 0, refused);
        // A forum opens a topic; a bookmark from before the chat became one is in General.
        long topic = place == Place.FORUM ? Math.max(1, entry.topic) : 0;
        String said = in.message(account, entry.dialog, entry.message) ? null : L10n.t("That message isn't on this phone anymore.");
        return new Route(account, topic, said);
    }

    /** Telegram's own request for a chat at a message, the one its notifications make. */
    static Intent intent(Context context, Entry entry, Route route) {
        Intent intent = new Intent(OPEN_CHAT + entry.saved + "." + System.nanoTime()).setClassName(context, LAUNCHER);
        intent.putExtra("currentAccount", route.account);
        if (entry.dialog > 0) {
            intent.putExtra("userId", entry.dialog);
        } else {
            intent.putExtra("chatId", -entry.dialog);
            if (route.topic > 0) intent.putExtra("topicId", route.topic);
        }
        intent.putExtra("message_id", entry.message);
        return intent;
    }

    /**
     * Opens the bookmark's chat at its message, or says why it can't. Telegram's tables are read off
     * the main thread; the chat opens on it, and [opened] runs once it does.
     */
    public static void open(Context context, Entry entry, @Nullable Runnable opened) {
        Tables through = tables;
        boolean started = Utils.runOnBackgroundThread(() -> {
            Route found;
            try {
                found = route(through, entry);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "reading a bookmark's chat", failure);
                found = new Route(-1, 0, L10n.t("Couldn't open that. Try again."));
            }
            Route route = found;
            Utils.runOnMainThread(() -> go(context, entry, route, opened));
        });
        if (!started) Utils.showToastLong(L10n.t("Couldn't open that. Try again."));
    }

    static void go(Context context, Entry entry, Route route, @Nullable Runnable opened) {
        if (route.said != null) Utils.showToastLong(route.said);
        if (route.account < 0) return;
        try {
            context.startActivity(intent(context, entry, route));
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "bookmark opened");
            if (opened != null) opened.run();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "opening a bookmark", failure);
            Utils.showToastLong(L10n.t("Couldn't open that. Try again."));
        }
    }

    /** Telegram's controller and storage, through the build's names. */
    private static final class TelegramTables implements Tables {
        @Override public int account(long owner) {
            return Accounts.ofUser(owner);
        }

        @Override public Place chat(int account, long dialog) throws Exception {
            Object controller = instance("org.telegram.messenger.MessagesController", account);
            Object found = dialog > 0
                    ? HostNames.method(controller.getClass(), "getUser", Long.class).invoke(controller, dialog)
                    : HostNames.method(controller.getClass(), "getChat", Long.class).invoke(controller, -dialog);
            if (found == null) found = stored(account, dialog);
            if (found == null) return Place.GONE;
            if (dialog > 0) return Place.OPEN;
            Class<?> chats = Class.forName("org.telegram.messenger.ChatObject");
            Class<?> chat = Class.forName("org.telegram.tgnet.TLRPC$Chat");
            boolean out = Boolean.TRUE.equals(HostNames.method(chats, "isNotInChat", chat).invoke(null, found));
            // A public channel or group still opens to read after leaving it.
            if (out && !Boolean.TRUE.equals(HostNames.method(chats, "isPublic", chat).invoke(null, found))) return Place.LEFT;
            return Boolean.TRUE.equals(HostNames.method(chats, "isForum", chat).invoke(null, found)) ? Place.FORUM : Place.OPEN;
        }

        @Override public boolean message(int account, long dialog, int message) throws Exception {
            Object storage = instance("org.telegram.messenger.MessagesStorage", account);
            // Telegram's own lookup waits for its storage queue itself.
            return HostNames.method(storage.getClass(), "getMessage", long.class, long.class).invoke(storage, dialog, (long) message) != null;
        }

        /** The user or chat from Telegram's database, read on its storage queue. */
        @Nullable
        private static Object stored(int account, long dialog) throws Exception {
            Object storage = instance("org.telegram.messenger.MessagesStorage", account);
            Method get = HostNames.method(storage.getClass(), dialog > 0 ? "getUser" : "getChat", long.class);
            Object queue = HostNames.method(storage.getClass(), "getStorageQueue").invoke(storage);
            if (queue == null) throw new IllegalStateException("no storage queue");
            AtomicReference<Object> found = new AtomicReference<>();
            AtomicReference<Throwable> failed = new AtomicReference<>();
            CountDownLatch done = new CountDownLatch(1);
            Runnable read = () -> {
                try {
                    found.set(get.invoke(storage, Math.abs(dialog)));
                } catch (Throwable failure) {
                    failed.set(failure);
                } finally {
                    done.countDown();
                }
            };
            Object accepted = HostNames.method(queue.getClass(), "postRunnable", Runnable.class).invoke(queue, read);
            if (Boolean.FALSE.equals(accepted)) throw new IllegalStateException("the storage queue took no work");
            if (!done.await(STORAGE_WAIT_SECONDS, TimeUnit.SECONDS)) throw new IllegalStateException("the storage queue is busy");
            if (failed.get() != null) throw new IllegalStateException("the stored chat couldn't be read", failed.get());
            return found.get();
        }

        private static Object instance(String name, int account) throws Exception {
            Object instance = HostNames.method(Class.forName(name), "getInstance", int.class).invoke(null, account);
            if (instance == null) throw new IllegalStateException("no " + name);
            return instance;
        }
    }

    /** Whether the message is scheduled or a quick reply, both of which number their messages apart from the chat. Replaced when patching. */
    public static boolean apart(Object message) { return true; }

    /** The forum topic the message is in, 0 outside one. Replaced when patching. */
    public static long topic(Object message) { return 0L; }

    /** The icon beside Bookmark. Replaced when patching. */
    public static int markIcon() { return 0; }

    /** The icon beside Remove bookmark. Replaced when patching. */
    public static int unmarkIcon() { return 0; }
}
