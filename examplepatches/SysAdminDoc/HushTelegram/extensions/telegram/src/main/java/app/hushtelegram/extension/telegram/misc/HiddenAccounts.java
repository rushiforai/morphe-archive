/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Function;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Accounts kept out of Telegram's account lists (the switcher on the main screen and the one in
 * Settings). This only changes what those lists show. A hidden account stays signed in, keeps
 * syncing and keeps its notifications as Telegram's own settings have them. Nothing is signed out
 * or deleted. The account you are using always shows, and so does at least one other when the
 * picks would leave none.
 */
public final class HiddenAccounts {
    private HiddenAccounts() {}

    /** What the diagnostic report counts each account an account list left out as. */
    static final String LEFT_OUT = "account left out of an account list";

    private static final String PREFS = "hushtelegram_hidden_accounts";
    private static final String KEY = "users";

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /** A signed-in account the settings page lists. */
    public static final class Account {
        public final int slot;
        public final long user;
        public final String name;

        Account(int slot, long user, String name) {
            this.slot = slot;
            this.user = user;
            this.name = name;
        }
    }

    /** Whether the hiding is on in this build and in the settings. */
    public static boolean available() {
        try {
            return Utils.settingsReady() && Settings.HIDE_ACCOUNTS.get() && PatchFamily.Capability.HIDDEN_ACCOUNTS.installed();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "hidden accounts", failure);
            return false;
        }
    }

    /**
     * Stands in for {@code UserConfig.isClientActivated()} in Telegram's account lists: the same
     * answer, except a hidden account that isn't the one in use says it isn't signed in.
     */
    public static boolean activated(Object config) {
        boolean real = telegram.activated(config);
        try {
            if (!real || !available()) return real;
            long user = telegram.userOf(config);
            if (user == 0 || !hidden().contains(user)) return real;
            // The account in use stays in its own lists, so the list never shows the wrong "you".
            if (user == telegram.userId(telegram.selectedAccount())) return real;
            HookStatus.counted(FamilyNames.HIDE_FOLDER_COUNTERS, LEFT_OUT);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "hidden accounts", failure);
            return real;
        }
    }

    /** The user ids picked to hide, across every account on this phone. */
    public static Set<Long> hidden() {
        Context context = Utils.getContext();
        if (context == null) return Collections.emptySet();
        Set<String> saved = store.apply(context).getStringSet(KEY, null);
        if (saved == null) return Collections.emptySet();
        Set<Long> ids = new HashSet<>();
        for (String id : saved) {
            try {
                ids.add(Long.parseLong(id));
            } catch (NumberFormatException skipped) {
                // Not one of ours.
            }
        }
        return Collections.unmodifiableSet(ids);
    }

    /** The signed-in accounts, in Telegram's order, or null when Telegram can't be read. */
    public static List<Account> accounts() {
        try {
            List<Account> list = new ArrayList<>();
            for (int slot = 0; slot < telegram.accountSlots(); slot++) {
                long user = telegram.userId(slot);
                if (user == 0) continue;
                String name = telegram.peerName(slot, user);
                list.add(new Account(slot, user, name == null || name.isEmpty()
                        ? L10n.f("Account %1$s", String.valueOf(slot + 1)) : name));
            }
            return list;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_FOLDER_COUNTERS, "hidden accounts", failure);
            return null;
        }
    }

    /** Whether picking [hide] from [all] would leave at least one account showing. */
    public static boolean leavesOne(List<Account> all, Set<Long> hide) {
        for (Account account : all) {
            if (!hide.contains(account.user)) return true;
        }
        return false;
    }

    /**
     * Saves [ids] as the hidden accounts, none for an empty set. It's written before this returns,
     * so call it off the main thread.
     *
     * @return whether it was written
     */
    public static boolean hide(Set<Long> ids) {
        Context context = Utils.getContext();
        if (context == null) return false;
        SharedPreferences.Editor edit = store.apply(context).edit();
        if (ids.isEmpty()) {
            edit.remove(KEY);
        } else {
            Set<String> saved = new LinkedHashSet<>();
            for (long id : ids) saved.add(String.valueOf(id));
            edit.putStringSet(KEY, saved);
        }
        return edit.commit();
    }

    /** What the settings row says: the names of the hidden accounts signed in now, or that there are none. */
    public static String summary(List<Account> all) {
        Set<Long> hidden = hidden();
        List<String> names = new ArrayList<>();
        if (all != null) {
            for (Account account : all) {
                if (hidden.contains(account.user)) names.add(account.name);
            }
        }
        return names.isEmpty() ? L10n.t("No accounts hidden yet.") : String.join(", ", names);
    }

    /** What this needs from Telegram. */
    interface Telegram {
        boolean activated(Object config);

        long userOf(Object config);

        int selectedAccount();

        int accountSlots();

        long userId(int account);

        String peerName(int account, long id);
    }

    private static final class Stubs implements Telegram {
        @Override public boolean activated(Object config) { return HiddenAccounts.isActive(config); }

        @Override public long userOf(Object config) { return HiddenAccounts.userIdOf(config); }

        @Override public int selectedAccount() { return HiddenChats.telegram.selectedAccount(); }

        @Override public int accountSlots() { return HiddenChats.telegram.accountSlots(); }

        @Override public long userId(int account) { return HiddenChats.telegram.userId(account); }

        @Override public String peerName(int account, long id) { return HiddenChats.telegram.peerName(account, id); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code config.isClientActivated()}, the answer the account lists asked for before. */
    public static boolean isActive(Object config) { return false; }

    /** {@code config.getClientUserId()}. */
    public static long userIdOf(Object config) { return 0; }
}
