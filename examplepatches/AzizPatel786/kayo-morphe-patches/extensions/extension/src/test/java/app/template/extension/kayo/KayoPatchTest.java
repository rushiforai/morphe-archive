package app.template.extension.kayo;

import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.Tracks;
import com.google.android.exoplayer2.source.TrackGroup;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;
import com.google.android.exoplayer2.trackselection.TrackSelectionOverride;

import org.junit.Before;
import org.junit.Test;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * TDD Unit Tests for KayoPatch audio track switching, 1080p/4K video track selection,
 * and streaming QoE / runtime performance optimizations.
 */
public class KayoPatchTest {

    private DefaultTrackSelector selector;
    private TrackGroup videoGroup;
    private TrackGroup audioGroup0;
    private TrackGroup audioGroup1;
    private TrackGroup audioGroup2;
    private Tracks initialTracks;

    @Before
    public void setUp() throws Exception {
        selector = new DefaultTrackSelector();

        Format v1080p50 = new Format("v1080", "1080p50", null, 1920, 1080, 50.0f, 6500000, "avc1.64002a", "video/avc");
        Format v720p50 = new Format("v720", "720p50", null, 1280, 720, 50.0f, 4100000, "avc1.640020", "video/avc");
        Format v540p25 = new Format("v540", "540p25", null, 960, 540, 25.0f, 2000000, "avc1.4d401f", "video/avc");
        videoGroup = new TrackGroup("video-main", v720p50, v1080p50, v540p25);

        // Simulate Kayo multi-group audio feeds (e.g. Fox Sports commentary, Alternative English commentary, Hindi commentary)
        Format a0 = new Format("a0", "", "en", -1, -1, -1f, 128000, "mp4a.40.2", "audio/mp4a-latm");
        Format a1 = new Format("a1", "", "en", -1, -1, -1f, 128000, "mp4a.40.2", "audio/mp4a-latm");
        Format a2 = new Format("a2", "Hindi Commentary", "hi", -1, -1, -1f, 128000, "mp4a.40.2", "audio/mp4a-latm");

        audioGroup0 = new TrackGroup("audio-0", a0);
        audioGroup1 = new TrackGroup("audio-1", a1);
        audioGroup2 = new TrackGroup("audio-2", a2);

        // Simulate 1080p50 marked as unsupported (format_exceeds_capabilities = 3) before our MediaCodecUtil hook,
        // and 720p50 initially selected by Kayo.
        Tracks.Group vg = new Tracks.Group(
                videoGroup,
                true,
                new int[]{4, 3, 4},
                new boolean[]{true, false, false}
        );
        Tracks.Group ag0 = new Tracks.Group(audioGroup0, false, new int[]{4}, new boolean[]{true});
        Tracks.Group ag1 = new Tracks.Group(audioGroup1, false, new int[]{4}, new boolean[]{false});
        Tracks.Group ag2 = new Tracks.Group(audioGroup2, false, new int[]{4}, new boolean[]{false});

        initialTracks = new Tracks(Arrays.asList(vg, ag0, ag1, ag2));

        setStaticField("currentTrackSelector", selector);
        setStaticField("currentTracks", initialTracks);
        setStaticField("currentSelectedAudioOption", null);
        setStaticField("selectedHeight", 2160);
    }

    @Test
    public void testRepeatedAudioSwitchingAcrossMultipleGroupsAndTracksChanged() throws Exception {
        // 1. Initial audio options: group 0 is selected
        List<?> options1 = invokeGetAvailableAudioOptions();
        assertEquals(3, options1.size());
        assertTrue(getAudioIsSelected(options1.get(0)));
        assertFalse(getAudioIsSelected(options1.get(1)));
        assertFalse(getAudioIsSelected(options1.get(2)));

        // 2. First switch: select Audio Group 1 (second English feed)
        invokeApplySelectedAudioTrack(options1.get(1));
        TrackSelectionOverride activeOverride1 = getAudioOverride(selector);
        assertNotNull("First audio switch must set TrackSelectionOverride of type 1", activeOverride1);
        assertEquals(audioGroup1, activeOverride1.mediaTrackGroup);
        assertEquals(Integer.valueOf(0), activeOverride1.trackIndices.get(0));

        // Even BEFORE onTracksChanged fires (or when skipNextTrackReselection skips Lpx/d->onTracksChanged),
        // reopening the Audio dialog MUST reflect Audio Group 1 as selected!
        List<?> optionsAfterSwitch1 = invokeGetAvailableAudioOptions();
        assertFalse("Group 0 should no longer be marked selected", getAudioIsSelected(optionsAfterSwitch1.get(0)));
        assertTrue("Group 1 must be marked selected immediately after 1st switch", getAudioIsSelected(optionsAfterSwitch1.get(1)));
        assertFalse(getAudioIsSelected(optionsAfterSwitch1.get(2)));

        // 3. Second switch: select Audio Group 2 (Hindi feed)
        invokeApplySelectedAudioTrack(optionsAfterSwitch1.get(2));
        TrackSelectionOverride activeOverride2 = getAudioOverride(selector);
        assertNotNull("Second audio switch must update TrackSelectionOverride", activeOverride2);
        assertEquals(audioGroup2, activeOverride2.mediaTrackGroup);
        assertEquals("hi", selector.getParameters().preferredAudioLanguages.get(0));

        List<?> optionsAfterSwitch2 = invokeGetAvailableAudioOptions();
        assertFalse(getAudioIsSelected(optionsAfterSwitch2.get(0)));
        assertFalse(getAudioIsSelected(optionsAfterSwitch2.get(1)));
        assertTrue("Group 2 must be marked selected after 2nd switch", getAudioIsSelected(optionsAfterSwitch2.get(2)));

        // 4. Third switch: switch back to Audio Group 0 (first English feed)
        invokeApplySelectedAudioTrack(optionsAfterSwitch2.get(0));
        TrackSelectionOverride activeOverride3 = getAudioOverride(selector);
        assertNotNull("Third audio switch must update TrackSelectionOverride back to Group 0", activeOverride3);
        assertEquals(audioGroup0, activeOverride3.mediaTrackGroup);
        assertEquals("en", selector.getParameters().preferredAudioLanguages.get(0));

        List<?> optionsAfterSwitch3 = invokeGetAvailableAudioOptions();
        assertTrue("Group 0 must be marked selected after 3rd switch", getAudioIsSelected(optionsAfterSwitch3.get(0)));
        assertFalse(getAudioIsSelected(optionsAfterSwitch3.get(1)));
        assertFalse(getAudioIsSelected(optionsAfterSwitch3.get(2)));
    }

    @Test
    public void testNativeSetAudioTrackClearsConflictingOverrideAndAllowsRepeatedSwitches() throws Exception {
        // Switch via custom dialog to Group 1 ("en")
        List<?> options = invokeGetAvailableAudioOptions();
        invokeApplySelectedAudioTrack(options.get(1));
        assertNotNull(getAudioOverride(selector));

        // Now user switches via Kayo's native Audio/CC selector to "hi"
        Method onSetAudioTrack = KayoPatch.class.getDeclaredMethod("onSetAudioTrack", DefaultTrackSelector.class, String.class);
        onSetAudioTrack.invoke(null, selector, "hi");

        // Native switch must not be blocked by stale Group 1 TrackSelectionOverride!
        TrackSelectionOverride overrideAfterNative = getAudioOverride(selector);
        if (overrideAfterNative != null) {
            assertEquals("If an override remains after native switch to 'hi', it must point to the 'hi' TrackGroup",
                    audioGroup2, overrideAfterNative.mediaTrackGroup);
        }

        // Now user switches via Kayo's native Audio/CC selector back to "en"
        onSetAudioTrack.invoke(null, selector, "en");
        TrackSelectionOverride overrideAfterNative2 = getAudioOverride(selector);
        if (overrideAfterNative2 != null) {
            assertEquals(audioGroup0, overrideAfterNative2.mediaTrackGroup);
        }
    }

    @Test
    public void testDistinctDisplayLabelsForSameLanguageAudioFeeds() throws Exception {
        List<?> options = invokeGetAvailableAudioOptions();
        String label0 = invokeGetDisplayLabel(options.get(0));
        String label1 = invokeGetDisplayLabel(options.get(1));
        assertNotEquals("Two audio feeds with empty labels and same language must have distinct display labels",
                label0, label1);
    }

    @Test
    public void test1080pSelectedAndLockedOnMobileInMaxAndAutoModes() throws Exception {
        // Test QUALITY_MAX (2160) selects 1080p50 (trackIndex 1 in videoGroup) even if Kayo initially selected 720p50
        setStaticField("selectedHeight", 2160);
        KayoPatch.onTracksChanged(selector, initialTracks);

        TrackSelectionOverride videoOverride = selector.getParameters().overrides.get(videoGroup);
        assertNotNull("Video TrackSelectionOverride must be applied for 1080p50", videoOverride);
        assertEquals("Must lock to trackIndex 1 (1080p50), not trackIndex 0 (720p50)",
                Integer.valueOf(1), videoOverride.trackIndices.get(0));
        assertTrue(selector.getParameters().exceedVideoConstraintsIfNecessary);
        assertTrue(selector.getParameters().exceedRendererCapabilitiesIfNecessary);

        // Test QUALITY_AUTO (-1) also guarantees at least 1080p when 1080p is available in manifest
        setStaticField("selectedHeight", -1);
        KayoPatch.onTracksChanged(selector, initialTracks);
        assertTrue("minVideoHeight must be at least 1080 when 1080p is available",
                selector.getParameters().minVideoHeight >= 1080);
        TrackSelectionOverride autoVideoOverride = selector.getParameters().overrides.get(videoGroup);
        assertNotNull("QUALITY_AUTO on mobile should also include >=1080p tracks in override so ExoPlayer never drops to 720p",
                autoVideoOverride);
        assertTrue("Override must include 1080p trackIndex 1",
                autoVideoOverride.trackIndices.contains(1));
        assertFalse("Override must NOT include 720p trackIndex 0 when 1080p is available",
                autoVideoOverride.trackIndices.contains(0));
    }

    @Test
    public void testDefaultLoadControlFastStartupAndAntiRebufferTuning() throws Exception {
        DummyLoadControl lc = new DummyLoadControl();
        KayoPatch.configureDefaultLoadControl(lc);

        assertEquals("Fast startup buffer should be 1.5s (1_500_000 us) for sub-2s time-to-first-frame",
                1_500_000L, lc.bufferForPlaybackUs);
        assertEquals("Rebuffer recovery buffer should be 3.0s (3_000_000 us)",
                3_000_000L, lc.bufferForPlaybackAfterRebufferUs);
        assertEquals("Min buffer should be 50s (50_000_000 us)",
                50_000_000L, lc.minBufferUs);
        assertEquals("Max buffer should be 120s (120_000_000 us)",
                120_000_000L, lc.maxBufferUs);
        assertEquals("Back buffer should be 30s (30_000_000 us) for instant keyframe rewind",
                30_000_000L, lc.backBufferDurationUs);
        assertTrue("retainBackBufferFromKeyframe must be enabled", lc.retainBackBufferFromKeyframe);
        assertTrue("prioritizeTimeOverSizeThresholds must be enabled", lc.prioritizeTimeOverSizeThresholds);
    }

    @Test
    public void testConfigureRenderersFactoryEnablesDecoderFallbackAndAsyncQueueing() throws Exception {
        DummyRenderersFactory rf = new DummyRenderersFactory();
        Method m = KayoPatch.class.getDeclaredMethod("configureRenderersFactory", Object.class);
        m.invoke(null, rf);
        assertTrue("Decoder fallback must be enabled on DefaultRenderersFactory", rf.enableDecoderFallback);
    }

    @Test
    public void testReflectionFieldCacheEliminatesRepeatedClassHierarchyScans() throws Exception {
        Field cacheField = KayoPatch.class.getDeclaredField("FIELD_CACHE");
        cacheField.setAccessible(true);
        Map<?, ?> cache = (Map<?, ?>) cacheField.get(null);
        assertNotNull("FIELD_CACHE must be initialized", cache);

        DummyLoadControl lc = new DummyLoadControl();
        KayoPatch.configureDefaultLoadControl(lc);
        String expectedKey = DummyLoadControl.class.getName() + "#bufferForPlaybackUs";
        assertTrue("FIELD_CACHE must cache resolved Field by ClassName#fieldName",
                cache.containsKey(expectedKey));
    }

    @Test
    public void testDeduplicatedApplySelectedQualitySkipsRedundantSetParameters() throws Exception {
        CountingTrackSelector countingSelector = new CountingTrackSelector();
        setStaticField("currentTrackSelector", countingSelector);
        setStaticField("selectedHeight", 2160);

        KayoPatch.onTracksChanged(countingSelector, initialTracks);
        int countAfterFirst = countingSelector.setParametersCount;
        assertEquals("First onTracksChanged must invoke setParameters once", 1, countAfterFirst);

        // Immediately calling onTracksUpdated with the exact same Tracks and state must NOT call setParameters again
        KayoPatch.onTracksUpdated(initialTracks);
        assertEquals("Redundant onTracksUpdated on identical Tracks & quality state must skip setParameters",
                1, countingSelector.setParametersCount);

        // Changing selectedHeight and re-applying MUST call setParameters
        setStaticField("selectedHeight", 720);
        KayoPatch.onTracksUpdated(initialTracks);
        assertEquals("Changing selectedHeight must trigger setParameters",
                2, countingSelector.setParametersCount);
    }

    // --- Dummy Helper Classes for Reflection & QoE Tests ---

    public static class DummyLoadControl {
        private long minBufferUs = 15_000_000L;
        private long maxBufferUs = 50_000_000L;
        private long bufferForPlaybackUs = 2_500_000L;
        private long bufferForPlaybackAfterRebufferUs = 5_000_000L;
        private long backBufferDurationUs = 0L;
        private boolean retainBackBufferFromKeyframe = false;
        private boolean prioritizeTimeOverSizeThresholds = false;
    }

    public static class DummyRenderersFactory {
        private boolean enableDecoderFallback = false;

        public DummyRenderersFactory setEnableDecoderFallback(boolean enable) {
            this.enableDecoderFallback = enable;
            return this;
        }
    }

    public static class CountingTrackSelector extends DefaultTrackSelector {
        public int setParametersCount = 0;

        @Override
        public void setParameters(com.google.android.exoplayer2.trackselection.TrackSelectionParameters parameters) {
            super.setParameters(parameters);
            setParametersCount++;
        }
    }

    // --- Reflection Helpers ---

    private static void setStaticField(String name, Object value) throws Exception {
        Field f = KayoPatch.class.getDeclaredField(name);
        f.setAccessible(true);
        f.set(null, value);
    }

    private static List<?> invokeGetAvailableAudioOptions() throws Exception {
        Method m = KayoPatch.class.getDeclaredMethod("getAvailableAudioOptions");
        m.setAccessible(true);
        return (List<?>) m.invoke(null);
    }

    private static void invokeApplySelectedAudioTrack(Object audioTrackOption) throws Exception {
        Class<?> optClass = Class.forName("app.template.extension.kayo.KayoPatch$AudioTrackOption");
        Method m = KayoPatch.class.getDeclaredMethod("applySelectedAudioTrack", optClass);
        m.setAccessible(true);
        m.invoke(null, audioTrackOption);
    }

    private static boolean getAudioIsSelected(Object audioTrackOption) throws Exception {
        Field f = audioTrackOption.getClass().getDeclaredField("isSelected");
        f.setAccessible(true);
        return f.getBoolean(audioTrackOption);
    }

    private static String invokeGetDisplayLabel(Object audioTrackOption) throws Exception {
        Method m = audioTrackOption.getClass().getDeclaredMethod("getDisplayLabel");
        m.setAccessible(true);
        return (String) m.invoke(audioTrackOption);
    }

    private static TrackSelectionOverride getAudioOverride(DefaultTrackSelector sel) {
        for (TrackSelectionOverride ov : sel.getParameters().overrides.values()) {
            if (ov.getType() == 1) {
                return ov;
            }
        }
        return null;
    }
}
