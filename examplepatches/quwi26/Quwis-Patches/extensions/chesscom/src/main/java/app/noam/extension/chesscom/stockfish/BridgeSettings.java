package app.noam.extension.chesscom.stockfish;

import android.content.SharedPreferences;

import app.noam.extension.chesscom.Features;

/**
 * The computer's Stockfish bridge: the address sf-bridge listens on and the token it was started
 * with. Set in More → Quwi's Patches → Game Review; a review on the computer asks for none of this
 * if the phone's own Stockfish is picked.
 */
public final class BridgeSettings {
    public static final int DEFAULT_PORT = 7892;

    private static final String HOST = "bridge_host";
    private static final String PORT = "bridge_port";
    private static final String TOKEN = "bridge_token";
    private static final String THREADS = "bridge_threads";
    private static final String HASH = "bridge_hash";

    private BridgeSettings() {}

    /** The computer's address on the network, without a scheme or port ("192.168.1.10"). */
    public static String host() {
        SharedPreferences preferences = Features.preferences();
        String host = preferences == null ? "" : preferences.getString(HOST, "");
        return host == null ? "" : host.trim();
    }

    /** Takes what people paste: "192.168.1.10:7892", "192.168.1.10", or a pasted URL with a scheme. */
    public static void setHost(String address) {
        String host = address == null ? "" : address.trim();
        int scheme = host.indexOf("://");
        if (scheme >= 0) host = host.substring(scheme + 3);
        if (host.contains("/")) host = host.substring(0, host.indexOf('/'));
        // A port belongs in the port field; the address keeps only the host.
        if (host.lastIndexOf(':') > 0) {
            String port = host.substring(host.lastIndexOf(':') + 1);
            host = host.substring(0, host.lastIndexOf(':'));
            try {
                setPort(Integer.parseInt(port));
            } catch (NumberFormatException ignored) {
                // Not a port after all: keep the address as it came.
            }
        }
        put(HOST, host.trim());
    }

    public static int port() {
        SharedPreferences preferences = Features.preferences();
        int port = preferences == null ? 0 : preferences.getInt(PORT, 0);
        return port > 0 && port < 65_536 ? port : DEFAULT_PORT;
    }

    public static void setPort(int port) {
        if (port > 0 && port < 65_536) putInt(PORT, port);
    }

    public static String token() {
        SharedPreferences preferences = Features.preferences();
        String token = preferences == null ? "" : preferences.getString(TOKEN, "");
        return token == null ? "" : token.trim();
    }

    public static void setToken(String token) {
        put(TOKEN, token == null ? "" : token.trim());
    }

    /** Whether a review can even try the computer: an address and a token are both needed. */
    public static boolean configured() {
        return !host().isEmpty() && !token().isEmpty();
    }

    /**
     * Threads and hash your computer's Stockfish should use, or 0 for Stockfish's own sizing. The
     * computer has the cores and the memory the phone doesn't, so this is the one place a review's
     * search gets bigger than fishnet's single thread and 16 MB.
     */
    public static int threads() {
        SharedPreferences preferences = Features.preferences();
        int threads = preferences == null ? 0 : preferences.getInt(THREADS, 0);
        return threads > 0 ? Math.min(32, threads) : 0;
    }

    public static void setThreads(int threads) {
        putInt(THREADS, threads);
    }

    public static int hashMb() {
        SharedPreferences preferences = Features.preferences();
        if (preferences == null) return 0;
        int hash = preferences.getInt(HASH, 0);
        return hash > 0 ? Math.min(4_096, hash) : 0;
    }

    public static void setHashMb(int hashMb) {
        putInt(HASH, hashMb);
    }

    private static void put(String key, String value) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putString(key, value).apply();
    }

    private static void putInt(String key, int value) {
        SharedPreferences preferences = Features.preferences();
        if (preferences != null) preferences.edit().putInt(key, value).apply();
    }
}
