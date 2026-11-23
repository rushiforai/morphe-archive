package app.merak.extension.authenticator;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;

/**
 * Small helpers for building views that match the host app theme.
 * Everything uses public framework APIs only, and resolves the app's own
 * resources by name so nothing depends on obfuscated identifiers.
 */
final class Ui {

    static final String APP_PACKAGE = "com.google.android.apps.authenticator2";

    private Ui() {
    }

    static int dp(Context context, float value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    static float sp(Context context, float value) {
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, value,
                context.getResources().getDisplayMetrics());
    }

    static boolean isDark(Context context) {
        return (context.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    /**
     * Resolves an app resource id by name. Falls back to the original package name
     * in case the app package was renamed by another patch.
     */
    static int appIdentifier(Context context, String name, String type) {
        Resources resources = context.getResources();
        int id = resources.getIdentifier(name, type, context.getPackageName());
        if (id == 0) id = resources.getIdentifier(name, type, APP_PACKAGE);
        return id;
    }

    /** Resolves a theme color attribute of the app theme, such as {@code colorSurfaceContainerHigh}. */
    static int themeColor(Context context, String attrName, int fallback) {
        try {
            int attr = appIdentifier(context, attrName, "attr");
            if (attr == 0) return fallback;
            TypedValue value = new TypedValue();
            if (!context.getTheme().resolveAttribute(attr, value, true)) return fallback;
            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return value.data;
            }
            if (value.resourceId != 0) {
                ColorStateList list = context.getColorStateList(value.resourceId);
                return list.getDefaultColor();
            }
        } catch (Exception ex) {
            AccountOrganizerPatch.logError("Could not resolve theme color " + attrName, ex);
        }
        return fallback;
    }

    // region Palette of the host theme.

    static int surface(Context c) {
        return themeColor(c, "colorSurface", isDark(c) ? 0xFF131314 : 0xFFFFFFFF);
    }

    static int surfaceContainer(Context c) {
        return themeColor(c, "colorSurfaceContainer", isDark(c) ? 0xFF1E1F20 : 0xFFF0F4F9);
    }

    static int surfaceContainerHigh(Context c) {
        return themeColor(c, "colorSurfaceContainerHigh", isDark(c) ? 0xFF282A2C : 0xFFE9EEF6);
    }

    static int onSurface(Context c) {
        return themeColor(c, "colorOnSurface", isDark(c) ? 0xFFE3E3E3 : 0xFF1F1F1F);
    }

    static int onSurfaceVariant(Context c) {
        return themeColor(c, "colorOnSurfaceVariant", isDark(c) ? 0xFFC4C7C5 : 0xFF444746);
    }

    static int outlineVariant(Context c) {
        return themeColor(c, "colorOutlineVariant", isDark(c) ? 0xFF444746 : 0xFFC4C7C5);
    }

    static int primary(Context c) {
        return themeColor(c, "colorPrimary", isDark(c) ? 0xFFA8C7FA : 0xFF0B57D0);
    }

    static int secondary(Context c) {
        return themeColor(c, "colorSecondary", isDark(c) ? 0xFFBFC6DC : 0xFF565E71);
    }

    static int error(Context c) {
        return themeColor(c, "colorError", isDark(c) ? 0xFFF2B8B5 : 0xFFB3261E);
    }

    static int surfaceContainerLow(Context c) {
        return themeColor(c, "colorSurfaceContainerLow", isDark(c) ? 0xFF1B1B1C : 0xFFF8FAFD);
    }

    static int onPrimary(Context c) {
        return themeColor(c, "colorOnPrimary", isDark(c) ? 0xFF062E6F : 0xFFFFFFFF);
    }

    static int secondaryContainer(Context c) {
        return themeColor(c, "colorSecondaryContainer", isDark(c) ? 0xFF004A77 : 0xFFC2E7FF);
    }

    static int onSecondaryContainer(Context c) {
        return themeColor(c, "colorOnSecondaryContainer", isDark(c) ? 0xFFC2E7FF : 0xFF001D35);
    }

    // endregion

    private static Typeface headlineTypeface;

    /**
     * Typeface of dialog titles and headlines. The app bundles Product Sans for this,
     * falls back to the system sans serif font.
     */
    static Typeface headline(Context context) {
        if (headlineTypeface == null) {
            try {
                headlineTypeface = Typeface.createFromAsset(context.getAssets(), "ProductSans-Regular.ttf");
            } catch (Exception ex) {
                headlineTypeface = Typeface.create("sans-serif", Typeface.NORMAL);
            }
        }
        return headlineTypeface;
    }

    static Typeface medium() {
        return Typeface.create("sans-serif-medium", Typeface.NORMAL);
    }

    /** Ripple bounded by a rounded shape, with the given content drawn below it. */
    static Drawable ripple(Context context, Drawable content, float radiusPx) {
        ColorStateList color = ColorStateList.valueOf((onSurface(context) & 0x00FFFFFF) | 0x1F000000);
        return new android.graphics.drawable.RippleDrawable(color, content, rounded(0xFFFFFFFF, radiusPx));
    }

    /** Ripple bounded by per corner radii (top left, top right, bottom right, bottom left). */
    static Drawable ripple(Context context, int fillColor, float[] radii) {
        GradientDrawable content = new GradientDrawable();
        content.setCornerRadii(radii);
        content.setColor(fillColor);
        GradientDrawable mask = new GradientDrawable();
        mask.setCornerRadii(radii);
        mask.setColor(0xFFFFFFFF);
        ColorStateList color = ColorStateList.valueOf((onSurface(context) & 0x00FFFFFF) | 0x1F000000);
        return new android.graphics.drawable.RippleDrawable(color, content, mask);
    }

    /** Corner radii array for {@link GradientDrawable#setCornerRadii(float[])}. */
    static float[] radii(float top, float bottom) {
        return new float[]{top, top, top, top, bottom, bottom, bottom, bottom};
    }

    /** Linear blend of two opaque colors. {@code ratio} is the weight of {@code top}. */
    static int blend(int base, int top, float ratio) {
        float inverse = 1f - ratio;
        return Color.rgb(
                Math.round(Color.red(base) * inverse + Color.red(top) * ratio),
                Math.round(Color.green(base) * inverse + Color.green(top) * ratio),
                Math.round(Color.blue(base) * inverse + Color.blue(top) * ratio));
    }

    /** Black or white, whichever is more readable on the given color. */
    static int contrastOn(int color) {
        double luminance = (0.2126 * Color.red(color) + 0.7152 * Color.green(color)
                + 0.0722 * Color.blue(color)) / 255d;
        return luminance > 0.6 ? 0xFF1F1F1F : 0xFFFFFFFF;
    }

    /** Folder glyph in a category color, with the category icon on it if it has one. */
    static Drawable categoryFolder(int accent, String iconId) {
        return new FolderDrawable(accent, CategoryIcons.create(iconId, contrastOn(accent)));
    }

    /** Category accent adapted for readability on the current theme. */
    static int accentFor(Context context, int color) {
        return isDark(context) ? blend(color, Color.WHITE, 0.25f) : color;
    }

    static GradientDrawable rounded(int fillColor, float radiusPx) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.RECTANGLE);
        drawable.setCornerRadius(radiusPx);
        drawable.setColor(fillColor);
        return drawable;
    }

    static GradientDrawable outlined(int strokeColor, int strokeWidthPx, float radiusPx, float dashPx) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.RECTANGLE);
        drawable.setCornerRadius(radiusPx);
        drawable.setColor(Color.TRANSPARENT);
        if (dashPx > 0) {
            drawable.setStroke(strokeWidthPx, strokeColor, dashPx, dashPx);
        } else {
            drawable.setStroke(strokeWidthPx, strokeColor);
        }
        return drawable;
    }

    static GradientDrawable dot(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(color);
        return drawable;
    }

    /** Returns a tinted copy of an app drawable, or null if it does not exist. */
    static Drawable appIcon(Context context, String name, int tint) {
        try {
            int id = appIdentifier(context, name, "drawable");
            if (id == 0) return null;
            Drawable drawable = context.getDrawable(id);
            if (drawable == null) return null;
            drawable = drawable.mutate();
            drawable.setTint(tint);
            return drawable;
        } catch (Exception ex) {
            AccountOrganizerPatch.logError("Could not load icon " + name, ex);
            return null;
        }
    }

    /** Selectable item background (ripple) of the current theme. */
    static Drawable selectableBackground(Context context, boolean borderless) {
        TypedValue value = new TypedValue();
        int attr = borderless
                ? android.R.attr.selectableItemBackgroundBorderless
                : android.R.attr.selectableItemBackground;
        if (context.getTheme().resolveAttribute(attr, value, true) && value.resourceId != 0) {
            return context.getDrawable(value.resourceId);
        }
        return null;
    }

    /** A simple filled folder glyph, drawn with paths so no resources are needed. */
    static final class FolderDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint backPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF rect = new RectF();

        private final Drawable glyph;

        FolderDrawable(int color) {
            this(color, null);
        }

        /** Folder with an icon on its front, e.g. a category icon. */
        FolderDrawable(int color, Drawable glyph) {
            paint.setColor(color);
            backPaint.setColor(color);
            backPaint.setAlpha(150);
            this.glyph = glyph;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float w = b.width();
            float h = b.height();
            float left = b.left + w * 0.08f;
            float right = b.right - w * 0.08f;
            float top = b.top + h * 0.17f;
            float bottom = b.bottom - h * 0.17f;
            float r = w * 0.08f;

            // Back sheet with the tab.
            path.reset();
            path.moveTo(left + r, top);
            path.lineTo(left + w * 0.36f, top);
            path.lineTo(left + w * 0.44f, top + h * 0.1f);
            path.lineTo(right - r, top + h * 0.1f);
            path.quadTo(right, top + h * 0.1f, right, top + h * 0.1f + r);
            path.lineTo(right, bottom - r);
            path.lineTo(left, bottom - r);
            path.lineTo(left, top + r);
            path.quadTo(left, top, left + r, top);
            path.close();
            canvas.drawPath(path, backPaint);

            // Front sheet.
            rect.set(left, top + h * 0.22f, right, bottom);
            canvas.drawRoundRect(rect, r, r, paint);

            if (glyph != null) {
                float size = rect.height() * 0.72f;
                float cx = rect.centerX();
                float cy = rect.centerY();
                glyph.setBounds(Math.round(cx - size / 2), Math.round(cy - size / 2),
                        Math.round(cx + size / 2), Math.round(cy + size / 2));
                glyph.draw(canvas);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            backPaint.setAlpha(alpha * 150 / 255);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            backPaint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
