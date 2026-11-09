/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.HashMap;
import java.util.Map;

/** Lets tests outside the misc package sign accounts in for the hidden accounts, and undo it. */
public final class HiddenAccountsForTests {
    private HiddenAccountsForTests() {}

    private static HiddenAccounts.Telegram saved;

    /** Signs in [names].length accounts in slots 0, 1, 2 and so on (users 1000, 2000 and so on), with [selected] in use. */
    public static void signedIn(int selected, String... names) {
        Map<Integer, Long> users = new HashMap<>();
        Map<Long, String> called = new HashMap<>();
        for (int i = 0; i < names.length; i++) {
            users.put(i, 1000L * (i + 1));
            called.put(1000L * (i + 1), names[i]);
        }
        if (saved == null) saved = HiddenAccounts.telegram;
        HiddenAccounts.telegram = new HiddenAccounts.Telegram() {
            @Override public boolean activated(Object config) { return users.containsKey((Integer) config); }

            @Override public long userOf(Object config) { return users.getOrDefault((Integer) config, 0L); }

            @Override public int selectedAccount() { return selected; }

            @Override public int accountSlots() { return 4; }

            @Override public long userId(int account) { return users.getOrDefault(account, 0L); }

            @Override public String peerName(int account, long id) { return called.get(id); }
        };
    }

    /** Back to the stubs, with nothing hidden. */
    public static void restore() {
        if (saved != null) HiddenAccounts.telegram = saved;
        saved = null;
        HiddenAccounts.hide(new java.util.HashSet<>());
    }
}
