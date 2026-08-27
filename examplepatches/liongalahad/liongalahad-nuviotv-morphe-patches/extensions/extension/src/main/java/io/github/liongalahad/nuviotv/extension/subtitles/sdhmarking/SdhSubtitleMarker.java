package io.github.liongalahad.nuviotv.extension.subtitles.sdhmarking;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;

/** Adds a display-only SDH suffix and performs bounded background sampling for addon files. */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class SdhSubtitleMarker {
    private static final int MAX_SAMPLE_BYTES = 64 * 1024;
    private static final int CONNECT_TIMEOUT_MS = 1_500;
    private static final int READ_TIMEOUT_MS = 2_500;
    private static final int MAX_CACHE_ENTRIES = 128;
    private static final Pattern EXPLICIT_SDH = Pattern.compile(
            "(?i)(?:^|[\\s._\\-\\[(])(?:sdh|hi|hoh|cc)(?:$|[\\s._\\-\\])])|" +
                    "hearing[ _.-]*impaired|hard[ _.-]*of[ _.-]*hearing|closed[ _.-]*captions?"
    );
    // One worker preserves the order in which Nuvio builds the subtitle list.
    private static final ExecutorService SCANNER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "morphe-sdh-scan");
        thread.setDaemon(true);
        return thread;
    });
    private static final Set<String> IN_FLIGHT = ConcurrentHashMap.newKeySet();
    private static final Map<String, Boolean> DETECTIONS = Collections.synchronizedMap(
            new LinkedHashMap<String, Boolean>(MAX_CACHE_ENTRIES + 1, 0.75f, true) {
                @Override protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
                    return size() > MAX_CACHE_ENTRIES;
                }
            }
    );
    private static final ThreadLocal<Object> CURRENT_OPTION = new ThreadLocal<>();
    private static final Map<Class<?>, Field> RENDERER_OPTION_FIELDS = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Field> OPTION_SUBTITLE_FIELDS = new ConcurrentHashMap<>();
    private static final Set<Class<?>> UNSUPPORTED_RENDERERS = ConcurrentHashMap.newKeySet();
    private static final Set<Class<?>> UNSUPPORTED_OPTIONS = ConcurrentHashMap.newKeySet();

    private SdhSubtitleMarker() {}

    public static String markTitle(String title, String label, String language, String id) {
        if (!MorpheSettingsRuntime.isSdhMarkingEnabled() || title == null || title.isEmpty()) return title;
        if (isExplicitSdh(title, label, language, id)) return appendSdh(title);
        if (!isEnglish(title, label, language)) return title;
        return title;
    }

    public static String markAddonTitle(String title, String id, String url) {
        return markAddonTitle(title, id, url, title);
    }

    private static String markAddonTitle(String title, String id, String url, String language) {
        if (!MorpheSettingsRuntime.isSdhMarkingEnabled() || title == null || title.isEmpty()) return title;
        if (isExplicitSdh(title, language, id, url)) return appendSdh(title);
        if (!isEnglish(title, language, id)) return title;
        String key = key(id, url);
        if (Boolean.TRUE.equals(DETECTIONS.get(key))) return appendSdh(title);
        scheduleScan(key, url);
        return title;
    }

    /** Obfuscation-safe bridge for Nuvio's addon subtitle model. */
    public static String markAddonTitle(String title, Object subtitle) {
        if (subtitle == null) return title;
        try {
            Method getId = subtitle.getClass().getMethod("getId");
            Method getUrl = subtitle.getClass().getMethod("getUrl");
            Method getLang = subtitle.getClass().getMethod("getLang");
            return markAddonTitle(
                    title,
                    (String) getId.invoke(subtitle),
                    (String) getUrl.invoke(subtitle),
                    (String) getLang.invoke(subtitle)
            );
        } catch (Throwable ignored) {
            return title;
        }
    }

    /** Registers one visible row as a Compose observer without changing its identity. */
    public static void beginOptionRendering(Object renderer) {
        SdhMarkingRefreshState.observeForCompose();
        CURRENT_OPTION.set(findCapturedOption(renderer));
    }

    /** Re-evaluates the title currently being drawn using the latest scan result. */
    public static String markCurrentOptionTitle(String title) {
        Object option = CURRENT_OPTION.get();
        if (option == null) return title;
        try {
            Field subtitleField = findSubtitleField(option.getClass());
            Object subtitle = subtitleField == null ? null : subtitleField.get(option);
            return subtitle == null ? title : markAddonTitle(title, subtitle);
        } catch (Throwable ignored) {
            return title;
        }
    }

    public static boolean isExplicitSdh(String... evidence) {
        if (evidence == null) return false;
        for (String value : evidence) {
            if (value != null && EXPLICIT_SDH.matcher(value).find()) return true;
        }
        return false;
    }

    public static boolean isEnglish(String... evidence) {
        if (evidence == null) return false;
        for (String value : evidence) {
            if (value == null) continue;
            String normalized = value.trim().toLowerCase(Locale.ROOT).replace('_', '-');
            if (normalized.equals("en") || normalized.equals("eng") || normalized.startsWith("en-") ||
                    normalized.startsWith("en\n") || normalized.startsWith("eng\n") ||
                    normalized.contains("english")) {
                return true;
            }
        }
        return false;
    }

    static String appendSdh(String title) {
        if (EXPLICIT_SDH.matcher(title).find()) return title;
        return title.trim() + " SDH";
    }

    static void clearForTests() {
        DETECTIONS.clear();
        IN_FLIGHT.clear();
        CURRENT_OPTION.remove();
        RENDERER_OPTION_FIELDS.clear();
        OPTION_SUBTITLE_FIELDS.clear();
        UNSUPPORTED_RENDERERS.clear();
        UNSUPPORTED_OPTIONS.clear();
    }

    static void recordDetectionForTests(String id, String url, boolean detected) {
        DETECTIONS.put(key(id, url), detected);
    }

    private static void scheduleScan(String key, String rawUrl) {
        if (rawUrl == null || rawUrl.isEmpty() || DETECTIONS.containsKey(key) || !IN_FLIGHT.add(key)) return;
        String lower = rawUrl.toLowerCase(Locale.ROOT);
        if (!lower.startsWith("https://") && !lower.startsWith("http://") && !lower.startsWith("file:/")) {
            IN_FLIGHT.remove(key);
            return;
        }
        SCANNER.execute(() -> {
            boolean detected = false;
            try {
                detected = scanText(rawUrl);
            } catch (Throwable ignored) {
                // A failed sample leaves the subtitle unmarked and never blocks playback.
            } finally {
                DETECTIONS.put(key, detected);
                IN_FLIGHT.remove(key);
                if (detected) SdhMarkingRefreshState.invalidate();
            }
        });
    }

    private static boolean scanText(String rawUrl) throws Exception {
        URLConnection connection = new URL(rawUrl).openConnection();
        connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        HttpURLConnection http = connection instanceof HttpURLConnection
                ? (HttpURLConnection) connection
                : null;
        if (http != null) {
            http.setInstanceFollowRedirects(true);
            http.setRequestProperty("Range", "bytes=0-" + (MAX_SAMPLE_BYTES - 1));
            http.setRequestProperty("Accept-Encoding", "identity");
        }
        try {
            if (http != null) {
                int response = http.getResponseCode();
                if (response < 200 || response >= 300) return false;
            }
            try (InputStream input = connection.getInputStream();
                 ByteArrayOutputStream output = new ByteArrayOutputStream(MAX_SAMPLE_BYTES)) {
                byte[] buffer = new byte[4_096];
                int remaining = MAX_SAMPLE_BYTES;
                while (remaining > 0) {
                    int read = input.read(buffer, 0, Math.min(buffer.length, remaining));
                    if (read < 0) break;
                    output.write(buffer, 0, read);
                    remaining -= read;
                }
                String sample = new String(output.toByteArray(), StandardCharsets.UTF_8);
                return SdhSubtitleDetector.INSTANCE.isSdh(sample);
            }
        } finally {
            if (http != null) http.disconnect();
        }
    }

    private static String key(String id, String url) {
        return String.valueOf(id) + '\n' + String.valueOf(url);
    }

    private static Object findCapturedOption(Object renderer) {
        if (renderer == null) return null;
        Class<?> rendererClass = renderer.getClass();
        if (UNSUPPORTED_RENDERERS.contains(rendererClass)) return null;
        try {
            Field cached = RENDERER_OPTION_FIELDS.get(rendererClass);
            if (cached != null) return cached.get(renderer);
            for (Field field : rendererClass.getDeclaredFields()) {
                if (findSubtitleField(field.getType()) == null) continue;
                field.setAccessible(true);
                RENDERER_OPTION_FIELDS.put(rendererClass, field);
                return field.get(renderer);
            }
        } catch (Throwable ignored) {
            // Leave this row unchanged if an optimized app layout is unfamiliar.
        }
        UNSUPPORTED_RENDERERS.add(rendererClass);
        return null;
    }

    private static Field findSubtitleField(Class<?> optionClass) {
        if (UNSUPPORTED_OPTIONS.contains(optionClass)) return null;
        Field cached = OPTION_SUBTITLE_FIELDS.get(optionClass);
        if (cached != null) return cached;
        for (Field field : optionClass.getDeclaredFields()) {
            if (!field.getType().getName().equals("com.nuvio.tv.domain.model.Subtitle") &&
                    !hasSubtitleShape(field.getType())) continue;
            field.setAccessible(true);
            OPTION_SUBTITLE_FIELDS.put(optionClass, field);
            return field;
        }
        UNSUPPORTED_OPTIONS.add(optionClass);
        return null;
    }

    private static boolean hasSubtitleShape(Class<?> type) {
        try {
            type.getMethod("getId");
            type.getMethod("getUrl");
            type.getMethod("getLang");
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }
}
