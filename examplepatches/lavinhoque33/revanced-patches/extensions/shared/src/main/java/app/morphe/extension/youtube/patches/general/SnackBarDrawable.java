/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-20.
 * Written by lavinhoque33, 2026-11-18.
 */

package app.morphe.extension.youtube.patches.general;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.util.TypedValue;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;

import app.morphe.extension.shared.settings.FloatSetting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.settings.Settings;

/** Inflated only for the snack bar and its existing radius consumers. */
public class SnackBarDrawable extends GradientDrawable {
    private static final int DARK_FILL = 0xFF0F0F0F;
    private static final int LIGHT_FILL = 0xFFF1F1F1;
    private static final int DEFAULT_STROKE_COLOR = 0xFF3EA6FF;

    private static final SelectedColor DARK = new SelectedColor(Settings.SNACK_BAR_DARK_FILL);
    private static final SelectedColor LIGHT = new SelectedColor(Settings.SNACK_BAR_LIGHT_FILL);
    private static final SelectedColor STROKE = new SelectedColor(Settings.SNACK_BAR_STROKE_COLOR);

    private float density;
    private float baseRadius;
    private float appliedRadius;
    private ColorStateList baseFill;
    private boolean lightFill;
    private boolean hasCustomFill;
    private int appliedFill;
    private int chipStrokeColor;
    private int appliedStrokeWidth;
    private int appliedStrokeColor;

    @Override
    public void inflate(Resources resources, XmlPullParser parser, AttributeSet attrs, Resources.Theme theme)
            throws IOException, XmlPullParserException {
        super.inflate(resources, parser, attrs, theme);
        captureBase(resources, theme);
    }

    void captureBase(Resources resources, Resources.Theme theme) {
        density = resources.getDisplayMetrics().density;
        baseRadius = getCornerRadius();
        appliedRadius = baseRadius;
        captureColors(theme);
    }

    @Override
    public void applyTheme(Resources.Theme theme) {
        if (hasCustomFill) {
            setColor(baseFill);
            hasCustomFill = false;
        }

        super.applyTheme(theme);
        captureColors(theme);
    }

    @Override
    public ConstantState getConstantState() {
        // GradientDrawable's factory would return a plain GradientDrawable on the next inflation.
        return null;
    }

    @Override
    public void draw(Canvas canvas) {
        updateRadius();
        if (stylesFillAndBorder()) {
            updateFill();
            updateStroke();
        }

        super.draw(canvas);
    }

    @Override
    public void getOutline(Outline outline) {
        updateRadius();
        super.getOutline(outline);
    }

    private void captureColors(Resources.Theme theme) {
        if (stylesFillAndBorder()) {
            baseFill = getColor();
            lightFill = baseFill != null && baseFill.getDefaultColor() == LIGHT_FILL;
        }

        if (!usesBorderTheme()) return;

        chipStrokeColor = Color.TRANSPARENT;
        if (theme == null) return;

        TypedValue value = new TypedValue();
        captureChipStroke(theme, value);
        if (!stylesFillAndBorder()) return;

        // Read the fill's role from the resolved snackbar theme, not the app theme or system night mode.
        int fillAttr = ResourceUtils.getAttrIdentifier("snackBarColor");
        int lightColor = ResourceUtils.getColorIdentifier("revanced_snack_bar_color_light");
        if (fillAttr != 0 && lightColor != 0 && theme.resolveAttribute(fillAttr, value, false)
                && value.type == TypedValue.TYPE_REFERENCE) {
            lightFill = value.data == lightColor;
        }
    }

    private void captureChipStroke(Resources.Theme theme, TypedValue value) {
        // Resolve Chip from the theme that inflated this background. Only snack bars may use inversion.
        int chipAttr = ResourceUtils.getAttrIdentifier("ytChipBackground");
        if (chipAttr == 0 || !theme.resolveAttribute(chipAttr, value, true)) return;

        if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
            chipStrokeColor = value.data;
        } else if (value.type == TypedValue.TYPE_STRING && value.resourceId != 0) {
            chipStrokeColor = theme.getResources().getColor(value.resourceId, theme);
        }
    }

    private void updateRadius() {
        if (density == 0f) return;

        float radius = usesSnackBarRadius() ? radiusDp() * density : baseRadius;
        if (appliedRadius == radius) return;

        appliedRadius = radius;
        setCornerRadius(radius);
    }

    private void updateFill() {
        if (baseFill == null) return;

        int original = baseFill.getDefaultColor();
        int color = resolveFill(lightFill, original);
        if (color == original) {
            if (hasCustomFill) {
                setColor(baseFill);
                hasCustomFill = false;
            }
        } else if (!hasCustomFill || appliedFill != color) {
            setColor(color);
            appliedFill = color;
            hasCustomFill = true;
        }
    }

    private void updateStroke() {
        int width = strokeWidthPx();
        int color = width == 0 ? Color.TRANSPARENT : resolveStrokeColor();
        if (Color.alpha(color) == 0) width = 0;
        if (appliedStrokeWidth != width || appliedStrokeColor != color) {
            setStroke(width, color);
            if (appliedStrokeWidth != width) {
                // GradientDrawable caches the half-stroke inset until its bounds are invalidated.
                onBoundsChange(getBounds());
            }
            appliedStrokeWidth = width;
            appliedStrokeColor = color;
        }
    }

    final int strokeWidthPx() {
        float strokeDp = sizeDp(Settings.SNACK_BAR_STROKE_WIDTH);
        return strokeDp > 0 ? Math.max(1, Math.round(strokeDp * density)) : 0;
    }

    final int resolveStrokeColor() {
        return Settings.SNACK_BAR_BORDER_PRESET.get() == Settings.SnackBarBorderPreset.CHIP
                ? chipStrokeColor : STROKE.resolve(DEFAULT_STROKE_COLOR, DEFAULT_STROKE_COLOR);
    }

    protected boolean usesSnackBarRadius() {
        return true;
    }

    protected boolean stylesFillAndBorder() {
        return true;
    }

    protected boolean usesBorderTheme() {
        return stylesFillAndBorder();
    }

    static float radiusDp() {
        return sizeDp(Settings.SNACK_BAR_CORNER_RADIUS);
    }

    private static float sizeDp(FloatSetting setting) {
        float value = setting.get();
        return value >= setting.sliderConfig.min() && value <= setting.sliderConfig.max()
                ? value : setting.defaultValue;
    }

    static int resolveFill(boolean light, int original) {
        return light ? LIGHT.resolve(LIGHT_FILL, original) : DARK.resolve(DARK_FILL, original);
    }

    private record ParsedColor(String text, int color, boolean useOriginal) {}

    private static final class SelectedColor {
        private final StringSetting setting;
        private volatile ParsedColor cached;

        SelectedColor(StringSetting setting) {
            this.setting = setting;
        }

        int resolve(int defaultColor, int original) {
            String text = setting.get();
            ParsedColor parsed = cached;
            if (parsed == null || !parsed.text().equals(text)) {
                parsed = parseColor(text, defaultColor);
                cached = parsed;
            }
            return parsed.useOriginal() ? original : parsed.color();
        }

        private static ParsedColor parseColor(String text, int defaultColor) {
            try {
                int color = Color.parseColor(text);
                return new ParsedColor(text, color, color == defaultColor);
            } catch (IllegalArgumentException ignored) {
                // Invalid externally imported values keep the resolved resource/default color.
                return new ParsedColor(text, 0, true);
            }
        }
    }

    public static class RadiusOnly extends SnackBarDrawable {
        @Override
        protected boolean stylesFillAndBorder() {
            return false;
        }
    }

    public static class Playlist extends RadiusOnly {
        private final boolean supportsCustomRadius;
        private PlaylistBorder border;

        public Playlist() {
            this(true);
        }

        private Playlist(boolean supportsCustomRadius) {
            this.supportsCustomRadius = supportsCustomRadius;
        }

        @Override
        protected boolean usesBorderTheme() {
            return true;
        }

        @Override
        public void draw(Canvas canvas) {
            super.draw(canvas);
            if (!Settings.SNACK_BAR_PLAYLIST_BORDER.get()) return;

            int width = strokeWidthPx();
            if (width == 0) return;

            int color = resolveStrokeColor();
            int alpha = Color.alpha(color) * getAlpha() / 255;
            if (alpha == 0) return;

            if (border == null) border = new PlaylistBorder();
            border.draw(canvas, getBounds(), getCornerRadius(), width, (color & 0x00FFFFFF) | (alpha << 24));
        }

        @Override
        protected boolean usesSnackBarRadius() {
            return supportsCustomRadius && Settings.SNACK_BAR_PLAYLIST_RADIUS.get();
        }
    }

    public static final class RoundedPlaylist extends Playlist {
        public RoundedPlaylist() {
            // The newer FAB layout has its own pill radius and clipping outline.
            super(false);
        }
    }

    private static final class PlaylistBorder {
        private final Path path = new Path();
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Rect lastBounds = new Rect();
        private float lastRadius;
        private int lastWidth;

        void draw(Canvas canvas, Rect bounds, float radius, int width, int color) {
            if (bounds.isEmpty()) return;

            if (!lastBounds.equals(bounds) || lastRadius != radius || lastWidth != width) {
                updatePath(bounds, radius, width);
            }

            paint.setColor(color);
            canvas.drawPath(path, paint);
        }

        private void updatePath(Rect bounds, float radius, int width) {
            lastBounds.set(bounds);
            lastRadius = radius;
            lastWidth = width;

            // Draw inside the stock outline without insetting the fill or changing its state or clipping.
            float outerRadius = Math.min(radius, Math.min(bounds.width(), bounds.height()) * 0.5f);
            path.rewind();
            path.addRoundRect(bounds.left, bounds.top, bounds.right, bounds.bottom,
                    outerRadius, outerRadius, Path.Direction.CW);
            if (bounds.width() > 2 * width && bounds.height() > 2 * width) {
                float innerRadius = Math.max(0, outerRadius - width);
                path.addRoundRect(bounds.left + width, bounds.top + width, bounds.right - width, bounds.bottom - width,
                        innerRadius, innerRadius, Path.Direction.CCW);
            }
        }
    }
}
