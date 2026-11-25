/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.view.View;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.LongPredicate;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.RenamePrompt;
import app.hushtelegram.extension.telegram.settings.SettingsEntry;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsLock;

/**
 * Rename on this phone (#104): a name you give a user, bot, group or channel that only this phone
 * shows, wherever Telegram shows that name.
 *
 * <p>The name goes on Telegram's own user and chat objects as MessagesController stores them, so
 * every screen that reads a name reads it, and the server's name waits in {@link #KEPT} so Remove
 * or the switch can put it back. Nothing leaves the phone: Telegram's database and the phone's
 * contacts are handed a copy with the server's name, a mention typed into a message is made of the
 * server's name, and the requests that carry a name Telegram took from those objects (adding a
 * contact, a group or channel title, a shared contact, a bot's name, a contacts import) get the
 * server's name back before they go out. Your own accounts are never renamed. The names
 * are kept by dialog id, the same peer on every account, so one list in the settings covers them
 * all and the settings file carries it.
 */
public final class LocalNames {
    private LocalNames() {}

    private static final String FAMILY = FamilyNames.SHOW_LOCAL_IDS;

    /** What the diagnostic report counts each name put on a user or chat as. */
    static final String RENAMED = "names shown on this phone";

    /** The most names one phone keeps, so the setting stays short. */
    public static final int MAX_NAMES = 50;

    /** The longest name, about what Telegram allows for a first name. */
    public static final int MAX_NAME_CHARS = 64;

    /** The longest list a write makes: per name a dialog id of up to 20 characters, a tab, the name and a line break. */
    public static final int MAX_TEXT = MAX_NAMES * (20 + 1 + MAX_NAME_CHARS + 1);

    /** The long press menu's Rename on this phone, past the two ids the removed Pin on this phone had. */
    static final int MENU_ID = 0x48544807;

    /** MessagesController's UPDATE_MASK_NAME, UPDATE_MASK_AVATAR and UPDATE_MASK_CHAT_NAME: what a redraw covers. */
    static final int REDRAW_MASK = 1 | 2 | 16;

    /** Encrypted chats and folders use these bits of a positive dialog id; neither has a name of its own here. */
    private static final long NOT_A_PEER = 0x6000000000000000L;

    /** What this needs from Telegram. A test answers it itself. */
    static Telegram telegram = new Reflected();

    /** Whether a user id is one of this phone's own accounts. A test answers it itself. */
    static LongPredicate mine = id -> Accounts.ofUser(id) >= 0;

    // ---- The list ---------------------------------------------------------------------------

    /**
     * The names in [text], one {@code id<TAB>name} line each as {@link #join} writes them, or null
     * for anything else: an id a chat can't have, padding, a repeat, a name that isn't
     * {@link #clean}, or more than {@link #MAX_NAMES}.
     */
    @Nullable
    static LinkedHashMap<Long, String> parse(@Nullable String text) {
        if (text == null || text.length() > MAX_TEXT) return null;
        LinkedHashMap<Long, String> names = new LinkedHashMap<>();
        if (text.isEmpty()) return names;
        for (String line : text.split("\n", -1)) {
            int tab = line.indexOf('\t');
            if (tab <= 0) return null;
            String digits = line.substring(0, tab);
            long id;
            try {
                id = Long.parseLong(digits);
            } catch (NumberFormatException notAnId) {
                return null;
            }
            String name = line.substring(tab + 1);
            if (!renamable(id) || !String.valueOf(id).equals(digits) || name.isEmpty() || !name.equals(clean(name))
                    || names.put(id, name) != null) {
                return null;
            }
        }
        return names.size() > MAX_NAMES ? null : names;
    }

    /** Whether [text] is one this would save, for a settings file's value. */
    public static boolean allowed(@Nullable String text) {
        return parse(text) != null;
    }

    /** How many names [text] gives, none for a value this never wrote. */
    public static int count(@Nullable String text) {
        Map<Long, String> names = parse(text);
        return names == null ? 0 : names.size();
    }

    static String join(Map<Long, String> names) {
        StringBuilder text = new StringBuilder();
        for (Map.Entry<Long, String> each : names.entrySet()) {
            if (text.length() > 0) text.append('\n');
            text.append(each.getKey()).append('\t').append(each.getValue());
        }
        return text.toString();
    }

    /**
     * A typed name as it's kept: control characters and line breaks become spaces, the ends are
     * trimmed, and anything past {@link #MAX_NAME_CHARS} is cut, never through a surrogate pair.
     */
    static String clean(@Nullable String typed) {
        if (typed == null) return "";
        StringBuilder out = new StringBuilder(typed.length());
        for (int i = 0; i < typed.length(); i++) {
            char c = typed.charAt(i);
            out.append(Character.isISOControl(c) || c == 0x2028 || c == 0x2029 ? ' ' : c);
        }
        String name = out.toString().trim();
        if (name.length() <= MAX_NAME_CHARS) return name;
        int end = MAX_NAME_CHARS;
        if (Character.isHighSurrogate(name.charAt(end - 1))) end--;
        return name.substring(0, end).trim();
    }

    /** Whether [dialog] is a person, bot, group or channel: not zero, an encrypted chat or a folder. */
    static boolean renamable(long dialog) {
        return dialog != 0 && dialog != Long.MIN_VALUE && (dialog < 0 || (dialog & NOT_A_PEER) == 0);
    }

    /** The saved names, paused or not, for a change to the list. */
    private static LinkedHashMap<Long, String> savedNames() {
        LinkedHashMap<Long, String> names = parse(Settings.LOCAL_NAME_LIST.savedValue());
        return names == null ? new LinkedHashMap<>() : names;
    }

    /** The list as last parsed, so a hook reads the setting's text and parses it again only when it changed. */
    private static volatile Parsed parsed = new Parsed("", Collections.emptyMap());

    private static final class Parsed {
        final String text;
        final Map<Long, String> names;

        Parsed(String text, Map<Long, String> names) {
            this.text = text;
            this.names = names;
        }
    }

    /** The names to show now: none while the switch is off, paused or the setting holds something this never wrote. */
    static Map<Long, String> names() {
        if (!Utils.settingsReady() || !Settings.LOCAL_NAMES.get()) return Collections.emptyMap();
        String text = Settings.LOCAL_NAME_LIST.get();
        Parsed last = parsed;
        if (Objects.equals(text, last.text)) return last.names;
        Map<Long, String> found = parse(text);
        found = found == null ? Collections.emptyMap() : Collections.unmodifiableMap(found);
        parsed = new Parsed(text == null ? "" : text, found);
        return found;
    }

    /** Whether the switch is on and this build carries the hooks, which pause turns off. */
    static boolean ready() {
        return Utils.settingsReady() && Settings.LOCAL_NAMES.get() && PatchFamily.Capability.LOCAL_NAMES.installed();
    }

    // ---- The names Telegram's objects hold --------------------------------------------------

    /** One user or chat on one account. */
    static final class Key {
        final boolean user;
        final int account;
        final long id;

        Key(boolean user, int account, long id) {
            this.user = user;
            this.account = account;
            this.id = id;
        }

        long dialog() {
            return user ? id : -id;
        }

        @Override public boolean equals(Object other) {
            if (!(other instanceof Key)) return false;
            Key key = (Key) other;
            return user == key.user && account == key.account && id == key.id;
        }

        @Override public int hashCode() {
            return Objects.hash(user, account, id);
        }
    }

    /** The server's name of a user (first and last) or a chat (its title in first), and the name shown in its place. */
    static final class Kept {
        @Nullable final Object first;
        @Nullable final Object last;
        @Nullable final Object phone;
        final String alias;

        Kept(@Nullable Object first, @Nullable Object last, @Nullable Object phone, String alias) {
            this.first = first;
            this.last = last;
            this.phone = phone;
            this.alias = alias;
        }
    }

    /**
     * Every user and chat object that shows a name given here, with the server's name it had. An
     * object shows a name only while it has an entry, so the entry is what puts the server's name
     * back and what the database and the requests are given instead.
     */
    static final ConcurrentHashMap<Key, Kept> KEPT = new ConcurrentHashMap<>();

    /** Puts [alias] on [user] for [account], keeping the server's name first. Safe to call again. */
    static void showUser(int account, long id, Object user, String alias) throws IllegalAccessException {
        Object first = read(user, "first_name");
        Object last = read(user, "last_name");
        if (!(first instanceof String) && !(last instanceof String)) return;
        Key key = new Key(true, account, id);
        Kept kept = KEPT.get(key);
        if (alias.equals(first) && isEmpty(last)) {
            // Already shown: an object put again, or a server name that is the same text.
            if (kept == null) KEPT.put(key, new Kept(first, last, read(user, "phone"), alias));
            return;
        }
        KEPT.put(key, new Kept(first, last, read(user, "phone"), alias));
        write(user, "first_name", alias);
        write(user, "last_name", "");
    }

    /** Puts [alias] on [chat] for [account], keeping its title first. Safe to call again. */
    static void showChat(int account, long id, Object chat, String alias) throws IllegalAccessException {
        Object title = read(chat, "title");
        if (!(title instanceof String)) return;
        Key key = new Key(false, account, id);
        if (alias.equals(title)) {
            if (!KEPT.containsKey(key)) KEPT.put(key, new Kept(title, null, null, alias));
            return;
        }
        KEPT.put(key, new Kept(title, null, null, alias));
        write(chat, "title", alias);
    }

    /** Gives [peer] its server name back, when it still shows the name [kept] put there. */
    static void restore(Object peer, Key key, Kept kept) throws IllegalAccessException {
        if (key.user) {
            if (!kept.alias.equals(read(peer, "first_name")) || !isEmpty(read(peer, "last_name"))) return;
            write(peer, "first_name", kept.first);
            write(peer, "last_name", kept.last);
        } else if (kept.alias.equals(read(peer, "title"))) {
            write(peer, "title", kept.first);
        }
    }

    // ---- Hooks ------------------------------------------------------------------------------

    /**
     * Called first thing in MessagesController.putUser, after Special contacts has read the user:
     * a user with a name given here gets it, unless it's the account itself.
     */
    public static void user(Object controller, Object user) {
        if (controller == null || user == null) return;
        try {
            watch();
            Map<Long, String> names = names();
            if (names.isEmpty()) return;
            long id = number(read(user, "id"));
            String alias = names.get(id);
            if (alias == null || id <= 0 || flag(user, "self") || mine.test(id)) return;
            int account = Accounts.indexOf(controller);
            if (account < 0) return;
            showUser(account, id, user, alias);
            HookStatus.counted(FAMILY, RENAMED);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names user", failure);
        }
    }

    /** Called first thing in MessagesController.putChat: a group or channel with a name given here gets it. */
    public static void chat(Object controller, Object chat) {
        if (controller == null || chat == null) return;
        try {
            Map<Long, String> names = names();
            if (names.isEmpty()) return;
            long id = number(read(chat, "id"));
            String alias = id > 0 ? names.get(-id) : null;
            if (alias == null) return;
            int account = Accounts.indexOf(controller);
            if (account < 0) return;
            showChat(account, id, chat, alias);
            HookStatus.counted(FAMILY, RENAMED);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names chat", failure);
        }
    }

    /**
     * Called first thing in MessagesController.processUpdateArray. Telegram writes a new name from
     * the server straight onto a user who isn't a contact; for a renamed one that becomes the
     * server's name kept here, and the update carries the name shown instead.
     */
    public static void updates(Object controller, Object updates) {
        if (controller == null || !(updates instanceof List) || KEPT.isEmpty()) return;
        try {
            List<?> list = (List<?>) updates;
            int account = Integer.MIN_VALUE;
            for (int i = 0; i < list.size(); i++) {
                Object update = list.get(i);
                if (update == null || !"TL_updateUserName".equals(tag(update.getClass()))) continue;
                if (account == Integer.MIN_VALUE) account = Accounts.indexOf(controller);
                if (account < 0) return;
                Key key = new Key(true, account, number(read(update, "user_id")));
                Kept kept = KEPT.get(key);
                if (kept == null) continue;
                Object user = telegram.userOf(controller, key.id);
                if (user == null || flag(user, "contact") || flag(user, "mutual_contact")) continue;
                KEPT.put(key, new Kept(read(update, "first_name"), read(update, "last_name"), kept.phone, kept.alias));
                write(update, "first_name", kept.alias);
                write(update, "last_name", "");
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names update", failure);
        }
    }

    /**
     * Called in MessagesStorage.putUsersInternal with each user about to be written: one that
     * shows a name given here goes in as a copy with the server's name, so the database never
     * holds it.
     */
    public static Object storedUser(Object storage, Object user) {
        if (storage == null || user == null || KEPT.isEmpty()) return user;
        try {
            Key key = new Key(true, Accounts.indexOf(storage), number(read(user, "id")));
            Kept kept = KEPT.get(key);
            if (kept == null || !kept.alias.equals(read(user, "first_name")) || !isEmpty(read(user, "last_name"))) return user;
            return withServerName(user, kept);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names stored user", failure);
            return user;
        }
    }

    /**
     * Called in place of Telegram's UserObject.getFirstName where a mention goes into the message
     * being typed, picked from the @ list or from a long press on someone's picture. The mention's
     * text goes out to everyone in the chat, so a renamed user is mentioned by the server's name.
     */
    public static String mentionName(Object user, int allowShort) {
        Kept kept = null;
        try {
            kept = user == null || KEPT.isEmpty() ? null : shownOn(user);
            if (kept != null) return telegram.firstName(withServerName(user, kept), allowShort != 0);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names mention", failure);
            // Never the given name: the server's, as it is, without Telegram's rule for a short one.
            if (kept != null) return isEmpty(kept.first) ? orEmpty(kept.last) : orEmpty(kept.first);
        }
        return telegram.firstName(user, allowShort != 0);
    }

    /**
     * Called first thing in ContactsController.applyContactToPhoneBook, which writes a Telegram
     * contact into the phone's contacts under Telegram's account: a renamed user goes in as a copy
     * with the server's name, so the given name never reaches the phone's contacts, or Telegram's
     * own copy of them when it reads them back.
     */
    public static Object phoneBookUser(Object contacts, Object operations, Object user) {
        if (contacts == null || user == null || KEPT.isEmpty()) return user;
        try {
            Kept kept = KEPT.get(new Key(true, Accounts.indexOf(contacts), number(read(user, "id"))));
            if (kept == null || !kept.alias.equals(read(user, "first_name")) || !isEmpty(read(user, "last_name"))) return user;
            return withServerName(user, kept);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names phone book", failure);
            return user;
        }
    }

    /** What [user] shows a name given here from, on whichever account; null when it shows its own. */
    @Nullable
    private static Kept shownOn(Object user) throws IllegalAccessException {
        Object first = read(user, "first_name");
        if (!(first instanceof String) || !isEmpty(read(user, "last_name"))) return null;
        long id = number(read(user, "id"));
        for (Map.Entry<Key, Kept> each : KEPT.entrySet()) {
            if (each.getKey().user && each.getKey().id == id && each.getValue().alias.equals(first)) return each.getValue();
        }
        return null;
    }

    /** A copy of [user] with the server's name [kept] holds; [user] keeps showing the given one. */
    private static Object withServerName(Object user, Kept kept) throws ReflectiveOperationException {
        Object copy = copy(user);
        write(copy, "first_name", kept.first);
        write(copy, "last_name", kept.last);
        return copy;
    }

    /** {@link #storedUser} for MessagesStorage.putChatsInternal and a chat's title. */
    public static Object storedChat(Object storage, Object chat) {
        if (storage == null || chat == null || KEPT.isEmpty()) return chat;
        try {
            Key key = new Key(false, Accounts.indexOf(storage), number(read(chat, "id")));
            Kept kept = KEPT.get(key);
            if (kept == null || !kept.alias.equals(read(chat, "title"))) return chat;
            Object copy = copy(chat);
            write(copy, "title", kept.first);
            return copy;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names stored chat", failure);
            return chat;
        }
    }

    /**
     * The request gate, called first thing in ConnectionsManager's one send. Never drops anything:
     * a request that carries a name given here, which Telegram took from a renamed object, gets the
     * server's name back. Adding a contact, a group's or channel's title, a shared contact card, a
     * bot's name and a contacts import are the requests that carry a name.
     */
    public static boolean outgoing(Object connections, Object request, Object callback) {
        if (connections == null || request == null || KEPT.isEmpty()) return false;
        try {
            String kind = tag(request.getClass());
            if (!REQUESTS.contains(kind)) return false;
            int account = Accounts.indexOf(connections);
            if (account < 0) return false;
            switch (kind) {
                case "TL_contacts_addContact": {
                    Kept kept = KEPT.get(new Key(true, account, number(read(read(request, "id"), "user_id"))));
                    if (kept != null && kept.alias.equals(read(request, "first_name")) && isEmpty(read(request, "last_name"))) {
                        write(request, "first_name", orEmpty(kept.first));
                        write(request, "last_name", orEmpty(kept.last));
                        HookStatus.counted(FAMILY, KEPT_OFF);
                    }
                    break;
                }
                case "TL_messages_editChatTitle":
                    title(request, KEPT.get(new Key(false, account, number(read(request, "chat_id")))));
                    break;
                case "TL_channels_editTitle":
                    title(request, KEPT.get(new Key(false, account, number(read(read(request, "channel"), "channel_id")))));
                    break;
                case "setBotInfo": {
                    Kept kept = KEPT.get(new Key(true, account, number(read(read(request, "bot"), "user_id"))));
                    if (kept != null && kept.alias.equals(read(request, "name"))) {
                        write(request, "name", orEmpty(kept.first));
                        HookStatus.counted(FAMILY, KEPT_OFF);
                    }
                    break;
                }
                case "TL_messages_sendMedia":
                case "TL_messages_editMessage":
                    card(account, read(request, "media"), "phone_number", false);
                    break;
                case "TL_messages_sendMultiMedia": {
                    Object items = read(request, "multi_media");
                    for (int i = 0; items instanceof List && i < ((List<?>) items).size(); i++) {
                        Object item = ((List<?>) items).get(i);
                        if (item != null) card(account, read(item, "media"), "phone_number", false);
                    }
                    break;
                }
                case "TL_contacts_importContacts": {
                    Object contacts = read(request, "contacts");
                    for (int i = 0; contacts instanceof List && i < ((List<?>) contacts).size(); i++) {
                        Object contact = ((List<?>) contacts).get(i);
                        if (contact != null) card(account, contact, "phone", true);
                    }
                    break;
                }
                default:
                    break;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names request", failure);
        }
        return false;
    }

    /** What the diagnostic report counts each request given the server's name back as. */
    static final String KEPT_OFF = "names kept off a request";

    private static final Set<String> REQUESTS = new HashSet<>(Arrays.asList(
            "TL_contacts_addContact", "TL_messages_editChatTitle", "TL_channels_editTitle", "setBotInfo",
            "TL_messages_sendMedia", "TL_messages_editMessage", "TL_messages_sendMultiMedia", "TL_contacts_importContacts"));

    private static void title(Object request, @Nullable Kept kept) throws IllegalAccessException {
        if (kept == null || !kept.alias.equals(read(request, "title"))) return;
        write(request, "title", orEmpty(kept.first));
        HookStatus.counted(FAMILY, KEPT_OFF);
    }

    /**
     * A contact card ([card] an input contact media or phone contact) that names a renamed user:
     * Telegram copied the shown name into it, so it gets the server's. The user is the one whose
     * number matches, or for a shared card ([byPhoneOnly] false) the only renamed user with that name.
     */
    private static void card(int account, @Nullable Object card, String phoneField, boolean byPhoneOnly) throws IllegalAccessException {
        if (card == null || !"TL_inputMediaContact".equals(tag(card.getClass())) && !"TL_inputPhoneContact".equals(tag(card.getClass()))) return;
        Object first = read(card, "first_name");
        if (!(first instanceof String) || !isEmpty(read(card, "last_name"))) return;
        String phone = digits(read(card, phoneField));
        Kept byPhone = null;
        Kept byName = null;
        int named = 0;
        for (Map.Entry<Key, Kept> each : KEPT.entrySet()) {
            Key key = each.getKey();
            Kept kept = each.getValue();
            if (!key.user || key.account != account || !kept.alias.equals(first)) continue;
            named++;
            byName = kept;
            if (!phone.isEmpty() && phone.equals(digits(kept.phone))) byPhone = kept;
        }
        Kept found = byPhone != null ? byPhone : !byPhoneOnly && named == 1 ? byName : null;
        if (found == null) return;
        write(card, "first_name", orEmpty(found.first));
        write(card, "last_name", orEmpty(found.last));
        Object vcard = readOptional(card, "vcard");
        if (vcard instanceof String && ((String) vcard).contains((String) first)) {
            String server = (orEmpty(found.first) + " " + orEmpty(found.last)).trim();
            write(card, "vcard", ((String) vcard).replace((String) first, server));
        }
        HookStatus.counted(FAMILY, KEPT_OFF);
    }

    // ---- Long press menu --------------------------------------------------------------------

    /** Each chat list's Rename on this phone item, so it can follow the switch and the selection. Main thread only. */
    private static final Map<Object, WeakReference<View>> ITEMS = new WeakHashMap<>();

    /** Called by {@link HiddenChats#menuItem} after Record calls here: adds Rename on this phone. */
    static void menuItem(Object list, Object more) {
        try {
            Context context = Utils.getContext();
            int icon = context == null ? 0 : context.getResources().getIdentifier("msg_edit", "drawable", context.getPackageName());
            Object item = HiddenChats.telegram.addMenuItem(more, MENU_ID, icon, L10n.t("Rename on this phone"));
            if (item instanceof View) ITEMS.put(list, new WeakReference<>((View) item));
            menuShown(list);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "rename on this phone item", failure);
        }
    }

    /** Called by {@link HiddenChats#menuShown}: the item shows while the switch is on and one chat it can rename is selected. */
    static void menuShown(Object list) {
        WeakReference<View> held = ITEMS.get(list);
        View item = held == null ? null : held.get();
        if (item == null) return;
        boolean shown = false;
        try {
            shown = ready() && single(HiddenChats.telegram.selectedOf(list)) != 0;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "rename on this phone item", failure);
        }
        item.setVisibility(shown ? View.VISIBLE : View.GONE);
    }

    /** Called by {@link HiddenChats#menuChoice} for a tap on the item: asks for the name, and closes the selection. */
    static int menuChoice(Object listener, int id) {
        try {
            if (!ready() || SettingsLock.refuses()) return id;
            long dialog = single(HiddenChats.telegram.selectedChats(listener));
            Activity activity = SettingsEntry.inFront();
            if (dialog != 0 && activity != null) ask(activity, dialog);
            return HiddenChats.CLOSE_SELECTION;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "rename on this phone", failure);
            return id;
        }
    }

    /** The one chat in [selected] this can rename, or 0 when there's none or more than one. */
    static long single(@Nullable List<?> selected) {
        if (selected == null || selected.size() != 1 || !(selected.get(0) instanceof Long)) return 0;
        long dialog = (Long) selected.get(0);
        return renamable(dialog) && (dialog < 0 || !mine.test(dialog)) ? dialog : 0;
    }

    // ---- Profile menu -----------------------------------------------------------------------

    /** Called by {@link LocalIds#addToProfile} after its rows: Rename on this phone, on anyone's profile but your own. */
    static void addToProfile(View menu, long userId, long chatId) {
        if (menu == null) return;
        try {
            if (!ready()) return;
            long dialog = userId > 0 && chatId == 0 ? userId : chatId > 0 && userId == 0 ? -chatId : 0;
            if (!renamable(dialog) || (dialog > 0 && mine.test(dialog))) return;
            View row = LocalIds.nativeAddRow(menu, L10n.t(menu.getContext(), "Rename on this phone"));
            if (row == null) return;
            row.setOnClickListener(clicked -> {
                try {
                    if (!ready()) return;
                    LocalIds.nativeDismiss(menu);
                    if (SettingsLock.refuses()) return;
                    Activity activity = activityOf(clicked.getContext());
                    if (activity != null) ask(activity, dialog);
                } catch (Throwable failure) {
                    HookStatus.threw(FAMILY, "rename on this phone", failure);
                }
            });
            // A switch change, Pause or safe mode hides an already built menu before its next draw.
            row.getViewTreeObserver().addOnPreDrawListener(() -> {
                int visibility = ready() ? View.VISIBLE : View.GONE;
                if (row.getVisibility() != visibility) row.setVisibility(visibility);
                return true;
            });
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "rename on this phone row", failure);
        }
    }

    @Nullable
    private static Activity activityOf(@Nullable Context context) {
        for (Context each = context; each != null; each = each instanceof ContextWrapper ? ((ContextWrapper) each).getBaseContext() : null) {
            if (each instanceof Activity) return (Activity) each;
            if (!(each instanceof ContextWrapper)) break;
        }
        return SettingsEntry.inFront();
    }

    // ---- Renaming ---------------------------------------------------------------------------

    /** Opens the name prompt for [dialog], filled with the name shown now. */
    static void ask(Activity activity, long dialog) {
        String given = savedNames().get(dialog);
        String shown = given;
        if (shown == null) {
            String name = telegram.peerName(Accounts.selected(), dialog);
            shown = name == null ? "" : clean(name);
        }
        RenamePrompt.ask(activity, shown, given != null, typed -> save(dialog, typed));
    }

    /**
     * Saves [typed] as [dialog]'s name, or removes its name when that's empty, then shows the
     * change on every account at once. Read and written in one queued task, so two quick renames
     * don't drop each other's names.
     */
    static void save(long dialog, @Nullable String typed) {
        String name = clean(typed);
        boolean removing = name.isEmpty();
        boolean queued = Utils.runInOrderOnBackgroundThread(() -> {
            LinkedHashMap<Long, String> names = savedNames();
            if (removing) names.remove(dialog);
            else names.put(dialog, name);
            boolean full = names.size() > MAX_NAMES;
            boolean saved = !full && Settings.LOCAL_NAME_LIST.saveCommitted(join(names));
            Utils.runOnMainThread(() -> {
                if (full) {
                    Utils.showToastLong(L10n.f("You can rename up to %1$d chats on this phone.", MAX_NAMES));
                } else if (!saved) {
                    Utils.showToastLong(L10n.t("Couldn't save the name. Try again in a moment."));
                } else {
                    sync();
                    Utils.showToastShort(removing ? L10n.t("Telegram's name is back.") : L10n.t("Renamed on this phone."));
                }
            });
        });
        if (!queued) Utils.showToastLong(L10n.t("Couldn't save the name. Try again in a moment."));
    }

    /**
     * Makes Telegram's objects match the switch and the list: a name taken off or changed gives the
     * server's back, and every user and chat in memory on each signed-in account with a name here
     * gets it. Then every account's screens draw their names again. Main thread only.
     */
    static void sync() {
        try {
            Map<Long, String> wanted = Utils.settingsReady() && PatchFamily.Capability.LOCAL_NAMES.installed()
                    ? names() : Collections.emptyMap();
            for (Map.Entry<Key, Kept> each : new ArrayList<>(KEPT.entrySet())) {
                Key key = each.getKey();
                Kept kept = each.getValue();
                if (kept.alias.equals(wanted.get(key.dialog()))) continue;
                Object peer = key.user ? telegram.user(key.account, key.id) : telegram.chat(key.account, key.id);
                if (peer != null) restore(peer, key, kept);
                KEPT.remove(key, kept);
            }
            List<Integer> accounts = telegram.accounts();
            for (int account : accounts) {
                for (Map.Entry<Long, String> each : wanted.entrySet()) {
                    long dialog = each.getKey();
                    if (dialog > 0) {
                        Object user = telegram.user(account, dialog);
                        if (user != null && !flag(user, "self") && !mine.test(dialog)) showUser(account, dialog, user, each.getValue());
                    } else {
                        Object chat = telegram.chat(account, -dialog);
                        if (chat != null) showChat(account, -dialog, chat, each.getValue());
                    }
                }
            }
            telegram.redraw(accounts);
            HiddenChats.refreshAll();
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "local names refresh", failure);
        }
    }

    /** Hears the switch and the list change (the switch, an import, a reset), so the names on screen follow. */
    private static final SharedPreferences.OnSharedPreferenceChangeListener WATCH = (store, changed) -> {
        if (!Settings.LOCAL_NAMES.key.equals(changed) && !Settings.LOCAL_NAME_LIST.key.equals(changed)) return;
        Utils.runOnMainThread(LocalNames::sync);
    };

    /** The store {@link #WATCH} listens to. Held here: the settings file keeps only a weak reference to it. */
    private static volatile SharedPreferences watched;

    /** Watches the switch and the list from the first user Telegram stores. */
    private static void watch() {
        if (!Utils.settingsReady()) return;
        SharedPreferences store = Setting.preferences.preferences;
        if (watched == store) return;
        synchronized (LocalNames.class) {
            if (watched == store) return;
            if (watched != null) watched.unregisterOnSharedPreferenceChangeListener(WATCH);
            store.registerOnSharedPreferenceChangeListener(WATCH);
            watched = store;
        }
    }

    // ---- Reflection -------------------------------------------------------------------------

    /** The TL type a class is, without its outer class or a layer suffix. */
    static String tag(Class<?> type) {
        String found = TAGS.get(type);
        if (found != null) return found;
        String name = type.getName();
        found = name.substring(Math.max(name.lastIndexOf('$'), name.lastIndexOf('.')) + 1).replaceFirst("_layer\\d+$", "");
        TAGS.put(type, found);
        return found;
    }

    private static final ConcurrentHashMap<Class<?>, String> TAGS = new ConcurrentHashMap<>();
    private static final Object MISSING = new Object();
    private static final ConcurrentHashMap<Class<?>, ConcurrentHashMap<String, Object>> FIELDS = new ConcurrentHashMap<>();
    private static final ConcurrentHashMap<Class<?>, Field[]> COPIED = new ConcurrentHashMap<>();

    @Nullable
    private static Field field(Class<?> type, String name, boolean report) {
        ConcurrentHashMap<String, Object> fields = FIELDS.get(type);
        if (fields == null) {
            fields = new ConcurrentHashMap<>();
            ConcurrentHashMap<String, Object> raced = FIELDS.putIfAbsent(type, fields);
            if (raced != null) fields = raced;
        }
        Object field = fields.get(name);
        if (field == null) {
            try {
                Field found = HostNames.field(type, name);
                found.setAccessible(true);
                field = found;
            } catch (NoSuchFieldException | RuntimeException missing) {
                if (report) HookStatus.missingMember(FAMILY, "field", type.getName(), name);
                field = MISSING;
            }
            fields.put(name, field);
        }
        return field == MISSING ? null : (Field) field;
    }

    /** A public field of a TL object by its source name, or null where this build has none. */
    @Nullable
    static Object read(@Nullable Object owner, String name) throws IllegalAccessException {
        if (owner == null) return null;
        Field field = field(owner.getClass(), name, true);
        return field == null ? null : field.get(owner);
    }

    /** {@link #read} for a field some builds don't have, without reporting it missing. */
    @Nullable
    private static Object readOptional(Object owner, String name) throws IllegalAccessException {
        Field field = field(owner.getClass(), name, false);
        return field == null ? null : field.get(owner);
    }

    private static void write(Object owner, String name, @Nullable Object value) throws IllegalAccessException {
        Field field = field(owner.getClass(), name, true);
        if (field == null) throw new IllegalAccessException(owner.getClass().getName() + " has no " + name);
        field.set(owner, value);
    }

    /** A new object of [original]'s class with each of its fields, for the database to serialize instead. */
    static Object copy(Object original) throws ReflectiveOperationException {
        Class<?> type = original.getClass();
        Constructor<?> make = type.getDeclaredConstructor();
        make.setAccessible(true);
        Object copy = make.newInstance();
        Field[] fields = COPIED.get(type);
        if (fields == null) {
            List<Field> found = new ArrayList<>();
            for (Class<?> each = type; each != null && each != Object.class; each = each.getSuperclass()) {
                for (Field field : each.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) continue;
                    field.setAccessible(true);
                    found.add(field);
                }
            }
            fields = found.toArray(new Field[0]);
            COPIED.put(type, fields);
        }
        for (Field field : fields) field.set(copy, field.get(original));
        return copy;
    }

    private static boolean flag(Object owner, String name) throws IllegalAccessException {
        return Boolean.TRUE.equals(read(owner, name));
    }

    private static long number(@Nullable Object value) {
        return value instanceof Number ? ((Number) value).longValue() : 0;
    }

    private static boolean isEmpty(@Nullable Object text) {
        return text == null || (text instanceof String && ((String) text).isEmpty());
    }

    private static String orEmpty(@Nullable Object text) {
        return text instanceof String ? (String) text : "";
    }

    private static String digits(@Nullable Object text) {
        if (!(text instanceof String)) return "";
        StringBuilder out = new StringBuilder();
        for (char c : ((String) text).toCharArray()) if (c >= '0' && c <= '9') out.append(c);
        return out.toString();
    }

    /** What this needs from Telegram. */
    interface Telegram {
        @Nullable
        Object user(int account, long id);

        @Nullable
        Object chat(int account, long id);

        /** The user [controller] holds, from inside its own update handling. */
        @Nullable
        Object userOf(Object controller, long id);

        /** The signed-in accounts' indexes. */
        List<Integer> accounts();

        /** Has each of [accounts]' screens draw names again. */
        void redraw(List<Integer> accounts) throws ReflectiveOperationException;

        @Nullable
        String peerName(int account, long dialog);

        /** Telegram's own first name of [user] (UserObject.getFirstName), the text a mention is made of. */
        String firstName(@Nullable Object user, boolean allowShort);
    }

    private static final class Reflected implements Telegram {
        private static final String CONTROLLER = "org.telegram.messenger.MessagesController";
        private static final String NOTIFICATION_CENTER = "org.telegram.messenger.NotificationCenter";
        private static final String USER_OBJECT = "org.telegram.messenger.UserObject";
        private static final String USER = "org.telegram.tgnet.TLRPC$User";

        private static volatile Method firstName;

        @Nullable
        private static Object controller(int account) throws ReflectiveOperationException {
            return HostNames.method(Class.forName(CONTROLLER), "getInstance", int.class).invoke(null, account);
        }

        @Override public Object user(int account, long id) {
            try {
                Object controller = controller(account);
                return controller == null ? null : userOf(controller, id);
            } catch (ReflectiveOperationException | RuntimeException failure) {
                HookStatus.threw(FAMILY, "local names user lookup", failure);
                return null;
            }
        }

        @Override public Object chat(int account, long id) {
            try {
                Object controller = controller(account);
                return controller == null ? null
                        : HostNames.method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(id));
            } catch (ReflectiveOperationException | RuntimeException failure) {
                HookStatus.threw(FAMILY, "local names chat lookup", failure);
                return null;
            }
        }

        @Override public Object userOf(Object controller, long id) {
            try {
                return HostNames.method(controller.getClass(), "getUser", Long.class).invoke(controller, Long.valueOf(id));
            } catch (ReflectiveOperationException | RuntimeException failure) {
                HookStatus.threw(FAMILY, "local names user lookup", failure);
                return null;
            }
        }

        @Override public List<Integer> accounts() {
            List<Integer> found = new ArrayList<>();
            for (Accounts.Entry each : Accounts.signedIn()) found.add(each.index);
            return found;
        }

        @Override public void redraw(List<Integer> accounts) throws ReflectiveOperationException {
            Class<?> centers = Class.forName(NOTIFICATION_CENTER);
            Method instance = HostNames.method(centers, "getInstance", int.class);
            Method post = HostNames.method(centers, "postNotificationName", int.class, Object[].class);
            int interfaces = HostNames.field(centers, "updateInterfaces").getInt(null);
            for (int account : accounts) {
                Object center = instance.invoke(null, account);
                // Screens that read updateInterfaces cast its first argument to the mask of what changed.
                if (center != null) post.invoke(center, interfaces, new Object[] {Integer.valueOf(REDRAW_MASK)});
            }
        }

        @Override public String peerName(int account, long dialog) {
            return HiddenChats.telegram.peerName(account, dialog);
        }

        @Override public String firstName(Object user, boolean allowShort) {
            try {
                Method found = firstName;
                if (found == null) {
                    found = HostNames.method(Class.forName(USER_OBJECT), "getFirstName", Class.forName(USER), boolean.class);
                    firstName = found;
                }
                Object name = found.invoke(null, user, allowShort);
                if (name instanceof String) return (String) name;
            } catch (ReflectiveOperationException | RuntimeException failure) {
                HookStatus.threw(FAMILY, "local names mention name", failure);
            }
            // Telegram's rule, short of its fallbacks: the first name, or the last one when there's none.
            try {
                if (user == null) return "";
                Object first = read(user, "first_name");
                return isEmpty(first) ? orEmpty(read(user, "last_name")) : (String) first;
            } catch (IllegalAccessException | RuntimeException failure) {
                return "";
            }
        }
    }
}
