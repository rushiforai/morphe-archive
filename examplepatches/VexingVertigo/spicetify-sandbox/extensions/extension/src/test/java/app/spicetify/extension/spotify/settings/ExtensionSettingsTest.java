package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;
import app.spicetify.extension.spotify.extensions.Extensions;
import app.spicetify.extension.spotify.extensions.HidePodcasts;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest;
import app.spicetify.extension.spotify.extensions.TrashBin;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

/** The extensions patch without Theme colors: the root page's extensions, their sheets, and the Marketplace. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE, shadows = ExtensionSettingsTest.ExtensionsOnly.class)
public class ExtensionSettingsTest {
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class ExtensionsOnly {
        /** Theme colors too, for a test that says so. */
        static boolean themeColors;

        @Implementation public static boolean extensions() { return true; }

        @Implementation public static boolean themeColors() { return themeColors; }
    }

    private static final Executor DIRECT = Runnable::run;
    private static final String TRASH_LIST = "{\"songs\":{\"spotify:track:a\":true},\"artists\":{\"spotify:artist:z\":true}}";

    private final Context context = RuntimeEnvironment.getApplication();
    private final Marketplace.Fetcher productionFetcher = MarketplaceSettings.fetcher;
    private final Executor productionLoads = MarketplaceSettings.loads;
    private final Executor productionRequests = MarketplaceSettings.requests;
    private final PreviewImages.Downloader productionBackgrounds = MarketplaceSettings.backgrounds;
    private final List<String> requested = new ArrayList<>();

    @Before public void initialize() {
        PatchSettings.initialize(context);
        PlayerBridgeTest.attachRouter(false);
        TrashBin.clear(context);
        new File(context.getCacheDir(), "spicetify_marketplace_listing.json").delete();
        MarketplaceSettings.running = null;
        // One theme and spicetify/cli's Trash Bin.
        Marketplace.Repo themes = new Marketplace.Repo("ownerA", "repoA", "main", "https://github.com/ownerA/repoA", 100);
        Marketplace.Repo cli = new Marketplace.Repo("spicetify", "cli", "main", "https://github.com/spicetify/cli", 20000);
        MarketplaceSettings.fetcher = url -> {
            requested.add(url);
            if (url.equals(Marketplace.SEARCH_URL + "1")) return search(themes);
            if (url.equals(Marketplace.EXTENSIONS_SEARCH_URL + "1")) return search(cli);
            if (url.equals(Marketplace.manifestUrl(themes))) {
                return "{\"name\":\"Aurora\",\"description\":\"d\",\"usercss\":\"u.css\",\"schemes\":\"color.ini\"}";
            }
            if (url.equals(Marketplace.manifestUrl(cli))) {
                return "{\"name\":\"Trash Bin\",\"description\":\"d\",\"main\":\"Extensions/trashbin.js\"}";
            }
            if (url.endsWith("/color.ini")) return "[dark]\nmain = 121212\n";
            throw new FileNotFoundException(url);
        };
        MarketplaceSettings.loads = DIRECT;
        MarketplaceSettings.requests = DIRECT;
        MarketplaceSettings.backgrounds = url -> {
            requested.add(url);
            throw new FileNotFoundException(url);
        };
        ExtensionsOnly.themeColors = false;
    }

    @After public void restore() {
        // Trash Bin's switch and list are process-wide, so no other test may find it on or full.
        Extensions.setOn(context, Extensions.TRASH_BIN, false);
        Extensions.setOn(context, Extensions.RANDOM_SONG, false);
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, false);
        Extensions.setOn(context, Extensions.HIDE_PODCASTS, false);
        HidePodcasts.setAudiobooksHidden(context, true);
        TrashBin.clear(context);
        MarketplaceSettings.fetcher = productionFetcher;
        MarketplaceSettings.loads = productionLoads;
        MarketplaceSettings.requests = productionRequests;
        MarketplaceSettings.backgrounds = productionBackgrounds;
    }

    @Test public void theRootListsTheExtensionsThatAreOn_andTheMarketplaceTurnsThemOn() {
        try (var controller = root()) {
            Dialog rootPage = ShadowDialog.getLatestDialog();
            View root = rootPage.getWindow().getDecorView();
            assertTrue(visibleTexts(root).contains("Extensions"));
            assertNull(row(root, "Trash Bin"));
            assertFalse(visibleTexts(root).contains("No configurable Spicetify patches are installed."));

            row(root, "Spicetify Marketplace").performClick();
            idle();
            Dialog marketplace = ShadowDialog.getLatestDialog();
            View screen = marketplace.getWindow().getDecorView();
            assertEquals("Search extensions", first(screen, EditText.class).getHint().toString());
            ListView list = first(screen, ListView.class);
            View trash = list.getAdapter().getView(1, null, list); // after Play a random song, which only Android has
            assertTrue(visibleTexts(trash).contains("Throw songs and artists in the trash from their menus, and Spotify skips them."));
            Switch toggle = first(trash, Switch.class);
            assertTrue(toggle.isEnabled());
            trash.performClick(); // the whole row turns it on, as on a settings page
            assertTrue(Extensions.isOn(context, Extensions.TRASH_BIN));

            marketplace.onBackPressed();
            idle();
            // Back on the root page, Trash Bin is listed with its latest status.
            View listed = row(root, "Trash Bin");
            assertNotNull(listed);
            assertEquals(Arrays.asList("Trash Bin", Extensions.latestStatus(Extensions.TRASH_BIN)), visibleTexts(listed));
        }
    }

    @Test public void themeCardsSayTheyNeedThemeColors_andDontOpen() {
        try (var controller = root()) {
            row(decor(), "Spicetify Marketplace").performClick();
            idle();
            View screen = decor();
            for (TextView text : texts(screen)) if ("Themes".contentEquals(text.getText()) && text.isClickable()) text.performClick();
            ListView list = first(screen, ListView.class);
            assertEquals("Aurora alone: no Galaxy V2 above it", 1, list.getAdapter().getCount());
            assertTrue(visibleTexts(list.getAdapter().getView(0, null, list)).contains("Needs the Theme colors patch"));
            assertFalse(list.getAdapter().isEnabled(0));
            requested.clear();
            list.performItemClick(list.getAdapter().getView(0, null, list), 0, 0);
            // A download would start on its own thread, so the page's status is what shows it at once.
            assertFalse(visibleTexts(screen).contains("Downloading Aurora…"));
            assertTrue("nothing downloads", requested.isEmpty());
        }
    }

    @Test @Config(sdk = 29) public void belowAndroid11TheRootsMarketplaceListsNoGalaxyV2_andDownloadsNothing() {
        ExtensionsOnly.themeColors = true; // installed, but Android 10 can't apply a theme
        try (var controller = root()) {
            row(decor(), "Spicetify Marketplace").performClick();
            idle();
            View screen = decor();
            for (TextView text : texts(screen)) if ("Themes".contentEquals(text.getText()) && text.isClickable()) text.performClick();
            ListView list = first(screen, ListView.class);
            assertEquals("Aurora alone: no Galaxy V2 above it", 1, list.getAdapter().getCount());
            assertTrue(visibleTexts(list.getAdapter().getView(0, null, list)).contains("Themes need Android 11 or later"));
            requested.clear();
            list.performItemClick(list.getAdapter().getView(0, null, list), 0, 0);
            assertFalse(visibleTexts(screen).contains("Downloading Aurora…"));
            assertTrue("no color.ini and no image", requested.isEmpty());
        }
    }

    @Test public void aDeeplyNestedPasteIsNotAList_andNothingCrashes() throws Exception {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        try (var controller = root()) {
            row(decor(), "Trash Bin").performClick();
            row(decor(), "Import").performClick();
            Dialog importing = ShadowDialog.getLatestDialog();
            EditText field = first(importing.getWindow().getDecorView(), EditText.class);
            // Deep enough to overflow the parser's stack on any thread.
            field.setText("{\"songs\":" + "[".repeat(500_000));
            button(importing.getWindow().getDecorView(), "Import").performClick();
            assertTrue(importing.isShowing());
            assertEquals("That isn't an exported trash list.", String.valueOf(field.getError()));
            assertEquals(0, TrashBin.songCount(context));
        }
    }

    @Test public void theSheetTurnsTheExtensionOff_andTheRootFollowsWhenItCloses() {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        try (var controller = root()) {
            View root = decor();
            row(root, "Trash Bin").performClick();
            Dialog sheet = ShadowDialog.getLatestDialog();
            View view = sheet.getWindow().getDecorView();
            assertTrue(visibleTexts(view).contains("Throw songs and artists in the trash from their menus, and Spotify skips them."));
            Switch toggle = first(view, Switch.class);
            assertTrue(toggle.isChecked());
            toggle.performClick();
            assertFalse(Extensions.isOn(context, Extensions.TRASH_BIN));

            button(view, "Close").performClick();
            idle();
            assertNull(row(root, "Trash Bin"));
        }
    }

    @Test public void trashBinsSheetExportsImportsAndClearsTheList() throws Exception {
        TrashBin.importJson(context, "{\"songs\":{\"spotify:track:a\":true}}");
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        try (var controller = root()) {
            row(decor(), "Trash Bin").performClick();
            View sheet = decor();
            assertNotNull(row(sheet, "Export"));
            assertNull("only Play a random song's sheet plays songs", row(sheet, "A song from Spotify"));
            assertTrue(visibleTexts(sheet).contains("Copy the 1 song and 0 artists in the trash, in the desktop extension's format"));

            row(sheet, "Export").performClick();
            ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            JSONObject exported = new JSONObject(clipboard.getPrimaryClip().getItemAt(0).getText().toString());
            assertTrue(exported.getJSONObject("songs").getBoolean("spotify:track:a"));
            assertEquals(0, exported.getJSONObject("artists").length());
            assertTrue(visibleTexts(sheet).contains("Copied the 1 song and 0 artists to the clipboard"));

            // A list that isn't one says so on the field, and the sheet stays.
            row(sheet, "Import").performClick();
            Dialog importing = ShadowDialog.getLatestDialog();
            EditText field = first(importing.getWindow().getDecorView(), EditText.class);
            field.setText("not a list");
            button(importing.getWindow().getDecorView(), "Import").performClick();
            assertTrue(importing.isShowing());
            assertEquals("That isn't an exported trash list.", String.valueOf(field.getError()));
            field.setText(TRASH_LIST);
            button(importing.getWindow().getDecorView(), "Import").performClick();
            assertFalse(importing.isShowing());
            assertEquals(1, TrashBin.artistCount(context));
            assertTrue(visibleTexts(sheet).contains("Take the 1 song and 1 artist out of the trash"));

            row(sheet, "Clear").performClick();
            Dialog confirm = ShadowDialog.getLatestDialog();
            assertTrue(visibleTexts(confirm.getWindow().getDecorView()).contains("The 1 song and 1 artist will play again."));
            button(confirm.getWindow().getDecorView(), "Clear").performClick();
            assertEquals(0, TrashBin.songCount(context));
            assertEquals(0, TrashBin.artistCount(context));
            assertTrue(visibleTexts(sheet).contains("Take the 0 songs and 0 artists out of the trash"));
        }
    }

    @Test public void theExtensionsTabListsPlayARandomSongFirst_andItsSwitchTurnsItOn() {
        try (var controller = root()) {
            row(decor(), "Spicetify Marketplace").performClick();
            idle();
            ListView list = first(decor(), ListView.class);
            View random = list.getAdapter().getView(0, null, list);
            assertEquals(Arrays.asList("Play a random song", "Tap Random on Home, next to All, to play one random song from all of Spotify or from your library."),
                    visibleTexts(random).subList(0, 2));
            assertTrue(first(random, Switch.class).isEnabled());
            random.performClick();
            assertTrue(Extensions.isOn(context, Extensions.RANDOM_SONG));
            assertTrue("GitHub's extensions follow", visibleTexts(list.getAdapter().getView(1, null, list)).contains("Trash Bin"));
        }
    }

    @Test public void playARandomSongIsListedWithoutGitHub() {
        MarketplaceSettings.fetcher = url -> {
            throw new FileNotFoundException(url);
        };
        try (var controller = root()) {
            row(decor(), "Spicetify Marketplace").performClick();
            idle();
            ListView list = first(decor(), ListView.class);
            assertEquals(1, list.getAdapter().getCount());
            assertTrue(visibleTexts(list.getAdapter().getView(0, null, list)).contains("Play a random song"));
        }
    }

    @Test public void randomsSheetPlaysASongFromSpotifyOrFromYourLibrary() throws Exception {
        Extensions.setOn(context, Extensions.RANDOM_SONG, true);
        List<String> sent = PlayerBridgeTest.attachRecordingRouter();
        try (var controller = root()) {
            row(decor(), "Play a random song").performClick();
            View sheet = decor();
            assertTrue(visibleTexts(sheet).contains("Tap Random on Home, next to All, to play one random song from all of Spotify or from your library."));
            assertTrue(first(sheet, Switch.class).isChecked());

            row(sheet, "A song from Spotify").performClick();
            PlayerBridgeTest.awaitBridge();
            assertEquals("its run asks the core for the Web API's token", Arrays.asList("sp://auth/v2/token?renew=0"), sent);
            row(sheet, "A song from your library").performClick();
            PlayerBridgeTest.awaitBridge();
            assertEquals("its run lists the library", Arrays.asList("sp://auth/v2/token?renew=0",
                    "sp://esperanto/spotify.your_library_esperanto.proto.YourLibraryService/All"), sent);
            assertTrue("the sheet stays for another song", sheet.isShown());
        } finally {
            PlayerBridgeTest.attachRouter(false);
        }
    }

    @Test public void theExtensionsTabListsShufflePlusWithItsSwitch_whenSpicetifysCliListsIt() {
        Marketplace.Repo cli = new Marketplace.Repo("spicetify", "cli", "main", "https://github.com/spicetify/cli", 20000);
        Marketplace.Fetcher others = MarketplaceSettings.fetcher;
        MarketplaceSettings.fetcher = url -> url.equals(Marketplace.manifestUrl(cli))
                ? "[{\"name\":\"Shuffle+\",\"description\":\"d\",\"main\":\"Extensions/shuffle+.js\"},"
                        + "{\"name\":\"Trash Bin\",\"description\":\"d\",\"main\":\"Extensions/trashbin.js\"}]"
                : others.get(url);
        try (var controller = root()) {
            row(decor(), "Spicetify Marketplace").performClick();
            idle();
            ListView list = first(decor(), ListView.class);
            View shuffle = list.getAdapter().getView(1, null, list); // after Play a random song, which only Android has
            assertEquals(Arrays.asList("Shuffle+", Extensions.description(Extensions.SHUFFLE_PLUS)),
                    visibleTexts(shuffle).subList(0, 2));
            assertTrue(first(shuffle, Switch.class).isEnabled());
            shuffle.performClick();
            assertTrue(Extensions.isOn(context, Extensions.SHUFFLE_PLUS));
            assertTrue("then Trash Bin, in the manifest's order",
                    visibleTexts(list.getAdapter().getView(2, null, list)).contains("Trash Bin"));
        }
    }

    @Test public void shufflePlussRowShowsOnlyWhileItsSwitchIsOn() {
        try (var controller = root()) {
            // The root lists only the extensions that are on, so the sheet of one that's off opens directly.
            ExtensionSettings.open(screen(), Extensions.SHUFFLE_PLUS);
            View sheet = decor();
            View shuffle = row(sheet, "Shuffle+ what's playing");
            assertNotNull(shuffle);
            assertFalse("hidden while Shuffle+ is off", shuffle.isShown());

            Switch toggle = first(sheet, Switch.class);
            toggle.performClick();
            assertTrue(Extensions.isOn(context, Extensions.SHUFFLE_PLUS));
            assertTrue("shown once it's on", shuffle.isShown());
            toggle.performClick();
            assertFalse(Extensions.isOn(context, Extensions.SHUFFLE_PLUS));
            assertFalse("hidden again once it's off", shuffle.isShown());
        }
    }

    @Test public void shufflePlussSheetShufflesWhatsPlaying() throws Exception {
        List<String> sent = PlayerBridgeTest.attachRecordingRouter();
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true); // opens the player state stream, which says nothing here
        try (var controller = root()) {
            row(decor(), "Shuffle+").performClick();
            View sheet = decor();
            assertTrue(visibleTexts(sheet).contains(Extensions.description(Extensions.SHUFFLE_PLUS)));
            assertTrue(first(sheet, Switch.class).isChecked());
            assertNull("only Play a random song's sheet plays a random song", row(sheet, "A song from Spotify"));

            row(sheet, "Shuffle+ what's playing").performClick();
            PlayerBridgeTest.awaitBridge(); // the run, which posts its Toast to the main thread
            idle();
            assertEquals("its run reads what's playing from the stream, which has said nothing yet",
                    "Couldn't shuffle: Spotify hasn't said what's playing yet; try again in a moment",
                    ShadowToast.getTextOfLatestToast());
            assertEquals("only the stream", Collections.singletonList(
                    "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/GetState"), sent);
            assertTrue("the sheet stays for another run", sheet.isShown());
        } finally {
            PlayerBridgeTest.attachRouter(false);
        }
    }

    @Test public void hidePodcastsSheetHasAnAudiobookSwitch_onUntilTurnedOff() {
        Extensions.setOn(context, Extensions.HIDE_PODCASTS, true);
        try (var controller = root()) {
            View root = decor();
            row(root, "Hide podcasts").performClick();
            View sheet = decor();
            assertTrue(visibleTexts(sheet).contains(Extensions.description(Extensions.HIDE_PODCASTS)));
            assertTrue(visibleTexts(sheet).contains(
                    "Hide audiobooks on Home and in Search, and the Books and Authors filters in Your Library."));
            Switch audiobooks = first(row(sheet, "Also hide audiobooks"), Switch.class);
            assertTrue(audiobooks.isChecked());
            assertTrue(HidePodcasts.audiobooksHidden(context));

            audiobooks.performClick();
            assertFalse(HidePodcasts.audiobooksHidden(context));
            button(sheet, "Close").performClick();
            idle();

            // Hide podcasts is still on, and its sheet shows the switch as it was left.
            row(root, "Hide podcasts").performClick();
            assertFalse(first(row(decor(), "Also hide audiobooks"), Switch.class).isChecked());
            assertTrue(Extensions.isOn(context, Extensions.HIDE_PODCASTS));
        }
    }

    @Test public void onlyHidePodcastsSheetHasTheAudiobookSwitch() {
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        try (var controller = root()) {
            row(decor(), "Trash Bin").performClick();
            assertNotNull(row(decor(), "Export"));
            assertNull(row(decor(), "Also hide audiobooks"));
        }
    }

    @Test public void theRootShowsWhileTheBridgeWaitsForSpotify() {
        PlayerBridgeTest.attachRouter(true);
        try (var controller = root()) {
            assertTrue(visibleTexts(decor()).contains("Player bridge: waiting for Spotify"));
        } finally {
            PlayerBridgeTest.attachRouter(false);
        }
    }

    private ActivityController<Activity> root() {
        var controller = Robolectric.buildActivity(Activity.class).setup();
        SpicetifySettingsScreen.open(controller.get());
        idle();
        return controller;
    }

    private static String search(Marketplace.Repo repo) {
        return "{\"total_count\":1,\"items\":[{\"full_name\":\"" + repo.owner + "/" + repo.name + "\",\"default_branch\":\"main\","
                + "\"html_url\":\"" + repo.url + "\",\"stargazers_count\":" + repo.stars + "}]}";
    }

    /** The settings page the latest dialog belongs to. */
    private static SpicetifySettingsScreen screen() {
        Context context = ShadowDialog.getLatestDialog().getContext();
        while (!(context instanceof SpicetifySettingsScreen)) context = ((ContextWrapper) context).getBaseContext();
        return (SpicetifySettingsScreen) context;
    }

    private static View decor() {
        return ShadowDialog.getLatestDialog().getWindow().getDecorView();
    }

    private static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    /** A clickable row whose content description starts with {@code title}. */
    private static View row(View view, String title) {
        CharSequence description = view.getContentDescription();
        if (view.isClickable() && description != null && description.toString().startsWith(title)) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = row(group.getChildAt(i), title);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static Button button(View view, String label) {
        for (TextView text : texts(view)) if (text instanceof Button && label.contentEquals(text.getText())) return (Button) text;
        throw new AssertionError("Missing button: " + label);
    }

    private static <T extends View> T first(View view, Class<T> kind) {
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

    private static List<TextView> texts(View view) {
        List<TextView> found = new ArrayList<>();
        if (view instanceof TextView) found.add((TextView) view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) found.addAll(texts(group.getChildAt(i)));
        }
        return found;
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
}
