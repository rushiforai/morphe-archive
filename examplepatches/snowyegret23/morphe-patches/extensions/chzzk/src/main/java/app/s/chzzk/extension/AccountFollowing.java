package app.s.chzzk.extension;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

public final class AccountFollowing {
    private static final Object LOCK = new Object();
    private static final LinkedHashMap<String, String[]> CHANNELS = new LinkedHashMap<>();
    private static String owner = "";
    private static long generation;

    private AccountFollowing() {}

    public static boolean isLoggedIn() { return false; }
    public static String currentAccount() { return ""; }
    public static String[] metadata(Object channel) { return null; }

    private static String account() {
        try {
            if (!isLoggedIn()) return "";
            String id = currentAccount();
            return id == null ? "" : id;
        } catch (RuntimeException | LinkageError ignored) {
            return "";
        }
    }

    public static void clear() {
        synchronized (LOCK) {
            CHANNELS.clear();
            owner = "";
            generation++;
        }
    }

    public static void capture(List<?> channels) {
        String account = account();
        if (account.isEmpty()) {
            clear();
            return;
        }
        if (channels == null) return;
        final long expectedGeneration;
        synchronized (LOCK) {
            if (!account.equals(owner)) {
                CHANNELS.clear();
                owner = account;
                generation++;
            }
            expectedGeneration = generation;
        }
        ArrayList<String[]> snapshot = new ArrayList<>(channels.size());
        try {
            for (Object channel : channels) {
                if (channel == null) continue;
                String[] row = metadata(channel);
                if (row == null || row.length < 4 || row[0] == null || row[0].isEmpty()) continue;
                snapshot.add(new String[] {row[0], row[1] == null || row[1].isEmpty() ? row[0] : row[1],
                    row[2] == null ? "" : row[2], row[3]});
            }
        } catch (RuntimeException | LinkageError ignored) {
            return;
        }
        String activeAccount = account();
        synchronized (LOCK) {
            if (generation != expectedGeneration || !account.equals(activeAccount) || !account.equals(owner)) return;
            for (String[] row : snapshot) {
                if ("false".equals(row[3])) CHANNELS.remove(row[0]);
                else CHANNELS.put(row[0], new String[] {row[0], row[1], row[2]});
            }
        }
    }

    public static List<String[]> list() {
        String account = account();
        synchronized (LOCK) {
            if (!account.equals(owner)) {
                CHANNELS.clear();
                owner = account;
                generation++;
            }
            ArrayList<String[]> result = new ArrayList<>();
            if (account.isEmpty()) return result;
            for (String[] row : CHANNELS.values()) result.add(row.clone());
            return result;
        }
    }
}
