package app.spicetify.extension.spotify.extensions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import app.spicetify.extension.spotify.settings.PatchSettings;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class ExtensionsTest {
    private final Context context = RuntimeEnvironment.getApplication();

    // The switch registry is process-wide, so each test uses ids no other test or extension uses.

    @Test
    public void eachSwitchStartsOffAndIsSavedUnderItsId() {
        assertFalse(Extensions.isOn(context, "test_saved"));

        Extensions.setOn(context, "test_saved", true);
        assertTrue(Extensions.isOn(context, "test_saved"));
        assertFalse(Extensions.isOn(context, "test_other"));
        assertTrue(context.getSharedPreferences("spicetify_extensions", Context.MODE_PRIVATE)
                .getBoolean("test_saved", false));

        Extensions.setOn(context, "test_saved", false);
        assertFalse(Extensions.isOn(context, "test_saved"));
    }

    @Test
    public void setOnTellsTheSwitchListenerAfterSaving() {
        List<String> seen = new ArrayList<>();
        Extensions.onSwitch("test_switch", (switchContext, on) ->
                seen.add(on + ", saved " + Extensions.isOn(switchContext, "test_switch")));

        Extensions.setOn(context, "test_switch", true);
        Extensions.setOn(context, "test_switch", false);

        assertEquals(Arrays.asList("true, saved true", "false, saved false"), seen);
    }

    @Test
    public void aFailingSwitchListenerStillSavesTheSwitch() {
        Extensions.onSwitch("test_failing", (switchContext, on) -> {
            throw new IllegalStateException("listener failed");
        });

        Extensions.setOn(context, "test_failing", true);

        assertTrue(Extensions.isOn(context, "test_failing"));
    }

    @Test
    public void startEnabledStartsOnlyTheExtensionsThatAreOn() {
        List<String> started = new ArrayList<>();
        Extensions.onSwitch("test_on", (switchContext, on) -> started.add("test_on " + on));
        Extensions.onSwitch("test_off", (switchContext, on) -> started.add("test_off " + on));
        context.getSharedPreferences("spicetify_extensions", Context.MODE_PRIVATE).edit()
                .putBoolean("test_on", true).commit();

        Extensions.startEnabled(context);

        assertEquals(Collections.singletonList("test_on true"), started);
    }

    @Test
    public void trashBinPortsTheDesktopExtensionMatchedInAnyCase() {
        assertEquals(Extensions.TRASH_BIN, Extensions.port("spicetify/cli/Extensions/trashbin.js"));
        assertEquals(Extensions.TRASH_BIN, Extensions.port("Spicetify/CLI/extensions/TRASHBIN.js"));
        assertNull(Extensions.port("someone/cli/Extensions/trashbin.js"));
        assertNull(Extensions.port("spicetify/cli/Extensions/bookmark.js"));
        // The Marketplace reads the manifest of a repository that holds a port, in any case.
        assertTrue(Extensions.hostsPort("Spicetify/CLI"));
        assertFalse(Extensions.hostsPort("spicetify/cl"));
        assertFalse(Extensions.hostsPort("someone/cli"));
        assertEquals("Trash Bin", Extensions.title(Extensions.TRASH_BIN));
        assertEquals("Throw songs and artists in the trash from their menus, and Spotify skips them.",
                Extensions.description(Extensions.TRASH_BIN));
    }

    @Test
    public void shufflePlusPortsTheDesktopExtensionInSpicetifysCli() {
        assertEquals(Extensions.SHUFFLE_PLUS, Extensions.port("spicetify/cli/Extensions/shuffle+.js"));
        assertFalse("a desktop Marketplace lists it", Extensions.androidOnly().contains(Extensions.SHUFFLE_PLUS));
        assertEquals("Shuffle+", Extensions.title(Extensions.SHUFFLE_PLUS));
        assertEquals("Long-press the shuffle button in Now Playing, or choose Shuffle+ this playlist in a playlist's"
                + " menu, to play a playlist, album or Liked Songs in a truly random order.",
                Extensions.description(Extensions.SHUFFLE_PLUS));
    }

    @Test
    public void playARandomSongIsAndroidOnly_soNoDesktopExtensionPortsIt() {
        assertEquals(Collections.singletonList(Extensions.RANDOM_SONG), Extensions.androidOnly());
        assertNull(Extensions.port("spicetify/cli/Extensions/random.js"));
        assertEquals("Play a random song", Extensions.title(Extensions.RANDOM_SONG));
        assertEquals("Tap Random on Home, next to All, to play one random song from all of Spotify or from your library.",
                Extensions.description(Extensions.RANDOM_SONG));
    }

    @Test
    public void hidePodcastsPortsTheDesktopExtensionMatchedInAnyCase() {
        assertEquals(Extensions.HIDE_PODCASTS, Extensions.port("theRealPadster/spicetify-hide-podcasts/hidePodcasts.js"));
        assertEquals(Extensions.HIDE_PODCASTS, Extensions.port("therealpadster/Spicetify-Hide-Podcasts/HIDEPODCASTS.JS"));
        assertNull(Extensions.port("someone/spicetify-hide-podcasts/hidePodcasts.js"));
        assertTrue(Extensions.hostsPort("theRealPadster/spicetify-hide-podcasts"));
        assertEquals("Hide podcasts", Extensions.title(Extensions.HIDE_PODCASTS));
        assertEquals("Hide podcasts and episodes on Home and in Search, and their filters there and in Your Library.",
                Extensions.description(Extensions.HIDE_PODCASTS));
    }

    @Test
    public void enabledListsTheExtensionsThatAreOnInSettingsOrder() {
        Extensions.setOn(context, Extensions.HIDE_PODCASTS, true);
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        assertEquals(Arrays.asList(Extensions.TRASH_BIN, Extensions.HIDE_PODCASTS), Extensions.enabled(context));
        Extensions.setOn(context, Extensions.TRASH_BIN, false);
        Extensions.setOn(context, Extensions.HIDE_PODCASTS, false);
    }

    @Test
    public void enabledListsTheExtensionsThatAreOn() {
        Extensions.setOn(context, Extensions.TRASH_BIN, false);
        assertEquals(Collections.emptyList(), Extensions.enabled(context));
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        assertEquals(Collections.singletonList(Extensions.TRASH_BIN), Extensions.enabled(context));
        Extensions.setOn(context, Extensions.TRASH_BIN, false);
    }

    @Test
    public void latestStatusSaysOnUntilAnExtensionReportsALine() {
        assertEquals("On", Extensions.latestStatus("test_quiet"));
        Extensions.status("test_reporting", "Skipped spotify:track:a");
        assertEquals("Skipped spotify:track:a", Extensions.latestStatus("test_reporting"));
    }

    @Test
    public void spotifysStartupTracksNoActivityWithoutTheExtensionsPatch() {
        // A tracker an earlier test started belongs to that test's application, so it can't see this Activity.
        PatchSettings.initialize(context);
        Activity home = Robolectric.buildActivity(Activity.class).setup().get();

        assertNotSame(home, ActivityTracker.resumed());
    }

    @Test
    public void appContextFallsBackToTheContextPatchSettingsGot() {
        Extensions.setAppContext(null);

        PatchSettings.initialize(context);

        assertSame(context, Extensions.appContext());
    }
}
