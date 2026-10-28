/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.SharedPreferences;
import android.os.Bundle;

import org.robolectric.RuntimeEnvironment;

/** Lets tests outside this package give the folder at launch a Telegram, and ask what it does. */
public final class LaunchFolderForTests {
    private LaunchFolderForTests() {}

    private static LaunchFolder.Telegram saved;

    /** One account signed in as [user], with All Chats and then [names] as its folders, ids 1 up. */
    private static class Folders implements LaunchFolder.Telegram {
        final long user;
        final String[] names;
        int selected = -1;

        Folders(long user, String... names) {
            this.user = user;
            this.names = names;
        }

        @Override public boolean tabsEmpty(Object list) { return true; }

        @Override public Bundle arguments(Object list) {
            Bundle args = new Bundle();
            args.putBoolean("hasMainTabs", true);
            return args;
        }

        @Override public int account(Object list) { return 0; }

        @Override public boolean select(Object list, int index) {
            selected = index;
            return true;
        }

        @Override public int selectedAccount() { return 0; }
        @Override public long userId(int account) { return user; }
        @Override public int folderCount(int account) { return names.length + 1; }
        @Override public int folderId(int account, int index) { return index; }
        @Override public String folderName(int account, int index) { return index == 0 ? "All Chats" : names[index - 1]; }
        @Override public boolean folderLocked(int account, int index) { return false; }
        @Override public boolean folderDefault(int account, int index) { return index == 0; }
        @Override public boolean archiveReachable() { return true; }
    }

    /** Telegram signed in as [user], 0 for no one, with these folders after All Chats. {@link #restore} undoes it. */
    public static void signedIn(long user, String... names) {
        if (saved == null) saved = LaunchFolder.telegram;
        LaunchFolder.telegram = new Folders(user, names);
    }

    /** Telegram signed in with folders that can't be read, as when a stub no longer fits. {@link #restore} undoes it. */
    public static void unreadable() {
        if (saved == null) saved = LaunchFolder.telegram;
        LaunchFolder.telegram = new Folders(1000, "Work") {
            @Override public int folderCount(int account) { throw new IllegalStateException("Telegram changed"); }
        };
    }

    /** Back to the stubs, with no picks saved. */
    public static void restore() {
        if (saved != null) LaunchFolder.telegram = saved;
        saved = null;
        LaunchFolder.store.apply(RuntimeEnvironment.getApplication()).edit().clear().commit();
        LaunchFolder.resetForTests();
    }

    /** With Work picked for the signed-in account, whether a new main chat list opens on it. */
    public static boolean opens() {
        LaunchFolder.Telegram real = LaunchFolder.telegram;
        Folders telegram = new Folders(1000, "Work");
        LaunchFolder.telegram = telegram;
        // Written straight to the file, so the pick is there even while the extension has no context.
        SharedPreferences picks = LaunchFolder.store.apply(RuntimeEnvironment.getApplication());
        picks.edit().putInt("1000", 1).putString("1000.name", "Work").commit();
        try {
            LaunchFolder.firstTabs(new Object());
        } finally {
            LaunchFolder.telegram = real;
            picks.edit().clear().commit();
        }
        return telegram.selected == 1;
    }

    /** With Work as a folder to open, whether a new main chat list's tabs are built without All Chats. */
    public static boolean leavesOutAllChats() {
        LaunchFolder.Telegram real = LaunchFolder.telegram;
        Object strip = new Object();
        boolean[] added = {false};
        LaunchFolder.telegram = new Folders(1000, "Work") {
            @Override public Object strip(Object list) { return strip; }

            @Override public void addTab(Object tabs, int id, int stableId, String title, java.util.ArrayList<?> entities,
                                         boolean noAnimation, boolean isDefault, boolean locked) {
                added[0] = true;
            }
        };
        try {
            LaunchFolder.firstTabs(new Object());
            LaunchFolder.allChatsTab(strip, 0, 100, "All Chats", new java.util.ArrayList<>(), 1, 1, 0);
        } finally {
            LaunchFolder.telegram = real;
            // The list is gone, so the side menu mustn't offer its archive to a later test.
            LaunchFolder.resetForTests();
        }
        return !added[0];
    }
}
