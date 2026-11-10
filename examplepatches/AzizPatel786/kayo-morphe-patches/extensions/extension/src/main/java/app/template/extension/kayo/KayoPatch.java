package app.template.extension.kayo;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.exoplayer2.ExoPlayer;
import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.Tracks;
import com.google.android.exoplayer2.source.TrackGroup;
import com.google.android.exoplayer2.trackselection.DefaultTrackSelector;
import com.google.android.exoplayer2.trackselection.TrackSelectionOverride;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Extension helper class for Kayo Sports In-Player Quality Menu and
 * Live Stream Diagnostics (Stats for Nerds) patch.
 *
 * Hooks into Kayo's ProfileBasedTrackSelector (Lpx/e;), player interface (LHv/P;),
 * and player controls (AbstractDaznPlayerControls / DefaultPlayerControls) to:
 * 1. Provide an interactive resolution/bitrate selector (Auto / 4K UHD / 1080p FHD / etc.).
 * 2. Prevent Kayo's TrackBitrateLimiter from capping live playback below UHD.
 * 3. Provide a dedicated Live Diagnostics button that displays real-time bitrate,
 *    framerate, and resolution for the live stream (HUD overlay + full report).
 */
@SuppressWarnings("unused")
public final class KayoPatch {

    private static final String PREFS_NAME = "morphe_kayo_quality_prefs";
    private static final String KEY_REMEMBER_QUALITY = "remember_quality";
    private static final String KEY_SELECTED_HEIGHT = "selected_height";
    private static final String KEY_SELECTED_BITRATE = "selected_bitrate";
    private static final String KEY_PREFS_VERSION_1080P = "kayo_prefs_v2_1080p";

    private static final int VIDEO_TRACK_TYPE = 2; // C.TRACK_TYPE_VIDEO
    private static final int QUALITY_AUTO = -1;
    private static final int QUALITY_MAX = 2160;

    private static final int QUALITY_BUTTON_VIEW_ID = 0x7f0b9999;
    private static final int DIAGNOSTICS_BUTTON_VIEW_ID = 0x7f0b9998;
    private static final int DIAGNOSTICS_OVERLAY_VIEW_ID = 0x7f0b9997;
    private static final int DIAGNOSTICS_OVERLAY_TEXT_VIEW_ID = 0x7f0b9996;
    private static final int PIP_BUTTON_VIEW_ID = 0x7f0b9993;

    private static volatile DefaultTrackSelector currentTrackSelector;
    private static volatile Tracks currentTracks;
    private static volatile WeakReference<ExoPlayer> currentPlayerRef;

    // -1 means Auto (Adaptive), > 0 means target video height (e.g. 2160, 1080, 720, 540)
    // Default to maximum available quality (2160p / 4K UHD or highest stream rendition)
    private static volatile int selectedHeight = QUALITY_MAX;
    // Specific bitrate to lock to (or -1 if any bitrate at that height)
    private static volatile int selectedBitrate = QUALITY_AUTO;
    private static volatile boolean prefsLoaded = false;
    private static volatile AudioTrackOption currentSelectedAudioOption = null;

    // Reflection Field & Method Cache (O(1) hot-path lookups across ExoPlayer2 and Media3)
    private static final java.util.concurrent.ConcurrentHashMap<String, Field> FIELD_CACHE =
            new java.util.concurrent.ConcurrentHashMap<>(128);
    private static final java.util.concurrent.ConcurrentHashMap<String, Boolean> MISSING_FIELD_CACHE =
            new java.util.concurrent.ConcurrentHashMap<>(64);

    // State deduplication for applySelectedQuality to avoid redundant selector.setParameters calls
    private static volatile DefaultTrackSelector lastAppliedSelector;
    private static volatile Tracks lastAppliedTracks;
    private static volatile int lastAppliedHeight = Integer.MIN_VALUE;
    private static volatile int lastAppliedBitrate = Integer.MIN_VALUE;
    private static volatile AudioTrackOption lastAppliedAudioOption = null;

    private static volatile WeakReference<Object> currentMedia3PlayerRef;
    private static volatile WeakReference<Object> currentBandwidthMeterRef;
    private static volatile Object currentMedia3Tracks;
    private static volatile VideoTrackOption lastObservedMedia3Track;
    private static long lastCenterClickTime = 0;
    private static long lastCenterKeyDownTime = 0L;
    private static volatile WeakReference<Activity> currentTvActivityRef;
    private static volatile WeakReference<View> currentTvPlayerViewRef;
    private static volatile WeakReference<View> tvQualityButtonOverlayRef;
    private static volatile WeakReference<TextView> tvQualityButtonTextRef;
    private static Runnable tvButtonFadeRunnable;
    private static volatile boolean isTvStreamActive = false;

    private static final List<WeakReference<TextView>> qualityBadgeViews = new ArrayList<>();
    private static final Handler mainHandler = new Handler(Looper.getMainLooper());

    private static volatile WeakReference<View> activeOverlayRef;
    private static Runnable overlayUpdateRunnable;

    private KayoPatch() {
    }

    /**
     * Live metrics snapshot representing active stream playback parameters.
     */
    public static final class StreamMetrics {
        public final int width;
        public final int height;
        public final float frameRate;
        public final int bitrate;
        public final long estimatedBandwidth;
        public final String codecs;
        public final String mimeType;
        public final String playbackState;
        public final long bufferedDurationMs;
        public final boolean is4K;
        public final boolean is1080p;
        public final String tierLabel;

        // Audio Metrics
        public final String audioCodec;
        public final int audioChannels;
        public final int audioSampleRate;
        public final int audioBitrate;
        public final String audioLanguage;
        public final String audioMimeType;
        public final int droppedFrames;
        public final String networkType;

        public StreamMetrics(
                int width,
                int height,
                float frameRate,
                int bitrate,
                long estimatedBandwidth,
                String codecs,
                String mimeType,
                String audioCodec,
                int audioChannels,
                int audioSampleRate,
                int audioBitrate,
                String audioLanguage,
                String audioMimeType,
                String playbackState,
                long bufferedDurationMs
        ) {
            this(width, height, frameRate, bitrate, estimatedBandwidth, codecs, mimeType,
                    audioCodec, audioChannels, audioSampleRate, audioBitrate, audioLanguage,
                    audioMimeType, playbackState, bufferedDurationMs, -1, "Unknown");
        }

        public StreamMetrics(
                int width,
                int height,
                float frameRate,
                int bitrate,
                long estimatedBandwidth,
                String codecs,
                String mimeType,
                String audioCodec,
                int audioChannels,
                int audioSampleRate,
                int audioBitrate,
                String audioLanguage,
                String audioMimeType,
                String playbackState,
                long bufferedDurationMs,
                int droppedFrames,
                String networkType
        ) {
            this.width = width;
            this.height = height;
            this.frameRate = frameRate;
            this.bitrate = bitrate;
            this.estimatedBandwidth = estimatedBandwidth;
            this.codecs = codecs != null ? codecs : "";
            this.mimeType = mimeType != null ? mimeType : "";
            this.audioCodec = audioCodec != null ? audioCodec : "";
            this.audioChannels = audioChannels;
            this.audioSampleRate = audioSampleRate;
            this.audioBitrate = audioBitrate;
            this.audioLanguage = audioLanguage != null ? audioLanguage : "";
            this.audioMimeType = audioMimeType != null ? audioMimeType : "";
            this.playbackState = playbackState != null ? playbackState : "Active";
            this.bufferedDurationMs = bufferedDurationMs;
            this.droppedFrames = droppedFrames;
            this.networkType = networkType != null ? networkType : "Unknown";

            this.is4K = (height >= 2160 || width >= 3840);
            this.is1080p = !is4K && (height >= 1080 || width >= 1920);

            if (is4K) {
                this.tierLabel = "4K UHD (2160p)";
            } else if (is1080p) {
                this.tierLabel = "1080p FHD";
            } else if (height >= 720 || width >= 1280) {
                this.tierLabel = "720p HD";
            } else if (height >= 540) {
                this.tierLabel = "540p SD";
            } else if (height > 0) {
                this.tierLabel = height + "p";
            } else {
                this.tierLabel = "Probing...";
            }
        }

        public String getAudioDescription() {
            if (audioChannels <= 0 && audioCodec.isEmpty()) {
                return "N/A";
            }
            StringBuilder sb = new StringBuilder();
            if (audioChannels >= 6) {
                sb.append("5.1 Surround");
            } else if (audioChannels == 2) {
                sb.append("Stereo");
            } else if (audioChannels == 1) {
                sb.append("Mono");
            } else if (audioChannels > 0) {
                sb.append(audioChannels).append(" ch");
            }

            if (audioBitrate > 0) {
                int kbps = audioBitrate / 1000;
                if (sb.length() > 0) sb.append(" @ ");
                sb.append(kbps).append(" kbps");
            }

            if (!audioCodec.isEmpty()) {
                String c = audioCodec;
                if (c.contains("ec-3") || c.contains("eac3")) {
                    c = "E-AC-3 (Dolby Digital+)";
                } else if (c.contains("ac-3") || c.contains("ac3")) {
                    c = "AC-3 (Dolby Digital)";
                } else if (c.contains("mp4a.40.2") || c.contains("aac")) {
                    c = "AAC";
                }
                if (sb.length() > 0) sb.append(" [").append(c).append("]");
                else sb.append(c);
            }

            return sb.toString();
        }
    }

    /**
     * Represents a single selectable audio track option.
     */
    public static final class AudioTrackOption {
        final TrackGroup trackGroup;
        final Object media3TrackGroup;
        final int trackIndex;
        final int groupIndex;
        final boolean isSelected;
        final int channelCount;
        final int sampleRate;
        final int bitrate;
        final String codecs;
        final String language;
        final String label;
        final String mimeType;

        // ExoPlayer v2 Constructor
        AudioTrackOption(
                TrackGroup trackGroup,
                int trackIndex,
                int groupIndex,
                boolean isSelected,
                int channelCount,
                int sampleRate,
                int bitrate,
                String codecs,
                String language,
                String label,
                String mimeType
        ) {
            this.trackGroup = trackGroup;
            this.media3TrackGroup = null;
            this.trackIndex = trackIndex;
            this.groupIndex = groupIndex;
            this.isSelected = isSelected;
            this.channelCount = channelCount;
            this.sampleRate = sampleRate;
            this.bitrate = bitrate;
            this.codecs = codecs != null ? codecs : "";
            this.language = language != null ? language : "";
            this.label = label != null ? label : "";
            this.mimeType = mimeType != null ? mimeType : "";
        }

        // Media3 Constructor
        AudioTrackOption(
                Object media3TrackGroup,
                int trackIndex,
                int groupIndex,
                boolean isSelected,
                int channelCount,
                int sampleRate,
                int bitrate,
                String codecs,
                String language,
                String label,
                String mimeType
        ) {
            this.trackGroup = null;
            this.media3TrackGroup = media3TrackGroup;
            this.trackIndex = trackIndex;
            this.groupIndex = groupIndex;
            this.isSelected = isSelected;
            this.channelCount = channelCount;
            this.sampleRate = sampleRate;
            this.bitrate = bitrate;
            this.codecs = codecs != null ? codecs : "";
            this.language = language != null ? language : "";
            this.label = label != null ? label : "";
            this.mimeType = mimeType != null ? mimeType : "";
        }

        // Backwards compatibility constructor
        AudioTrackOption(
                int trackIndex,
                boolean isSelected,
                int channelCount,
                int sampleRate,
                int bitrate,
                String codecs,
                String language,
                String label,
                String mimeType
        ) {
            this((TrackGroup) null, trackIndex, 0, isSelected, channelCount, sampleRate, bitrate, codecs, language, label, mimeType);
        }

        public String getDisplayLabel() {
            StringBuilder sb = new StringBuilder();
            if (!label.isEmpty()) {
                sb.append(label).append(" ");
            } else {
                sb.append("Track ").append(groupIndex + 1).append(": ");
            }
            if (!language.isEmpty()) {
                sb.append("(").append(language.toUpperCase(Locale.US)).append(") ");
            }
            if (channelCount >= 6) {
                sb.append("5.1 Surround ");
            } else if (channelCount == 2) {
                sb.append("Stereo ");
            } else if (channelCount > 0) {
                sb.append(channelCount).append("ch ");
            }

            if (bitrate > 0) {
                sb.append("@ ").append(bitrate / 1000).append(" kbps ");
            }

            if (!codecs.isEmpty()) {
                String c = codecs;
                if (c.contains("ec-3") || c.contains("eac3")) c = "E-AC-3";
                else if (c.contains("ac-3") || c.contains("ac3")) c = "AC-3";
                else if (c.contains("mp4a") || c.contains("aac")) c = "AAC";
                sb.append("[").append(c).append("] ");
            }

            if (isSelected) {
                sb.append("[ACTIVE]");
            }
            return sb.toString().trim();
        }
    }

    /**
     * Represents a single selectable video track option from ExoPlayer's Tracks.
     */
    private static final class VideoTrackOption {
        final TrackGroup trackGroup;
        final int trackIndex;
        final Format format;
        final int width;
        final int height;
        final int bitrate;
        final float frameRate;
        final boolean isCurrentlyPlaying;
        final boolean isSupported;
        final String codecs;

        // ExoPlayer v2 constructor
        VideoTrackOption(
                TrackGroup trackGroup,
                int trackIndex,
                Format format,
                boolean isCurrentlyPlaying,
                boolean isSupported
        ) {
            this.trackGroup = trackGroup;
            this.trackIndex = trackIndex;
            this.format = format;
            this.width = format != null && format.width > 0 ? format.width : 0;
            this.height = format != null && format.height > 0 ? format.height : 0;
            this.bitrate = format != null && format.bitrate > 0 ? format.bitrate
                    : (format != null && format.peakBitrate > 0 ? format.peakBitrate
                    : (format != null && format.averageBitrate > 0 ? format.averageBitrate : 0));
            this.frameRate = format != null && format.frameRate > 0 ? format.frameRate : 0f;
            this.isCurrentlyPlaying = isCurrentlyPlaying;
            this.isSupported = isSupported;
            this.codecs = format != null && format.codecs != null ? format.codecs : "";
        }

        // Generic / Media3 constructor
        VideoTrackOption(
                int trackIndex,
                boolean isCurrentlyPlaying,
                boolean isSupported,
                int width,
                int height,
                float frameRate,
                int bitrate,
                String codecs
        ) {
            this.trackGroup = null;
            this.trackIndex = trackIndex;
            this.format = null;
            this.width = width;
            this.height = height;
            this.frameRate = frameRate;
            this.bitrate = bitrate;
            this.isCurrentlyPlaying = isCurrentlyPlaying;
            this.isSupported = isSupported;
            this.codecs = codecs != null ? codecs : "";
        }

        String getDisplayLabel() {
            StringBuilder sb = new StringBuilder();
            if (height >= 2160) {
                sb.append(height).append("p (4K UHD)");
            } else if (height > 0) {
                sb.append(height).append("p");
            } else if (width > 0) {
                sb.append(width).append("w");
            } else {
                sb.append("Track ").append(trackIndex + 1);
            }

            if (frameRate > 0f) {
                int fps = Math.round(frameRate);
                if (fps >= 48) {
                    sb.append(fps); // e.g. 2160p50, 1080p50, 720p50
                } else {
                    sb.append(" ").append(fps).append("fps");
                }
            }

            if (bitrate > 0) {
                double mbps = bitrate / 1_000_000.0;
                sb.append(String.format(Locale.US, "  -  %.2f Mbps", mbps));
            }

            if (codecs != null && !codecs.isEmpty()) {
                if (codecs.contains("hev") || codecs.contains("hvc")) {
                    sb.append(" (HEVC)");
                } else if (codecs.contains("avc")) {
                    sb.append(" (AVC)");
                }
                if (codecs.contains("hdr") || codecs.contains("dovi") || codecs.contains("dvhe")) {
                    sb.append(" [HDR]");
                }
            }

            if (isCurrentlyPlaying) {
                sb.append("  [Playing]");
            }

            return sb.toString();
        }

        String getShortBadgeLabel() {
            if (height >= 2160) {
                int fps = Math.round(frameRate);
                if (fps >= 48) {
                    return "4K" + fps;
                }
                return "4K";
            }
            if (height > 0) {
                int fps = Math.round(frameRate);
                if (fps >= 48) {
                    return height + "p" + fps;
                }
                return height + "p";
            }
            if (bitrate > 0) {
                return String.format(Locale.US, "%.1fM", bitrate / 1_000_000.0);
            }
            return "MAN";
        }
    }

    // =========================================================================
    // Bytecode Hook Entrypoints
    // =========================================================================

    /**
     * Called at the end of {@code Lpx/e;-><init>(DefaultTrackSelector, Lpx/g, Lpx/i)}.
     */
    public static void onTrackSelectorInit(DefaultTrackSelector selector) {
        if (selector != null) {
            currentTrackSelector = selector;
            try {
                DefaultTrackSelector.Parameters.Builder builder = selector.buildUponParameters();
                builder.clearViewportSizeConstraints();
                builder.clearVideoSizeConstraints();
                builder.setExceedVideoConstraintsIfNecessary(true);
                builder.setExceedRendererCapabilitiesIfNecessary(true);
                selector.setParameters(builder.build());
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Called from {@code LHv/P;->R1(Lcom/google/android/exoplayer2/ExoPlayer;)V} when the player is attached.
     */
    public static void onExoPlayerAttached(ExoPlayer player) {
        if (player != null) {
            currentPlayerRef = new WeakReference<>(player);
            try {
                Tracks tr = player.getCurrentTracks();
                if (tr != null && tr.getGroups() != null && !tr.getGroups().isEmpty()) {
                    currentTracks = tr;
                }
            } catch (Throwable ignored) {
            }
            updateAllQualityBadges();
            try {
                Class<?> listenerClass = Class.forName("com.google.android.exoplayer2.Player$Listener");
                Object listenerProxy = Proxy.newProxyInstance(
                        listenerClass.getClassLoader(),
                        new Class<?>[]{listenerClass},
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                                String name = method.getName();
                                if ("onTracksChanged".equals(name) && args != null && args.length >= 1) {
                                    if (args[0] instanceof Tracks) {
                                        onTracksChanged(currentTrackSelector, (Tracks) args[0]);
                                    }
                                } else if ("onPlaybackStateChanged".equals(name) || "onIsPlayingChanged".equals(name)) {
                                    updateAllQualityBadges();
                                }
                                return null;
                            }
                        }
                );
                Method addListenerMethod = player.getClass().getMethod("addListener", listenerClass);
                addListenerMethod.invoke(player, listenerProxy);
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * TV hook: Intercepts VideoCapabilitiesPlugin.execute to spoof 4K, 60fps, Widevine L1,
     * HDCP 2.2, HEVC, and HDR support on Android TV.
     */
    public static boolean onVideoCapabilitiesExecute(String action, org.json.JSONArray args, Object callback) {
        if (action == null || callback == null) {
            return false;
        }
        try {
            switch (action) {
                case "IS_4K_SUPPORTED": {
                    org.json.JSONObject result = new org.json.JSONObject();
                    result.put("is4KSupported", true);
                    org.json.JSONArray framerates = new org.json.JSONArray();
                    framerates.put(24.0);
                    framerates.put(25.0);
                    framerates.put(30.0);
                    framerates.put(50.0);
                    framerates.put(60.0);
                    result.put("supportedFramerates", framerates);
                    invokeCallbackSuccess(callback, result);
                    return true;
                }
                case "IS_WIDEVINE_L1_SUPPORTED": {
                    org.json.JSONObject result = new org.json.JSONObject();
                    result.put("isWidevineL1Supported", true);
                    invokeCallbackSuccess(callback, result);
                    return true;
                }
                case "GET_HDCP_LEVEL": {
                    org.json.JSONObject result = new org.json.JSONObject();
                    result.put("maxHdcpLevel", "HDCP_V2_2");
                    result.put("connectedHdcpLevel", "HDCP_V2_2");
                    invokeCallbackSuccess(callback, result);
                    return true;
                }
                case "IS_HEVC_SUPPORTED": {
                    org.json.JSONObject result = new org.json.JSONObject();
                    result.put("isHevcSupported", true);
                    invokeCallbackSuccess(callback, result);
                    return true;
                }
                case "IS_HEVC_MAIN10_LEVEL51_SUPPORTED": {
                    org.json.JSONObject result = new org.json.JSONObject();
                    result.put("isHevcMain10Level51Supported", true);
                    invokeCallbackSuccess(callback, result);
                    return true;
                }
                case "GET_HDR_SUPPORTED_TYPES": {
                    org.json.JSONObject result = new org.json.JSONObject();
                    org.json.JSONArray types = new org.json.JSONArray();
                    types.put(1); // DOLBY_VISION
                    types.put(2); // HDR10
                    types.put(3); // HLG
                    types.put(4); // HDR10_PLUS
                    result.put("hdrSupportedTypes", types);
                    invokeCallbackSuccess(callback, result);
                    return true;
                }
                case "GET_VIDEO_CODECS": {
                    String rawMime = (args != null && args.length() > 0) ? args.optString(0, "video/hevc") : "video/hevc";
                    String mimeType = rawMime != null ? rawMime.trim().toLowerCase(java.util.Locale.ROOT) : "video/hevc";
                    boolean secureOnly = (args != null && args.length() > 1) && args.optBoolean(1, false);

                    org.json.JSONObject response = new org.json.JSONObject();
                    org.json.JSONArray codecs = new org.json.JSONArray();

                    String hwBaseName = findRealHardwareDecoderBaseName(mimeType);

                    if ("video/hevc".equals(mimeType)) {
                        String baseName = hwBaseName != null ? hwBaseName : "OMX.amlogic.hevc.decoder.awesome";
                        org.json.JSONObject codecSecure = new org.json.JSONObject();
                        codecSecure.put("name", baseName + ".secure");
                        codecSecure.put("secure", true);
                        codecSecure.put("hardwareAccelerated", true);
                        codecSecure.put("adaptive", true);
                        codecSecure.put("tunneled", false);
                        codecSecure.put("maxWidth", 3840);
                        codecSecure.put("maxHeight", 2160);
                        codecSecure.put("maxFrameRate", 60);
                        codecSecure.put("maxBitrate", 160000000);

                        org.json.JSONArray pl = new org.json.JSONArray();
                        pl.put(createProfileLevel(1, "HEVCProfileMain", 65536, "HEVCMainTierLevel51"));
                        pl.put(createProfileLevel(1, "HEVCProfileMain", 131072, "HEVCHighTierLevel51"));
                        pl.put(createProfileLevel(1, "HEVCProfileMain", 262144, "HEVCMainTierLevel52"));
                        pl.put(createProfileLevel(2, "HEVCProfileMain10", 65536, "HEVCMainTierLevel51"));
                        pl.put(createProfileLevel(2, "HEVCProfileMain10", 131072, "HEVCHighTierLevel51"));
                        pl.put(createProfileLevel(2, "HEVCProfileMain10", 262144, "HEVCMainTierLevel52"));
                        pl.put(createProfileLevel(4096, "HEVCProfileMain10HDR10", 65536, "HEVCMainTierLevel51"));
                        pl.put(createProfileLevel(4096, "HEVCProfileMain10HDR10", 131072, "HEVCHighTierLevel51"));
                        pl.put(createProfileLevel(8192, "HEVCProfileMain10HDR10Plus", 131072, "HEVCHighTierLevel51"));
                        codecSecure.put("profileLevels", pl);
                        codecs.put(codecSecure);

                        if (!secureOnly) {
                            org.json.JSONObject codecNonSecure = new org.json.JSONObject(codecSecure.toString());
                            codecNonSecure.put("name", baseName);
                            codecNonSecure.put("secure", false);
                            codecs.put(codecNonSecure);
                        }
                    } else if ("video/avc".equals(mimeType)) {
                        String baseName = hwBaseName != null ? hwBaseName : "OMX.amlogic.avc.decoder.awesome";
                        org.json.JSONObject avcSecure = new org.json.JSONObject();
                        avcSecure.put("name", baseName + ".secure");
                        avcSecure.put("secure", true);
                        avcSecure.put("hardwareAccelerated", true);
                        avcSecure.put("adaptive", true);
                        avcSecure.put("tunneled", false);
                        avcSecure.put("maxWidth", 3840);
                        avcSecure.put("maxHeight", 2160);
                        avcSecure.put("maxFrameRate", 60);
                        avcSecure.put("maxBitrate", 100000000);

                        org.json.JSONArray pl = new org.json.JSONArray();
                        pl.put(createProfileLevel(8, "AVCProfileHigh", 65536, "AVCLevel52"));
                        pl.put(createProfileLevel(8, "AVCProfileHigh", 32768, "AVCLevel51"));
                        pl.put(createProfileLevel(2, "AVCProfileMain", 32768, "AVCLevel51"));
                        pl.put(createProfileLevel(1, "AVCProfileBaseline", 32768, "AVCLevel51"));
                        avcSecure.put("profileLevels", pl);
                        codecs.put(avcSecure);

                        if (!secureOnly) {
                            org.json.JSONObject avcNonSecure = new org.json.JSONObject(avcSecure.toString());
                            avcNonSecure.put("name", baseName);
                            avcNonSecure.put("secure", false);
                            codecs.put(avcNonSecure);
                        }
                    } else {
                        return false;
                    }

                    response.put("codecs", codecs);
                    invokeCallbackSuccess(callback, response);
                    android.util.Log.i("MorpheKayo", "Spoofed GET_VIDEO_CODECS for " + mimeType);
                    return true;
                }
                default:
                    return false;
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error in onVideoCapabilitiesExecute", t);
            return false;
        }
    }

    private static String findRealHardwareDecoderBaseName(String mimeType) {
        try {
            android.media.MediaCodecList list = new android.media.MediaCodecList(android.media.MediaCodecList.ALL_CODECS);
            android.media.MediaCodecInfo[] infos = list.getCodecInfos();
            if (infos == null) return null;
            for (android.media.MediaCodecInfo info : infos) {
                if (info == null || info.isEncoder()) continue;
                String name = info.getName();
                if (name == null) continue;
                String lower = name.toLowerCase(java.util.Locale.ROOT);
                if (lower.startsWith("c2.android.") || lower.startsWith("omx.google.") || lower.contains(".sw.")) {
                    continue;
                }
                String[] types = info.getSupportedTypes();
                if (types == null) continue;
                for (String t : types) {
                    if (t != null && t.equalsIgnoreCase(mimeType)) {
                        if (name.endsWith(".secure")) {
                            return name.substring(0, name.length() - 7);
                        }
                        return name;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static org.json.JSONObject createProfileLevel(int profile, String profileName, int level, String levelName) throws org.json.JSONException {
        org.json.JSONObject obj = new org.json.JSONObject();
        obj.put("profile", profile);
        obj.put("profileName", profileName);
        obj.put("level", level);
        obj.put("levelName", levelName);
        return obj;
    }

    /**
     * TV hook: Returns spoofed 4K UHD display resolution (3840x2160) for
     * VideoPlugin.getPhysicalDisplaySize() so Kayo TV's web layer requests 4K UHD stream renditions.
     */
    public static org.json.JSONObject getPhysicalDisplaySizeSpoof() {
        try {
            org.json.JSONObject result = new org.json.JSONObject();
            result.put("x", 3840);
            result.put("y", 2160);
            android.util.Log.i("MorpheKayo", "getPhysicalDisplaySizeSpoof returned 3840x2160 (4K UHD)");
            return result;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * TV hook: Configures DefaultTrackSelector.Parameters.Builder (or TrackSelectionParameters.Builder)
     * for 4K UHD playback by unlimiting viewport constraints, setting video resolution/bitrate bounds
     * so all manifest tracks up to the selected quality (including 4K HEVC) are eligible, and delegating
     * exact single-track locking to overrideSelectTracksResult.
     */
    public static void configureTvTrackParametersBuilder(Object builder) {
        if (builder == null) {
            return;
        }
        try {
            Class<?> bClass = builder.getClass();
            setFieldSafe(bClass, builder, "isViewportSizeLimitedByPhysicalDisplaySize", false);
            setFieldSafe(bClass, builder, "viewportWidth", Integer.MAX_VALUE);
            setFieldSafe(bClass, builder, "viewportHeight", Integer.MAX_VALUE);
            setFieldSafe(bClass, builder, "viewportOrientationMayChange", false);
            setFieldSafe(bClass, builder, "minVideoWidth", 0);
            setFieldSafe(bClass, builder, "minVideoHeight", (selectedHeight >= 2160 || selectedHeight == QUALITY_AUTO) ? 1080 : Math.min(1080, selectedHeight));
            setFieldSafe(bClass, builder, "minVideoFrameRate", 0);
            setFieldSafe(bClass, builder, "minVideoBitrate", 0);
            setFieldSafe(bClass, builder, "maxVideoWidth", Integer.MAX_VALUE);
            int maxH = (selectedHeight > 0 && selectedHeight < 2160) ? selectedHeight : Integer.MAX_VALUE;
            int maxB = (selectedHeight > 0 && selectedHeight < 2160 && selectedBitrate > 0) ? selectedBitrate : Integer.MAX_VALUE;
            setFieldSafe(bClass, builder, "maxVideoHeight", maxH);
            setFieldSafe(bClass, builder, "maxVideoFrameRate", Integer.MAX_VALUE);
            setFieldSafe(bClass, builder, "maxVideoBitrate", maxB);
            setFieldSafe(bClass, builder, "exceedVideoConstraintsIfNecessary", true);
            setFieldSafe(bClass, builder, "exceedRendererCapabilitiesIfNecessary", true);
            setFieldSafe(bClass, builder, "allowVideoNonSeamlessAdaptiveness", true);
            setFieldSafe(bClass, builder, "allowVideoMixedMimeTypeAdaptiveness", true);
            setFieldSafe(bClass, builder, "tunnelingEnabled", false);
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error in configureTvTrackParametersBuilder", t);
        }
    }

    /**
     * TV hook: Sanitizes LoadArguments JSON so that useWidevineL3 is false, tunneling is disabled,
     * and maxVideoBitrate is unconstrained.
     */
    public static void sanitizeLoadArgumentsJson(org.json.JSONObject json) {
        if (json == null) {
            return;
        }
        try {
            json.put("useWidevineL3", false);
            json.put("maxVideoBitrate", Integer.MAX_VALUE);
            json.put("tunnellingEnabled", false);
            json.put("applyTunnelingTransitionFix", false);
            android.util.Log.i("MorpheKayo", "Sanitized LoadArguments JSON: useWidevineL3=false, tunnellingEnabled=false, maxVideoBitrate=MAX");
        } catch (Throwable ignored) {
        }
    }

    /**
     * TV hook: Sanitizes LoadArguments so that useWidevineL3 is false, tunneling is disabled,
     * and maxVideoBitrate is unconstrained.
     */
    public static void sanitizeLoadArguments(Object loadArguments) {
        if (loadArguments == null) {
            return;
        }
        try {
            Class<?> clazz = loadArguments.getClass();
            setFieldSafe(clazz, loadArguments, "useWidevineL3", false);
            setFieldSafe(clazz, loadArguments, "maxVideoBitrate", Integer.MAX_VALUE);
            setFieldSafe(clazz, loadArguments, "isTunnellingEnabled", false);
            setFieldSafe(clazz, loadArguments, "applyTunnelingTransitionFix", false);
            android.util.Log.i("MorpheKayo", "Sanitized LoadArguments: useWidevineL3=false, isTunnellingEnabled=false, maxVideoBitrate=MAX");
        } catch (Throwable ignored) {
        }
    }

    /**
     * Mobile & TV hook: Configures DefaultLoadControl thresholds for sub-2s time-to-first-frame
     * and deep 50s-120s forward buffer + 30s keyframe back-buffer on 1080p50 / 4K50 streams.
     */
    public static void configureDefaultLoadControl(Object loadControl) {
        if (loadControl == null) {
            return;
        }
        try {
            Class<?> clazz = loadControl.getClass();
            // 1.5s fast-startup buffer for immediate 1080p50/4K50 time-to-first-frame
            setFieldSafe(clazz, loadControl, "bufferForPlaybackUs", 1_500_000L);
            // 3.0s rebuffer recovery threshold
            setFieldSafe(clazz, loadControl, "bufferForPlaybackAfterRebufferUs", 3_000_000L);
            // 50s min / 120s max forward buffer and 30s keyframe-aligned back buffer
            setFieldSafe(clazz, loadControl, "minBufferUs", 50_000_000L);
            setFieldSafe(clazz, loadControl, "maxBufferUs", 120_000_000L);
            setFieldSafe(clazz, loadControl, "backBufferDurationUs", 30_000_000L);
            setFieldSafe(clazz, loadControl, "retainBackBufferFromKeyframe", true);
            setFieldSafe(clazz, loadControl, "prioritizeTimeOverSizeThresholds", true);
            android.util.Log.i("MorpheKayo", "Configured DefaultLoadControl: playback=1.5s, rebuffer=3s, min=50s, max=120s, back=30s");
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error in configureDefaultLoadControl", t);
        }
    }

    /**
     * Mobile & TV hook: Configures DefaultRenderersFactory to always enable decoder fallback
     * so transient hardware codec profile rejections never abort 1080p50 / 4K50 playback.
     */
    public static void configureRenderersFactory(Object renderersFactory) {
        if (renderersFactory == null) {
            return;
        }
        try {
            Class<?> clazz = renderersFactory.getClass();
            setFieldSafe(clazz, renderersFactory, "enableDecoderFallback", true);
            try {
                Method m = clazz.getMethod("setEnableDecoderFallback", boolean.class);
                m.invoke(renderersFactory, true);
            } catch (Throwable ignored) {
            }
            try {
                Method mAsync = clazz.getMethod("forceEnableMediaCodecAsynchronousQueueing");
                mAsync.invoke(renderersFactory);
            } catch (Throwable ignored) {
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * TV hook: Configures DefaultLivePlaybackSpeedControl so ExoPlayer never speeds up live playback
     * above 1.0x (default 1.03x), which otherwise drains the forward buffer and causes repeated rebuffering.
     */
    public static void configureLivePlaybackSpeedControl(Object speedControl) {
        if (speedControl == null) {
            return;
        }
        try {
            Class<?> clazz = speedControl.getClass();
            setFieldSafe(clazz, speedControl, "maxPlaybackSpeed", 1.0f);
            setFieldSafe(clazz, speedControl, "fallbackMaxPlaybackSpeed", 1.0f);
            setFieldSafe(clazz, speedControl, "minPlaybackSpeed", 0.97f);
            setFieldSafe(clazz, speedControl, "fallbackMinPlaybackSpeed", 0.97f);
            long minOffset = getLongField(clazz, speedControl, "minTargetLiveOffsetUs", 0L);
            if (minOffset < 10_000_000L) {
                setFieldSafe(clazz, speedControl, "minTargetLiveOffsetUs", 10_000_000L);
            }
            long currentTarget = getLongField(clazz, speedControl, "currentTargetLiveOffsetUs", 0L);
            if (currentTarget > 0L && currentTarget < 14_000_000L) {
                setFieldSafe(clazz, speedControl, "currentTargetLiveOffsetUs", 14_000_000L);
            }
            android.util.Log.i("MorpheKayo", "Configured DefaultLivePlaybackSpeedControl: maxPlaybackSpeed=1.0f, minTargetLiveOffsetUs>=10s");
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error in configureLivePlaybackSpeedControl", t);
        }
    }

    /**
     * TV hook: Sanitizes ExoPlayerConfig JSON before parsing so live streams join with a safe 14s
     * target offset and do not clip the presentation delay to the packager edge.
     */
    public static void sanitizeExoPlayerConfigJson(org.json.JSONObject json) {
        if (json == null) {
            return;
        }
        try {
            json.put("useRevisedPresentationDelay", false);
            long liveTarget = json.optLong("liveConfigurationTargetOffsetSeconds", 0L);
            if (liveTarget < 14L) {
                json.put("liveConfigurationTargetOffsetSeconds", 14L);
            }
            long fallbackTarget = json.optLong("fallbackTargetLiveOffsetSeconds", 0L);
            if (fallbackTarget < 14L) {
                json.put("fallbackTargetLiveOffsetSeconds", 14L);
            }
            json.put("hevcSecureInputCompressionRatio", 2);
            android.util.Log.i("MorpheKayo", "Sanitized ExoPlayerConfig JSON: useRevisedPresentationDelay=false, liveOffset>=14s");
        } catch (Throwable ignored) {
        }
    }

    /**
     * TV hook: Sanitizes ExoPlayerConfig instance defaults.
     */
    public static void sanitizeExoPlayerConfig(Object config) {
        if (config == null) {
            return;
        }
        try {
            Class<?> clazz = config.getClass();
            setFieldSafe(clazz, config, "useRevisedPresentationDelay", false);
            long liveTarget = getLongField(clazz, config, "liveConfigurationTargetOffsetSeconds", 0L);
            if (liveTarget < 14L) {
                setFieldSafe(clazz, config, "liveConfigurationTargetOffsetSeconds", 14L);
            }
            long fallbackTarget = getLongField(clazz, config, "fallbackTargetLiveOffsetSeconds", 0L);
            if (fallbackTarget < 14L) {
                setFieldSafe(clazz, config, "fallbackTargetLiveOffsetSeconds", 14L);
            }
            setFieldSafe(clazz, config, "hevcSecureInputCompressionRatio", 2);
        } catch (Throwable ignored) {
        }
    }

    /**
     * TV hook: Clamps the bandwidth estimate reported to JS via Notificator.onBandwidthSample
     * to at least 80 Mbps so the web player never reacts to transient segment download dips.
     */
    public static long overrideReportedBandwidth(long bitrateEstimate) {
        return Math.max(bitrateEstimate, 80_000_000L);
    }

    /**
     * TV hook: Applies resolution and bitrate selection directly to the active Media3 ExoPlayer instance
     * when the user explicitly selects a quality in the dialog.
     */
    public static void applyMedia3Quality(final Object player, final int targetHeight, final int targetBitrate) {
        if (player == null) {
            return;
        }
        Looper appLooper = null;
        try {
            Field fLooper = player.getClass().getField("applicationLooper");
            appLooper = (Looper) fLooper.get(player);
        } catch (Throwable ignored) {
        }
        if (appLooper == null) {
            appLooper = Looper.getMainLooper();
        }
        if (Looper.myLooper() != appLooper) {
            new Handler(appLooper).post(new Runnable() {
                @Override
                public void run() {
                    applyMedia3Quality(player, targetHeight, targetBitrate);
                }
            });
            return;
        }

        try {
            // 1. Immediately update any active AdaptiveTrackSelection in playbackInfo.trackSelectorResult.selections
            try {
                Object pbInfo = getFieldAny(player, "playbackInfo");
                if (pbInfo != null) {
                    Object tsResult = getFieldAny(pbInfo, "trackSelectorResult");
                    if (tsResult != null) {
                        Object[] selections = (Object[]) getFieldAny(tsResult, "selections");
                        if (selections != null) {
                            for (Object sel : selections) {
                                if (sel != null) {
                                    int idx = findLockedIndexInSelection(sel);
                                    if (idx >= 0) {
                                        setFieldSafe(sel.getClass(), sel, "selectedIndex", idx);
                                        setFieldSafe(sel.getClass(), sel, "reason", 2); // C.SELECTION_REASON_MANUAL
                                    }
                                }
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            }

            Object selector = getFieldAny(player, "trackSelector");
            if (selector != null) {
                try {
                    Method getParams = selector.getClass().getMethod("getParameters");
                    Object currentParams = getParams.invoke(selector);
                    if (currentParams != null) {
                        Method buildUpon = currentParams.getClass().getMethod("buildUpon");
                        Object builder = buildUpon.invoke(currentParams);
                        if (builder != null) {
                            configureTvTrackParametersBuilder(builder);
                            Object newParams = null;
                            for (java.lang.reflect.Constructor<?> ctor : currentParams.getClass().getDeclaredConstructors()) {
                                ctor.setAccessible(true);
                                if (ctor.getParameterTypes().length == 1 && ctor.getParameterTypes()[0].isInstance(builder)) {
                                    newParams = ctor.newInstance(builder);
                                    break;
                                }
                            }
                            if (newParams != null) {
                                for (Method m : selector.getClass().getMethods()) {
                                    if ("setParameters".equals(m.getName()) && m.getParameterTypes().length == 1) {
                                        m.invoke(selector, newParams);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                } catch (Throwable ignored) {
                }

                boolean invalidated = false;
                try {
                    Object listener = getFieldAny(selector, "listener");
                    if (listener != null) {
                        Object handler = getFieldAny(listener, "handler");
                        if (handler != null) {
                            Method sendMsg = handler.getClass().getMethod("sendEmptyMessage", int.class);
                            sendMsg.invoke(handler, 10); // MSG_TRACK_SELECTION_INVALIDATED = 10
                            invalidated = true;
                            android.util.Log.i("MorpheKayo", "applyMedia3Quality sent MSG_TRACK_SELECTION_INVALIDATED for height=" + targetHeight);
                        }
                    }
                } catch (Throwable ignored) {
                }
                if (!invalidated) {
                    try {
                        Method inv = selector.getClass().getMethod("invalidate");
                        inv.invoke(selector);
                    } catch (Throwable ignored) {
                    }
                }
            }
            updateAllQualityBadges();
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error in applyMedia3Quality", t);
        }
    }

    private static void invokeCallbackSuccess(Object callback, org.json.JSONObject result) {
        try {
            java.lang.reflect.Method m = callback.getClass().getMethod("success", org.json.JSONObject.class);
            m.invoke(callback, result);
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error invoking PluginCallback.success", t);
        }
    }

    /**
     * TV hook: Overrides max bitrate parameter in DrmPlayer.setMaxVideoBitrate(I)V.
     */
    public static int overrideTvMaxBitrate(int originalBitrate) {
        // Returning 0 causes DrmPlayer to set maxVideoBitrate to Integer.MAX_VALUE (uncapped 4K UHD)
        // while exact track locking is handled cleanly by overrideSelectTracksResult.
        return 0;
    }

    /**
     * TV hook: Captures DrmPlayer instance from DrmPlayer.setMaxVideoBitrate(I)V
     * and extracts playerInstance, bandwidthMeter, and trackSelector.
     */
    public static void onDrmPlayerAttached(Object drmPlayer) {
        if (drmPlayer == null) {
            return;
        }
        try {
            Class<?> c = drmPlayer.getClass();
            Field fPlayer = c.getDeclaredField("playerInstance");
            fPlayer.setAccessible(true);
            Object player = fPlayer.get(drmPlayer);
            if (player != null) {
                onMedia3PlayerAttached(player);
            }

            Field fMeter = c.getDeclaredField("bandwidthMeter");
            fMeter.setAccessible(true);
            Object meter = fMeter.get(drmPlayer);
            if (meter != null) {
                currentBandwidthMeterRef = new WeakReference<>(meter);
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error in onDrmPlayerAttached", t);
        }
    }

    private static Field resolveFieldCached(Class<?> clazz, String fieldName) {
        if (clazz == null || fieldName == null) {
            return null;
        }
        String key = clazz.getName() + "#" + fieldName;
        Field cached = FIELD_CACHE.get(key);
        if (cached != null) {
            return cached;
        }
        if (MISSING_FIELD_CACHE.containsKey(key)) {
            return null;
        }
        Class<?> c = clazz;
        while (c != null && c != Object.class) {
            try {
                Field f = c.getDeclaredField(fieldName);
                f.setAccessible(true);
                FIELD_CACHE.put(key, f);
                return f;
            } catch (NoSuchFieldException e) {
                c = c.getSuperclass();
            } catch (Throwable t) {
                break;
            }
        }
        MISSING_FIELD_CACHE.put(key, Boolean.TRUE);
        return null;
    }

    private static Object getFieldAny(Object target, String fieldName) {
        if (target == null) return null;
        try {
            Field f = resolveFieldCached(target.getClass(), fieldName);
            return f != null ? f.get(target) : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static int findBestTrackIndex(Object[] formats, int targetHeight, int targetBitrate) {
        if (formats == null || formats.length == 0) return -1;
        int exactHeightIndex = -1;
        int exactHeightBitrate = -1;

        int bestAtOrBelowIndex = -1;
        int bestAtOrBelowHeight = -1;
        int bestAtOrBelowBitrate = -1;

        int lowestAboveIndex = -1;
        int lowestAboveHeight = Integer.MAX_VALUE;
        int lowestAboveBitrate = -1;

        for (int i = 0; i < formats.length; i++) {
            Object fmt = formats[i];
            if (fmt == null) continue;
            Class<?> fmtClass = fmt.getClass();
            int h = getIntField(fmtClass, fmt, "height", 0);
            if (h <= 0) continue;
            int b = getIntField(fmtClass, fmt, "bitrate", 0);
            if (b <= 0) b = getIntField(fmtClass, fmt, "peakBitrate", 0);
            if (b <= 0) b = getIntField(fmtClass, fmt, "averageBitrate", 0);

            // 1. Exact height match
            if (h == targetHeight) {
                if (exactHeightIndex == -1) {
                    exactHeightIndex = i;
                    exactHeightBitrate = b;
                } else if (targetBitrate > 0 && Math.abs(b - targetBitrate) < Math.abs(exactHeightBitrate - targetBitrate)) {
                    exactHeightIndex = i;
                    exactHeightBitrate = b;
                } else if (targetBitrate <= 0 && b > exactHeightBitrate) {
                    exactHeightIndex = i;
                    exactHeightBitrate = b;
                }
            }

            // 2. Highest available height <= targetHeight (with highest bitrate at that height)
            if (h <= targetHeight) {
                if (h > bestAtOrBelowHeight || (h == bestAtOrBelowHeight && b > bestAtOrBelowBitrate)) {
                    bestAtOrBelowHeight = h;
                    bestAtOrBelowBitrate = b;
                    bestAtOrBelowIndex = i;
                }
            }

            // 3. Lowest available height > targetHeight (with highest bitrate at that height)
            if (h > targetHeight) {
                if (h < lowestAboveHeight || (h == lowestAboveHeight && b > lowestAboveBitrate)) {
                    lowestAboveHeight = h;
                    lowestAboveBitrate = b;
                    lowestAboveIndex = i;
                }
            }
        }

        if (exactHeightIndex >= 0) return exactHeightIndex;
        if (bestAtOrBelowIndex >= 0) return bestAtOrBelowIndex;
        return lowestAboveIndex;
    }

    /**
     * TV hook: Overrides DefaultTrackSelector.selectTracksForType to restrict the selected
     * track definition to only the chosen rendition when video quality is locked.
     * Because definition.tracks has length 1, Media3 creates a FixedTrackSelection instead
     * of an AdaptiveTrackSelection, preventing ABR downgrades or buffer flushes.
     */
    public static android.util.Pair overrideSelectTracksResult(android.util.Pair pair) {
        if (pair == null || pair.first == null) {
            return pair;
        }
        if (selectedHeight == QUALITY_AUTO) {
            return pair;
        }
        try {
            Object definition = pair.first;
            Object group = getFieldAny(definition, "group");
            if (group == null) {
                return pair;
            }
            int type = getIntField(group.getClass(), group, "type", -1);
            if (type != VIDEO_TRACK_TYPE && type != -1) {
                return pair;
            }
            Object[] formats = (Object[]) getFieldAny(group, "formats");
            if (formats == null || formats.length == 0) {
                return pair;
            }
            boolean isVideo = false;
            for (Object fmt : formats) {
                if (fmt != null && getIntField(fmt.getClass(), fmt, "height", 0) > 0) {
                    isVideo = true;
                    break;
                }
            }
            if (!isVideo) {
                return pair;
            }

            int bestIndex = findBestTrackIndex(formats, selectedHeight, selectedBitrate);
            if (bestIndex >= 0) {
                // Mutate definition.tracks in-place to length 1 so MediaPeriodHolder creates FixedTrackSelection
                setFieldSafe(definition.getClass(), definition, "tracks", new int[]{bestIndex});

                Object newDef = null;
                for (java.lang.reflect.Constructor<?> ctor : definition.getClass().getDeclaredConstructors()) {
                    ctor.setAccessible(true);
                    Class<?>[] pTypes = ctor.getParameterTypes();
                    try {
                        if (pTypes.length == 3 && pTypes[0] == int.class && pTypes[2] == int[].class) {
                            newDef = ctor.newInstance(0, group, new int[]{bestIndex});
                            break;
                        } else if (pTypes.length == 2 && pTypes[1] == int[].class) {
                            newDef = ctor.newInstance(group, new int[]{bestIndex});
                            break;
                        } else if (pTypes.length == 3 && pTypes[1] == int[].class && pTypes[2] == int.class) {
                            newDef = ctor.newInstance(group, new int[]{bestIndex}, 0);
                            break;
                        }
                    } catch (Throwable ignored) {}
                }
                if (newDef != null) {
                    android.util.Log.i("MorpheKayo", "overrideSelectTracksResult: locked track definition to index " + bestIndex + " (" + formats[bestIndex] + ")");
                    return android.util.Pair.create(newDef, pair.second);
                } else {
                    android.util.Log.i("MorpheKayo", "overrideSelectTracksResult: mutated definition.tracks in-place to index " + bestIndex);
                    return pair;
                }
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error in overrideSelectTracksResult", t);
        }
        return pair;
    }

    public static android.util.Pair overrideSelectTracksResult(android.util.Pair pair, int trackType) {
        if (trackType != VIDEO_TRACK_TYPE) {
            return pair;
        }
        return overrideSelectTracksResult(pair);
    }

    /**
     * TV hook: Intercepts ExoTrackSelection$Definition.<init>(int, TrackGroup, int[])
     * and narrows video track arrays to [bestIndex] whenever quality is locked,
     * forcing MediaPeriodHolder.selectTracks to construct a FixedTrackSelection.
     */
    public static int[] overrideDefinitionTracks(Object group, int[] tracks) {
        if (group == null || tracks == null || tracks.length <= 1) {
            return tracks;
        }
        if (selectedHeight == QUALITY_AUTO) {
            return tracks;
        }
        try {
            int type = getIntField(group.getClass(), group, "type", -1);
            if (type != VIDEO_TRACK_TYPE && type != -1) {
                return tracks;
            }
            Object[] formats = (Object[]) getFieldAny(group, "formats");
            if (formats == null || formats.length == 0) {
                return tracks;
            }
            boolean isVideo = false;
            for (Object fmt : formats) {
                if (fmt != null && getIntField(fmt.getClass(), fmt, "height", 0) > 0) {
                    isVideo = true;
                    break;
                }
            }
            if (!isVideo) {
                return tracks;
            }
            int bestIndex = findBestTrackIndex(formats, selectedHeight, selectedBitrate);
            if (bestIndex >= 0) {
                android.util.Log.i("MorpheKayo", "overrideDefinitionTracks: locked TrackGroup to single track index " + bestIndex + " (targetHeight=" + selectedHeight + ")");
                return new int[]{bestIndex};
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error in overrideDefinitionTracks", t);
        }
        return tracks;
    }

    private static int findLockedIndexInSelection(Object trackSelection) {
        if (trackSelection == null || selectedHeight == QUALITY_AUTO) {
            return -1;
        }
        try {
            Object[] formats = (Object[]) getFieldAny(trackSelection, "formats");
            if (formats == null || formats.length == 0) {
                return -1;
            }
            boolean isVideo = false;
            for (Object fmt : formats) {
                if (fmt != null && getIntField(fmt.getClass(), fmt, "height", 0) > 0) {
                    isVideo = true;
                    break;
                }
            }
            if (!isVideo) {
                return -1;
            }
            return findBestTrackIndex(formats, selectedHeight, selectedBitrate);
        } catch (Throwable ignored) {
            return -1;
        }
    }

    public static int overrideSelectedIndex(Object trackSelection) {
        int idx = findLockedIndexInSelection(trackSelection);
        if (idx >= 0) {
            setFieldSafe(trackSelection.getClass(), trackSelection, "selectedIndex", idx);
            setFieldSafe(trackSelection.getClass(), trackSelection, "reason", 2); // C.SELECTION_REASON_MANUAL = 2
            return idx;
        }
        return -1;
    }

    public static int overrideIdealSelectedIndex(Object trackSelection) {
        int idx = findLockedIndexInSelection(trackSelection);
        if (idx >= 0) {
            setFieldSafe(trackSelection.getClass(), trackSelection, "selectedIndex", idx);
            setFieldSafe(trackSelection.getClass(), trackSelection, "reason", 2);
            return idx;
        }
        return -1;
    }

    public static void onUpdateSelectedTrackExit(Object trackSelection) {
        int idx = findLockedIndexInSelection(trackSelection);
        if (idx >= 0) {
            setFieldSafe(trackSelection.getClass(), trackSelection, "selectedIndex", idx);
            setFieldSafe(trackSelection.getClass(), trackSelection, "reason", 2);
        }
    }

    public static boolean onUpdateSelectedTrack(Object trackSelection) {
        int idx = findLockedIndexInSelection(trackSelection);
        if (idx >= 0) {
            setFieldSafe(trackSelection.getClass(), trackSelection, "selectedIndex", idx);
            setFieldSafe(trackSelection.getClass(), trackSelection, "reason", 2); // C.SELECTION_REASON_MANUAL = 2
            return true;
        }
        return false;
    }

    public static int overrideEvaluateQueueSize(Object trackSelection, List<?> queue) {
        if (selectedHeight == QUALITY_AUTO || queue == null) {
            return -1;
        }
        int idx = findLockedIndexInSelection(trackSelection);
        if (idx >= 0) {
            return queue.size();
        }
        return -1;
    }

    private static List<VideoTrackOption> extractVideoTracksFromSelection(Object sel) {
        List<VideoTrackOption> options = new ArrayList<>();
        if (sel == null) return options;
        try {
            Object group = getFieldAny(sel, "group");
            if (group == null) return options;
            int type = getIntField(group.getClass(), group, "type", -1);
            Object[] formats = (Object[]) getFieldAny(group, "formats");
            if (formats == null) return options;

            if (type != VIDEO_TRACK_TYPE) {
                boolean hasVideo = false;
                for (Object fmt : formats) {
                    if (fmt != null && getIntField(fmt.getClass(), fmt, "height", 0) > 0) {
                        hasVideo = true;
                        break;
                    }
                }
                if (!hasVideo) return options;
            }

            int activeIdx = -1;
            try {
                Method m = sel.getClass().getMethod("getSelectedIndex");
                activeIdx = (Integer) m.invoke(sel);
            } catch (Throwable ignored) {
                activeIdx = getIntField(sel.getClass(), sel, "selectedIndex", -1);
            }
            int[] tracks = (int[]) getFieldAny(sel, "tracks");
            int groupTrackIdx = (tracks != null && activeIdx >= 0 && activeIdx < tracks.length) ? tracks[activeIdx] : activeIdx;

            for (int i = 0; i < formats.length; i++) {
                Object fmt = formats[i];
                if (fmt == null) continue;
                Class<?> fClass = fmt.getClass();
                int width = getIntField(fClass, fmt, "width", 0);
                int height = getIntField(fClass, fmt, "height", 0);
                float frameRate = getFloatField(fClass, fmt, "frameRate", 0f);
                int bitrate = getIntField(fClass, fmt, "bitrate", 0);
                if (bitrate <= 0) bitrate = getIntField(fClass, fmt, "peakBitrate", 0);
                if (bitrate <= 0) bitrate = getIntField(fClass, fmt, "averageBitrate", 0);
                String codecs = getStringField(fClass, fmt, "codecs", "");
                boolean isCur = (i == groupTrackIdx);
                options.add(new VideoTrackOption(i, isCur, true, width, height, frameRate, bitrate, codecs));
            }
        } catch (Throwable ignored) {
        }
        return options;
    }

    private static List<AudioTrackOption> extractAudioTracksFromSelection(Object sel) {
        List<AudioTrackOption> options = new ArrayList<>();
        if (sel == null) return options;
        try {
            Object group = getFieldAny(sel, "group");
            if (group == null) return options;
            int type = getIntField(group.getClass(), group, "type", -1);
            if (type != 1) return options; // 1 = Audio

            Object[] formats = (Object[]) getFieldAny(group, "formats");
            if (formats == null) return options;

            int activeIdx = -1;
            try {
                Method m = sel.getClass().getMethod("getSelectedIndex");
                activeIdx = (Integer) m.invoke(sel);
            } catch (Throwable ignored) {
                activeIdx = getIntField(sel.getClass(), sel, "selectedIndex", -1);
            }
            int[] tracks = (int[]) getFieldAny(sel, "tracks");
            int groupTrackIdx = (tracks != null && activeIdx >= 0 && activeIdx < tracks.length) ? tracks[activeIdx] : activeIdx;

            for (int i = 0; i < formats.length; i++) {
                Object fmt = formats[i];
                if (fmt == null) continue;
                Class<?> fClass = fmt.getClass();
                int channelCount = getIntField(fClass, fmt, "channelCount", 0);
                int sampleRate = getIntField(fClass, fmt, "sampleRate", 0);
                int bitrate = getIntField(fClass, fmt, "bitrate", 0);
                if (bitrate <= 0) bitrate = getIntField(fClass, fmt, "averageBitrate", 0);
                if (bitrate <= 0) bitrate = getIntField(fClass, fmt, "peakBitrate", 0);
                String codecs = getStringField(fClass, fmt, "codecs", "");
                String language = getStringField(fClass, fmt, "language", "");
                String label = getStringField(fClass, fmt, "label", "");
                String sampleMimeType = getStringField(fClass, fmt, "sampleMimeType", "");
                boolean isCur = (i == groupTrackIdx);
                options.add(new AudioTrackOption(group, i, 0, isCur, channelCount, sampleRate, bitrate, codecs, language, label, sampleMimeType));
            }
        } catch (Throwable ignored) {
        }
        return options;
    }

    /**
     * TV hook: Intercepts ExoPlayerEventsListener.onTracksChanged(Tracks)
     * to update tracks, player, and live stats directly as soon as rendition starts.
     */
    public static void onTvTracksChanged(Object tracks, Object listener) {
        isTvStreamActive = true;
        if (tracks != null) {
            onMedia3TracksChanged(tracks);
        }
        if (listener != null) {
            try {
                Field fPlayer = listener.getClass().getDeclaredField("player");
                fPlayer.setAccessible(true);
                Object drmPlayer = fPlayer.get(listener);
                if (drmPlayer != null) {
                    onDrmPlayerAttached(drmPlayer);
                }
            } catch (Throwable ignored) {
            }
        }
        Activity act = currentTvActivityRef != null ? currentTvActivityRef.get() : null;
        if (act != null) {
            loadPrefsIfNeeded(act);
            ensureTvQualityButtonAttached(act);
            showTvQualityButtonBriefly();
        }
    }

    /**
     * TV hook: Captures active PlayerView and Media3 ExoPlayer instance from PlayerView.setPlayer(ExoPlayer).
     * Attaches and initializes the Android TV in-player Quality button.
     */
    public static void onTvPlayerViewSetPlayer(final View playerView, final Object player) {
        if (playerView != null) {
            loadPrefsIfNeeded(playerView.getContext());
            currentTvPlayerViewRef = new WeakReference<>(playerView);
            Activity act = findActivity(playerView.getContext());
            if (act != null) {
                currentTvActivityRef = new WeakReference<>(act);
            }
        }
        if (player != null) {
            isTvStreamActive = true;
            onMedia3PlayerAttached(player);
            mainHandler.post(new Runnable() {
                @Override
                public void run() {
                    Activity act = currentTvActivityRef != null ? currentTvActivityRef.get() : null;
                    if (act == null && playerView != null) {
                        act = findActivity(playerView.getContext());
                        if (act != null) {
                            currentTvActivityRef = new WeakReference<>(act);
                        }
                    }
                    if (act != null) {
                        ensureTvQualityButtonAttached(act);
                    }
                }
            });
        } else {
            isTvStreamActive = false;
            hideTvQualityButton();
            hideDiagnosticsOverlay();
        }
    }

    /**
     * TV hook: Captures active Media3 ExoPlayer instance from PlayerView.setPlayer(ExoPlayer) or DrmPlayer.
     */
    public static void onMedia3PlayerAttached(final Object player) {
        if (player == null) {
            return;
        }
        Object existing = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
        if (existing == player) {
            return;
        }
        currentMedia3PlayerRef = new WeakReference<>(player);
        android.util.Log.i("MorpheKayo", "Media3 ExoPlayer attached: " + player.getClass().getName());

        try {
            Field fMeter = player.getClass().getField("bandwidthMeter");
            Object meter = fMeter.get(player);
            if (meter != null) {
                currentBandwidthMeterRef = new WeakReference<>(meter);
                android.util.Log.i("MorpheKayo", "Captured bandwidthMeter from Media3 player");
            }
        } catch (Throwable ignored) {
        }

        try {
            Field fInfo = player.getClass().getField("playbackInfo");
            Object pbInfo = fInfo.get(player);
            if (pbInfo != null) {
                Field fResult = pbInfo.getClass().getField("trackSelectorResult");
                Object res = fResult.get(pbInfo);
                if (res != null) {
                    Field fTr = res.getClass().getField("tracks");
                    Object trTracks = fTr.get(res);
                    if (trTracks != null) {
                        onMedia3TracksChanged(trTracks);
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        // Register Player.Listener via dynamic proxy once per player instance
        try {
            Class<?> listenerClass = Class.forName("androidx.media3.common.Player$Listener");
            Object listenerProxy = Proxy.newProxyInstance(
                    player.getClass().getClassLoader(),
                    new Class<?>[]{listenerClass},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            String name = method.getName();
                            if ("onTracksChanged".equals(name) && args != null && args.length > 0) {
                                onMedia3TracksChanged(args[0]);
                            } else if ("onVideoSizeChanged".equals(name) && args != null && args.length > 0) {
                                onMedia3VideoSizeChanged(args[0]);
                            }
                            return null;
                        }
                    }
            );
            Method addListener = player.getClass().getMethod("addListener", listenerClass);
            addListener.invoke(player, listenerProxy);
            android.util.Log.i("MorpheKayo", "Registered Player.Listener proxy on Media3 player");
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Failed to register Player.Listener proxy", t);
        }
    }

    private static void onMedia3TracksChanged(Object media3Tracks) {
        currentMedia3Tracks = media3Tracks;
        android.util.Log.i("MorpheKayo", "Media3 onTracksChanged received");
        List<VideoTrackOption> opts = extractMedia3VideoTracks(media3Tracks);
        VideoTrackOption playing = findCurrentlyPlayingTrack(opts);
        if (playing != null) {
            lastObservedMedia3Track = playing;
            android.util.Log.i("MorpheKayo", "Media3 active playing track: " + playing.getDisplayLabel());
        }
        updateAllQualityBadges();
    }

    private static void onMedia3VideoSizeChanged(Object videoSize) {
        if (videoSize == null) return;
        try {
            Class<?> vsClass = videoSize.getClass();
            int width = getIntField(vsClass, videoSize, "width", 0);
            int height = getIntField(vsClass, videoSize, "height", 0);
            if (width > 0 && height > 0) {
                android.util.Log.i("MorpheKayo", "Media3 video size changed: " + width + "x" + height);
                updateAllQualityBadges();
            }
        } catch (Throwable ignored) {
        }
    }

    private static List<VideoTrackOption> extractMedia3VideoTracks(Object media3Tracks) {
        List<VideoTrackOption> options = new ArrayList<>();
        if (media3Tracks == null) {
            return options;
        }
        try {
            List<?> groups = (List<?>) getFieldAny(media3Tracks, "groups");
            if (groups == null) {
                try {
                    Method getGroups = media3Tracks.getClass().getMethod("getGroups");
                    groups = (List<?>) getGroups.invoke(media3Tracks);
                } catch (Throwable ignored) {
                }
            }
            if (groups == null) {
                return options;
            }

            for (Object group : groups) {
                if (group == null) continue;

                Object mediaTrackGroup = getFieldAny(group, "mediaTrackGroup");
                int type = -1;
                if (mediaTrackGroup != null) {
                    type = getIntField(mediaTrackGroup.getClass(), mediaTrackGroup, "type", -1);
                }
                if (type == -1) {
                    type = getIntField(group.getClass(), group, "type", -1);
                }
                if (type == -1) {
                    try {
                        Method getType = group.getClass().getMethod("getType");
                        type = (Integer) getType.invoke(group);
                    } catch (Throwable ignored) {
                    }
                }
                Object[] formats = null;
                if (mediaTrackGroup != null) {
                    formats = (Object[]) getFieldAny(mediaTrackGroup, "formats");
                }
                if (formats == null) {
                    formats = (Object[]) getFieldAny(group, "formats");
                }

                if (type != VIDEO_TRACK_TYPE) {
                    boolean hasVideo = false;
                    if (formats != null) {
                        for (Object f : formats) {
                            if (f != null && getIntField(f.getClass(), f, "height", 0) > 0) {
                                hasVideo = true;
                                break;
                            }
                        }
                    }
                    if (!hasVideo) {
                        continue;
                    }
                }

                int length = getIntField(group.getClass(), group, "length", 0);
                if (length <= 0 && mediaTrackGroup != null) {
                    length = getIntField(mediaTrackGroup.getClass(), mediaTrackGroup, "length", 0);
                }

                boolean[] trackSelected = (boolean[]) getFieldAny(group, "trackSelected");
                int[] trackSupport = (int[]) getFieldAny(group, "trackSupport");

                if (formats != null && length <= 0) {
                    length = formats.length;
                }

                for (int i = 0; i < length; i++) {
                    Object formatObj = null;
                    if (formats != null && i < formats.length) {
                        formatObj = formats[i];
                    } else {
                        try {
                            Method getTrackFormat = group.getClass().getMethod("getTrackFormat", int.class);
                            formatObj = getTrackFormat.invoke(group, i);
                        } catch (Throwable ignored) {
                        }
                    }
                    if (formatObj == null) {
                        continue;
                    }

                    boolean isSelected = false;
                    if (trackSelected != null && i < trackSelected.length) {
                        isSelected = trackSelected[i];
                    } else {
                        try {
                            Method isTrackSelected = group.getClass().getMethod("isTrackSelected", int.class);
                            isSelected = (Boolean) isTrackSelected.invoke(group, i);
                        } catch (Throwable ignored) {
                        }
                    }

                    boolean isSupported = true;
                    if (trackSupport != null && i < trackSupport.length) {
                        isSupported = trackSupport[i] == 4 || trackSupport[i] == 3 || trackSupport[i] == 2;
                    } else {
                        try {
                            Method isTrackSupported = group.getClass().getMethod("isTrackSupported", int.class);
                            isSupported = (Boolean) isTrackSupported.invoke(group, i);
                        } catch (Throwable ignored) {
                        }
                    }

                    Class<?> fClass = formatObj.getClass();
                    int width = getIntField(fClass, formatObj, "width", 0);
                    int height = getIntField(fClass, formatObj, "height", 0);
                    float frameRate = getFloatField(fClass, formatObj, "frameRate", 0f);
                    int bitrate = getIntField(fClass, formatObj, "bitrate", 0);
                    if (bitrate <= 0) {
                        bitrate = getIntField(fClass, formatObj, "peakBitrate", 0);
                    }
                    if (bitrate <= 0) {
                        bitrate = getIntField(fClass, formatObj, "averageBitrate", 0);
                    }
                    String codecs = getStringField(fClass, formatObj, "codecs", "");

                    options.add(new VideoTrackOption(i, isSelected, isSupported, width, height, frameRate, bitrate, codecs));
                }
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error extracting Media3 video tracks", t);
        }

        Collections.sort(options, new Comparator<VideoTrackOption>() {
            @Override
            public int compare(VideoTrackOption a, VideoTrackOption b) {
                if (b.height != a.height) {
                    return Integer.compare(b.height, a.height);
                }
                if (Float.compare(b.frameRate, a.frameRate) != 0) {
                    return Float.compare(b.frameRate, a.frameRate);
                }
                return Integer.compare(b.bitrate, a.bitrate);
            }
        });

        // Refine isCurrentlyPlaying using the player's actual videoFormat or active ExoTrackSelection
        try {
            Object p = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
            if (p != null && !options.isEmpty()) {
                int actualH = 0;
                int actualB = 0;
                Object vFmt = getFieldAny(p, "videoFormat");
                if (vFmt != null) {
                    actualH = getIntField(vFmt.getClass(), vFmt, "height", 0);
                    actualB = getIntField(vFmt.getClass(), vFmt, "bitrate", 0);
                    if (actualB <= 0) actualB = getIntField(vFmt.getClass(), vFmt, "peakBitrate", 0);
                    if (actualB <= 0) actualB = getIntField(vFmt.getClass(), vFmt, "averageBitrate", 0);
                }
                if (actualH <= 0) {
                    Object pbInfo = getFieldAny(p, "playbackInfo");
                    if (pbInfo != null) {
                        Object tsResult = getFieldAny(pbInfo, "trackSelectorResult");
                        if (tsResult != null) {
                            Object[] selections = (Object[]) getFieldAny(tsResult, "selections");
                            if (selections != null) {
                                for (Object sel : selections) {
                                    if (sel == null) continue;
                                    try {
                                        Method getSelFmt = sel.getClass().getMethod("getSelectedFormat");
                                        Object sFmt = getSelFmt.invoke(sel);
                                        if (sFmt != null) {
                                            int h = getIntField(sFmt.getClass(), sFmt, "height", 0);
                                            if (h > 0) {
                                                actualH = h;
                                                actualB = getIntField(sFmt.getClass(), sFmt, "bitrate", 0);
                                                break;
                                            }
                                        }
                                    } catch (Throwable ignored) {}
                                }
                            }
                        }
                    }
                }
                if (actualH > 0) {
                    VideoTrackOption matched = null;
                    for (VideoTrackOption opt : options) {
                        if (opt.height == actualH && (actualB <= 0 || opt.bitrate == actualB)) {
                            matched = opt;
                            break;
                        }
                    }
                    if (matched == null) {
                        for (VideoTrackOption opt : options) {
                            if (opt.height == actualH) {
                                matched = opt;
                                break;
                            }
                        }
                    }
                    if (matched != null) {
                        for (int i = 0; i < options.size(); i++) {
                            VideoTrackOption o = options.get(i);
                            boolean isCur = (o == matched);
                            if (o.isCurrentlyPlaying != isCur) {
                                if (o.trackGroup != null && o.format != null) {
                                    options.set(i, new VideoTrackOption(o.trackGroup, o.trackIndex, o.format, isCur, o.isSupported));
                                } else {
                                    options.set(i, new VideoTrackOption(o.trackIndex, isCur, o.isSupported, o.width, o.height, o.frameRate, o.bitrate, o.codecs));
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        return options;
    }

    private static List<AudioTrackOption> extractMedia3AudioTracks(Object media3Tracks) {
        List<AudioTrackOption> options = new ArrayList<>();
        if (media3Tracks == null) {
            return options;
        }
        try {
            List<?> groups = (List<?>) getFieldAny(media3Tracks, "groups");
            if (groups == null) {
                try {
                    Method getGroups = media3Tracks.getClass().getMethod("getGroups");
                    groups = (List<?>) getGroups.invoke(media3Tracks);
                } catch (Throwable ignored) {
                }
            }
            if (groups == null) {
                return options;
            }

            int audioGroupIdx = 0;
            for (Object group : groups) {
                if (group == null) continue;

                Object mediaTrackGroup = getFieldAny(group, "mediaTrackGroup");
                int type = -1;
                if (mediaTrackGroup != null) {
                    type = getIntField(mediaTrackGroup.getClass(), mediaTrackGroup, "type", -1);
                }
                if (type == -1) {
                    type = getIntField(group.getClass(), group, "type", -1);
                }
                if (type == -1) {
                    try {
                        Method getType = group.getClass().getMethod("getType");
                        type = (Integer) getType.invoke(group);
                    } catch (Throwable ignored) {
                    }
                }
                if (type != 1) { // 1 = C.TRACK_TYPE_AUDIO
                    continue;
                }

                int length = getIntField(group.getClass(), group, "length", 0);
                if (length <= 0 && mediaTrackGroup != null) {
                    length = getIntField(mediaTrackGroup.getClass(), mediaTrackGroup, "length", 0);
                }

                boolean[] trackSelected = (boolean[]) getFieldAny(group, "trackSelected");

                Object[] formats = null;
                if (mediaTrackGroup != null) {
                    formats = (Object[]) getFieldAny(mediaTrackGroup, "formats");
                }
                if (formats == null) {
                    formats = (Object[]) getFieldAny(group, "formats");
                }

                if (formats != null && length <= 0) {
                    length = formats.length;
                }

                for (int i = 0; i < length; i++) {
                    Object fmt = null;
                    if (formats != null && i < formats.length) {
                        fmt = formats[i];
                    } else {
                        try {
                            Method getTrackFormat = group.getClass().getMethod("getTrackFormat", int.class);
                            fmt = getTrackFormat.invoke(group, i);
                        } catch (Throwable ignored) {
                        }
                    }
                    if (fmt == null) continue;

                    boolean isSelected = false;
                    if (currentSelectedAudioOption != null && currentSelectedAudioOption.media3TrackGroup != null) {
                        isSelected = (mediaTrackGroup != null && mediaTrackGroup.equals(currentSelectedAudioOption.media3TrackGroup)) && (i == currentSelectedAudioOption.trackIndex);
                    } else if (trackSelected != null && i < trackSelected.length) {
                        isSelected = trackSelected[i];
                    } else {
                        try {
                            Method isTrackSelected = group.getClass().getMethod("isTrackSelected", int.class);
                            isSelected = (Boolean) isTrackSelected.invoke(group, i);
                        } catch (Throwable ignored) {
                        }
                    }

                    Class<?> fClass = fmt.getClass();
                    int channels = getIntField(fClass, fmt, "channelCount", 0);
                    int sRate = getIntField(fClass, fmt, "sampleRate", 0);
                    int br = getIntField(fClass, fmt, "bitrate", 0);
                    if (br <= 0) br = getIntField(fClass, fmt, "averageBitrate", 0);
                    if (br <= 0) br = getIntField(fClass, fmt, "peakBitrate", 0);
                    String codecs = getStringField(fClass, fmt, "codecs", "");
                    String lang = getStringField(fClass, fmt, "language", "");
                    String label = getStringField(fClass, fmt, "label", "");
                    String mime = getStringField(fClass, fmt, "sampleMimeType", "");

                    options.add(new AudioTrackOption(
                            mediaTrackGroup != null ? mediaTrackGroup : group,
                            i,
                            audioGroupIdx,
                            isSelected,
                            channels,
                            sRate,
                            br,
                            codecs,
                            lang,
                            label,
                            mime
                    ));
                }
                audioGroupIdx++;
            }
        } catch (Throwable t) {
            android.util.Log.e("MorpheKayo", "Error extracting Media3 audio tracks", t);
        }
        return options;
    }


    private static void setFieldSafe(Class<?> clazz, Object target, String fieldName, Object value) {
        try {
            Field f = resolveFieldCached(clazz != null ? clazz : (target != null ? target.getClass() : null), fieldName);
            if (f != null) {
                f.set(target, value);
            }
        } catch (Throwable ignored) {
        }
    }

    private static int getIntField(Class<?> clazz, Object target, String fieldName, int defaultVal) {
        try {
            Field f = resolveFieldCached(clazz != null ? clazz : (target != null ? target.getClass() : null), fieldName);
            return f != null ? f.getInt(target) : defaultVal;
        } catch (Throwable ignored) {
            return defaultVal;
        }
    }

    private static long getLongField(Class<?> clazz, Object target, String fieldName, long defaultVal) {
        try {
            Field f = resolveFieldCached(clazz != null ? clazz : (target != null ? target.getClass() : null), fieldName);
            return f != null ? f.getLong(target) : defaultVal;
        } catch (Throwable ignored) {
            return defaultVal;
        }
    }

    private static boolean getBooleanField(Class<?> clazz, Object target, String fieldName, boolean defaultVal) {
        try {
            Field f = resolveFieldCached(clazz != null ? clazz : (target != null ? target.getClass() : null), fieldName);
            return f != null ? f.getBoolean(target) : defaultVal;
        } catch (Throwable ignored) {
            return defaultVal;
        }
    }

    private static float getFloatField(Class<?> clazz, Object target, String fieldName, float defaultVal) {
        try {
            Field f = resolveFieldCached(clazz != null ? clazz : (target != null ? target.getClass() : null), fieldName);
            return f != null ? f.getFloat(target) : defaultVal;
        } catch (Throwable ignored) {
            return defaultVal;
        }
    }

    private static String getStringField(Class<?> clazz, Object target, String fieldName, String defaultVal) {
        try {
            Field f = resolveFieldCached(clazz != null ? clazz : (target != null ? target.getClass() : null), fieldName);
            if (f != null) {
                Object obj = f.get(target);
                return obj != null ? obj.toString() : defaultVal;
            }
        } catch (Throwable ignored) {
        }
        return defaultVal;
    }

    /**
     * TV hook: Handles Android TV remote keys (D-pad focus navigation, Info, Menu, Color keys,
     * D-pad Center double tap & long press) in MainActivity.dispatchKeyEvent(KeyEvent).
     */
    public static boolean onTvKeyEvent(Activity activity, android.view.KeyEvent event) {
        if (event == null || activity == null) {
            return false;
        }
        currentTvActivityRef = new WeakReference<>(activity);
        int action = event.getAction();
        int keyCode = event.getKeyCode();

        // 1. Direct Remote Menu / Settings keys directly open Quality Menu
        if (keyCode == android.view.KeyEvent.KEYCODE_MENU ||
                keyCode == android.view.KeyEvent.KEYCODE_SETTINGS) {
            if (action == android.view.KeyEvent.ACTION_UP) {
                showQualityDialog(activity, null);
            }
            return true;
        }

        boolean isVideo = isTvVideoPlaying();
        if (!isVideo) {
            // When video is not playing, make sure TV quality button and diagnostics overlay are hidden
            View tvBtn = tvQualityButtonOverlayRef != null ? tvQualityButtonOverlayRef.get() : null;
            if (tvBtn != null && tvBtn.getVisibility() != View.GONE) {
                cancelTvButtonFade();
                tvBtn.animate().cancel();
                tvBtn.setVisibility(View.GONE);
                tvBtn.clearFocus();
            }
            hideDiagnosticsOverlay();
            return false;
        }

        // Dismiss Diagnostics HUD overlay on Back key if visible
        if (keyCode == android.view.KeyEvent.KEYCODE_BACK) {
            View overlay = activeOverlayRef != null ? activeOverlayRef.get() : null;
            if (overlay != null && overlay.getVisibility() == View.VISIBLE) {
                if (action == android.view.KeyEvent.ACTION_UP) {
                    toggleDiagnosticsOverlay(activity);
                }
                return true;
            }
        }

        // --- VIDEO IS ACTIVELY PLAYING ---

        // Ensure button is attached
        View tvBtn = tvQualityButtonOverlayRef != null ? tvQualityButtonOverlayRef.get() : null;
        if (tvBtn == null) {
            ensureTvQualityButtonAttached(activity);
            tvBtn = tvQualityButtonOverlayRef != null ? tvQualityButtonOverlayRef.get() : null;
        }

        if (action == android.view.KeyEvent.ACTION_DOWN) {
            // Case A: If TV Quality Button is currently focused:
            if (tvBtn != null && tvBtn.getVisibility() == View.VISIBLE && tvBtn.hasFocus()) {
                if (keyCode == android.view.KeyEvent.KEYCODE_DPAD_CENTER ||
                        keyCode == android.view.KeyEvent.KEYCODE_ENTER ||
                        keyCode == android.view.KeyEvent.KEYCODE_BUTTON_A) {
                    showQualityDialog(activity, null);
                    return true;
                }
                if (keyCode == android.view.KeyEvent.KEYCODE_DPAD_DOWN ||
                        keyCode == android.view.KeyEvent.KEYCODE_BACK) {
                    tvBtn.clearFocus();
                    updateTvButtonFocusState(activity, tvBtn, false);
                    View wv = findWebView(activity);
                    if (wv != null) {
                        wv.requestFocus();
                    }
                    return true;
                }
                if (keyCode == android.view.KeyEvent.KEYCODE_DPAD_UP ||
                        keyCode == android.view.KeyEvent.KEYCODE_DPAD_LEFT ||
                        keyCode == android.view.KeyEvent.KEYCODE_DPAD_RIGHT) {
                    return true; // Consume navigation keys while button is focused
                }
            }

            // Case B: If DPAD_UP is pressed while video is playing:
            if (keyCode == android.view.KeyEvent.KEYCODE_DPAD_UP) {
                if (tvBtn == null) {
                    ensureTvQualityButtonAttached(activity);
                    tvBtn = tvQualityButtonOverlayRef != null ? tvQualityButtonOverlayRef.get() : null;
                }
                if (tvBtn != null) {
                    cancelTvButtonFade();
                    tvBtn.animate().cancel();
                    tvBtn.setVisibility(View.VISIBLE);
                    tvBtn.setAlpha(1.0f);
                    tvBtn.setScaleX(1.10f);
                    tvBtn.setScaleY(1.10f);
                    tvBtn.bringToFront();
                    tvBtn.requestFocus();
                    updateTvButtonFocusState(activity, tvBtn, true);
                    return true;
                }
            }

            // Case C: Remote Info and Color Keys: Toggle Diagnostics HUD overlay
            if (keyCode == android.view.KeyEvent.KEYCODE_INFO ||
                    keyCode == android.view.KeyEvent.KEYCODE_PROG_RED ||
                    keyCode == android.view.KeyEvent.KEYCODE_PROG_YELLOW ||
                    keyCode == android.view.KeyEvent.KEYCODE_PROG_GREEN ||
                    keyCode == android.view.KeyEvent.KEYCODE_PROG_BLUE ||
                    keyCode == android.view.KeyEvent.KEYCODE_GUIDE) {
                toggleDiagnosticsOverlay(activity);
                return true;
            }

            // Case D: Center/Enter Key: Double-tap detection for Diagnostics HUD and track downTime for long-press
            if (keyCode == android.view.KeyEvent.KEYCODE_DPAD_CENTER ||
                    keyCode == android.view.KeyEvent.KEYCODE_ENTER) {
                long now = System.currentTimeMillis();
                lastCenterKeyDownTime = now;
                if (now - lastCenterClickTime < 600) {
                    lastCenterClickTime = 0;
                    lastCenterKeyDownTime = 0;
                    toggleDiagnosticsOverlay(activity);
                    return true;
                }
                lastCenterClickTime = now;
            }

            // Case E: Any other remote key on active stream refreshes the button fade timer if visible
            if (tvBtn != null && tvBtn.getVisibility() == View.VISIBLE && !tvBtn.hasFocus()) {
                scheduleTvButtonFade();
            }
        } else if (action == android.view.KeyEvent.ACTION_UP) {
            // Long-press Center/Enter (held >= 600ms) on remote: Opens Quality menu directly
            if (keyCode == android.view.KeyEvent.KEYCODE_DPAD_CENTER ||
                    keyCode == android.view.KeyEvent.KEYCODE_ENTER) {
                if (lastCenterKeyDownTime > 0) {
                    long heldDuration = System.currentTimeMillis() - lastCenterKeyDownTime;
                    lastCenterKeyDownTime = 0;
                    if (heldDuration >= 600 && isVideo) {
                        showQualityDialog(activity, null);
                        return true;
                    }
                }
            }
        }

        return false;
    }

    /**
     * Ensures all high-definition and 4K capabilities are reported in the playback request body.
     */
    public static String spoofPlaybackCapabilities(String original) {
        if (original == null || original.isEmpty()) {
            return "mta,50fps,lowlatency,hevc,hdr";
        }
        StringBuilder sb = new StringBuilder(original);
        if (!original.contains(",50fps")) {
            sb.append(",50fps");
        }
        if (!original.contains(",hevc")) {
            sb.append(",hevc");
        }
        if (!original.contains(",hdr")) {
            sb.append(",hdr");
        }
        return sb.toString();
    }

    /**
     * Called at the start of {@code Lpx/e;->onTracksChanged(Tracks)}.
     *
     * @return {@code true} if manual quality is locked (so the caller skips Kayo's
     *         automatic profile bitrate cap), {@code false} if Auto is active.
     */
    public static boolean onTracksChanged(DefaultTrackSelector selector, Tracks tracks) {
        if (selector != null) {
            currentTrackSelector = selector;
        }
        if (tracks != null) {
            currentTracks = tracks;
        }

        updateAllQualityBadges();

        if (currentTrackSelector != null) {
            // Apply in Auto too: removes viewport/screen-size caps and defaults to max quality.
            applySelectedQuality(currentTrackSelector, currentTracks);
        }
        return selectedHeight != QUALITY_AUTO;
    }

    /**
     * Called from {@code TrackSelectorService.i(Tracks)} ({@code LFK/b0;->i(Lcom/google/android/exoplayer2/Tracks;)V})
     * which is ALWAYS invoked by {@code LHv/P$e;->onTracksChanged} even when {@code skipNextTrackReselection} is true.
     */
    public static void onTracksUpdated(Tracks tracks) {
        if (tracks != null) {
            currentTracks = tracks;
            updateAllQualityBadges();
            if (currentTrackSelector != null) {
                if (lastAppliedSelector == currentTrackSelector
                        && lastAppliedTracks == tracks
                        && lastAppliedHeight == selectedHeight
                        && lastAppliedBitrate == selectedBitrate
                        && lastAppliedAudioOption == currentSelectedAudioOption) {
                    return;
                }
                applySelectedQuality(currentTrackSelector, currentTracks);
            }
        }
    }

    /**
     * Called when Kayo's native {@code ProfileBasedTrackSelector.setAudioTrack(String language)} is invoked.
     * Synchronizes {@code currentSelectedAudioOption} and clears any conflicting audio TrackSelectionOverride
     * so native audio switching and our in-player Audio dialog work seamlessly together as many times as needed.
     */
    public static void onSetAudioTrack(DefaultTrackSelector selector, String language) {
        if (selector != null) {
            currentTrackSelector = selector;
        }
        String normLang = language != null ? language.trim() : "";
        AudioTrackOption matched = null;
        List<AudioTrackOption> available = getAvailableAudioOptions();
        for (AudioTrackOption opt : available) {
            if (!normLang.isEmpty() && opt.language.equalsIgnoreCase(normLang)) {
                matched = opt;
                break;
            }
        }
        if (matched == null && !normLang.isEmpty()) {
            String baseLang = normLang.split("-")[0];
            for (AudioTrackOption opt : available) {
                String optBase = opt.language.split("-")[0];
                if (!baseLang.isEmpty() && optBase.equalsIgnoreCase(baseLang)) {
                    matched = opt;
                    break;
                }
            }
        }
        currentSelectedAudioOption = matched;
        if (currentTrackSelector != null) {
            try {
                DefaultTrackSelector.Parameters.Builder b = currentTrackSelector.buildUponParameters();
                b.clearOverridesOfType(1);
                try {
                    b.clearSelectionOverrides();
                } catch (Throwable ignored) {
                }
                b.setExceedAudioConstraintsIfNecessary(true)
                        .setAllowAudioMixedMimeTypeAdaptiveness(true)
                        .setAllowAudioMixedSampleRateAdaptiveness(true)
                        .setAllowAudioMixedChannelCountAdaptiveness(true);
                if (!normLang.isEmpty()) {
                    b.setPreferredAudioLanguage(normLang);
                }
                if (matched != null && matched.trackGroup != null) {
                    b.setOverrideForType(new TrackSelectionOverride(matched.trackGroup, matched.trackIndex));
                }
                currentTrackSelector.setParameters(b.build());
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Called at the start of {@code Lpx/e;->b(int maxVideoBitrate)} and {@code Lpx/e;->c(int maxVideoHeight)}.
     *
     * @return {@code true} if manual quality is locked (blocking Kayo's bitrate/size limiter
     *         from overwriting our selection), {@code false} to allow normal adaptive behavior.
     */
    public static boolean shouldIgnoreBitrateLimit() {
        // Always block Kayo's client-side profile/data-saver bitrate cap so the player can use
        // the best rendition the server already delivered, in both Auto and manual modes.
        if (currentTrackSelector != null) {
            applySelectedQuality(currentTrackSelector, currentTracks);
        }
        return true;
    }

    /**
     * Called when the player controls view is initialized.
     * Injects both the Video Quality pill badge and the Diagnostics button into the controls bar.
     */
    public static void onControlsInitialized(final View trackSelectorButton) {
        if (trackSelectorButton == null) {
            return;
        }

        final Context context = trackSelectorButton.getContext();
        loadPrefsIfNeeded(context);

        // Always make the track selector button visible so the user can access it on live streams
        trackSelectorButton.setVisibility(View.VISIBLE);

        final View.OnClickListener originalClickListener = findParentOnClickListener(trackSelectorButton);

        // Clicking the track selector button opens the Video Quality menu
        trackSelectorButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(final View v) {
                Runnable openOriginal = null;
                if (originalClickListener != null) {
                    openOriginal = new Runnable() {
                        @Override
                        public void run() {
                            originalClickListener.onClick(v);
                        }
                    };
                }
                showQualityDialog(v.getContext(), openOriginal);
            }
        });

        // Long-pressing the track selector button opens the Quality dialog directly
        trackSelectorButton.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                showQualityDialog(v.getContext(), null);
                return true;
            }
        });

        // Inject Quality badge and Diagnostics button
        injectQualityAndDiagnosticsButtons(trackSelectorButton);
    }

    private static View.OnClickListener findParentOnClickListener(View view) {
        android.view.ViewParent parent = view.getParent();
        while (parent instanceof View) {
            if (parent instanceof View.OnClickListener) {
                return (View.OnClickListener) parent;
            }
            parent = parent.getParent();
        }
        return null;
    }

    /**
     * Called when {@code AbstractDaznPlayerControls.o2(boolean visible)} is invoked.
     * Forces the track selector button to remain visible on all streams.
     */
    public static boolean overrideTrackSelectorVisibility(boolean originalVisible) {
        return true;
    }

    /**
     * Called when the user clicks the track selector button.
     */
    public static boolean onTrackSelectorClicked(final View view) {
        if (view == null) {
            return false;
        }
        showQualityDialog(view.getContext(), null);
        return true;
    }

    // =========================================================================
    // Real-Time Diagnostics & Metrics Retrieval
    // =========================================================================

    /**
     * Extracts active live stream playback metrics from ExoPlayer renderer or currentTracks.
     * Guarantees accurate metrics for both 4K UHD and 1080p FHD live streams.
     */
    private static String getNetworkTypeName(Context context) {
        if (context == null) return "Unknown";
        try {
            android.net.ConnectivityManager cm = (android.net.ConnectivityManager)
                    context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (cm == null) return "Unknown";
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
                android.net.Network net = cm.getActiveNetwork();
                if (net == null) return "Disconnected";
                android.net.NetworkCapabilities caps = cm.getNetworkCapabilities(net);
                if (caps == null) return "Active";
                if (caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_ETHERNET)) {
                    return "Ethernet (LAN)";
                } else if (caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_WIFI)) {
                    return "Wi-Fi (Fast)";
                } else if (caps.hasTransport(android.net.NetworkCapabilities.TRANSPORT_CELLULAR)) {
                    return "Cellular (5G/4G)";
                }
            } else {
                android.net.NetworkInfo ni = cm.getActiveNetworkInfo();
                if (ni != null && ni.isConnected()) {
                    return ni.getTypeName();
                }
            }
        } catch (Throwable ignored) {}
        return "Connected";
    }

    public static StreamMetrics getActiveStreamMetrics() {
        Format format = null;
        ExoPlayer player = currentPlayerRef != null ? currentPlayerRef.get() : null;

        // 1. Try active renderer format directly from ExoPlayer
        if (player != null) {
            try {
                format = player.getVideoFormat();
            } catch (Throwable ignored) {
            }
        }

        // 2. Fallback: query selected track from currentTracks
        if (format == null && currentTracks != null) {
            List<VideoTrackOption> options = extractVideoTracks(currentTracks);
            VideoTrackOption playing = findCurrentlyPlayingTrack(options);
            if (playing != null) {
                format = playing.format;
            } else if (!options.isEmpty()) {
                if (selectedHeight != QUALITY_AUTO) {
                    for (VideoTrackOption opt : options) {
                        if (opt.height == selectedHeight) {
                            format = opt.format;
                            break;
                        }
                    }
                }
                if (format == null) {
                    format = options.get(0).format;
                }
            }
        }

        int width = 0;
        int height = 0;
        float frameRate = 0f;
        int bitrate = 0;
        String codecs = "";
        String mimeType = "";

        String audioCodec = "";
        int audioChannels = 0;
        int audioSampleRate = 0;
        int audioBitrate = 0;
        String audioLanguage = "";
        String audioMimeType = "";

        long estimatedBandwidth = 0;
        String stateStr = "Active";
        long bufferedMs = 0;

        if (format != null) {
            width = format.width > 0 ? format.width : 0;
            height = format.height > 0 ? format.height : 0;
            frameRate = format.frameRate > 0 ? format.frameRate : 0f;
            bitrate = format.bitrate > 0 ? format.bitrate
                    : (format.peakBitrate > 0 ? format.peakBitrate : format.averageBitrate);
            codecs = format.codecs != null ? format.codecs : "";
            mimeType = format.sampleMimeType != null ? format.sampleMimeType : "";
        }

        if (player != null) {
            try {
                try {
                    Format af = player.getAudioFormat();
                    if (af != null) {
                        audioChannels = getIntField(af.getClass(), af, "channelCount", 0);
                        audioSampleRate = getIntField(af.getClass(), af, "sampleRate", 0);
                        audioBitrate = af.bitrate > 0 ? af.bitrate : (af.averageBitrate > 0 ? af.averageBitrate : af.peakBitrate);
                        audioCodec = af.codecs != null ? af.codecs : "";
                        audioMimeType = af.sampleMimeType != null ? af.sampleMimeType : "";
                        audioLanguage = af.language != null ? af.language : "";
                    }
                } catch (Throwable ignored) {
                }

                if (audioChannels <= 0 && currentTracks != null) {
                    List<AudioTrackOption> aOpts = extractAudioTracks(currentTracks);
                    for (AudioTrackOption ao : aOpts) {
                        if (ao.isSelected) {
                            audioChannels = ao.channelCount;
                            audioSampleRate = ao.sampleRate;
                            audioBitrate = ao.bitrate;
                            audioCodec = ao.codecs;
                            audioLanguage = ao.language;
                            audioMimeType = ao.mimeType;
                            break;
                        }
                    }
                }

                int state = player.getPlaybackState();
                boolean isPlaying = player.isPlaying();
                bufferedMs = player.getTotalBufferedDuration();

                switch (state) {
                    case ExoPlayer.STATE_BUFFERING:
                        stateStr = "Buffering";
                        break;
                    case ExoPlayer.STATE_READY:
                        stateStr = isPlaying ? "Playing" : "Paused";
                        break;
                    case ExoPlayer.STATE_ENDED:
                        stateStr = "Ended";
                        break;
                    case ExoPlayer.STATE_IDLE:
                        stateStr = "Idle";
                        break;
                }
            } catch (Throwable ignored) {
            }
        } else {
            Object media3Player = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
            if (media3Player != null) {
                try {
                    Object media3Format = null;
                    try {
                        Method getVideoFormatMethod = media3Player.getClass().getMethod("getVideoFormat");
                        media3Format = getVideoFormatMethod.invoke(media3Player);
                    } catch (Throwable ignored) {
                    }

                    if (media3Format == null) {
                        try {
                            Field fVideoFormat = media3Player.getClass().getField("videoFormat");
                            media3Format = fVideoFormat.get(media3Player);
                        } catch (Throwable ignored) {
                        }
                    }

                    if (media3Format != null) {
                        Class<?> fmtClass = media3Format.getClass();
                        width = getIntField(fmtClass, media3Format, "width", 0);
                        height = getIntField(fmtClass, media3Format, "height", 0);
                        frameRate = getFloatField(fmtClass, media3Format, "frameRate", 0f);
                        bitrate = getIntField(fmtClass, media3Format, "bitrate", 0);
                        if (bitrate <= 0) {
                            bitrate = getIntField(fmtClass, media3Format, "peakBitrate", 0);
                        }
                        if (bitrate <= 0) {
                            bitrate = getIntField(fmtClass, media3Format, "averageBitrate", 0);
                        }
                        codecs = getStringField(fmtClass, media3Format, "codecs", "");
                        mimeType = getStringField(fmtClass, media3Format, "sampleMimeType", "");
                    }

                    Object media3AudioFmt = null;
                    try {
                        Method getAudioFormatMethod = media3Player.getClass().getMethod("getAudioFormat");
                        media3AudioFmt = getAudioFormatMethod.invoke(media3Player);
                    } catch (Throwable ignored) {
                    }

                    if (media3AudioFmt == null) {
                        try {
                            Field fAudioFormat = media3Player.getClass().getField("audioFormat");
                            media3AudioFmt = fAudioFormat.get(media3Player);
                        } catch (Throwable ignored) {
                        }
                    }

                    if (media3AudioFmt != null) {
                        Class<?> afClass = media3AudioFmt.getClass();
                        audioChannels = getIntField(afClass, media3AudioFmt, "channelCount", 0);
                        audioSampleRate = getIntField(afClass, media3AudioFmt, "sampleRate", 0);
                        audioBitrate = getIntField(afClass, media3AudioFmt, "bitrate", 0);
                        if (audioBitrate <= 0) {
                            audioBitrate = getIntField(afClass, media3AudioFmt, "averageBitrate", 0);
                        }
                        if (audioBitrate <= 0) {
                            audioBitrate = getIntField(afClass, media3AudioFmt, "peakBitrate", 0);
                        }
                        audioCodec = getStringField(afClass, media3AudioFmt, "codecs", "");
                        audioLanguage = getStringField(afClass, media3AudioFmt, "language", "");
                        audioMimeType = getStringField(afClass, media3AudioFmt, "sampleMimeType", "");
                    }

                    if (audioChannels <= 0 && currentMedia3Tracks != null) {
                        List<AudioTrackOption> aOpts = extractMedia3AudioTracks(currentMedia3Tracks);
                        for (AudioTrackOption ao : aOpts) {
                            if (ao.isSelected) {
                                audioChannels = ao.channelCount;
                                audioSampleRate = ao.sampleRate;
                                audioBitrate = ao.bitrate;
                                audioCodec = ao.codecs;
                                audioLanguage = ao.language;
                                audioMimeType = ao.mimeType;
                                break;
                            }
                        }
                    }

                    if (height <= 0 && lastObservedMedia3Track != null) {
                        width = lastObservedMedia3Track.width;
                        height = lastObservedMedia3Track.height;
                        frameRate = lastObservedMedia3Track.frameRate;
                        bitrate = lastObservedMedia3Track.bitrate;
                        codecs = lastObservedMedia3Track.codecs;
                    } else if (height <= 0 && currentMedia3Tracks != null) {
                        VideoTrackOption active = findCurrentlyPlayingTrack(extractMedia3VideoTracks(currentMedia3Tracks));
                        if (active != null) {
                            width = active.width;
                            height = active.height;
                            frameRate = active.frameRate;
                            bitrate = active.bitrate;
                            codecs = active.codecs;
                        }
                    }

                    try {
                        Field fInfo = media3Player.getClass().getField("playbackInfo");
                        Object pbInfo = fInfo.get(media3Player);
                        if (pbInfo != null) {
                            Class<?> pbClass = pbInfo.getClass();
                            int pbState = getIntField(pbClass, pbInfo, "playbackState", -1);
                            boolean playWhenReady = getBooleanField(pbClass, pbInfo, "playWhenReady", true);
                            switch (pbState) {
                                case 2: // STATE_BUFFERING
                                    stateStr = "Buffering";
                                    break;
                                case 3: // STATE_READY
                                    stateStr = playWhenReady ? "Playing" : "Paused";
                                    break;
                                case 4: // STATE_ENDED
                                    stateStr = "Ended";
                                    break;
                                case 1: // STATE_IDLE
                                    stateStr = "Idle";
                                    break;
                            }

                            long totalBufferedUs = getLongField(pbClass, pbInfo, "totalBufferedDurationUs", 0L);
                            if (totalBufferedUs > 0) {
                                bufferedMs = totalBufferedUs / 1000L;
                            } else {
                                long bufPosUs = getLongField(pbClass, pbInfo, "bufferedPositionUs", 0L);
                                long posUs = getLongField(pbClass, pbInfo, "positionUs", 0L);
                                if (bufPosUs > posUs) {
                                    bufferedMs = (bufPosUs - posUs) / 1000L;
                                }
                            }

                            if (currentMedia3Tracks == null) {
                                try {
                                    Field fResult = pbClass.getField("trackSelectorResult");
                                    Object res = fResult.get(pbInfo);
                                    if (res != null) {
                                        Field fTr = res.getClass().getField("tracks");
                                        Object trTracks = fTr.get(res);
                                        if (trTracks != null) {
                                            currentMedia3Tracks = trTracks;
                                        }
                                    }
                                } catch (Throwable ignored) {
                                }
                            }
                        }
                    } catch (Throwable ignored) {
                    }

                    if ("Active".equals(stateStr) || bufferedMs <= 0) {
                        try {
                            Method getPlaybackState = media3Player.getClass().getMethod("getPlaybackState");
                            int state = (Integer) getPlaybackState.invoke(media3Player);
                            Method isPlayingMethod = media3Player.getClass().getMethod("isPlaying");
                            boolean isPlaying = (Boolean) isPlayingMethod.invoke(media3Player);
                            Method getBuffered = media3Player.getClass().getMethod("getTotalBufferedDuration");
                            bufferedMs = (Long) getBuffered.invoke(media3Player);

                            switch (state) {
                                case 2: // STATE_BUFFERING
                                    stateStr = "Buffering";
                                    break;
                                case 3: // STATE_READY
                                    stateStr = isPlaying ? "Playing" : "Paused";
                                    break;
                                case 4: // STATE_ENDED
                                    stateStr = "Ended";
                                    break;
                                case 1: // STATE_IDLE
                                    stateStr = "Idle";
                                    break;
                            }
                        } catch (Throwable ignored) {
                        }
                    }

                    if (currentBandwidthMeterRef == null || currentBandwidthMeterRef.get() == null) {
                        try {
                            Field fMeter = media3Player.getClass().getField("bandwidthMeter");
                            Object meter = fMeter.get(media3Player);
                            if (meter != null) {
                                currentBandwidthMeterRef = new WeakReference<>(meter);
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }

        Object bwMeter = currentBandwidthMeterRef != null ? currentBandwidthMeterRef.get() : null;
        if (bwMeter != null) {
            try {
                Field fEst = bwMeter.getClass().getField("bitrateEstimate");
                estimatedBandwidth = fEst.getLong(bwMeter);
            } catch (Throwable ignored) {
            }
            if (estimatedBandwidth <= 0) {
                try {
                    Method m = bwMeter.getClass().getMethod("getBitrateEstimate");
                    estimatedBandwidth = (Long) m.invoke(bwMeter);
                } catch (Throwable ignored) {
                }
            }
        }
        if (estimatedBandwidth <= 0) {
            try {
                Class<?> dbmClass = Class.forName("androidx.media3.exoplayer.upstream.DefaultBandwidthMeter");
                Field fSingleton = dbmClass.getField("singletonInstance");
                Object singleton = fSingleton.get(null);
                if (singleton != null) {
                    Field fEst = dbmClass.getField("bitrateEstimate");
                    estimatedBandwidth = fEst.getLong(singleton);
                }
            } catch (Throwable ignored) {
            }
        }

        int droppedFrames = -1;
        if (player != null) {
            try {
                Method mCounters = player.getClass().getMethod("getVideoDecoderCounters");
                Object counters = mCounters.invoke(player);
                if (counters != null) {
                    Field fDropped = counters.getClass().getField("droppedBufferCount");
                    droppedFrames = fDropped.getInt(counters);
                }
            } catch (Throwable ignored) {}
        }
        Object media3Pl = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
        if (droppedFrames < 0 && media3Pl != null) {
            try {
                Method mCounters = media3Pl.getClass().getMethod("getVideoDecoderCounters");
                Object counters = mCounters.invoke(media3Pl);
                if (counters != null) {
                    Field fDropped = counters.getClass().getField("droppedBufferCount");
                    droppedFrames = fDropped.getInt(counters);
                }
            } catch (Throwable ignored) {}
        }

        Activity activeAct = currentTvActivityRef != null ? currentTvActivityRef.get() : null;
        String netType = getNetworkTypeName(activeAct);

        return new StreamMetrics(
                width,
                height,
                frameRate,
                bitrate,
                estimatedBandwidth,
                codecs,
                mimeType,
                audioCodec,
                audioChannels,
                audioSampleRate,
                audioBitrate,
                audioLanguage,
                audioMimeType,
                stateStr,
                bufferedMs,
                droppedFrames,
                netType
        );
    }

    /**
     * Formats live metrics for the real-time HUD overlay card.
     */
    private static String formatLiveMetricsText(StreamMetrics m) {
        StringBuilder sb = new StringBuilder();

        sb.append("Tier:     ").append(m.tierLabel).append("\n");
        if (m.width > 0 && m.height > 0) {
            sb.append("Res:      ").append(m.width).append(" x ").append(m.height).append("\n");
        } else if (m.height > 0) {
            sb.append("Res:      ").append(m.height).append("p\n");
        } else {
            sb.append("Res:      Searching...\n");
        }

        if (m.frameRate > 0f) {
            sb.append(String.format(Locale.US, "FPS:      %.1f fps\n", m.frameRate));
        } else {
            sb.append("FPS:      N/A\n");
        }

        if (m.bitrate > 0) {
            double mbps = m.bitrate / 1_000_000.0;
            int kbps = (int) (m.bitrate / 1_000);
            sb.append(String.format(Locale.US, "Bitrate:  %.2f Mbps (%d kbps)\n", mbps, kbps));
        } else {
            sb.append("Bitrate:  Probing...\n");
        }

        if (m.estimatedBandwidth > 0) {
            double bwMbps = m.estimatedBandwidth / 1_000_000.0;
            sb.append(String.format(Locale.US, "Speed:    %.2f Mbps (Bandwidth)\n", bwMbps));
        }

        if (!"Unknown".equals(m.networkType) && !"Connected".equals(m.networkType)) {
            sb.append("Network:  ").append(m.networkType).append("\n");
        }

        if (m.droppedFrames >= 0) {
            sb.append(String.format(Locale.US, "Dropped:  %d frames\n", m.droppedFrames));
        }

        if (!m.codecs.isEmpty()) {
            String shortCodec = m.codecs;
            if (shortCodec.contains("hev") || shortCodec.contains("hvc")) {
                shortCodec = "HEVC (" + shortCodec + ")";
            } else if (shortCodec.contains("avc")) {
                shortCodec = "AVC (" + shortCodec + ")";
            }
            sb.append("Codec:    ").append(shortCodec).append("\n");
        }

        String audioDesc = m.getAudioDescription();
        if (!"N/A".equals(audioDesc)) {
            sb.append("Audio:    ").append(audioDesc).append("\n");
        }

        double bufSec = m.bufferedDurationMs / 1000.0;
        if (bufSec > 0) {
            sb.append(String.format(Locale.US, "State:    %s [Buffer: %.1fs]\n", m.playbackState, bufSec));
        } else {
            sb.append("State:    ").append(m.playbackState).append("\n");
        }

        if (selectedHeight == QUALITY_AUTO) {
            sb.append("Lock:     Auto (Adaptive)");
        } else {
            sb.append("Lock:     Locked to ").append(selectedHeight).append("p");
        }

        return sb.toString();
    }

    /**
     * Toggles the on-screen live diagnostics HUD overlay.
     */
    public static void toggleDiagnosticsOverlay(final Context rawContext) {
        final Activity activity = findActivity(rawContext);
        if (activity == null) {
            return;
        }

        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    ViewGroup rootView = activity.findViewById(android.R.id.content);
                    if (rootView == null) {
                        return;
                    }

                    View existing = rootView.findViewById(DIAGNOSTICS_OVERLAY_VIEW_ID);
                    if (existing != null) {
                        rootView.removeView(existing);
                        activeOverlayRef = null;
                        stopDiagnosticsOverlayTimer();
                        Toast.makeText(activity, "Live Diagnostics HUD hidden", Toast.LENGTH_SHORT).show();
                        return;
                    }

                    View overlay = buildDiagnosticsOverlayView(activity);
                    overlay.setId(DIAGNOSTICS_OVERLAY_VIEW_ID);

                    FrameLayout.LayoutParams flp = new FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                    );
                    flp.gravity = Gravity.TOP | Gravity.START;
                    flp.topMargin = dpToPx(activity, 52);
                    flp.leftMargin = dpToPx(activity, 16);
                    overlay.setLayoutParams(flp);

                    rootView.addView(overlay);
                    activeOverlayRef = new WeakReference<>(overlay);

                    startDiagnosticsOverlayTimer();
                    Toast.makeText(activity, "Live Diagnostics HUD enabled", Toast.LENGTH_SHORT).show();
                } catch (Throwable t) {
                    Toast.makeText(activity, "Failed to toggle HUD: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private static View buildDiagnosticsOverlayView(final Activity activity) {
        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);

        int padH = dpToPx(activity, 14);
        int padV = dpToPx(activity, 12);
        root.setPadding(padH, padV, padH, padV);

        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dpToPx(activity, 8));
        bg.setColor(Color.parseColor("#EE0B111E")); // Deep obsidian navy, 93% opacity
        bg.setStroke(dpToPx(activity, 1), Color.parseColor("#38BDF8")); // Sky cyan border
        root.setBackground(bg);

        // Title bar row
        LinearLayout titleBar = new LinearLayout(activity);
        titleBar.setOrientation(LinearLayout.HORIZONTAL);
        titleBar.setGravity(Gravity.CENTER_VERTICAL);

        TextView title = new TextView(activity);
        title.setText("STREAM DIAGNOSTICS");
        title.setTextColor(Color.parseColor("#38BDF8"));
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                0,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                1.0f
        );
        titleBar.addView(title, titleLp);

        // Close button [X]
        TextView closeBtn = new TextView(activity);
        closeBtn.setText("X");
        closeBtn.setTextColor(Color.parseColor("#94A3B8"));
        closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        closeBtn.setTypeface(Typeface.DEFAULT_BOLD);
        int closePad = dpToPx(activity, 4);
        closeBtn.setPadding(closePad * 2, 0, closePad, 0);
        closeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggleDiagnosticsOverlay(activity);
            }
        });
        titleBar.addView(closeBtn);

        root.addView(titleBar);

        // Divider line
        View divider = new View(activity);
        divider.setBackgroundColor(Color.parseColor("#334155"));
        LinearLayout.LayoutParams divLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dpToPx(activity, 1)
        );
        divLp.topMargin = dpToPx(activity, 6);
        divLp.bottomMargin = dpToPx(activity, 8);
        root.addView(divider, divLp);

        // Live Metrics TextView
        TextView metricsTv = new TextView(activity);
        metricsTv.setId(DIAGNOSTICS_OVERLAY_TEXT_VIEW_ID);
        metricsTv.setTextColor(Color.parseColor("#F8FAFC"));
        metricsTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        metricsTv.setTypeface(Typeface.MONOSPACE);
        metricsTv.setLineSpacing(dpToPx(activity, 3), 1.0f);
        metricsTv.setText(formatLiveMetricsText(getActiveStreamMetrics()));
        root.addView(metricsTv);

        // Action row: [FULL DETAILS]
        LinearLayout actionsRow = new LinearLayout(activity);
        actionsRow.setOrientation(LinearLayout.HORIZONTAL);
        actionsRow.setGravity(Gravity.END);
        LinearLayout.LayoutParams actionsLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        actionsLp.topMargin = dpToPx(activity, 8);

        TextView detailsBtn = new TextView(activity);
        detailsBtn.setText("[ FULL DETAILS ]");
        detailsBtn.setTextColor(Color.parseColor("#38BDF8"));
        detailsBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f);
        detailsBtn.setTypeface(Typeface.DEFAULT_BOLD);
        detailsBtn.setPadding(dpToPx(activity, 6), dpToPx(activity, 4), dpToPx(activity, 6), dpToPx(activity, 4));
        detailsBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDiagnosticsDialog(activity);
            }
        });
        actionsRow.addView(detailsBtn);

        root.addView(actionsRow, actionsLp);

        // Enable dragging the HUD card across the video screen
        root.setOnTouchListener(new View.OnTouchListener() {
            private float initialX, initialY;
            private float initialTouchX, initialTouchY;
            private boolean isDragging = false;

            @Override
            public boolean onTouch(View v, MotionEvent event) {
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        initialX = v.getX();
                        initialY = v.getY();
                        initialTouchX = event.getRawX();
                        initialTouchY = event.getRawY();
                        isDragging = false;
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        float deltaX = event.getRawX() - initialTouchX;
                        float deltaY = event.getRawY() - initialTouchY;
                        if (Math.abs(deltaX) > 10 || Math.abs(deltaY) > 10 || isDragging) {
                            isDragging = true;
                            v.setX(initialX + deltaX);
                            v.setY(initialY + deltaY);
                        }
                        return true;
                    case MotionEvent.ACTION_UP:
                        return isDragging;
                    default:
                        return false;
                }
            }
        });

        return root;
    }

    private static void startDiagnosticsOverlayTimer() {
        stopDiagnosticsOverlayTimer();
        overlayUpdateRunnable = new Runnable() {
            @Override
            public void run() {
                View overlay = activeOverlayRef != null ? activeOverlayRef.get() : null;
                if (overlay == null || overlay.getParent() == null) {
                    stopDiagnosticsOverlayTimer();
                    return;
                }
                TextView tv = overlay.findViewById(DIAGNOSTICS_OVERLAY_TEXT_VIEW_ID);
                if (tv != null) {
                    StreamMetrics m = getActiveStreamMetrics();
                    tv.setText(formatLiveMetricsText(m));
                }
                mainHandler.postDelayed(this, 1000);
            }
        };
        mainHandler.post(overlayUpdateRunnable);
    }

    private static void stopDiagnosticsOverlayTimer() {
        if (overlayUpdateRunnable != null) {
            mainHandler.removeCallbacks(overlayUpdateRunnable);
            overlayUpdateRunnable = null;
        }
    }

    /**
     * Displays a full technical Stream Diagnostics alert dialog.
     */
    public static void showDiagnosticsDialog(final Context rawContext) {
        final Activity activity = findActivity(rawContext);
        final Context context = activity != null ? activity : rawContext;
        if (context == null) {
            return;
        }

        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    buildAndShowDiagnosticsDialog(context);
                } catch (Throwable t) {
                    Toast.makeText(context, "Unable to show diagnostics: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private static void buildAndShowDiagnosticsDialog(final Context context) {
        StreamMetrics m = getActiveStreamMetrics();
        final String report = buildDiagnosticsReportString(m);

        ScrollView scrollView = new ScrollView(context);
        int pad = dpToPx(context, 16);
        scrollView.setPadding(pad, pad, pad, pad);

        TextView reportTv = new TextView(context);
        reportTv.setText(report);
        reportTv.setTextColor(Color.parseColor("#F1F5F9"));
        reportTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        reportTv.setTypeface(Typeface.MONOSPACE);
        reportTv.setLineSpacing(dpToPx(context, 2), 1.0f);
        scrollView.addView(reportTv);

        AlertDialog.Builder b = new AlertDialog.Builder(context, android.R.style.Theme_DeviceDefault_Dialog_Alert);
        b.setTitle("Live Stream Diagnostics");
        b.setView(scrollView);

        b.setPositiveButton("Copy Report", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                try {
                    ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                    if (cm != null) {
                        ClipData clip = ClipData.newPlainText("Kayo Stream Diagnostics", report);
                        cm.setPrimaryClip(clip);
                        Toast.makeText(context, "Diagnostics copied to clipboard", Toast.LENGTH_SHORT).show();
                    }
                } catch (Throwable ignored) {
                }
            }
        });

        b.setNeutralButton("Toggle HUD", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                toggleDiagnosticsOverlay(context);
            }
        });

        b.setNegativeButton("Close", null);
        b.show();
    }

    private static void refreshCurrentTracksFromPlayer() {
        try {
            ExoPlayer p = currentPlayerRef != null ? currentPlayerRef.get() : null;
            if (p != null) {
                Tracks tr = p.getCurrentTracks();
                if (tr != null && tr.getGroups() != null && !tr.getGroups().isEmpty()) {
                    currentTracks = tr;
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static List<VideoTrackOption> getAvailableVideoOptions() {
        refreshCurrentTracksFromPlayer();
        List<VideoTrackOption> videoOptions = extractVideoTracks(currentTracks);
        if (!videoOptions.isEmpty()) {
            return videoOptions;
        }
        if (currentMedia3Tracks != null) {
            videoOptions = extractMedia3VideoTracks(currentMedia3Tracks);
            if (!videoOptions.isEmpty()) {
                return videoOptions;
            }
        }
        Object p = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
        if (p != null) {
            try {
                try {
                    Method mGetTracks = p.getClass().getMethod("getCurrentTracks");
                    Object curTracks = mGetTracks.invoke(p);
                    if (curTracks != null) {
                        videoOptions = extractMedia3VideoTracks(curTracks);
                        if (!videoOptions.isEmpty()) {
                            return videoOptions;
                        }
                    }
                } catch (Throwable ignored) {
                }

                Object pbInfo = getFieldAny(p, "playbackInfo");
                if (pbInfo != null) {
                    Object res = getFieldAny(pbInfo, "trackSelectorResult");
                    if (res != null) {
                        Object tr = getFieldAny(res, "tracks");
                        if (tr != null) {
                            currentMedia3Tracks = tr;
                            videoOptions = extractMedia3VideoTracks(tr);
                            if (!videoOptions.isEmpty()) {
                                return videoOptions;
                            }
                        }
                        Object[] selections = (Object[]) getFieldAny(res, "selections");
                        if (selections != null) {
                            for (Object sel : selections) {
                                if (sel == null) continue;
                                videoOptions = extractVideoTracksFromSelection(sel);
                                if (!videoOptions.isEmpty()) {
                                    return videoOptions;
                                }
                            }
                        }
                    }

                    Object tgArray = getFieldAny(pbInfo, "trackGroups");
                    if (tgArray != null) {
                        videoOptions = extractVideoTracksFromTrackGroupArray(tgArray);
                        if (!videoOptions.isEmpty()) {
                            return videoOptions;
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return videoOptions;
    }

    private static List<VideoTrackOption> extractVideoTracksFromTrackGroupArray(Object tgArray) {
        List<VideoTrackOption> options = new ArrayList<>();
        if (tgArray == null) return options;
        try {
            int length = getIntField(tgArray.getClass(), tgArray, "length", 0);
            for (int i = 0; i < length; i++) {
                Object group = null;
                try {
                    Method mGet = tgArray.getClass().getMethod("get", int.class);
                    group = mGet.invoke(tgArray, i);
                } catch (Throwable ignored) {
                }
                if (group == null) continue;
                int type = getIntField(group.getClass(), group, "type", -1);
                Object[] formats = (Object[]) getFieldAny(group, "formats");
                if (formats == null) continue;
                boolean isVideo = (type == VIDEO_TRACK_TYPE);
                if (!isVideo) {
                    for (Object f : formats) {
                        if (f != null && getIntField(f.getClass(), f, "height", 0) > 0) {
                            isVideo = true;
                            break;
                        }
                    }
                }
                if (!isVideo) continue;
                for (int fIdx = 0; fIdx < formats.length; fIdx++) {
                    Object fmt = formats[fIdx];
                    if (fmt == null) continue;
                    Class<?> fClass = fmt.getClass();
                    int width = getIntField(fClass, fmt, "width", 0);
                    int height = getIntField(fClass, fmt, "height", 0);
                    if (height <= 0) continue;
                    float frameRate = getFloatField(fClass, fmt, "frameRate", 0f);
                    int bitrate = getIntField(fClass, fmt, "bitrate", 0);
                    if (bitrate <= 0) bitrate = getIntField(fClass, fmt, "peakBitrate", 0);
                    if (bitrate <= 0) bitrate = getIntField(fClass, fmt, "averageBitrate", 0);
                    String codecs = getStringField(fClass, fmt, "codecs", "");
                    options.add(new VideoTrackOption(fIdx, false, true, width, height, frameRate, bitrate, codecs));
                }
            }
        } catch (Throwable ignored) {
        }
        if (!options.isEmpty()) {
            Collections.sort(options, new Comparator<VideoTrackOption>() {
                @Override
                public int compare(VideoTrackOption a, VideoTrackOption b) {
                    if (b.height != a.height) return Integer.compare(b.height, a.height);
                    if (Float.compare(b.frameRate, a.frameRate) != 0) return Float.compare(b.frameRate, a.frameRate);
                    return Integer.compare(b.bitrate, a.bitrate);
                }
            });
        }
        return options;
    }

    private static List<AudioTrackOption> getAvailableAudioOptions() {
        refreshCurrentTracksFromPlayer();
        List<AudioTrackOption> aTracks = extractAudioTracks(currentTracks);
        if (!aTracks.isEmpty()) {
            return aTracks;
        }
        if (currentMedia3Tracks != null) {
            aTracks = extractMedia3AudioTracks(currentMedia3Tracks);
            if (!aTracks.isEmpty()) {
                return aTracks;
            }
        }
        Object p = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
        if (p != null) {
            try {
                Object pbInfo = getFieldAny(p, "playbackInfo");
                if (pbInfo != null) {
                    Object res = getFieldAny(pbInfo, "trackSelectorResult");
                    if (res != null) {
                        Object tr = getFieldAny(res, "tracks");
                        if (tr != null) {
                            aTracks = extractMedia3AudioTracks(tr);
                            if (!aTracks.isEmpty()) {
                                return aTracks;
                            }
                        }
                        Object[] selections = (Object[]) getFieldAny(res, "selections");
                        if (selections != null) {
                            for (Object sel : selections) {
                                if (sel == null) continue;
                                aTracks = extractAudioTracksFromSelection(sel);
                                if (!aTracks.isEmpty()) {
                                    return aTracks;
                                }
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return aTracks;
    }

    private static String buildDiagnosticsReportString(StreamMetrics m) {
        StringBuilder sb = new StringBuilder();

        sb.append("===============================\n");
        sb.append("   LIVE STREAM DIAGNOSTICS     \n");
        sb.append("===============================\n\n");

        sb.append("[ VIDEO RENDITION ]\n");
        sb.append("Quality Tier:   ").append(m.tierLabel).append("\n");
        if (m.width > 0 && m.height > 0) {
            sb.append("Resolution:     ").append(m.width).append(" x ").append(m.height).append("\n");
        } else if (m.height > 0) {
            sb.append("Resolution:     ").append(m.height).append("p\n");
        } else {
            sb.append("Resolution:     Probing...\n");
        }

        if (m.frameRate > 0f) {
            sb.append(String.format(Locale.US, "Framerate:      %.2f fps\n", m.frameRate));
        } else {
            sb.append("Framerate:      N/A\n");
        }

        if (m.bitrate > 0) {
            double mbps = m.bitrate / 1_000_000.0;
            int kbps = (int) (m.bitrate / 1_000);
            sb.append(String.format(Locale.US, "Stream Bitrate: %.2f Mbps (%d kbps)\n", mbps, kbps));
        } else {
            sb.append("Stream Bitrate: Probing...\n");
        }

        if (m.estimatedBandwidth > 0) {
            double bwMbps = m.estimatedBandwidth / 1_000_000.0;
            sb.append(String.format(Locale.US, "Net Bandwidth:  %.2f Mbps\n", bwMbps));
        }

        if (!m.codecs.isEmpty()) {
            sb.append("Video Codec:    ").append(m.codecs).append("\n");
        }
        if (!m.mimeType.isEmpty()) {
            sb.append("MIME Type:      ").append(m.mimeType).append("\n");
        }

        sb.append("\n[ AUDIO RENDITION ]\n");
        sb.append("Audio Quality:  ").append(m.getAudioDescription()).append("\n");
        if (m.audioChannels > 0) {
            String chStr = (m.audioChannels >= 6) ? "5.1 Surround (6 ch)" : ((m.audioChannels == 2) ? "Stereo (2 ch)" : m.audioChannels + " channels");
            sb.append("Channels:       ").append(chStr).append("\n");
        }
        if (m.audioSampleRate > 0) {
            sb.append(String.format(Locale.US, "Sample Rate:    %.1f kHz (%d Hz)\n", m.audioSampleRate / 1000.0, m.audioSampleRate));
        }
        if (m.audioBitrate > 0) {
            sb.append("Audio Bitrate:  ").append(m.audioBitrate / 1000).append(" kbps\n");
        }
        if (!m.audioCodec.isEmpty()) {
            sb.append("Audio Codec:    ").append(m.audioCodec).append("\n");
        }
        if (!m.audioLanguage.isEmpty()) {
            sb.append("Language:       ").append(m.audioLanguage).append("\n");
        }
        if (!m.audioMimeType.isEmpty()) {
            sb.append("Audio MIME:     ").append(m.audioMimeType).append("\n");
        }

        sb.append("\n[ PLAYBACK & BUFFER ]\n");
        sb.append("Playback State: ").append(m.playbackState).append("\n");
        double bufSec = m.bufferedDurationMs / 1000.0;
        sb.append(String.format(Locale.US, "Buffered Time:  %.1f seconds\n", bufSec));
        if (selectedHeight == QUALITY_AUTO) {
            sb.append("Quality Mode:   Auto (Adaptive)\n");
        } else {
            sb.append("Quality Mode:   Locked to ").append(selectedHeight).append("p\n");
        }

        sb.append("\n[ MANIFEST VIDEO RENDITIONS ]\n");
        List<VideoTrackOption> tracks = getAvailableVideoOptions();
        if (tracks.isEmpty()) {
            sb.append("(No video renditions reported yet)\n");
        } else {
            for (VideoTrackOption t : tracks) {
                boolean isCur = t.isCurrentlyPlaying;
                if (!isCur && m.height > 0 && t.height == m.height) {
                    if (m.bitrate <= 0 || Math.abs(t.bitrate - m.bitrate) < 250_000) {
                        isCur = true;
                    }
                }
                sb.append(isCur ? "[*] " : "[ ] ");
                if (t.height >= 2160) {
                    sb.append(t.height).append("p (4K UHD) ");
                } else if (t.height > 0) {
                    sb.append(t.height).append("p ");
                } else {
                    sb.append("Track ");
                }
                if (t.frameRate > 0f) {
                    sb.append(String.format(Locale.US, "@ %.0ffps ", t.frameRate));
                }
                if (t.bitrate > 0) {
                    double mb = t.bitrate / 1_000_000.0;
                    sb.append(String.format(Locale.US, "- %.2f Mbps ", mb));
                }
                String codecStr = (t.codecs != null && !t.codecs.isEmpty()) ? t.codecs : (t.format != null && t.format.codecs != null ? t.format.codecs : "");
                if (codecStr.contains("hev") || codecStr.contains("hvc")) {
                    sb.append("(HEVC) ");
                } else if (codecStr.contains("avc")) {
                    sb.append("(AVC) ");
                }
                if (isCur) {
                    sb.append("[CURRENT]");
                }
                sb.append("\n");
            }
        }

        sb.append("\n[ MANIFEST AUDIO TRACKS ]\n");
        List<AudioTrackOption> aTracks = getAvailableAudioOptions();
        if (aTracks.isEmpty()) {
            sb.append("(No audio tracks reported yet)\n");
        } else {
            for (AudioTrackOption at : aTracks) {
                boolean isCurAudio = at.isSelected;
                if (!isCurAudio && m.audioBitrate > 0 && Math.abs(at.bitrate - m.audioBitrate) < 50_000) {
                    isCurAudio = true;
                }
                sb.append(isCurAudio ? "[*] " : "[ ] ");
                sb.append(at.getDisplayLabel()).append("\n");
            }
        }

        sb.append("\n[ 4K DRM & DEVICE CAPABILITIES ]\n");
        sb.append("Widevine DRM:   L1 (Spoofed)\n");
        sb.append("HDCP Version:   HDCP 2.2\n");
        sb.append("HEVC Decoder:   Supported (Hardware)\n");
        sb.append("Device Model:   Chromecast with Google TV 4K\n");
        sb.append("Device Codename:sabrina\n");

        return sb.toString();
    }

    // =========================================================================
    // Quality Selection & Track Override Logic
    // =========================================================================

    private static List<VideoTrackOption> extractVideoTracks(Tracks tracks) {
        List<VideoTrackOption> options = new ArrayList<>();
        if (tracks == null) {
            return options;
        }

        try {
            List<Tracks.Group> groups = tracks.getGroups();
            if (groups == null) {
                return options;
            }

            for (int g = 0; g < groups.size(); g++) {
                Tracks.Group group = groups.get(g);
                if (group == null || group.getType() != VIDEO_TRACK_TYPE) {
                    continue;
                }

                TrackGroup mediaTrackGroup = group.getMediaTrackGroup();
                int length = group.length;
                for (int i = 0; i < length; i++) {
                    Format format = group.getTrackFormat(i);
                    if (format == null) {
                        continue;
                    }
                    boolean isSelected = group.isTrackSelected(i);
                    boolean isSupported = group.isTrackSupported(i);
                    options.add(new VideoTrackOption(mediaTrackGroup, i, format, isSelected, isSupported));
                }
            }
        } catch (Throwable ignored) {
        }

        // Sort highest resolution first, then highest frameRate, then highest bitrate
        Collections.sort(options, new Comparator<VideoTrackOption>() {
            @Override
            public int compare(VideoTrackOption a, VideoTrackOption b) {
                if (b.height != a.height) {
                    return Integer.compare(b.height, a.height);
                }
                if (Float.compare(b.frameRate, a.frameRate) != 0) {
                    return Float.compare(b.frameRate, a.frameRate);
                }
                return Integer.compare(b.bitrate, a.bitrate);
            }
        });

        // Refine isCurrentlyPlaying using the player's actual videoFormat or active ExoTrackSelection
        try {
            Object p = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
            if (p != null && !options.isEmpty()) {
                int actualH = 0;
                int actualB = 0;
                Object vFmt = getFieldAny(p, "videoFormat");
                if (vFmt != null) {
                    actualH = getIntField(vFmt.getClass(), vFmt, "height", 0);
                    actualB = getIntField(vFmt.getClass(), vFmt, "bitrate", 0);
                    if (actualB <= 0) actualB = getIntField(vFmt.getClass(), vFmt, "peakBitrate", 0);
                    if (actualB <= 0) actualB = getIntField(vFmt.getClass(), vFmt, "averageBitrate", 0);
                }
                if (actualH <= 0) {
                    Object pbInfo = getFieldAny(p, "playbackInfo");
                    if (pbInfo != null) {
                        Object tsResult = getFieldAny(pbInfo, "trackSelectorResult");
                        if (tsResult != null) {
                            Object[] selections = (Object[]) getFieldAny(tsResult, "selections");
                            if (selections != null) {
                                for (Object sel : selections) {
                                    if (sel == null) continue;
                                    try {
                                        Method getSelFmt = sel.getClass().getMethod("getSelectedFormat");
                                        Object sFmt = getSelFmt.invoke(sel);
                                        if (sFmt != null) {
                                            int h = getIntField(sFmt.getClass(), sFmt, "height", 0);
                                            if (h > 0) {
                                                actualH = h;
                                                actualB = getIntField(sFmt.getClass(), sFmt, "bitrate", 0);
                                                break;
                                            }
                                        }
                                    } catch (Throwable ignored) {}
                                }
                            }
                        }
                    }
                }
                if (actualH > 0) {
                    VideoTrackOption matched = null;
                    for (VideoTrackOption opt : options) {
                        if (opt.height == actualH && (actualB <= 0 || opt.bitrate == actualB)) {
                            matched = opt;
                            break;
                        }
                    }
                    if (matched == null) {
                        for (VideoTrackOption opt : options) {
                            if (opt.height == actualH) {
                                matched = opt;
                                break;
                            }
                        }
                    }
                    if (matched != null) {
                        for (int i = 0; i < options.size(); i++) {
                            VideoTrackOption o = options.get(i);
                            boolean isCur = (o == matched);
                            if (o.isCurrentlyPlaying != isCur) {
                                if (o.trackGroup != null && o.format != null) {
                                    options.set(i, new VideoTrackOption(o.trackGroup, o.trackIndex, o.format, isCur, o.isSupported));
                                } else {
                                    options.set(i, new VideoTrackOption(o.trackIndex, isCur, o.isSupported, o.width, o.height, o.frameRate, o.bitrate, o.codecs));
                                }
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }

        return options;
    }

    private static List<AudioTrackOption> extractAudioTracks(Tracks tracks) {
        List<AudioTrackOption> options = new ArrayList<>();
        if (tracks == null) {
            return options;
        }
        try {
            List<Tracks.Group> groups = tracks.getGroups();
            if (groups == null) {
                return options;
            }

            int audioGroupIdx = 0;
            for (int g = 0; g < groups.size(); g++) {
                Tracks.Group group = groups.get(g);
                if (group == null || group.getType() != 1) { // 1 = C.TRACK_TYPE_AUDIO
                    continue;
                }

                TrackGroup tg = group.getMediaTrackGroup();
                int length = group.length;
                for (int i = 0; i < length; i++) {
                    Format format = group.getTrackFormat(i);
                    if (format == null) {
                        continue;
                    }
                    boolean isSelected = false;
                    if (currentSelectedAudioOption != null) {
                        if (currentSelectedAudioOption.trackGroup != null && tg != null) {
                            isSelected = (tg.equals(currentSelectedAudioOption.trackGroup) || audioGroupIdx == currentSelectedAudioOption.groupIndex)
                                    && (i == currentSelectedAudioOption.trackIndex);
                        } else {
                            isSelected = (audioGroupIdx == currentSelectedAudioOption.groupIndex) && (i == currentSelectedAudioOption.trackIndex);
                        }
                    } else {
                        isSelected = group.isTrackSelected(i);
                    }
                    int br = format.bitrate > 0 ? format.bitrate : (format.averageBitrate > 0 ? format.averageBitrate : format.peakBitrate);
                    int channels = getIntField(format.getClass(), format, "channelCount", 0);
                    int sRate = getIntField(format.getClass(), format, "sampleRate", 0);
                    options.add(new AudioTrackOption(
                            tg,
                            i,
                            audioGroupIdx,
                            isSelected,
                            channels,
                            sRate,
                            br,
                            format.codecs,
                            format.language,
                            format.label,
                            format.sampleMimeType
                    ));
                }
                audioGroupIdx++;
            }
        } catch (Throwable ignored) {
        }
        return options;
    }

    private static void applySelectedQuality(DefaultTrackSelector selector, Tracks tracks) {
        if (selector != null) {
            try {
                DefaultTrackSelector.Parameters.Builder builder = selector.buildUponParameters();

                // Re-assert active audio override so video changes or tracks updates never drop user-selected audio
                if (currentSelectedAudioOption != null) {
                    try {
                        TrackGroup targetAudioGroup = resolveAudioTrackGroup(tracks, currentSelectedAudioOption);
                        if (targetAudioGroup != null) {
                            builder.clearOverridesOfType(1);
                            builder.setOverrideForType(new TrackSelectionOverride(
                                    targetAudioGroup,
                                    currentSelectedAudioOption.trackIndex
                            ));
                        }
                        if (!currentSelectedAudioOption.language.isEmpty()) {
                            builder.setPreferredAudioLanguage(currentSelectedAudioOption.language);
                        }
                        builder.setExceedAudioConstraintsIfNecessary(true)
                                .setAllowAudioMixedMimeTypeAdaptiveness(true)
                                .setAllowAudioMixedSampleRateAdaptiveness(true)
                                .setAllowAudioMixedChannelCountAdaptiveness(true);
                    } catch (Throwable ignored) {}
                }

                List<VideoTrackOption> videoOptions = extractVideoTracks(tracks);
                int maxAvailableHeight = 1080;
                if (!videoOptions.isEmpty()) {
                    maxAvailableHeight = videoOptions.get(0).height;
                }

                if (selectedHeight == QUALITY_AUTO) {
                    // Restore adaptive streaming across video tracks, but guarantee minimum 1080p if available
                    int minH = Math.min(1080, maxAvailableHeight);
                    builder.clearOverridesOfType(VIDEO_TRACK_TYPE)
                            .clearVideoSizeConstraints()
                            .clearViewportSizeConstraints()
                            .setMinVideoBitrate(0)
                            .setMaxVideoBitrate(Integer.MAX_VALUE)
                            .setExceedVideoConstraintsIfNecessary(true)
                            .setExceedRendererCapabilitiesIfNecessary(true)
                            .setMinVideoSize(0, minH)
                            .setMaxVideoSize(Integer.MAX_VALUE, Integer.MAX_VALUE)
                            .setForceHighestSupportedBitrate(true);

                    // Explicitly restrict the video TrackSelectionOverride to >= minH tracks so ExoPlayer
                    // can never fall back to 720p/540p when 1080p+ is in the manifest.
                    if (!videoOptions.isEmpty() && videoOptions.get(0).trackGroup != null) {
                        TrackGroup vGroup = videoOptions.get(0).trackGroup;
                        List<Integer> allowedIndices = new ArrayList<>();
                        for (VideoTrackOption opt : videoOptions) {
                            if (opt.trackGroup != null && opt.trackGroup.equals(vGroup) && opt.height >= minH) {
                                if (!allowedIndices.contains(opt.trackIndex)) {
                                    allowedIndices.add(opt.trackIndex);
                                }
                            }
                        }
                        if (!allowedIndices.isEmpty()) {
                            builder.setOverrideForType(new TrackSelectionOverride(vGroup, allowedIndices));
                        }
                    }

                    selector.setParameters(builder.build());
                    lastAppliedSelector = selector;
                    lastAppliedTracks = tracks;
                    lastAppliedHeight = selectedHeight;
                    lastAppliedBitrate = selectedBitrate;
                    lastAppliedAudioOption = currentSelectedAudioOption;
                    updateAllQualityBadges();
                } else {
                    VideoTrackOption bestMatch = null;

                    if (selectedHeight >= 2160) {
                        // User wants maximum available quality (4K UHD or highest stream rendition)
                        if (!videoOptions.isEmpty()) {
                            bestMatch = videoOptions.get(0);
                        }
                    } else {
                        // 1. Try exact height + bitrate match
                        for (VideoTrackOption opt : videoOptions) {
                            if (opt.height == selectedHeight && (selectedBitrate <= 0 || opt.bitrate == selectedBitrate)) {
                                bestMatch = opt;
                                break;
                            }
                        }

                        // 2. Fallback: same height with highest bitrate
                        if (bestMatch == null) {
                            for (VideoTrackOption opt : videoOptions) {
                                if (opt.height == selectedHeight) {
                                    bestMatch = opt;
                                    break;
                                }
                            }
                        }

                        // 3. Fallback: closest available resolution if stream doesn't have exact height
                        if (bestMatch == null && !videoOptions.isEmpty()) {
                            int minDiff = Integer.MAX_VALUE;
                            for (VideoTrackOption opt : videoOptions) {
                                int diff = Math.abs(opt.height - selectedHeight);
                                if (diff < minDiff) {
                                    minDiff = diff;
                                    bestMatch = opt;
                                }
                            }
                        }
                    }

                    builder.clearOverridesOfType(VIDEO_TRACK_TYPE)
                            .clearViewportSizeConstraints()
                            .clearVideoSizeConstraints()
                            .setExceedVideoConstraintsIfNecessary(true)
                            .setExceedRendererCapabilitiesIfNecessary(true)
                            .setForceHighestSupportedBitrate(true);

                    if (bestMatch != null && bestMatch.trackGroup != null) {
                        TrackSelectionOverride override = new TrackSelectionOverride(
                                bestMatch.trackGroup,
                                bestMatch.trackIndex
                        );
                        builder.setOverrideForType(override);

                        int minH = (selectedHeight >= 2160) ? Math.min(1080, bestMatch.height) : bestMatch.height;
                        builder.setMinVideoSize(0, minH)
                                .setMaxVideoSize(Integer.MAX_VALUE, Integer.MAX_VALUE)
                                .setMinVideoBitrate(0)
                                .setMaxVideoBitrate(Integer.MAX_VALUE);
                    } else {
                        // Tracks not populated yet; enforce at least 1080p floor
                        int minH = (selectedHeight >= 2160) ? 1080 : selectedHeight;
                        builder.setMinVideoSize(0, minH)
                                .setMaxVideoSize(Integer.MAX_VALUE, Integer.MAX_VALUE)
                                .setMinVideoBitrate(0)
                                .setMaxVideoBitrate(Integer.MAX_VALUE);
                    }

                    selector.setParameters(builder.build());
                    lastAppliedSelector = selector;
                    lastAppliedTracks = tracks;
                    lastAppliedHeight = selectedHeight;
                    lastAppliedBitrate = selectedBitrate;
                    lastAppliedAudioOption = currentSelectedAudioOption;
                    updateAllQualityBadges();
                }
            } catch (Throwable ignored) {
            }
        }

        // Android TV Media3 player track selector support
        Object media3Player = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
        if (media3Player != null) {
            applyMedia3Quality(media3Player, selectedHeight, selectedBitrate);
        }
    }

    // =========================================================================
    // UI Injection & Badges
    // =========================================================================

    private static void injectQualityAndDiagnosticsButtons(final View trackSelectorButton) {
        try {
            ViewGroup parent = (ViewGroup) trackSelectorButton.getParent();
            if (parent == null) {
                return;
            }

            Context context = trackSelectorButton.getContext();

            if (trackSelectorButton instanceof LinearLayout) {
                LinearLayout buttonLayout = (LinearLayout) trackSelectorButton;
                buttonLayout.setOrientation(LinearLayout.HORIZONTAL);
                buttonLayout.setGravity(Gravity.CENTER);

                ViewGroup.LayoutParams lp = buttonLayout.getLayoutParams();
                if (lp != null) {
                    lp.width = ViewGroup.LayoutParams.WRAP_CONTENT;
                    buttonLayout.setLayoutParams(lp);
                }
                int padH = dpToPx(context, 8);
                buttonLayout.setPadding(padH, buttonLayout.getPaddingTop(), padH, buttonLayout.getPaddingBottom());

                // 1. Quality badge button
                if (buttonLayout.findViewById(QUALITY_BUTTON_VIEW_ID) == null) {
                    TextView badge = createQualityBadgeTextView(context);
                    badge.setId(QUALITY_BUTTON_VIEW_ID);
                    badge.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            showQualityDialog(v.getContext(), null);
                        }
                    });
                    badge.setOnLongClickListener(new View.OnLongClickListener() {
                        @Override
                        public boolean onLongClick(View v) {
                            showAudioTrackDialog(v.getContext());
                            return true;
                        }
                    });
                    buttonLayout.addView(badge);

                    synchronized (qualityBadgeViews) {
                        qualityBadgeViews.add(new WeakReference<>(badge));
                    }
                    updateQualityBadgeText(badge);
                }

                // 2. Diagnostics button (STATS)
                if (buttonLayout.findViewById(DIAGNOSTICS_BUTTON_VIEW_ID) == null) {
                    TextView diagBtn = createDiagnosticsButtonTextView(context);
                    diagBtn.setId(DIAGNOSTICS_BUTTON_VIEW_ID);
                    diagBtn.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            toggleDiagnosticsOverlay(v.getContext());
                        }
                    });
                    diagBtn.setOnLongClickListener(new View.OnLongClickListener() {
                        @Override
                        public boolean onLongClick(View v) {
                            showDiagnosticsDialog(v.getContext());
                            return true;
                        }
                    });
                    buttonLayout.addView(diagBtn);
                }

                // 3. Picture-in-Picture (PiP) button
                if (buttonLayout.findViewById(PIP_BUTTON_VIEW_ID) == null) {
                    final Activity activity = findActivity(context);
                    if (activity != null && android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                        TextView pipBtn = createPipButtonTextView(context);
                        pipBtn.setId(PIP_BUTTON_VIEW_ID);
                        pipBtn.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View v) {
                                enterPipMode(activity);
                            }
                        });
                        buttonLayout.addView(pipBtn);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static TextView createPipButtonTextView(Context context) {
        TextView tv = new TextView(context);
        tv.setText("PIP");
        tv.setTextColor(Color.WHITE);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        tv.setTypeface(Typeface.DEFAULT_BOLD);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);

        int padH = dpToPx(context, 6);
        int padV = dpToPx(context, 2);
        tv.setPadding(padH, padV, padH, padV);

        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dpToPx(context, 4));
        bg.setColor(Color.parseColor("#991F2421"));
        bg.setStroke(dpToPx(context, 1), Color.parseColor("#44FFFFFF"));
        tv.setBackground(bg);

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.leftMargin = dpToPx(context, 4);
        tv.setLayoutParams(params);

        tv.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                toggleDiagnosticsOverlay(v.getContext());
                return true;
            }
        });

        return tv;
    }

    public static void enterPipMode(Activity activity) {
        if (activity == null || android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.O) {
            return;
        }
        try {
            android.app.PictureInPictureParams.Builder builder = new android.app.PictureInPictureParams.Builder();
            android.util.Rational rational = new android.util.Rational(16, 9);
            builder.setAspectRatio(rational);
            activity.enterPictureInPictureMode(builder.build());
        } catch (Throwable t) {
            try {
                activity.enterPictureInPictureMode();
            } catch (Throwable ignored) {
            }
        }
    }

    private static TextView createQualityBadgeTextView(Context context) {
        TextView tv = new TextView(context);
        tv.setTextColor(Color.WHITE);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        tv.setTypeface(Typeface.DEFAULT_BOLD);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);

        int padH = dpToPx(context, 6);
        int padV = dpToPx(context, 2);
        tv.setPadding(padH, padV, padH, padV);

        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dpToPx(context, 4));
        bg.setColor(Color.parseColor("#CC05D669")); // Kayo green accent
        tv.setBackground(bg);

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.leftMargin = dpToPx(context, 4);
        tv.setLayoutParams(params);

        tv.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                toggleDiagnosticsOverlay(v.getContext());
                return true;
            }
        });

        return tv;
    }

    private static TextView createDiagnosticsButtonTextView(Context context) {
        TextView tv = new TextView(context);
        tv.setText("STATS");
        tv.setTextColor(Color.WHITE);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f);
        tv.setTypeface(Typeface.DEFAULT_BOLD);
        tv.setGravity(Gravity.CENTER);
        tv.setSingleLine(true);

        int padH = dpToPx(context, 6);
        int padV = dpToPx(context, 2);
        tv.setPadding(padH, padV, padH, padV);

        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(dpToPx(context, 4));
        bg.setColor(Color.parseColor("#DD0F172A")); // Deep dark slate
        bg.setStroke(dpToPx(context, 1), Color.parseColor("#38BDF8")); // Cyan border
        tv.setBackground(bg);

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.leftMargin = dpToPx(context, 4);
        tv.setLayoutParams(params);

        tv.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                toggleDiagnosticsOverlay(v.getContext());
                return true;
            }
        });

        return tv;
    }

    private static void updateAllQualityBadges() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                synchronized (qualityBadgeViews) {
                    for (int i = qualityBadgeViews.size() - 1; i >= 0; i--) {
                        TextView tv = qualityBadgeViews.get(i).get();
                        if (tv == null) {
                            qualityBadgeViews.remove(i);
                        } else {
                            updateQualityBadgeText(tv);
                        }
                    }
                }
                updateTvQualityButtonText();
            }
        });
    }

    private static void updateQualityBadgeText(TextView badge) {
        if (badge == null) {
            return;
        }
        VideoTrackOption playing = findCurrentlyPlayingTrack(getAvailableVideoOptions());
        if (playing == null && lastObservedMedia3Track != null) {
            playing = lastObservedMedia3Track;
        }
        int activeFps = (playing != null && playing.frameRate >= 48f) ? Math.round(playing.frameRate) : 0;
        String fpsSuffix = activeFps > 0 ? String.valueOf(activeFps) : "";

        if (selectedHeight == QUALITY_AUTO) {
            if (playing != null && playing.height > 0) {
                if (playing.height >= 2160) {
                    badge.setText("AUTO (4K" + (activeFps > 0 ? " " + activeFps + "fps" : "") + ")");
                } else {
                    badge.setText("AUTO (" + playing.height + "p" + fpsSuffix + ")");
                }
            } else {
                badge.setText("AUTO");
            }
            android.graphics.drawable.Drawable existingBg = badge.getBackground();
            if (existingBg instanceof GradientDrawable) {
                ((GradientDrawable) existingBg).setColor(0x99333333);
            } else {
                GradientDrawable bg = new GradientDrawable();
                bg.setCornerRadius(dpToPx(badge.getContext(), 4));
                bg.setColor(0x99333333);
                badge.setBackground(bg);
            }
        } else {
            if (selectedHeight >= 2160) {
                List<VideoTrackOption> opts = getAvailableVideoOptions();
                int activeH = 0;
                if (playing != null) {
                    activeH = playing.height;
                } else if (!opts.isEmpty()) {
                    activeH = opts.get(0).height;
                }
                if (activeH >= 2160) {
                    badge.setText("4K" + fpsSuffix);
                } else if (activeH > 0) {
                    badge.setText(activeH + "p" + fpsSuffix);
                } else {
                    badge.setText("MAX");
                }
            } else {
                badge.setText(selectedHeight + "p" + fpsSuffix);
            }
            android.graphics.drawable.Drawable existingBg = badge.getBackground();
            if (existingBg instanceof GradientDrawable) {
                ((GradientDrawable) existingBg).setColor(0xDD05D669);
            } else {
                GradientDrawable bg = new GradientDrawable();
                bg.setCornerRadius(dpToPx(badge.getContext(), 4));
                bg.setColor(0xDD05D669);
                badge.setBackground(bg);
            }
        }
    }

    private static VideoTrackOption findCurrentlyPlayingTrack(List<VideoTrackOption> options) {
        for (VideoTrackOption opt : options) {
            if (opt.isCurrentlyPlaying) {
                return opt;
            }
        }
        return null;
    }

    // =========================================================================
    // Quality Dialog
    // =========================================================================

    /**
     * Displays the interactive Video Quality selector dialog.
     */
    public static void showAudioTrackDialog(final Context rawContext) {
        final Activity activity = findActivity(rawContext);
        final Context context = activity != null ? activity : rawContext;
        if (context == null) return;

        final List<AudioTrackOption> audioOptions = getAvailableAudioOptions();
        if (audioOptions.isEmpty()) {
            Toast.makeText(context, "No alternate audio tracks reported yet", Toast.LENGTH_SHORT).show();
            return;
        }

        final List<String> labels = new ArrayList<>();
        int selectedIndex = 0;
        for (int i = 0; i < audioOptions.size(); i++) {
            AudioTrackOption opt = audioOptions.get(i);
            labels.add(opt.getDisplayLabel());
            if (opt.isSelected) {
                selectedIndex = i;
            }
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(context, AlertDialog.THEME_DEVICE_DEFAULT_DARK);
        builder.setTitle("Select Audio / Commentary Track");
        builder.setSingleChoiceItems(labels.toArray(new String[0]), selectedIndex, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                AudioTrackOption chosen = audioOptions.get(which);
                applySelectedAudioTrack(chosen);
                Toast.makeText(context, "Switched audio: " + chosen.getDisplayLabel(), Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            }
        });
        builder.setNegativeButton("Close", null);
        builder.show();
    }

    private static TrackGroup resolveAudioTrackGroup(Tracks tracks, AudioTrackOption chosen) {
        if (chosen == null) return null;
        if (tracks != null && tracks.getGroups() != null) {
            // 1. Exact TrackGroup match in latest Tracks
            if (chosen.trackGroup != null) {
                for (Tracks.Group group : tracks.getGroups()) {
                    if (group != null && group.getType() == 1) {
                        TrackGroup tg = group.getMediaTrackGroup();
                        if (tg != null && tg.equals(chosen.trackGroup)) {
                            return tg;
                        }
                    }
                }
            }
            // 2. Fallback to matching audio groupIndex in latest Tracks
            int audioIdx = 0;
            for (Tracks.Group group : tracks.getGroups()) {
                if (group != null && group.getType() == 1) {
                    if (audioIdx == chosen.groupIndex) {
                        return group.getMediaTrackGroup();
                    }
                    audioIdx++;
                }
            }
        }
        return chosen.trackGroup;
    }

    private static void applySelectedAudioTrack(final AudioTrackOption chosen) {
        if (chosen == null) return;
        refreshCurrentTracksFromPlayer();
        TrackGroup resolvedGroup = resolveAudioTrackGroup(currentTracks, chosen);
        if (resolvedGroup != null && chosen.trackGroup != resolvedGroup) {
            currentSelectedAudioOption = new AudioTrackOption(
                    resolvedGroup,
                    chosen.trackIndex,
                    chosen.groupIndex,
                    true,
                    chosen.channelCount,
                    chosen.sampleRate,
                    chosen.bitrate,
                    chosen.codecs,
                    chosen.language,
                    chosen.label,
                    chosen.mimeType
            );
        } else {
            currentSelectedAudioOption = chosen;
        }

        // 1. ExoPlayer v2 (Mobile)
        if (currentTrackSelector != null) {
            try {
                DefaultTrackSelector.Parameters.Builder b = currentTrackSelector.buildUponParameters();
                b.clearOverridesOfType(1); // 1 = C.TRACK_TYPE_AUDIO
                try {
                    b.clearSelectionOverrides();
                } catch (Throwable ignored) {
                }
                b.setExceedAudioConstraintsIfNecessary(true)
                        .setAllowAudioMixedMimeTypeAdaptiveness(true)
                        .setAllowAudioMixedSampleRateAdaptiveness(true)
                        .setAllowAudioMixedChannelCountAdaptiveness(true);
                if (!chosen.language.isEmpty()) {
                    b.setPreferredAudioLanguage(chosen.language);
                }

                if (resolvedGroup != null) {
                    TrackSelectionOverride override = new TrackSelectionOverride(resolvedGroup, chosen.trackIndex);
                    b.setOverrideForType(override);
                }
                currentTrackSelector.setParameters(b.build());
                android.util.Log.i("MorpheKayo", "Applied ExoPlayer2 audio track override: " + chosen.getDisplayLabel());
            } catch (Throwable t) {
                android.util.Log.e("MorpheKayo", "Error applying audio track on ExoPlayer2", t);
            }
        }

        // 2. Media3 (Android TV)
        final Object media3Player = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
        if (media3Player != null) {
            try {
                final Object tg = chosen.media3TrackGroup;
                Object overrideObj = null;
                Class<?> tsoClass = null;
                try {
                    tsoClass = Class.forName("androidx.media3.common.TrackSelectionOverride");
                    if (tg != null) {
                        try {
                            java.lang.reflect.Constructor<?> ctor = tsoClass.getConstructor(tg.getClass(), int.class);
                            overrideObj = ctor.newInstance(tg, chosen.trackIndex);
                        } catch (NoSuchMethodException e) {
                            java.lang.reflect.Constructor<?> ctor = tsoClass.getConstructor(tg.getClass(), List.class);
                            overrideObj = ctor.newInstance(tg, Collections.singletonList(Integer.valueOf(chosen.trackIndex)));
                        }
                    }
                } catch (Throwable ignored) {
                }

                Method getTSP = media3Player.getClass().getMethod("getTrackSelectionParameters");
                Object tsp = getTSP.invoke(media3Player);
                if (tsp != null) {
                    Method buildUpon = tsp.getClass().getMethod("buildUpon");
                    Object b = buildUpon.invoke(tsp);
                    if (b != null) {
                        Method clearOverrides = b.getClass().getMethod("clearOverridesOfType", int.class);
                        clearOverrides.invoke(b, 1);
                        if (overrideObj != null && tsoClass != null) {
                            try {
                                Method setOverride = b.getClass().getMethod("setOverrideForType", tsoClass);
                                setOverride.invoke(b, overrideObj);
                            } catch (NoSuchMethodException e) {
                                Method addOverride = b.getClass().getMethod("addOverride", tsoClass);
                                addOverride.invoke(b, overrideObj);
                            }
                        }
                        Method build = b.getClass().getMethod("build");
                        Object newParams = build.invoke(b);
                        for (Method m : media3Player.getClass().getMethods()) {
                            if ("setTrackSelectionParameters".equals(m.getName()) && m.getParameterTypes().length == 1) {
                                m.invoke(media3Player, newParams);
                                break;
                            }
                        }
                    }
                }
                android.util.Log.i("MorpheKayo", "Applied Media3 audio track override: " + chosen.getDisplayLabel());
            } catch (Throwable t) {
                android.util.Log.e("MorpheKayo", "Error applying audio track on Media3", t);
            }
        }
    }

    public static void showQualityDialog(final Context rawContext, final Runnable onOpenOriginalTrackSelector) {
        final Activity activity = findActivity(rawContext);
        final Context context = activity != null ? activity : rawContext;
        if (context == null) {
            return;
        }

        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    buildAndShowDialog(context, onOpenOriginalTrackSelector);
                } catch (Throwable t) {
                    Toast.makeText(context, "Unable to open quality menu: " + t.getMessage(), Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private static void buildAndShowDialog(final Context context, final Runnable onOpenOriginalTrackSelector) {
        loadPrefsIfNeeded(context);

        List<VideoTrackOption> videoOptions = getAvailableVideoOptions();
        final boolean hasLiveTracks = !videoOptions.isEmpty();

        final List<String> labels = new ArrayList<>();
        final List<Integer> heights = new ArrayList<>();
        final List<Integer> bitrates = new ArrayList<>();

        VideoTrackOption activeTrack = findCurrentlyPlayingTrack(videoOptions);
        if (activeTrack == null && lastObservedMedia3Track != null) {
            activeTrack = lastObservedMedia3Track;
        }
        String autoLabel = "Auto (Adaptive)";
        if (activeTrack != null && activeTrack.height > 0) {
            double mbps = activeTrack.bitrate > 0 ? activeTrack.bitrate / 1_000_000.0 : 0;
            String labelPrefix = activeTrack.height >= 2160 ? "4K UHD" : activeTrack.height + "p";
            if (mbps > 0) {
                autoLabel = String.format(Locale.US, "Auto (Adaptive  -  Currently %s @ %.2f Mbps)", labelPrefix, mbps);
            } else {
                autoLabel = "Auto (Adaptive  -  Currently " + labelPrefix + ")";
            }
        }

        labels.add(autoLabel);
        heights.add(QUALITY_AUTO);
        bitrates.add(QUALITY_AUTO);

        int checkedItem = 0;

        if (hasLiveTracks) {
            for (int i = 0; i < videoOptions.size(); i++) {
                VideoTrackOption opt = videoOptions.get(i);
                labels.add(opt.getDisplayLabel());
                heights.add(opt.height);
                bitrates.add(opt.bitrate);

                if (selectedHeight != QUALITY_AUTO) {
                    if (opt.height == selectedHeight && (selectedBitrate <= 0 || opt.bitrate == selectedBitrate)) {
                        checkedItem = i + 1;
                    } else if (checkedItem == 0 && opt.height == selectedHeight) {
                        checkedItem = i + 1;
                    }
                }
            }
            if (checkedItem == 0 && selectedHeight >= 2160 && !videoOptions.isEmpty()) {
                checkedItem = 1;
            }
        } else {
            // Fallback presets if opened before tracks are ready
            int[] presetHeights = {2160, 1080, 720, 540, 360, 288};
            String[] presetNames = {
                    "Maximum Available (4K UHD / 1080p50)",
                    "1080p50 (Full HD)",
                    "720p50 (HD)",
                    "540p (SD)",
                    "360p (Low)",
                    "288p (Data Saver)"
            };
            for (int i = 0; i < presetHeights.length; i++) {
                labels.add(presetNames[i]);
                heights.add(presetHeights[i]);
                bitrates.add(QUALITY_AUTO);
                if (selectedHeight == presetHeights[i]) {
                    checkedItem = i + 1;
                }
            }
        }

        CharSequence[] items = labels.toArray(new CharSequence[0]);

        AlertDialog.Builder builder = new AlertDialog.Builder(context, android.R.style.Theme_DeviceDefault_Dialog_Alert);
        builder.setTitle("Stream Video Quality");

        builder.setSingleChoiceItems(items, checkedItem, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                int chosenHeight = heights.get(which);
                int chosenBitrate = bitrates.get(which);

                selectedHeight = chosenHeight;
                selectedBitrate = chosenBitrate;
                saveSelectedQuality(context, chosenHeight, chosenBitrate);

                if (currentTrackSelector != null) {
                    applySelectedQuality(currentTrackSelector, currentTracks);
                }
                Object media3Player = currentMedia3PlayerRef != null ? currentMedia3PlayerRef.get() : null;
                if (media3Player != null) {
                    applyMedia3Quality(media3Player, chosenHeight, chosenBitrate);
                }
                updateAllQualityBadges();

                String toastMsg = (chosenHeight == QUALITY_AUTO)
                        ? "Video quality set to Auto (Adaptive)"
                        : "Locked video quality to " + labels.get(which).replace("  [Playing]", "");
                Toast.makeText(context, toastMsg, Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            }
        });

        final boolean remember = isRememberQualityEnabled(context);
        builder.setNeutralButton(
                remember ? "Remember: ON" : "Remember: OFF",
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        boolean newState = !remember;
                        setRememberQualityEnabled(context, newState);
                        if (newState) {
                            saveSelectedQuality(context, selectedHeight, selectedBitrate);
                        }
                        Toast.makeText(
                                context,
                                "Remember quality across streams: " + (newState ? "ON" : "OFF"),
                                Toast.LENGTH_SHORT
                        ).show();
                    }
                }
        );

        final List<AudioTrackOption> audioTracks = getAvailableAudioOptions();
        if (audioTracks.size() >= 1) {
            builder.setPositiveButton("Audio (" + audioTracks.size() + ")", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                    showAudioTrackDialog(context);
                }
            });
        } else if (onOpenOriginalTrackSelector != null) {
            builder.setPositiveButton("Audio / CC", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                    onOpenOriginalTrackSelector.run();
                }
            });
        } else {
            builder.setPositiveButton("Diagnostics", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                    showDiagnosticsDialog(context);
                }
            });
        }

        builder.setNegativeButton("Close", null);
        builder.show();
    }

    // =========================================================================
    // Persistence & Utilities
    // =========================================================================

    private static void loadPrefsIfNeeded(Context context) {
        if (prefsLoaded || context == null) {
            return;
        }
        prefsLoaded = true;
        try {
            SharedPreferences prefs = context.getApplicationContext()
                    .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            if (!prefs.getBoolean(KEY_PREFS_VERSION_1080P, false)) {
                int existingHeight = prefs.getInt(KEY_SELECTED_HEIGHT, QUALITY_MAX);
                if (existingHeight == QUALITY_AUTO || existingHeight < 1080) {
                    prefs.edit()
                            .putInt(KEY_SELECTED_HEIGHT, QUALITY_MAX)
                            .putInt(KEY_SELECTED_BITRATE, QUALITY_AUTO)
                            .putBoolean(KEY_PREFS_VERSION_1080P, true)
                            .apply();
                } else {
                    prefs.edit().putBoolean(KEY_PREFS_VERSION_1080P, true).apply();
                }
            }
            boolean remember = prefs.getBoolean(KEY_REMEMBER_QUALITY, true);
            if (remember) {
                selectedHeight = prefs.getInt(KEY_SELECTED_HEIGHT, QUALITY_MAX);
                selectedBitrate = prefs.getInt(KEY_SELECTED_BITRATE, QUALITY_AUTO);
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isRememberQualityEnabled(Context context) {
        try {
            SharedPreferences prefs = context.getApplicationContext()
                    .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            return prefs.getBoolean(KEY_REMEMBER_QUALITY, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static void setRememberQualityEnabled(Context context, boolean enabled) {
        try {
            SharedPreferences prefs = context.getApplicationContext()
                    .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            prefs.edit().putBoolean(KEY_REMEMBER_QUALITY, enabled).apply();
        } catch (Throwable ignored) {
        }
    }

    private static void saveSelectedQuality(Context context, int height, int bitrate) {
        try {
            SharedPreferences prefs = context.getApplicationContext()
                    .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            if (prefs.getBoolean(KEY_REMEMBER_QUALITY, true)) {
                prefs.edit()
                        .putInt(KEY_SELECTED_HEIGHT, height)
                        .putInt(KEY_SELECTED_BITRATE, bitrate)
                        .apply();
            }
        } catch (Throwable ignored) {
        }
    }

    private static Activity findActivity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            current = ((ContextWrapper) current).getBaseContext();
        }
        return null;
    }

    // =========================================================================
    // Android TV In-Player Quality Button & Focus Navigation
    // =========================================================================

    private static final int TV_QUALITY_BUTTON_VIEW_ID = 0x7f0b9995;
    private static final int TV_QUALITY_BUTTON_TEXT_VIEW_ID = 0x7f0b9994;

    public static boolean isTvVideoPlaying() {
        if (currentMedia3PlayerRef == null) {
            return isTvStreamActive;
        }
        Object player = currentMedia3PlayerRef.get();
        if (player == null) {
            return isTvStreamActive;
        }

        try {
            // Check playerReleased on ExoPlayerImpl
            Object releasedObj = getFieldAny(player, "playerReleased");
            if (releasedObj instanceof Boolean && (Boolean) releasedObj) {
                isTvStreamActive = false;
                return false;
            }

            // Check Media3 playback state
            try {
                Method getPlaybackState = player.getClass().getMethod("getPlaybackState");
                getPlaybackState.setAccessible(true);
                int state = (Integer) getPlaybackState.invoke(player);
                // 1 = STATE_IDLE, 2 = STATE_BUFFERING, 3 = STATE_READY, 4 = STATE_ENDED
                if (state == 2 || state == 3) {
                    isTvStreamActive = true;
                    return true;
                }
                if (state == 1 || state == 4) {
                    isTvStreamActive = false;
                    return false;
                }
            } catch (Throwable ignored) {
            }

            // Check isPlaying()
            try {
                Method isPlayingMethod = player.getClass().getMethod("isPlaying");
                isPlayingMethod.setAccessible(true);
                if ((Boolean) isPlayingMethod.invoke(player)) {
                    isTvStreamActive = true;
                    return true;
                }
            } catch (Throwable ignored) {
            }

            return isTvStreamActive;
        } catch (Throwable ignored) {
            return isTvStreamActive;
        }
    }

    public static void showTvQualityButtonBriefly() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    View btn = tvQualityButtonOverlayRef != null ? tvQualityButtonOverlayRef.get() : null;
                    if (btn != null) {
                        cancelTvButtonFade();
                        btn.animate().cancel();
                        btn.setVisibility(View.VISIBLE);
                        btn.setAlpha(1.0f);
                        btn.setScaleX(1.0f);
                        btn.setScaleY(1.0f);
                        btn.bringToFront();
                        updateTvQualityButtonText();
                        scheduleTvButtonFade();
                    }
                } catch (Throwable ignored) {
                }
            }
        });
    }

    public static void ensureTvQualityButtonAttached(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        Runnable r = new Runnable() {
            @Override
            public void run() {
                try {
                    ViewGroup root = (ViewGroup) activity.findViewById(android.R.id.content);
                    if (root == null) {
                        View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
                        if (decor instanceof ViewGroup) {
                            root = (ViewGroup) decor;
                        }
                    }
                    if (root == null) {
                        return;
                    }

                    View existingBtn = root.findViewById(TV_QUALITY_BUTTON_VIEW_ID);
                    if (existingBtn != null) {
                        existingBtn.bringToFront();
                        tvQualityButtonOverlayRef = new WeakReference<>(existingBtn);
                        TextView existingTv = existingBtn.findViewById(TV_QUALITY_BUTTON_TEXT_VIEW_ID);
                        if (existingTv != null) {
                            tvQualityButtonTextRef = new WeakReference<>(existingTv);
                        }
                        updateTvQualityButtonText();
                        return;
                    }

                    // Create TV Quality Button Layout
                    final FrameLayout buttonContainer = new FrameLayout(activity);
                    buttonContainer.setId(TV_QUALITY_BUTTON_VIEW_ID);
                    buttonContainer.setFocusable(true);
                    buttonContainer.setFocusableInTouchMode(true);
                    buttonContainer.setClickable(true);
                    buttonContainer.setBackground(createTvButtonBackground(activity, false));
                    buttonContainer.setVisibility(View.GONE); // Start hidden until playback or DPAD_UP
                    buttonContainer.setElevation(dpToPx(activity, 20));

                    FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT
                    );
                    lp.gravity = Gravity.TOP | Gravity.END;
                    lp.topMargin = dpToPx(activity, 32);
                    lp.rightMargin = dpToPx(activity, 48);
                    buttonContainer.setLayoutParams(lp);

                    // Inner TextView
                    final TextView tv = new TextView(activity);
                    tv.setId(TV_QUALITY_BUTTON_TEXT_VIEW_ID);
                    tv.setTextColor(Color.parseColor("#EEEEEE"));
                    tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
                    tv.setTypeface(Typeface.DEFAULT_BOLD);
                    tv.setShadowLayer(4f, 1f, 1f, Color.BLACK);

                    int padH = dpToPx(activity, 16);
                    int padV = dpToPx(activity, 8);
                    tv.setPadding(padH, padV, padH, padV);
                    buttonContainer.addView(tv);

                    buttonContainer.setOnFocusChangeListener(new View.OnFocusChangeListener() {
                        @Override
                        public void onFocusChange(View v, boolean hasFocus) {
                            updateTvButtonFocusState(activity, v, hasFocus);
                        }
                    });

                    buttonContainer.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            showQualityDialog(activity, null);
                        }
                    });

                    root.addView(buttonContainer);
                    buttonContainer.bringToFront();
                    tvQualityButtonOverlayRef = new WeakReference<View>(buttonContainer);
                    tvQualityButtonTextRef = new WeakReference<>(tv);

                    updateTvQualityButtonText();
                    android.util.Log.i("MorpheKayo", "TV Quality Button attached to view hierarchy");
                } catch (Throwable t) {
                    android.util.Log.e("MorpheKayo", "Error attaching TV Quality Button", t);
                }
            }
        };

        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            mainHandler.post(r);
        }
    }

    private static void updateTvButtonFocusState(Context context, View button, boolean hasFocus) {
        if (button == null) return;
        button.setBackground(createTvButtonBackground(context, hasFocus));
        TextView tv = tvQualityButtonTextRef != null ? tvQualityButtonTextRef.get() : null;
        if (tv != null) {
            tv.setTextColor(hasFocus ? Color.WHITE : Color.parseColor("#EEEEEE"));
        }
        if (hasFocus) {
            button.setAlpha(1.0f);
            button.animate().scaleX(1.10f).scaleY(1.10f).setDuration(150).start();
            cancelTvButtonFade();
            updateTvQualityButtonText();
        } else {
            button.animate().scaleX(1.0f).scaleY(1.0f).setDuration(150).start();
            updateTvQualityButtonText();
            scheduleTvButtonFade();
        }
    }

    private static GradientDrawable createTvButtonBackground(Context context, boolean focused) {
        GradientDrawable gd = new GradientDrawable();
        gd.setShape(GradientDrawable.RECTANGLE);
        gd.setCornerRadius(dpToPx(context, 18));
        if (focused) {
            gd.setColor(Color.parseColor("#FF2B2B2B"));
            gd.setStroke(dpToPx(context, 3.0f), Color.parseColor("#00E676")); // High-vis Morphe green border
        } else {
            gd.setColor(Color.parseColor("#CC181818")); // Semi-transparent dark
            gd.setStroke(dpToPx(context, 1.5f), Color.parseColor("#44FFFFFF"));
        }
        return gd;
    }

    public static void updateTvQualityButtonText() {
        if (tvQualityButtonTextRef == null) return;
        final TextView tv = tvQualityButtonTextRef.get();
        if (tv == null) return;

        final View btn = tvQualityButtonOverlayRef != null ? tvQualityButtonOverlayRef.get() : null;
        final boolean focused = btn != null && btn.hasFocus();

        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    String prefix = focused ? "⚙ QUALITY: " : "⚙ ";
                    VideoTrackOption playing = findCurrentlyPlayingTrack(getAvailableVideoOptions());
                    if (playing == null && lastObservedMedia3Track != null) {
                        playing = lastObservedMedia3Track;
                    }
                    int activeFps = (playing != null && playing.frameRate >= 48f) ? Math.round(playing.frameRate) : 0;
                    String fpsSuffix = activeFps > 0 ? String.valueOf(activeFps) : "";

                    if (selectedHeight == QUALITY_AUTO) {
                        if (playing != null && playing.height >= 2160) {
                            tv.setText(prefix + "AUTO (4K" + (activeFps > 0 ? " " + activeFps + "fps" : "") + ")");
                        } else if (playing != null && playing.height > 0) {
                            tv.setText(prefix + "AUTO (" + playing.height + "p" + fpsSuffix + ")");
                        } else {
                            tv.setText(prefix + "AUTO");
                        }
                    } else {
                        if (selectedHeight >= 2160) {
                            List<VideoTrackOption> opts = getAvailableVideoOptions();
                            int activeH = 0;
                            if (playing != null) {
                                activeH = playing.height;
                            } else if (!opts.isEmpty()) {
                                activeH = opts.get(0).height;
                            }
                            if (activeH >= 2160) {
                                tv.setText(prefix + "4K UHD" + (activeFps > 0 ? " " + activeFps + "fps" : ""));
                            } else if (activeH > 0) {
                                tv.setText(prefix + activeH + "p" + fpsSuffix + " (MAX)");
                            } else {
                                tv.setText(prefix + "MAX");
                            }
                        } else {
                            tv.setText(prefix + selectedHeight + "p" + fpsSuffix);
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        });
    }

    public static void hideTvQualityButton() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    cancelTvButtonFade();
                    if (tvQualityButtonOverlayRef != null) {
                        View btn = tvQualityButtonOverlayRef.get();
                        if (btn != null) {
                            btn.animate().cancel();
                            btn.setVisibility(View.GONE);
                            btn.clearFocus();
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        });
    }

    public static void onTvPlayerReleased() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    isTvStreamActive = false;
                    currentMedia3PlayerRef = null;
                    currentTvPlayerViewRef = null;
                    cancelTvButtonFade();
                    hideTvQualityButton();
                    if (tvQualityButtonOverlayRef != null) {
                        View btn = tvQualityButtonOverlayRef.get();
                        if (btn != null) {
                            btn.setVisibility(View.GONE);
                            btn.clearFocus();
                            if (btn.getParent() instanceof ViewGroup) {
                                ((ViewGroup) btn.getParent()).removeView(btn);
                            }
                        }
                        tvQualityButtonOverlayRef = null;
                        tvQualityButtonTextRef = null;
                    }
                    hideDiagnosticsOverlay();
                    android.util.Log.i("MorpheKayo", "onTvPlayerReleased: TV player resources cleaned up");
                } catch (Throwable ignored) {
                }
            }
        });
    }

    public static void hideDiagnosticsOverlay() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                try {
                    stopDiagnosticsOverlayTimer();
                    if (activeOverlayRef != null) {
                        View overlay = activeOverlayRef.get();
                        if (overlay != null && overlay.getParent() instanceof ViewGroup) {
                            ((ViewGroup) overlay.getParent()).removeView(overlay);
                        }
                        activeOverlayRef = null;
                    }
                } catch (Throwable ignored) {
                }
            }
        });
    }

    private static void scheduleTvButtonFade() {
        cancelTvButtonFade();
        tvButtonFadeRunnable = new Runnable() {
            @Override
            public void run() {
                View btn = tvQualityButtonOverlayRef != null ? tvQualityButtonOverlayRef.get() : null;
                if (btn != null && !btn.hasFocus()) {
                    btn.animate().alpha(0.0f).setDuration(400).withEndAction(new Runnable() {
                        @Override
                        public void run() {
                            View b = tvQualityButtonOverlayRef != null ? tvQualityButtonOverlayRef.get() : null;
                            if (b != null && !b.hasFocus()) {
                                b.setVisibility(View.GONE);
                            }
                        }
                    }).start();
                }
            }
        };
        mainHandler.postDelayed(tvButtonFadeRunnable, 6000L);
    }

    private static void cancelTvButtonFade() {
        if (tvButtonFadeRunnable != null) {
            mainHandler.removeCallbacks(tvButtonFadeRunnable);
            tvButtonFadeRunnable = null;
        }
    }

    private static View findWebView(Activity activity) {
        if (activity == null) return null;
        try {
            View root = activity.findViewById(android.R.id.content);
            if (root instanceof ViewGroup) {
                return findWebViewRecursive((ViewGroup) root);
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static View findWebViewRecursive(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof android.webkit.WebView) {
                return child;
            }
            if (child instanceof ViewGroup) {
                View found = findWebViewRecursive((ViewGroup) child);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static int dpToPx(Context context, int dp) {
        if (context == null) {
            return Math.round(dp * android.content.res.Resources.getSystem().getDisplayMetrics().density);
        }
        return Math.round(
                TypedValue.applyDimension(
                        TypedValue.COMPLEX_UNIT_DIP,
                        dp,
                        context.getResources().getDisplayMetrics()
                )
        );
    }

    private static int dpToPx(Context context, float dp) {
        if (context == null) {
            return Math.round(dp * android.content.res.Resources.getSystem().getDisplayMetrics().density);
        }
        return Math.round(
                TypedValue.applyDimension(
                        TypedValue.COMPLEX_UNIT_DIP,
                        dp,
                        context.getResources().getDisplayMetrics()
                )
        );
    }
}
