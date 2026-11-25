/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.captions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.shared.Utils;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Issue #8: in another app language a drama can play from a copy with the dub mixed in and its
 * subtitles drawn into the picture, which lists no dubs. Force original dub gives that copy the
 * original file's sound as an audio track and switches to it, so the picture stays.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class OriginalSoundTest {
    /** The feed model's file address, with the getters the reader looks for. */
    public static final class Address {
        private final String uri;
        private final List<String> urlList;
        Address(String uri, String... urls) { this.uri = uri; this.urlList = List.of(urls); }
        public String getUri() { return uri; }
        public List<String> getUrlList() { return urlList; }
        public String getFileHash() { return "hash-" + uri; }
        public int getWidth() { return 540; }
        public int getHeight() { return 960; }
        public long getSize() { return 1234L; }
    }

    public static final class Gear {
        public final Address playAddr;
        Gear(Address address) { playAddr = address; }
    }

    public static final class Video {
        final List<Gear> gears = new ArrayList<>();
        Address playAddr;
        public Address downloadNoWatermarkAddr;
        public Address downloadAddr;
        public String meta;
        boolean dash;
        public List<Gear> getRawBitRate() { return gears; }
        public Address getPlayAddr() { return playAddr; }
        public boolean hasDashBitrate() { return dash; }
    }

    /** The feed model's dub address, the way the server fills it. */
    public static final class PlayAddress {
        public String uri;
        public List<?> urlList;
        public String fileHash;
        public String urlKey;
        public Integer width;
        public Integer height;
        public Long dataSize;
        public PlayAddress() {}
    }

    /** The feed model's dub track. */
    public static final class TtsInfos {
        public String languageCode;
        public String format;
        public Integer bitRate;
        public String voiceType;
        public String subInfo;
        public String volumeInfo;
        public PlayAddress playAddress;
        public TtsInfos() {}
    }

    /** The feed model's audio: the dub tracks a video lists. */
    public static final class Audio {
        public List<?> TtsInfos;
        public long CdnUrlExpired;
        public Audio() {}
        public List<?> getTtsInfos() { return TtsInfos; }
    }

    /** The feed model's video entry. Its audio getter goes through the hook like the patched app's. */
    public static final class Aweme {
        final String aid;
        final Video video;
        Audio audio;
        Aweme(String aid, Video video) { this.aid = aid; this.video = video; }
        public String getAid() { return aid; }
        public Video getVideo() { return video; }
        public Audio getAudio() { return (Audio) OriginalSound.audio(this, audio); }
    }

    /** The app's per-video audio choice. */
    enum Choice { NOT_OVERWRITTEN, ORIGINAL }

    private static Video localized() {
        Video video = new Video();
        video.gears.add(new Gear(new Address("v1c836g5000cdubbed", "https://example.com/dubbed")));
        video.playAddr = video.gears.get(0).playAddr;
        video.downloadNoWatermarkAddr = new Address("v1c025g50000source", "https://example.com/clean");
        video.downloadAddr = new Address("v1c025g50000source", "https://example.com/stamped");
        video.meta = "{\"Version\":\"2\",\"VolumeInfoJson\":\"{\\\"Loudness\\\":-14.2,\\\"Peak\\\":0.9}\"}";
        return video;
    }

    @Before
    public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        Settings.FORCE_ORIGINAL_DUB.save(false);
        OriginalSound.forget();
        TrackPreference.forgetDubs();
    }

    @After
    public void tearDown() {
        Settings.FORCE_ORIGINAL_DUB.resetToDefault();
        OriginalSound.forget();
        TrackPreference.forgetDubs();
    }

    @Test
    public void aLocalizedCopyGetsTheDownloadFileAsAnAudioTrack() throws Exception {
        Settings.FORCE_ORIGINAL_DUB.save(true);
        Aweme aweme = new Aweme("7001", localized());

        Audio audio = aweme.getAudio();
        assertNotNull(audio);
        assertEquals(1, audio.TtsInfos.size());
        TtsInfos track = (TtsInfos) audio.TtsInfos.get(0);
        assertEquals("original", track.languageCode);
        assertEquals("one whole file, not pieces", "mp4", track.format);
        assertEquals("UNKNOWN", track.voiceType);
        assertEquals("", track.subInfo);
        JSONObject volume = new JSONObject(track.volumeInfo);
        assertEquals(-14.2, volume.getDouble("Loudness"), 0);
        assertEquals(0.9, volume.getDouble("Peak"), 0);
        assertNull("PineDrama fills the rate from the video", track.bitRate);

        PlayAddress address = track.playAddress;
        assertEquals("v1c025g50000source", address.uri);
        assertEquals(List.of("https://example.com/clean"), address.urlList);
        assertEquals("hash-v1c025g50000source", address.fileHash);
        assertNull("the player keys a dub file by its hash", address.urlKey);
        assertEquals(Integer.valueOf(540), address.width);
        assertEquals(Integer.valueOf(960), address.height);
        assertEquals(Long.valueOf(1234L), address.dataSize);

        assertSame("made once per copy", audio, aweme.getAudio());
        assertTrue(OriginalSound.carries(aweme));
    }

    @Test
    public void aCopyWithoutRenditionsIsComparedByItsPlayAddress() {
        Settings.FORCE_ORIGINAL_DUB.save(true);
        Video video = localized();
        video.gears.clear();
        video.downloadNoWatermarkAddr = null;
        video.meta = null;
        TtsInfos track = (TtsInfos) new Aweme("7002", video).getAudio().TtsInfos.get(0);
        assertEquals("the stamped copy has the same sound", List.of("https://example.com/stamped"),
            track.playAddress.urlList);
        assertEquals(OriginalSound.DEFAULT_VOLUME, track.volumeInfo);
    }

    @Test
    public void nothingIsAddedWithoutForceOriginalDubOrToAVideoWithItsOwnAudio() {
        Aweme off = new Aweme("7003", localized());
        assertNull(off.getAudio());
        assertFalse(OriginalSound.carries(off));

        Settings.FORCE_ORIGINAL_DUB.save(true);
        Aweme dubbed = new Aweme("7004", localized());
        Audio own = new Audio();
        dubbed.audio = own;
        assertSame("a video that lists dubs keeps them", own, dubbed.getAudio());
    }

    @Test
    public void pineDramasOwnFileAndSplitTracksAreLeftAlone() {
        Settings.FORCE_ORIGINAL_DUB.save(true);
        Video same = localized();
        same.downloadNoWatermarkAddr = new Address("v1c836g5000cdubbed", "https://example.com/clean");
        same.downloadAddr = null;
        assertNull("the same file", new Aweme("7005", same).getAudio());

        Video dash = localized();
        dash.dash = true;
        assertNull("split tracks carry their own sound", new Aweme("7006", dash).getAudio());
    }

    @Test
    public void forceOriginalDubPicksThatTrackAtEveryStep() {
        Settings.FORCE_ORIGINAL_DUB.save(true);
        Aweme aweme = new Aweme("7007", localized());

        assertTrue("the decision's switches let the track play", TrackPreference.dubForced(aweme));
        assertEquals("original", TrackPreference.dubTarget(aweme, "vi"));
        assertEquals("original", TrackPreference.dubLanguage(aweme, "vi", Choice.NOT_OVERWRITTEN));
        assertEquals("the first audio report switches to it", 3,
            TrackPreference.dubTrack("7007", Map.of("vi", 1, "original", 3), TrackPreference.AUDIO, 1));
        assertTrue(TrackPreference.dubLabelOff(aweme, Choice.NOT_OVERWRITTEN));
    }

    @Test
    public void aHandChoiceStillWins() {
        Settings.FORCE_ORIGINAL_DUB.save(true);
        Aweme aweme = new Aweme("7008", localized());
        assertEquals("vi", TrackPreference.dubLanguage(aweme, "vi", Choice.ORIGINAL));
    }

    @Test
    public void aVideoWithoutThatTrackStillPlaysItsOwnAudio() {
        Settings.FORCE_ORIGINAL_DUB.save(true);
        Video same = localized();
        same.downloadNoWatermarkAddr = null;
        same.downloadAddr = null;
        Aweme aweme = new Aweme("7009", same);
        assertFalse(TrackPreference.dubForced(aweme));
        assertEquals("", TrackPreference.dubTarget(aweme, "vi"));
        assertEquals(-1, TrackPreference.dubTrack("7009", Map.of("original", 3), TrackPreference.AUDIO, 1));
    }
}
