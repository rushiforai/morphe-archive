package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.app.Dialog;
import android.database.DataSetObserver;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Looper;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import app.spicetify.extension.spotify.theme.ThemeBackground;
import app.spicetify.extension.spotify.theme.ThemeBackgroundTest;
import app.spicetify.extension.spotify.theme.ThemePresets;
import app.spicetify.extension.spotify.theme.ThemeRoleMap;
import app.spicetify.extension.spotify.theme.ThemeRuntime;
import app.spicetify.extension.spotify.theme.ThemeState;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

// Android 13 takes the resource table, which works in Robolectric.
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE, shadows = MarketplaceSettingsTest.Capabilities.class)
public class MarketplaceSettingsTest {
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class Capabilities {
        @Implementation public static boolean themeColors() { return true; }
    }

    /** The role table the theme patch injects, cut down to the page background. */
    @Implements(value = ThemeRoleMap.class, isInAndroidSdk = false)
    public static class Patched {
        @Implementation protected static String encoded() { return "main:gray_7"; }
    }

    private static final Executor DIRECT = Runnable::run;
    private static final Marketplace.Repo REPO_A =
            new Marketplace.Repo("ownerA", "repoA", "main", "https://github.com/ownerA/repoA", 100);
    private static final Marketplace.Repo REPO_B =
            new Marketplace.Repo("ownerB", "repoB", "main", "https://github.com/ownerB/repoB", 1);
    private static final String TWO_SCHEMES = "[a]\nmain = 000000\n[b]\nmain = 0b1026\ncard = 1c2340\nbutton = 509bf5\n";
    private static final String ONE_SCHEME = "[dark]\nmain = 121212\n";
    /** Galaxy's own color.ini, in short: one scheme. */
    private static final String GALAXY_COLOR_INI = "[base]\ntext = FFFFFF\nmain = 000000\ncard = 000000\nbutton = F1F1F1\n";

    private final Marketplace.Fetcher productionFetcher = MarketplaceSettings.fetcher;
    private final Executor productionLoads = MarketplaceSettings.loads;
    private final Executor productionDownloads = MarketplaceSettings.downloads;
    private final Executor productionRequests = MarketplaceSettings.requests;
    private final PreviewImages productionPreviews = MarketplaceSettings.previews;
    private final PreviewImages.Downloader productionBackgrounds = MarketplaceSettings.backgrounds;
    private final Map<String, String> responses = new HashMap<>();
    /** Every URL the fetcher was asked for, in order. */
    private final List<String> requested = new ArrayList<>();
    /** Every preview URL downloaded, in order. */
    private final List<String> previewsDownloaded = new ArrayList<>();
    /** Work the fetcher does when it's asked for a URL, before it answers; each runs once. */
    private final Map<String, Runnable> onRequest = new HashMap<>();
    /** Background images by URL; the image downloader fails with an HTTP 500 for any other. */
    private final Map<String, byte[]> images = new HashMap<>();
    /** An image in {@link #images} that isn't there: a 404. */
    private static final byte[] GONE = new byte[0];

    @Before public void initialize() {
        var application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        application.deleteSharedPreferences("spicetify_theme");
        new File(application.getCacheDir(), "spicetify_marketplace.json").delete();
        new File(application.getCacheDir(), "spicetify_marketplace_themes.json").delete();
        new File(application.getFilesDir(), "spicetify_background").delete();
        PatchSettings.initialize(application);
        // A load a test left queued would be taken over by the next test's page.
        MarketplaceSettings.running = null;
        MarketplaceSettings.fetcher = url -> {
            requested.add(url);
            Runnable work = onRequest.remove(url);
            if (work != null) work.run();
            String value = responses.get(url);
            if (value == null) throw new FileNotFoundException(url);
            if ("RATE".equals(value)) throw new Marketplace.RateLimitException(url);
            if ("FAIL".equals(value)) throw new IOException("Connection reset");
            return value;
        };
        MarketplaceSettings.loads = DIRECT;
        MarketplaceSettings.downloads = DIRECT;
        MarketplaceSettings.requests = DIRECT;
        MarketplaceSettings.previews = new PreviewImages(url -> {
            previewsDownloaded.add(url);
            return png();
        }, DIRECT);
        MarketplaceSettings.backgrounds = url -> {
            requested.add(url);
            byte[] image = images.get(url);
            if (image == GONE) throw new FileNotFoundException(url);
            if (image == null) throw new IOException("HTTP 500 for " + url);
            return image;
        };
    }

    @After public void restore() {
        MarketplaceSettings.fetcher = productionFetcher;
        MarketplaceSettings.loads = productionLoads;
        MarketplaceSettings.downloads = productionDownloads;
        MarketplaceSettings.requests = productionRequests;
        MarketplaceSettings.previews = productionPreviews;
        MarketplaceSettings.backgrounds = productionBackgrounds;
    }

    @Test public void appearanceOpensTheMarketplaceFromARowNextToPaste() {
        putTwoThemes();
        try (var controller = appearance()) {
            Dialog appearancePage = ShadowDialog.getLatestDialog();
            View appearance = appearancePage.getWindow().getDecorView();
            View row = row(appearance, "Spicetify Marketplace");
            assertNotNull(row);
            ViewGroup rows = (ViewGroup) row.getParent();
            assertEquals(rows.indexOfChild(row) + 1, rows.indexOfChild(row(appearance, "Paste a Spicetify theme")));
            Dialog page = open(appearance);
            assertNotSame(appearancePage, page);
            View screen = page.getWindow().getDecorView();
            assertTrue(visibleTexts(screen).contains("Spicetify Marketplace"));
            assertNotNull(described(screen, "Back"));
            // The list scrolls on its own: inside a ScrollView it would be one row tall.
            for (ViewParent parent = first(screen, ListView.class).getParent(); parent instanceof View; parent = parent.getParent()) {
                assertFalse(parent instanceof ScrollView);
            }
            // Presets and Custom stay on Appearance.
            assertNull(row(screen, "OLED"));
            assertNull(row(screen, "Custom"));
            described(screen, "Back").performClick();
            assertFalse(page.isShowing());
            assertTrue(appearancePage.isShowing());
        }
    }

    @Test @Config(sdk = 29) public void belowAndroid11AppearanceHasNoMarketplace() {
        try (var controller = appearance()) {
            View appearance = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertNull(row(appearance, "Spicetify Marketplace"));
            assertTrue(hasTextContaining(appearance, "Themes need Android 11 or later."));
        }
    }

    @Test public void listsThemesByStarsWithPreviewsAuthorsAndStars() {
        // GitHub lists repoB first, but repoA has more stars.
        responses.put(Marketplace.SEARCH_URL + "1", search(REPO_B, REPO_A));
        responses.put(Marketplace.manifestUrl(REPO_A), themeJson("Aurora", "A vivid theme"));
        responses.put(Marketplace.manifestUrl(REPO_B), themeJson("Borealis", "A cool theme"));
        responses.put(colorIni(REPO_A), ONE_SCHEME);
        responses.put(colorIni(REPO_B), ONE_SCHEME);
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(list.getAdapter()));
            View aurora = list.getAdapter().getView(position(list, 0), null, list);
            assertTrue(visibleTexts(aurora).contains("ownerA • 100 stars"));
            assertTrue(visibleTexts(aurora).contains("A vivid theme"));
            assertTrue(visibleTexts(list.getAdapter().getView(position(list, 1), null, list)).contains("ownerB • 1 star"));
            idle();
            assertEquals(1, Collections.frequency(previewsDownloaded, Marketplace.resolve("preview.png", REPO_A, "main")));
            assertNotNull(first(aurora, ImageView.class).getDrawable());
            assertFalse(visibleTexts(screen).contains("Loading themes…"));
            assertTrue(visibleTexts(screen).contains("Refresh"));
        }
    }

    @Test public void searchFindsTitlesAndOwnersButNotDescriptions() {
        putTwoThemes();
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            EditText search = first(screen, EditText.class);
            assertEquals("Search themes", search.getHint().toString());
            search.setText("AURORA");
            assertEquals(Collections.singletonList("Aurora"), titles(list.getAdapter()));
            search.setText("ownerb");
            assertEquals(Collections.singletonList("Borealis"), titles(list.getAdapter()));
            search.setText("vivid"); // Aurora's description; the desktop Marketplace doesn't search those
            assertEquals(Collections.emptyList(), titles(list.getAdapter()));
            search.setText("nothing like this");
            assertEquals(Collections.emptyList(), titles(list.getAdapter()));
            assertTrue(visibleTexts(screen).contains("No themes match"));
        }
    }

    @Test public void aLoadWithNoThemesSaysSo() {
        responses.put(Marketplace.SEARCH_URL + "1", "{\"total_count\":0,\"items\":[]}");
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            List<String> texts = visibleTexts(screen);
            assertTrue(texts.contains("No themes found"));
            assertTrue(texts.contains("Refresh"));
            assertFalse(texts.contains("Loading themes…"));
        }
    }

    @Test public void aFailedLoadSaysWhyOnThePageAndRefreshLoadsAgain() {
        List<Runnable> loads = new ArrayList<>();
        MarketplaceSettings.loads = loads::add;
        try (var controller = appearance()) {
            Dialog page = open(decor());
            View screen = page.getWindow().getDecorView();
            List<String> texts = visibleTexts(screen);
            assertTrue(texts.contains("Loading themes…"));
            assertFalse(texts.contains("Refresh"));

            loads.remove(0).run(); // nothing answers, so the search fails
            idle();
            texts = visibleTexts(screen);
            assertTrue(texts.contains("Couldn't load the Marketplace: " + Marketplace.SEARCH_URL + "1"));
            assertTrue(texts.contains("Retry"));
            assertFalse(texts.contains("Refresh"));
            assertSame(page, ShadowDialog.getLatestDialog()); // no sheet: the page says it

            putTwoThemes();
            button(screen, "Retry").performClick();
            assertTrue(visibleTexts(screen).contains("Loading themes…"));
            assertEquals(1, loads.size());
            loads.remove(0).run();
            idle();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
            texts = visibleTexts(screen);
            assertFalse(texts.contains("Loading themes…"));
            assertFalse(texts.contains("Couldn't load the Marketplace: " + Marketplace.SEARCH_URL + "1"));
            assertTrue(texts.contains("Refresh"));
        }
    }

    @Test public void everyManifestFailingSaysWhyWithRetry() {
        putTwoThemes();
        responses.put(Marketplace.manifestUrl(REPO_A), "RATE");
        responses.put(Marketplace.manifestUrl(REPO_B), "RATE");
        try (var controller = appearance()) {
            Dialog page = open(decor());
            View screen = page.getWindow().getDecorView();
            List<String> texts = visibleTexts(screen);
            assertTrue(texts.contains(MarketplaceLoader.RATE_LIMITED));
            assertTrue(texts.contains("Retry"));
            assertFalse(texts.contains("No themes found"));

            responses.put(Marketplace.manifestUrl(REPO_A), "FAIL"); // no connection
            responses.put(Marketplace.manifestUrl(REPO_B), "FAIL");
            button(screen, "Retry").performClick();
            idle();
            texts = visibleTexts(screen);
            assertTrue(texts.contains("Couldn't load the Marketplace: Connection reset"));
            assertTrue(texts.contains("Retry"));
            assertSame(page, ShadowDialog.getLatestDialog());
        }
    }

    @Test public void aFailedRefreshKeepsTheListAndSaysSo() {
        putTwoThemes();
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);

            responses.put(Marketplace.manifestUrl(REPO_B), "FAIL");
            button(screen, "Refresh").performClick();
            idle();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(list.getAdapter()));
            List<String> texts = visibleTexts(screen);
            assertTrue(texts.contains(MarketplaceLoader.REFRESH_FAILED));
            assertTrue(texts.contains("Retry"));

            responses.put(Marketplace.SEARCH_URL + "1", "RATE");
            button(screen, "Retry").performClick();
            idle();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(list.getAdapter()));
            assertTrue(visibleTexts(screen).contains(MarketplaceLoader.RATE_LIMITED));
        }
    }

    @Test public void anExpiredListStaysOnScreenWhileTheListLoadsAgain() throws IOException {
        putTwoThemes();
        writeCache("spicetify_marketplace_themes.json", System.currentTimeMillis() - 7 * 60 * 60 * 1000L, "Old theme");
        List<Runnable> loads = new ArrayList<>();
        MarketplaceSettings.loads = loads::add;
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            List<List<String>> during = new ArrayList<>();
            List<List<String>> textsDuring = new ArrayList<>();
            onRequest.put(Marketplace.manifestUrl(REPO_B), () -> {
                idle(); // what the page shows while the list loads again
                during.add(titles(list.getAdapter()));
                textsDuring.add(visibleTexts(screen));
            });

            loads.remove(0).run();
            idle();

            assertEquals(Collections.singletonList(Collections.singletonList("Old theme")), during);
            assertTrue(textsDuring.get(0).contains("Loading themes…"));
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(list.getAdapter()));
            assertFalse(visibleTexts(screen).contains("Loading themes…"));
        }
    }

    @Test public void aPageOpenedDuringALoadTakesItOverAndShowsItsListAtOnce() throws IOException {
        putTwoThemes();
        writeCache("spicetify_marketplace_themes.json", System.currentTimeMillis() - 7 * 60 * 60 * 1000L, "Old theme");
        List<Runnable> loads = new ArrayList<>();
        MarketplaceSettings.loads = loads::add;
        try (var controller = appearance()) {
            View appearance = decor();
            Dialog first = open(appearance);
            ListView firstList = first(first.getWindow().getDecorView(), ListView.class);
            Dialog[] second = new Dialog[1];
            List<String> secondAtOnce = new ArrayList<>();
            List<String> secondTexts = new ArrayList<>();
            onRequest.put(Marketplace.SEARCH_URL + "1", () -> {
                idle();
                first.onBackPressed(); // closed while its load runs
                idle();
                second[0] = open(appearance);
                View screen = second[0].getWindow().getDecorView();
                secondAtOnce.addAll(titles(first(screen, ListView.class).getAdapter()));
                secondTexts.addAll(visibleTexts(screen));
            });

            loads.remove(0).run();
            idle();

            assertTrue(loads.isEmpty()); // the second page took over the load in flight
            assertEquals(Collections.singletonList("Old theme"), secondAtOnce);
            assertTrue(secondTexts.contains("Loading themes…"));
            View screen = second[0].getWindow().getDecorView();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
            assertFalse(visibleTexts(screen).contains("Loading themes…"));
            // The closed page heard nothing more from the load.
            assertEquals(Collections.singletonList("Old theme"), titles(firstList.getAdapter()));
        }
    }

    @Test public void aPageOpenedDuringARefreshShowsTheListAtOnce() {
        putTwoThemes();
        List<Runnable> loads = new ArrayList<>();
        try (var controller = appearance()) {
            View appearance = decor();
            Dialog first = open(appearance); // lists and caches Aurora and Borealis
            MarketplaceSettings.loads = loads::add;
            button(first.getWindow().getDecorView(), "Refresh").performClick();
            Dialog[] second = new Dialog[1];
            List<String> secondAtOnce = new ArrayList<>();
            List<String> secondTexts = new ArrayList<>();
            onRequest.put(Marketplace.SEARCH_URL + "1", () -> {
                idle();
                first.onBackPressed(); // closed while its refresh runs
                idle();
                second[0] = open(appearance);
                View screen = second[0].getWindow().getDecorView();
                secondAtOnce.addAll(titles(first(screen, ListView.class).getAdapter()));
                secondTexts.addAll(visibleTexts(screen));
            });

            loads.remove(0).run();
            idle();

            assertTrue(loads.isEmpty()); // the second page took over the refresh
            assertEquals(Arrays.asList("Aurora", "Borealis"), secondAtOnce);
            assertTrue(secondTexts.contains("Loading themes…"));
            View screen = second[0].getWindow().getDecorView();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
            assertFalse(visibleTexts(screen).contains("Loading themes…"));
        }
    }

    @Test public void rotatingDuringARefreshKeepsTheList() {
        putTwoThemes();
        List<Runnable> loads = new ArrayList<>();
        try (var controller = appearance()) {
            Dialog first = open(decor());
            MarketplaceSettings.loads = loads::add;
            button(first.getWindow().getDecorView(), "Refresh").performClick();
            controller.recreate();
            idle();
            View screen = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
            assertTrue(visibleTexts(screen).contains("Loading themes…"));
            assertEquals(1, loads.size()); // the new page took over the refresh

            loads.remove(0).run();
            idle();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
            assertFalse(visibleTexts(screen).contains("Loading themes…"));
        }
    }

    @Test public void aPageOpenedDuringAColdLoadShowsItsListSoFar() {
        putTwoThemes(); // no cache, so the load lists themes as they arrive
        List<Runnable> loads = new ArrayList<>();
        MarketplaceSettings.loads = loads::add;
        try (var controller = appearance()) {
            View appearance = decor();
            Dialog first = open(appearance);
            Dialog[] second = new Dialog[1];
            List<String> secondAtOnce = new ArrayList<>();
            onRequest.put(Marketplace.manifestUrl(REPO_B), () -> {
                idle();
                first.onBackPressed();
                idle();
                second[0] = open(appearance);
                secondAtOnce.addAll(titles(first(second[0].getWindow().getDecorView(), ListView.class).getAdapter()));
            });

            loads.remove(0).run();
            idle();

            assertTrue(loads.isEmpty());
            assertEquals(Collections.singletonList("Aurora"), secondAtOnce);
            View screen = second[0].getWindow().getDecorView();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
            assertFalse(visibleTexts(screen).contains("Loading themes…"));
        }
    }

    @Test public void rotatingDuringAColdLoadShowsItsListSoFar() {
        putTwoThemes();
        List<Runnable> loads = new ArrayList<>();
        MarketplaceSettings.loads = loads::add;
        try (var controller = appearance()) {
            open(decor());
            List<String> afterRotation = new ArrayList<>();
            List<String> textsAfterRotation = new ArrayList<>();
            onRequest.put(Marketplace.manifestUrl(REPO_B), () -> {
                idle();
                controller.recreate();
                idle();
                View screen = ShadowDialog.getLatestDialog().getWindow().getDecorView();
                afterRotation.addAll(titles(first(screen, ListView.class).getAdapter()));
                textsAfterRotation.addAll(visibleTexts(screen));
            });

            loads.remove(0).run();
            idle();

            assertTrue(loads.isEmpty()); // the new page took over the load
            assertEquals(Collections.singletonList("Aurora"), afterRotation);
            assertTrue(textsAfterRotation.contains("Loading themes…"));
            View screen = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
        }
    }

    @Test public void aFailedRefreshWithoutACacheFileKeepsTheListAndSaysSo() {
        // Two search pages, and a blacklist that fails, so the first list isn't cached.
        responses.put(Marketplace.BLACKLIST_URL, "FAIL");
        responses.put(Marketplace.SEARCH_URL + "1", search(2, REPO_A));
        responses.put(Marketplace.SEARCH_URL + "2", search(2, REPO_B));
        responses.put(Marketplace.manifestUrl(REPO_A), themeJson("Aurora", "A vivid theme"));
        responses.put(Marketplace.manifestUrl(REPO_B), themeJson("Borealis", "A cool theme"));
        responses.put(colorIni(REPO_A), ONE_SCHEME);
        responses.put(colorIni(REPO_B), ONE_SCHEME);
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(list.getAdapter()));

            // The refresh reads the blacklist, and GitHub rate limits its second search page.
            responses.put(Marketplace.BLACKLIST_URL, "{\"repos\":[]}");
            responses.put(Marketplace.SEARCH_URL + "2", "RATE");
            button(screen, "Refresh").performClick();
            idle();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(list.getAdapter()));
            List<String> texts = visibleTexts(screen);
            assertTrue(texts.contains(MarketplaceLoader.RATE_LIMITED));
            assertTrue(texts.contains("Retry"));

            responses.put(Marketplace.SEARCH_URL + "2", "FAIL");
            button(screen, "Retry").performClick();
            idle();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(list.getAdapter()));
            assertTrue(visibleTexts(screen).contains(MarketplaceLoader.REFRESH_FAILED));
        }
    }

    @Test public void aRetryThatComesUpShortAfterAFailedLoadShowsWhatArrivedAndWhy() {
        responses.put(Marketplace.SEARCH_URL + "1", "RATE");
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            assertTrue(visibleTexts(screen).contains(MarketplaceLoader.RATE_LIMITED));
            assertEquals(Collections.emptyList(), titles(list.getAdapter()));

            // Retry gets the first search page, and GitHub rate limits the second.
            responses.put(Marketplace.SEARCH_URL + "1", search(2, REPO_A));
            responses.put(Marketplace.SEARCH_URL + "2", "RATE");
            responses.put(Marketplace.manifestUrl(REPO_A), themeJson("Aurora", "A vivid theme"));
            responses.put(colorIni(REPO_A), ONE_SCHEME);
            button(screen, "Retry").performClick();
            idle();
            assertEquals(Collections.singletonList("Aurora"), titles(list.getAdapter()));
            List<String> texts = visibleTexts(screen);
            assertTrue(texts.contains(MarketplaceLoader.RATE_LIMITED));
            assertTrue(texts.contains("Retry"));
        }
    }

    @Test public void aPageClosedDuringItsLoadHearsNothingMoreFromIt() throws IOException {
        putTwoThemes();
        writeCache("spicetify_marketplace_themes.json", System.currentTimeMillis() - 7 * 60 * 60 * 1000L, "Old theme");
        List<Runnable> loads = new ArrayList<>();
        MarketplaceSettings.loads = loads::add;
        try (var controller = appearance()) {
            Dialog page = open(decor());
            ListView list = first(page.getWindow().getDecorView(), ListView.class);
            onRequest.put(Marketplace.SEARCH_URL + "1", () -> {
                idle();
                page.onBackPressed();
                idle();
            });

            loads.remove(0).run();
            idle();

            // The load went on, and cached its list for the next page, but no longer reported to this one.
            assertEquals(Collections.singletonList("Old theme"), titles(list.getAdapter()));
            assertTrue(new File(RuntimeEnvironment.getApplication().getCacheDir(), "spicetify_marketplace_themes.json").exists());
            assertTrue(visibleTexts(page.getWindow().getDecorView()).contains("Loading themes…"));
        }
    }

    @Test public void aCacheLeftByTheForkIsNotRead() throws IOException {
        putTwoThemes();
        // The fork kept themes and extensions in this file, an extension with a null color.ini.
        File fork = new File(RuntimeEnvironment.getApplication().getCacheDir(), "spicetify_marketplace.json");
        Files.write(fork.toPath(), ("{\"savedAt\":" + System.currentTimeMillis() + ",\"themes\":["
                + "{\"title\":\"Fork theme\",\"description\":\"d\",\"author\":\"a\",\"preview\":null,"
                + "\"schemes\":\"https://example.com/c.ini\",\"repo\":\"https://github.com/a/b\",\"stars\":9,\"order\":0},"
                + "{\"title\":\"Trash Bin\",\"description\":\"d\",\"author\":\"a\",\"preview\":null,\"schemes\":null,"
                + "\"repo\":\"https://github.com/spicetify/cli\",\"stars\":8,\"order\":1,\"kind\":\"extension\","
                + "\"main\":\"https://example.com/trashbin.js\",\"android\":\"trash_bin\"}]}").getBytes(StandardCharsets.UTF_8));
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
        }
    }

    @Test public void githubsRateLimitShowsOnThePage() {
        responses.put(Marketplace.BLACKLIST_URL, "{\"repos\":[]}");
        responses.put(Marketplace.SEARCH_URL + "1", "RATE");
        try (var controller = appearance()) {
            Dialog page = open(decor());
            assertTrue(visibleTexts(page.getWindow().getDecorView())
                    .contains("GitHub's rate limit was reached. Try again in a few minutes."));
            assertSame(page, ShadowDialog.getLatestDialog());
        }
    }

    @Test public void aRefreshKeepsTheListOnScreenUntilItIsDone() {
        putTwoThemes();
        // The first list isn't cached, so the refresh sends its partial lists, which the page holds back.
        responses.put(Marketplace.BLACKLIST_URL, "FAIL");
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListAdapter adapter = first(screen, ListView.class).getAdapter();
            List<List<String>> shown = new ArrayList<>();
            adapter.registerDataSetObserver(new DataSetObserver() {
                @Override public void onChanged() {
                    shown.add(titles(adapter));
                }
            });
            responses.put(Marketplace.manifestUrl(REPO_A),
                    "[" + themeJson("Aurora", "A vivid theme") + "," + themeJson("Andromeda", "A far theme") + "]");
            responses.put(Marketplace.BLACKLIST_URL, "{\"repos\":[]}");

            button(screen, "Refresh").performClick();
            idle();

            // repoA's manifest arrives first, but the list changes only once the refresh is done.
            assertTrue(shown.size() >= 3);
            for (List<String> titles : shown.subList(0, shown.size() - 1)) {
                assertEquals(Arrays.asList("Aurora", "Borealis"), titles);
            }
            assertEquals(Arrays.asList("Aurora", "Andromeda", "Borealis"), shown.get(shown.size() - 1));
        }
    }

    @Test public void reopeningWithinSixHoursListsTheCacheWithoutGitHub() {
        putTwoThemes();
        try (var controller = appearance()) {
            View appearance = decor();
            Dialog page = open(appearance);
            page.onBackPressed();
            responses.clear();
            requested.clear();
            View screen = open(appearance).getWindow().getDecorView();
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
            assertFalse(visibleTexts(screen).contains("Loading themes…"));
            assertTrue(requested.isEmpty());
        }
    }

    @Test @Config(shadows = Patched.class)
    public void aThemeWithTwoSchemesOffersAChoiceAndAppliesTheChosenOne() {
        putTwoThemes();
        responses.put(colorIni(REPO_A), TWO_SCHEMES);
        try (var controller = appearance()) {
            View appearance = decor();
            Dialog page = open(appearance);
            View screen = page.getWindow().getDecorView();
            tap(first(screen, ListView.class), 0);
            idle();
            Dialog chooser = ShadowDialog.getLatestDialog();
            View sheet = chooser.getWindow().getDecorView();
            assertTrue(hasText(sheet, "Aurora"));
            assertTrue(hasText(sheet, "Choose a color scheme."));
            assertNotNull(row(sheet, "a"));
            row(sheet, "b").performClick();
            assertFalse(chooser.isShowing());
            Dialog prompt = ShadowDialog.getLatestDialog();
            assertTrue(hasText(prompt.getWindow().getDecorView(), "Restart Spotify to finish applying Aurora (b)?"));
            button(prompt, "Later").performClick();

            ThemeState.Selection applied = ThemeState.load(controller.get());
            assertEquals(ThemeState.SCHEME, applied.kind);
            assertEquals("Aurora (b)", applied.label);
            assertEquals(Integer.valueOf(0xFF0B1026), applied.colors.get("main"));
            assertEquals(Integer.valueOf(0xFF1C2340), applied.colors.get("card"));
            assertEquals(Integer.valueOf(0xFF509BF5), applied.colors.get("button"));
            assertEquals(0xFF0B1026, SpotifyStyle.background());
            assertEquals(View.VISIBLE, restartBar(screen).getVisibility());
            assertTrue(page.isShowing()); // the Marketplace stays open to try another

            // Back on Appearance, the scheme is the theme in use, as a pasted one is.
            page.onBackPressed();
            idle();
            assertNotNull(row(appearance, "Aurora (b), selected"));
            assertNotNull(row(appearance, "Midnight"));
            assertEquals(View.VISIBLE, restartBar(appearance).getVisibility());
        }
    }

    @Test @Config(shadows = Patched.class)
    public void aThemeWithOneSchemeAppliesItWithoutAChoice() {
        putTwoThemes();
        responses.put(colorIni(REPO_B), "[Dark]\nmain = 121212\nbutton = f573a0\n");
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            tap(first(screen, ListView.class), 1);
            idle();
            Dialog prompt = ShadowDialog.getLatestDialog();
            assertTrue(hasText(prompt.getWindow().getDecorView(), "Restart Spotify to finish applying Borealis (dark)?"));
            assertEquals("Borealis (dark)", ThemeState.load(controller.get()).label);
            assertEquals(Integer.valueOf(0xFFF573A0), ThemeState.load(controller.get()).colors.get("button"));
        }
    }

    @Test public void aTapDownloadsOnItsOwnExecutorAndIgnoresTapsUntilItIsDone() {
        putTwoThemes();
        responses.put(colorIni(REPO_A), TWO_SCHEMES);
        List<Runnable> loads = new ArrayList<>();
        List<Runnable> downloads = new ArrayList<>();
        MarketplaceSettings.loads = loads::add;
        MarketplaceSettings.downloads = downloads::add;
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            loads.remove(0).run();
            idle();
            button(screen, "Refresh").performClick(); // a load is running from here on
            ListView list = first(screen, ListView.class);

            tap(list, 0);
            tap(list, 1); // ignored: Aurora is still downloading
            assertEquals(1, downloads.size());
            assertTrue(visibleTexts(screen).contains("Downloading Aurora…"));

            downloads.remove(0).run();
            idle();
            assertTrue(hasText(ShadowDialog.getLatestDialog().getWindow().getDecorView(), "Choose a color scheme."));
            assertEquals(1, loads.size()); // the chooser didn't wait for the refresh
            assertFalse(visibleTexts(screen).contains("Downloading Aurora…"));
            ShadowDialog.getLatestDialog().cancel();
            tap(list, 1);
            assertEquals(1, downloads.size());
        }
    }

    @Test public void aDownloadThatEndsAfterTheMarketplaceClosedShowsNothing() {
        putTwoThemes();
        responses.put(colorIni(REPO_A), TWO_SCHEMES);
        List<Runnable> downloads = new ArrayList<>();
        MarketplaceSettings.downloads = downloads::add;
        try (var controller = appearance()) {
            View appearance = decor();
            Dialog page = open(appearance);
            tap(first(page.getWindow().getDecorView(), ListView.class), 0);
            page.onBackPressed();
            downloads.remove(0).run();
            idle();
            assertSame(page, ShadowDialog.getLatestDialog()); // no chooser came after it

            // Done while the page was open, but shown only after it closed.
            page = open(appearance);
            tap(first(page.getWindow().getDecorView(), ListView.class), 0);
            downloads.remove(0).run();
            page.onBackPressed();
            idle();
            assertSame(page, ShadowDialog.getLatestDialog());
        }
    }

    @Test public void theMarketplaceComesBackWhenSpotifyRecreatesItsActivity() {
        putTwoThemes();
        try (var controller = appearance()) {
            open(decor());
            requested.clear();
            controller.recreate();
            idle();
            Dialog page = ShadowDialog.getLatestDialog();
            assertTrue(page.isShowing());
            View screen = page.getWindow().getDecorView();
            assertTrue(visibleTexts(screen).contains("Spicetify Marketplace"));
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(first(screen, ListView.class).getAdapter()));
            assertTrue(requested.isEmpty()); // from the cache
        }
    }

    @Test public void closingTheMarketplaceDropsQueuedPreviews() {
        putTwoThemes();
        List<Runnable> queued = new ArrayList<>();
        MarketplaceSettings.previews = new PreviewImages(url -> {
            previewsDownloaded.add(url);
            return png();
        }, queued::add);
        try (var controller = appearance()) {
            Dialog page = open(decor());
            ListView list = first(page.getWindow().getDecorView(), ListView.class);
            list.getAdapter().getView(0, null, list); // binding a row queues its preview

            page.onBackPressed();
            idle();
            for (Runnable task : queued) task.run();

            assertFalse(queued.isEmpty());
            assertTrue(previewsDownloaded.isEmpty());
        }
    }

    @Test public void downloadProblemsShowInASheetAndChangeNothing() {
        putTwoThemes();
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            // The color.ini files changed since the list was loaded.
            responses.remove(colorIni(REPO_A));
            responses.put(colorIni(REPO_B), "[turntable]\nmain = ${xrdb:color0}\n");

            tap(list, 0);
            idle();
            assertProblem("Aurora has no color schemes to use on Android.");
            tap(list, 1);
            idle();
            assertProblem("Borealis has no colors Spotify can use.");
            responses.put(colorIni(REPO_A), "FAIL");
            tap(list, 0);
            idle();
            assertProblem("Couldn't download Aurora: Connection reset");
            responses.put(colorIni(REPO_A), "RATE");
            tap(list, 0);
            idle();
            assertProblem("Couldn't download Aurora: GitHub's rate limit was reached. Try again in a few minutes.");

            assertEquals(ThemePresets.STOCK, ThemeState.load(controller.get()).kind);
            assertEquals(View.GONE, restartBar(screen).getVisibility());
        }
    }

    @Test public void aSchemeTheResourcesCannotTakeLeavesTheThemeUnchanged() {
        // Without the patch's role table, no theme can take effect.
        putTwoThemes();
        responses.put(colorIni(REPO_A), TWO_SCHEMES);
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            tap(first(screen, ListView.class), 0);
            idle();
            row(ShadowDialog.getLatestDialog().getWindow().getDecorView(), "b").performClick();
            assertTrue(hasText(ShadowDialog.getLatestDialog().getWindow().getDecorView(), "Colors not applied"));
            assertEquals(ThemePresets.STOCK, ThemeState.load(controller.get()).kind);
            assertEquals(View.GONE, restartBar(screen).getVisibility());
        }
    }

    @Test public void pinsGalaxyV2AboveTheCommunityThemesAndSearchFindsIt() {
        putTwoThemes();
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            ListAdapter adapter = list.getAdapter();
            assertEquals(3, adapter.getCount());
            assertSame(Marketplace.GALAXY_V2, adapter.getItem(0));
            assertEquals(Arrays.asList("Aurora", "Borealis"), titles(adapter));
            // Its stars aren't known, so its card names the author alone.
            View galaxy = adapter.getView(0, null, list);
            assertTrue(visibleTexts(galaxy).contains("harbassan"));
            assertEquals("Galaxy V2, harbassan", galaxy.getContentDescription().toString());
            assertTrue(previewsDownloaded.contains(Marketplace.GALAXY_V2.previewUrl));

            EditText search = first(screen, EditText.class);
            search.setText("galaxy");
            assertEquals(1, adapter.getCount());
            assertSame(Marketplace.GALAXY_V2, adapter.getItem(0));
            search.setText("harbassan");
            assertSame(Marketplace.GALAXY_V2, adapter.getItem(0));
            search.setText("aurora");
            assertEquals(1, adapter.getCount());
            assertEquals(Collections.singletonList("Aurora"), titles(adapter));
        }
    }

    @Test public void galaxyV2StaysListedWhenTheCommunityThemesFailToLoad() {
        responses.put(Marketplace.SEARCH_URL + "1", "FAIL");
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListAdapter adapter = first(screen, ListView.class).getAdapter();
            assertEquals(1, adapter.getCount());
            assertSame(Marketplace.GALAXY_V2, adapter.getItem(0));
            assertTrue(visibleTexts(screen).contains("Couldn't load the Marketplace: Connection reset"));
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void galaxyV2DownloadsItsSchemesThenItsImageAndAppliesBoth() throws IOException {
        putTwoThemes();
        responses.put(Marketplace.GALAXY_V2.schemesUrl, GALAXY_COLOR_INI);
        images.put(Marketplace.GALAXY_V2.backgroundUrl, ThemeBackgroundTest.png(1200, 675)); // Galaxy's size
        try (var controller = appearance()) {
            View appearance = decor();
            Dialog page = open(appearance);
            ListView list = first(page.getWindow().getDecorView(), ListView.class);
            tapGalaxy(list);
            idle();
            assertEquals(Arrays.asList(Marketplace.GALAXY_V2.schemesUrl, Marketplace.GALAXY_V2.backgroundUrl),
                    requested.subList(requested.size() - 2, requested.size()));
            Dialog prompt = ShadowDialog.getLatestDialog();
            assertTrue(hasText(prompt.getWindow().getDecorView(), "Restart Spotify to finish applying Galaxy V2 (base)?"));
            button(prompt, "Later").performClick();
            assertEquals("Galaxy V2 (base)", ThemeState.load(controller.get()).label);
            // Saved at about screen size: no side longer than the display's longer side.
            BitmapFactory.Options saved = savedImage(controller.get());
            int bound = Math.max(controller.get().getResources().getDisplayMetrics().widthPixels,
                    controller.get().getResources().getDisplayMetrics().heightPixels);
            assertEquals(bound, saved.outWidth);
            assertEquals(Math.round(bound * 675 / 1200f), saved.outHeight, 1);

            // Appearance lists it, with the blur switch its image brings.
            page.onBackPressed();
            idle();
            assertNotNull(row(appearance, "Galaxy V2 (base), selected"));
            assertTrue(hasTextContaining(appearance, "Blur background image"));

            // A theme without an image takes it away.
            page = open(appearance);
            tap(first(page.getWindow().getDecorView(), ListView.class), 1);
            idle();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertEquals("Borealis (dark)", ThemeState.load(controller.get()).label);
            assertFalse(ThemeBackground.hasImage(controller.get()));
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theImageComesWithTheSchemeChosenInTheSheet() {
        putTwoThemes();
        responses.put(Marketplace.GALAXY_V2.schemesUrl, TWO_SCHEMES);
        images.put(Marketplace.GALAXY_V2.backgroundUrl, ThemeBackgroundTest.png(1200, 675));
        try (var controller = appearance()) {
            tapGalaxy(first(open(decor()).getWindow().getDecorView(), ListView.class));
            idle();
            Dialog chooser = ShadowDialog.getLatestDialog();
            row(chooser.getWindow().getDecorView(), "b").performClick();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertEquals("Galaxy V2 (b)", ThemeState.load(controller.get()).label);
            assertTrue(ThemeBackground.hasImage(controller.get()));
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE) // Android's own decoder, which refuses what isn't an image
    public void galaxyV2AppliesNothingWhenItsImageFailsToDownloadOrIsNoImage() throws IOException {
        putTwoThemes();
        responses.put(Marketplace.GALAXY_V2.schemesUrl, GALAXY_COLOR_INI);
        try (var controller = appearance()) {
            byte[] before = theThemeBefore(controller.get());
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            tapGalaxy(list);
            idle();
            assertProblem("Couldn't load Galaxy V2's background image: HTTP 500 for " + Marketplace.GALAXY_V2.backgroundUrl);

            images.put(Marketplace.GALAXY_V2.backgroundUrl, "<html>Not Found</html>".getBytes(StandardCharsets.UTF_8));
            tapGalaxy(list);
            idle();
            assertProblem("Couldn't load Galaxy V2's background image: Not an image Android can read");

            // Out of memory, as with an image too large to decode.
            MarketplaceSettings.backgrounds = url -> {
                throw new OutOfMemoryError();
            };
            tapGalaxy(list);
            idle();
            assertProblem("Couldn't load Galaxy V2's background image: It's too large to load.");

            // The theme in use and its image stay.
            assertEquals("Before (base)", ThemeState.load(controller.get()).label);
            assertArrayEquals(before, Files.readAllBytes(new File(controller.get().getFilesDir(), "spicetify_background").toPath()));
            assertEquals(View.GONE, restartBar(screen).getVisibility());
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE) // Android's own decoder, which reads an image's real size
    public void aThemeBringsTheImageItsScriptNamesAndAThemeWithoutOneClearsIt() {
        putTwoThemes();
        responses.put(Marketplace.manifestUrl(REPO_A), "{\"name\":\"Aurora\",\"description\":\"A vivid theme\","
                + "\"usercss\":\"u.css\",\"schemes\":\"color.ini\",\"include\":[\"missing.js\",\"hazy.js\"]}");
        responses.put(Marketplace.resolve("hazy.js", REPO_A, "main"), "const defImage = \"https://i.imgur.com/Wl2D0h0.png\";");
        responses.put(Marketplace.resolve("u.css", REPO_B, "main"), ".Root__main-view { background-color: transparent; }");
        images.put("https://i.imgur.com/Wl2D0h0.png", ThemeBackgroundTest.png(1200, 675));
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            tap(list, 0);
            idle();
            // missing.js isn't there (a 404), which only means it names no image, and the script's image wins over user.css.
            assertEquals("https://i.imgur.com/Wl2D0h0.png", requested.get(requested.size() - 1));
            assertFalse(requested.contains(Marketplace.resolve("u.css", REPO_A, "main")));
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertEquals("Aurora (dark)", ThemeState.load(controller.get()).label);
            assertTrue(ThemeBackground.hasImage(controller.get()));

            tap(list, 1);
            idle();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertEquals("Borealis (dark)", ThemeState.load(controller.get()).label);
            assertFalse(ThemeBackground.hasImage(controller.get()));
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE) // Android's own decoder, which reads an image's real size
    public void aDataUriImageIsSavedOnlyWhenItIsAtLeast480PxOnEachSide() throws IOException {
        putTwoThemes();
        byte[] png = ThemeBackgroundTest.png(480, 480);
        responses.put(Marketplace.resolve("u.css", REPO_A, "main"),
                "body { background: url(" + dataUri(ThemeBackgroundTest.png(480, 479)) + "); }");
        responses.put(Marketplace.resolve("u.css", REPO_B, "main"),
                ".Root__top-container { background-image: url(\"" + dataUri(png) + "\") !important; }");
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            tap(list, 0); // a pixel short on one side: a tile, not a background, and nothing to say about it
            idle();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertFalse(ThemeBackground.hasImage(controller.get()));
            assertFalse(hasTextContaining(screen, "Couldn't load Aurora's background image"));

            tap(list, 1);
            idle();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            // Saved at about screen size: the display's longer side is 470 px here.
            BitmapFactory.Options saved = savedImage(controller.get());
            assertEquals(470, saved.outWidth);
            assertEquals(470, saved.outHeight);
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE) // Android's own decoder, which reads an image's real size
    public void aTextureTileOnTheWindowIsNoBackground() {
        putTwoThemes();
        // Spotify Dark's shape: a 70x70 tile in a :root variable, repeated over the top container.
        responses.put(Marketplace.resolve("u.css", REPO_A, "main"), ":root { --bgDarkness3: url('"
                + dataUri(ThemeBackgroundTest.png(70, 70)) + "'); }\n.main-view-container, .Root__top-container "
                + "{ background-image: var(--bgDarkness3)!important; background-repeat: repeat!important; }");
        try (var controller = appearance()) {
            // An image from the theme before.
            assertTrue(ThemeRuntime.select(controller.get(), new ThemeState.Selection(ThemeState.SCHEME, "Galaxy V2 (base)",
                    Collections.singletonMap("main", 0xFF000000)), ThemeBackgroundTest.png(480, 480)));
            View screen = open(decor()).getWindow().getDecorView();
            tap(first(screen, ListView.class), 0);
            idle();
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertEquals("Aurora (dark)", ThemeState.load(controller.get()).label);
            assertFalse(ThemeBackground.hasImage(controller.get()));
            assertFalse(hasTextContaining(screen, "Couldn't load Aurora's background image"));
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE) // Android's own decoder, which refuses what isn't an image
    public void aThemesOwnImageThatFailsAppliesNothing() throws IOException {
        putTwoThemes();
        responses.put(Marketplace.manifestUrl(REPO_A), "{\"name\":\"Aurora\",\"description\":\"A vivid theme\","
                + "\"usercss\":\"u.css\",\"schemes\":\"color.ini\",\"include\":[\"a.js\"]}");
        String image = "https://i.imgur.com/aurora.jpg";
        responses.put(Marketplace.resolve("a.js", REPO_A, "main"), "const defImage = \"" + image + "\";");
        try (var controller = appearance()) {
            byte[] before = theThemeBefore(controller.get());
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            tap(list, 0);
            idle();
            assertProblem("Couldn't load Aurora's background image: HTTP 500 for " + image);

            images.put(image, "<html>Not Found</html>".getBytes(StandardCharsets.UTF_8));
            tap(list, 0);
            idle();
            assertProblem("Couldn't load Aurora's background image: Not an image Android can read");

            responses.put(Marketplace.resolve("a.js", REPO_A, "main"), "FAIL");
            tap(list, 0);
            idle();
            assertProblem("Couldn't load Aurora's background image: Connection reset");

            responses.put(Marketplace.resolve("u.css", REPO_B, "main"), "RATE");
            tap(list, 1);
            idle();
            assertProblem("Couldn't load Borealis's background image: " + MarketplaceLoader.RATE_LIMITED);

            // The theme in use and its image stay.
            assertEquals("Before (base)", ThemeState.load(controller.get()).label);
            assertArrayEquals(before, Files.readAllBytes(new File(controller.get().getFilesDir(), "spicetify_background").toPath()));
            assertEquals(View.GONE, restartBar(screen).getVisibility());
        }
    }

    @Test @Config(shadows = Patched.class) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aMissingImageOrFileOnlyMeansTheThemeHasNoImage() throws IOException {
        putTwoThemes();
        responses.put(Marketplace.manifestUrl(REPO_A), "{\"name\":\"Aurora\",\"description\":\"A vivid theme\","
                + "\"usercss\":\"u.css\",\"schemes\":\"color.ini\",\"include\":[\"gone.js\"]}");
        responses.put(Marketplace.resolve("u.css", REPO_B, "main"), ".Root { background: url(bg.jpg); }");
        String image = Marketplace.resolve("bg.jpg", REPO_B, "main");
        images.put(image, GONE);
        try (var controller = appearance()) {
            View screen = open(decor()).getWindow().getDecorView();
            ListView list = first(screen, ListView.class);
            // Neither its script nor its user.css is there.
            theThemeBefore(controller.get());
            tap(list, 0);
            idle();
            assertTrue(requested.contains(Marketplace.resolve("gone.js", REPO_A, "main")));
            assertEquals(Marketplace.resolve("u.css", REPO_A, "main"), requested.get(requested.size() - 1));
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertEquals("Aurora (dark)", ThemeState.load(controller.get()).label);
            assertFalse(ThemeBackground.hasImage(controller.get()));

            // Its user.css names an image that isn't there.
            theThemeBefore(controller.get());
            tap(list, 1);
            idle();
            assertEquals(image, requested.get(requested.size() - 1));
            button(ShadowDialog.getLatestDialog(), "Later").performClick();
            assertEquals("Borealis (dark)", ThemeState.load(controller.get()).label);
            assertFalse(ThemeBackground.hasImage(controller.get()));
            assertFalse(hasTextContaining(screen, "Couldn't load"));
        }
    }

    /** A theme with an image, applied before the test's. Returns the image saved for it. */
    private static byte[] theThemeBefore(Activity activity) throws IOException {
        byte[] image = ThemeBackgroundTest.png(8, 4);
        assertTrue(ThemeRuntime.select(activity, new ThemeState.Selection(ThemeState.SCHEME, "Before (base)",
                Collections.singletonMap("main", 0xFF102040)), image));
        return image;
    }

    private static BitmapFactory.Options savedImage(Activity activity) throws IOException {
        return ThemeBackground.bounds(Files.readAllBytes(new File(activity.getFilesDir(), "spicetify_background").toPath()));
    }

    private void assertProblem(String message) {
        Dialog sheet = ShadowDialog.getLatestDialog();
        View view = sheet.getWindow().getDecorView();
        assertTrue(hasText(view, "Theme not applied"));
        assertTrue("missing: " + message, hasText(view, message));
        button(sheet, "OK").performClick();
        assertFalse(sheet.isShowing());
    }

    private org.robolectric.android.controller.ActivityController<Activity> appearance() {
        var controller = Robolectric.buildActivity(Activity.class).setup();
        SpicetifySettingsScreen.open(controller.get(), SpicetifySettingsScreen.PAGE_APPEARANCE);
        idle();
        return controller;
    }

    /** The Marketplace page, opened from Appearance's row, with its first load shown. */
    private Dialog open(View appearance) {
        row(appearance, "Spicetify Marketplace").performClick();
        idle();
        return ShadowDialog.getLatestDialog();
    }

    /** A cache file with one theme per title, saved at {@code savedAt}. */
    private static void writeCache(String name, long savedAt, String... titles) throws IOException {
        StringBuilder themes = new StringBuilder();
        for (int i = 0; i < titles.length; i++) {
            if (i > 0) themes.append(',');
            themes.append("{\"title\":\"").append(titles[i]).append("\",\"description\":\"d\",\"author\":\"a\",")
                    .append("\"preview\":null,\"schemes\":\"https://example.com/").append(i).append(".ini\",")
                    .append("\"repo\":\"https://github.com/a/b\",\"stars\":9,\"order\":").append(i).append(",\"keywords\":[]}");
        }
        File file = new File(RuntimeEnvironment.getApplication().getCacheDir(), name);
        Files.write(file.toPath(), ("{\"savedAt\":" + savedAt + ",\"themes\":[" + themes + "]}").getBytes(StandardCharsets.UTF_8));
    }

    private static View decor() {
        return ShadowDialog.getLatestDialog().getWindow().getDecorView();
    }

    private static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** A search page with repoA (100 stars), then repoB (1 star), and one theme with one scheme in each. */
    private void putTwoThemes() {
        responses.put(Marketplace.SEARCH_URL + "1", search(REPO_A, REPO_B));
        responses.put(Marketplace.manifestUrl(REPO_A), themeJson("Aurora", "A vivid theme"));
        responses.put(Marketplace.manifestUrl(REPO_B), themeJson("Borealis", "A cool theme"));
        responses.put(colorIni(REPO_A), ONE_SCHEME);
        responses.put(colorIni(REPO_B), ONE_SCHEME);
    }

    private static String colorIni(Marketplace.Repo repo) {
        return Marketplace.resolve("color.ini", repo, "main");
    }

    private static String search(Marketplace.Repo... repos) {
        return search(repos.length, repos);
    }

    /** One search page, out of {@code total} results. */
    private static String search(int total, Marketplace.Repo... repos) {
        StringBuilder items = new StringBuilder();
        for (Marketplace.Repo repo : repos) {
            if (items.length() > 0) items.append(',');
            items.append("{\"full_name\":\"").append(repo.owner).append('/').append(repo.name)
                    .append("\",\"default_branch\":\"main\",\"html_url\":\"").append(repo.url)
                    .append("\",\"stargazers_count\":").append(repo.stars).append('}');
        }
        return "{\"total_count\":" + total + ",\"items\":[" + items + "]}";
    }

    private static String themeJson(String name, String description) {
        return "{\"name\":\"" + name + "\",\"description\":\"" + description
                + "\",\"usercss\":\"u.css\",\"schemes\":\"color.ini\",\"preview\":\"preview.png\"}";
    }

    /** The community themes' titles, without Galaxy V2, which is pinned above them. */
    private static List<String> titles(ListAdapter adapter) {
        List<String> titles = new ArrayList<>();
        for (int i = 0; i < adapter.getCount(); i++) {
            Marketplace.Theme theme = (Marketplace.Theme) adapter.getItem(i);
            if (theme != Marketplace.GALAXY_V2) titles.add(theme.title);
        }
        return titles;
    }

    /** The list position of the community theme at {@code index}, below the pinned Galaxy V2 when it's shown. */
    private static int position(ListView list, int index) {
        ListAdapter adapter = list.getAdapter();
        return adapter.getCount() > 0 && adapter.getItem(0) == Marketplace.GALAXY_V2 ? index + 1 : index;
    }

    /** Taps the community theme at {@code index}. */
    private static void tap(ListView list, int index) {
        int position = position(list, index);
        list.performItemClick(list.getAdapter().getView(position, null, list), position, position);
    }

    private static void tapGalaxy(ListView list) {
        assertSame(Marketplace.GALAXY_V2, list.getAdapter().getItem(0));
        list.performItemClick(list.getAdapter().getView(0, null, list), 0, 0);
    }

    private static String dataUri(byte[] png) {
        return "data:image/png;base64," + Base64.encodeToString(png, Base64.NO_WRAP);
    }

    private static byte[] png() {
        Bitmap bitmap = Bitmap.createBitmap(8, 4, Bitmap.Config.ARGB_8888);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
        return out.toByteArray();
    }

    private View restartBar(View root) {
        Button restart = find(root, "Restart");
        assertNotNull(restart);
        return (View) restart.getParent().getParent();
    }

    private View row(View view, String description) {
        if (view.isClickable() && view.getContentDescription() != null && description.contentEquals(view.getContentDescription())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = row(group.getChildAt(i), description);
                if (found != null) return found;
            }
        }
        return null;
    }

    private View described(View view, String description) {
        if (description.contentEquals(String.valueOf(view.getContentDescription()))) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = described(group.getChildAt(i), description);
                if (found != null) return found;
            }
        }
        return null;
    }

    private Button button(Dialog dialog, String label) {
        return button(dialog.getWindow().getDecorView(), label);
    }

    private Button button(View view, String label) {
        Button found = find(view, label);
        if (found == null) throw new AssertionError("Missing button: " + label);
        return found;
    }

    private Button find(View view, String label) {
        if (view instanceof Button && label.contentEquals(((Button) view).getText())) return (Button) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Button found = find(group.getChildAt(i), label);
                if (found != null) return found;
            }
        }
        return null;
    }

    private <T extends View> T first(View view, Class<T> kind) {
        if (kind.isInstance(view)) return kind.cast(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                T found = first(group.getChildAt(i), kind);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** The texts of the visible text views and buttons under {@code view}. */
    private static List<String> visibleTexts(View view) {
        List<String> texts = new ArrayList<>();
        if (view.getVisibility() != View.VISIBLE) return texts;
        if (view instanceof TextView) texts.add(((TextView) view).getText().toString());
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) texts.addAll(visibleTexts(group.getChildAt(i)));
        }
        return texts;
    }

    private boolean hasTextContaining(View view, String text) {
        if (view instanceof TextView && ((TextView) view).getText().toString().contains(text)) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (hasTextContaining(group.getChildAt(i), text)) return true;
        }
        return false;
    }

    private boolean hasText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (hasText(group.getChildAt(i), text)) return true;
        }
        return false;
    }
}
