package app.aimal.extension.streaming;

import android.graphics.Color;
import android.graphics.Typeface;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;

/**
 * Restyles the subtitles.
 *
 * HBO Max and Disney+ both render captions with media3's SubtitleView, and both
 * keep its styling API un-obfuscated — setStyle, setApplyEmbeddedStyles,
 * setApplyEmbeddedFontSizes and setFractionalTextSize all survive R8. So none of
 * this needs bytecode rewriting; the view is found by walking the tree and
 * driven by reflection, the same way the aspect ratio is.
 *
 * The one part that *is* obfuscated is media3's CaptionStyleCompat, and to a
 * different name in each app (`jf3` in HBO Max, `g9.c` in Disney+). Rather than
 * hardcode either, the class is read back from setStyle's own parameter type and
 * built through its constructor, whose shape media3 has kept stable:
 *
 *     (int foreground, int background, int window, int edgeType, int edgeColor, Typeface)
 *
 * Crunchyroll is deliberately not handled here — it does not use SubtitleView at
 * all, it draws ASS/SubStation frames to a canvas, and their styling is baked
 * into the subtitle track itself.
 */
final class Subtitles {

    /** media3's own default, which the size factors multiply. */
    private static final float DEFAULT_TEXT_SIZE_FRACTION = 0.0533f;

    static final float[] SIZES = {0.6f, 0.8f, 1.0f, 1.3f, 1.6f};
    private static final String[] SIZE_LABELS = {"0.6×", "0.8×", "1.0×", "1.3×", "1.6×"};

    private static final String[] FONT_LABELS = {"SANS", "SERIF", "MONO", "NARROW"};

    private static final String[] BACKGROUND_LABELS = {"BG OFF", "BG DIM", "BG BLACK"};
    private static final int[] BACKGROUND_COLORS = {Color.TRANSPARENT, 0x80000000, 0xFF000000};

    /** CaptionStyleCompat edge types; part of media3's public contract. */
    private static final int EDGE_TYPE_NONE = 0;
    private static final int EDGE_TYPE_OUTLINE = 1;
    private static final int EDGE_TYPE_DROP_SHADOW = 2;

    private static final String[] EDGE_LABELS = {"NO EDGE", "OUTLINE", "SHADOW"};
    private static final int[] EDGE_TYPES = {EDGE_TYPE_NONE, EDGE_TYPE_OUTLINE, EDGE_TYPE_DROP_SHADOW};

    private Subtitles() {
    }

    // Labels for the panel ----------------------------------------------------

    static int sizeCount() {
        return SIZES.length;
    }

    static String sizeLabel(int index) {
        return SIZE_LABELS[clamp(index, SIZE_LABELS.length)];
    }

    static int fontCount() {
        return FONT_LABELS.length;
    }

    static String fontLabel(int index) {
        return FONT_LABELS[clamp(index, FONT_LABELS.length)];
    }

    static int backgroundCount() {
        return BACKGROUND_LABELS.length;
    }

    static String backgroundLabel(int index) {
        return BACKGROUND_LABELS[clamp(index, BACKGROUND_LABELS.length)];
    }

    static int edgeCount() {
        return EDGE_LABELS.length;
    }

    static String edgeLabel(int index) {
        return EDGE_LABELS[clamp(index, EDGE_LABELS.length)];
    }

    // Applying ----------------------------------------------------------------

    /**
     * Applies the saved subtitle preferences to whatever SubtitleView is in this
     * view tree. Safe to call repeatedly — the apps reset their own caption
     * style when a new track is selected.
     */
    static void apply(View root) {
        if (root == null) return;

        try {
            View subtitleView = find(root);
            if (subtitleView == null) {
                Logger.d("No SubtitleView in the tree");
                return;
            }

            Class<?> type = subtitleView.getClass();

            // Embedded styles are the broadcaster's own formatting. They win
            // over anything set here, so they have to be turned off first or
            // none of this appears to do anything.
            invokeBoolean(type, subtitleView, "setApplyEmbeddedStyles", false);
            invokeBoolean(type, subtitleView, "setApplyEmbeddedFontSizes", false);

            Method fractionalTextSize = declared(type, "setFractionalTextSize", float.class);
            if (fractionalTextSize != null) {
                float factor = SIZES[clamp(Prefs.subtitleSize(), SIZES.length)];
                fractionalTextSize.setAccessible(true);
                fractionalTextSize.invoke(subtitleView, DEFAULT_TEXT_SIZE_FRACTION * factor);
            }

            Method setStyle = findSetStyle(type);
            if (setStyle != null) {
                Object style = buildStyle(setStyle.getParameterTypes()[0]);
                if (style != null) {
                    setStyle.setAccessible(true);
                    setStyle.invoke(subtitleView, style);
                }
            }

            Logger.d("Subtitle style applied to " + type.getName());
        } catch (Throwable t) {
            Logger.e("Failed to style subtitles", t);
        }
    }

    /**
     * Builds a CaptionStyleCompat without naming it. The class comes from
     * setStyle's parameter type, so a future rename changes nothing here.
     */
    private static Object buildStyle(Class<?> styleClass) {
        try {
            Constructor<?> ctor = styleClass.getDeclaredConstructor(
                    int.class, int.class, int.class, int.class, int.class, Typeface.class);
            ctor.setAccessible(true);

            int background = BACKGROUND_COLORS[clamp(Prefs.subtitleBackground(), BACKGROUND_COLORS.length)];
            int edgeType = EDGE_TYPES[clamp(Prefs.subtitleEdge(), EDGE_TYPES.length)];

            return ctor.newInstance(
                    Color.WHITE,        // foreground
                    background,         // background of the text itself
                    Color.TRANSPARENT,  // window behind the whole cue
                    edgeType,
                    Color.BLACK,        // edge colour
                    typeface(Prefs.subtitleFont()));
        } catch (Throwable t) {
            Logger.e("Could not build a caption style", t);
            return null;
        }
    }

    private static Typeface typeface(int index) {
        switch (clamp(index, FONT_LABELS.length)) {
            case 1:
                return Typeface.SERIF;
            case 2:
                return Typeface.MONOSPACE;
            case 3:
                return Typeface.create("sans-serif-condensed", Typeface.NORMAL);
            case 0:
            default:
                return Typeface.SANS_SERIF;
        }
    }

    // Locating the view -------------------------------------------------------

    /**
     * media3's SubtitleView, found by the shape of its API rather than its name.
     * `setApplyEmbeddedStyles(boolean)` is distinctive enough that nothing else
     * in these apps declares it.
     */
    private static View find(View view) {
        if (view == null) return null;

        if (declared(view.getClass(), "setApplyEmbeddedStyles", boolean.class) != null) {
            return view;
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = find(group.getChildAt(i));
                if (found != null) return found;
            }
        }

        return null;
    }

    private static Method findSetStyle(Class<?> type) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            for (Method method : c.getDeclaredMethods()) {
                if (!method.getName().equals("setStyle")) continue;
                Class<?>[] params = method.getParameterTypes();
                if (params.length == 1 && !params[0].isPrimitive()) return method;
            }
        }
        return null;
    }

    private static Method declared(Class<?> type, String name, Class<?>... params) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                return c.getDeclaredMethod(name, params);
            } catch (NoSuchMethodException ignored) {
                // Keep walking up.
            }
        }
        return null;
    }

    private static void invokeBoolean(Class<?> type, Object target, String name, boolean value) {
        Method method = declared(type, name, boolean.class);
        if (method == null) return;
        try {
            method.setAccessible(true);
            method.invoke(target, value);
        } catch (Throwable ignored) {
        }
    }

    private static int clamp(int index, int length) {
        if (index < 0 || index >= length) return 0;
        return index;
    }
}
