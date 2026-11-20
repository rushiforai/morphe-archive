/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-18.
 */

package app.morphe.extension.youtube.patches.general;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
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
        if (!stylesFillAndBorder()) return;

        baseFill = getColor();
        lightFill = baseFill != null && baseFill.getDefaultColor() == LIGHT_FILL;
        chipStrokeColor = Color.TRANSPARENT;
        if (theme == null) return;

        TypedValue value = new TypedValue();
        captureChipStroke(theme, value);

        // Read the fill's role from the resolved snackbar theme, not the app theme or system night mode.
        int fillAttr = ResourceUtils.getAttrIdentifier("snackBarColor");
        int lightColor = ResourceUtils.getColorIdentifier("revanced_snack_bar_color_light");
        if (fillAttr != 0 && lightColor != 0 && theme.resolveAttribute(fillAttr, value, false)
                && value.type == TypedValue.TYPE_REFERENCE) {
            lightFill = value.data == lightColor;
        }
    }

    private void captureChipStroke(Resources.Theme theme, TypedValue value) {
        // Resolve Chip from the same (possibly inverted) theme that inflated the background.
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
        float strokeDp = sizeDp(Settings.SNACK_BAR_STROKE_WIDTH);
        int width = strokeDp > 0 ? Math.max(1, Math.round(strokeDp * density)) : 0;
        int color = Color.TRANSPARENT;
        if (width != 0) {
            color = Settings.SNACK_BAR_BORDER_PRESET.get() == Settings.SnackBarBorderPreset.CHIP
                    ? chipStrokeColor : STROKE.resolve(DEFAULT_STROKE_COLOR, DEFAULT_STROKE_COLOR);
        }
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

    protected boolean usesSnackBarRadius() {
        return true;
    }

    protected boolean stylesFillAndBorder() {
        return true;
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

    public static final class Playlist extends RadiusOnly {
        @Override
        protected boolean usesSnackBarRadius() {
            return Settings.SNACK_BAR_PLAYLIST_RADIUS.get();
        }
    }
}
