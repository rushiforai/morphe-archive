package dev.skulldogged.cobalt.extension;

import android.content.Context;
import android.content.SharedPreferences;

import java.net.URL;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

final class CobaltSettings {
    static final String DEFAULT_API_URL = "";
    static final String DEFAULT_TURNSTILE_URL = "";

    private static final String PREFERENCES_FILE = "morphe_prefs";

    private static final Set<String> QUALITIES = new HashSet<>(Arrays.asList(
            "max", "4320", "2160", "1440", "1080", "720", "480", "360", "240", "144"
    ));
    private static final Set<String> CODECS = new HashSet<>(Arrays.asList(
            "av1", "vp9", "h264"
    ));
    private static final Set<String> FILENAME_STYLES = new HashSet<>(Arrays.asList(
            "pretty", "classic", "basic", "nerdy"
    ));
    private static final Set<String> DOWNLOAD_MODES = new HashSet<>(Arrays.asList(
            "auto", "audio"
    ));

    private static volatile SharedPreferences preferences;

    private CobaltSettings() {
    }

    static void initialize(Context context) {
        preferences = context.getApplicationContext().getSharedPreferences(
                PREFERENCES_FILE,
                Context.MODE_PRIVATE
        );
    }

    static boolean isEnabled() {
        return preferences().getBoolean("cobalt_enabled", true);
    }

    static String apiUrl() {
        return normalizedHttpsUrl(
                preferences().getString("cobalt_api_url_v2", DEFAULT_API_URL)
        );
    }

    static String turnstileUrl() {
        return normalizedHttpsUrl(
                preferences().getString("cobalt_turnstile_url", DEFAULT_TURNSTILE_URL)
        );
    }

    private static String normalizedHttpsUrl(String configured) {
        if (configured == null || configured.trim().isEmpty()) {
            return "";
        }
        configured = configured.trim();
        try {
            URL url = new URL(configured);
            if (!"https".equalsIgnoreCase(url.getProtocol()) || url.getHost().isEmpty()) {
                return "";
            }
            return configured.endsWith("/") ? configured : configured + "/";
        } catch (Exception ignored) {
            return "";
        }
    }

    static String apiKey() {
        String value = preferences().getString("cobalt_api_key", "");
        return value == null ? "" : value.trim();
    }

    static String videoQuality() {
        return allowedString("cobalt_video_quality", "1440", QUALITIES);
    }

    static String videoCodec() {
        return allowedString("cobalt_video_codec", "av1", CODECS);
    }

    static String filenameStyle() {
        return allowedString("cobalt_filename_style", "pretty", FILENAME_STYLES);
    }

    static String downloadMode() {
        return allowedString("cobalt_download_mode", "auto", DOWNLOAD_MODES);
    }

    static boolean betterYouTubeAudio() {
        return preferences().getBoolean("cobalt_better_youtube_audio", false);
    }

    private static String allowedString(String key, String fallback, Set<String> allowed) {
        String value = preferences().getString(key, fallback);
        return value != null && allowed.contains(value) ? value : fallback;
    }

    private static SharedPreferences preferences() {
        SharedPreferences current = preferences;
        if (current == null) {
            throw new IllegalStateException("Cobalt settings are not initialized");
        }
        return current;
    }
}
