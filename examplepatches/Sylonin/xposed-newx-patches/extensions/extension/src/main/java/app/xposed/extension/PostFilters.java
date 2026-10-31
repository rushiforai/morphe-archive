package app.xposed.extension;

import android.graphics.Canvas;
import android.util.Log;
import android.util.LruCache;

import java.util.Arrays;
import java.util.List;

import kotlin.jvm.functions.Function1;

/** Applies the filters to X's post and quote composables: they are hidden or get the highlight. */
final class PostFilters {
    private static Draw highlightDraw;
    private static String highlightKey;
    private static volatile boolean broken;

    /** Highlighted modifiers by what they were made from, so equal inputs give the same one. */
    private static final LruCache<List<Object>, Object> highlighted = new LruCache<>(256);

    private PostFilters() {
    }

    /**
     * Called when a post or quote composes, with its author and its modifier (null when it uses
     * the default). Returns the modifier for it, or {@link Hooks#HIDE} when it should not be shown.
     */
    static Object onPost(String screenName, long userId, Object modifier) {
        String handle = NameBadges.normalizeHandle(screenName);
        if (handle == null) return modifier;
        Users.put(userId, handle);
        States.observe(handle);
        switch (Filters.actionFor(Lookup.get(handle))) {
            case HIDE:
                return Hooks.HIDE;
            case HIGHLIGHT:
                Draw draw = highlightDraw();
                if (draw == null) return modifier;
                List<Object> key = Arrays.asList(modifier, draw);
                Object cached = highlighted.get(key);
                if (cached != null) return cached;
                try {
                    Object result = ComposeBridge.drawWithContent(modifier, draw);
                    highlighted.put(key, result);
                    return result;
                } catch (Throwable t) {
                    broken = true;
                    Log.e(Hooks.TAG, "Highlight is unavailable", t);
                    return modifier;
                }
            default:
                return modifier;
        }
    }

    /** One draw lambda per look, so highlighted modifiers stay equal while the look does. Main thread. */
    private static Draw highlightDraw() {
        if (broken) return null;
        boolean dark = XTheme.isDark();
        float[] contrast = Settings.highlightContrast();
        String key = dark + "|" + contrast[0] + "|" + contrast[1];
        if (!key.equals(highlightKey)) {
            highlightDraw = new Draw(new Highlight(dark, Hooks.density()));
            highlightKey = key;
        }
        return highlightDraw;
    }

    /** Draws the post, then the highlight over it, like the overlay X-Posed uses. */
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
