/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.navigation;

import android.content.Intent;
import android.os.SystemClock;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Picks the tab PineDrama opens on when it starts from its icon.
 *
 * <p>PineDrama's main activity works that tab out itself as it is created: the tab a notification
 * names, else a tab it saved, else one its own landing rules ask for, else Home. All of those end
 * at one comparison with "HOME", where the patch hands the tag to {@link #coldStartTag}, and the
 * tag that comes back goes through PineDrama's own steps for a start on that tab: the splash theme is
 * put back for anything but Home, and Friends, Inbox and Profile each go through the handler
 * PineDrama uses when a notification opens them.
 *
 * <p>For You and Following are feed tabs across the top of Home, and Home's pager picks between
 * them twice after the activity. As its view is built it switches to the tab PineDrama's home page
 * service names, else For You ({@link #firstTopTab}). Once the first frame is up it moves to its
 * default page, which is Following only when PineDrama's own "change follow tab" preference is on
 * for a signed-in account, and otherwise the tab it is on ({@link #followingFirst}). A start that
 * asked for either tab answers both for a short while after it.
 *
 * <p>Only a plain start from the launcher changes. A notification, a link or a shortcut keeps the
 * tab it asked for, and an activity Android restores keeps the tab it was on. Inbox also needs a
 * signed-in account, since PineDrama sends a start there without one to its login screen.
 */
public final class StartPage {
    static final String FAMILY = "start page";
    static final String PUSH_TAB = "com.ss.android.ugc.aweme.intent.extra.EXTRA_AWEME_PUSH_TAB";
    /** The extras PineDrama's own push check reads, besides a link: a start with any is a notification's. */
    static final String[] PUSH_EXTRAS = {"from_notification", "push_id", "is_from_push"};
    private static final String SERVICE_MANAGER_CLASS = "com.ss.android.ugc.aweme.framework.services.ServiceManager";
    private static final String ACCOUNT_USER_SERVICE_CLASS = "com.ss.android.ugc.aweme.IAccountUserService";

    public static final String TIKTOK = "tiktok";
    public static final String FOR_YOU = "for_you";
    public static final String FOLLOWING = "following";
    public static final String FRIENDS = "friends";
    public static final String INBOX = "inbox";
    public static final String PROFILE = "profile";

    /**
     * How long after a start its top tab answers Home's pager. The pager is built and settles
     * within a second of the activity, so a pick that comes much later belongs to something else,
     * such as the pager built again after PineDrama restarts its main page. It's measured on the
     * clock that keeps running while the phone sleeps, so a start the reader put the phone down on
     * doesn't stay open.
     */
    static final long TOP_TAB_WINDOW_MS = 15_000;

    private static String startTopTab;
    private static long startedAt;

    private StartPage() {
    }

    /**
     * The feed tab across the top Home's pager switches to as its view is built, given the
     * {@code tag} it picked. Right after a start that asked for For You or Following it is that
     * tab, and every other pick is PineDrama's.
     */
    public static String firstTopTab(String tag) {
        try {
            HookStatus.bound(FAMILY, "first top tab");
            String top = startTopTab();
            if (top == null) return tag;
            HookStatus.bound(FAMILY, "top tab " + top);
            return top;
        } catch (Throwable failure) {
            Logger.printException(() -> "Start page failed; Home opens on its own feed tab", failure);
            return tag;
        }
    }

    /** The top tab the last start asked for, while it is recent enough to still be the start's. */
    private static String startTopTab() {
        String top = startTopTab;
        return top != null && SystemClock.elapsedRealtime() - startedAt <= TOP_TAB_WINDOW_MS ? top : null;
    }

    /** Forgets the last start's top tab, for tests. */
    static void resetForTests() {
        startTopTab = null;
        startedAt = 0;
        signedInForTests = null;
        classes = Class::forName;
    }

    /**
     * A tap on the app's icon: the launcher's own intent, with no page, link or notification tab in
     * it and none of the extras PineDrama's own push check reads. Some of PineDrama's notifications open
     * the app with the launcher's intent and mark it only with those.
     */
    public static boolean isLauncherStart(Intent intent) {
        if (intent == null
                || !Intent.ACTION_MAIN.equals(intent.getAction())
                || !intent.hasCategory(Intent.CATEGORY_LAUNCHER)
                || intent.getData() != null
                || intent.hasExtra(PUSH_TAB)) {
            return false;
        }
        for (String extra : PUSH_EXTRAS) {
            if (intent.hasExtra(extra)) return false;
        }
        return true;
    }

    /**
     * Whether an account is signed in. PineDrama sends a start on Inbox without one to its login
     * screen instead, every time. A build where the account service can't be read keeps the
     * choice, as before this was asked.
     */
    static boolean signedIn() {
        if (signedInForTests != null) return signedInForTests;
        try {
            Class<?> managerClass = classes.named(SERVICE_MANAGER_CLASS);
            Object manager = managerClass.getMethod("get").invoke(null);
            Class<?> accountClass = classes.named(ACCOUNT_USER_SERVICE_CLASS);
            Object account = managerClass.getMethod("getService", Class.class).invoke(manager, accountClass);
            return account == null || !Boolean.FALSE.equals(accountClass.getMethod("isLogin").invoke(account));
        } catch (Throwable unreadable) {
            return true;
        }
    }

    /** So a test can stand in for PineDrama's account service. */
    static Boolean signedInForTests;

    /** Where {@link #signedIn} finds PineDrama's classes by name, so a test can hand it stand-ins. */
    interface Classes {
        Class<?> named(String name) throws ClassNotFoundException;
    }

    static Classes classes = Class::forName;

}
