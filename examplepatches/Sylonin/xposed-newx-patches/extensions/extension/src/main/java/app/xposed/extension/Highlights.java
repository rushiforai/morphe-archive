package app.xposed.extension;

import android.graphics.Canvas;
import android.util.Log;
import android.util.LruCache;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import kotlin.jvm.functions.Function1;

/**
 * The highlight X-Posed draws over matching posts and people, as a Compose Modifier that
 * replaces a composable's Modifier argument. Main thread.
 */
final class Highlights {
    private static Draw draw;
    private static String drawKey;
    private static volatile boolean broken;

    /** Highlighted modifiers by what they were made from, so equal inputs give the same one. */
    private static final LruCache<List<Object>, Object> highlighted = new LruCache<>(256);
    /**
     * Each highlighted modifier and the one it was made from. A composable's restart lambda
     * captures its arguments after our hook replaced them, so a recomposition passes our
     * highlighted modifier back in; the hooks start from the original instead.
     */
    private static final Map<Object, Object> origins = Collections.synchronizedMap(new WeakHashMap<>());

    private Highlights() {
    }

    /** The modifier a hooked composable was given before any highlight of ours. */
    static Object original(Object modifier) {
        if (modifier == null) return null;
        Object origin = origins.get(modifier);
        return origin != null ? origin : modifier;
    }

    /** The original modifier with the highlight drawn over its content, or the original when drawing is unavailable. */
    static Object apply(Object original) {
        Draw d = draw();
        if (d == null) return original;
        List<Object> key = Arrays.asList(original, d);
        Object cached = highlighted.get(key);
        if (cached != null) return cached;
        try {
            Object result = ComposeBridge.drawWithContent(original, d);
            highlighted.put(key, result);
            origins.put(result, original);
            return result;
        } catch (Throwable t) {
            broken = true;
            Log.e(Hooks.TAG, "Highlight is unavailable", t);
            return original;
        }
    }

    /** One draw lambda per look, so highlighted modifiers stay equal while the look does. */
    private static Draw draw() {
        if (broken) return null;
        boolean dark = XTheme.isDark();
        float[] contrast = Settings.highlightContrast();
        String key = dark + "|" + contrast[0] + "|" + contrast[1];
        if (!key.equals(drawKey)) {
            draw = new Draw(new Highlight(dark, Hooks.density()));
            drawKey = key;
        }
        return draw;
    }

    /** Draws the content, then the highlight over it, like the overlay X-Posed uses. */
    private static final class Draw implements Function1<Object, Object> {
        private final Highlight highlight;

        Draw(Highlight highlight) {
            this.highlight = highlight;
        }

        @Override
        public Object invoke(Object scope) {
            ComposeBridge.drawContent(scope);
            if (broken) return null;
            try {
                Canvas canvas = ComposeBridge.nativeCanvas(scope);
                if (canvas == null) return null;
                long size = ComposeBridge.drawSize(scope);
                int width = Math.round(Float.intBitsToFloat((int) (size >>> 32)));
                int height = Math.round(Float.intBitsToFloat((int) size));
                highlight.setBounds(0, 0, width, height);
                highlight.draw(canvas);
            } catch (Throwable t) {
                broken = true;
                Log.e(Hooks.TAG, "Failed to draw highlight", t);
            }
            return null;
        }
    }
}
