/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/3287
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
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

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.settings.preference.IconListPreference;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.videoplayer.PlayerIcons;

/**
 * Icon style picker that previews each style with one icon on a player colored tile.
 */
@SuppressWarnings({"unused", "deprecation"})
public class PlayerIconStyleListPreference extends IconListPreference {

    // Only the icons of the included patches exist, so the first one found is the sample.
    private static final String[] SAMPLE_ICONS = {
            "tada_yt_copy",
            "tada_mute_video_button_off",
            "tada_loop_video_button_on",
            "tada_reload_video_button",
            "tada_yt_download_button",
            "tada_save_to_watch_later_button",
            "tada_play_all_button",
            "tada_yt_vot",
            "tada_fullscreen_video_scale_fit",
            "tada_sb_backward",
            "tada_ic_sc_volume_high",
    };

    private static final String SHORTS_SAMPLE_ICON = "tada_shorts_heart";
    private static final String[] SHORTS_CUSTOM_SAMPLE_ICONS = {
            SHORTS_SAMPLE_ICON,
            "tada_shorts_like",
            "tada_shorts_comment",
            "tada_shorts_share",
            "tada_shorts_remix",
            "tada_shorts_save",
    };
    // The Shorts player shows the yt_delhi icons since 21.21, and the youtube_shorts icons before.
    private static final String SHORTS_SAMPLE_APP_ICON = PlayerIcons.exists("tada_yt_delhi_heart_outline_24dp")
            ? "tada_yt_delhi_heart_outline_24dp"
            : "tada_youtube_shorts_heart_outline_32dp";

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
        final boolean shorts = Settings.SHORTS_ICON_STYLE.key.equals(getKey());
        String sample = shorts ? SHORTS_SAMPLE_ICON : findSampleIcon();
        if (sample == null) return drawables;

        Context context = getContext();
        for (int i = 0; i < values.length; i++) {
            try {
                PlayerIcons.Style style = PlayerIcons.Style.valueOf(values[i].toString());
                String styleSample = style == PlayerIcons.Style.CUSTOM
                        ? findCustomSampleIcon(shorts ? SHORTS_CUSTOM_SAMPLE_ICONS : SAMPLE_ICONS, sample)
                        : sample;
                drawables[i] = shorts
                        // The app's Shorts icons carry their own shadow, which a tint would paint over.
                        ? buildTile(context, PlayerIcons.shorts(style, styleSample, SHORTS_SAMPLE_APP_ICON), false)
                        : buildTile(context, PlayerIcons.resolve(style, styleSample), true);
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
    private static String findCustomSampleIcon(String[] candidates, String fallback) {
        for (String baseName : candidates) {
            if (PlayerIcons.exists(baseName + PlayerIcons.Style.CUSTOM.suffix)) {
                return baseName;
            }
        }
        return fallback;
    }

    @Nullable
    private static Drawable buildTile(Context context, String drawableName, boolean tint) {
        Drawable icon = context.getDrawable(
                ResourceUtils.getIdentifierOrThrow(ResourceType.DRAWABLE, drawableName));
        if (icon == null) return null;

        final int sizePx = Dim.dp48;
        Bitmap bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);

        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(TILE_COLOR);
        final float radius = sizePx * TILE_CORNER_FRACTION;
        canvas.drawRoundRect(0, 0, sizePx, sizePx, radius, radius, paint);

        icon = icon.mutate();
        if (tint) {
            icon.setTint(Color.WHITE);
        }
        final int iconSize = Math.round(sizePx * ICON_SIZE_FRACTION);
        final int offset = (sizePx - iconSize) / 2;
        icon.setBounds(offset, offset, offset + iconSize, offset + iconSize);
        icon.draw(canvas);

        return new BitmapDrawable(context.getResources(), bitmap);
    }
}
