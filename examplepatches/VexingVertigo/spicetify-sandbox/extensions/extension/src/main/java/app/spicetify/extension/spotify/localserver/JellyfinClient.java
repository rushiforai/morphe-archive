package app.spicetify.extension.spotify.localserver;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.function.BooleanSupplier;
import java.util.regex.Pattern;
import org.json.*;

/** Authentication and music-library discovery, independent of persisted settings. */
public final class JellyfinClient {
    private static final int MAX_RESPONSE_BYTES = 4 * 1024 * 1024;
    private static final Pattern ITEM_ID = Pattern.compile("[0-9a-f]{32}");
    private static final Pattern ENDPOINT_PATH = Pattern.compile("[A-Za-z0-9/_-]+");
    private final ServerConnection scope;
    private final String deviceId;
    private final BooleanSupplier active;

    public JellyfinClient(String url, String deviceId, BooleanSupplier active) {
        this(url, deviceId, active, false);
    }
    JellyfinClient(String url, String deviceId, BooleanSupplier active, boolean loopbackTest) {
        scope = new ServerConnection(normalize(url), "", "", loopbackTest);
        this.deviceId = required(deviceId, 256, "A local installation ID is required.");
        this.active = Objects.requireNonNull(active);
    }
    JellyfinClient(Account account, BooleanSupplier active) {
        scope = account.scope; deviceId = account.deviceId; this.active = Objects.requireNonNull(active);
    }
    public URI root() { return scope.root; }

    private static String normalize(String text) {
        try {
            URI uri = URI.create(ServerConnection.assumeHttps(text));
            String path = uri.getRawPath();
            if (path == null) path = "";
            boolean web = path.endsWith("/web/") || path.endsWith("/web") || path.endsWith("/web/index.html");
            if (uri.getRawQuery() != null || (uri.getRawFragment() != null && !web)) throw new IllegalArgumentException();
            if (web) path = path.substring(0, path.lastIndexOf("/web")) + "/";
            return new URI(uri.getScheme() + "://" + uri.getRawAuthority() + path).toASCIIString();
        } catch (RuntimeException | URISyntaxException ex) {
            throw new IllegalArgumentException("Enter a valid HTTPS Jellyfin server URL.");
        }
    }
    private static String required(String value, int limit, String message) {
        if (value == null || value.isEmpty() || value.length() > limit || value.chars().anyMatch(c -> c < 32 || c == 127))
            throw new IllegalArgumentException(message);
        return value;
    }
    static String id(String value) {
        String id = required(value, 36, "The server returned an invalid item ID.").replace("-", "").toLowerCase(Locale.ROOT);
        if (!ITEM_ID.matcher(id).matches()) throw new IllegalArgumentException("The server returned an invalid item ID.");
        return id;
    }
    static String encode(String value) {
        try { return URLEncoder.encode(value, "UTF-8").replace("+", "%20"); }
        catch (UnsupportedEncodingException impossible) { throw new AssertionError(impossible); }
    }
    static String authorization(String deviceId, String token) {
        return "MediaBrowser Client=\"Spicetify\", Version=\"1\", DeviceId=\"" + encode(deviceId)
                + "\", Device=\"Android\"" + (token == null ? "" : ", Token=\"" + encode(token) + "\"");
    }
    URI endpoint(String path, String... query) {
        if (!ENDPOINT_PATH.matcher(path).matches() || path.startsWith("/") || query.length % 2 != 0)
            throw new IllegalArgumentException("Invalid Jellyfin endpoint.");
        StringBuilder uri = new StringBuilder(root().resolve(path).toASCIIString());
        for (int i = 0; i < query.length; i += 2) uri.append(i == 0 ? '?' : '&').append(encode(query[i])).append('=').append(encode(query[i + 1]));
        return resolve(root(), uri.toString());
    }
    URI resolve(URI base, String href) {
        URI target = URI.create(base.resolve(href).toASCIIString());
        if (target.getRawFragment() != null) throw new IllegalArgumentException("The server returned an invalid URL.");
        String text = target.toASCIIString(); int question = text.indexOf('?');
        scope.resolve(root(), question < 0 ? text : text.substring(0, question));
        return target;
    }
    private void check(long deadline) throws IOException {
        if (!active.getAsBoolean() || Thread.currentThread().isInterrupted() || System.nanoTime() > deadline)
            throw new IOException("Server access was cancelled.");
    }
    static void checkStatus(int status) throws AuthenticationException {
        if (status == 401 || status == 403) throw new AuthenticationException();
    }
    public static final class AuthenticationException extends IOException {
        AuthenticationException() { super("Jellyfin sign-in expired or access was denied. Sign in again."); }
    }
    JSONObject request(String method, URI target, JSONObject payload, Account account, long deadline) throws IOException {
        check(deadline);
        target = resolve(root(), target.toASCIIString());
        if (account != null) requireAccount(account);
        HttpURLConnection connection = (HttpURLConnection) target.toURL().openConnection();
        try {
            connection.setConnectTimeout(10000); connection.setReadTimeout(10000);
            connection.setInstanceFollowRedirects(false); connection.setUseCaches(false); connection.setRequestMethod(method);
            connection.setRequestProperty("User-Agent", "Morphe/1");
            connection.setRequestProperty("Accept", "application/json; profile=PascalCase");
            connection.setRequestProperty("Accept-Encoding", "identity");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Authorization", authorization(deviceId, account == null ? null : account.token));
            if (payload != null) {
                byte[] body = payload.toString().getBytes(StandardCharsets.UTF_8);
                connection.setDoOutput(true); connection.setFixedLengthStreamingMode(body.length);
                try (OutputStream out = connection.getOutputStream()) { check(deadline); out.write(body); }
            }
            int status = connection.getResponseCode(); check(deadline); checkStatus(status);
            if (status < 200 || status >= 300) throw new IOException("Jellyfin did not accept the request (HTTP " + status + ").");
            String encoding = connection.getHeaderField("Content-Encoding");
            if (encoding != null && !encoding.equalsIgnoreCase("identity")) throw new IOException("Compressed Jellyfin responses are not supported.");
            long length = connection.getContentLengthLong();
            if (length > MAX_RESPONSE_BYTES) throw new IOException("The Jellyfin response is too large.");
            ByteArrayOutputStream body = new ByteArrayOutputStream(length >= 0 ? (int) length : 32);
            try (InputStream in = connection.getInputStream()) {
                byte[] buffer = new byte[8192]; int count;
                while ((count = in.read(buffer)) != -1) {
                    check(deadline);
                    if (body.size() + count > MAX_RESPONSE_BYTES) throw new IOException("The Jellyfin response is too large.");
                    body.write(buffer, 0, count);
                }
            }
            check(deadline);
            try { return new JSONObject(body.toString("UTF-8")); }
            catch (JSONException ex) { throw new IOException("Jellyfin returned an invalid response."); }
        } finally { connection.disconnect(); }
    }
    private long deadline() { return System.nanoTime() + 30_000_000_000L; }
    private void requireAccount(Account account) {
        if (!root().equals(account.scope.root) || !deviceId.equals(account.deviceId))
            throw new IllegalArgumentException("This account belongs to another server connection.");
    }
    private void requireChallenge(Challenge challenge) {
        if (challenge.owner != this) throw new IllegalArgumentException("This sign-in code belongs to another connection.");
    }
    public static final class Challenge {
        public final String code;
        private final String secret;
        private final JellyfinClient owner;
        private Challenge(JellyfinClient owner, String code, String secret) {
            this.owner = owner; this.code = required(code, 32, "Jellyfin returned an invalid sign-in code.");
            this.secret = required(secret, 4096, "Jellyfin returned an invalid sign-in challenge.");
        }
    }
    public Challenge initiateQuickConnect() throws IOException {
        JSONObject result = request("POST", endpoint("QuickConnect/Initiate"), new JSONObject(), null, deadline());
        try { return new Challenge(this, string(result, "Code"), string(result, "Secret")); }
        catch (JSONException | IllegalArgumentException ex) { throw new IOException("Jellyfin returned an invalid sign-in challenge."); }
    }
    public boolean isQuickConnectApproved(Challenge challenge) throws IOException {
        requireChallenge(challenge);
        JSONObject result = request("GET", endpoint("QuickConnect/Connect", "secret", challenge.secret), null, null, deadline());
        try { Object value = result.get("Authenticated"); if (!(value instanceof Boolean)) throw new JSONException("Invalid boolean"); return (Boolean) value; }
        catch (JSONException ex) { throw new IOException("Jellyfin returned an invalid sign-in status."); }
    }
    public Account authenticateQuickConnect(Challenge challenge) throws IOException {
        requireChallenge(challenge);
        return authenticate("Users/AuthenticateWithQuickConnect", json("Secret", challenge.secret));
    }
    public Account authenticateByName(String username, String password) throws IOException {
        required(username, 512, "Enter your Jellyfin username.");
        if (password == null || password.length() > 4096) throw new IllegalArgumentException("Enter your Jellyfin password.");
        return authenticate("Users/AuthenticateByName", json("Username", username, "Pw", password));
    }
    private Account authenticate(String path, JSONObject body) throws IOException {
        JSONObject result = request("POST", endpoint(path), body, null, deadline());
        try {
            JSONObject user = result.getJSONObject("User");
            return new Account(scope, deviceId, string(user, "Id"), string(user, "Name"), string(result, "AccessToken"));
        } catch (JSONException | IllegalArgumentException ex) { throw new IOException("Jellyfin returned an invalid account."); }
    }
    static String string(JSONObject object, String key) throws JSONException {
        Object value = object.get(key);
        if (!(value instanceof String)) throw new JSONException("Expected text");
        return (String) value;
    }
    private static JSONObject json(String... values) {
        JSONObject object = new JSONObject();
        try { for (int i = 0; i < values.length; i += 2) object.put(values[i], values[i + 1]); }
        catch (JSONException impossible) { throw new AssertionError(impossible); }
        return object;
    }
    public static final class Account {
        public final String userId, userName;
        private final ServerConnection scope;
        private final String deviceId, token;
        Account(ServerConnection scope, String deviceId, String userId, String userName, String token) {
            this.scope = scope; this.deviceId = required(deviceId, 256, "Invalid installation ID.");
            this.userId = id(userId); this.userName = required(userName, 512, "Invalid account name.");
            this.token = required(token, 4096, "Invalid account session.");
        }
        public JellyfinConnection select(MusicLibrary library) {
            if (library.account != this) throw new IllegalArgumentException("Select a library from this account.");
            return new JellyfinConnection(this, library.id, library.name);
        }
        URI root() { return scope.root; }
        String deviceId() { return deviceId; }
        String token() { return token; }
    }
    public static final class MusicLibrary {
        public final String id, name;
        private final Account account;
        private MusicLibrary(Account account, String id, String name) {
            this.account = account; this.id = JellyfinClient.id(id); this.name = required(name, 512, "Invalid library name.");
        }
    }
    public List<MusicLibrary> libraries(Account account) throws IOException {
        requireAccount(account);
        JSONObject result = request("GET", endpoint("UserViews", "userId", account.userId), null, account, deadline());
        try {
            JSONArray items = result.getJSONArray("Items");
            if (items.length() > 1000) throw new IOException("This server has too many libraries.");
            List<MusicLibrary> libraries = new ArrayList<>(); Set<String> ids = new HashSet<>();
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                if (!"music".equalsIgnoreCase(item.optString("CollectionType"))) continue;
                MusicLibrary library = new MusicLibrary(account, string(item, "Id"), string(item, "Name"));
                if (!ids.add(library.id)) throw new IOException("Jellyfin returned duplicate libraries.");
                libraries.add(library);
            }
            return Collections.unmodifiableList(libraries);
        } catch (JSONException | IllegalArgumentException ex) { throw new IOException("Jellyfin returned invalid music libraries."); }
    }
}
