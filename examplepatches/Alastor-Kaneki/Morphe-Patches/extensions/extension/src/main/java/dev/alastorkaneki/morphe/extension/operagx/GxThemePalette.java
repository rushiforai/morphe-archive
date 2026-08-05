package dev.alastorkaneki.morphe.extension.operagx;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.TypedValue;

/** Resolves a readable button palette from Opera GX's active Android theme. */
public final class GxThemePalette {
    public final int fillColor;
    public final int textColor;
    public final int strokeColor;
    public final int rippleColor;

    private GxThemePalette(
            int fillColor,
            int textColor,
            int strokeColor,
            int rippleColor
    ) {
        this.fillColor = fillColor;
        this.textColor = textColor;
        this.strokeColor = strokeColor;
        this.rippleColor = rippleColor;
    }

    public static GxThemePalette resolve(Activity activity) {
        Integer surface = firstResolvedColor(
                activity,
                "colorSurface",
                "colorSurfaceContainer",
                "colorBackground",
                "windowBackground"
        );
        if (surface == null) {
            surface = decorBackgroundColor(activity);
        }

        boolean systemNightMode = (activity.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        if (surface == null) {
            surface = systemNightMode ? 0xFF17131F : 0xFFF7F3FA;
        }

        // Prefer the app's actual surface brightness over the device setting because
        // Opera GX can use its own light/dark theme independently of system night mode.
        boolean dark = luminance(surface) < 0.43;

        Integer accent = firstResolvedColor(
                activity,
                "colorPrimary",
                "colorAccent",
                "colorControlActivated",
                "colorSecondary"
        );
        if (accent == null || Color.alpha(accent) < 80) {
            accent = dark ? 0xFFB05CFF : 0xFF6F28A8;
        }

        int fill = blend(surface, accent, dark ? 0.22f : 0.12f);
        int stroke = ensureVisibleAccent(accent, fill, dark);

        Integer themedText = firstResolvedColor(
                activity,
                "colorOnSurface",
                "textColorPrimary",
                "colorOnPrimary"
        );
        int text = themedText == null
                ? bestContrastingText(fill)
                : ensureReadableText(themedText, fill);

        int ripple = withAlpha(stroke, dark ? 0x55 : 0x3D);
        return new GxThemePalette(fill, text, stroke, ripple);
    }

    private static Integer firstResolvedColor(Activity activity, String... names) {
        for (String name : names) {
            Integer color = resolveNamedColor(activity, name);
            if (color != null && Color.alpha(color) > 0) {
                return color;
            }
        }
        return null;
    }

    private static Integer resolveNamedColor(Activity activity, String name) {
        int applicationAttr = activity.getResources().getIdentifier(
                name,
                "attr",
                activity.getPackageName()
        );
        Integer color = resolveAttributeColor(activity, applicationAttr);
        if (color != null) {
            return color;
        }

        int androidAttr = activity.getResources().getIdentifier(name, "attr", "android");
        return resolveAttributeColor(activity, androidAttr);
    }

    @SuppressWarnings("deprecation")
    private static Integer resolveAttributeColor(Activity activity, int attrId) {
        if (attrId == 0) {
            return null;
        }

        TypedValue value = new TypedValue();
        if (!activity.getTheme().resolveAttribute(attrId, value, true)) {
            return null;
        }

        if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT
                && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
            return value.data;
        }

        if (value.resourceId == 0) {
            return null;
        }

        try {
            ColorStateList list;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                list = activity.getResources().getColorStateList(
                        value.resourceId,
                        activity.getTheme()
                );
            } else {
                list = activity.getResources().getColorStateList(value.resourceId);
            }
            return list.getDefaultColor();
        } catch (Throwable ignored) {
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    return activity.getResources().getColor(
                            value.resourceId,
                            activity.getTheme()
                    );
                }
                return activity.getResources().getColor(value.resourceId);
            } catch (Throwable ignoredAgain) {
                return null;
            }
        }
    }

    private static Integer decorBackgroundColor(Activity activity) {
        try {
            Drawable background = activity.getWindow().getDecorView().getBackground();
            if (background instanceof ColorDrawable) {
                return ((ColorDrawable) background).getColor();
            }
        } catch (Throwable ignored) {
            // Some Opera activities create their decor before applying a background.
        }
        return null;
    }

    private static int ensureReadableText(int candidate, int background) {
        int opaqueCandidate = Color.rgb(
                Color.red(candidate),
                Color.green(candidate),
                Color.blue(candidate)
        );
        if (contrastRatio(opaqueCandidate, background) >= 4.5) {
            return opaqueCandidate;
        }
        return bestContrastingText(background);
    }

    private static int ensureVisibleAccent(int candidate, int background, boolean dark) {
        int opaqueCandidate = Color.rgb(
                Color.red(candidate),
                Color.green(candidate),
                Color.blue(candidate)
        );
        if (contrastRatio(opaqueCandidate, background) >= 1.8) {
            return opaqueCandidate;
        }
        return blend(opaqueCandidate, dark ? Color.WHITE : Color.BLACK, 0.42f);
    }

    private static int bestContrastingText(int background) {
        return contrastRatio(Color.WHITE, background) >= contrastRatio(Color.BLACK, background)
                ? Color.WHITE
                : Color.BLACK;
    }

    private static int withAlpha(int color, int alpha) {
        return Color.argb(alpha, Color.red(color), Color.green(color), Color.blue(color));
    }

    private static int blend(int from, int to, float amount) {
        float inverse = 1.0f - amount;
        return Color.argb(
                255,
                Math.round(Color.red(from) * inverse + Color.red(to) * amount),
                Math.round(Color.green(from) * inverse + Color.green(to) * amount),
                Math.round(Color.blue(from) * inverse + Color.blue(to) * amount)
        );
    }

    private static double contrastRatio(int first, int second) {
        double firstLuminance = luminance(first);
        double secondLuminance = luminance(second);
        double lighter = Math.max(firstLuminance, secondLuminance);
        double darker = Math.min(firstLuminance, secondLuminance);
        return (lighter + 0.05) / (darker + 0.05);
    }

    private static double luminance(int color) {
        double red = linearChannel(Color.red(color) / 255.0);
        double green = linearChannel(Color.green(color) / 255.0);
        double blue = linearChannel(Color.blue(color) / 255.0);
        return 0.2126 * red + 0.7152 * green + 0.0722 * blue;
    }

    private static double linearChannel(double channel) {
        return channel <= 0.04045
                ? channel / 12.92
                : Math.pow((channel + 0.055) / 1.055, 2.4);
    }
}
