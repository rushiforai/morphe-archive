/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.DeVancedSettings;

public final class MediaQualityController {
    private static final String TAG = "MorpheQuality";
    private static final String VIDEO_DATA_SOURCE =
            "com.facebook.video.engine.api.VideoDataSource";
    private static final AtomicInteger LOG_BUDGET = new AtomicInteger(160);

    private MediaQualityController() {
    }

    public static String overridePreselectedQuality(
            String original,
            String origin,
            Object playerParams
    ) {
        Surface surface = surface(origin);
        if (surface == Surface.OTHER) return original;

        PlaybackQuality quality = surface == Surface.REELS
                ? DeVancedSettings.getReelsPlaybackQuality()
                : DeVancedSettings.getStoriesPlaybackQuality();
        int requestedEdge = quality.targetQualityEdge();
        DownloadQuality downloadQuality =
                DeVancedSettings.getDownloadQuality();
        if (downloadQuality != null &&
                downloadQuality.targetQualityEdge() > 0 &&
                (requestedEdge <= 0 ||
                        requestedEdge > downloadQuality.targetQualityEdge())) {
            requestedEdge = downloadQuality.targetQualityEdge();
        }
        if (requestedEdge <= 0) return original;

        long started = System.nanoTime();
        List<MediaVariant> variants = DashManifestParser.parseFast(
                manifest(playerParams)
        );
        long elapsedMs = (System.nanoTime() - started) / 1_000_000L;
        MediaVariant selected =
                MediaVariantSelector.bestDashVideoForTarget(
                        variants,
                        requestedEdge
                );
        String resolved = selected == null
                ? fallbackPlayerQualityToken(requestedEdge)
                : selected.qualityLabelEdge() + "p";
        if (LOG_BUDGET.getAndDecrement() > 0) {
            Log.i(
                    TAG,
                    "surface=" + surface.name().toLowerCase() +
                            " origin=" + origin +
                            " requested=" + requestedEdge + "p" +
                            " token=" + resolved +
                            " resolved=" + resolved +
                            " available=" + availableQualities(variants) +
                            " original=" +
                            (original == null ? "null" : original) +
                            " parseMs=" + elapsedMs
            );
        }
        return resolved;
    }

    private static String fallbackPlayerQualityToken(int qualityEdge) {
        return qualityEdge <= 720 ? "SD" : "HD";
    }

    private static Surface surface(String origin) {
        if (origin == null || origin.isEmpty()) return Surface.OTHER;
        String normalized = origin.toLowerCase(Locale.US);
        if (normalized.contains("short") ||
                normalized.contains("reel")) {
            return Surface.REELS;
        }
        if (normalized.contains("stori") ||
                normalized.contains("story")) {
            return Surface.STORIES;
        }
        return Surface.OTHER;
    }

    private static String manifest(Object playerParams) {
        Object dataSource = fieldValueByType(
                playerParams,
                VIDEO_DATA_SOURCE
        );
        if (dataSource == null) return null;

        for (Class<?> type = dataSource.getClass();
             type != null && type != Object.class;
             type = type.getSuperclass()) {
            Field[] fields;
            try {
                fields = type.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }
            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers()) ||
                        field.getType() != String.class) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    String value = (String) field.get(dataSource);
                    if (value != null &&
                            (value.contains("<MPD") ||
                                    value.contains("<mpd") ||
                                    value.contains("&lt;MPD") ||
                                    value.contains("&lt;mpd"))) {
                        return value;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return null;
    }

    private static Object fieldValueByType(Object owner, String typeName) {
        if (owner == null) return null;
        Class<?> requestedType = null;
        try {
            requestedType = Class.forName(typeName);
        } catch (Throwable ignored) {
        }
        for (Class<?> type = owner.getClass();
             type != null && type != Object.class;
             type = type.getSuperclass()) {
            Field[] fields;
            try {
                fields = type.getDeclaredFields();
            } catch (Throwable ignored) {
                continue;
            }
            for (Field field : fields) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object value = field.get(owner);
                    if (typeName.equals(field.getType().getName()) ||
                            (requestedType != null &&
                                    value != null &&
                                    requestedType.isInstance(value))) {
                        return value;
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        return null;
    }

    private static Set<Integer> availableQualities(
            List<MediaVariant> variants
    ) {
        TreeSet<Integer> qualities = new TreeSet<>();
        if (variants == null) return qualities;
        for (MediaVariant variant : variants) {
            if (variant != null &&
                    variant.kind == MediaVariant.Kind.DASH_VIDEO &&
                    variant.qualityLabelEdge() > 0) {
                qualities.add(variant.qualityLabelEdge());
            }
        }
        return qualities;
    }

    private enum Surface {
        REELS,
        STORIES,
        OTHER
    }
}
