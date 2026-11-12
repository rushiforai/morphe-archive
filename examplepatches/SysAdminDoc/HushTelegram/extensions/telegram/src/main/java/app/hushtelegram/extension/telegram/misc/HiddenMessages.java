/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Hide for me in the message menu (#20): a message you pick leaves the chat on this phone only.
 *
 * <p>The open chat tests each message's type as it loads a page and as new ones arrive, and skips
 * a negative one without counting it. This answers -1 there for a hidden message, so it stays out
 * every time the chat opens. Hiding one also hands the open chat Telegram's own "messages deleted"
 * notice for it, so it goes at once. Nothing reaches the server: everyone else still has the
 * message, and it comes back the moment the switch goes off or Show hidden messages clears the list.
 *
 * <p>Scheduled messages, quick replies and messages still sending have ids of their own and are
 * never hidden. A live location isn't either, since the deleted notice would end its sharing.
 *
 * <p>Each account keeps its own list on this phone, by the account's user id, the newest
 * {@link #LIMIT} messages.
 */
public final class HiddenMessages {
    private HiddenMessages() {}

    /** What a hidden message's type reads as in the open chat's test, which skips it. */
    static final int HIDDEN = -1;

    /** How many hidden messages each account keeps; the oldest goes past it. */
    static final int LIMIT = 2000;

    private static final String PREFS = "hushtelegram_hidden_messages";

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** Each account's hidden messages by user id, oldest first, each set never changed once published. Null until first read. */
    private static volatile Map<Long, Set<String>> hidden;

    /**
     * Injected after each type read in the open chat's message tests.
     *
     * @param message the message being tested
     * @param type the message's own type
     * @return the same type, or {@link #HIDDEN} for a message hidden on this phone
     */
    public static int type(Object message, int type) {
        if (type < 0 || message == null || !MessageMenu.on(Settings.MESSAGE_MENU_HIDE)) return type;
        try {
            Map<Long, Set<String>> all = all();
            if (all.isEmpty()) return type;
            int id = MessageMenu.id(message);
            if (id <= 0 || apart(message)) return type;
            Set<String> mine = all.get(MessageMenu.selfId(MessageMenu.account(message)));
            if (mine == null || !mine.contains(key(MessageMenu.dialog(message), id))) return type;
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "hidden message left out");
            return HIDDEN;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "hidden message", failure);
            return type;
        }
    }

    /** Whether the menu offers Hide for me on the message: the switch is on, the build hides, and the message can be. */
    static boolean offered(Object message) {
        return MessageMenu.on(Settings.MESSAGE_MENU_HIDE) && PatchFamily.Capability.HIDE_FOR_ME.installed()
                && hideable(message) && MessageMenu.selfId(MessageMenu.account(message)) != 0;
    }

    /** A message the chat lists by its own id, and not a live location. */
    static boolean hideable(Object message) {
        return MessageMenu.id(message) > 0 && !apart(message) && !live(message);
    }

    /** Hides the message, its whole album when it's in one, and takes it out of the open chat. */
    static void hide(Context context, Object chat, Object message) {
        long owner = MessageMenu.selfId(MessageMenu.account(message));
        ArrayList<Integer> ids = new ArrayList<>();
        List<String> keys = new ArrayList<>();
        for (Object each : MessageMenu.batch(chat, message)) {
            if (!hideable(each)) continue;
            int id = MessageMenu.id(each);
            ids.add(id);
            keys.add(key(MessageMenu.dialog(each), id));
        }
        if (owner == 0 || ids.isEmpty() || !remember(owner, keys)) {
            MessageMenu.feedback(context, L10n.t(context, "Couldn't complete that action. Try again."));
            return;
        }
        Utils.runOnMainThread(() -> {
            try {
                vanish(message, ids);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "hidden message removal", failure);
            }
        });
        MessageMenu.feedback(context, L10n.t(context, "Hidden on this phone."));
        HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "message hidden");
    }

    /**
     * Adds [keys] to what [owner] hides, newest last, and forgets the oldest past {@link #LIMIT}.
     *
     * @return whether the list reached the disk
     */
    static synchronized boolean remember(long owner, List<String> keys) {
        try {
            Map<Long, Set<String>> all = all();
            Set<String> before = all.get(owner);
            LinkedHashSet<String> mine = before == null ? new LinkedHashSet<>() : new LinkedHashSet<>(before);
            for (String key : keys) {
                mine.remove(key);
                mine.add(key);
            }
            for (Iterator<String> oldest = mine.iterator(); mine.size() > LIMIT && oldest.hasNext(); ) {
                oldest.next();
                oldest.remove();
            }
            if (!store.apply(Utils.getContext()).edit().putString(String.valueOf(owner), String.join(",", mine)).commit()) return false;
            Map<Long, Set<String>> next = new HashMap<>(all);
            next.put(owner, Collections.unmodifiableSet(mine));
            hidden = next;
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "saving a hidden message", failure);
            return false;
        }
    }

    /**
     * The Show hidden messages row: every account's list goes. Works with the switch off or paused
     * too, since the tap is the request.
     *
     * @return how many messages were hidden, or -1 when the list couldn't be cleared
     */
    public static synchronized int showAll() {
        HookStatus.invoked(FamilyNames.MESSAGE_MENU_REPEAT);
        try {
            int count = 0;
            for (Set<String> mine : all().values()) count += mine.size();
            if (!store.apply(Utils.getContext()).edit().clear().commit()) return -1;
            hidden = Collections.emptyMap();
            if (count > 0) HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "hidden messages shown again");
            return count;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "showing hidden messages", failure);
            return -1;
        }
    }

    /** What the row says right after showing [count] messages again. */
    public static String shownMessage(int count) {
        if (count < 0) return L10n.t("Couldn't complete that action. Try again.");
        if (count == 0) return L10n.t("No messages are hidden.");
        return L10n.quantity(count, "%1$d message shows again.", "%1$d messages show again.", count);
    }

    /** Every account's list, read from the disk the first time. */
    private static Map<Long, Set<String>> all() {
        Map<Long, Set<String>> read = hidden;
        if (read != null) return read;
        synchronized (HiddenMessages.class) {
            if (hidden != null) return hidden;
            Map<Long, Set<String>> loaded = new HashMap<>();
            for (Map.Entry<String, ?> entry : store.apply(Utils.getContext()).getAll().entrySet()) {
                if (!(entry.getValue() instanceof String) || ((String) entry.getValue()).isEmpty()) continue;
                long owner;
                try {
                    owner = Long.parseLong(entry.getKey());
                } catch (NumberFormatException other) {
                    continue;
                }
                LinkedHashSet<String> mine = new LinkedHashSet<>();
                Collections.addAll(mine, ((String) entry.getValue()).split(","));
                loaded.put(owner, Collections.unmodifiableSet(mine));
            }
            hidden = loaded;
            return loaded;
        }
    }

    static String key(long dialog, int id) {
        return dialog + ":" + id;
    }

    static synchronized void forgetForTests() {
        hidden = null;
    }

    /** Whether the message is scheduled or a quick reply, both of which number their messages apart from the chat. Replaced when patching. */
    public static boolean apart(Object message) { return true; }

    /** Whether the message is a live location. Replaced when patching. */
    public static boolean live(Object message) { return true; }

    /** Posts Telegram's "messages deleted" notice for [ids] in the message's chat, which only the screens showing them act on. Replaced when patching. */
    public static void vanish(Object message, ArrayList<Integer> ids) {}

    /** The icon beside Hide for me. Replaced when patching. */
    public static int icon() { return 0; }
}
