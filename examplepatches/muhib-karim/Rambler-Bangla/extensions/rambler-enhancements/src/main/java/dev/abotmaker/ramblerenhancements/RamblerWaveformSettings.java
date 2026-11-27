package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.util.Log;

import java.util.Locale;
import java.util.Map;

/**
 * Standalone Direct-Boot-safe settings store for Rambler's Hex by Anomaly waveform animations,
 * colors, and minimal tuning.
 */
public final class RamblerWaveformSettings {
    private static final String TAG = "RamblerWaveform";
    public static final String PREF_FILE = "rambler_waveform_prefs";

    public static final String PREF_KEY_LISTENING_STYLE = "listening_style";
    public static final String PREF_KEY_PROCESSING_STYLE = "processing_style";
    public static final String PREF_KEY_LISTENING_COLOR = "listening_color";
    public static final String PREF_KEY_LISTENING_COLOR_SELECTION = "listening_color_selection";
    public static final String PREF_KEY_LISTENING_CUSTOM_COLOR = "listening_custom_color";
    public static final String PREF_KEY_PROCESSING_COLOR = "processing_color";
    public static final String PREF_KEY_PROCESSING_COLOR_SELECTION = "processing_color_selection";
    public static final String PREF_KEY_PROCESSING_CUSTOM_COLOR = "processing_custom_color";
    public static final String PREF_KEY_GLOW_LOOK = "glow_look";
    public static final String PREF_KEY_DOT_SPACING_DP = "dot_spacing_dp";
    public static final String PREF_KEY_GLOW_INTENSITY = "glow_intensity";
    public static final String PREF_KEY_VOICE_RESPONSE = "voice_response";

    // Listening styles (shown while you speak)
    public static final String LISTENING_HEX_DOT_SCOPE = "hex_dot_scope";
    public static final String LISTENING_HEX_ANDROID_WAVE = "hex_android_wave";
    public static final String LISTENING_STOCK = "stock";
    public static final String DEFAULT_LISTENING_STYLE = LISTENING_HEX_DOT_SCOPE;

    // Processing styles (shown after you stop speaking, while Rambler transcribes)
    public static final String PROCESSING_FLOW = "flow";
    public static final String PROCESSING_PULSE = "pulse";
    public static final String PROCESSING_SWEEP = "sweep";
    public static final String DEFAULT_PROCESSING_STYLE = PROCESSING_FLOW;

    // Hex DotScopeShader.metal glow looks
    public static final String GLOW_LOOK_STRIP = "strip";
    public static final String GLOW_LOOK_IOS_HALO = "ios_halo";
    public static final String DEFAULT_GLOW_LOOK = GLOW_LOOK_STRIP;

    // Minimal Hex tuning bounds & defaults
    public static final float MIN_DOT_SPACING_DP = 2.2f;
    public static final float MAX_DOT_SPACING_DP = 4.5f;
    public static final float DEFAULT_DOT_SPACING_DP = 3.5f;

    public static final float MIN_GLOW_INTENSITY = 0.0f;
    public static final float MAX_GLOW_INTENSITY = 2.5f;
    public static final float DEFAULT_GLOW_INTENSITY = 1.0f;

    public static final float MIN_VOICE_RESPONSE = 0.5f;
    public static final float MAX_VOICE_RESPONSE = 2.0f;
    public static final float DEFAULT_VOICE_RESPONSE = 1.0f;

    public static final String COLOR_HEX_DEFAULT = "HEX_DEFAULT";
    public static final String COLOR_THEME_AUTO = "AUTO";
    public static final String COLOR_SELECTION_CUSTOM = "CUSTOM";

    public static final String PRESET_PEARL = "#DBD4C4";
    public static final String PRESET_AGENT_BLUE = "#7FA6E8";
    public static final String PRESET_CORAL = "#FF614F";
    public static final String PRESET_EMERALD = "#34D399";
    public static final String PRESET_VIOLET = "#A78BFA";
    public static final String PRESET_AMBER = "#FBBF24";
    public static final String PRESET_CYAN = "#22D3EE";
    public static final String PRESET_WHITE = "#FFFFFF";

    public static final String DEFAULT_CUSTOM_LISTENING_HEX = PRESET_PEARL;
    public static final String DEFAULT_CUSTOM_PROCESSING_HEX = PRESET_AGENT_BLUE;

    private static final SettingsSnapshot DEFAULT_SNAPSHOT = new SettingsSnapshot(
            DEFAULT_LISTENING_STYLE,
            DEFAULT_PROCESSING_STYLE,
            COLOR_HEX_DEFAULT,
            COLOR_HEX_DEFAULT,
            DEFAULT_GLOW_LOOK,
            DEFAULT_DOT_SPACING_DP,
            DEFAULT_GLOW_INTENSITY,
            DEFAULT_VOICE_RESPONSE);

    private RamblerWaveformSettings() {
    }

    public static final class SettingsSnapshot {
        private final String listeningStyle;
        private final String processingStyle;
        private final String listeningColorValue;
        private final String processingColorValue;
        private final String glowLook;
        private final float dotSpacingDp;
        private final float glowIntensity;
        private final float voiceResponse;

        public SettingsSnapshot(
                String listeningStyle,
                String processingStyle,
                String listeningColorValue,
                String processingColorValue) {
            this(
                    listeningStyle,
                    processingStyle,
                    listeningColorValue,
                    processingColorValue,
                    DEFAULT_GLOW_LOOK,
                    DEFAULT_DOT_SPACING_DP,
                    DEFAULT_GLOW_INTENSITY,
                    DEFAULT_VOICE_RESPONSE);
        }

        public SettingsSnapshot(
                String listeningStyle,
                String processingStyle,
                String listeningColorValue,
                String processingColorValue,
                String glowLook,
                float dotSpacingDp,
                float glowIntensity,
                float voiceResponse) {
            this.listeningStyle = normalizeListeningStyle(listeningStyle);
            this.processingStyle = normalizeProcessingStyle(processingStyle);
            this.listeningColorValue = normalizeColorValue(listeningColorValue);
            this.processingColorValue = normalizeColorValue(processingColorValue);
            this.glowLook = normalizeGlowLook(glowLook);
            this.dotSpacingDp = clampDotSpacingDp(dotSpacingDp);
            this.glowIntensity = clampGlowIntensity(glowIntensity);
            this.voiceResponse = clampVoiceResponse(voiceResponse);
        }

        public String getListeningStyle() {
            return listeningStyle;
        }

        public String getProcessingStyle() {
            return processingStyle;
        }

        public boolean isStock() {
            return LISTENING_STOCK.equals(listeningStyle);
        }

        public boolean isAndroidWaveListening() {
            return LISTENING_HEX_ANDROID_WAVE.equals(listeningStyle);
        }

        public HexDotScopeSimulation.ProcessingMode getProcessingMode() {
            if (PROCESSING_PULSE.equals(processingStyle)) {
                return HexDotScopeSimulation.ProcessingMode.PULSE;
            }
            if (PROCESSING_SWEEP.equals(processingStyle)) {
                return HexDotScopeSimulation.ProcessingMode.SWEEP;
            }
            return HexDotScopeSimulation.ProcessingMode.FLOW;
        }

        public String getListeningColorValue() {
            return listeningColorValue;
        }

        public String getProcessingColorValue() {
            return processingColorValue;
        }

        public String getGlowLook() {
            return glowLook;
        }

        public boolean isIosHaloGlow() {
            return GLOW_LOOK_IOS_HALO.equals(glowLook);
        }

        public float getDotSpacingDp() {
            return dotSpacingDp;
        }

        public float getGlowIntensity() {
            return glowIntensity;
        }

        public float getVoiceResponse() {
            return voiceResponse;
        }

        public boolean isDefaultTuning() {
            return DEFAULT_GLOW_LOOK.equals(glowLook)
                    && Math.abs(dotSpacingDp - DEFAULT_DOT_SPACING_DP) < 0.02f
                    && Math.abs(glowIntensity - DEFAULT_GLOW_INTENSITY) < 0.02f
                    && Math.abs(voiceResponse - DEFAULT_VOICE_RESPONSE) < 0.02f;
        }

        public SettingsSnapshot withListeningStyle(String nextListeningStyle) {
            return new SettingsSnapshot(
                    nextListeningStyle,
                    processingStyle,
                    listeningColorValue,
                    processingColorValue,
                    glowLook,
                    dotSpacingDp,
                    glowIntensity,
                    voiceResponse);
        }

        public SettingsSnapshot withProcessingStyle(String nextProcessingStyle) {
            return new SettingsSnapshot(
                    listeningStyle,
                    nextProcessingStyle,
                    listeningColorValue,
                    processingColorValue,
                    glowLook,
                    dotSpacingDp,
                    glowIntensity,
                    voiceResponse);
        }

        public SettingsSnapshot withColor(String colorValue, boolean isProcessingSlot) {
            return new SettingsSnapshot(
                    listeningStyle,
                    processingStyle,
                    isProcessingSlot ? listeningColorValue : colorValue,
                    isProcessingSlot ? colorValue : processingColorValue,
                    glowLook,
                    dotSpacingDp,
                    glowIntensity,
                    voiceResponse);
        }

        public SettingsSnapshot withTuning(
                String nextGlowLook,
                float nextDotSpacingDp,
                float nextGlowIntensity,
                float nextVoiceResponse) {
            return new SettingsSnapshot(
                    listeningStyle,
                    processingStyle,
                    listeningColorValue,
                    processingColorValue,
                    nextGlowLook,
                    nextDotSpacingDp,
                    nextGlowIntensity,
                    nextVoiceResponse);
        }
    }

    public static SettingsSnapshot defaultSnapshot() {
        return DEFAULT_SNAPSHOT;
    }

    public static SharedPreferences preferencesOrNull(Context context) {
        if (context == null) {
            return null;
        }
        Context app = context.getApplicationContext();
        Context base = app != null ? app : context;
        try {
            return base.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
        } catch (IllegalStateException directBootLocked) {
            try {
                return base.createDeviceProtectedStorageContext()
                        .getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
            } catch (Throwable ignored) {
                return null;
            }
        } catch (Throwable throwable) {
            logWarningSafely("Failed to open Rambler waveform preferences", throwable);
            return null;
        }
    }

    public static SettingsSnapshot snapshot(Context context) {
        try {
            return snapshotFromPreferences(preferencesOrNull(context));
        } catch (Throwable throwable) {
            logWarningSafely("Failed to read Rambler waveform settings", throwable);
            return DEFAULT_SNAPSHOT;
        }
    }

    static SettingsSnapshot snapshotFromPreferences(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_SNAPSHOT;
        }
        try {
            Map<String, ?> values = preferences.getAll();
            String listeningStyle = normalizeListeningStyle(asString(values.get(PREF_KEY_LISTENING_STYLE)));
            String processingStyle = normalizeProcessingStyle(asString(values.get(PREF_KEY_PROCESSING_STYLE)));
            String listeningColor = normalizeColorValue(asString(values.get(PREF_KEY_LISTENING_COLOR)));
            String processingColor = normalizeColorValue(asString(values.get(PREF_KEY_PROCESSING_COLOR)));
            String glowLook = normalizeGlowLook(asString(values.get(PREF_KEY_GLOW_LOOK)));
            float dotSpacingDp = clampDotSpacingDp(
                    asFloat(values.get(PREF_KEY_DOT_SPACING_DP), DEFAULT_DOT_SPACING_DP));
            float glowIntensity = clampGlowIntensity(
                    asFloat(values.get(PREF_KEY_GLOW_INTENSITY), DEFAULT_GLOW_INTENSITY));
            float voiceResponse = clampVoiceResponse(
                    asFloat(values.get(PREF_KEY_VOICE_RESPONSE), DEFAULT_VOICE_RESPONSE));
            return new SettingsSnapshot(
                    listeningStyle,
                    processingStyle,
                    listeningColor,
                    processingColor,
                    glowLook,
                    dotSpacingDp,
                    glowIntensity,
                    voiceResponse);
        } catch (Throwable throwable) {
            logWarningSafely("Failed to read Rambler waveform preferences", throwable);
            return DEFAULT_SNAPSHOT;
        }
    }

    public static String readListeningColorSelection(SharedPreferences preferences) {
        if (preferences == null) {
            return COLOR_HEX_DEFAULT;
        }
        String stored = normalizeColorSelection(
                asString(preferences.getAll().get(PREF_KEY_LISTENING_COLOR_SELECTION)));
        return stored != null
                ? stored
                : selectionForColorValue(snapshotFromPreferences(preferences).getListeningColorValue());
    }

    public static String readListeningCustomColor(SharedPreferences preferences) {
        if (preferences == null) {
            return null;
        }
        return tryNormalizeColorHex(asString(preferences.getAll().get(PREF_KEY_LISTENING_CUSTOM_COLOR)));
    }

    public static String readProcessingColorSelection(SharedPreferences preferences) {
        if (preferences == null) {
            return COLOR_HEX_DEFAULT;
        }
        String stored = normalizeColorSelection(
                asString(preferences.getAll().get(PREF_KEY_PROCESSING_COLOR_SELECTION)));
        return stored != null
                ? stored
                : selectionForColorValue(snapshotFromPreferences(preferences).getProcessingColorValue());
    }

    public static String readProcessingCustomColor(SharedPreferences preferences) {
        if (preferences == null) {
            return null;
        }
        return tryNormalizeColorHex(asString(preferences.getAll().get(PREF_KEY_PROCESSING_CUSTOM_COLOR)));
    }

    public static boolean writeListeningStyle(Context context, String listeningStyle) {
        try {
            RamblerWaveformRuntime.seedApplicationContext(context);
            SharedPreferences preferences = preferencesOrNull(context);
            return preferences != null && preferences.edit()
                    .putString(PREF_KEY_LISTENING_STYLE, normalizeListeningStyle(listeningStyle))
                    .commit();
        } catch (Throwable throwable) {
            logWarningSafely("Failed to write listening animation", throwable);
            return false;
        }
    }

    public static boolean writeProcessingStyle(Context context, String processingStyle) {
        try {
            RamblerWaveformRuntime.seedApplicationContext(context);
            SharedPreferences preferences = preferencesOrNull(context);
            return preferences != null && preferences.edit()
                    .putString(PREF_KEY_PROCESSING_STYLE, normalizeProcessingStyle(processingStyle))
                    .commit();
        } catch (Throwable throwable) {
            logWarningSafely("Failed to write processing animation", throwable);
            return false;
        }
    }

    public static boolean writeTuning(
            Context context,
            String glowLook,
            float dotSpacingDp,
            float glowIntensity,
            float voiceResponse) {
        try {
            RamblerWaveformRuntime.seedApplicationContext(context);
            SharedPreferences preferences = preferencesOrNull(context);
            return preferences != null && preferences.edit()
                    .putString(PREF_KEY_GLOW_LOOK, normalizeGlowLook(glowLook))
                    .putFloat(PREF_KEY_DOT_SPACING_DP, clampDotSpacingDp(dotSpacingDp))
                    .putFloat(PREF_KEY_GLOW_INTENSITY, clampGlowIntensity(glowIntensity))
                    .putFloat(PREF_KEY_VOICE_RESPONSE, clampVoiceResponse(voiceResponse))
                    .commit();
        } catch (Throwable throwable) {
            logWarningSafely("Failed to write Hex tuning", throwable);
            return false;
        }
    }

    public static boolean writeListeningColor(Context context, String colorValue) {
        return writeColorSlot(
                context,
                PREF_KEY_LISTENING_COLOR,
                PREF_KEY_LISTENING_COLOR_SELECTION,
                PREF_KEY_LISTENING_CUSTOM_COLOR,
                colorValue,
                false);
    }

    public static boolean writeListeningCustomColor(Context context, String colorHex) {
        return writeColorSlot(
                context,
                PREF_KEY_LISTENING_COLOR,
                PREF_KEY_LISTENING_COLOR_SELECTION,
                PREF_KEY_LISTENING_CUSTOM_COLOR,
                colorHex,
                true);
    }

    public static boolean writeProcessingColor(Context context, String colorValue) {
        return writeColorSlot(
                context,
                PREF_KEY_PROCESSING_COLOR,
                PREF_KEY_PROCESSING_COLOR_SELECTION,
                PREF_KEY_PROCESSING_CUSTOM_COLOR,
                colorValue,
                false);
    }

    public static boolean writeProcessingCustomColor(Context context, String colorHex) {
        return writeColorSlot(
                context,
                PREF_KEY_PROCESSING_COLOR,
                PREF_KEY_PROCESSING_COLOR_SELECTION,
                PREF_KEY_PROCESSING_CUSTOM_COLOR,
                colorHex,
                true);
    }

    private static boolean writeColorSlot(
            Context context,
            String valueKey,
            String selectionKey,
            String customKey,
            String rawValue,
            boolean forceCustom) {
        try {
            RamblerWaveformRuntime.seedApplicationContext(context);
            SharedPreferences preferences = preferencesOrNull(context);
            if (preferences == null) {
                return false;
            }
            if (forceCustom) {
                String normalizedHex = tryNormalizeColorHex(rawValue);
                if (normalizedHex == null) {
                    return false;
                }
                return preferences.edit()
                        .putString(valueKey, normalizedHex)
                        .putString(selectionKey, COLOR_SELECTION_CUSTOM)
                        .putString(customKey, normalizedHex)
                        .commit();
            }
            String normalized = normalizeColorValue(rawValue);
            String selection = selectionForColorValue(normalized);
            SharedPreferences.Editor editor = preferences.edit()
                    .putString(valueKey, normalized)
                    .putString(selectionKey, selection);
            if (COLOR_SELECTION_CUSTOM.equals(selection)) {
                editor.putString(customKey, normalized);
            }
            return editor.commit();
        } catch (Throwable throwable) {
            logWarningSafely("Failed to write waveform color", throwable);
            return false;
        }
    }

    public static String normalizeListeningStyle(String value) {
        if (value == null) {
            return DEFAULT_LISTENING_STYLE;
        }
        String trimmed = value.trim().toLowerCase(Locale.ROOT);
        if (LISTENING_HEX_DOT_SCOPE.equals(trimmed)
                || LISTENING_HEX_ANDROID_WAVE.equals(trimmed)
                || LISTENING_STOCK.equals(trimmed)) {
            return trimmed;
        }
        return DEFAULT_LISTENING_STYLE;
    }

    public static String normalizeProcessingStyle(String value) {
        if (value == null) {
            return DEFAULT_PROCESSING_STYLE;
        }
        String trimmed = value.trim().toLowerCase(Locale.ROOT);
        if (PROCESSING_FLOW.equals(trimmed)
                || PROCESSING_PULSE.equals(trimmed)
                || PROCESSING_SWEEP.equals(trimmed)) {
            return trimmed;
        }
        return DEFAULT_PROCESSING_STYLE;
    }

    public static String normalizeGlowLook(String value) {
        if (value == null) {
            return DEFAULT_GLOW_LOOK;
        }
        String trimmed = value.trim().toLowerCase(Locale.ROOT);
        if (GLOW_LOOK_IOS_HALO.equals(trimmed)) {
            return GLOW_LOOK_IOS_HALO;
        }
        return GLOW_LOOK_STRIP;
    }

    public static float clampDotSpacingDp(float value) {
        if (!Float.isFinite(value)) {
            return DEFAULT_DOT_SPACING_DP;
        }
        return Math.round(HexDotScopeSimulation.clamp(
                value, MIN_DOT_SPACING_DP, MAX_DOT_SPACING_DP) * 10.0f) / 10.0f;
    }

    public static float clampGlowIntensity(float value) {
        if (!Float.isFinite(value)) {
            return DEFAULT_GLOW_INTENSITY;
        }
        return Math.round(HexDotScopeSimulation.clamp(
                value, MIN_GLOW_INTENSITY, MAX_GLOW_INTENSITY) * 10.0f) / 10.0f;
    }

    public static float clampVoiceResponse(float value) {
        if (!Float.isFinite(value)) {
            return DEFAULT_VOICE_RESPONSE;
        }
        return Math.round(HexDotScopeSimulation.clamp(
                value, MIN_VOICE_RESPONSE, MAX_VOICE_RESPONSE) * 10.0f) / 10.0f;
    }

    public static boolean isHexDefault(String value) {
        return COLOR_HEX_DEFAULT.equals(normalizeColorValue(value));
    }

    public static boolean isThemeAuto(String value) {
        return COLOR_THEME_AUTO.equals(normalizeColorValue(value));
    }

    public static String normalizeColorValue(String value) {
        String trimmed = value == null ? "" : value.trim();
        if (trimmed.isEmpty() || COLOR_HEX_DEFAULT.equalsIgnoreCase(trimmed)) {
            return COLOR_HEX_DEFAULT;
        }
        if (COLOR_THEME_AUTO.equalsIgnoreCase(trimmed)) {
            return COLOR_THEME_AUTO;
        }
        String hex = tryNormalizeColorHex(trimmed);
        return hex != null ? hex : COLOR_HEX_DEFAULT;
    }

    public static String tryNormalizeColorHex(String value) {
        String normalized = value == null ? "" : value.trim();
        if (normalized.startsWith("#")) {
            normalized = normalized.substring(1);
        }
        if ((normalized.length() != 6 && normalized.length() != 8)
                || !normalized.matches("[0-9a-fA-F]+")) {
            return null;
        }
        return "#" + normalized.toUpperCase(Locale.ROOT);
    }

    public static Integer tryParseArgb(String value) {
        String hex = tryNormalizeColorHex(value);
        if (hex == null) {
            return null;
        }
        try {
            return Integer.valueOf(Color.parseColor(hex));
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String normalizeColorSelection(String value) {
        if (value == null) {
            return null;
        }
        String trimmed = value.trim();
        if (COLOR_SELECTION_CUSTOM.equalsIgnoreCase(trimmed)) {
            return COLOR_SELECTION_CUSTOM;
        }
        if (COLOR_HEX_DEFAULT.equalsIgnoreCase(trimmed)) {
            return COLOR_HEX_DEFAULT;
        }
        if (COLOR_THEME_AUTO.equalsIgnoreCase(trimmed)) {
            return COLOR_THEME_AUTO;
        }
        String hex = tryNormalizeColorHex(trimmed);
        return isPresetColor(hex) ? hex : null;
    }

    private static String selectionForColorValue(String value) {
        if (isHexDefault(value)) {
            return COLOR_HEX_DEFAULT;
        }
        if (isThemeAuto(value)) {
            return COLOR_THEME_AUTO;
        }
        return isPresetColor(value) ? value : COLOR_SELECTION_CUSTOM;
    }

    private static boolean isPresetColor(String hex) {
        return PRESET_PEARL.equals(hex)
                || PRESET_AGENT_BLUE.equals(hex)
                || PRESET_CORAL.equals(hex)
                || PRESET_EMERALD.equals(hex)
                || PRESET_VIOLET.equals(hex)
                || PRESET_AMBER.equals(hex)
                || PRESET_CYAN.equals(hex)
                || PRESET_WHITE.equals(hex);
    }

    private static String asString(Object raw) {
        return raw instanceof String text ? text : null;
    }

    private static float asFloat(Object raw, float fallback) {
        if (raw instanceof Number number) {
            return number.floatValue();
        }
        if (raw instanceof String text) {
            try {
                return Float.parseFloat(text.trim());
            } catch (NumberFormatException ignored) {
                return fallback;
            }
        }
        return fallback;
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Settings errors must never propagate into Gboard.
        }
    }
}
