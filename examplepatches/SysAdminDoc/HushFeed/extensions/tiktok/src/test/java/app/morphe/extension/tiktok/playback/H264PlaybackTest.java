package app.morphe.extension.tiktok.playback;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.categories.PlaybackPreferenceCategory;
import com.ss.android.ugc.aweme.base.model.UrlModel;
import java.util.List;
import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** Prefer H.264 video: which gears reach the player, how it sits with SDR and quality, and where the switch lives. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class H264PlaybackTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    public static final class TestActivity extends PreferenceActivity {
        @Override public void onCreate(android.os.Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
        }
    }

    public static final class Address extends UrlModel {
        private final String url;
        Address(String url) { this.url = url; }
        @Override public List<String> getUrlList() { return List.of(url); }
    }

    /** SimBitRate's shape: codecType 0 is H.264, 1 ByteVC1 (HEVC), 2 ByteVC2; hdrType 1 and 2 are HDR. */
    public static final class Gear {
        public final String gearName;
        public final int bitRate;
        public final UrlModel playAddr;
        private final int codecType;
        private final int hdrType;
        Gear(String name, int rate, int codecType) { this(name, rate, codecType, 0); }
        Gear(String name, int rate, int codecType, int hdrType) {
            gearName = name;
            bitRate = rate;
            playAddr = new Address("https://example.com/" + name + "-" + codecType + "-" + hdrType);
            this.codecType = codecType;
            this.hdrType = hdrType;
        }
        public int getCodecType() { return codecType; }
        public int getHdrType() { return hdrType; }
        @Override public String toString() { return gearName + "/" + codecType + "/" + hdrType; }
    }

    @org.junit.Before public void patched() {
        SettingsStatus.h264PlaybackEnabled = true;
    }

    @After public void tearDown() {
        Settings.PREFER_H264.save(false);
        Settings.PLAY_SDR.save(false);
        Settings.PLAYBACK_QUALITY.save("auto");
        SettingsStatus.h264PlaybackEnabled = false;
        H264Playback.resetForTests();
        SdrPlayback.resetForTests();
        PlaybackQuality.resetForTests();
    }

    @Test public void offByDefaultAndOffLeavesTheListAlone() {
        assertEquals(Boolean.FALSE, Settings.PREFER_H264.defaultValue);
        assertEquals("prefer_h264", Settings.PREFER_H264.key);
        List<Gear> gears = List.of(new Gear("1080p", 900, 1), new Gear("720p", 600, 0));
        assertSame(gears, H264Playback.filterPlayerUrlModelGears(gears));
        assertSame(gears, H264Playback.filterPlayerVideoGears(gears));
    }

    @Test public void onKeepsOnlyTheH264Gears() {
        Settings.PREFER_H264.save(true);
        Gear hevc = new Gear("1080p", 900, 1);
        Gear h264720 = new Gear("720p", 600, 0);
        Gear vc2 = new Gear("1080p", 500, 2);
        Gear h264540 = new Gear("540p", 300, 0);
        List<Gear> gears = List.of(hevc, h264720, vc2, h264540);
        assertEquals(List.of(h264720, h264540), H264Playback.filterPlayerUrlModelGears(gears));
        assertEquals(List.of(h264720, h264540), H264Playback.filterPlayerVideoGears(gears));
        assertEquals("the hooked list is never changed in place", 4, gears.size());
    }

    /** A switch saved on by an earlier build keeps its value after a repatch without the patch. */
    @Test public void aSavedSwitchDoesNothingWithoutItsPatch() {
        Settings.PREFER_H264.save(true);
        SettingsStatus.h264PlaybackEnabled = false;
        List<Gear> gears = List.of(new Gear("1080p", 900, 1), new Gear("720p", 600, 0));
        assertSame(gears, H264Playback.filterPlayerUrlModelGears(gears));
        assertSame(gears, H264Playback.filterPlayerVideoGears(gears));
        Settings.PLAY_SDR.save(true);
        assertSame(gears, SdrPlayback.filterPlayerUrlModelGears(gears));
    }

    @Test public void aVideoWithoutAnH264VersionPlaysAsBefore() {
        Settings.PREFER_H264.save(true);
        List<Gear> noH264 = List.of(new Gear("1080p", 900, 1), new Gear("720p", 700, 2));
        assertSame(noH264, H264Playback.filterPlayerUrlModelGears(noH264));
        List<Gear> one = List.of(new Gear("1080p", 900, 1));
        assertSame(one, H264Playback.filterPlayerUrlModelGears(one));
        assertNull(H264Playback.filterPlayerUrlModelGears(null));
        List<Gear> allH264 = List.of(new Gear("1080p", 600, 0), new Gear("540p", 300, 0));
        assertSame(allH264, H264Playback.filterPlayerUrlModelGears(allH264));
    }

    @Test public void aGearWithoutAReadableCodecIsNotH264() {
        Settings.PREFER_H264.save(true);
        List<Object> unreadable = List.of(new Object(), "gear");
        assertSame(unreadable, H264Playback.filterPlayerUrlModelGears(unreadable));
        Gear h264 = new Gear("720p", 600, 0);
        assertEquals(List.of(h264), H264Playback.filterPlayerUrlModelGears(List.of(new Object(), h264)));
    }

    @Test public void theSdrAndH264HooksAgreeInEitherOrder() {
        Settings.PREFER_H264.save(true);
        Settings.PLAY_SDR.save(true);
        Gear hdrHevc = new Gear("1080p", 900, 1, 1);
        Gear sdrHevc = new Gear("1080p", 700, 1, 0);
        Gear hdrH264 = new Gear("720p", 650, 0, 2);
        Gear sdrH264 = new Gear("720p", 500, 0, 0);
        List<Gear> gears = List.of(hdrHevc, sdrHevc, hdrH264, sdrH264);
        assertEquals(List.of(sdrH264), H264Playback.filterPlayerUrlModelGears(gears));
        assertEquals(List.of(sdrH264), SdrPlayback.filterPlayerUrlModelGears(gears));
        assertEquals(List.of(sdrH264),
                SdrPlayback.filterPlayerUrlModelGears(H264Playback.filterPlayerUrlModelGears(gears)));
        assertEquals(List.of(sdrH264),
                H264Playback.filterPlayerUrlModelGears(SdrPlayback.filterPlayerUrlModelGears(gears)));

        // H.264 comes first: an H.264 video only offered in HDR beats an HEVC one in SDR, and
        // both hooks say so whichever runs first.
        List<Gear> split = List.of(hdrH264, sdrHevc);
        assertEquals(List.of(hdrH264), H264Playback.filterPlayerVideoGears(split));
        assertEquals(List.of(hdrH264), SdrPlayback.filterPlayerVideoGears(split));
        assertEquals(List.of(hdrH264),
                SdrPlayback.filterPlayerVideoGears(H264Playback.filterPlayerVideoGears(split)));
        assertEquals(List.of(hdrH264),
                H264Playback.filterPlayerVideoGears(SdrPlayback.filterPlayerVideoGears(split)));
    }

    @Test public void playbackQualityChoosesAmongH264GearsOnly() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        Gear hevc1080 = new Gear("1080p", 900, 1);
        Gear h264720 = new Gear("720p", 600, 0);
        Gear h264540 = new Gear("540p", 300, 0);
        List<Gear> gears = List.of(hevc1080, h264720, h264540);
        Settings.PLAYBACK_QUALITY.save("highest");
        assertEquals(List.of(hevc1080), PlaybackQuality.filterPlayerUrlModelGears(gears));
        Settings.PREFER_H264.save(true);
        assertEquals(List.of(h264720), PlaybackQuality.filterPlayerUrlModelGears(gears));
        assertEquals(List.of(h264720),
                H264Playback.filterPlayerUrlModelGears(PlaybackQuality.filterPlayerUrlModelGears(gears)));
        assertEquals(List.of(h264720),
                PlaybackQuality.filterPlayerUrlModelGears(H264Playback.filterPlayerUrlModelGears(gears)));
        Settings.PLAYBACK_QUALITY.save("lowest");
        assertEquals(List.of(h264540), PlaybackQuality.filterPlayerVideoGears(gears));
    }

    @Test public void theSwitchIsOnThePlaybackPageOnlyWhenPatched() {
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            var activity = controller.get();
            Utils.setContext(activity);

            SettingsStatus.h264PlaybackEnabled = false;
            PreferenceScreen without = activity.getPreferenceManager().createPreferenceScreen(activity);
            new PlaybackPreferenceCategory(activity, without);
            assertNull(without.findPreference(Settings.PREFER_H264.key));

            SettingsStatus.h264PlaybackEnabled = true;
            assertTrue(PlaybackPreferenceCategory.isAvailable());
            PreferenceScreen with = activity.getPreferenceManager().createPreferenceScreen(activity);
            new PlaybackPreferenceCategory(activity, with);
            assertNotNull(with.findPreference(Settings.PREFER_H264.key));
        }
    }
}
