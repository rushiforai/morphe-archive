/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import androidx.annotation.Nullable;

import java.util.regex.Pattern;

import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;

/**
 * Open a chat by ID (#71): a user, group or channel ID typed in HushTelegram settings opens that
 * chat. The ID can be the number a profile's ID row gives (Show user and chat IDs), or a chat ID
 * the way bots write one: a minus in front for a group, -100 for a channel or supergroup.
 *
 * <p>Telegram only opens a chat it already has on this phone: someone from a chat, a group's
 * messages or members, a contact. So the ID is looked for in the app's own tables, in memory and
 * then in its database on Telegram's storage queue, and only one found there goes to Telegram, as
 * the {@code tg://openmessage} link its notifications open. Nothing is asked of Telegram's servers,
 * and the ID stays out of the log.
 */
public final class OpenById {
    private OpenById() {}

    /** Bot API chat IDs at or below this are channels and supergroups, written -100 and the ID. */
    static final long CHANNEL_BASE = -1_000_000_000_000L;
    static final String USER_LINK = "tg://openmessage?user_id=";
    static final String CHAT_LINK = "tg://openmessage?chat_id=";
    private static final Pattern NUMBER = Pattern.compile("-?[0-9]{1,16}");

    /** What was typed, read as an ID: the number Telegram keeps, and whether it can only be a chat. */
    static final class Wanted {
        final long id;
        final boolean chatOnly;

        Wanted(long id, boolean chatOnly) {
            this.id = id;
            this.chatOnly = chatOnly;
        }
    }

    /** The app's own tables for an account; a test swaps it. */
    interface Tables {
        /** Runs [work] on Telegram's storage queue for [account]. */
        void post(int account, Runnable work) throws ReflectiveOperationException;

        /** Whether the app has the user [id], in memory or stored. Called on the storage queue. */
        boolean user(int account, long id) throws ReflectiveOperationException;

        /** Whether the app has the group or channel [id], in memory or stored. Called on the storage queue. */
        boolean chat(int account, long id) throws ReflectiveOperationException;
    }

    /** Told on the main thread what a lookup came to. */
    public interface Found {
        /** [link] opens the chat. It's null when this phone hasn't seen the ID, or when the tables couldn't be read ([failed]). */
        void found(@Nullable String link, boolean failed);
    }

    static volatile Tables tables = new TelegramTables();

    /** Whether [typed] reads as an ID. */
    public static boolean valid(@Nullable String typed) {
        return parse(typed) != null;
    }

    /** [typed] as an ID, or null when it isn't a number Telegram could have. Spaces don't count. */
    @Nullable
    static Wanted parse(@Nullable String typed) {
        if (typed == null) return null;
        StringBuilder kept = new StringBuilder();
        for (int i = 0; i < typed.length(); i++) {
            char c = typed.charAt(i);
            if (!Character.isWhitespace(c) && !Character.isSpaceChar(c)) kept.append(c);
        }
        String text = kept.toString();
        if (!NUMBER.matcher(text).matches()) return null;
        long value = Long.parseLong(text);
        if (value > 0) return new Wanted(value, false);
        if (value == 0) return null;
        long id = value <= CHANNEL_BASE ? CHANNEL_BASE - value : -value;
        return id > 0 ? new Wanted(id, true) : null;
    }

    /**
     * Looks for the ID [typed] names in [account]'s tables off the main thread, and tells [found]
     * on it. A user comes first, then a chat, since the number a profile shows can be either.
     *
     * @return false when it isn't an ID or the lookup couldn't start, and then [found] isn't told
     */
    public static boolean find(int account, @Nullable String typed, Found found) {
        Wanted wanted = parse(typed);
        if (wanted == null || account < 0) return false;
        Tables through = tables;
        try {
            through.post(account, () -> {
                String link = null;
                boolean failed = false;
                try {
                    link = link(through, account, wanted);
                } catch (ReflectiveOperationException | RuntimeException failure) {
                    failed = true;
                    Logger.printException(() -> "Open by ID: the app's tables couldn't be read", failure);
                }
                String answer = link;
                boolean broke = failed;
                Utils.runOnMainThread(() -> found.found(answer, broke));
            });
            return true;
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Open by ID: Telegram's storage queue took no work", failure);
            return false;
        }
    }

    /** The link that opens [wanted] when [account]'s tables have it, or null. */
    @Nullable
    static String link(Tables in, int account, Wanted wanted) throws ReflectiveOperationException {
        if (!wanted.chatOnly && in.user(account, wanted.id)) return USER_LINK + wanted.id;
        if (in.chat(account, wanted.id)) return CHAT_LINK + wanted.id;
        return null;
    }

    /** Telegram's controller and storage, through the build's names. */
    private static final class TelegramTables implements Tables {
        @Override public void post(int account, Runnable work) throws ReflectiveOperationException {
            Object storage = storage(account);
            Object queue = HostNames.method(storage.getClass(), "getStorageQueue").invoke(storage);
            if (queue == null) throw new IllegalStateException("no storage queue");
            Object accepted = HostNames.method(queue.getClass(), "postRunnable", Runnable.class).invoke(queue, work);
            if (Boolean.FALSE.equals(accepted)) throw new IllegalStateException("the storage queue took no work");
        }

        @Override public boolean user(int account, long id) throws ReflectiveOperationException {
            Object controller = controller(account);
            if (HostNames.method(controller.getClass(), "getUser", Long.class).invoke(controller, id) != null) return true;
            Object storage = storage(account);
            return HostNames.method(storage.getClass(), "getUser", long.class).invoke(storage, id) != null;
        }

        @Override public boolean chat(int account, long id) throws ReflectiveOperationException {
            Object controller = controller(account);
            if (HostNames.method(controller.getClass(), "getChat", Long.class).invoke(controller, id) != null) return true;
            Object storage = storage(account);
            return HostNames.method(storage.getClass(), "getChat", long.class).invoke(storage, id) != null;
        }

        private static Object controller(int account) throws ReflectiveOperationException {
            Class<?> type = Class.forName("org.telegram.messenger.MessagesController");
            Object controller = HostNames.method(type, "getInstance", int.class).invoke(null, account);
            if (controller == null) throw new IllegalStateException("no messages controller");
            return controller;
        }

        private static Object storage(int account) throws ReflectiveOperationException {
            Class<?> type = Class.forName("org.telegram.messenger.MessagesStorage");
            Object storage = HostNames.method(type, "getInstance", int.class).invoke(null, account);
            if (storage == null) throw new IllegalStateException("no message storage");
            return storage;
        }
    }
}
