/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-25
 */

package app.morphe.extension.youtube.settings.preference;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import app.morphe.extension.shared.settings.preference.IconListPreference;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.videoplayer.PlayerIcons;

/**
 * Icon style picker that previews each style with one icon on a player colored tile.
 */
@SuppressWarnings({"unused", "deprecation"})
public class PlayerIconStyleListPreference extends IconListPreference {

    // Only the icons of the included patches exist, so the first one found is the sample.
    // The icons that exist in the thin and bold styles come first, so those two previews differ.
    // The app player icons have no base icon of their own and only count as a custom sample.
    private static final String[] SAMPLE_ICONS = {
            "morphe_reload_video",
            "morphe_save_to_watch_later_button",
            "morphe_pip_button",
            "revanced_fullscreen_video_scale_fit",
            "morphe_fullscreen_enter",
            "morphe_player_settings",
            "morphe_player_play",
            "morphe_player_pause",
            "morphe_player_next",
            "morphe_player_previous",
            "morphe_player_captions_on",
            "morphe_player_cast",
            "morphe_fullscreen_exit",
    };

    // The icons are always white over video, so the tile stays dark in the light theme too.
    private static final int TILE_COLOR = 0xFF2A3440;
    private static final float TILE_CORNER_FRACTION = 0.22f;
    private static final float ICON_SIZE_FRACTION = 0.55f;

    public PlayerIconStyleListPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public PlayerIconStyleListPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public PlayerIconStyleListPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PlayerIconStyleListPreference(Context context) {
        super(context);
    }

    @NonNull
    @Override
    protected Drawable[] resolveIconDrawables() {
        CharSequence[] values = getEntryValues();
        if (values == null) return new Drawable[0];

        Drawable[] drawables = new Drawable[values.length];
        String sample = findSampleIcon();
        if (sample == null) return drawables;

        Context context = getContext();
        for (int i = 0; i < values.length; i++) {
            try {
                PlayerIcons.Style style = PlayerIcons.Style.valueOf(values[i].toString());
                String styleSample = style == PlayerIcons.Style.CUSTOM
                        ? findCustomSampleIcon(sample)
                        : sample;
                drawables[i] = buildTile(context, PlayerIcons.resolve(style, styleSample));
            } catch (Exception ex) {
                final int index = i;
                Logger.printException(() -> "Could not build icon style preview: " + values[index], ex);
            }
        }
        return drawables;
    }

    @Nullable
    private static String findSampleIcon() {
        for (String baseName : SAMPLE_ICONS) {
            if (PlayerIcons.exists(baseName) || PlayerIcons.exists(baseName + "_bold")) {
                return baseName;
            }
        }
        return null;
    }

    // A custom icon set may not have the usual sample, so it shows the first icon it does have.
    private static String findCustomSampleIcon(String fallback) {
        for (String baseName : SAMPLE_ICONS) {
            if (PlayerIcons.exists(baseName + PlayerIcons.Style.CUSTOM.suffix)) {
                return baseName;
            }
        }
        return fallback;
    }

    @Nullable
    private static Drawable buildTile(Context context, String drawableName) {
        Drawable icon = context.getDrawable(
                ResourceUtils.getIdentifierOrThrow(drawableName, ResourceType.DRAWABLE));
        if (icon == null) return null;

        final int sizePx = Dim.dp48;
        Bitmap bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);

        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(TILE_COLOR);
        final float radius = sizePx * TILE_CORNER_FRACTION;
        canvas.drawRoundRect(0, 0, sizePx, sizePx, radius, radius, paint);

        icon = icon.mutate();
        icon.setTint(Color.WHITE);
        final int iconSize = Math.round(sizePx * ICON_SIZE_FRACTION);
        final int offset = (sizePx - iconSize) / 2;
        icon.setBounds(offset, offset, offset + iconSize, offset + iconSize);
        icon.draw(canvas);

        return new BitmapDrawable(context.getResources(), bitmap);
    }
}
