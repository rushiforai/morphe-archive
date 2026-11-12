/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Function;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsLock;

/**
 * Ghost mode exceptions (#71): chats that get the opposite of Ghost mode. While it's on, an
 * exception's reads, typing and story views go out as in stock Telegram; while it's off, they stay
 * on the phone the way Ghost mode's parts would keep them. Online status isn't one chat's, so it
 * stays with the main switch.
 *
 * <p>The chats are kept by Telegram's dialog id, the same for a person or group on every account,
 * so one list covers them all. They're picked on the settings page, or with Ghost mode exception
 * in the more menu of a long press, which Hide from chat list's hooks carry.
 */
public final class GhostChats {
    private GhostChats() {}

    private static final String PREFS = "hushtelegram_ghost_exceptions";
    private static final String KEY = "chats";

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** The saved chats as last read or written, null until then. */
    @Nullable
    private static volatile Set<Long> saved;

    /**
     * Whether Ghost mode works the other way in [chat]: the switch is on and the chat is one of
     * its exceptions. Callers have checked that settings can be read.
     */
    static boolean flipped(@Nullable Long chat) {
        return chat != null && Settings.GHOST_CHATS.get() && chats().contains(chat);
    }

    /** Whether any chat could be flipped, so the gate only works out a request's chat when one could. */
    static boolean any() {
        return Settings.GHOST_CHATS.get() && !chats().isEmpty();
    }

    /** The exceptions, empty when there are none or they can't be read. */
    public static Set<Long> chats() {
        Set<Long> known = saved;
        if (known != null) return known;
        Context context = Utils.getContext();
        if (context == null) return Collections.emptySet();
        try {
            Set<String> stored = store.apply(context).getStringSet(KEY, null);
            Set<Long> ids = new LinkedHashSet<>();
            for (String id : stored == null ? Collections.<String>emptySet() : stored) {
                try {
                    ids.add(Long.parseLong(id));
                } catch (NumberFormatException skipped) {
                    // Not one this wrote.
                }
            }
            return saved = Collections.unmodifiableSet(ids);
        } catch (RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode exceptions", unreadable);
            return Collections.emptySet();
        }
    }

    /**
     * Saves [ids] as the exceptions, none for an empty set. It's written before this returns, so
     * call it off the main thread.
     *
     * @return whether it was written
     */
    public static boolean save(Set<Long> ids) {
        Context context = Utils.getContext();
        if (context == null) return false;
        SharedPreferences.Editor edit = store.apply(context).edit();
        Set<String> stored = new LinkedHashSet<>();
        for (long id : ids) stored.add(String.valueOf(id));
        if (stored.isEmpty()) edit.remove(KEY);
        else edit.putStringSet(KEY, stored);
        if (!edit.commit()) return false;
        saved = Collections.unmodifiableSet(new LinkedHashSet<>(ids));
        return true;
    }

    /** Forgets what was read, for a test that changes the store under it. */
    static void forget() {
        saved = null;
    }

    /** The long press menu's Ghost mode exception item, next to Hide from chat list's id. */
    static final int MENU_ID = 0x48544802;

    /** Each chat list's Ghost mode exception item, so it can follow the switch. Main thread only. */
    private static final Map<Object, WeakReference<View>> MENU_ITEMS = new WeakHashMap<>();

    /** Called by {@link HiddenChats#menuItem} once its own item is in: adds Ghost mode exception under it. */
    static void menuItem(Object list, Object more) {
        try {
            Context context = Utils.getContext();
            int icon = context == null ? 0 : context.getResources().getIdentifier("msg_stealth", "drawable", context.getPackageName());
            Object item = HiddenChats.telegram.addMenuItem(more, MENU_ID, icon, L10n.t("Ghost mode exception"));
            if (item instanceof View) {
                MENU_ITEMS.put(list, new WeakReference<>((View) item));
                menuShown(list);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode exception item", failure);
        }
    }

    /** Called by {@link HiddenChats#menuShown}: the item shows while Ghost mode exceptions is on. */
    static void menuShown(Object list) {
        try {
            WeakReference<View> held = MENU_ITEMS.get(list);
            View item = held == null ? null : held.get();
            if (item == null) return;
            item.setVisibility(Utils.settingsReady() && Settings.GHOST_CHATS.get() ? View.VISIBLE : View.GONE);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode exception item", failure);
        }
    }

    /**
     * Called by {@link HiddenChats#menuChoice} for a tap on the item: the selected chats become
     * exceptions, or stop being ones when they all were, and the selection closes.
     */
    static int menuChoice(Object listener, int id) {
        try {
            if (SettingsLock.refuses()) return id;
            Set<Long> picked = new LinkedHashSet<>();
            List<?> selected = HiddenChats.telegram.selectedChats(listener);
            for (int i = 0; selected != null && i < selected.size(); i++) {
                Object chat = selected.get(i);
                if (chat instanceof Long && (Long) chat != 0) picked.add((Long) chat);
            }
            if (picked.isEmpty()) return HiddenChats.CLOSE_SELECTION;
            boolean ghostOn = Settings.GHOST_MODE.get();
            // Read and written in one queued task, so two quick taps don't drop each other's chats.
            boolean queued = Utils.runInOrderOnBackgroundThread(() -> {
                Set<Long> chats = new LinkedHashSet<>(chats());
                boolean removing = chats.containsAll(picked);
                if (removing) chats.removeAll(picked);
                else chats.addAll(picked);
                boolean landed = save(chats);
                Utils.runOnMainThread(() -> {
                    if (!landed) Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
                    else Utils.showToastShort(toast(removing, ghostOn));
                });
            });
            if (!queued) Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
            return HiddenChats.CLOSE_SELECTION;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "ghost mode exception", failure);
            return id;
        }
    }

    /** What a tap on the item says it did, by what Ghost mode does in those chats now. */
    static String toast(boolean removed, boolean ghostOn) {
        if (removed) return L10n.t("These chats follow Ghost mode again.");
        return ghostOn ? L10n.t("Ghost mode is off in these chats.") : L10n.t("Ghost mode is on in these chats.");
    }
}
