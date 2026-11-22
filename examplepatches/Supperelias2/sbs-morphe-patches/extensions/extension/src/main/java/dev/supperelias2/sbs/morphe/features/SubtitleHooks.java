package dev.supperelias2.sbs.morphe.features;

import android.graphics.Color;
import android.graphics.Typeface;
import android.util.TypedValue;
import android.view.View;

import dev.supperelias2.sbs.morphe.MorpheSettings;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/** Applies mobile subtitle preferences after creation and after cue updates. */
@SuppressWarnings("unused")
public final class SubtitleHooks {
    private static final float FRACTIONAL_BASE = 0.0533f;
    private static final Map<Object, Baseline> BASELINES = Collections.synchronizedMap(new WeakHashMap<>());

    private SubtitleHooks() {
    }

    public static void apply(Object candidate) {
        if (!(candidate instanceof View)) return;
        View view = (View) candidate;
        boolean enabled = MorpheSettings.enabled("subtitle_customization", false);
        if (!enabled && !BASELINES.containsKey(candidate)) return;
        MorpheSettings.initialize(view.getContext());
        try {
            Baseline baseline = BASELINES.get(candidate);
            if (baseline == null) {
                baseline = new Baseline(view);
                BASELINES.put(candidate, baseline);
            }
            if (!enabled) {
                if (!baseline.applied) return;
                baseline.applied = false;
                restore(view, baseline);
                return;
            }
            float scale = MorpheSettings.getFloat("subtitle_scale", 1f);
            if (Float.isNaN(scale) || Float.isInfinite(scale)) scale = 1f;
            scale = Math.max(.5f, Math.min(3f, scale));
            int margin = Math.max(0, Math.min(128, MorpheSettings.getInt("subtitle_margin", 0)));
            boolean style = MorpheSettings.enabled("subtitle_style", false);
            if (baseline.applied && baseline.scale == scale && baseline.margin == margin && baseline.overrideStyle == style) return;
            baseline.applied = true;
            baseline.scale = scale;
            baseline.margin = margin;
            baseline.overrideStyle = style;
            invoke(view, "setFractionalTextSize", new Class<?>[]{float.class}, FRACTIONAL_BASE * scale);
            invoke(view, "setApplyEmbeddedStyles", new Class<?>[]{boolean.class}, style ? false : baseline.embeddedStyles);
            invoke(view, "setApplyEmbeddedFontSizes", new Class<?>[]{boolean.class}, style ? false : baseline.embeddedFontSizes);
            Object captionStyle = style ? captionStyle(view, 0x99000000) : baseline.style;
            if (captionStyle != null) invoke(view, "setStyle", new Class<?>[]{captionStyle.getClass()}, captionStyle);
            int pixels = Math.round(margin * view.getResources().getDisplayMetrics().density);
            view.setPadding(baseline.left, baseline.top, baseline.right, baseline.bottom + pixels);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            // Unsupported subtitle implementations retain the app's normal rendering.
        }
    }

    private static void restore(View view, Baseline baseline) throws ReflectiveOperationException {
        if (baseline.textSizeType == 2) {
            invoke(view, "setFixedTextSize", new Class<?>[]{int.class, float.class}, TypedValue.COMPLEX_UNIT_PX, baseline.textSize);
        } else {
            invoke(view, "setFractionalTextSize", new Class<?>[]{float.class, boolean.class}, baseline.textSize, baseline.textSizeType == 1);
        }
        invoke(view, "setApplyEmbeddedStyles", new Class<?>[]{boolean.class}, baseline.embeddedStyles);
        invoke(view, "setApplyEmbeddedFontSizes", new Class<?>[]{boolean.class}, baseline.embeddedFontSizes);
        if (baseline.style != null) invoke(view, "setStyle", new Class<?>[]{baseline.style.getClass()}, baseline.style);
        view.setPadding(baseline.left, baseline.top, baseline.right, baseline.bottom);
    }

    private static Object captionStyle(View view, int background) throws ReflectiveOperationException {
        Class<?> type = Class.forName("androidx.media3.ui.CaptionStyleCompat", false, view.getClass().getClassLoader());
        return type.getConstructor(int.class, int.class, int.class, int.class, int.class, Typeface.class)
                .newInstance(Color.WHITE, background, Color.TRANSPARENT, 2, Color.BLACK, null);
    }

    private static void invoke(Object target, String name, Class<?>[] types, Object... arguments) throws ReflectiveOperationException {
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        method.invoke(target, arguments);
    }

    private static Object field(Object target, String name, Object fallback) {
        Class<?> type = target.getClass();
        while (type != null) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
                type = type.getSuperclass();
            } catch (IllegalAccessException | RuntimeException ignored) {
                return fallback;
            }
        }
        return fallback;
    }

    private static final class Baseline {
        final int left;
        final int top;
        final int right;
        final int bottom;
        final float textSize;
        final int textSizeType;
        final boolean embeddedStyles;
        final boolean embeddedFontSizes;
        final Object style;
        boolean applied;
        float scale;
        int margin;
        boolean overrideStyle;

        Baseline(View view) throws ReflectiveOperationException {
            left = view.getPaddingLeft();
            top = view.getPaddingTop();
            right = view.getPaddingRight();
            bottom = view.getPaddingBottom();
            textSize = ((Number) field(view, "defaultTextSize", FRACTIONAL_BASE)).floatValue();
            textSizeType = ((Number) field(view, "defaultTextSizeType", 0)).intValue();
            embeddedStyles = Boolean.TRUE.equals(field(view, "applyEmbeddedStyles", true));
            embeddedFontSizes = Boolean.TRUE.equals(field(view, "applyEmbeddedFontSizes", true));
            Object originalStyle = field(view, "style", null);
            style = originalStyle != null ? originalStyle : captionStyle(view, Color.TRANSPARENT);
        }
    }
}
