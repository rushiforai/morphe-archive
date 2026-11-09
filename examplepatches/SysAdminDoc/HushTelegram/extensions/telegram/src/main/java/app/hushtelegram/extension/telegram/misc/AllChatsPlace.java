/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Lets an account without Premium keep All Chats somewhere other than the first folder tab.
 *
 * <p>Telegram lets anyone drag the tab and then sends it back: a reset runs after the drag, and a
 * check at startup does the same, each behind a Premium question. Those questions answer "stays"
 * here. The answer only goes that far, so locked folders stay locked.
 *
 * <p>The place stays on this phone, one for each account by its user id. The server's order always
 * has All Chats first, so it never sees a moved tab and other devices don't change. Every load sorts
 * by the server's order, and {@link #loaded} puts the tab back in its place right after.
 *
 * <p>Off, paused or with Hide All Chats on, the tab goes first and the saved place waits, so turning
 * the switch back on restores it. A Premium account's order is its own and is never touched.
 */
public final class AllChatsPlace {
    private static final String PREFS = "hushtelegram_all_chats_place";
    /** Telegram's id for All Chats, in folder lists and in the order it sends. */
    private static final int ALL_CHATS = 0;
    private static final int NO_PLACE = -1;

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    private AllChatsPlace() {
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.MOVE_ALL_CHATS.get() && !Settings.HIDE_ALL_CHATS.get();
    }

    /**
     * Injected right after each Premium question in front of a move back to first, and after the
     * startup check's question of whether All Chats is already first.
     *
     * @param stock Telegram's own answer, non-zero for yes
     * @return whether All Chats stays where it is
     */
    public static boolean keeps(int stock) {
        if (stock != 0) return true;
        HookStatus.invoked(FamilyNames.HIDE_FOLDER_COUNTERS);
        try {
            return on();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "All Chats place check", failure);
            return false;
        }
    }

    /**
     * Injected right before each send of TL_messages_updateDialogFiltersOrder. Saves where All Chats
     * is now and moves it to first in the request, which already holds every folder in the new order.
     */
    public static void serverOrder(Object request) {
        HookStatus.invoked(FamilyNames.HIDE_FOLDER_COUNTERS);
        try {
            if (!on()) return;
            Object config = telegram.selectedConfig();
            if (telegram.premium(config)) return;
            List<Integer> order = telegram.order(request);
            int place = order.indexOf(ALL_CHATS);
            if (place < 0) return;
            save(telegram.userId(config), place);
            if (place > 0) {
                order.remove(place);
                order.add(0, ALL_CHATS);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "All Chats place in the server's order", failure);
        }
    }

    /**
     * Injected right after Telegram sorts a freshly loaded folder list, before it tells anyone. With
     * no saved place the order stays the server's, whatever the switch says.
     */
    public static void loaded(Object controller, List<Object> filters) {
        HookStatus.invoked(FamilyNames.HIDE_FOLDER_COUNTERS);
        try {
            if (filters == null || filters.size() < 2) return;
            Object config = telegram.config(controller);
            if (telegram.premium(config)) return;
            int saved = place(telegram.userId(config));
            if (saved == NO_PLACE) return;
            int at = allChatsIn(filters);
            if (at < 0) return;
            int target = on() ? Math.min(saved, filters.size() - 1) : 0;
            if (at != target) filters.add(target, filters.remove(at));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "All Chats place on load", failure);
        }
    }

    /**
     * Injected right after lockFiltersInternal reverses its copy of the folders, the first ones of
     * which it locks on an account past the free limit. It expects All Chats first in the real list,
     * so last here, and a moved one would otherwise lock itself.
     */
    public static void lockOrder(List<Object> reversed) {
        try {
            if (reversed == null || !on()) return;
            int at = allChatsIn(reversed);
            if (at >= 0 && at != reversed.size() - 1) reversed.add(reversed.remove(at));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "All Chats place and locked folders", failure);
        }
    }

    private static int allChatsIn(List<Object> filters) {
        for (int i = 0; i < filters.size(); i++) {
            if (telegram.folderId(filters.get(i)) == ALL_CHATS) return i;
        }
        return -1;
    }

    private static int place(long user) {
        Context context = Utils.getContext();
        if (user == 0 || context == null) return NO_PLACE;
        return store.apply(context).getInt(String.valueOf(user), NO_PLACE);
    }

    private static void save(long user, int place) {
        Context context = Utils.getContext();
        if (user == 0 || context == null) return;
        store.apply(context).edit().putInt(String.valueOf(user), place).apply();
    }

    /** What these hooks need from Telegram, so a test can answer without it. */
    interface Telegram {
        Object selectedConfig();

        Object config(Object controller);

        boolean premium(Object config);

        long userId(Object config);

        int folderId(Object filter);

        List<Integer> order(Object request);
    }

    private static final class Stubs implements Telegram {
        @Override public Object selectedConfig() { return AllChatsPlace.selectedConfig(); }
        @Override public Object config(Object controller) { return AllChatsPlace.config(controller); }
        @Override public boolean premium(Object config) { return AllChatsPlace.premium(config); }
        @Override public long userId(Object config) { return AllChatsPlace.userId(config); }
        @Override public int folderId(Object filter) { return AllChatsPlace.folderId(filter); }
        @Override public List<Integer> order(Object request) { return AllChatsPlace.order(request); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code UserConfig.getInstance(UserConfig.selectedAccount)}. */
    public static Object selectedConfig() { return null; }

    /** {@code controller.getUserConfig()}. */
    public static Object config(Object controller) { return null; }

    /** {@code config.isPremium()}. */
    public static boolean premium(Object config) { return false; }

    /** {@code config.getClientUserId()}. */
    public static long userId(Object config) { return 0; }

    /** {@code filter.id}. */
    public static int folderId(Object filter) { return -1; }

    /** {@code request.order}. */
    public static ArrayList<Integer> order(Object request) { return new ArrayList<>(); }
}
