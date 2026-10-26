/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.feeder;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import java.util.List;

/** All bodies are bound by the patch to guarded APIs in the official APK. */
public final class FeederHooks {
    private FeederHooks() { }
    public static String uri(Object image) {
        String fallback = null, chosen = null;
        float best = -1;
        for (Object source : sources(image)) {
            String uri = sourceUri(source);
            if (uri == null || uri.isEmpty()) continue;
            if (fallback == null) fallback = uri;
            float size = sourceWidth(source);
            if (size <= 0) size = sourceDensity(source) * 1000;
            if (size <= 0 || !Float.isFinite(size)) continue;
            // Prefer resolution closest to 2500 by proportional under/overshoot.
            // Unknown-size src fallbacks must not defeat declared srcset sources.
            float score = size <= 2500 ? size : 2500f * 2500f / size;
            if (score > best) { best = score; chosen = uri; }
        }
        return chosen == null ? fallback : chosen;
    }
    public static List<?> sources(Object image) { throw new AssertionError(); }
    public static String sourceUri(Object source) { throw new AssertionError(); }
    public static int sourceWidth(Object source) { throw new AssertionError(); }
    public static float sourceDensity(Object source) { throw new AssertionError(); }
    public static String requestUri(Object request) { throw new AssertionError(); }
    public static Object clickable(Object modifier, Object callback, String label) { throw new AssertionError(); }
    public static Class<?> clickType() { throw new AssertionError(); }
    public static Object unit() { throw new AssertionError(); }
    public static String link(Object image) { throw new AssertionError(); }
    public static String caption(Object image) { throw new AssertionError(); }
    public static void follow(Object image, Object map, Object callback) { throw new AssertionError(); }
    public static Object job() { throw new AssertionError(); }
    public static void cancel(Object job) { throw new AssertionError(); }
    public static Class<?> continuation() { throw new AssertionError(); }
    public static Object suspended() { throw new AssertionError(); }
    public static Object execute(Context context, String uri, Object completion) { throw new AssertionError(); }
    public static Object image(Object result) { throw new AssertionError(); }
    public static int width(Object image) { throw new AssertionError(); }
    public static int height(Object image) { throw new AssertionError(); }
    public static void draw(Object image, Canvas canvas) { throw new AssertionError(); }
    public static Drawable drawable(Context context, Object image) { throw new AssertionError(); }
}
