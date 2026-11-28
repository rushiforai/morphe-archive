/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import androidx.annotation.Nullable;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Which of your Instagram accounts the locked and hidden chats are read and changed for.
 *
 * <p>"Lock your messages" asks {@link #resumed} first each time one of Instagram's screens comes to
 * the front, with the screen. The screen's own session says which account it's signed in to, by the
 * id Instagram's session answers ({@link InstagramChats#accountId}), never by a name, and that account
 * is the one in front ({@link #active}) until another screen comes up. A screen whose session can't be
 * read, or isn't a signed-in one, leaves no account in front: the lists then keep every chat on them
 * locked or hidden and refuse every change, so nothing one account chose shows or changes on another.
 *
 * <p>A switch to another account forgets what the lists remember of the last one (the chat opened
 * last, what they parsed, the inboxes they drew), and keeps every account's saved choices. The ids
 * stay in this process and the lists' own settings, which a backup leaves out, and are never written
 * to the diagnostic report.
 */
public final class ChatAccounts {
    /** The step a failure is reported under. */
    static final String ACCOUNT = "screen account";

    /** Reads which account a screen is signed in to. Tests put a fake in. */
    interface Reader {
        String accountOf(Object screen);
    }

    static volatile Reader reader = ChatAccounts::read;

    /** The account the screen in front is signed in to, or null when it couldn't be read. */
    private static volatile String active;
    /** The last account a screen was read for, kept across screens that had none, so a switch is noticed. */
    private static volatile String known;

    private ChatAccounts() {
    }

    /**
     * Answers an Object: the session one of Instagram's screens is signed in with, as the screen's own
     * getSession() answers it, or null. The patch writes the body at patch time, and a build without
     * it answers null, so no account is ever in front and the lists only protect.
     */
    public static Object session(Object screen) {
        return null;
    }

    /** Asked first each time one of Instagram's screens comes to the front. Never throws. */
    public static void resumed(Object screen) {
        try {
            HookStatus.invoked(FamilyNames.MESSAGES_LOCK);
            use(accountOf(screen));
        } catch (Throwable t) {
            active = null;
            HookStatus.threw(FamilyNames.MESSAGES_LOCK, ACCOUNT, t);
        }
    }

    /**
     * The id of the account [screen] is signed in to, or null when there's no screen, its session
     * can't be read, or it isn't a signed-in account's (a sign-in screen's session isn't). Never throws.
     */
    @Nullable
    static String accountOf(@Nullable Object screen) {
        if (screen == null) return null;
        try {
            return clean(reader.accountOf(screen));
        } catch (Throwable t) {
            // A session of another kind fails the cast to Instagram's signed-in one: nobody's.
            return null;
        }
    }

    private static String read(Object screen) {
        Object session = session(screen);
        return session == null ? null : InstagramChats.accountId(session);
    }

    /** The account in front, or null when it isn't known. */
    @Nullable
    public static String active() {
        return active;
    }

    /**
     * [account] is in front now, or no account is when it's null. A different account than the last
     * one known is a switch. Whenever an account comes to the front in place of another or of none,
     * each inbox drawn is handed its list again with the chats hidden for it, before the screen that
     * came up draws. A screen with no account leaves the inboxes as they were drawn, and any list
     * handed over while it's in front leaves out every account's hidden chats.
     */
    static void use(@Nullable String account) {
        String before = active;
        active = account;
        if (account == null) return;
        String was = known;
        known = account;
        if (was != null && !was.equals(account)) ChatLocks.accountChanged(account);
        if (!account.equals(before)) HiddenChats.changedSoon();
    }

    /** An id as Instagram answers it, or null for one that's empty or couldn't be a single id on a list. */
    @Nullable
    static String clean(@Nullable String id) {
        if (id == null) return null;
        String trimmed = id.trim();
        if (trimmed.isEmpty() || trimmed.indexOf('\t') >= 0 || trimmed.indexOf('\n') >= 0 || trimmed.indexOf(',') >= 0) {
            return null;
        }
        return trimmed;
    }

    /** Every screen is signed in to [account] from now on, and it's in front. */
    static void signInForTests(String account) {
        reader = screen -> account;
        use(account);
    }

    /** Back to how a fresh start finds it. */
    static void resetForTests() {
        reader = ChatAccounts::read;
        active = null;
        known = null;
    }
}
