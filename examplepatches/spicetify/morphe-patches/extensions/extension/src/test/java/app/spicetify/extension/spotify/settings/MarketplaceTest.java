package app.spicetify.extension.spotify.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import app.spicetify.extension.spotify.theme.ThemeException;
import app.spicetify.extension.spotify.theme.ThemeState;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class MarketplaceTest {
    private static final Marketplace.Repo GALAXY =
            new Marketplace.Repo("harbassan", "spicetify-galaxy", "main", "https://github.com/harbassan/spicetify-galaxy", 612);

    @Test
    public void readsSearchResults() throws Exception {
        Marketplace.Page page = Marketplace.parseSearch("{\"total_count\":146,\"items\":["
                + "{\"full_name\":\"harbassan/spicetify-galaxy\",\"default_branch\":\"main\","
                + "\"html_url\":\"https://github.com/harbassan/spicetify-galaxy\",\"stargazers_count\":612},"
                + "{\"full_name\":\"Tetrax-10/Nord-Spotify\",\"default_branch\":\"master\","
                + "\"html_url\":\"https://github.com/Tetrax-10/Nord-Spotify\",\"stargazers_count\":400,\"archived\":true}]}");
        assertEquals(146, page.total);
        assertEquals(2, page.count);
        assertEquals(1, page.repos.size()); // Marketplace hides archived repositories by default.
        Marketplace.Repo repo = page.repos.get(0);
        assertEquals("harbassan", repo.owner);
        assertEquals("spicetify-galaxy", repo.name);
        assertEquals("main", repo.branch);
        assertEquals(612, repo.stars);
    }

    @Test
    public void matchesBlacklistPatternsLikeMarketplace() throws Exception {
        // The shape of Marketplace's resources/blacklist.json, comment strings included.
        List<String> patterns = Marketplace.parseBlacklist("{\"repos\":[\"// for old versions:\","
                + "\"https://github.com/FoxRefire/spiceDL\",\"// for new bl syntax:\",\"https://github.com/badUser/*\","
                + "\"https://github.com/*/SpoTUI-By-SouRyan\",3]}");
        assertEquals(5, patterns.size());
        assertTrue(Marketplace.isBlacklisted("https://github.com/foxrefire/SPICEDL", patterns));
        assertTrue(Marketplace.isBlacklisted("https://github.com/BadUser/anything", patterns));
        assertTrue(Marketplace.isBlacklisted("https://github.com/SouRyan/SpoTUI-By-SouRyan", patterns));
        assertFalse(Marketplace.isBlacklisted("https://github.com/badUser/a/b", patterns));
        assertFalse(Marketplace.isBlacklisted("https://github.com/harbassan/spicetify-galaxy", patterns));
        assertTrue(Marketplace.parseBlacklist("{}").isEmpty());
    }

    @Test
    public void readsThemeItemsFromAManifestObjectOrArray() throws Exception {
        List<Marketplace.Theme> one = Marketplace.parseManifest("\ufeff{\"name\":\"Galaxy\",\"description\":\"Fullscreen images\","
                + "\"preview\":\"preview_playlist.png\",\"usercss\":\"user.css\",\"schemes\":\"color.ini\","
                + "\"authors\":[{\"name\":\"harbassan\",\"url\":\"https://github.com/harbassan\"}]}", GALAXY, 0);
        assertEquals(1, one.size());
        Marketplace.Theme theme = one.get(0);
        assertEquals("Galaxy", theme.title);
        assertEquals("harbassan", theme.author);
        assertEquals("https://raw.githubusercontent.com/harbassan/spicetify-galaxy/main/color.ini", theme.schemesUrl);
        assertEquals("https://raw.githubusercontent.com/harbassan/spicetify-galaxy/main/preview_playlist.png", theme.previewUrl);
        assertEquals(612, theme.stars);
        assertNull(theme.backgroundUrl); // only the pinned Galaxy V2 has one

        List<Marketplace.Theme> many = Marketplace.parseManifest("["
                + "{\"name\":\"A\",\"description\":\"a\",\"usercss\":\"a.css\",\"schemes\":\"https://example.com/a.ini\",\"branch\":\"dev\",\"preview\":null},"
                + "{\"name\":\"No schemes\",\"description\":\"b\",\"usercss\":\"b.css\"},"
                + "{\"name\":\"Extension\",\"description\":\"c\",\"main\":\"c.js\"},"
                + "{\"name\":\"B\",\"description\":\"b\",\"usercss\":\"b.css\",\"schemes\":\"themes/B/color.ini\",\"branch\":\"dev\"}]", GALAXY, 3);
        assertEquals(2, many.size());
        assertEquals("https://example.com/a.ini", many.get(0).schemesUrl);
        assertNull(many.get(0).previewUrl);
        assertEquals("harbassan", many.get(0).author);
        assertEquals("https://raw.githubusercontent.com/harbassan/spicetify-galaxy/dev/themes/B/color.ini", many.get(1).schemesUrl);
        assertTrue(many.get(0).order < many.get(1).order);
    }

    @Test
    public void resolvesTheUserCssAndIncludesLikeTheSchemes() throws Exception {
        // include may be one path or an array of them; entries that aren't strings are skipped.
        List<Marketplace.Theme> themes = Marketplace.parseManifest("["
                + "{\"name\":\"Galaxy\",\"description\":\"d\",\"usercss\":\"user.css\",\"schemes\":\"color.ini\",\"include\":"
                + "[\"https://raw.githubusercontent.com/harbassan/spicetify-galaxy/main/theme.js\",3,null,\"extra.js\"]},"
                + "{\"name\":\"Hazy\",\"description\":\"d\",\"usercss\":\"https://cdn.jsdelivr.net/gh/astromations/hazy/app.css\","
                + "\"schemes\":\"color.ini\",\"branch\":\"dev\",\"include\":\"hazy.js\"},"
                + "{\"name\":\"Plain\",\"description\":\"d\",\"usercss\":\"user.css\",\"schemes\":\"color.ini\"},"
                + "{\"name\":\"Many\",\"description\":\"d\",\"usercss\":\"user.css\",\"schemes\":\"color.ini\","
                + "\"include\":[\"1.js\",\"2.js\",\"3.js\",\"4.js\",\"5.js\",\"6.js\"]}]", GALAXY, 0);
        assertEquals("https://raw.githubusercontent.com/harbassan/spicetify-galaxy/main/user.css", themes.get(0).usercssUrl);
        assertEquals(Arrays.asList("https://raw.githubusercontent.com/harbassan/spicetify-galaxy/main/theme.js",
                "https://raw.githubusercontent.com/harbassan/spicetify-galaxy/main/extra.js"), themes.get(0).includeUrls);
        assertEquals("https://cdn.jsdelivr.net/gh/astromations/hazy/app.css", themes.get(1).usercssUrl);
        assertEquals(Collections.singletonList("https://raw.githubusercontent.com/harbassan/spicetify-galaxy/dev/hazy.js"),
                themes.get(1).includeUrls);
        assertTrue(themes.get(2).includeUrls.isEmpty());
        // A tap reads them one by one, so only the first five count.
        assertEquals(5, themes.get(3).includeUrls.size());
    }

    @Test
    public void aCacheWrittenBeforeUserCssAndIncludesWereKeptStillLoads() throws Exception {
        Marketplace.Theme theme = Marketplace.fromJson("{\"savedAt\":1,\"themes\":[{\"title\":\"Galaxy\",\"description\":\"d\","
                + "\"author\":\"harbassan\",\"preview\":null,\"schemes\":\"https://example.com/c.ini\","
                + "\"repo\":\"https://github.com/harbassan/spicetify-galaxy\",\"stars\":612,\"order\":0,\"keywords\":[]}]}")
                .themes.get(0);
        assertEquals("Galaxy", theme.title);
        assertNull(theme.usercssUrl); // so it has no image to find until the list loads again
        assertTrue(theme.includeUrls.isEmpty());
    }

    @Test
    public void galaxyV2ComesFromHarbassansRepositoryWithItsImage() {
        // Downloaded when the Marketplace shows or applies it; nothing of Galaxy is bundled.
        String files = "https://raw.githubusercontent.com/harbassan/spicetify-galaxy/main/";
        Marketplace.Theme galaxy = Marketplace.GALAXY_V2;
        assertEquals("Galaxy V2", galaxy.title);
        assertEquals("harbassan", galaxy.author);
        assertEquals(files + "color.ini", galaxy.schemesUrl);
        assertEquals(files + "preview_playlist.png", galaxy.previewUrl);
        assertEquals(files + "assets/default_bg.jpg", galaxy.backgroundUrl);
        assertEquals("https://github.com/harbassan/spicetify-galaxy", galaxy.repoUrl);
        assertEquals(Collections.singletonList("harbassan"), galaxy.keywords);
        // Its image is known, so nothing is searched for one.
        assertNull(galaxy.usercssUrl);
        assertTrue(galaxy.includeUrls.isEmpty());
    }

    @Test
    public void keepsTheSchemesSpotifyCanUse_labeledWithTheTheme() {
        Map<String, ThemeState.Selection> schemes = Marketplace.schemes("Catppuccin",
                "[Mocha]\nmain = 1e1e2e\nbutton = cba6f7\n[turntable]\nmain = ${xrdb:color0}\n[latte]\nmain = eff1f5\n");
        assertEquals(Arrays.asList("mocha", "latte"), new ArrayList<>(schemes.keySet()));
        ThemeState.Selection mocha = schemes.get("mocha");
        assertEquals(ThemeState.SCHEME, mocha.kind);
        assertEquals("Catppuccin (mocha)", mocha.label);
        assertEquals(Integer.valueOf(0xFF1E1E2E), mocha.colors.get("main"));
        assertEquals(Integer.valueOf(0xFFCBA6F7), mocha.colors.get("button"));
        assertEquals(Integer.valueOf(0xFF000000), mocha.colors.get("on-button")); // resolved, as Appearance applies it
        try {
            Marketplace.schemes("Nothing", "; only a comment");
            fail("A color.ini without a scheme was read");
        } catch (ThemeException expected) {
            assertEquals("No color schemes found.", expected.getMessage());
        }
    }

    @Test
    public void capsUntrustedManifestData() throws Exception {
        String long150 = repeat('t', 150);
        StringBuilder manifest = new StringBuilder("[");
        for (int i = 0; i < 60; i++) {
            if (i > 0) manifest.append(',');
            manifest.append("{\"name\":\"").append(long150).append("\",\"description\":\"").append(repeat('d', 400))
                    .append("\",\"usercss\":\"u.css\",\"schemes\":\"c.ini\",\"authors\":[{\"name\":\"").append(long150).append("\"}]}");
        }
        List<Marketplace.Theme> themes = Marketplace.parseManifest(manifest.append(']').toString(), GALAXY, 1);
        assertEquals(50, themes.size());
        Marketplace.Theme theme = themes.get(0);
        assertEquals(100, theme.title.length());
        assertEquals(100, theme.author.length());
        assertEquals(300, theme.description.length());
        assertTrue(themes.get(49).order < 2000); // Stays ahead of the next repository's themes.
    }

    @Test
    public void capsWithoutSplittingAnEmoji() throws Exception {
        String name = repeat('t', 99) + "\uD83D\uDE00" + "x"; // the emoji's two halves sit at 99 and 100
        List<Marketplace.Theme> themes = Marketplace.parseManifest("{\"name\":\"" + name + "\",\"description\":\"d\","
                + "\"usercss\":\"u.css\",\"schemes\":\"c.ini\"}", GALAXY, 0);
        assertEquals(repeat('t', 99), themes.get(0).title);
    }

    @Test
    public void sortsByMostStarsThenGitHubAndManifestOrder() {
        Marketplace.Theme first = new Marketplace.Theme("a", "d", "o", null, "s", "r", 9, 0, Collections.emptyList(), null, "u", Collections.emptyList());
        Marketplace.Theme second = new Marketplace.Theme("b", "d", "o", null, "s", "r", 9, 1, Collections.emptyList(), null, "u", Collections.emptyList());
        Marketplace.Theme third = new Marketplace.Theme("c", "d", "o", null, "s", "r", 5, 1000, Collections.emptyList(), null, "u", Collections.emptyList());
        // Stars changed between two search pages, so GitHub listed this one later with more stars.
        Marketplace.Theme moved = new Marketplace.Theme("m", "d", "o", null, "s", "r", 12, 2000, Collections.emptyList(), null, "u", Collections.emptyList());
        assertEquals(Arrays.asList(moved, first, second, third),
                Marketplace.sorted(Arrays.asList(third, first, moved, second)));
    }

    @Test
    public void aDownloadStillArrivingAfterItsDeadlineFails() throws Exception {
        try (ServerSocket server = serve("HTTP/1.1 200 OK\r\nContent-Length: 1000\r\n\r\n", repeat('x', 1000))) {
            assertTooSlow(url(server));
        }
    }

    @Test
    public void aHostThatTricklesHeadersIsCutOffAtTheDeadline() throws Exception {
        // Twenty seconds of header bytes, none of which ends the headers.
        try (ServerSocket server = serve("HTTP/1.1 200 OK\r\n", "X-Slow: " + repeat('x', 1000))) {
            long started = System.nanoTime();
            assertTooSlow(url(server));
            long millis = (System.nanoTime() - started) / 1_000_000;
            assertTrue("took " + millis + " ms", millis < 2000);
        }
    }

    @Test
    public void aDownloadOverTheSizeCapThrowsTooLarge() throws Exception {
        // No declared size: the answer ends when the connection closes, so the body is what's counted.
        try (ServerSocket server = serve("HTTP/1.1 200 OK\r\nConnection: close\r\n\r\n" + repeat('x', 100), "")) {
            try {
                Marketplace.download(url(server), 10);
                fail("A download over the size cap was accepted");
            } catch (Marketplace.TooLargeException expected) {
                assertEquals("Too large: " + url(server), expected.getMessage());
            }
        }
    }

    @Test
    public void aDownloadDeclaredOverTheCapIsRefusedBeforeItsBody() throws Exception {
        // The body would take two seconds to arrive, and then end early; the declared size is refused at once.
        try (ServerSocket server = serve("HTTP/1.1 200 OK\r\nContent-Length: 2000\r\n\r\n", repeat('x', 100))) {
            long started = System.nanoTime();
            try {
                Marketplace.download(url(server), 1000);
                fail("A download declared over the size cap was read");
            } catch (Marketplace.TooLargeException expected) {
                assertEquals("Too large: " + url(server), expected.getMessage());
            }
            long millis = (System.nanoTime() - started) / 1_000_000;
            assertTrue("took " + millis + " ms", millis < 1000);
        }
    }

    @Test
    public void githubsRateLimitAndAMissingFileHaveTheirOwnExceptions() throws Exception {
        // GitHub answers 403 for its primary rate limit and 429 for its secondary one.
        for (String status : new String[] {"403 Forbidden", "429 Too Many Requests"}) {
            try (ServerSocket server = serve("HTTP/1.1 " + status + "\r\nContent-Length: 0\r\n\r\n", "")) {
                try {
                    Marketplace.download(url(server), 10);
                    fail("HTTP " + status + " was accepted");
                } catch (Marketplace.RateLimitException expected) {
                    assertEquals("GitHub's rate limit was reached for " + url(server), expected.getMessage());
                }
            }
        }
        try (ServerSocket server = serve("HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\n\r\n", "")) {
            try {
                Marketplace.download(url(server), 10);
                fail("A missing file was accepted");
            } catch (FileNotFoundException expected) {
                assertEquals(url(server), expected.getMessage());
            }
        }
    }

    @Test
    public void buildsTheManifestUrlFromTheDefaultBranch() {
        assertEquals("https://raw.githubusercontent.com/harbassan/spicetify-galaxy/main/manifest.json", Marketplace.manifestUrl(GALAXY));
    }

    @Test
    public void searchesLikeTheDesktop_titleOwnerAuthorsAndTags_butNotDescriptions() throws Exception {
        List<Marketplace.Theme> themes = Marketplace.parseManifest("["
                + "{\"name\":\"Galaxy\",\"description\":\"Fullscreen images\",\"usercss\":\"u.css\",\"schemes\":\"c.ini\"},"
                + "{\"name\":\"Comfy\",\"description\":\"Rounded\",\"usercss\":\"u.css\",\"schemes\":\"c.ini\","
                + "\"authors\":[{\"name\":\"Nyria\"},{\"name\":\"Ory\"}],\"tags\":[\"Minimal\",\"dark\"]}]", GALAXY, 0);
        Marketplace.Theme galaxy = themes.get(0);
        Marketplace.Theme comfy = themes.get(1);
        assertEquals(Arrays.asList(galaxy), Marketplace.filter(themes, "GALAXY"));
        assertEquals(themes, Marketplace.filter(themes, "harbassan")); // the repository's owner, for both
        assertEquals(Arrays.asList(comfy), Marketplace.filter(themes, "nyria"));
        assertEquals(Arrays.asList(comfy), Marketplace.filter(themes, "ory")); // every author, not only the first
        assertEquals(Arrays.asList(comfy), Marketplace.filter(themes, "minimal"));
        assertEquals(Collections.emptyList(), Marketplace.filter(themes, "fullscreen")); // not descriptions
        assertEquals(themes, Marketplace.filter(themes, "  "));
        // The cache keeps what search reads.
        assertEquals(1, Marketplace.filter(Marketplace.fromJson(Marketplace.toJson(themes, 1L)).themes, "ory").size());
    }

    @Test
    public void roundTripsTheCache() throws Exception {
        List<Marketplace.Theme> themes = Marketplace.parseManifest("{\"name\":\"Galaxy\",\"description\":\"d\","
                + "\"usercss\":\"u.css\",\"schemes\":\"c.ini\",\"include\":\"theme.js\"}", GALAXY, 2);
        Marketplace.Cached cached = Marketplace.fromJson(Marketplace.toJson(themes, 1234L));
        assertEquals(1234L, cached.savedAt);
        Marketplace.Theme theme = cached.themes.get(0);
        assertEquals("Galaxy", theme.title);
        assertEquals(themes.get(0).schemesUrl, theme.schemesUrl);
        assertNull(theme.previewUrl);
        assertEquals(themes.get(0).order, theme.order);
        assertEquals(themes.get(0).usercssUrl, theme.usercssUrl);
        assertEquals(themes.get(0).includeUrls, theme.includeUrls);
    }

    private static String repeat(char c, int count) {
        char[] chars = new char[count];
        Arrays.fill(chars, c);
        return new String(chars);
    }

    /**
     * A local server that answers one request: {@code head} at once, then {@code trickle} one byte
     * every 20 ms, each well inside the read timeout.
     */
    private static ServerSocket serve(String head, String trickle) throws IOException {
        ServerSocket server = new ServerSocket(0, 1, InetAddress.getByName("127.0.0.1"));
        Thread host = new Thread(() -> {
            try (Socket socket = server.accept()) {
                // Read the request first: closing a socket with unread data can reset the connection.
                BufferedReader request = new BufferedReader(
                        new InputStreamReader(socket.getInputStream(), StandardCharsets.US_ASCII));
                String line;
                do {
                    line = request.readLine();
                } while (line != null && !line.isEmpty());
                OutputStream out = socket.getOutputStream();
                out.write(head.getBytes(StandardCharsets.US_ASCII));
                out.flush();
                for (char c : trickle.toCharArray()) {
                    out.write(c);
                    out.flush();
                    Thread.sleep(20);
                }
            } catch (Exception ignored) {
                // The download gave up and closed the connection.
            }
        });
        host.setDaemon(true);
        host.start();
        return server;
    }

    private static String url(ServerSocket server) {
        return "http://127.0.0.1:" + server.getLocalPort() + "/color.ini";
    }

    private static void assertTooSlow(String url) {
        try {
            Marketplace.download(url, 8192, 200);
            fail("A host that trickles bytes held the download past its deadline");
        } catch (IOException expected) {
            assertTrue(expected.getMessage(), expected.getMessage().startsWith("Too slow"));
            Throwable cause = expected.getCause(); // the read loop's own "Too slow" isn't wrapped in a second one
            assertFalse(String.valueOf(cause), cause != null && String.valueOf(cause.getMessage()).startsWith("Too slow"));
        }
    }
}
