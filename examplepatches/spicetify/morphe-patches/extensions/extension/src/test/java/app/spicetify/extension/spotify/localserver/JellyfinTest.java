package app.spicetify.extension.spotify.localserver;

import static org.junit.Assert.*;
import android.app.Application;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import app.spicetify.extension.spotify.settings.ServerMusicActivity;
import java.io.*;
import java.lang.reflect.Field;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.atomic.*;
import org.json.*;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Robolectric;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class JellyfinTest {
    private Fixture server;
    private JellyfinClient client;
    private final AtomicBoolean active = new AtomicBoolean(true);
    private static final String USER = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    private static final String LIBRARY = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
    private static final String ITEM = "cccccccccccccccccccccccccccccccc";

    @Before public void setup() throws Exception {
        server = new Fixture();
        client = new JellyfinClient(server.url() + "jellyfin/web/#/home", "random-install-id", active::get, true);
    }
    @After public void teardown() throws Exception { server.close(); }
    private JellyfinClient.Account account() throws Exception {
        server.handler = request -> {
            assertEquals("POST", request.method);
            assertEquals("/jellyfin/Users/AuthenticateByName", request.target);
            assertFalse(request.headers.get("Authorization").contains("Token="));
            JSONObject body = new JSONObject(request.body);
            assertEquals("listener", body.getString("Username"));
            assertEquals("fixture-password", body.getString("Pw"));
            return Response.json("{\"AccessToken\":\"fixture-token\",\"User\":{\"Id\":\"" + USER + "\",\"Name\":\"Listener\"}}");
        };
        return client.authenticateByName("listener", "fixture-password");
    }
    private JellyfinConnection connection() throws Exception {
        JellyfinClient.Account account = account();
        server.handler = request -> {
            assertEquals("/jellyfin/UserViews?userId=" + USER, request.target);
            assertTrue(request.headers.get("Authorization").contains("Token=\"fixture-token\""));
            return Response.json("{\"Items\":[{\"Id\":\"" + LIBRARY + "\",\"Name\":\"Music\",\"CollectionType\":\"music\"},{\"Id\":\"dddddddddddddddddddddddddddddddd\",\"Name\":\"Movies\",\"CollectionType\":\"movies\"}]}");
        };
        List<JellyfinClient.MusicLibrary> libraries = client.libraries(account);
        assertEquals(1, libraries.size());
        return account.select(libraries.get(0));
    }
    private static String item(String id) {
        return "{\"Id\":\"" + id + "\",\"Type\":\"Audio\",\"Name\":\"Track\",\"Album\":\"Album\",\"Artists\":[\"Artist\"],\"RunTimeTicks\":1230000000,\"MediaSources\":[{\"Id\":\"different-source\",\"Container\":\"flac\",\"Size\":1024,\"ETag\":\"v1\",\"Protocol\":\"File\",\"IsRemote\":false}]}";
    }
    private static Response page(String items, int start, int total) {
        return Response.json("{\"Items\":[" + items + "],\"StartIndex\":" + start + ",\"TotalRecordCount\":" + total + "}");
    }
    @Test public void normalizesCopiedWebUrlAndRejectsUnsafeBases() {
        assertEquals("https://music.example/proxy/", new JellyfinClient("https://music.example/proxy/web/#/home", "id", () -> true).root().toString());
        assertEquals("https://music.example:8096/proxy/", new JellyfinClient("music.example:8096/proxy/web/#/home", "id", () -> true).root().toString());
        for (String url : List.of("http://music.example", "https://user:password@music.example", "https://music.example/?token=x", "https://music.example/%2e%2e/", "https://music.example/#other")) {
            assertThrows(IllegalArgumentException.class, () -> new JellyfinClient(url, "id", () -> true));
        }
    }
    @Test public void passwordAuthSelectsMusicLibraryWithoutLeakingSecrets() throws Exception {
        JellyfinConnection connection = connection();
        assertEquals(USER, connection.userId);
        assertEquals(LIBRARY, connection.libraryId);
        assertFalse(connection.toString().contains("fixture-token"));
    }
    @Test public void savedAccountCanChangeMusicLibraryWithoutAnotherSignIn() throws Exception {
        JellyfinConnection saved = connection();
        server.handler = request -> {
            assertEquals("GET", request.method);
            assertEquals("/jellyfin/UserViews?userId=" + USER, request.target);
            assertTrue(request.headers.get("Authorization").contains("fixture-token"));
            return Response.json("{\"Items\":[{\"Id\":\"dddddddddddddddddddddddddddddddd\",\"Name\":\"Other Music\",\"CollectionType\":\"music\"}]}");
        };
        JellyfinConnection changed = saved.select(saved.libraries(active::get).get(0));
        assertEquals("Other Music", changed.libraryName);
        assertEquals(saved.userId, changed.userId);
        assertEquals(saved.token(), changed.token());
    }
    @Test public void quickConnectKeepsChallengeEphemeralAndExchangesApprovedSecret() throws Exception {
        server.handler = request -> {
            assertEquals("POST", request.method);
            assertEquals("/jellyfin/QuickConnect/Initiate", request.target);
            return Response.json("{\"Code\":\"123456\",\"Secret\":\"challenge-secret\",\"Authenticated\":false}");
        };
        JellyfinClient.Challenge challenge = client.initiateQuickConnect();
        assertEquals("123456", challenge.code);
        assertFalse(challenge.toString().contains("challenge-secret"));
        server.handler = request -> {
            assertEquals("/jellyfin/QuickConnect/Connect?secret=challenge-secret", request.target);
            return Response.json("{\"Authenticated\":true}");
        };
        assertTrue(client.isQuickConnectApproved(challenge));
        server.handler = request -> {
            assertEquals("/jellyfin/Users/AuthenticateWithQuickConnect", request.target);
            assertEquals("challenge-secret", new JSONObject(request.body).getString("Secret"));
            return Response.json("{\"AccessToken\":\"quick-token\",\"User\":{\"Id\":\"" + USER + "\",\"Name\":\"Listener\"}}");
        };
        assertEquals(USER, client.authenticateQuickConnect(challenge).userId);
    }
    @Test public void scansAllPagesWithApiMetadataAndSourceIdentity() throws Exception {
        JellyfinConnection connection = connection();
        AtomicInteger pages = new AtomicInteger();
        server.handler = request -> {
            assertTrue(request.target.contains("sortBy=SortName&sortOrder=Ascending"));
            assertTrue(request.target.contains("fields=MediaSources"));
            assertTrue(request.target.contains("enableImages=false&enableUserData=false"));
            int start = pages.getAndIncrement();
            assertTrue(request.target.contains("startIndex=" + start));
            return page(item(start == 0 ? ITEM : "dddddddddddddddddddddddddddddddd"), start, 2);
        };
        List<RemoteTrack> tracks = new Jellyfin(connection, active::get).scan();
        assertEquals(2, pages.get()); assertEquals(2, tracks.size());
        RemoteTrack track = tracks.get(0);
        assertEquals("Track", track.title); assertEquals("Album", track.album);
        assertEquals("Artist", track.artist); assertEquals(123, track.durationSeconds);
        assertEquals("Track.flac", track.name);
        assertTrue(track.url.getRawQuery().contains("mediaSourceId=different-source"));
        assertFalse(track.url.toString().contains("fixture-token"));
    }
    @Test public void retainsAlbumArtistAndTrackOrderFromAudioItems() throws Exception {
        JellyfinConnection connection = connection();
        String albumId = "11111111111111111111111111111111";
        String artistId = "22222222222222222222222222222222";
        String enriched = item(ITEM).replace("\"MediaSources\":", "\"AlbumId\":\"" + albumId
                + "\",\"ParentId\":\"" + albumId + "\",\"AlbumArtist\":\"Band\","
                + "\"ArtistItems\":[{\"Id\":\"" + artistId + "\",\"Name\":\"Artist\"}],"
                + "\"AlbumArtists\":[{\"Id\":\"" + artistId + "\",\"Name\":\"Band\"}],"
                + "\"ParentIndexNumber\":2,\"IndexNumber\":4,\"AlbumPrimaryImageTag\":\"image-v1\","
                + "\"MediaSources\":");
        server.handler = request -> page(enriched, 0, 1);
        RemoteTrack track = new Jellyfin(connection, active::get).scan().get(0);
        assertEquals(albumId, track.browse.albumId);
        assertEquals("Band", track.browse.albumArtist);
        assertEquals(artistId, track.browse.artists.get(0).id);
        assertEquals(2, track.browse.discNumber);
        assertEquals(4, track.browse.trackNumber);
        assertEquals("image-v1", track.browse.albumImageTag);
    }
    @Test public void indexUsesJellyfinMetadataWithoutOpeningEveryFileAndReportsExpiredSession() throws Exception {
        Application app = RuntimeEnvironment.getApplication();
        Field saved = ServerConfig.class.getDeclaredField("preferences");
        saved.setAccessible(true);
        saved.set(null, null);
        ServerConfig.initialize(app);
        ServerConfig.forget();
        JellyfinClient.Account account = new JellyfinClient.Account(
                new ServerConnection(server.url() + "jellyfin/", "", "", true),
                ServerConfig.deviceId(), USER, "Listener", "fixture-token");
        JellyfinConnection selected = new JellyfinConnection(account, LIBRARY, "Music");
        assertTrue(ServerConfig.configureJellyfinIfCurrent(ServerConfig.snapshot(), true, selected));
        try {
            String unsupported = item("dddddddddddddddddddddddddddddddd").replace("flac", "wv");
            server.handler = request -> page(item(ITEM) + "," + unsupported, 0, 2);
            ServerIndex.scanAsync();
            waitForStatus("Tracks ready:");
            assertEquals(1, server.requests.get());
            assertEquals(1, ServerIndex.tracks().size());
            assertEquals("Track", ServerIndex.tracks().get(0).title);
            MusicCatalog catalog = ServerIndex.catalog();
            assertEquals(1, catalog.trackCount());
            assertTrue(ServerIndex.isCurrent(catalog));
            assertEquals("Tracks ready: 1 · Albums: 1 · Artists: 1 (1 skipped)", ServerIndex.status());

            var browser = Robolectric.buildActivity(ServerMusicActivity.class).create().start().resume();
            try {
                ServerMusicActivity activity = browser.get();
                View root = activity.findViewById(android.R.id.content);
                ListView list = findView(root, ListView.class);
                assertEquals(2, list.getAdapter().getCount());
                assertEquals("Album", rowTitle(list, 1));
                list.performItemClick(list.getAdapter().getView(1, null, list), 1, 1);
                assertEquals(3, list.getAdapter().getCount());
                assertEquals("Track", rowTitle(list, 1));
                activity.onBackPressed();
                findText(list.getAdapter().getView(0, null, list), "Artists").performClick();
                assertEquals(2, list.getAdapter().getCount());
                list.performItemClick(list.getAdapter().getView(1, null, list), 1, 1);
                assertNotNull(findText(list.getAdapter().getView(1, null, list), "Albums"));
                assertEquals("Album", rowTitle(list, 2));
                activity.onBackPressed();
                findText(list.getAdapter().getView(0, null, list), "Search").performClick();
                findView(root, EditText.class).setText("track");
                assertEquals(2, list.getAdapter().getCount());
                assertEquals("Track", rowTitle(list, 1));
            } finally {
                browser.pause().stop().destroy();
            }

            server.handler = request -> new Response(401, "{}", Map.of());
            ServerIndex.scanAsync();
            waitForStatus("Jellyfin sign-in expired");
            assertEquals(2, server.requests.get());
        } finally {
            ServerConfig.forget();
            assertEquals(0, ServerIndex.catalog().trackCount());
        }
    }

    private static String rowTitle(ListView list, int position) {
        ViewGroup row = (ViewGroup) list.getAdapter().getView(position, null, list);
        return ((TextView) ((ViewGroup) row.getChildAt(1)).getChildAt(0)).getText().toString();
    }

    private static <T extends View> T findView(View root, Class<T> type) {
        if (type.isInstance(root)) return type.cast(root);
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                T found = findView(group.getChildAt(i), type);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static TextView findText(View root, String text) {
        if (root instanceof TextView label && label.getText().toString().contains(text)) return label;
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = findText(group.getChildAt(i), text);
                if (found != null) return found;
            }
        }
        return null;
    }
    private static void waitForStatus(String prefix) throws InterruptedException {
        long deadline = System.nanoTime() + 5_000_000_000L;
        while (!ServerIndex.status().startsWith(prefix) && System.nanoTime() < deadline) Thread.sleep(10);
        assertTrue(ServerIndex.status(), ServerIndex.status().startsWith(prefix));
    }
    @Test public void rejectsDuplicatePagesMalformedSizesAndOversizeCatalogs() throws Exception {
        JellyfinConnection connection = connection();
        server.handler = request -> page(item(ITEM), request.target.contains("startIndex=0") ? 0 : 1, 2);
        assertThrows(IOException.class, () -> new Jellyfin(connection, active::get).scan());
        server.handler = request -> page(item(ITEM).replace("\"Size\":1024", "\"Size\":1.5"), 0, 1);
        assertThrows(IOException.class, () -> new Jellyfin(connection, active::get).scan());
        server.handler = request -> page(item(ITEM), 0, 50001);
        assertThrows(IOException.class, () -> new Jellyfin(connection, active::get).scan());
    }
    @Test public void skipsUnsupportedAudioExplicitlyWithoutDiscardingSupportedTracks() throws Exception {
        JellyfinConnection connection = connection();
        String unsupported = item("dddddddddddddddddddddddddddddddd").replace("flac", "wv");
        String unknownSize = item("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee").replace("\"Size\":1024", "\"Size\":null");
        server.handler = request -> page(item(ITEM) + "," + unsupported + "," + unknownSize, 0, 3);
        Jellyfin session = new Jellyfin(connection, active::get);
        assertEquals(1, session.scan().size()); assertEquals(2, session.skippedTracks());
    }
    @Test public void refusesEmptyPrematurePagesAndChangedTotals() throws Exception {
        JellyfinConnection connection = connection();
        server.handler = request -> page("", 0, 2);
        assertThrows(IOException.class, () -> new Jellyfin(connection, active::get).scan());
        server.handler = request -> request.target.contains("startIndex=0") ? page(item(ITEM), 0, 2) : page(item("dddddddddddddddddddddddddddddddd"), 1, 3);
        assertThrows(IOException.class, () -> new Jellyfin(connection, active::get).scan());
    }
    @Test public void authExpiryIsTypedAndCancellationMakesNoRequest() throws Exception {
        JellyfinConnection connection = connection();
        for (int status : List.of(401, 403)) {
            server.handler = request -> new Response(status, "{}", Map.of());
            assertThrows(JellyfinClient.AuthenticationException.class, () -> new Jellyfin(connection, active::get).scan());
        }
        int before = server.requests.get(); active.set(false);
        assertThrows(IOException.class, () -> new Jellyfin(connection, active::get).scan());
        assertEquals(before, server.requests.get());
    }
    @Test public void streamsExactOriginalRangeWithTokenOnlyInHeader() throws Exception {
        JellyfinConnection connection = connection();
        server.handler = request -> page(item(ITEM), 0, 1);
        RemoteTrack track = new Jellyfin(connection, active::get).scan().get(0);
        server.handler = request -> {
            assertEquals("/jellyfin/Audio/" + ITEM + "/stream?static=true&mediaSourceId=different-source", request.target);
            assertEquals("bytes=10-13", request.headers.get("Range"));
            assertTrue(request.headers.get("Authorization").contains("fixture-token"));
            return new Response(206, "abcd", Map.of("Content-Range", "bytes 10-13/1024", "Last-Modified", "Mon, 21 Sep 2026 12:00:00 GMT"));
        };
        byte[] result = new byte[4];
        assertEquals(4, new Jellyfin(connection, active::get).read(track, 10, 4, result));
        assertArrayEquals("abcd".getBytes(StandardCharsets.UTF_8), result);
        server.handler = request -> new Response(206, "abcd", Map.of("Content-Range", "bytes 0-3/1024"));
        assertThrows(IOException.class, () -> new Jellyfin(connection, active::get).read(track, 10, 4, result));
    }
    @Test public void tokenRotationPreservesIdsAndAccountLibraryVersionChangesDoNot() throws Exception {
        JellyfinConnection connection = connection();
        server.handler = request -> page(item(ITEM), 0, 1);
        RemoteTrack original = new Jellyfin(connection, active::get).scan().get(0);
        JellyfinClient.Account rotatedAccount = new JellyfinClient.Account(
                new ServerConnection(connection.root.toString(), "", "", true), "random-install-id", USER, "Listener", "rotated-token");
        JellyfinConnection rotated = new JellyfinConnection(rotatedAccount, LIBRARY, "Music");
        assertEquals(original.id, new Jellyfin(rotated, active::get).scan().get(0).id);
        JellyfinConnection otherLibrary = new JellyfinConnection(rotatedAccount, "dddddddddddddddddddddddddddddddd", "Other");
        assertNotEquals(original.id, new Jellyfin(otherLibrary, active::get).scan().get(0).id);
        assertThrows(IOException.class, () -> new Jellyfin(otherLibrary, active::get).read(original, 0, 1, new byte[1]));
        server.handler = request -> page(item(ITEM).replace("v1", "v2"), 0, 1);
        assertNotEquals(original.id, new Jellyfin(rotated, active::get).scan().get(0).id);
    }
    @Test public void pinsHttpVersionAcrossRangesAndRejectsChangedAudio() throws Exception {
        JellyfinConnection connection = connection();
        server.handler = request -> page(item(ITEM), 0, 1);
        Jellyfin session = new Jellyfin(connection, active::get);
        RemoteTrack track = session.scan().get(0);
        server.handler = request -> new Response(206, "abcd", Map.of("Content-Range", "bytes 0-3/1024", "Last-Modified", "Mon, 21 Sep 2026 12:00:00 GMT"));
        assertEquals(4, session.read(track, 0, 4, new byte[4]));
        server.handler = request -> {
            assertEquals("Mon, 21 Sep 2026 12:00:00 GMT", request.headers.get("If-Unmodified-Since"));
            return new Response(206, "efgh", Map.of("Content-Range", "bytes 4-7/1024", "Last-Modified", "Mon, 21 Sep 2026 13:00:00 GMT"));
        };
        assertThrows(IOException.class, () -> session.read(track, 4, 4, new byte[4]));
    }
    @Test public void authRejectsMalformedResponsesAndCancelledResults() {
        server.handler = request -> Response.json("{\"User\":{\"Id\":\"invalid\",\"Name\":\"Listener\"},\"AccessToken\":\"fixture-token\"}");
        assertThrows(IOException.class, () -> client.authenticateByName("listener", "fixture-password"));
        server.handler = request -> { active.set(false); return Response.json("{\"Code\":\"123456\",\"Secret\":\"challenge-secret\"}"); };
        assertThrows(IOException.class, client::initiateQuickConnect);
    }
    @Test public void doesNotForwardCredentialsOutsideBaseOnRedirect() throws Exception {
        JellyfinConnection connection = connection();
        server.handler = request -> page(item(ITEM), 0, 1);
        RemoteTrack track = new Jellyfin(connection, active::get).scan().get(0);
        server.handler = request -> new Response(302, "", Map.of("Location", "/outside"));
        int before = server.requests.get();
        assertThrows(IOException.class, () -> new Jellyfin(connection, active::get).read(track, 0, 4, new byte[4]));
        assertEquals(before + 1, server.requests.get());
        assertThrows(IOException.class, () -> client.libraries(connection.account()));
        assertEquals(before + 2, server.requests.get());
    }

    private interface Handler { Response handle(Request request) throws Exception; }
    private static final class Request {
        final String method, target, body;
        final Map<String, String> headers = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        Request(InputStream input) throws IOException {
            String[] line = line(input).split(" "); method = line[0]; target = line[1];
            for (String header = line(input); !header.isEmpty(); header = line(input)) {
                int colon = header.indexOf(':'); headers.put(header.substring(0, colon), header.substring(colon + 1).trim());
            }
            int length = Integer.parseInt(headers.getOrDefault("Content-Length", "0"));
            if (length < 0 || length > 16384) throw new IOException("Invalid fixture body size");
            byte[] bytes = new byte[length]; new DataInputStream(input).readFully(bytes);
            body = new String(bytes, StandardCharsets.UTF_8);
        }
    }
    private static final class Response {
        final int status; final String body; final Map<String, String> headers;
        Response(int status, String body, Map<String, String> headers) { this.status = status; this.body = body; this.headers = headers; }
        static Response json(String body) { return new Response(200, body, Map.of("Content-Type", "application/json")); }
    }
    private static final class Fixture implements AutoCloseable {
        final ServerSocket listener = new ServerSocket(0, 10, InetAddress.getByName("127.0.0.1"));
        final AtomicInteger requests = new AtomicInteger();
        final AtomicReference<Throwable> failure = new AtomicReference<>();
        volatile Handler handler = request -> new Response(404, "", Map.of());
        final Thread worker;
        Fixture() throws IOException {
            worker = new Thread(() -> {
                while (!listener.isClosed()) {
                    try (Socket socket = listener.accept()) {
                        socket.setSoTimeout(5000); Request request = new Request(new BufferedInputStream(socket.getInputStream()));
                        requests.incrementAndGet(); Response response = handler.handle(request);
                        byte[] body = response.body.getBytes(StandardCharsets.UTF_8);
                        StringBuilder header = new StringBuilder("HTTP/1.1 " + response.status + " Fixture\r\nConnection: close\r\nContent-Length: " + body.length + "\r\n");
                        response.headers.forEach((key, value) -> header.append(key).append(": ").append(value).append("\r\n"));
                        socket.getOutputStream().write(header.append("\r\n").toString().getBytes(StandardCharsets.ISO_8859_1));
                        socket.getOutputStream().write(body);
                    } catch (Throwable error) { if (!listener.isClosed()) failure.compareAndSet(null, error); }
                }
            }, "jellyfin-fixture"); worker.setDaemon(true); worker.start();
        }
        String url() { return "http://127.0.0.1:" + listener.getLocalPort() + "/"; }
        public void close() throws Exception {
            listener.close(); worker.join(6000); assertFalse(worker.isAlive());
            if (failure.get() != null) throw new AssertionError("Fixture failed", failure.get());
        }
    }
    private static String line(InputStream input) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        while (out.size() < 16384) {
            int value = input.read(); if (value < 0) throw new EOFException();
            if (value == '\r') { if (input.read() != '\n') throw new IOException("Invalid fixture line"); return out.toString("ISO-8859-1"); }
            out.write(value);
        }
        throw new IOException("Fixture line too long");
    }
}
