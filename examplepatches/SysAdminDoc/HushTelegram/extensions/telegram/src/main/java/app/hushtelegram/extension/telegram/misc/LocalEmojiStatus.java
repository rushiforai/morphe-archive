/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.function.Function;
import java.util.function.LongSupplier;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram's emoji status is a Premium feature: the picker opens from the star next to the chat
 * list title, and the server turns the change down for an account without Premium. With the switch
 * on, the title's star shows for every account, and the emoji picked there stays on this phone
 * instead of going to Telegram. The patch asks here before MessagesController sends the account's
 * new status, and the chat list title asks here for the emoji to draw next to the account's name.
 * Nobody else sees it. Channel statuses and collectible gifts still go to Telegram as usual.
 *
 * <p>Each signed-in account keeps its own pick, by its user id, until the duration picked with a
 * long press runs out or the selected emoji is tapped again to clear it.
 */
public final class LocalEmojiStatus {
    private LocalEmojiStatus() {}

    /** What the diagnostic report counts each title drawn with the kept emoji as. */
    static final String SHOWN = "kept emoji status shown";

    /** What the report counts each status kept on this phone instead of sent as. */
    static final String KEPT = "emoji status kept on this phone";

    private static final String PREFS = "hushtelegram_local_emoji_status";
    private static final String UNTIL = ".until";

    static Function<Context, SharedPreferences> store = context -> context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);

    /** Seconds since 1970, the clock a status's {@code until} counts in. */
    static LongSupplier clock = () -> System.currentTimeMillis() / 1000;

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /** The emoji the chat list title draws for [user]: the one kept on this phone while the switch is on, else Telegram's [stock]. */
    public static Long documentId(Long stock, Object user) {
        HookStatus.invoked(FamilyNames.HIDE_COMMERCE);
        if (user == null) return stock;
        try {
            if (!on()) return stock;
            Context context = Utils.getContext();
            if (context == null) return stock;
            long kept = kept(store.apply(context), telegram.userId(user));
            if (kept == 0) return stock;
            HookStatus.counted(FamilyNames.HIDE_COMMERCE, SHOWN);
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "kept emoji status", failure);
            return stock;
        }
    }

    /** Whether the chat list title counts its account as Premium: Telegram's answer (non-zero for yes), or yes while the switch is on. */
    public static boolean premium(int stock) {
        HookStatus.invoked(FamilyNames.HIDE_COMMERCE);
        if (stock != 0) return true;
        try {
            return on();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "local emoji status switch", failure);
            return false;
        }
    }

    /**
     * Keeps the account's new [status] on this phone while the switch is on, and redraws the title.
     * An empty status clears what was kept. A collectible gift goes to Telegram as usual.
     *
     * @return whether Telegram skips sending it
     */
    public static boolean keep(Object controller, Object status) {
        HookStatus.invoked(FamilyNames.HIDE_COMMERCE);
        if (controller == null || status == null) return false;
        try {
            if (!on()) return false;
            long document = telegram.statusDocument(status);
            if (document < 0) return false;
            long user = telegram.controllerUser(controller);
            Context context = Utils.getContext();
            if (user == 0 || context == null) return false;
            SharedPreferences.Editor edit = store.apply(context).edit();
            if (document == 0) {
                edit.remove(String.valueOf(user)).remove(user + UNTIL);
            } else {
                edit.putLong(String.valueOf(user), document).putInt(user + UNTIL, telegram.statusUntil(status));
            }
            edit.apply();
            telegram.refresh(controller);
            HookStatus.counted(FamilyNames.HIDE_COMMERCE, KEPT);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_COMMERCE, "keep emoji status", failure);
            return false;
        }
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.LOCAL_EMOJI_STATUS.get();
    }

    /** [user]'s kept emoji, or 0 for none or one whose time ran out. */
    private static long kept(SharedPreferences saved, long user) {
        if (user == 0) return 0;
        long document = saved.getLong(String.valueOf(user), 0);
        int until = saved.getInt(user + UNTIL, 0);
        return until != 0 && until <= clock.getAsLong() ? 0 : document;
    }

    interface Telegram {
        long userId(Object user);

        long controllerUser(Object controller);

        long statusDocument(Object status);

        int statusUntil(Object status);

        void refresh(Object controller);
    }

    private static final class Stubs implements Telegram {
        @Override public long userId(Object user) { return LocalEmojiStatus.userId(user); }
        @Override public long controllerUser(Object controller) { return LocalEmojiStatus.controllerUser(controller); }
        @Override public long statusDocument(Object status) { return LocalEmojiStatus.statusDocument(status); }
        @Override public int statusUntil(Object status) { return LocalEmojiStatus.statusUntil(status); }
        @Override public void refresh(Object controller) { LocalEmojiStatus.refresh(controller); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code ((TLRPC.User) user).id}. */
    public static long userId(Object user) { return 0; }

    /** {@code controller.getUserConfig().getClientUserId()}, for a MessagesController. */
    public static long controllerUser(Object controller) { return 0; }

    /** A {@code TL_emojiStatus}'s {@code document_id}, 0 for {@code TL_emojiStatusEmpty}, -1 for anything else. */
    public static long statusDocument(Object status) { return -1; }

    /** {@code ((TLRPC.EmojiStatus) status).until}, 0 for no end. */
    public static int statusUntil(Object status) { return 0; }

    /** Posts {@code userEmojiStatusUpdated} with the controller's current user, which redraws the chat list title. */
    public static void refresh(Object controller) {}
}
