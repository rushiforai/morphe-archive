/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.hushtelegram.extension.shared.Logger;

/**
 * Telegram's signed-in accounts, read by reflection so nothing here names a class R8 could move.
 * An account is its index in Telegram's own tables (0 for the first, up to 15); the same index
 * names the account's connection manager, user config and every controller.
 */
public final class Accounts {
    private Accounts() {}

    /** The most accounts Telegram holds. */
    static final int MAX = 16;

    private static final String CONNECTIONS = "org.telegram.tgnet.ConnectionsManager";
    private static final String USER_CONFIG = "org.telegram.messenger.UserConfig";

    /** One signed-in account: its index and the name to show for it. */
    public static final class Entry {
        public final int index;
        public final String name;

        Entry(int index, String name) {
            this.index = index;
            this.name = name;
        }
    }

    private static volatile Field currentAccount;

    /**
     * The account a connection manager belongs to: the {@code currentAccount} Telegram's controllers
     * share, or -1 when it can't be read. Any controller works; one whose field lives elsewhere
     * resolves it again.
     */
    static int indexOf(Object connectionsManager) {
        try {
            Field field = currentAccount;
            if (field == null || !field.getDeclaringClass().isInstance(connectionsManager)) {
                field = null;
                for (Class<?> type = connectionsManager.getClass(); type != null && field == null; type = type.getSuperclass()) {
                    try {
                        field = HostNames.declaredField(type, "currentAccount");
                    } catch (NoSuchFieldException notHere) {
                        // Climb to the controller base class that holds it.
                    }
                }
                if (field == null) return -1;
                field.setAccessible(true);
                currentAccount = field;
            }
            return field.getInt(connectionsManager);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Accounts: the connection manager's account can't be read", failure);
            return -1;
        }
    }

    /**
     * How many account slots Telegram has: UserConfig.MAX_ACCOUNT_COUNT, or the length of its
     * per-account table where R8 folded that constant away (13.2).
     */
    static int slots(ClassLoader loader) throws ReflectiveOperationException {
        Class<?> config = Class.forName(USER_CONFIG, false, loader);
        try {
            return HostNames.field(config, "MAX_ACCOUNT_COUNT").getInt(null);
        } catch (NoSuchFieldException folded) {
            Field table = HostNames.declaredField(config, "Instance");
            table.setAccessible(true);
            return java.lang.reflect.Array.getLength(table.get(null));
        }
    }

    /** The accounts that are signed in, with a name for each. Empty when Telegram's tables can't be read. */
    public static List<Entry> signedIn() {
        List<Entry> found = new ArrayList<>();
        try {
            Class<?> config = Class.forName(USER_CONFIG);
            Method instance = HostNames.method(config, "getInstance", int.class);
            Method activated = HostNames.method(config, "isClientActivated");
            Method user = HostNames.method(config, "getCurrentUser");
            for (int index = 0; index < MAX; index++) {
                Object each = instance.invoke(null, index);
                if (each == null || !Boolean.TRUE.equals(activated.invoke(each))) continue;
                found.add(new Entry(index, nameOf(user.invoke(each), index)));
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Accounts: the signed-in accounts can't be listed", failure);
        }
        return found;
    }

    /** The account the app is showing now, or -1. */
    public static int selected() {
        try {
            return HostNames.field(Class.forName(USER_CONFIG), "selectedAccount").getInt(null);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Accounts: the selected account can't be read", failure);
            return -1;
        }
    }

    /** The account that signed in as [userId], or -1. */
    public static int ofUser(long userId) {
        if (userId == 0) return -1;
        try {
            Class<?> config = Class.forName(USER_CONFIG);
            Method instance = HostNames.method(config, "getInstance", int.class);
            Method id = HostNames.method(config, "getClientUserId");
            Method activated = HostNames.method(config, "isClientActivated");
            for (int index = 0; index < MAX; index++) {
                Object each = instance.invoke(null, index);
                if (each != null && Boolean.TRUE.equals(activated.invoke(each)) && ((Long) id.invoke(each)) == userId) return index;
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Accounts: the account for a user can't be found", failure);
        }
        return -1;
    }

    private static String nameOf(Object user, int index) {
        String name = "";
        try {
            if (user != null) {
                String first = (String) HostNames.field(user.getClass(), "first_name").get(user);
                String last = (String) HostNames.field(user.getClass(), "last_name").get(user);
                name = ((first == null ? "" : first) + " " + (last == null ? "" : last)).trim();
            }
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Accounts: an account's name can't be read", failure);
        }
        return name.isEmpty() ? "#" + (index + 1) : name;
    }

    /** Telegram's connection manager for an account, or null. */
    static Object connections(int account) {
        try {
            return HostNames.method(Class.forName(CONNECTIONS), "getInstance", int.class).invoke(null, account);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            Logger.printException(() -> "Accounts: the connection manager can't be reached", failure);
            return null;
        }
    }

    /** The indexes in a comma list, ignoring anything that isn't one. */
    static Set<Integer> parse(String list) {
        if (list == null || list.isEmpty()) return Collections.emptySet();
        Set<Integer> found = new LinkedHashSet<>();
        for (String part : list.split(",")) {
            try {
                int index = Integer.parseInt(part.trim());
                if (index >= 0 && index < MAX) found.add(index);
            } catch (NumberFormatException notAnIndex) {
                // A hand-edited or damaged list: the rest still counts.
            }
        }
        return found;
    }

    static String join(Set<Integer> indexes) {
        StringBuilder text = new StringBuilder();
        for (int index : indexes) text.append(text.length() == 0 ? "" : ",").append(index);
        return text.toString();
    }
}
