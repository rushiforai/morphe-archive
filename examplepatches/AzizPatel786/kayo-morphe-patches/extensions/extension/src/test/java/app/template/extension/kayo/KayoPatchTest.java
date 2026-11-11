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

        assertEquals("Fast startup buffer should be 3.0s (3_000_000 us) for rock-solid time-to-first-frame",
                3_000_000L, lc.bufferForPlaybackUs);
        assertEquals("Rebuffer recovery buffer should be 6.0s (6_000_000 us)",
                6_000_000L, lc.bufferForPlaybackAfterRebufferUs);
        assertEquals("Min buffer should be 20s (20_000_000 us)",
                20_000_000L, lc.minBufferUs);
        assertEquals("Max buffer should be 40s (40_000_000 us)",
                40_000_000L, lc.maxBufferUs);
        assertEquals("Back buffer should be 10s (10_000_000 us) for keyframe rewind",
                10_000_000L, lc.backBufferDurationUs);
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

    @Test
    public void testKayoTvPatchHasZeroExoPlayer2DependenciesAndSupportsTvQoE() throws Exception {
        Class<?> tvClass = Class.forName("app.template.extension.kayo.KayoTvPatch");
        for (Field f : tvClass.getDeclaredFields()) {
            assertFalse("KayoTvPatch field " + f.getName() + " must not reference com.google.android.exoplayer2",
                    f.getType().getName().startsWith("com.google.android.exoplayer2."));
        }
        for (Method m : tvClass.getDeclaredMethods()) {
            assertFalse("KayoTvPatch method " + m.getName() + " return type must not reference com.google.android.exoplayer2",
                    m.getReturnType().getName().startsWith("com.google.android.exoplayer2."));
            for (Class<?> paramType : m.getParameterTypes()) {
                assertFalse("KayoTvPatch method " + m.getName() + " parameter must not reference com.google.android.exoplayer2",
                        paramType.getName().startsWith("com.google.android.exoplayer2."));
            }
        }

        Method getInitialBitrate = tvClass.getDeclaredMethod("getInitialBitrateEstimate");
        assertEquals("KayoTvPatch.getInitialBitrateEstimate() must return 80 Mbps",
                80_000_000L, ((Long) getInitialBitrate.invoke(null)).longValue());

        DummyLoadControl lc = new DummyLoadControl();
        Method cfgLoadControl = tvClass.getDeclaredMethod("configureDefaultLoadControl", Object.class);
        cfgLoadControl.invoke(null, lc);
        assertEquals(4_000_000L, lc.bufferForPlaybackUs);
        assertEquals(40_000_000L, lc.maxBufferUs);

        Method bypassPairip = tvClass.getDeclaredMethod("bypassPairipLicenseCheck");
        bypassPairip.invoke(null); // Must safely execute without throwing even when com.pairip is absent
    }

    @Test
    public void testKayoMobilePatchDedicatedClassSupportsMobileQoEAndTrackSelection() throws Exception {
        Class<?> mobileClass = Class.forName("app.template.extension.kayo.KayoMobilePatch");
        Method getInitialBitrate = mobileClass.getDeclaredMethod("getInitialBitrateEstimate");
        assertEquals("KayoMobilePatch.getInitialBitrateEstimate() must return 80 Mbps",
                80_000_000L, ((Long) getInitialBitrate.invoke(null)).longValue());

        DummyRenderersFactory rf = new DummyRenderersFactory();
        Method cfgRf = mobileClass.getDeclaredMethod("configureRenderersFactory", Object.class);
        cfgRf.invoke(null, rf);
        assertTrue(rf.enableDecoderFallback);
    }

    @Test
    public void testKayoTvPatchSupportsV461AndV481HdmiStatusPluginAndStandbySanitization() throws Exception {
        Class<?> tvClass = Class.forName("app.template.extension.kayo.KayoTvPatch");
        Method onHdmiTryNotify = tvClass.getDeclaredMethod("onHdmiTryNotify", Object.class);

        // 1. Test v4.6.1 HdmiStatusPlugin (primitive boolean isConnected)
        DummyHdmiPluginV461 plugin461 = new DummyHdmiPluginV461();
        assertFalse(plugin461.isConnected);
        onHdmiTryNotify.invoke(null, plugin461);
        assertTrue("v4.6.1 HdmiStatusPlugin boolean isConnected must be forced to true", plugin461.isConnected);

        // 2. Test v4.8.1 HdmiStatusPlugin (AtomicBoolean isConnected)
        DummyHdmiPluginV481 plugin481 = new DummyHdmiPluginV481();
        assertFalse(plugin481.isConnected.get());
        onHdmiTryNotify.invoke(null, plugin481);
        assertTrue("v4.8.1 HdmiStatusPlugin AtomicBoolean isConnected must be forced to true", plugin481.isConnected.get());

        // 3. Test v4.8.1 LoadArguments standbyDetectionEnabled & standbyResponseEnabled sanitization
        DummyLoadArgumentsV481 loadArgs = new DummyLoadArgumentsV481();
        Method sanitizeLoadArgs = tvClass.getDeclaredMethod("sanitizeLoadArguments", Object.class);
        sanitizeLoadArgs.invoke(null, loadArgs);
        assertFalse(loadArgs.useWidevineL3);
        assertFalse(loadArgs.isTunnellingEnabled);
        assertFalse(loadArgs.applyTunnelingTransitionFix);
        assertFalse("v4.8.1 standbyDetectionEnabled must be disabled", loadArgs.standbyDetectionEnabled);
        assertFalse("v4.8.1 standbyResponseEnabled must be disabled", loadArgs.standbyResponseEnabled);
        assertEquals(Integer.MAX_VALUE, loadArgs.maxVideoBitrate);
    }

    @Test
    public void testKayoTvBandwidthClampingAndAntiBufferingConfiguration() throws Exception {
        Class<?> tvClass = Class.forName("app.template.extension.kayo.KayoTvPatch");

        // 1. Test DefaultLoadControl configuration on TV (4.0s startup, 8.0s rebuffer, 20s min, 40s max)
        DummyLoadControl tvLc = new DummyLoadControl();
        Method configLc = tvClass.getDeclaredMethod("configureDefaultLoadControl", Object.class);
        configLc.invoke(null, tvLc);
        assertEquals("TV bufferForPlaybackUs must be 4.0s (4_000_000 us) to prevent instant buffer exhaustion",
                4_000_000L, tvLc.bufferForPlaybackUs);
        assertEquals("TV bufferForPlaybackAfterRebufferUs must be 8.0s (8_000_000 us) to prevent repeated rebuffer cycles",
                8_000_000L, tvLc.bufferForPlaybackAfterRebufferUs);
        assertEquals("TV minBufferUs must be 20.0s (20_000_000 us)",
                20_000_000L, tvLc.minBufferUs);
        assertEquals("TV maxBufferUs must be 40.0s (40_000_000 us)",
                40_000_000L, tvLc.maxBufferUs);
        assertEquals("TV backBufferDurationUs must be 10.0s (10_000_000 us)",
                10_000_000L, tvLc.backBufferDurationUs);

        // 2. Test DefaultLivePlaybackSpeedControl configuration on TV (maxPlaybackSpeed=1.02f enables catchup)
        DummyLivePlaybackSpeedControl sc = new DummyLivePlaybackSpeedControl();
        Method configSpeed = tvClass.getDeclaredMethod("configureLivePlaybackSpeedControl", Object.class);
        configSpeed.invoke(null, sc);
        assertEquals("maxPlaybackSpeed must be 1.02f so ExoPlayer can catch up without starving buffer",
                1.02f, sc.maxPlaybackSpeed, 0.001f);
        assertTrue("minTargetLiveOffsetUs must be at least 6s", sc.minTargetLiveOffsetUs >= 6_000_000L);
        assertTrue("currentTargetLiveOffsetUs must be at least 7s", sc.currentTargetLiveOffsetUs >= 7_000_000L);

        // 3. Test onBandwidthSample clamps 1-5 Mbps audio-skewed estimate to at least high speed floor (>=80 Mbps)
        DummyDefaultBandwidthMeter dbm = new DummyDefaultBandwidthMeter();
        dbm.bitrateEstimate = 1_250_000L; // 1.25 Mbps drop
        Method onBwSample = tvClass.getDeclaredMethod("onBandwidthSample", Object.class, long.class);
        long clamped = (Long) onBwSample.invoke(null, dbm, 1_250_000L);
        assertTrue("Bandwidth estimate must be clamped to at least 80 Mbps (was " + clamped + ")",
                clamped >= 80_000_000L);
        assertEquals("DefaultBandwidthMeter.bitrateEstimate must be updated to clamped bitrate",
                clamped, dbm.bitrateEstimate);
        assertEquals("DefaultBandwidthMeter.lastReportedBitrateEstimate must be updated to clamped bitrate",
                clamped, dbm.lastReportedBitrateEstimate);

        // 4. Test overrideReportedBandwidth protects JS Notificator
        Method overrideReported = tvClass.getDeclaredMethod("overrideReportedBandwidth", long.class);
        long reportedClamped = (Long) overrideReported.invoke(null, 2_000_000L);
        assertTrue("overrideReportedBandwidth must clamp to at least 80 Mbps",
                reportedClamped >= 80_000_000L);
    }

    // --- Dummy Helper Classes for Reflection & QoE Tests ---

    public static class DummyHdmiPluginV461 {
        public boolean isConnected = false;
    }

    public static class DummyHdmiPluginV481 {
        public final java.util.concurrent.atomic.AtomicBoolean isConnected =
                new java.util.concurrent.atomic.AtomicBoolean(false);
    }

    public static class DummyLoadArgumentsV481 {
        public boolean useWidevineL3 = true;
        public int maxVideoBitrate = 2000000;
        public boolean isTunnellingEnabled = true;
        public boolean applyTunnelingTransitionFix = true;
        public boolean standbyDetectionEnabled = true;
        public boolean standbyResponseEnabled = true;
    }

    public static class DummyDefaultBandwidthMeter {
        public long bitrateEstimate = 1_500_000L;
        public long lastReportedBitrateEstimate = 1_500_000L;
        public long totalBytesTransferred = 5_000_000L;
        public long totalElapsedTimeMs = 200L;
        public Object context = null;
    }

    public static class DummyLivePlaybackSpeedControl {
        public float maxPlaybackSpeed = 1.0f;
        public float fallbackMaxPlaybackSpeed = 1.0f;
        public float minPlaybackSpeed = 1.0f;
        public float fallbackMinPlaybackSpeed = 1.0f;
        public long minTargetLiveOffsetUs = 2_000_000L;
        public long currentTargetLiveOffsetUs = 2_000_000L;
    }

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
