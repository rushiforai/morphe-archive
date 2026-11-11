package app.polishapps.extension.lidl;

import android.app.Activity;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.text.Spannable;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Dark colours for the Compose screens of Lidl Plus.
 *
 * Android's Force Dark cannot theme Compose: it treats everything Compose draws as foreground, so it
 * only lightens dark colours and leaves white cards white (or lightens a card that was already
 * recoloured dark). Compose views therefore stay opted out of Force Dark and these hooks recolour
 * shapes, icons and text where Compose hands them to its paints when the system is in night mode.
 * Force Dark still handles the window, view based and React Native screens.
 *
 * Compose packs an sRGB colour as ARGB8888 in the upper 32 bits of a long, with zero low bits.
 */
@SuppressWarnings("unused")
public final class DarkMode {

    /** Lightness at or above which a colour counts as a light surface. */
    private static final float SURFACE_MIN_LIGHTNESS = 0.80f;
    /** Lightness at or below which an opaque neutral colour counts as dark ink (text or icon). */
    private static final float INK_MAX_LIGHTNESS = 0.30f;
    /** Text at or below this lightness is lightened. Mid greys and light text keep their colour. */
    private static final float TEXT_MAX_LIGHTNESS = 0.45f;
    /** Saturation below which a colour counts as a neutral grey. */
    private static final float NEUTRAL_MAX_SATURATION = 0.14f;

    /** Windows kept light (they show scannable codes), so their bars keep dark icons. */
    private static final Set<String> LIGHT_ACTIVITIES = new HashSet<>(Arrays.asList(
            "es.lidlplus.features.customercard.ui.CustomerCardActivity",
            "es.lidlplus.features.coupons.presentation.detail.productcodes.ProductCodesActivity",
            "es.lidlplus.features.productcodes.ProductCodesActivity",
            "eu.scrm.schwarz.payments.presentation.sca.qr.ScaQrChallengeActivity"));

    private DarkMode() {
    }

    private static boolean night() {
        int mode = Resources.getSystem().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
        return mode == Configuration.UI_MODE_NIGHT_YES;
    }

    /** A fill or stroke colour of a Compose shape or vector icon. */
    public static long shapeColor(long color) {
        return remap(color, true);
    }

    /**
     * The colours of a gradient shader. Gradients paint text that fades out (long descriptions), fades
     * between content and a surface, and banners, so both directions of the shape mapping apply.
     * Returns a new array, the caller's stays untouched.
     */
    public static long[] gradientColors(long[] colors) {
        if (colors == null || !night()) {
            return colors;
        }
        long[] mapped = new long[colors.length];
        for (int i = 0; i < colors.length; i++) {
            mapped[i] = remap(colors[i], true);
        }
        return mapped;
    }

    /**
     * HTML shown in a transparent WebView on a Compose screen (descriptions, conditions). WebViews are not
     * reached by Force Dark there, so the page keeps its black text on what is now a dark card.
     */
    public static String html(String data, String mimeType) {
        if (data == null || mimeType == null || !mimeType.contains("html") || !night()) {
            return data;
        }
        return "<style>html,body,*{color:#E8EAED !important;}a,a *{color:#8AB4F8 !important;}</style>" + data;
    }

    /**
     * The body text component of Compose screens (descriptions, conditions) is a plain TextView styled with
     * the dark brand black. Force Dark never reaches a view inside Compose, so it stays dark on a dark card.
     */
    public static void styleTextView(TextView view) {
        if (view == null || !night()) {
            return;
        }
        view.setTextColor(0xFFE8EAED);
        view.setLinkTextColor(0xFF8AB4F8);
    }

    /**
     * Called right before an HTML text is set on its TextView. The HTML parser turns inline colours
     * (style="color:#222222", font color) into ForegroundColorSpans that win over the view's own colour,
     * so those spans are recoloured as well.
     */
    public static void prepareHtmlText(TextView view, CharSequence text) {
        if (view == null || !night()) {
            return;
        }
        view.setTextColor(0xFFE8EAED);
        view.setLinkTextColor(0xFF8AB4F8);
        if (!(text instanceof Spannable)) {
            return;
        }
        recolorSpans((Spannable) text);
    }

    /**
     * Every colour Compose's text paint receives, whichever way it arrives (base style, span, direct call).
     * Applying it twice changes nothing more: lightened colours are above the threshold.
     */
    public static int textColorArgb(int argb) {
        return (int) (textColor(((long) argb) << 32) >>> 32);
    }

    /**
     * Watches a Compose root view for Android views it hosts (AndroidView) and lightens dark text in them.
     * Force Dark never reaches those, and they come in many kinds (HTML, markdown, plain TextViews), so
     * instead of finding each factory the text colours are fixed where they are drawn.
     */
    public static void watch(final View composeRoot) {
        if (composeRoot == null) {
            return;
        }
        composeRoot.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            private ViewTreeObserver observer;
            private final ViewTreeObserver.OnPreDrawListener listener = () -> {
                if (composeRoot instanceof ViewGroup && night()) {
                    lightenText((ViewGroup) composeRoot);
                }
                return true;
            };

            @Override
            public void onViewAttachedToWindow(View view) {
                if (observer == null) {
                    observer = view.getViewTreeObserver();
                    observer.addOnPreDrawListener(listener);
                }
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                if (observer != null && observer.isAlive()) {
                    observer.removeOnPreDrawListener(listener);
                }
                observer = null;
            }
        });
    }

    private static void lightenText(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof TextView) {
                lightenTextView((TextView) child);
            }
            if (child instanceof ViewGroup) {
                lightenText((ViewGroup) child);
            }
        }
    }

    private static void lightenTextView(TextView view) {
        try {
            int color = view.getCurrentTextColor();
            int mapped = textColorArgb(color);
            if (mapped != color) {
                view.setTextColor(mapped);
            }
            if (view.getLinkTextColors() != null) {
                int link = view.getLinkTextColors().getDefaultColor();
                int mappedLink = textColorArgb(link);
                if (mappedLink != link) {
                    view.setLinkTextColor(mappedLink);
                }
            }
            CharSequence text = view.getText();
            if (text instanceof Spannable) {
                recolorSpans((Spannable) text);
            }
        } catch (Throwable ignored) {
            // A view that cannot be recoloured is left as it is.
        }
    }

    private static void recolorSpans(Spannable spannable) {
        for (ForegroundColorSpan span : spannable.getSpans(0, spannable.length(), ForegroundColorSpan.class)) {
            int color = span.getForegroundColor();
            int mapped = textColorArgb(color);
            if (mapped != color) {
                int start = spannable.getSpanStart(span);
                int end = spannable.getSpanEnd(span);
                int flags = spannable.getSpanFlags(span);
                spannable.removeSpan(span);
                spannable.setSpan(new ForegroundColorSpan(mapped), start, end, flags);
            }
        }
    }

    /** Text colour: dark ink and dark brand colours become light, light text stays as it is. */
    public static long textColor(long color) {
        if ((color & 0x3FL) != 0L || !night()) {
            return color;
        }
        int argb = (int) (color >>> 32);
        float[] hsl = new float[3];
        rgbToHsl((argb >> 16) & 0xFF, (argb >> 8) & 0xFF, argb & 0xFF, hsl);
        if (hsl[2] > TEXT_MAX_LIGHTNESS) {
            return color;
        }
        int rgb = hslToRgb(hsl[0], hsl[1], 0.95f - hsl[2] * 0.8f);
        return ((long) ((argb & 0xFF000000) | (rgb & 0x00FFFFFF))) << 32;
    }

    /** The tint of an icon or image. White stays white, since it is mostly text on a coloured fill. */
    public static long tintColor(long color) {
        return remap(color, false);
    }

    private static long remap(long color, boolean surfaces) {
        if ((color & 0x3FL) != 0L || !night()) {
            return color;
        }
        int argb = (int) (color >>> 32);
        int alpha = argb >>> 24;
        float[] hsl = new float[3];
        rgbToHsl((argb >> 16) & 0xFF, (argb >> 8) & 0xFF, argb & 0xFF, hsl);
        float lightness = hsl[2];

        float target;
        if (surfaces && lightness >= SURFACE_MIN_LIGHTNESS) {
            // Light surfaces, including pale tints, become dark ones of the same hue.
            target = 0.118f + (1f - lightness) * 0.8f;
        } else if (alpha >= 250 && hsl[1] <= NEUTRAL_MAX_SATURATION && lightness <= INK_MAX_LIGHTNESS
                && lightness > 0.02f) {
            // Dark ink becomes light ink. Pure black and translucent scrims are left alone.
            target = 0.95f - lightness * 0.8f;
        } else {
            return color;
        }

        int rgb = hslToRgb(hsl[0], hsl[1], target);
        int out = (alpha << 24) | (rgb & 0x00FFFFFF);
        return ((long) out) << 32;
    }

    /**
     * Status and navigation bar icons. The app asks for dark icons on light bars, which would be
     * invisible on the now dark screens, so ask for light icons instead, except in windows that stay light.
     *
     * @param controller the insets controller the request goes to
     * @param darkIcons  what the app asked for
     */
    public static boolean lightIcons(Object controller, boolean darkIcons) {
        if (!darkIcons || !night()) {
            return darkIcons;
        }
        Activity activity = activityOf(controller);
        return activity != null && LIGHT_ACTIVITIES.contains(activity.getClass().getName());
    }

    private static Activity activityOf(Object controller) {
        try {
            for (Class<?> type = controller.getClass(); type != null; type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (field.getType() == Window.class) {
                        field.setAccessible(true);
                        Window window = (Window) field.get(controller);
                        return window == null ? null : unwrap(window.getContext());
                    }
                }
            }
        } catch (Throwable ignored) {
            // Fall through: treat the window as a normal dark one.
        }
        return null;
    }

    private static Activity unwrap(android.content.Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                return (Activity) context;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static void rgbToHsl(int r, int g, int b, float[] out) {
        float rf = r / 255f, gf = g / 255f, bf = b / 255f;
        float max = Math.max(rf, Math.max(gf, bf));
        float min = Math.min(rf, Math.min(gf, bf));
        float l = (max + min) / 2f;
        float h = 0f, s = 0f;
        float d = max - min;
        if (d > 1e-6f) {
            s = l > 0.5f ? d / (2f - max - min) : d / (max + min);
            if (max == rf) {
                h = ((gf - bf) / d) + (gf < bf ? 6f : 0f);
            } else if (max == gf) {
                h = ((bf - rf) / d) + 2f;
            } else {
                h = ((rf - gf) / d) + 4f;
            }
            h /= 6f;
        }
        out[0] = h;
        out[1] = s;
        out[2] = l;
    }

    private static int hslToRgb(float h, float s, float l) {
        float r, g, b;
        if (s <= 1e-6f) {
            r = g = b = l;
        } else {
            float q = l < 0.5f ? l * (1f + s) : l + s - l * s;
            float p = 2f * l - q;
            r = hue(p, q, h + 1f / 3f);
            g = hue(p, q, h);
            b = hue(p, q, h - 1f / 3f);
        }
        return (to8(r) << 16) | (to8(g) << 8) | to8(b);
    }

    private static float hue(float p, float q, float t) {
        if (t < 0f) t += 1f;
        if (t > 1f) t -= 1f;
        if (t < 1f / 6f) return p + (q - p) * 6f * t;
        if (t < 1f / 2f) return q;
        if (t < 2f / 3f) return p + (q - p) * (2f / 3f - t) * 6f;
        return p;
    }

    private static int to8(float v) {
        return Math.max(0, Math.min(255, Math.round(v * 255f)));
    }
}
