/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.function.Function;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Folders by chat type in one tap: Private, Groups, Channels and Bots, made as Telegram's own
 * folders, so they're tabs above the chat list like any folder you make and they reach your other
 * devices too.
 *
 * <p>Turning the switch on does what Telegram's own folder screen does for a new folder, for each
 * type you don't already have a folder for, as far as Telegram's folder limit goes: it sends
 * {@code messages.updateDialogFilter} with only chat types in it, and once Telegram's server says
 * yes to all of them it puts the folders in Telegram's list and database in type order, whatever
 * order the answers came in, and sends the order the tabs show.
 * Turning it off asks the server to delete the folders this made that are still as they were made,
 * and takes each out of the list once the server says yes, the way Telegram's own Delete folder
 * does. One you renamed, recolored, gave an emoji or added, removed or pinned chats in is yours.
 * Nothing happens at a start, only when the switch is flipped. When nothing can be done (paused,
 * signed out, folders still loading, the last flip still waiting on Telegram) the switch goes back
 * to where it was, and it goes back too when Telegram's server turns down everything asked of it,
 * or keeps any folder it was asked to delete, so turning it off again asks for just those.
 *
 * <p>Which folders it asked for is kept in its own prefs file, by Telegram user and folder id,
 * and written before anything is sent. A record says whether the folder was sent, made or is being
 * removed, and the tag color Telegram's server gave it, so a color you pick later keeps the folder.
 * A record still sent or being removed is from a run that ended before Telegram answered, and the
 * next flip goes by whether Telegram's list has the folder. None of it is a setting, and the switch
 * stays out of settings backups: importing one would flip it without making or removing anything.
 */
public final class ChatTypeFolders {
    static final String PREFS = "hushtelegram_chat_type_folders";
    /** Telegram gives folders you make ids from 2; 0 is All chats. */
    static final int FIRST_ID = 2;
    /** The chat type bits of a folder, MessagesController.DIALOG_FILTER_FLAG_CONTACTS through BOTS. */
    static final int ALL_TYPES = 1 | 2 | 4 | 8 | 16;
    /** How long Telegram can take to answer before the person is told it's still being asked. */
    static final long PATIENCE_MS = 2000;
    /** What Telegram's server says when the account already has as many folders as it allows. */
    static final String TOO_MANY = "DIALOG_FILTERS_TOO_MUCH";
    /** What it says about a folder id it doesn't have, which for a delete means the folder is gone already. */
    static final String NO_SUCH_FOLDER = "FILTER_ID_INVALID";
    /** {@link #serverFolderColor} for a folder the server's list doesn't have. */
    static final int MISSING = -2;

    private ChatTypeFolders() {}

    /** The folders, in the order they're made. Each name is short enough for Telegram's 12 characters. */
    enum Type {
        PRIVATE("Private", 1 | 2),
        GROUPS("Groups", 4),
        CHANNELS("Channels", 8),
        BOTS("Bots", 16);

        final String english;
        final int flags;

        Type(String english, int flags) {
            this.english = english;
            this.flags = flags;
        }

        String title() {
            switch (this) {
                case PRIVATE: return L10n.t("Private");
                case GROUPS: return L10n.t("Groups");
                case CHANNELS: return L10n.t("Channels");
                default: return L10n.t("Bots");
            }
        }
    }

    /** What {@link #folderChanges} sets for each thing on a folder besides its name and chat types. */
    static final int COLOR = 1, TITLE_EMOJI = 2, CHATS_ADDED = 4, CHATS_LEFT_OUT = 8, CHATS_PINNED = 16;

    /** One of Telegram's folders. */
    static final class Folder {
        final int id;
        final int flags;
        final String name;
        /** What's set on it besides its name and chat types, as {@link #COLOR} and the rest; 0 when nothing is. */
        final int changes;
        /** Its tag color, 0 and up, or -1 for none. */
        final int color;

        /** With the first tag color when {@link #COLOR} says it has one, and none otherwise. */
        Folder(int id, int flags, String name, int changes) {
            this(id, flags, name, changes, (changes & COLOR) != 0 ? 0 : -1);
        }

        Folder(int id, int flags, String name, int changes, int color) {
            this.id = id;
            this.flags = flags;
            this.name = name;
            this.changes = changes;
            this.color = color;
        }

        /**
         * No chats added, left out or pinned and no emoji in its name. A color is weighed apart: Telegram's
         * server gives a new folder a tag color of its own, and only Premium lets you pick another.
         */
        boolean plain() {
            return (changes & ~COLOR) == 0;
        }
    }

    /** What's kept about a folder this asked Telegram for. */
    static final class Record {
        /** Asked for, with no answer yet. */
        static final String SENT = "sent";
        /** Made by Telegram's server. */
        static final String MADE = "made";
        /** Asked to be deleted, with no answer yet. */
        static final String REMOVING = "removing";

        final String state;
        final int flags;
        /** The tag color Telegram's server gave the folder, or null when that isn't known. */
        final Integer color;
        final String name;

        Record(String state, int flags, Integer color, String name) {
            this.state = state;
            this.flags = flags;
            this.color = color;
            this.name = name;
        }

        /**
         * "2|state|flags|color|name", or a record from before there were states, "flags:name", for a folder
         * that was made, its color not known. Null when it's neither.
         */
        static Record read(Object value) {
            if (!(value instanceof String)) return null;
            String text = (String) value;
            try {
                if (text.startsWith("2|")) {
                    String[] part = text.split("\\|", 5);
                    if (part.length < 5 || !(SENT.equals(part[1]) || MADE.equals(part[1]) || REMOVING.equals(part[1]))) {
                        return null;
                    }
                    return new Record(part[1], Integer.parseInt(part[2]), part[3].isEmpty() ? null : Integer.valueOf(part[3]),
                            part[4]);
                }
                String[] part = text.split(":", 2);
                return part.length < 2 ? null : new Record(MADE, Integer.parseInt(part[0]), null, part[1]);
            } catch (NumberFormatException unreadable) {
                return null;
            }
        }

        String write() {
            return "2|" + state + "|" + flags + "|" + (color == null ? "" : color) + "|" + name;
        }

        Record as(String state) {
            return new Record(state, flags, color, name);
        }

        Record colored(int color) {
            return new Record(state, flags, color, name);
        }

        /** Still as it was made: its name and chat types, nothing added, and the server's color when that's known. */
        boolean unchanged(Folder now) {
            return now.plain() && now.flags == flags && name.equals(now.name) && (color == null || color == now.color);
        }
    }

    /** A request's answer, on the main thread. */
    interface Reply {
        /**
         * @param response what Telegram's server sent back, or null when it said no
         * @param error    null when it said yes, else its error, such as {@link #TOO_MANY}
         */
        void done(Object response, String error);
    }

    /** Telegram's side, swapped out by tests. The real one calls the stubs the patch writes. */
    interface Telegram {
        int account();

        boolean signedIn(int account);

        /** The signed-in Telegram user, so records stay with them and not with the account slot. */
        long user(int account);

        /** Null until Telegram has loaded the account's folders. */
        List<Folder> folders(int account);

        /** How many folders you can make yourself, All chats aside. */
        int limit(int account);

        /** Sends a new folder with these chat types, as Telegram's folder screen does. */
        void create(int account, int id, String name, int flags, Reply reply);

        /** Puts a folder the server made in Telegram's list and database, as Telegram's folder screen does. */
        void add(int account, int id, String name, int flags);

        /** Sends the delete Telegram's own Delete folder sends. */
        void delete(int account, int id, Reply reply);

        /** Takes a deleted folder out of Telegram's list and database, as Telegram's Delete folder does. */
        void drop(int account, int id);

        /** Sends Telegram's folder order as its list has it, as Telegram's folder screen does after a reorder. */
        void order(int account, Reply reply);

        /** Asks the server for its folder list, as Telegram does when it loads folders. */
        void fetch(int account, Reply reply);

        /** A folder's tag color in the server's list from {@link #fetch}: -1 for none, {@link #MISSING} when it isn't listed. */
        int serverColor(Object folders, int id);

        /** Gives a folder in Telegram's list this tag color, as loading the server's list does. */
        void color(int account, int id, int color);
    }

    static Telegram telegram = new Telegram() {
        @Override
        public int account() {
            return selectedAccount();
        }

        @Override
        public boolean signedIn(int account) {
            return ChatTypeFolders.signedIn(account);
        }

        @Override
        public long user(int account) {
            return userId(account);
        }

        @Override
        public List<Folder> folders(int account) {
            if (!foldersLoaded(account)) return null;
            List<Folder> folders = new ArrayList<>();
            for (int i = 0, count = folderCount(account); i < count; i++) {
                folders.add(new Folder(folderId(account, i), folderFlags(account, i), folderName(account, i),
                        folderChanges(account, i), folderColor(account, i)));
            }
            return folders;
        }

        @Override
        public int limit(int account) {
            return folderLimit(account);
        }

        @Override
        public void create(int account, int id, String name, int flags, Reply reply) {
            createFolder(account, id, name, (flags & 1) != 0, (flags & 2) != 0, (flags & 4) != 0, (flags & 8) != 0,
                    (flags & 16) != 0, delegate(requestDelegate(), reply));
        }

        @Override
        public void add(int account, int id, String name, int flags) {
            addFolder(account, id, name, flags);
        }

        @Override
        public void delete(int account, int id, Reply reply) {
            deleteFolder(account, id, delegate(requestDelegate(), reply));
        }

        @Override
        public void drop(int account, int id) {
            dropFolder(account, id);
        }

        @Override
        public void order(int account, Reply reply) {
            sendFolderOrder(account, delegate(requestDelegate(), reply));
        }

        @Override
        public void fetch(int account, Reply reply) {
            fetchFolders(account, delegate(requestDelegate(), reply));
        }

        @Override
        public int serverColor(Object folders, int id) {
            return serverFolderColor(folders, id);
        }

        @Override
        public void color(int account, int id, int color) {
            setFolderColor(account, id, color);
        }
    };

    /**
     * A {@code RequestDelegate} of {@code type} that hands {@code reply} the answer on the main thread.
     * Telegram calls it from its network thread with the answer or a TL_error, as it calls its own
     * folder screen's callback, which posts to the main thread too.
     */
    static Object delegate(Class<?> type, Reply reply) {
        if (type == null) throw new IllegalStateException("Telegram's request callback isn't patched in");
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, args) -> {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals": return proxy == args[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    default: return "HushTelegram folder reply";
                }
            }
            Object response = args != null && args.length > 0 ? args[0] : null;
            Object error = args != null && args.length > 1 ? args[1] : null;
            String failure = error == null ? null : errorName(error);
            Utils.runOnMainThread(() -> reply.done(failure == null ? response : null, failure));
            return null;
        });
    }

    private static String errorName(Object error) {
        String text = errorText(error);
        return text == null || text.isEmpty() ? "UNKNOWN" : text;
    }

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    static SharedPreferences prefs(Context context) {
        return store.apply(context);
    }

    /** One flip's requests, from when they're sent until Telegram has answered them all. */
    static final class Batch {
        final Telegram telegram;
        final Context context;
        final int account;
        final long user;
        final boolean on;
        /** Folder ids asked about that Telegram hasn't answered for yet. */
        final Set<Integer> waiting = new HashSet<>();
        /** Folder ids it made, or removed. */
        final List<Integer> done = new ArrayList<>();
        /** New folders the server has, by id, so in the order of their types, waiting to go into Telegram's list together. */
        final Map<Integer, Record> made = new TreeMap<>();
        /** Folders left out by the folder limit, here or at Telegram's server. */
        int limited;
        /** Folders Telegram's server turned down for anything else, and requests that never went out. */
        int refused;
        boolean ordering;
        boolean orderRefused;
        boolean coloring;
        boolean finished;

        Batch(Context context, int account, long user, boolean on) {
            this.telegram = ChatTypeFolders.telegram;
            this.context = context;
            this.account = account;
            this.user = user;
            this.on = on;
        }
    }

    /** Flips still waiting on Telegram. Only touched on the main thread. */
    static final List<Batch> running = new ArrayList<>();

    /**
     * From the switch, on the main thread, once its new value is saved: asks Telegram to make the
     * folders with the switch on and to remove the ones this made with it off. What happened is said
     * once Telegram has answered. When nothing can be asked, it puts the switch back, and the settings
     * screen shows that.
     *
     * @return what to tell the person now, or null when there's nothing to say yet
     */
    public static String apply(Context context) {
        if (context == null || !PatchFamily.CHAT_TYPE_FOLDERS.inBuild()) return null;
        boolean on = false;
        try {
            if (!Utils.settingsReady()) return null;
            on = Settings.CHAT_TYPE_FOLDERS.savedValue();
            if (HushTelegramPause.isPaused()) return switchBack(on, L10n.t("HushTelegram is paused, so your folders stay as they are."));
            int account = telegram.account();
            if (!telegram.signedIn(account)) return switchBack(on, L10n.t("Sign in to Telegram first."));
            List<Folder> folders = telegram.folders(account);
            if (folders == null) return switchBack(on, L10n.t("Telegram is still loading your folders. Try again in a moment."));
            long user = telegram.user(account);
            // A flip by whoever was signed in here before has no one to wait for now. Its records stay theirs, and
            // answers that still come only settle those records: the switch has moved on since, so nothing is said.
            running.removeIf(batch -> {
                if (batch.account != account || batch.user == user) return false;
                batch.finished = true;
                return true;
            });
            for (Batch batch : running) {
                if (batch.user == user) return switchBack(on, L10n.t("Telegram is still answering. Try again in a moment."));
            }
            Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            return on ? make(app, account, user, folders) : remove(app, account, user, folders);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "switch", failure);
            return switchBack(on, L10n.t("Couldn't change your folders. Try again in a moment."));
        }
    }

    /** Puts the switch back to what it was before this flip, and says why. */
    private static String switchBack(boolean on, String said) {
        try {
            Settings.CHAT_TYPE_FOLDERS.save(!on);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "switch back", failure);
        }
        return said;
    }

    private static String make(Context context, int account, long user, List<Folder> folders) {
        Set<Integer> taken = new HashSet<>();
        int yours = 0;
        for (Folder folder : folders) {
            taken.add(folder.id);
            if (folder.id != 0) yours++;
        }
        SharedPreferences prefs = prefs(context);
        // An id asked for before stays taken, in case Telegram's server has it and the list hasn't caught up.
        for (String key : prefs.getAll().keySet()) {
            int id = id(key, user);
            if (id >= 0) taken.add(id);
        }
        int room = telegram.limit(account) - yours;
        Map<Integer, Record> asking = new LinkedHashMap<>();
        SharedPreferences.Editor sent = prefs.edit();
        int left = 0, next = FIRST_ID;
        for (Type type : Type.values()) {
            if (has(folders, type.flags)) continue;
            if (room <= 0) {
                left++;
                continue;
            }
            while (taken.contains(next)) next++;
            Record record = new Record(Record.SENT, type.flags, null, type.title());
            asking.put(next, record);
            sent.putString(key(user, next), record.write());
            taken.add(next);
            room--;
        }
        // Android shows two lines of a toast, so each of these stays short.
        if (asking.isEmpty() && left == 0) return L10n.t("You already have a folder for each chat type.");
        if (asking.isEmpty()) return switchBack(true, L10n.t("Folder limit reached. Remove a folder and try again."));
        // Kept before anything is sent, so a folder that went out is always one Off can find.
        if (!sent.commit()) return switchBack(true, L10n.t("Couldn't change your folders. Try again in a moment."));
        Batch batch = new Batch(context, account, user, true);
        batch.limited = left;
        batch.waiting.addAll(asking.keySet());
        List<Integer> unsent = new ArrayList<>();
        for (Map.Entry<Integer, Record> each : asking.entrySet()) {
            int id = each.getKey();
            Record record = each.getValue();
            if (!unsent.isEmpty()) {
                unsent.add(id);
                continue;
            }
            try {
                telegram.create(account, id, record.name, record.flags, (response, error) -> created(batch, id, record, error));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder request", failure);
                unsent.add(id);
            }
        }
        return started(batch, unsent);
    }

    private static String remove(Context context, int account, long user, List<Folder> folders) {
        SharedPreferences prefs = prefs(context);
        SharedPreferences.Editor edit = prefs.edit();
        List<Integer> asking = new ArrayList<>();
        int records = 0;
        for (Map.Entry<String, ?> entry : prefs.getAll().entrySet()) {
            int id = id(entry.getKey(), user);
            if (id < 0) continue;
            records++;
            Record made = Record.read(entry.getValue());
            Folder now = made == null ? null : find(folders, id);
            // Gone already means you deleted it, or it was never made, and nothing is sent for an id that may be
            // reused. A record still sent or being removed is from a run that ended before Telegram answered,
            // so the list says how that went.
            if (now != null && made.unchanged(now)) {
                asking.add(id);
                edit.putString(entry.getKey(), made.as(Record.REMOVING).write());
            } else {
                edit.remove(entry.getKey());
                Logger.printDebug(() -> "Folders by chat type kept folder " + id + ": " + (made == null ? "unreadable record"
                        : now == null ? "not in Telegram's list" : "changes " + now.changes + ", flags " + now.flags
                        + " (made with " + made.flags + "), color " + now.color + " (made with " + made.color + "), same name "
                        + made.name.equals(now.name)));
            }
        }
        // Kept before anything is sent, so a folder whose delete Telegram turns down is still one this made.
        if (!edit.commit()) return switchBack(false, L10n.t("Couldn't change your folders. Try again in a moment."));
        if (asking.isEmpty()) {
            final int found = records;
            Logger.printDebug(() -> "Folders by chat type removed nothing: " + found + " records for this user, "
                    + folders.size() + " folders in Telegram's list");
            return L10n.t("There were no folders from HushTelegram to remove.");
        }
        Batch batch = new Batch(context, account, user, false);
        batch.waiting.addAll(asking);
        List<Integer> unsent = new ArrayList<>();
        for (int id : asking) {
            if (!unsent.isEmpty()) {
                unsent.add(id);
                continue;
            }
            try {
                telegram.delete(account, id, (response, error) -> removed(batch, id, error));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder request", failure);
                unsent.add(id);
            }
        }
        return started(batch, unsent);
    }

    /**
     * Waits for the requests that went out. A request that didn't go out is put back: a folder never
     * asked for is forgotten, and one that stays is kept as made. When none went out, the switch goes
     * back. When Telegram takes a while, as it does offline, the person is told it's being asked.
     */
    private static String started(Batch batch, List<Integer> unsent) {
        if (!unsent.isEmpty()) {
            SharedPreferences prefs = prefs(batch.context);
            SharedPreferences.Editor back = prefs.edit();
            for (int id : unsent) {
                batch.waiting.remove(id);
                batch.refused++;
                String key = key(batch.user, id);
                Record record = Record.read(prefs.getAll().get(key));
                if (batch.on || record == null) back.remove(key);
                else back.putString(key, record.as(Record.MADE).write());
            }
            if (!back.commit()) HookStatus.counted(FamilyNames.CHAT_TYPE_FOLDERS, "folder record not saved");
        }
        if (batch.waiting.isEmpty()) return switchBack(batch.on, L10n.t("Couldn't change your folders. Try again in a moment."));
        running.add(batch);
        Utils.runOnMainThreadDelayed(() -> {
            if (batch.finished || !here(batch) || !open(batch)) return;
            String said = batch.on ? L10n.t("Asking Telegram to make your folders.") : L10n.t("Asking Telegram to remove the folders.");
            Utils.showToastShort(said);
        }, PATIENCE_MS);
        return null;
    }

    /** Whoever the flip was for is still signed in on its account, so Telegram's list there is theirs. */
    private static boolean here(Batch batch) {
        // Answers run on the main thread, where a throw would close Telegram. Not knowing counts as gone.
        try {
            return batch.telegram.signedIn(batch.account) && batch.telegram.user(batch.account) == batch.user;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder account check", failure);
            return false;
        }
    }

    /** The flip's account is still the one Telegram has open. */
    private static boolean open(Batch batch) {
        try {
            return batch.telegram.account() == batch.account;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder account check", failure);
            return false;
        }
    }

    private static void created(Batch batch, int id, Record asked, String error) {
        batch.waiting.remove(id);
        try {
            SharedPreferences prefs = prefs(batch.context);
            String key = key(batch.user, id);
            Record record = Record.read(prefs.getAll().get(key));
            boolean ours = record != null && Record.SENT.equals(record.state);
            if (error == null) {
                if (ours) save(prefs, key, record.as(Record.MADE));
                // The server has it, so it counts as made even if putting it in Telegram's list goes wrong.
                batch.done.add(id);
                // Answers come back in any order, so the list gets it once they're all in.
                batch.made.put(id, asked);
            } else {
                // With whoever asked signed out, the error can be Telegram dropping a request it had queued, which
                // the server may have made anyway. The record stays sent, and the next flip goes by the list.
                if (ours && here(batch)) forget(prefs, key);
                if (TOO_MANY.equals(error)) batch.limited++;
                else batch.refused++;
                Logger.printInfo(() -> "Folders by chat type: Telegram turned down folder " + id + " (" + error + ")");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder answer", failure);
        }
        if (batch.waiting.isEmpty()) answered(batch);
    }

    private static void removed(Batch batch, int id, String error) {
        batch.waiting.remove(id);
        try {
            SharedPreferences prefs = prefs(batch.context);
            String key = key(batch.user, id);
            Record record = Record.read(prefs.getAll().get(key));
            boolean ours = record != null && Record.REMOVING.equals(record.state);
            if (error == null || NO_SUCH_FOLDER.equals(error)) {
                if (ours) forget(prefs, key);
                if (here(batch)) batch.telegram.drop(batch.account, id);
                batch.done.add(id);
            } else {
                // Still Telegram's and still one this made, so turning the switch off again asks again.
                if (ours) save(prefs, key, record.as(Record.MADE));
                batch.refused++;
                Logger.printInfo(() -> "Folders by chat type: Telegram kept folder " + id + " (" + error + ")");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder answer", failure);
        }
        if (batch.waiting.isEmpty()) answered(batch);
    }

    /** Every folder is answered for. New folders get their order and the server's colors before anything is said. */
    private static void answered(Batch batch) {
        if (batch.on) addMade(batch);
        if (batch.on && !batch.finished && !batch.done.isEmpty() && here(batch)) {
            batch.ordering = true;
            batch.coloring = true;
            try {
                // Telegram's server lists new folders in its own order; this keeps them where the tabs show them.
                batch.telegram.order(batch.account, (response, error) -> ordered(batch, error));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder order", failure);
                batch.ordering = false;
                batch.orderRefused = true;
            }
            try {
                batch.telegram.fetch(batch.account, (response, error) -> colored(batch, response, error));
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder colors", failure);
                batch.coloring = false;
            }
        }
        finish(batch);
    }

    /**
     * Puts the new folders into Telegram's list in the order of their types, whatever order the server
     * answered in. The order sent after this is read from that list, so the tabs and the server agree.
     */
    private static void addMade(Batch batch) {
        try {
            List<Folder> folders = here(batch) ? batch.telegram.folders(batch.account) : null;
            if (folders == null) return;
            for (Map.Entry<Integer, Record> each : batch.made.entrySet()) {
                int id = each.getKey();
                Record asked = each.getValue();
                // Telegram's list can have it already, when the server told this device about it first.
                if (find(folders, id) == null) batch.telegram.add(batch.account, id, asked.name, asked.flags);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder answer", failure);
        }
    }

    private static void ordered(Batch batch, String error) {
        batch.ordering = false;
        if (error != null) {
            batch.orderRefused = true;
            Logger.printInfo(() -> "Folders by chat type: Telegram didn't save the folder order (" + error + ")");
        }
        finish(batch);
    }

    /**
     * The server's folder list, asked for once the folders are made. The tag color it gave each one
     * is kept as where its color started, so a color picked later keeps the folder, and Telegram's
     * list gets that color now rather than at its next load.
     */
    private static void colored(Batch batch, Object response, String error) {
        batch.coloring = false;
        try {
            if (error != null || response == null) {
                Logger.printInfo(() -> "Folders by chat type: no folder colors from Telegram (" + error + ")");
                return;
            }
            SharedPreferences prefs = prefs(batch.context);
            List<Folder> folders = here(batch) ? batch.telegram.folders(batch.account) : null;
            for (int id : batch.done) {
                int color = batch.telegram.serverColor(response, id);
                if (color == MISSING) continue;
                String key = key(batch.user, id);
                Record record = Record.read(prefs.getAll().get(key));
                if (record == null || !Record.MADE.equals(record.state) || record.color != null) continue;
                save(prefs, key, record.colored(color));
                Folder now = folders == null ? null : find(folders, id);
                if (now != null && now.color != color) batch.telegram.color(batch.account, id, color);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHAT_TYPE_FOLDERS, "folder colors", failure);
        } finally {
            finish(batch);
        }
    }

    /** Once nothing is left to answer, says how it went, and puts the switch back when nothing changed. */
    private static void finish(Batch batch) {
        if (batch.finished || batch.ordering || batch.coloring || !batch.waiting.isEmpty()) return;
        batch.finished = true;
        running.remove(batch);
        int count = batch.done.size();
        if (count > 0) HookStatus.counted(FamilyNames.CHAT_TYPE_FOLDERS, batch.on ? "folder made" : "folder removed");
        // Signed out, or someone else signed in: the records stay theirs, and there's no one to tell.
        // Another account open now: the switch and what's said are about that one, so neither changes.
        if (!here(batch) || !open(batch)) return;
        String said;
        if (batch.on) {
            if (count == 0 && batch.limited > 0) said = switchBack(true, L10n.t("Folder limit reached. Remove a folder and try again."));
            else if (count == 0) said = switchBack(true, L10n.t("Telegram turned the folders down. Try again later."));
            else if (batch.limited > 0) said = L10n.t("Made some folders. The folder limit left no room for the rest.");
            else if (batch.refused > 0) said = L10n.t("Made some folders. Telegram turned the rest down.");
            else if (batch.orderRefused) said = L10n.t("Made the folders. Telegram didn't save their order.");
            else said = L10n.t("Made Private, Groups, Channels and Bots folders.");
        } else {
            if (count == 0) said = switchBack(false, L10n.t("Telegram didn't remove the folders. Try again in a moment."));
            // The switch goes back on, so turning it off again asks only for the folders still there.
            else if (batch.refused > 0) said = switchBack(false, L10n.t("Telegram kept some folders. Turn this off again to retry."));
            else said = L10n.t("Removed the folders HushTelegram made. Changed ones stay.");
        }
        Utils.showToastLong(said);
    }

    private static void save(SharedPreferences prefs, String key, Record record) {
        if (!prefs.edit().putString(key, record.write()).commit()) {
            HookStatus.counted(FamilyNames.CHAT_TYPE_FOLDERS, "folder record not saved");
        }
    }

    private static void forget(SharedPreferences prefs, String key) {
        if (!prefs.edit().remove(key).commit()) HookStatus.counted(FamilyNames.CHAT_TYPE_FOLDERS, "folder record not saved");
    }

    /** Whether a folder already shows exactly these chat types, whatever else it leaves out. */
    private static boolean has(List<Folder> folders, int flags) {
        for (Folder folder : folders) {
            if (folder.id != 0 && (folder.flags & ALL_TYPES) == flags) return true;
        }
        return false;
    }

    private static Folder find(List<Folder> folders, int id) {
        for (Folder folder : folders) {
            if (folder.id == id) return folder;
        }
        return null;
    }

    private static String key(long user, int id) {
        return user + ":" + id;
    }

    /** The folder id in one of this user's record keys, or -1 for anyone else's. */
    private static int id(String key, long user) {
        String prefix = user + ":";
        if (!key.startsWith(prefix)) return -1;
        try {
            return Integer.parseInt(key.substring(prefix.length()));
        } catch (NumberFormatException unreadable) {
            return -1;
        }
    }

    /** Forgets the flips still waiting, as a restart does. Their answers, if any come, change nothing that's said. */
    static void resetForTests() {
        for (Batch batch : running) batch.finished = true;
        running.clear();
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code UserConfig.selectedAccount}. */
    public static int selectedAccount() { return 0; }

    /** {@code UserConfig.getInstance(account).isClientActivated()}. */
    public static boolean signedIn(int account) { return false; }

    /** {@code UserConfig.getInstance(account).getClientUserId()}. */
    public static long userId(int account) { return 0; }

    /** {@code MessagesController.getInstance(account).dialogFiltersLoaded}. */
    public static boolean foldersLoaded(int account) { return false; }

    /** {@code MessagesController.getInstance(account).dialogFilters.size()}. */
    public static int folderCount(int account) { return 0; }

    /** {@code dialogFilters.get(index).id}. */
    public static int folderId(int account, int index) { return 0; }

    /** {@code dialogFilters.get(index).flags}. */
    public static int folderFlags(int account, int index) { return 0; }

    /** {@code dialogFilters.get(index).name}. */
    public static String folderName(int account, int index) { return null; }

    /**
     * {@link #COLOR} for a color of 0 or more, {@link #TITLE_EMOJI} for title entities, and {@link #CHATS_ADDED},
     * {@link #CHATS_LEFT_OUT} and {@link #CHATS_PINNED} for alwaysShow, neverShow and pinnedDialogs holding any.
     */
    public static int folderChanges(int account, int index) { return 0; }

    /** {@code dialogFilters.get(index).color}: 0 and up for a tag color, -1 for none. */
    public static int folderColor(int account, int index) { return -1; }

    /** {@code dialogFiltersLimitPremium - 1} with Premium, {@code dialogFiltersLimitDefault} without. */
    public static int folderLimit(int account) { return 0; }

    /** {@code org.telegram.tgnet.RequestDelegate}, the callback Telegram's requests take. */
    public static Class<?> requestDelegate() { return null; }

    /** {@code TL_error.text}, such as {@code DIALOG_FILTERS_TOO_MUCH}. */
    public static String errorText(Object error) { return null; }

    /**
     * In a {@code messages.dialogFilters} answer, the folder with this id's {@code color} when its flag 27 says
     * it has one, -1 when it doesn't, and {@link #MISSING} when the answer doesn't list it.
     */
    public static int serverFolderColor(Object folders, int id) { return MISSING; }

    /** {@code messages.updateDialogFilter} for a new folder with these chat types, answered through {@code reply}. */
    public static void createFolder(int account, int id, String name, boolean contacts, boolean nonContacts,
            boolean groups, boolean channels, boolean bots, Object reply) {}

    /** A new local folder through {@code addFilter} and {@code saveDialogFilter}, then {@code dialogFiltersUpdated}. */
    public static void addFolder(int account, int id, String name, int flags) {}

    /** {@code messages.updateDialogFilter} with no filter, answered through {@code reply}. */
    public static void deleteFolder(int account, int id, Object reply) {}

    /** {@code removeFilter} and {@code deleteDialogFilter} for the local folder with this id, if there is one. */
    public static void dropFolder(int account, int id) {}

    /** {@code messages.updateDialogFiltersOrder} with every folder id in {@code dialogFilters}, answered through {@code reply}. */
    public static void sendFolderOrder(int account, Object reply) {}

    /** {@code messages.getDialogFilters}, answered through {@code reply}. */
    public static void fetchFolders(int account, Object reply) {}

    /** The local folder with this id gets this color, through {@code saveDialogFilter}, then {@code dialogFiltersUpdated}. */
    public static void setFolderColor(int account, int id, int color) {}
}
