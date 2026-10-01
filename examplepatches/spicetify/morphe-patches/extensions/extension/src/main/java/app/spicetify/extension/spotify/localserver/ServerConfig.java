package app.spicetify.extension.spotify.localserver;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.UUID;

public final class ServerConfig {
    public enum Provider { NONE, WEBDAV, JELLYFIN }

    private static final String DEVICE_ID = "device_id";
    private static final String JELLYFIN_ROOT = "jellyfin_root";
    private static final String JELLYFIN_USER_ID = "jellyfin_user_id";
    private static final String JELLYFIN_USER_NAME = "jellyfin_user_name";
    private static final String JELLYFIN_TOKEN = "jellyfin_token";
    private static final String JELLYFIN_LIBRARY_ID = "jellyfin_library_id";
    private static final String JELLYFIN_LIBRARY_NAME = "jellyfin_library_name";
    private static SharedPreferences preferences;
    private static Context context;
    private static volatile Snapshot current = new Snapshot(false, null, null);
    private ServerConfig() {}

    public static final class Snapshot {
        public final boolean enabled;
        private final ServerConnection connection;
        private final JellyfinConnection jellyfin;
        Snapshot(boolean enabled, ServerConnection connection, JellyfinConnection jellyfin) {
            if (connection != null && jellyfin != null) throw new IllegalArgumentException("Select one server provider.");
            this.enabled = enabled; this.connection = connection; this.jellyfin = jellyfin;
        }
        public Provider provider() { return jellyfin != null ? Provider.JELLYFIN : connection != null ? Provider.WEBDAV : Provider.NONE; }
        public String rootUrl() { return connection == null ? "" : connection.root.toASCIIString(); }
        public String username() { return connection == null ? "" : connection.username; }
        public boolean hasPassword() { return connection != null && connection.hasPassword(); }
        public JellyfinConnection jellyfinConnection() { return jellyfin; }
        ServerConnection connection() { return connection; }
    }

    public static synchronized void initialize(Context supplied) {
        if (preferences != null) return;
        context = supplied.getApplicationContext();
        preferences = context.getSharedPreferences("spicetify_local_server", Context.MODE_PRIVATE);
        if (preferences.getString(DEVICE_ID, "").isEmpty())
            preferences.edit().putString(DEVICE_ID, UUID.randomUUID().toString()).apply();
        boolean enabled = preferences.getBoolean("enabled", false);
        try {
            if ("jellyfin".equals(preferences.getString("provider", ""))) {
                current = new Snapshot(enabled, null, JellyfinConnection.restore(
                        preferences.getString(JELLYFIN_ROOT, ""), deviceId(),
                        preferences.getString(JELLYFIN_USER_ID, ""), preferences.getString(JELLYFIN_USER_NAME, ""),
                        preferences.getString(JELLYFIN_TOKEN, ""), preferences.getString(JELLYFIN_LIBRARY_ID, ""),
                        preferences.getString(JELLYFIN_LIBRARY_NAME, "")));
            } else {
                String url = preferences.getString("url", "");
                ServerConnection connection = url.isEmpty() ? null : new ServerConnection(url,
                        preferences.getString("username", ""), preferences.getString("password", ""));
                current = new Snapshot(enabled && connection != null, connection, null);
            }
        } catch (IllegalArgumentException ignored) {
            forget();
        }
    }

    public static Snapshot snapshot() { return current; }
    public static synchronized String deviceId() {
        requireInitialized();
        return preferences.getString(DEVICE_ID, "");
    }
    static Context context() { return context; }
    static boolean isCurrent(Snapshot snapshot) { return current == snapshot && snapshot.enabled; }
    static synchronized boolean publish(Snapshot snapshot, Runnable update) {
        if (!isCurrent(snapshot)) return false;
        update.run(); return true;
    }

    /** Null password retains the saved password only for the same server/account. Empty clears it. */
    public static synchronized void configure(boolean enabled, String rootUrl, String username, String password) {
        requireSupported(enabled);
        requireInitialized();
        ServerConnection connection = null;
        if (!rootUrl.trim().isEmpty()) {
            connection = new ServerConnection(rootUrl, username, password == null ? "" : password);
            if (password == null && current.connection != null && connection.root.equals(current.connection.root)
                    && connection.username.equals(current.connection.username)) {
                connection = new ServerConnection(rootUrl, username, current.connection.password());
            }
        } else if (enabled) throw new IllegalArgumentException("Enter an HTTPS WebDAV folder URL first.");
        current = new Snapshot(enabled, connection, null);
        removeJellyfin(preferences.edit().putBoolean("enabled", enabled)
                .putString("provider", connection == null ? "" : "webdav")
                .putString("url", current.rootUrl()).putString("username", current.username())
                .putString("password", connection == null ? "" : connection.password())).apply();
        ServerIndex.invalidate();
    }

    /** Publishes an asynchronous library choice only while its starting settings are still current. */
    public static synchronized boolean configureJellyfinIfCurrent(Snapshot expected, boolean enabled, JellyfinConnection connection) {
        requireSupported(enabled);
        requireInitialized();
        if (expected != current) return false;
        if (connection == null || !deviceId().equals(connection.deviceId()))
            throw new IllegalArgumentException("The Jellyfin session belongs to another installation.");
        current = new Snapshot(enabled, null, connection);
        preferences.edit().putBoolean("enabled", enabled).putString("provider", "jellyfin")
                .remove("url").remove("username").remove("password")
                .putString(JELLYFIN_ROOT, connection.root.toASCIIString())
                .putString(JELLYFIN_USER_ID, connection.userId).putString(JELLYFIN_USER_NAME, connection.userName)
                .putString(JELLYFIN_TOKEN, connection.token()).putString(JELLYFIN_LIBRARY_ID, connection.libraryId)
                .putString(JELLYFIN_LIBRARY_NAME, connection.libraryName).apply();
        ServerIndex.invalidate();
        return true;
    }

    public static synchronized void enabled(boolean value) {
        requireSupported(value);
        requireInitialized();
        if (value && current.provider() == Provider.NONE) throw new IllegalArgumentException("Choose a server first.");
        if (current.enabled == value) return;
        current = new Snapshot(value, current.connection, current.jellyfin);
        preferences.edit().putBoolean("enabled", value).apply();
        ServerIndex.invalidate();
    }

    public static synchronized void forget() {
        requireInitialized();
        String savedDeviceId = deviceId();
        current = new Snapshot(false, null, null);
        preferences.edit().clear().putString(DEVICE_ID, savedDeviceId).apply();
        ServerIndex.invalidate();
    }

    private static SharedPreferences.Editor removeJellyfin(SharedPreferences.Editor edit) {
        return edit.remove(JELLYFIN_ROOT).remove(JELLYFIN_USER_ID).remove(JELLYFIN_USER_NAME)
                .remove(JELLYFIN_TOKEN).remove(JELLYFIN_LIBRARY_ID).remove(JELLYFIN_LIBRARY_NAME);
    }
    private static void requireInitialized() {
        if (preferences == null) throw new IllegalStateException("Server settings are not initialized.");
    }
    private static void requireSupported(boolean enabled) {
        if (enabled && android.os.Build.VERSION.SDK_INT < 26)
            throw new IllegalArgumentException("Server files requires Android 8 or later.");
    }
}
