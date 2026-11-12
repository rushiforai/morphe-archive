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
import java.util.Arrays;
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
import app.hushtelegram.extension.telegram.settings.Settings;
import app.hushtelegram.extension.telegram.settings.SettingsLock;

/**
 * Which calls Record calls saves (#72): every call, private calls only, voice chats and live
 * streams only, or calls in the chats picked here. The chats are kept by Telegram's dialog id, a
 * person's id or minus a group's, the same on every account. They're picked on the settings page
 * or with Record calls here in the more menu of a long press, which Hide from chat list's hooks
 * carry, the way {@link GhostChats} are.
 */
public final class RecordChats {
    private RecordChats() {}

    public static final String ALL = "";
    public static final String PRIVATE = "private";
    public static final String GROUPS = "groups";
    public static final String CHOSEN = "chosen";
    public static final List<String> SCOPES = Arrays.asList(ALL, PRIVATE, GROUPS, CHOSEN);

    private static final String PREFS = "hushtelegram_record_chats";
    private static final String KEY = "chats";

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    @Nullable
    private static volatile Set<Long> saved;

    /** The saved scope, with anything that isn't one read as every call. */
    public static String scope() {
        String value = Settings.RECORD_CALLS_WHICH.get();
        return SCOPES.contains(value) ? value : ALL;
    }

    /** Whether Record calls saves a call with [peer]. One that can't be read is saved only when every call is. */
    static boolean wants(String scope, CallPeer peer) {
        switch (scope) {
            case PRIVATE:
                return peer.kind == CallPeer.PRIVATE;
            case GROUPS:
                return peer.kind == CallPeer.GROUP;
            case CHOSEN:
                return peer.dialog != 0 && chats().contains(peer.dialog);
            default:
                return true;
        }
    }

    /** The chosen chats, empty when there are none or they can't be read. */
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
            HookStatus.threw(CallRecorder.FAMILY, "record calls chats", unreadable);
            return Collections.emptySet();
        }
    }

    /**
     * Saves [ids] as the chosen chats, none for an empty set. It's written before this returns, so
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

    /** The long press menu's Record calls here item, after Fake typing's id. */
    static final int MENU_ID = 0x48544804;

    /** Each chat list's Record calls here item, so it can follow the switches. Main thread only. */
    private static final Map<Object, WeakReference<View>> MENU_ITEMS = new WeakHashMap<>();

    /** Called by {@link HiddenChats#menuItem} after Fake typing: adds Record calls here under it. */
    static void menuItem(Object list, Object more) {
        try {
            Context context = Utils.getContext();
            int icon = context == null ? 0 : context.getResources().getIdentifier("msg_voicechat", "drawable", context.getPackageName());
            Object item = HiddenChats.telegram.addMenuItem(more, MENU_ID, icon, L10n.t("Record calls here"));
            if (item instanceof View) {
                MENU_ITEMS.put(list, new WeakReference<>((View) item));
                menuShown(list);
            }
        } catch (Throwable failure) {
            HookStatus.threw(CallRecorder.FAMILY, "record calls here item", failure);
        }
    }

    /** Called by {@link HiddenChats#menuShown}: the item shows while Record calls saves chosen chats. */
    static void menuShown(Object list) {
        try {
            WeakReference<View> held = MENU_ITEMS.get(list);
            View item = held == null ? null : held.get();
            if (item == null) return;
            boolean shown = Utils.settingsReady() && Settings.RECORD_CALLS.get() && CHOSEN.equals(scope());
            item.setVisibility(shown ? View.VISIBLE : View.GONE);
        } catch (Throwable failure) {
            HookStatus.threw(CallRecorder.FAMILY, "record calls here item", failure);
        }
    }

    /**
     * Called by {@link HiddenChats#menuChoice} for a tap on the item: calls in the selected chats
     * are recorded, or stop being when they all were, and the selection closes.
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
            // Read and written in one queued task, so two quick taps don't drop each other's chats.
            boolean queued = Utils.runInOrderOnBackgroundThread(() -> {
                Set<Long> chats = new LinkedHashSet<>(chats());
                boolean removing = chats.containsAll(picked);
                if (removing) chats.removeAll(picked);
                else chats.addAll(picked);
                boolean landed = save(chats);
                Utils.runOnMainThread(() -> {
                    if (!landed) Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
                    else Utils.showToastShort(removing ? L10n.t("Calls in these chats aren't recorded anymore.")
                            : L10n.t("Calls in these chats are recorded."));
                });
            });
            if (!queued) Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
            return HiddenChats.CLOSE_SELECTION;
        } catch (Throwable failure) {
            HookStatus.threw(CallRecorder.FAMILY, "record calls here", failure);
            return id;
        }
    }
}
