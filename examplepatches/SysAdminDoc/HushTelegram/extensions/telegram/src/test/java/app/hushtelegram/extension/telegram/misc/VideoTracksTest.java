/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Looper;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowToast;

/** Audio track and Subtitles in the video viewer's menu (#79): when they show and what a pick does. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = VideoTracksTest.Player.class, instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class VideoTracksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int HANDLED = 4;
    private static final int UNSUPPORTED_SUBTYPE = 3;

    /** A track's format: the label and language the player read from the file. Equal by value, like media3's. */
    static final class Format {
        final String label;
        final String language;
        Format(String label, String language) { this.label = label; this.language = language; }

        @java.lang.Override public boolean equals(Object other) {
            return other instanceof Format && Objects.equals(label, ((Format) other).label)
                    && Objects.equals(language, ((Format) other).language);
        }

        @java.lang.Override public int hashCode() { return Objects.hash(label, language); }
    }

    /** A track group: its id, one type, its tracks. Equal by id and formats, like media3's TrackGroup. */
    static final class Group {
        final String id;
        final int type;
        final Format[] formats;
        Group(String id, int type, Format... formats) { this.id = id; this.type = type; this.formats = formats; }

        @java.lang.Override public boolean equals(Object other) {
            return other instanceof Group && id.equals(((Group) other).id)
                    && Arrays.equals(formats, ((Group) other).formats);
        }

        @java.lang.Override public int hashCode() { return 31 * id.hashCode() + Arrays.hashCode(formats); }
    }

    /** What the selector mapped: each renderer's groups and how well it plays each track. */
    static final class Mapped {
        final List<Group[]> renderers = new ArrayList<>();
        final List<int[][]> support = new ArrayList<>();

        Mapped renderer(int[][] support, Group... groups) {
            renderers.add(groups);
            this.support.add(support);
            return this;
        }
    }

    /** The selector's parameters, and the builder made from them. */
    static final class Params {
        final Map<Object, Object> overrides = new HashMap<>();
        final Set<Object> disabled = new HashSet<>();

        Params copy() {
            Params copy = new Params();
            copy.overrides.putAll(overrides);
            copy.disabled.addAll(disabled);
            return copy;
        }
    }

    static final class Override {
        final Object group;
        final int track;
        Override(Object group, int track) { this.group = group; this.track = track; }
    }

    /** Telegram's video player. */
    static final class VideoPlayer {
        Mapped mapped;
        boolean selector = true;
        Params params = new Params();
        int applied;
        TextureView texture;
    }

    /** Telegram's video viewer. */
    static final class Viewer {
        VideoPlayer player;
        LinearLayout menu;
    }

    /** A subtitle line as the player hands it over. */
    static final class Cue {
        final float line = 0.9f;
        final CharSequence text;
        Cue(CharSequence text) { this.text = text; }
    }

    @Implements(value = VideoTracks.class, isInAndroidSdk = false)
    public static class Player {
        @Implementation protected static Object player(Object viewer) { return ((Viewer) viewer).player; }
        @Implementation protected static Object videoMenu(Object viewer) { return ((Viewer) viewer).menu; }
        @Implementation protected static Object addRow(Object menu, int id, int icon, CharSequence title) {
            LinearLayout layout = (LinearLayout) menu;
            TextView row = new TextView(layout.getContext());
            row.setId(id);
            row.setText(title);
            layout.addView(row);
            return row;
        }
        @Implementation protected static Object mapped(Object player) {
            VideoPlayer video = (VideoPlayer) player;
            return video.selector ? video.mapped : null;
        }
        @Implementation protected static int renderers(Object mapped) { return ((Mapped) mapped).renderers.size(); }
        @Implementation protected static Object groups(Object mapped, int renderer) { return ((Mapped) mapped).renderers.get(renderer); }
        @Implementation protected static int support(Object mapped, int renderer, int group, int track) {
            return ((Mapped) mapped).support.get(renderer)[group][track];
        }
        @Implementation protected static int groupCount(Object groups) { return ((Group[]) groups).length; }
        @Implementation protected static Object group(Object groups, int index) { return ((Group[]) groups)[index]; }
        @Implementation protected static int trackType(Object group) { return ((Group) group).type; }
        @Implementation protected static int trackCount(Object group) { return ((Group) group).formats.length; }
        @Implementation protected static Object format(Object group, int track) { return ((Group) group).formats[track]; }
        @Implementation protected static String language(Object format) { return ((Format) format).language; }
        @Implementation protected static String label(Object format) { return ((Format) format).label; }
        @Implementation protected static Object builder(Object player) {
            VideoPlayer video = (VideoPlayer) player;
            return video.selector ? video.params.copy() : null;
        }
        @Implementation protected static Map<Object, Object> overrides(Object builder) { return ((Params) builder).overrides; }
        @Implementation protected static Set<Object> disabled(Object builder) { return ((Params) builder).disabled; }
        @Implementation protected static Object override(Object group, int track) { return new Override(group, track); }
        @Implementation protected static void apply(Object player, Object builder) {
            VideoPlayer video = (VideoPlayer) player;
            video.params = ((Params) builder).copy();
            video.applied++;
        }
    }

    private ActivityController<Activity> controller;
    private Activity activity;
    private FrameLayout screen;
    private FrameLayout videoFrame;
    private Group video;
    private Group english;
    private Group spanish;
    private Group subtitles;

    @Before public void setUp() {
        restore();
        Settings.VIDEO_TRACKS.save(true);
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        screen = new FrameLayout(activity);
        activity.setContentView(screen);
        videoFrame = new FrameLayout(activity);
        screen.addView(videoFrame);
        video = video();
        english = english();
        spanish = spanish();
        subtitles = subtitles();
    }

    // Each call makes new groups, equal to the last ones, the way the player maps them again on every loop.
    private static Group video() { return new Group("0", 2, new Format(null, null)); }
    private static Group english() { return new Group("1", VideoTracks.AUDIO, new Format(null, "en")); }
    private static Group spanish() { return new Group("2", VideoTracks.AUDIO, new Format(null, "es")); }
    private static Group subtitles() {
        return new Group("3", VideoTracks.TEXT, new Format("Director's notes", "en"), new Format(null, "und"));
    }

    @After public void restore() {
        if (controller != null) controller.close();
        controller = null;
        PauseForTests.resume();
        Settings.VIDEO_TRACKS.resetToDefault();
        VideoTracks.reset();
        HookStatus.clear();
        ShadowAlertDialog.reset();
        ShadowToast.reset();
    }

    private static String report() { return String.join("\n", HookStatus.report()); }

    private VideoPlayer player(Mapped mapped) {
        VideoPlayer player = new VideoPlayer();
        player.mapped = mapped;
        player.texture = new TextureView(activity);
        videoFrame.addView(player.texture);
        return player;
    }

    /** A video with English and Spanish audio and two subtitle tracks, one the player can't read. */
    private Mapped twoAudioTracksAndSubtitles() {
        return new Mapped()
                .renderer(new int[][] {{HANDLED}}, video)
                .renderer(new int[][] {{HANDLED}, {HANDLED}}, english, spanish)
                .renderer(new int[][] {{HANDLED, HANDLED}}, subtitles);
    }

    /** The viewer as Telegram builds it: the menu made once, before any video plays. */
    private Viewer viewer(VideoPlayer player) {
        Viewer viewer = new Viewer();
        viewer.player = player;
        viewer.menu = new LinearLayout(activity);
        VideoTracks.menu(viewer);
        return viewer;
    }

    private void open(Viewer viewer) {
        if (viewer.menu.getParent() != null) screen.removeView(viewer.menu);
        screen.addView(viewer.menu);
    }

    private static View row(Viewer viewer, int id) {
        return viewer.menu.findViewById(id);
    }

    private static void idle() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private AlertDialog choose(int id) {
        VideoTracks.menuChoice(id);
        idle();
        AlertDialog list = (AlertDialog) ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull("a list to pick from", list);
        assertTrue(list.isShowing());
        return list;
    }

    private TextView cueLine() {
        View line = videoFrame.findViewWithTag(VideoTracks.CUE_TAG);
        return line instanceof TextView ? (TextView) line : null;
    }

    // ---- The rows ------------------------------------------------------------------------------

    @Test public void theSwitchStartsOffAndTheRowsStayHidden() {
        Settings.VIDEO_TRACKS.resetToDefault();
        assertFalse(Settings.VIDEO_TRACKS.get());
        Viewer viewer = viewer(player(twoAudioTracksAndSubtitles()));
        open(viewer);
        assertEquals(View.GONE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());
        assertEquals(View.GONE, row(viewer, VideoTracks.SUBTITLES_ID).getVisibility());
        assertTrue(report().contains(FamilyNames.KEEP_VIDEOS_MUTED));
    }

    @Test public void bothRowsAreAddedHiddenUntilTheMenuOpens() {
        Viewer viewer = viewer(player(twoAudioTracksAndSubtitles()));
        assertEquals(2, viewer.menu.getChildCount());
        assertEquals("Audio track", ((TextView) row(viewer, VideoTracks.AUDIO_ID)).getText().toString());
        assertEquals("Subtitles", ((TextView) row(viewer, VideoTracks.SUBTITLES_ID)).getText().toString());
        assertEquals(View.GONE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());
        open(viewer);
        assertEquals(View.VISIBLE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());
        assertEquals(View.VISIBLE, row(viewer, VideoTracks.SUBTITLES_ID).getVisibility());
        assertEquals("a row shown late isn't left faded out", 1f, row(viewer, VideoTracks.AUDIO_ID).getAlpha(), 0f);
    }

    @Test public void eachRowShowsOnlyWhenTheVideoHasSomethingToPick() {
        VideoPlayer player = player(new Mapped()
                .renderer(new int[][] {{HANDLED}}, video)
                .renderer(new int[][] {{HANDLED}, {UNSUPPORTED_SUBTYPE}}, english, spanish)
                .renderer(new int[][] {{UNSUPPORTED_SUBTYPE, UNSUPPORTED_SUBTYPE}}, subtitles));
        Viewer viewer = viewer(player);
        open(viewer);
        assertEquals("one track it can play is no choice", View.GONE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());
        assertEquals(View.GONE, row(viewer, VideoTracks.SUBTITLES_ID).getVisibility());

        viewer.player = player(twoAudioTracksAndSubtitles());
        open(viewer);
        assertEquals("the next video gets its own rows", View.VISIBLE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());

        viewer.player = null;
        open(viewer);
        assertEquals("a photo has nothing to pick", View.GONE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());
        assertEquals(View.GONE, row(viewer, VideoTracks.SUBTITLES_ID).getVisibility());

        viewer.player = player(twoAudioTracksAndSubtitles());
        viewer.player.selector = false;
        open(viewer);
        assertEquals("a player with no track selector", View.GONE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());
    }

    @Test public void turningTheSwitchOffHidesTheRowsNextTimeTheMenuOpens() {
        Viewer viewer = viewer(player(twoAudioTracksAndSubtitles()));
        open(viewer);
        assertEquals(View.VISIBLE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());
        Settings.VIDEO_TRACKS.save(false);
        open(viewer);
        assertEquals(View.GONE, row(viewer, VideoTracks.AUDIO_ID).getVisibility());
        assertEquals(View.GONE, row(viewer, VideoTracks.SUBTITLES_ID).getVisibility());
    }

    @Test public void telegramsOwnRowsPassThrough() {
        Viewer viewer = viewer(player(twoAudioTracksAndSubtitles()));
        open(viewer);
        HookStatus.clear();
        for (int id : new int[] {-1, 0, 22, 1, 0x7f0804ae}) VideoTracks.menuChoice(id);
        idle();
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
        assertNull(ShadowToast.getTextOfLatestToast());
        assertFalse(report().contains(FamilyNames.KEEP_VIDEOS_MUTED));
    }

    // ---- Audio ---------------------------------------------------------------------------------

    @Test public void audioTrackListsTheTracksAndHandsThePickToTheSelector() {
        VideoPlayer player = player(twoAudioTracksAndSubtitles());
        Viewer viewer = viewer(player);
        open(viewer);
        AlertDialog list = choose(VideoTracks.AUDIO_ID);
        assertEquals("Audio track", Shadows.shadowOf(list).getTitle().toString());
        assertEquals(Arrays.asList("Automatic", "English", "Spanish"), texts(Shadows.shadowOf(list).getItems()));
        assertEquals(0, list.getListView().getCheckedItemPosition());

        Shadows.shadowOf(list).clickOnItem(2);
        idle();
        assertEquals(1, player.applied);
        Override picked = (Override) player.params.overrides.get(spanish);
        assertNotNull("Spanish picked", picked);
        assertSame(spanish, picked.group);
        assertEquals(0, picked.track);
        assertEquals(1, player.params.overrides.size());
        assertTrue("audio leaves subtitles alone", player.params.disabled.isEmpty());
        assertTrue(report(), report().contains(VideoTracks.CHOSEN + " 1"));

        AlertDialog again = choose(VideoTracks.AUDIO_ID);
        assertEquals("the list remembers the pick", 2, again.getListView().getCheckedItemPosition());
        Shadows.shadowOf(again).clickOnItem(1);
        idle();
        assertEquals("one pick per type", Collections.singleton(english), player.params.overrides.keySet());

        Shadows.shadowOf(choose(VideoTracks.AUDIO_ID)).clickOnItem(0);
        idle();
        assertTrue("Automatic gives the choice back to the player", player.params.overrides.isEmpty());
        assertEquals(3, player.applied);
    }

    @Test public void aPickStaysCheckedWhenTheVideoLoops() {
        VideoPlayer player = player(twoAudioTracksAndSubtitles());
        Viewer viewer = viewer(player);
        open(viewer);
        Shadows.shadowOf(choose(VideoTracks.AUDIO_ID)).clickOnItem(2);
        idle();
        Shadows.shadowOf(choose(VideoTracks.SUBTITLES_ID)).clickOnItem(2);
        idle();

        // Telegram loops with the player's repeat mode, and each pass maps new groups equal to the old ones.
        Group englishAgain = english();
        Group subtitlesAgain = subtitles();
        player.mapped = new Mapped()
                .renderer(new int[][] {{HANDLED}}, video())
                .renderer(new int[][] {{HANDLED}, {HANDLED}}, englishAgain, spanish())
                .renderer(new int[][] {{HANDLED, HANDLED}}, subtitlesAgain);
        assertNotSame(subtitles, subtitlesAgain);
        open(viewer);
        AlertDialog audio = choose(VideoTracks.AUDIO_ID);
        assertEquals("Spanish is still ticked", 2, audio.getListView().getCheckedItemPosition());
        audio.dismiss();
        AlertDialog text = choose(VideoTracks.SUBTITLES_ID);
        assertEquals("so is the second subtitle track", 2, text.getListView().getCheckedItemPosition());
        text.dismiss();

        Shadows.shadowOf(choose(VideoTracks.AUDIO_ID)).clickOnItem(1);
        idle();
        assertEquals("one pick per type after a loop too", 2, player.params.overrides.size());
        assertSame(englishAgain, ((Override) player.params.overrides.get(english)).group);
        assertEquals(1, ((Override) player.params.overrides.get(subtitlesAgain)).track);
        assertEquals(1, choose(VideoTracks.AUDIO_ID).getListView().getCheckedItemPosition());
    }

    @Test public void aPickKeepsWhatTelegramAlreadySet() {
        VideoPlayer player = player(twoAudioTracksAndSubtitles());
        Object quality = new Override(video, 0);
        player.params.overrides.put(video, quality);
        Viewer viewer = viewer(player);
        open(viewer);
        Shadows.shadowOf(choose(VideoTracks.AUDIO_ID)).clickOnItem(1);
        idle();
        assertSame("Telegram's quality choice stays", quality, player.params.overrides.get(video));
        assertNotNull(player.params.overrides.get(english));
    }

    @Test public void aPickTheSelectorCantTakeSaysSo() {
        VideoPlayer player = player(twoAudioTracksAndSubtitles());
        Viewer viewer = viewer(player);
        open(viewer);
        AlertDialog list = choose(VideoTracks.AUDIO_ID);
        player.selector = false;
        Shadows.shadowOf(list).clickOnItem(1);
        idle();
        assertEquals(0, player.applied);
        assertEquals("Couldn't open that. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void noVideoPlayingSaysSo() {
        Viewer viewer = viewer(player(twoAudioTracksAndSubtitles()));
        open(viewer);
        viewer.player = null;
        VideoTracks.menuChoice(VideoTracks.AUDIO_ID);
        idle();
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
        assertEquals("Couldn't open that. Try again.", ShadowToast.getTextOfLatestToast());
    }

    @Test public void aMenuThatNeverOpenedSaysSo() {
        viewer(player(twoAudioTracksAndSubtitles()));
        VideoTracks.menuChoice(VideoTracks.SUBTITLES_ID);
        idle();
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
        assertEquals("Couldn't open that. Try again.", ShadowToast.getTextOfLatestToast());
    }

    // ---- Subtitles -----------------------------------------------------------------------------

    @Test public void subtitlesTurnOnTheTextTrackAndShowItsLinesOverTheVideo() {
        VideoPlayer player = player(twoAudioTracksAndSubtitles());
        player.params.disabled.add(VideoTracks.TEXT);
        Viewer viewer = viewer(player);
        open(viewer);
        VideoTracks.cues(player, Collections.singletonList(new Cue("Before any pick")));
        idle();
        assertNull("nothing shows until subtitles are picked", cueLine());

        AlertDialog list = choose(VideoTracks.SUBTITLES_ID);
        assertEquals("Subtitles", Shadows.shadowOf(list).getTitle().toString());
        assertEquals(Arrays.asList("Off", "Director's notes", "Track 2"), texts(Shadows.shadowOf(list).getItems()));
        assertEquals(0, list.getListView().getCheckedItemPosition());
        Shadows.shadowOf(list).clickOnItem(2);
        idle();
        Override picked = (Override) player.params.overrides.get(subtitles);
        assertEquals(1, picked.track);
        assertFalse("the text type isn't turned off", player.params.disabled.contains(VideoTracks.TEXT));

        VideoTracks.cues(player, Arrays.asList(new Cue("Hello"), new Cue(""), new Cue("there")));
        idle();
        TextView line = cueLine();
        assertNotNull("the line sits over the video", line);
        assertEquals(View.VISIBLE, line.getVisibility());
        assertEquals("Hello\nthere", line.getText().toString());

        VideoTracks.cues(player, Collections.emptyList());
        idle();
        assertEquals(View.GONE, line.getVisibility());

        VideoTracks.cues(player, Collections.singletonList(new Cue("Again")));
        idle();
        assertSame("one line, reused", line, cueLine());
        assertEquals(View.VISIBLE, line.getVisibility());

        Shadows.shadowOf(choose(VideoTracks.SUBTITLES_ID)).clickOnItem(0);
        idle();
        assertTrue("Off turns the text type off", player.params.disabled.contains(VideoTracks.TEXT));
        assertNull(player.params.overrides.get(subtitles));
        assertEquals(View.GONE, line.getVisibility());
        VideoTracks.cues(player, Collections.singletonList(new Cue("After Off")));
        idle();
        assertEquals(View.GONE, line.getVisibility());
    }

    @Test public void theLineGoesWhenItsVideoDoes() {
        VideoPlayer player = player(twoAudioTracksAndSubtitles());
        Viewer viewer = viewer(player);
        open(viewer);
        Shadows.shadowOf(choose(VideoTracks.SUBTITLES_ID)).clickOnItem(1);
        idle();
        VideoTracks.cues(player, Collections.singletonList(new Cue("Hello")));
        idle();
        TextView line = cueLine();
        assertEquals(View.VISIBLE, line.getVisibility());

        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(2));
        assertEquals("still playing, still there", View.VISIBLE, line.getVisibility());

        viewer.player = player(twoAudioTracksAndSubtitles());
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
        assertEquals("the viewer moved to another video", View.GONE, line.getVisibility());
    }

    @Test public void turningTheSwitchOffStopsTheLines() {
        VideoPlayer player = player(twoAudioTracksAndSubtitles());
        Viewer viewer = viewer(player);
        open(viewer);
        Shadows.shadowOf(choose(VideoTracks.SUBTITLES_ID)).clickOnItem(1);
        idle();
        VideoTracks.cues(player, Collections.singletonList(new Cue("Hello")));
        idle();
        Settings.VIDEO_TRACKS.save(false);
        VideoTracks.cues(player, Collections.singletonList(new Cue("Next")));
        idle();
        assertEquals(View.GONE, cueLine().getVisibility());
    }

    @Test public void aPlayerWithNoVideoViewShowsNothingAndDoesntThrow() {
        VideoPlayer player = player(twoAudioTracksAndSubtitles());
        Viewer viewer = viewer(player);
        open(viewer);
        Shadows.shadowOf(choose(VideoTracks.SUBTITLES_ID)).clickOnItem(1);
        idle();
        ((ViewGroup) player.texture.getParent()).removeView(player.texture);
        VideoTracks.cues(player, Collections.singletonList(new Cue("Hello")));
        idle();
        assertNull(cueLine());
        assertTrue(HookStatus.missing(FamilyNames.KEEP_VIDEOS_MUTED).isEmpty());
    }

    // ---- Names ---------------------------------------------------------------------------------

    @Test public void tracksAreNamedByLabelThenLanguageThenPlace() {
        List<VideoTracks.Track> tracks = Arrays.asList(
                new VideoTracks.Track(english, 0, "Commentary"),
                new VideoTracks.Track(english, 1, null),
                new VideoTracks.Track(spanish, 0, "English"),
                new VideoTracks.Track(spanish, 1, "English"));
        assertEquals(Arrays.asList("Commentary", "Track 2", "English (3)", "English (4)"),
                Arrays.asList(VideoTracks.names(tracks)));
        assertEquals("English", VideoTracks.languageName("en"));
        assertEquals("Portuguese (Brazil)", VideoTracks.languageName("pt-BR"));
        assertNull("undetermined isn't a name", VideoTracks.languageName("und"));
        assertNull(VideoTracks.languageName(""));
        assertNull(VideoTracks.languageName(null));
    }

    private static List<String> texts(CharSequence[] items) {
        List<String> texts = new ArrayList<>();
        for (CharSequence item : items) texts.add(item.toString());
        return texts;
    }
}
