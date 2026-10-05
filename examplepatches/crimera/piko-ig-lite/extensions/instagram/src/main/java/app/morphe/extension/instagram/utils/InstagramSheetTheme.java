/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.utils;

import android.content.Context;
import android.graphics.Color;
import android.util.TypedValue;

import app.morphe.extension.crimera.theme.PikoTheme;
import app.morphe.extension.crimera.theme.SettingsColor;
import app.morphe.extension.crimera.theme.SettingsTheme;
import app.morphe.extension.shared.ResourceUtils;

/**
 * Instagram's palette for the shared bottom-sheet widgets. Every color is resolved from the host's
 * {@code igds_*} theme attributes against the context the widget asks about — the activity — so the
 * sheet follows whatever theme (light, dark, Prism) Instagram is currently showing.
 *
 * <p>This is the exact behaviour of the retired Instagram-local {@code ui/SheetTheme}: same
 * attributes, same fallbacks, same blends. In particular the accent stays monochrome
 * ({@code igds_color_primary_icon}, never the {@code primary_button} blue), the tonal surfaces are
 * neutral tints of the text color, and the drag handle keeps Instagram's own creation-tools grey
 * instead of the library's neutral text tint, so the sheet renders on device as it always has.
 */
public final class InstagramSheetTheme implements SettingsTheme {
    private static final int LIGHT_SURFACE = Color.WHITE;
    private static final int LIGHT_TEXT = Color.rgb(0, 0, 0);
    private static final int DARK_TEXT = Color.rgb(245, 245, 245);
    private static final int LIGHT_SECONDARY_TEXT = Color.rgb(115, 115, 115);
    private static final int DARK_SECONDARY_TEXT = Color.rgb(168, 168, 168);

    private static final InstagramSheetTheme INSTANCE = new InstagramSheetTheme();

    private InstagramSheetTheme() {
    }

    /** Installs Instagram's palette for the shared widgets. Cheap and idempotent. */
    public static void install() {
        PikoTheme.install(INSTANCE);
    }

    /** The tint of Instagram's own toolbar icons, resolved against the context's theme. */
    public static int iconColor(Context context) {
        return INSTANCE.primaryAccent(context);
    }

    @Override
    public boolean isDark(Context context) {
        int background = attrColor(context, "igds_color_primary_background", LIGHT_SURFACE);
        return Color.luminance(background) < 0.5f;
    }

    @Override
    public int color(Context context, SettingsColor role) {
        return switch (role) {
            case SURFACE, SURFACE_CONTAINER -> surface(context);
            case SURFACE_CONTAINER_HIGH, SURFACE_VARIANT -> surfaceVariant(context);
            case ON_SURFACE -> primaryText(context);
            case ON_SURFACE_VARIANT -> secondaryText(context);
            case ACCENT -> primaryAccent(context);
            case ON_ACCENT -> onPrimaryAccent(context);
            case ACCENT_CONTAINER -> primaryContainer(context);
            case ON_ACCENT_CONTAINER -> onPrimaryContainer(context);
            case OUTLINE -> dividerColor(context);
            case CHECKBOX_CHECKED -> primaryAccent(context);
        };
    }

    @Override
    public int dragHandleColor(Context context) {
        return attrColor(context, "igds_color_creation_tools_grey_02",
                isDark(context) ? Color.rgb(85, 85, 85) : Color.rgb(219, 219, 219));
    }

    /** Sheet background: the same color as the feed behind it. */
    private int surface(Context context) {
        return attrColor(context, "igds_color_primary_background",
                isDark(context) ? Color.BLACK : LIGHT_SURFACE);
    }

    /** Leading badge background: Instagram's own secondary surface. */
    private int surfaceVariant(Context context) {
        return attrColor(context, "igds_color_secondary_background",
                isDark(context) ? Color.rgb(26, 26, 26) : Color.rgb(239, 239, 239));
    }

    private int primaryText(Context context) {
        return attrColor(context, "igds_color_primary_text", isDark(context) ? DARK_TEXT : LIGHT_TEXT);
    }

    private int secondaryText(Context context) {
        return attrColor(context, "igds_color_secondary_text",
                isDark(context) ? DARK_SECONDARY_TEXT : LIGHT_SECONDARY_TEXT);
    }

    /**
     * Instagram's Prism surfaces are monochrome: controls are tinted with the text color, never
     * `primary_button` blue. This is the filled button background and the icon tint.
     */
    private int primaryAccent(Context context) {
        return attrColor(context, "igds_color_primary_icon", primaryText(context));
    }

    /** Filled button label: the sheet color, inverted against the button. */
    private int onPrimaryAccent(Context context) {
        return surface(context);
    }

    /** Tonal button and selected badge background: a neutral tint of the text color. */
    private int primaryContainer(Context context) {
        return PikoTheme.blend(surface(context), primaryText(context), isDark(context) ? 0.16f : 0.10f);
    }

    private int onPrimaryContainer(Context context) {
        return primaryText(context);
    }

    private int dividerColor(Context context) {
        return attrColor(context, "igds_color_divider", withAlpha(primaryText(context), 31));
    }

    /** Resolves a theme attribute that points at a color, or holds one directly. */
    private static int attrColor(Context context, String attrName, int fallback) {
        if (context == null) return fallback;
        try {
            int attrId = ResourceUtils.getAttrIdentifier(attrName);
            if (attrId == 0) return fallback;
            TypedValue value = new TypedValue();
            if (!context.getTheme().resolveAttribute(attrId, value, true)) return fallback;
            if (value.resourceId != 0) return context.getColor(value.resourceId);
            if (value.type >= TypedValue.TYPE_FIRST_COLOR_INT && value.type <= TypedValue.TYPE_LAST_COLOR_INT) {
                return value.data;
            }
        } catch (RuntimeException ignored) {
            // Fall through to the neutral fallback; a missing attr must never break the sheet.
        }
        return fallback;
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (alpha << 24);
    }
}
