/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.youtube.settings.preference;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
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
import app.morphe.extension.youtube.patches.shortsicons.ShortsIcons;

/**
 * Shorts icon style picker that previews each style with the like icon on a player colored tile.
 */
@SuppressWarnings({"unused", "deprecation"})
public class ShortsIconStyleListPreference extends IconListPreference {

    private static final String SAMPLE_ICON = "morphe_shorts_heart";

    // The Shorts player shows the yt_delhi icons since 21.21, and the youtube_shorts icons before.
    private static final String SAMPLE_APP_ICON = ShortsIcons.exists("morphe_yt_delhi_heart_outline_24dp")
            ? "morphe_yt_delhi_heart_outline_24dp"
            : "morphe_youtube_shorts_heart_outline_32dp";

    // The icons are always white over video, so the tile stays dark in the light theme too.
    private static final int TILE_COLOR = 0xFF2A3440;
    private static final float TILE_CORNER_FRACTION = 0.22f;
    private static final float ICON_SIZE_FRACTION = 0.55f;

    public ShortsIconStyleListPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public ShortsIconStyleListPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public ShortsIconStyleListPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ShortsIconStyleListPreference(Context context) {
        super(context);
    }

    @NonNull
    @Override
    protected Drawable[] resolveIconDrawables() {
        CharSequence[] values = getEntryValues();
        if (values == null) return new Drawable[0];

        Drawable[] drawables = new Drawable[values.length];
        Context context = getContext();
        for (int i = 0; i < values.length; i++) {
            final String value = values[i].toString();
            try {
                ShortsIcons.Style style = ShortsIcons.Style.valueOf(value);
                String name = ShortsIcons.resolve(style, SAMPLE_ICON, SAMPLE_APP_ICON);
                drawables[i] = buildTile(context, name);
            } catch (Exception ex) {
                Logger.printException(() -> "Could not build icon style preview: " + value, ex);
            }
        }
        return drawables;
    }

    @Nullable
    private static Drawable buildTile(Context context, String drawableName) {
        // The app's Shorts icons carry their own shadow, which a tint would paint over.
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
        final int iconSize = Math.round(sizePx * ICON_SIZE_FRACTION);
        final int offset = (sizePx - iconSize) / 2;
        icon.setBounds(offset, offset, offset + iconSize, offset + iconSize);
        icon.draw(canvas);

        return new BitmapDrawable(context.getResources(), bitmap);
    }
}
