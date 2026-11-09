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
    private static final int PAGE_SIZE = 250;
    private static final int MAX_TRACKS = 100000;
    private final AtomicBoolean cancelled;
    private final Identity identity;
    private Session session;

    LibraryDaap(AtomicBoolean cancelled) throws IOException {
        this.cancelled = cancelled;
        session = connect();
        identity = session.identity;
    }

    synchronized List<Track> tracks() throws IOException {
        List<Track> result = new ArrayList<>();
        Set<Long> seen = new LinkedHashSet<>();
        long total = -1;
        do {
            DaapCodec.Node response = daap("GET", itemsUrl() + "&index=" + result.size() + "-"
                    + (result.size() + PAGE_SIZE - 1), new byte[0], "adbs", true);
            long count = response.required("mtco").unsigned32();
            if (count > MAX_TRACKS || (total >= 0 && count != total)) throw new Failure(Kind.LIBRARY_CHANGED);
            total = count;
            List<Track> page = parseTracks(response);
            if (page.size() > total - result.size()) throw new Failure(Kind.PROTOCOL);
            if (page.isEmpty() && result.size() != total) throw new Failure(Kind.PROTOCOL);
            for (Track track : page) {
                if (!seen.add(track.cloudId)) throw new Failure(Kind.LIBRARY_CHANGED);
                result.add(track);
            }
        } while (result.size() < total);
        result.removeIf(track -> !track.inLibrary);
        return Collections.unmodifiableList(result);
    }

    synchronized Track track(long cloudId) throws IOException { return track(cloudId, true); }

    private Track track(long cloudId, boolean honourCancellation) throws IOException {
        if (cloudId <= 0 || cloudId > 0xffffffffL) throw new Failure(Kind.IDENTITY);
        String query = URLEncoder.encode("'dmap.itemid:" + cloudId + "'", StandardCharsets.UTF_8.name());
        DaapCodec.Node response = daap("GET", itemsUrl() + "&query=" + query, new byte[0], "adbs", honourCancellation);
        List<Track> found = parseTracks(response);
        if (response.required("mtco").unsigned32() != 1 || found.size() != 1 || found.get(0).cloudId != cloudId) {
            throw new Failure(Kind.IDENTITY);
        }
        return found.get(0);
    }

    synchronized void repair(Track baseline, Map<String, String> replacements) throws IOException {
        if (!identity.matches(baseline.identity) || baseline.catalogId.isEmpty()) throw new Failure(Kind.IDENTITY);
        if (replacements.isEmpty()) return;
        Map<String, byte[]> fields = new LinkedHashMap<>();
        for (Map.Entry<String, String> field : replacements.entrySet()) {
            fields.put(field.getKey(), MetadataField.forTag(field.getKey()).encode(field.getValue()));
        }
        Session current = connect();
        if (!identity.matches(current.identity)) throw new Failure(Kind.ACCOUNT_CHANGED);
        session = current;
        DaapCodec.Node revision = daap("GET", BASE + "/update?session-id=" + session.id + "&revision-number=0",
                new byte[0], "mupd", true);
        Track before = track(baseline.cloudId, true);
        if (!before.inLibrary || !before.catalogId.equals(baseline.catalogId)) throw new Failure(Kind.IDENTITY);
        boolean changed = false;
        for (Map.Entry<String, String> field : replacements.entrySet()) {
            String actual = before.values.get(field.getKey());
            if (Objects.equals(actual, field.getValue())) continue;
            if (!Objects.equals(actual, baseline.values.get(field.getKey()))) throw new Failure(Kind.CONFLICT);
            changed = true;
        }
        if (!changed) return;
        byte[] body = DaapCodec.edit(baseline.cloudId, revision.required("musr").unsigned32(),
                System.currentTimeMillis() / 1000, fields);
        checkCancelled();
        IOException writeFailure = null;
        try {
            daap("POST", BASE + "/databases/" + identity.databaseId + "/items/edit?session-id=" + session.id,
                    body, "mebp", false);
        } catch (IOException exception) { writeFailure = exception; }
        try {
            Track after = track(baseline.cloudId, false);
            if (!after.inLibrary || !after.catalogId.equals(baseline.catalogId)) throw new Failure(Kind.VERIFICATION);
            for (Map.Entry<String, String> field : replacements.entrySet()) {
                if (!Objects.equals(after.values.get(field.getKey()), field.getValue())) throw new Failure(Kind.VERIFICATION);
            }
        } catch (IOException exception) {
            Failure failure = new Failure(Kind.VERIFICATION);
            failure.addSuppressed(exception);
            if (writeFailure != null) failure.addSuppressed(writeFailure);
            throw failure;
        }
    }

    byte[] requestGet(String absoluteUrl) throws IOException { return request("GET", absoluteUrl, new byte[0], true); }

    synchronized void verifyAccountForLocalRefresh() throws IOException {
        Session current = connect(false);
        if (!identity.matches(current.identity)) throw new Failure(Kind.ACCOUNT_CHANGED);
        session = current;
    }

    private String itemsUrl() { return BASE + "/databases/" + identity.databaseId + "/items?session-id=" + session.id + "&meta=all"; }

    private Session connect() throws IOException { return connect(true); }

    private Session connect(boolean honourCancellation) throws IOException {
        DaapCodec.Node login = daap("GET", BASE + "/login", new byte[0], "mlog", honourCancellation);
        long sessionId = login.required("mlid").unsigned32();
        if (sessionId == 0) throw new Failure(Kind.IDENTITY);
        DaapCodec.Node databases = daap("GET", BASE + "/databases?session-id=" + sessionId + "&delta=0",
                new byte[0], "avdb", honourCancellation);
        List<DaapCodec.Node> records = databases.required("mlcl").children;
        if (records.size() != 1 || !records.get(0).code.equals("mlit")) throw new Failure(Kind.IDENTITY);
        DaapCodec.Node database = records.get(0);
        long databaseId = database.required("miid").unsigned32();
        byte[] persistentId = database.required("mper").bytes();
        if (databaseId == 0 || persistentId.length != 8) throw new Failure(Kind.IDENTITY);
        return new Session(sessionId, new Identity(databaseId, persistentId));
    }

    private List<Track> parseTracks(DaapCodec.Node response) throws IOException {
        List<DaapCodec.Node> nodes = response.required("mlcl").children;
        if (response.required("mrco").unsigned32() != nodes.size()) throw new Failure(Kind.PROTOCOL);
        List<Track> tracks = new ArrayList<>(nodes.size());
        for (DaapCodec.Node node : nodes) {
            if (!node.code.equals("mlit")) throw new Failure(Kind.PROTOCOL);
            long cloudId = node.required("miid").unsigned32();
            if (cloudId == 0) throw new Failure(Kind.IDENTITY);
            DaapCodec.Node catalog = node.child("ajsa");
            long catalogId = catalog == null ? 0 : catalog.number();
            if (catalogId == 0) {
                catalog = node.child("ajra");
                catalogId = catalog == null ? 0 : catalog.number();
            }
            if (catalogId < 0) throw new Failure(Kind.IDENTITY);
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

    private DaapCodec.Node daap(String method, String url, byte[] body, String type, boolean honourCancellation) throws IOException {
        DaapCodec.Node root = DaapCodec.root(request(method, url, body, honourCancellation), type);
        long status = root.required("mstt").unsigned32();
        if (status != 200) throw new Failure(Kind.SERVER, (int) status);
        return root;
    }

    private byte[] request(String method, String url, byte[] body, boolean honourCancellation) throws IOException {
        validateUrl(url);
        for (int attempt = 0; ; attempt++) {
            if (honourCancellation) checkCancelled();
            try (MusicReflection.Handle data = new MusicReflection.Handle(invoke(DATA, "create", body, body.length, true));
                 MusicReflection.Handle keys = new MusicReflection.Handle(create(VECTOR, (Object) new String[]{
                         "Client-Cloud-DAAP-Version", "Accept-Language", "Content-Type", "Cache-Control"}));
                 MusicReflection.Handle values = new MusicReflection.Handle(create(VECTOR, (Object) new String[]{
                         "1.6/UnknownAndroid", "ja-JP", "application/x-dmap-tagged", "no-cache"}));
                 MusicReflection.Handle response = new MusicReflection.Handle(call(create("com.apple.android.music.X0"),
                         "a", method, url, "", data.value, keys.value, values.value, 25, false))) {
                int status = (Integer) call(response.value, "getHttpStatusCode");
                if ((status == 429 || status == 503) && method.equals("GET") && attempt == 0) {
                    pause(honourCancellation);
                    continue;
                }
                if (status != 200) throw new Failure(Kind.HTTP, status);
                try (MusicReflection.Handle responseBody = new MusicReflection.Handle(call(response.value, "getBodyResponse"))) {
                    Object content = responseBody.get();
                    if (content == null) throw new Failure(Kind.PROTOCOL);
                    long size = (Long) call(content, "getLength");
                    if (size <= 0 || size > DaapCodec.MAX_BODY) throw new Failure(Kind.PROTOCOL);
                    byte[] bytes = (byte[]) call(content, "toBytes");
                    if (bytes == null || bytes.length != size) throw new Failure(Kind.PROTOCOL);
                    if (honourCancellation) checkCancelled();
                    return bytes;
                }
            } catch (ReflectiveOperationException exception) {
                throw new IOException("Apple Music request adapter failed", exception);
            }
        }
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

    private void pause(boolean honourCancellation) {
        for (int i = 0; i < 5; i++) {
            if (honourCancellation) checkCancelled();
            try { Thread.sleep(100); }
            catch (InterruptedException exception) {
                Thread.currentThread().interrupt();
                throw new CancellationException();
            }
        }
    }

    private void checkCancelled() { if (cancelled.get() || Thread.currentThread().isInterrupted()) throw new CancellationException(); }

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
        Failure(Kind kind) { this(kind, 0); }
        Failure(Kind kind, int status) {
            super("Apple Music metadata request failed: " + kind + (status == 0 ? "" : " (" + status + ")"));
            this.kind = kind;
            this.status = status;
        }
    }

    private static final class Session {
        final long id;
        final Identity identity;
        Session(long id, Identity identity) { this.id = id; this.identity = identity; }
    }

    private static final class Identity {
        final long databaseId;
        final byte[] persistentId;
        Identity(long databaseId, byte[] persistentId) { this.databaseId = databaseId; this.persistentId = persistentId.clone(); }
        boolean matches(Identity other) { return other != null && databaseId == other.databaseId && Arrays.equals(persistentId, other.persistentId); }
    }
}
