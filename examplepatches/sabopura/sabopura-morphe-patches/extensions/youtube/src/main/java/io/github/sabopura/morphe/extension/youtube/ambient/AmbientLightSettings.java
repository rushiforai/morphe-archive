package io.github.sabopura.morphe.extension.youtube.ambient;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.LinkedHashMap;
import java.util.Map;

/** Runtime ambient light settings backed by YouTube's native preference store. */
public final class AmbientLightSettings {
    static final int QUALITY_LOW = 0;
    static final int QUALITY_MEDIUM = 1;
    static final int QUALITY_HIGH = 2;

    private static final String ENABLED = "ambient_enabled";
    private static final String FULLSCREEN = "ambient_fullscreen";
    private static final String SMALL_PLAYER = "ambient_small_player";
    private static final String BLUR = "ambient_blur";
    private static final String SPREAD = "ambient_spread";
    private static final String EDGE_FADE = "ambient_edge_fade";
    private static final String BRIGHTNESS = "ambient_brightness";
    private static final String SATURATION = "ambient_saturation";
    private static final String SMOOTHING = "ambient_smoothing";
    private static final String FRAME_RATE = "ambient_frame_rate";
    private static final String QUALITY = "ambient_quality";
    private static final String BAR_DETECTION = "ambient_bar_detection";
    private static final String FILL_BARS = "ambient_fill_bars";
    private static final String ENERGY_SAVER = "ambient_energy_saver";
    private static final String PAGE_GLOW = "ambient_page_glow";
    private static final String PAGE_STRENGTH = "ambient_page_strength";
    private static final String PAGE_SIZE = "ambient_page_size";
    private static final String PAGE_COVER = "ambient_page_cover";
    private static final String LEVEL = "ambient_level";
    private static final String INTERACTION_DIM = "ambient_interaction_dim";
    private static final String IDLE_DELAY = "ambient_idle_delay";
    public static final String FALLOFF = "ambient_falloff";
    public static final String SCENE_WAVE = "ambient_scene_wave";
    public static final String BREATHE = "ambient_breathe";
    public static final String PICTURE_BACKDROP = "ambient_picture_backdrop";

    private static final String[] ALL_KEYS = {
            ENABLED, FULLSCREEN, SMALL_PLAYER, BLUR, SPREAD, EDGE_FADE, BRIGHTNESS, SATURATION,
            SMOOTHING, FRAME_RATE, QUALITY, BAR_DETECTION, FILL_BARS, ENERGY_SAVER,
            PAGE_GLOW, PAGE_STRENGTH, PAGE_SIZE, PAGE_COVER, LEVEL, INTERACTION_DIM, IDLE_DELAY,
            FALLOFF, SCENE_WAVE, BREATHE, PICTURE_BACKDROP
    };
    private static final String[] NUMERIC_KEYS = {
            BLUR, SPREAD, EDGE_FADE, BRIGHTNESS, SATURATION, SMOOTHING, FRAME_RATE, QUALITY,
            PAGE_STRENGTH, PAGE_SIZE, PAGE_COVER, LEVEL, IDLE_DELAY
    };

    private static final SharedPreferences.OnSharedPreferenceChangeListener preferenceListener =
            (sharedPreferences, key) -> {
                if (key != null && key.startsWith("ambient_")) {
                    reload();
                    AmbientLightController.onSettingsChanged();
                }
            };

    private static volatile SharedPreferences preferences;
    private static volatile boolean enabled = true;
    private static volatile boolean fullscreen = true;
    private static volatile boolean falloff;
    private static volatile boolean sceneWave;
    private static volatile boolean breathe = true;
    private static volatile boolean pictureBackdrop;
    private static volatile boolean smallPlayer = true;
    private static volatile int blur = 60;
    private static volatile int spread = 30;
    private static volatile int edgeFade = 50;
    private static volatile int brightness = 100;
    private static volatile int saturation = 120;
    private static volatile int smoothing = 50;
    private static volatile int frameRate = 30;
    private static volatile int quality = QUALITY_MEDIUM;
    private static volatile boolean barDetection = true;
    private static volatile boolean fillBars = false;
    private static volatile boolean energySaver = true;
    private static volatile int pageStrength = 80;
    private static volatile int pageSize = ImmersionProfile.REACH_WHOLE_SCREEN;
    private static volatile int pageCover = 0;
    private static volatile int level = ImmersionProfile.LEVEL_THEATER;
    private static volatile boolean interactionDim = true;
    private static volatile int idleDelaySeconds = 3;
    private static volatile ImmersionProfile profile =
            ImmersionProfile.forLevel(ImmersionProfile.LEVEL_THEATER, 80,
                    ImmersionProfile.REACH_WHOLE_SCREEN, 0);
    private static volatile int generation;

    private AmbientLightSettings() {
    }

    public static synchronized void initialize(Context context) {
        if (context == null || preferences != null) return;
        Context application = context.getApplicationContext();
        SharedPreferences nativePreferences =
                io.github.sabopura.morphe.extension.youtube.shared.SettingsStore.open(context);
        normalizeNumericPreferences(nativePreferences);
        preferences = nativePreferences;
        reload();
        nativePreferences.registerOnSharedPreferenceChangeListener(preferenceListener);
    }

    static synchronized void reload() {
        SharedPreferences prefs = preferences;
        if (prefs == null) return;
        enabled = prefs.getBoolean(ENABLED, AmbientLightController.configEnabledByDefault());
        fullscreen = prefs.getBoolean(FULLSCREEN, true);
        falloff = prefs.getBoolean(FALLOFF, false);
        sceneWave = prefs.getBoolean(SCENE_WAVE, false);
        breathe = prefs.getBoolean(BREATHE, true);
        pictureBackdrop = prefs.getBoolean(PICTURE_BACKDROP, false);
        smallPlayer = prefs.getBoolean(SMALL_PLAYER, true);
        blur = clamp(getInt(prefs, BLUR, AmbientLightController.configBlurPercent()), 0, 100);
        spread = clamp(getInt(prefs, SPREAD, AmbientLightController.configSpreadPercent()), 0, 100);
        edgeFade = clamp(getInt(prefs, EDGE_FADE, 50), 0, 100);
        brightness = clamp(getInt(prefs, BRIGHTNESS,
                AmbientLightController.configBrightnessPercent()), 30, 200);
        saturation = clamp(getInt(prefs, SATURATION,
                AmbientLightController.configSaturationPercent()), 0, 250);
        smoothing = clamp(getInt(prefs, SMOOTHING, 50), 0, 90);
        frameRate = clamp(getInt(prefs, FRAME_RATE,
                AmbientLightController.configFrameRate()), 5, 60);
        quality = clamp(getInt(prefs, QUALITY, QUALITY_MEDIUM), QUALITY_LOW, QUALITY_HIGH);
        barDetection = prefs.getBoolean(BAR_DETECTION, true);
        fillBars = prefs.getBoolean(FILL_BARS, false);
        energySaver = prefs.getBoolean(ENERGY_SAVER, true);
        pageStrength = clamp(getInt(prefs, PAGE_STRENGTH, 80), 10, 100);
        pageSize = clamp(getInt(prefs, PAGE_SIZE, ImmersionProfile.REACH_WHOLE_SCREEN), 25,
                ImmersionProfile.REACH_WHOLE_SCREEN);
        pageCover = clamp(getInt(prefs, PAGE_COVER, 0), 0, 80);
        // Theater is the only presentation: the weaker levels looked like a lesser version
        // of it. The light also always calms down while the user operates the page.
        level = ImmersionProfile.LEVEL_THEATER;
        interactionDim = true;
        idleDelaySeconds = clamp(getInt(prefs, IDLE_DELAY, 3), 1, 30);
        profile = ImmersionProfile.forLevel(level, pageStrength, pageSize, pageCover);
        generation++;
    }

    /** Converts values written by older builds before a ListPreference reads them. */
    static void normalizeForPreferenceScreen(SharedPreferences screenPreferences) {
        normalizeNumericPreferences(screenPreferences);
    }

    public static boolean toggleEnabled(Context context) {
        initialize(context);
        SharedPreferences prefs = preferences;
        boolean next = !enabled;
        enabled = next;
        if (prefs != null) prefs.edit().putBoolean(ENABLED, next).apply();
        AmbientLightController.onSettingsChanged();
        return next;
    }

    static void reset() {
        SharedPreferences prefs = preferences;
        if (prefs == null) return;
        SharedPreferences.Editor editor = prefs.edit();
        for (String key : ALL_KEYS) editor.remove(key);
        editor.commit();
        reload();
        AmbientLightController.onSettingsChanged();
    }

    private static void normalizeNumericPreferences(SharedPreferences prefs) {
        if (prefs == null) return;
        Map<String, ?> all = prefs.getAll();
        Map<String, String> replacements = new LinkedHashMap<>();
        for (String key : NUMERIC_KEYS) {
            Object value = all.get(key);
            if (value instanceof Number) {
                replacements.put(key, Integer.toString(((Number) value).intValue()));
            }
        }
        if (replacements.isEmpty()) return;
        SharedPreferences.Editor remove = prefs.edit();
        for (String key : replacements.keySet()) remove.remove(key);
        remove.commit();
        SharedPreferences.Editor replace = prefs.edit();
        for (Map.Entry<String, String> entry : replacements.entrySet()) {
            replace.putString(entry.getKey(), entry.getValue());
        }
        replace.commit();
    }

    private static int getInt(SharedPreferences prefs, String key, int defaultValue) {
        try {
            return prefs.getInt(key, defaultValue);
        } catch (ClassCastException ignored) {
            try {
                String value = prefs.getString(key, Integer.toString(defaultValue));
                return value == null ? defaultValue : Integer.parseInt(value.trim());
            } catch (RuntimeException ignoredAgain) {
                return defaultValue;
            }
        }
    }

    public static boolean isEnabled() { return enabled; }
    static boolean isFalloffEnabled() { return falloff; }
    static boolean isSceneWaveEnabled() { return sceneWave; }
    static boolean isBreatheEnabled() { return breathe; }
    static boolean isPictureBackdropEnabled() { return pictureBackdrop; }
    static boolean isFullscreenEnabled() { return fullscreen; }
    static boolean isSmallPlayerEnabled() { return smallPlayer; }
    static int getBlur() { return blur; }
    static int getSpread() { return spread; }
    static int getEdgeFade() { return edgeFade; }
    static int getBrightness() { return brightness; }
    static int getSaturation() { return saturation; }
    static int getSmoothing() { return smoothing; }
    static int getFrameRate() { return frameRate; }
    static int getQuality() { return quality; }
    static boolean isBarDetectionEnabled() { return barDetection; }
    static boolean shouldFillBars() { return fillBars; }
    static boolean isEnergySaverEnabled() { return energySaver; }
    /** The value exactly as stored, for the status row. */
    static String rawLevel() {
        SharedPreferences prefs = preferences;
        if (prefs == null) return "(not initialised)";
        Object value = prefs.getAll().get(LEVEL);
        return value == null ? "(unset)" : value + " (" + value.getClass().getSimpleName() + ")";
    }

    static boolean isPageGlowEnabled() { return profile.enabled; }
    static ImmersionProfile getProfile() { return profile; }
    static int getLevel() { return level; }
    static boolean isInteractionDimEnabled() { return interactionDim; }
    static long getIdleDelayMs() { return idleDelaySeconds * 1000L; }
    static int getGeneration() { return generation; }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
