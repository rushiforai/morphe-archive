/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.lang.reflect.Field;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.function.IntSupplier;
import java.util.function.LongPredicate;
import java.util.function.LongSupplier;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Special contacts: people you follow without saving them as contacts. Telegram already hands the
 * app everything this records, so nothing extra is asked of the server. Two hooks see it on its
 * way in: MessagesController.putUser, for every user Telegram stores, and the update loop, for
 * status, name, phone and typing updates. Both answer at once for anyone not tracked, and the
 * comparing and saving happen on a thread of their own.
 *
 * <p>Telegram has no update for a block, so that one is a guess: someone who blocks you shows no
 * last seen and no photo, both at once, and the history says it's a guess.
 */
public final class SpecialContacts {
    private SpecialContacts() {}

    private static final String FAMILY = FamilyNames.SHOW_LOCAL_IDS;
    private static final String FOLDER = "hushtelegram_special_contacts";

    static Executor work = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushTelegram SpecialContacts");
        thread.setDaemon(true);
        return thread;
    });

    /** The account Telegram is showing, whose profile menu and settings page these are. */
    static IntSupplier account = Accounts::selected;
    /** Whether a user is one of your own signed-in accounts, which can't be tracked. */
    static LongPredicate mine = id -> Accounts.ofUser(id) >= 0;
    static LongSupplier clock = System::currentTimeMillis;

    /** Telegram's stored copy of a user, read when tracking starts. */
    interface Users {
        Object find(int account, long id) throws ReflectiveOperationException;
    }

    static Users users = SpecialContacts::cachedUser;

    static volatile SpecialContactsStore store;

    static SpecialContactsStore store() {
        SpecialContactsStore found = store;
        if (found != null) return found;
        synchronized (SpecialContacts.class) {
            if (store == null) {
                Context context = Utils.getContext();
                if (context == null) return null;
                store = new SpecialContactsStore(new File(context.getNoBackupFilesDir(), FOLDER));
            }
            return store;
        }
    }

    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.SPECIAL_CONTACTS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "special contacts switch", failure);
            return false;
        }
    }

    // ---- Hooks ------------------------------------------------------------------------------

    /**
     * Called first thing in MessagesController.putUser with the user Telegram is about to store.
     * [fromCache] is non-zero for a user read back from Telegram's own database.
     */
    public static void user(Object controller, Object user, int fromCache) {
        if (controller == null || user == null) return;
        try {
            if (!on()) return;
            SpecialContactsStore found = store();
            if (found == null || found.nobody()) return;
            long id = number(read(user, "id"));
            if (id <= 0 || !found.anyTracked(id)) return;
            int account = Accounts.indexOf(controller);
            if (!found.trackedNow(account, id)) return;
            SpecialContactsStore.Seen seen = seen(user);
            if (seen == null) return;
            long now = clock.getAsLong();
            boolean cached = fromCache != 0;
            work.execute(() -> observe(found, account, id, seen, now, cached));
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "special contacts user", failure);
        }
    }

    /** Called first thing in MessagesController.processUpdateArray with the updates about to be applied. */
    public static void updates(Object controller, Object updates) {
        if (controller == null || !(updates instanceof List)) return;
        try {
            if (!on()) return;
            SpecialContactsStore found = store();
            if (found == null || found.nobody()) return;
            List<?> list = (List<?>) updates;
            int[] account = {UNREAD};
            long now = clock.getAsLong();
            for (int i = 0; i < list.size(); i++) {
                Object update = list.get(i);
                if (update == null) continue;
                String tag = tag(update.getClass());
                if (!tag.isEmpty()) update(found, controller, update, tag, account, now);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "special contacts updates", failure);
        }
    }

    private static final int UNREAD = Integer.MIN_VALUE;

    private static void update(SpecialContactsStore found, Object controller, Object update, String tag, int[] account, long now)
            throws IllegalAccessException {
        SpecialContactsStore.Seen seen = new SpecialContactsStore.Seen();
        long id;
        long chat = 0;
        String kind = "";
        switch (tag) {
            case "TL_updateUserStatus":
                id = number(read(update, "user_id"));
                if (!tracked(found, controller, id, account)) return;
                status(read(update, "status"), seen);
                if (seen.status == SpecialContactsStore.UNKNOWN) return;
                break;
            case "TL_updateUserName":
                id = number(read(update, "user_id"));
                if (!tracked(found, controller, id, account)) return;
                seen.name = name(read(update, "first_name"), read(update, "last_name"));
                seen.usernames = usernames(null, read(update, "usernames"));
                break;
            case "TL_updateUserPhone":
                id = number(read(update, "user_id"));
                if (!tracked(found, controller, id, account)) return;
                Object phone = read(update, "phone");
                seen.phone = phone instanceof String ? (String) phone : "";
                break;
            case "TL_updateUserTyping":
                id = number(read(update, "user_id"));
                if (!typing(read(update, "action")) || !tracked(found, controller, id, account)) return;
                kind = "u";
                break;
            case "TL_updateChatUserTyping":
                id = peerUser(read(update, "from_id"));
                if (!typing(read(update, "action")) || !tracked(found, controller, id, account)) return;
                chat = number(read(update, "chat_id"));
                kind = "c";
                break;
            case "TL_updateChannelUserTyping":
                id = peerUser(read(update, "from_id"));
                if (!typing(read(update, "action")) || !tracked(found, controller, id, account)) return;
                chat = number(read(update, "channel_id"));
                kind = "s";
                break;
            default:
                return;
        }
        int who = account[0];
        long person = id;
        if (kind.isEmpty()) {
            work.execute(() -> observe(found, who, person, seen, now, false));
        } else {
            long where = chat;
            String key = kind + where;
            work.execute(() -> typed(found, controller, who, person, where, key, now));
        }
    }

    private static boolean tracked(SpecialContactsStore found, Object controller, long id, int[] account) {
        if (id <= 0 || !found.anyTracked(id)) return false;
        if (account[0] == UNREAD) account[0] = Accounts.indexOf(controller);
        return found.trackedNow(account[0], id);
    }

    private static void observe(SpecialContactsStore found, int account, long id, SpecialContactsStore.Seen seen, long now, boolean cached) {
        try {
            if (!on()) return;
            if (!found.observe(account, id, seen, now, cached).isEmpty()) HookStatus.counted(FAMILY, "special contact change");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "special contacts record", failure);
        }
    }

    private static void typed(SpecialContactsStore found, Object controller, int account, long id, long chat, String key, long now) {
        try {
            if (!on()) return;
            String where = chat == 0 ? "" : chatTitle(controller, chat);
            if (found.typing(account, id, where, key, now) != null) HookStatus.counted(FAMILY, "special contact typing");
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "special contacts typing", failure);
        }
    }

    // ---- Reading Telegram's objects ---------------------------------------------------------

    /** What a TLRPC.User shows, or null for one that carries too little to compare (a min or empty user). */
    static SpecialContactsStore.Seen seen(Object user) throws IllegalAccessException {
        if (flag(user, "min") || tag(user.getClass()).equals("TL_userEmpty")) return null;
        SpecialContactsStore.Seen seen = new SpecialContactsStore.Seen();
        seen.deleted = flag(user, "deleted");
        seen.bot = flag(user, "bot");
        seen.name = name(read(user, "first_name"), read(user, "last_name"));
        if (seen.name == null && !seen.deleted) return null;
        seen.usernames = usernames(read(user, "username"), read(user, "usernames"));
        Object phone = read(user, "phone");
        seen.phone = phone instanceof String ? (String) phone : "";
        status(read(user, "status"), seen);
        Object photo = read(user, "photo");
        seen.photoKnown = true;
        if (photo != null && !tag(photo.getClass()).equals("TL_userProfilePhotoEmpty")) {
            seen.photoId = number(read(photo, "photo_id"));
            seen.personalPhoto = flag(photo, "personal");
        }
        seen.contactKnown = true;
        seen.contact = flag(user, "contact");
        seen.mutual = flag(user, "mutual_contact");
        return seen;
    }

    /** A UserStatus: no status at all reads as the one Telegram shows as "a long time ago". */
    private static void status(Object status, SpecialContactsStore.Seen seen) throws IllegalAccessException {
        if (status == null) {
            seen.status = SpecialContactsStore.HIDDEN;
            return;
        }
        switch (tag(status.getClass())) {
            case "TL_userStatusOnline":
                seen.status = SpecialContactsStore.ONLINE;
                seen.lastSeen = number(read(status, "expires"));
                break;
            case "TL_userStatusOffline":
                seen.status = SpecialContactsStore.OFFLINE;
                seen.lastSeen = number(read(status, "expires"));
                break;
            case "TL_userStatusRecently":
                seen.status = SpecialContactsStore.RECENTLY;
                break;
            case "TL_userStatusLastWeek":
                seen.status = SpecialContactsStore.WEEK;
                break;
            case "TL_userStatusLastMonth":
                seen.status = SpecialContactsStore.MONTH;
                break;
            case "TL_userStatusEmpty":
            case "TL_userStatusHidden":
                seen.status = SpecialContactsStore.HIDDEN;
                break;
            default:
                seen.status = SpecialContactsStore.UNKNOWN;
        }
    }

    private static String name(Object first, Object last) {
        String joined = ((first instanceof String ? (String) first : "") + " " + (last instanceof String ? (String) last : "")).trim();
        return joined.isEmpty() ? null : joined;
    }

    /** Every active username, sorted, as "@a, @b"; empty for none, null when neither field was there. */
    static String usernames(Object main, Object list) throws IllegalAccessException {
        if (!(list instanceof List) && !(main instanceof String)) return null;
        List<String> names = new ArrayList<>();
        Set<String> lower = new HashSet<>();
        if (main instanceof String && !((String) main).isEmpty()) {
            names.add((String) main);
            lower.add(((String) main).toLowerCase(java.util.Locale.ROOT));
        }
        if (list instanceof List) {
            List<?> items = (List<?>) list;
            for (int i = 0; i < items.size(); i++) {
                Object item = items.get(i);
                if (item == null || !flag(item, "active")) continue;
                Object each = read(item, "username");
                if (each instanceof String && !((String) each).isEmpty() && lower.add(((String) each).toLowerCase(java.util.Locale.ROOT))) {
                    names.add((String) each);
                }
            }
        }
        Collections.sort(names, String.CASE_INSENSITIVE_ORDER);
        StringBuilder text = new StringBuilder();
        for (String each : names) text.append(text.length() == 0 ? "" : ", ").append('@').append(each);
        return text.toString();
    }

    private static boolean typing(Object action) {
        return action != null && tag(action.getClass()).equals("TL_sendMessageTypingAction");
    }

    private static long peerUser(Object peer) throws IllegalAccessException {
        return peer == null ? 0 : number(read(peer, "user_id"));
    }

    /** A group's title, or its number when Telegram doesn't have it. */
    private static String chatTitle(Object controller, long chat) {
        try {
            Object found = HostNames.method(controller.getClass(), "getChat", Long.class).invoke(controller, Long.valueOf(chat));
            Object title = found == null ? null : read(found, "title");
            if (title instanceof String && !((String) title).isEmpty()) return (String) title;
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FAMILY, "special contacts chat title", unreadable);
        }
        return Long.toString(chat);
    }

    private static Object cachedUser(int account, long id) throws ReflectiveOperationException {
        Class<?> controller = Class.forName("org.telegram.messenger.MessagesController");
        Object instance = HostNames.method(controller, "getInstance", int.class).invoke(null, account);
        return instance == null ? null : HostNames.method(controller, "getUser", Long.class).invoke(instance, id);
    }

    /** The TL type a class is or extends, without a layer suffix, among the ones read here; empty for any other. */
    static String tag(Class<?> type) {
        String found = TAGS.get(type);
        if (found != null) return found;
        found = "";
        for (Class<?> each = type; each != null && each != Object.class; each = each.getSuperclass()) {
            String name = each.getName();
            name = name.substring(Math.max(name.lastIndexOf('$'), name.lastIndexOf('.')) + 1).replaceFirst("_layer\\d+$", "");
            if (KNOWN.contains(name)) {
                found = name;
                break;
            }
        }
        TAGS.put(type, found);
        return found;
    }

    private static final Set<String> KNOWN = new HashSet<>(Arrays.asList(
            "TL_userEmpty", "TL_userProfilePhotoEmpty", "TL_sendMessageTypingAction",
            "TL_userStatusOnline", "TL_userStatusOffline", "TL_userStatusRecently", "TL_userStatusLastWeek",
            "TL_userStatusLastMonth", "TL_userStatusEmpty", "TL_userStatusHidden",
            "TL_updateUserStatus", "TL_updateUserName", "TL_updateUserPhone", "TL_updateUserTyping",
            "TL_updateChatUserTyping", "TL_updateChannelUserTyping"));
    private static final ConcurrentHashMap<Class<?>, String> TAGS = new ConcurrentHashMap<>();

    private static final Object MISSING = new Object();
    private static final ConcurrentHashMap<Class<?>, ConcurrentHashMap<String, Object>> FIELDS = new ConcurrentHashMap<>();

    /** A public field of a TL object by its source name, or null where this build has none. */
    private static Object read(Object owner, String name) throws IllegalAccessException {
        Class<?> type = owner.getClass();
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
                HookStatus.missingMember(FAMILY, "field", type.getName(), name);
                field = MISSING;
            }
            fields.put(name, field);
        }
        return field == MISSING ? null : ((Field) field).get(owner);
    }

    private static boolean flag(Object owner, String name) throws IllegalAccessException {
        return Boolean.TRUE.equals(read(owner, name));
    }

    private static long number(Object value) {
        return value instanceof Number ? ((Number) value).longValue() : 0;
    }

    // ---- Profile menu -----------------------------------------------------------------------

    /** Called by {@link LocalIds#addToProfile} after its own rows: Track this user, or Stop tracking, on a user's profile. */
    static void addToProfile(View menu, long userId, long chatId) {
        if (menu == null || userId <= 0 || chatId != 0 || !on()) return;
        try {
            if (!PatchFamily.Capability.SPECIAL_CONTACTS.installed()) return;
            int shown = account.getAsInt();
            if (!SpecialContactsStore.validAccount(shown) || mine.test(userId)) return;
            SpecialContactsStore found = store();
            if (found == null) return;
            View row = LocalIds.nativeAddRow(menu, rowLabel(menu.getContext(), found.trackedNow(shown, userId)));
            if (row != null) bindRow(menu, row, found, shown, userId);
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "special contacts row", failure);
        }
    }

    static String rowLabel(Context context, boolean tracked) {
        return tracked ? L10n.t(context, "Stop tracking") : L10n.t(context, "Track this user");
    }

    private static void bindRow(View menu, View row, SpecialContactsStore found, int shown, long userId) {
        row.setOnClickListener(clicked -> {
            if (!on()) return;
            try {
                LocalIds.nativeDismiss(menu);
                Context context = clicked.getContext();
                Toast.makeText(context, toggle(context, found, shown, userId), Toast.LENGTH_SHORT).show();
            } catch (Throwable failure) {
                HookStatus.threw(FAMILY, "special contacts track", failure);
            }
        });
        // A switch change, Pause or safe mode hides an already built menu before its next draw, and
        // a change from the settings page shows in the label.
        row.getViewTreeObserver().addOnPreDrawListener(() -> {
            refresh(row, found, shown, userId);
            return true;
        });
        refresh(row, found, shown, userId);
    }

    private static void refresh(View row, SpecialContactsStore found, int shown, long userId) {
        int visibility = on() ? View.VISIBLE : View.GONE;
        if (row.getVisibility() != visibility) row.setVisibility(visibility);
        TextView text = textOf(row);
        String label = rowLabel(row.getContext(), found.trackedNow(shown, userId));
        if (text != null && !label.contentEquals(text.getText())) text.setText(label);
        if (!label.contentEquals(String.valueOf(row.getContentDescription()))) row.setContentDescription(label);
    }

    private static TextView textOf(View view) {
        if (view instanceof TextView) return (TextView) view;
        if (!(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            TextView found = textOf(group.getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }

    /** Starts or stops tracking [userId]; answers the toast to show. */
    static String toggle(Context context, SpecialContactsStore found, int shown, long userId) {
        String said;
        if (found.trackedNow(shown, userId)) {
            said = found.untrack(shown, userId) ? L10n.t(context, "Stopped tracking") : L10n.t(context, "Couldn't save that. Try again.");
            return said;
        }
        switch (found.track(shown, userId, seenNow(shown, userId), clock.getAsLong())) {
            case ADDED:
            case ALREADY:
                said = L10n.t(context, "Tracking this user");
                break;
            case FULL:
                said = L10n.t(context, "You can track up to 50 people");
                break;
            default:
                said = L10n.t(context, "Couldn't start tracking");
        }
        return said;
    }

    private static SpecialContactsStore.Seen seenNow(int shown, long userId) {
        try {
            Object user = users.find(shown, userId);
            return user == null ? null : seen(user);
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FAMILY, "special contacts lookup", unreadable);
            return null;
        }
    }

    // ---- Settings page ----------------------------------------------------------------------

    /** One tracked person on the settings page: the dialog title and the list line. */
    public static final class Tracked {
        public final long id;
        public final String title;
        public final String label;

        Tracked(long id, String title, String label) {
            this.id = id;
            this.title = title;
            this.label = label;
        }
    }

    /** What the Tracked people row says for the account Telegram is showing. */
    public static String summary() {
        SpecialContactsStore found = store();
        int count = found == null ? 0 : found.count(account.getAsInt());
        return count == 0 ? L10n.t("Nobody yet. Track someone from their profile's menu.")
                : L10n.quantity(count, "%1$d person tracked", "%1$d people tracked", count);
    }

    /** Everyone tracked for the account Telegram is showing, the most recently active first; null when unreadable. */
    public static List<Tracked> people(Context context) {
        SpecialContactsStore found = store();
        if (found == null) return null;
        List<Tracked> people = new ArrayList<>();
        for (SpecialContactsStore.Person person : found.list(account.getAsInt())) {
            String id = L10n.f(context, "User ID %1$s", Long.toString(person.id));
            String title = person.name.isEmpty() ? id : person.name;
            String second = person.username.isEmpty() ? id : person.username + " · " + id;
            people.add(new Tracked(person.id, title, person.name.isEmpty() ? second : person.name + "\n" + second));
        }
        return people;
    }

    /** A person's history, newest first, one line for each change. */
    public static String history(Context context, long id) {
        SpecialContactsStore found = store();
        List<SpecialContactsStore.Event> events = found == null ? Collections.emptyList() : found.history(account.getAsInt(), id);
        DateFormat format = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, L10n.locale(context));
        StringBuilder text = new StringBuilder();
        for (SpecialContactsStore.Event event : events) {
            String line = describe(context, event, format);
            if (line == null) continue;
            if (text.length() > 0) text.append('\n');
            text.append(format.format(new Date(event.at))).append("  ").append(line);
        }
        return text.length() == 0 ? L10n.t(context, "No history yet") : text.toString();
    }

    public static boolean clearHistory(long id) {
        SpecialContactsStore found = store();
        return found != null && found.clear(account.getAsInt(), id);
    }

    public static boolean stopTracking(long id) {
        SpecialContactsStore found = store();
        return found != null && found.untrack(account.getAsInt(), id);
    }

    /** One history line's words, or null for a kind this version doesn't know. */
    static String describe(Context context, SpecialContactsStore.Event event, DateFormat format) {
        String[] change = event.detail.split("\n", 2);
        String was = change[0];
        String now = change.length > 1 ? change[1] : "";
        switch (event.kind) {
            case SpecialContactsStore.TRACKED:
                return L10n.t(context, "Started tracking");
            case SpecialContactsStore.ONLINE_NOW:
                return L10n.t(context, "Came online");
            case SpecialContactsStore.OFFLINE_AT:
                long seconds = parse(event.detail);
                return seconds > 0 ? L10n.f(context, "Went offline, last seen %1$s", format.format(new Date(seconds * 1000L)))
                        : L10n.t(context, "Went offline");
            case SpecialContactsStore.SEEN_RECENTLY:
                return L10n.t(context, "Last seen recently");
            case SpecialContactsStore.SEEN_WEEK:
                return L10n.t(context, "Last seen within a week");
            case SpecialContactsStore.SEEN_MONTH:
                return L10n.t(context, "Last seen within a month");
            case SpecialContactsStore.SEEN_LONG_AGO:
                return L10n.t(context, "Last seen a long time ago");
            case SpecialContactsStore.TYPING:
                return event.detail.isEmpty() ? L10n.t(context, "Typing") : L10n.f(context, "Typing in %1$s", L10n.isolate(event.detail));
            case SpecialContactsStore.NAME:
                return L10n.f(context, "Changed name from %1$s to %2$s", orNone(context, was), orNone(context, now));
            case SpecialContactsStore.USERNAME:
                return L10n.f(context, "Changed username from %1$s to %2$s", orNone(context, was), orNone(context, now));
            case SpecialContactsStore.PHONE:
                return L10n.f(context, "Changed phone number from %1$s to %2$s", orNone(context, was), orNone(context, now));
            case SpecialContactsStore.PHOTO_ADDED:
                return L10n.t(context, "Added a profile photo");
            case SpecialContactsStore.PHOTO_REMOVED:
                return L10n.t(context, "Removed their profile photo");
            case SpecialContactsStore.PHOTO_CHANGED:
                return L10n.t(context, "Changed their profile photo");
            case SpecialContactsStore.CONTACT_SAVED:
                return L10n.t(context, "You saved them to your contacts");
            case SpecialContactsStore.CONTACT_REMOVED:
                return L10n.t(context, "You removed them from your contacts");
            case SpecialContactsStore.MUTUAL_ON:
                return L10n.t(context, "Added you to their contacts");
            case SpecialContactsStore.MUTUAL_OFF:
                return L10n.t(context, "Removed you from their contacts");
            case SpecialContactsStore.MAYBE_BLOCKED:
                return L10n.t(context, "May have blocked you. A guess: their photo and last seen went away together.");
            case SpecialContactsStore.MAYBE_UNBLOCKED:
                return L10n.t(context, "May have unblocked you. A guess: their photo or last seen came back.");
            case SpecialContactsStore.DELETED:
                return L10n.t(context, "Deleted their account");
            default:
                return null;
        }
    }

    private static String orNone(Context context, String value) {
        return value.isEmpty() ? L10n.t(context, "none") : L10n.isolate(value);
    }

    private static long parse(String digits) {
        try {
            return Long.parseLong(digits);
        } catch (NumberFormatException notANumber) {
            return 0;
        }
    }
}
