package app.voidhack.extension.applemusic.library;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

import static app.voidhack.extension.applemusic.library.MusicReflection.call;
import static app.voidhack.extension.applemusic.library.MusicReflection.create;
import static app.voidhack.extension.applemusic.library.MusicReflection.invoke;

final class LibraryDaap {
    private static final String BASE = "https://librarydaap.itunes.apple.com/WebObjects/MZDaap.woa/daap";
    private static final String DATA = "com.apple.android.mediaservices.javanative.common.Data$DataPtr";
    private static final String VECTOR = "com.apple.android.mediaservices.javanative.common.StringVector$StringVectorNative";
    private static final int MAX_TRACKS = 100000;
    private static final int MAX_PAGES = 100;
    private static final int MAX_PAGINATION_RESTARTS = 2;
    private static final int DEFAULT_TIMEOUT_SECONDS = 25;
    private static final int ITEMS_TIMEOUT_SECONDS = 120;
    private static final int MAX_RETRIES = 3;
    private final AtomicBoolean cancelled;
    private final Identity identity;
    private Session session;
    private volatile int lastRawTrackCount = -1;
    private volatile int lastLibraryTrackCount = -1;

    interface PageSource {
        DaapCodec.Node fetch(byte[] paginationToken) throws IOException;
    }

    interface ItemsProgress {
        void update(int loaded, int total);
    }

    int lastRawTrackCount() { return lastRawTrackCount; }
    int lastLibraryTrackCount() { return lastLibraryTrackCount; }

    LibraryDaap(AtomicBoolean cancelled) throws IOException {
        this.cancelled = cancelled;
        session = connect();
        identity = session.identity;
    }

    synchronized List<Track> tracks() throws IOException {
        return tracks(null);
    }

    synchronized List<Track> tracks(ItemsProgress progress) throws IOException {
        List<Track> raw = readTracks(identity, cancelled,
                token -> daap("items", "POST", itemsUrl(), DaapCodec.itemsRequest(token), "adbs", true),
                progress);
        lastRawTrackCount = raw.size();
        List<Track> library = new ArrayList<>(raw.size());
        for (Track track : raw) {
            if (track.inLibrary) library.add(track);
        }
        lastLibraryTrackCount = library.size();
        return Collections.unmodifiableList(library);
    }

    static List<Track> readTracks(Identity identity, AtomicBoolean cancelled, PageSource source,
                                  ItemsProgress progress) throws IOException {
        List<Track> result = new ArrayList<>();
        Set<Long> seenIds = new LinkedHashSet<>();
        Set<String> seenTokens = new LinkedHashSet<>();
        byte[] token = new byte[0];
        long total = -1;
        int pages = 0;
        int restarts = 0;
        while (true) {
            checkCancelled(cancelled);
            if (++pages > MAX_PAGES) {
                throw new Failure(Kind.PROTOCOL, "items:max_pages=" + pages);
            }
            DaapCodec.Node response = source.fetch(token);
            if (response.child("murr") != null) {
                if (++restarts > MAX_PAGINATION_RESTARTS) {
                    throw new Failure(Kind.LIBRARY_CHANGED, "items:restart_limit=" + restarts);
                }
                result.clear();
                seenIds.clear();
                seenTokens.clear();
                token = new byte[0];
                total = -1;
                pages = 0;
                if (progress != null) progress.update(0, 0);
                continue;
            }
            long count = response.required("mtco").unsigned32();
            if (count > MAX_TRACKS || (total >= 0 && count != total)) {
                throw new Failure(Kind.LIBRARY_CHANGED, "items:count=" + count + ",prev=" + total);
            }
            total = count;
            List<Track> page = parseTracks(response, identity);
            if (page.size() > total - result.size()) {
                throw new Failure(Kind.PROTOCOL, "items:overflow=" + page.size() + ",rem=" + (total - result.size()));
            }
            if (page.isEmpty() && result.size() != total) {
                throw new Failure(Kind.PROTOCOL, "items:empty=" + result.size() + "/" + total);
            }
            for (Track track : page) {
                if (!seenIds.add(track.cloudId)) {
                    throw new Failure(Kind.LIBRARY_CHANGED, "items:duplicate_id=" + result.size() + "/" + total);
                }
                result.add(track);
            }
            if (progress != null && total > 0) {
                progress.update(result.size(), (int) total);
            }
            DaapCodec.Node nextTokenNode = response.child("mpag");
            byte[] nextToken = nextTokenNode == null ? new byte[0] : nextTokenNode.bytes();
            if (nextToken.length == 0) {
                if (result.size() != total) {
                    throw new Failure(Kind.PROTOCOL, "items:incomplete=" + result.size() + "/" + total);
                }
                break;
            }
            if (result.size() >= total) {
                break;
            }
            if (!seenTokens.add(tokenKey(nextToken))) {
                throw new Failure(Kind.PROTOCOL, "items:repeat_token=" + result.size() + "/" + total);
            }
            token = nextToken;
        }
        return result;
    }

    private static String tokenKey(byte[] token) {
        StringBuilder out = new StringBuilder(token.length * 2);
        for (byte b : token) {
            out.append(Character.forDigit((b >>> 4) & 0xf, 16));
            out.append(Character.forDigit(b & 0xf, 16));
        }
        return out.toString();
    }

    synchronized Track track(long cloudId) throws IOException { return track(cloudId, true); }

    private Track track(long cloudId, boolean honourCancellation) throws IOException {
        if (cloudId <= 0 || cloudId > 0xffffffffL) throw new Failure(Kind.IDENTITY, "item:invalid_id");
        String query = URLEncoder.encode("'dmap.itemid:" + cloudId + "'", StandardCharsets.UTF_8.name());
        DaapCodec.Node response = daap("item", "GET", itemsUrl() + "&query=" + query, new byte[0], "adbs", honourCancellation);
        List<Track> found = parseTracks(response);
        if (response.required("mtco").unsigned32() != 1 || found.size() != 1 || found.get(0).cloudId != cloudId) {
            throw new Failure(Kind.IDENTITY, "item:count=" + found.size());
        }
        return found.get(0);
    }

    synchronized void repair(Track baseline, Map<String, String> replacements) throws IOException {
        if (!identity.matches(baseline.identity) || baseline.catalogId.isEmpty()) throw new Failure(Kind.IDENTITY, "repair:baseline");
        if (replacements.isEmpty()) return;
        Map<String, byte[]> fields = new LinkedHashMap<>();
        for (Map.Entry<String, String> field : replacements.entrySet()) {
            fields.put(field.getKey(), MetadataField.forTag(field.getKey()).encode(field.getValue()));
        }
        Session current = connect();
        if (!identity.matches(current.identity)) throw new Failure(Kind.ACCOUNT_CHANGED);
        session = current;
        DaapCodec.Node revision = daap("update", "GET", BASE + "/update?session-id=" + session.id + "&revision-number=0",
                new byte[0], "mupd", true);
        Track before = track(baseline.cloudId, true);
        if (!before.inLibrary || !before.catalogId.equals(baseline.catalogId)) throw new Failure(Kind.IDENTITY, "repair:before");
        boolean changed = false;
        for (Map.Entry<String, String> field : replacements.entrySet()) {
            String actual = before.values.get(field.getKey());
            if (Objects.equals(actual, field.getValue())) continue;
            if (!Objects.equals(actual, baseline.values.get(field.getKey()))) throw new Failure(Kind.CONFLICT, "repair:" + field.getKey());
            changed = true;
        }
        if (!changed) return;
        byte[] body = DaapCodec.edit(baseline.cloudId, revision.required("musr").unsigned32(),
                System.currentTimeMillis() / 1000, fields);
        checkCancelled();
        IOException writeFailure = null;
        try {
            daap("edit", "POST", BASE + "/databases/" + identity.databaseId + "/items/edit?session-id=" + session.id,
                    body, "mebp", false);
        } catch (IOException exception) { writeFailure = exception; }
        try {
            Track after = track(baseline.cloudId, false);
            if (!after.inLibrary || !after.catalogId.equals(baseline.catalogId)) throw new Failure(Kind.VERIFICATION, "repair:after_identity");
            for (Map.Entry<String, String> field : replacements.entrySet()) {
                if (!Objects.equals(after.values.get(field.getKey()), field.getValue())) {
                    throw new Failure(Kind.VERIFICATION, "repair:mismatch=" + field.getKey());
                }
            }
        } catch (IOException exception) {
            Failure failure = new Failure(Kind.VERIFICATION, "repair:verify");
            failure.addSuppressed(exception);
            if (writeFailure != null) failure.addSuppressed(writeFailure);
            throw failure;
        }
    }

    byte[] requestGet(String absoluteUrl) throws IOException {
        return request("lookup_jp", "GET", absoluteUrl, new byte[0], true);
    }

    synchronized void verifyAccountForLocalRefresh() throws IOException {
        Session current = connect(false);
        if (!identity.matches(current.identity)) throw new Failure(Kind.ACCOUNT_CHANGED);
        session = current;
    }

    private String itemsUrl() { return BASE + "/databases/" + identity.databaseId + "/items?session-id=" + session.id + "&meta=all"; }

    private Session connect() throws IOException { return connect(true); }

    private Session connect(boolean honourCancellation) throws IOException {
        DaapCodec.Node login = daap("login", "GET", BASE + "/login", new byte[0], "mlog", honourCancellation);
        long sessionId = login.required("mlid").unsigned32();
        if (sessionId == 0) throw new Failure(Kind.IDENTITY, "login:session_zero");
        DaapCodec.Node databases = daap("databases", "GET", BASE + "/databases?session-id=" + sessionId + "&delta=0",
                new byte[0], "avdb", honourCancellation);
        List<DaapCodec.Node> records = databases.required("mlcl").children();
        if (records.size() != 1 || !records.get(0).code.equals("mlit")) {
            throw new Failure(Kind.IDENTITY, "databases:records=" + records.size());
        }
        DaapCodec.Node database = records.get(0);
        long databaseId = database.required("miid").unsigned32();
        byte[] persistentId = database.required("mper").bytes();
        if (databaseId == 0 || persistentId.length != 8) {
            throw new Failure(Kind.IDENTITY, "databases:invalid_id");
        }
        return new Session(sessionId, new Identity(databaseId, persistentId));
    }

    private List<Track> parseTracks(DaapCodec.Node response) throws IOException {
        return parseTracks(response, identity);
    }

    private static List<Track> parseTracks(DaapCodec.Node response, Identity identity) throws IOException {
        List<DaapCodec.Node> nodes = response.required("mlcl").children();
        long returned = response.required("mrco").unsigned32();
        if (returned != nodes.size()) {
            throw new Failure(Kind.PROTOCOL, "items:mrco=" + returned + ",nodes=" + nodes.size());
        }
        List<Track> tracks = new ArrayList<>(nodes.size());
        for (DaapCodec.Node record : nodes) {
            if (!record.code.equals("mlit")) throw new Failure(Kind.PROTOCOL, "items:unexpected_node");
            DaapCodec.Node node = record.readTrackFields();
            long cloudId = node.required("miid").unsigned32();
            if (cloudId == 0) throw new Failure(Kind.IDENTITY, "items:cloud_id_zero");
            DaapCodec.Node catalog = node.child("ajsa");
            long catalogId = catalog == null ? 0 : catalog.number();
            if (catalogId == 0) {
                catalog = node.child("ajra");
                catalogId = catalog == null ? 0 : catalog.number();
            }
            if (catalogId < 0) throw new Failure(Kind.IDENTITY, "items:negative_catalog_id");
            Map<String, String> values = new LinkedHashMap<>();
            for (MetadataField field : MetadataField.values()) {
                DaapCodec.Node value = node.child(field.tag);
                if (value != null) values.put(field.tag, field.integer ? Long.toString(value.number()) : value.text());
            }
            DaapCodec.Node playlistOnly = node.child("ajpo");
            boolean inLibrary = playlistOnly == null || playlistOnly.number() == 0;
            tracks.add(new Track(cloudId, catalogId == 0 ? "" : Long.toString(catalogId), values, identity, inLibrary));
        }
        return tracks;
    }

    private DaapCodec.Node daap(String operation, String method, String url, byte[] body, String type, boolean honourCancellation) throws IOException {
        byte[] payload = request(operation, method, url, body, honourCancellation);
        DaapCodec.Node root;
        try {
            root = DaapCodec.root(payload, type);
        } catch (DaapCodec.FormatException exception) {
            Failure failure = new Failure(Kind.PROTOCOL, operation + ":" + exception.getMessage());
            failure.initCause(exception);
            throw failure;
        }
        long status = root.required("mstt").unsigned32();
        if (status != 200) throw new Failure(Kind.SERVER, (int) status, operation);
        return root;
    }

    private byte[] request(String operation, String method, String url, byte[] body, boolean honourCancellation) throws IOException {
        validateUrl(url);
        int timeoutSeconds = "items".equals(operation) ? ITEMS_TIMEOUT_SECONDS : DEFAULT_TIMEOUT_SECONDS;
        for (int attempt = 0; ; attempt++) {
            if (honourCancellation) checkCancelled();
            try (MusicReflection.Handle data = new MusicReflection.Handle(invoke(DATA, "create", body, body.length, true));
                 MusicReflection.Handle keys = new MusicReflection.Handle(create(VECTOR, (Object) new String[]{
                         "Client-Cloud-DAAP-Version", "Accept-Language", "Content-Type", "Cache-Control"}));
                 MusicReflection.Handle values = new MusicReflection.Handle(create(VECTOR, (Object) new String[]{
                         "1.6/UnknownAndroid", "ja-JP", "application/x-dmap-tagged", "no-cache"}));
                 MusicReflection.Handle response = new MusicReflection.Handle(call(create("com.apple.android.music.X0"),
                         "a", method, url, "", data.value, keys.value, values.value, timeoutSeconds, false))) {
                int status = (Integer) call(response.value, "getHttpStatusCode");
                if (shouldRetry(operation, method, status, attempt)) {
                    pause(retryBackoffMs(operation, attempt), honourCancellation);
                    continue;
                }
                if (status != 200) throw new Failure(Kind.HTTP, status, operation);
                try (MusicReflection.Handle responseBody = new MusicReflection.Handle(call(response.value, "getBodyResponse"))) {
                    Object content = responseBody.get();
                    if (content == null) throw new Failure(Kind.PROTOCOL, operation + ":null_body");
                    long size = (Long) call(content, "getLength");
                    if (size <= 0 || size > DaapCodec.MAX_BODY) {
                        throw new Failure(Kind.PROTOCOL, operation + ":body_size=" + size);
                    }
                    byte[] bytes = (byte[]) call(content, "toBytes");
                    if (bytes == null || bytes.length != size) {
                        throw new Failure(Kind.PROTOCOL, operation + ":read=" + (bytes == null ? -1 : bytes.length) + "/" + size);
                    }
                    if (honourCancellation) checkCancelled();
                    return bytes;
                }
            } catch (ReflectiveOperationException exception) {
                Failure failure = new Failure(Kind.PROTOCOL, operation + ":reflect=" + LibraryMetadata.causeName(exception));
                failure.initCause(exception);
                throw failure;
            }
        }
    }

    static boolean shouldRetry(String operation, String method, int status, int attempt) {
        if (attempt < 0 || attempt >= MAX_RETRIES) return false;
        if (status == 429 || status == 503) {
            return "GET".equals(method) || "items".equals(operation);
        }
        return status == 403 && "lookup_jp".equals(operation);
    }

    static long retryBackoffMs(String operation, int attempt) {
        int clamped = Math.max(0, Math.min(attempt, MAX_RETRIES - 1));
        long base = "lookup_jp".equals(operation) ? 2000L : 500L;
        return base << clamped;
    }

    private static void validateUrl(String value) throws IOException {
        try {
            URI uri = new URI(value);
            if (!"https".equals(uri.getScheme()) || uri.getUserInfo() != null || uri.getFragment() != null
                    || (uri.getPort() != -1 && uri.getPort() != 443) || !Arrays.asList(
                    "librarydaap.itunes.apple.com", "itunes.apple.com", "amp-api.music.apple.com",
                    "client-api.itunes.apple.com").contains(uri.getHost())) throw new Failure(Kind.INVALID_URL);
        } catch (URISyntaxException exception) { throw new Failure(Kind.INVALID_URL); }
    }

    private void pause(long durationMs, boolean honourCancellation) {
        pause(cancelled, durationMs, honourCancellation);
    }

    static void pause(AtomicBoolean cancelled, long durationMs, boolean honourCancellation) {
        long remaining = Math.max(0L, durationMs);
        while (remaining > 0L) {
            if (honourCancellation) checkCancelled(cancelled);
            long slice = Math.min(100L, remaining);
            try { Thread.sleep(slice); }
            catch (InterruptedException exception) {
                Thread.currentThread().interrupt();
                throw new CancellationException();
            }
            remaining -= slice;
        }
    }

    private void checkCancelled() { checkCancelled(cancelled); }

    private static void checkCancelled(AtomicBoolean cancelled) {
        if ((cancelled != null && cancelled.get()) || Thread.currentThread().isInterrupted()) {
            throw new CancellationException();
        }
    }

    static final class Track {
        final long cloudId;
        final String catalogId;
        final Map<String, String> values;
        final boolean inLibrary;
        private final Identity identity;

        private Track(long cloudId, String catalogId, Map<String, String> values, Identity identity, boolean inLibrary) {
            this.cloudId = cloudId;
            this.catalogId = catalogId;
            this.values = Collections.unmodifiableMap(new LinkedHashMap<>(values));
            this.identity = identity;
            this.inLibrary = inLibrary;
        }
    }

    enum Kind { HTTP, SERVER, PROTOCOL, IDENTITY, ACCOUNT_CHANGED, LIBRARY_CHANGED, CONFLICT, INVALID_METADATA, INVALID_URL, VERIFICATION }

    static final class Failure extends IOException {
        final Kind kind;
        final int status;
        final String detail;
        Failure(Kind kind) { this(kind, 0, ""); }
        Failure(Kind kind, int status) { this(kind, status, ""); }
        Failure(Kind kind, String detail) { this(kind, 0, detail); }
        Failure(Kind kind, int status, String detail) {
            super("Apple Music metadata request failed: " + kind
                    + (status == 0 ? "" : " (" + status + ")")
                    + (detail == null || detail.isEmpty() ? "" : " [" + detail + "]"));
            this.kind = kind;
            this.status = status;
            this.detail = detail == null ? "" : detail;
        }
    }

    private static final class Session {
        final long id;
        final Identity identity;
        Session(long id, Identity identity) { this.id = id; this.identity = identity; }
    }

    static final class Identity {
        final long databaseId;
        final byte[] persistentId;
        Identity(long databaseId, byte[] persistentId) { this.databaseId = databaseId; this.persistentId = persistentId.clone(); }
        boolean matches(Identity other) { return other != null && databaseId == other.databaseId && Arrays.equals(persistentId, other.persistentId); }
    }
}
