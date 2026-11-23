/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-22.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.player;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.VectorDrawable;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.settings.Settings;

public final class CenterPlaybackButtonPatch {
    public static final int MIN_PERCENT = 60;
    public static final int MAX_PERCENT = 120;
    public static final int DEFAULT_PERCENT = 100;

    private CenterPlaybackButtonPatch() {}

    /** Injection point: once, after the native watch-player button group is inflated. */
    public static void resize(View controls) {
        int percent = Math.max(MIN_PERCENT, Math.min(MAX_PERCENT, Settings.CENTER_PLAYBACK_BUTTON_SIZE.get()));
        if (percent == DEFAULT_PERCENT || !(controls instanceof RelativeLayout)) {
            return;
        }

        View area = findControl(controls, "player_control_play_pause_replay_button_touch_area");
        View icon = findControl(controls, "player_control_play_pause_replay_button");
        if (!(area instanceof FrameLayout) || !(icon instanceof ImageView)
                || icon.getParent() != area || area.getParent() != controls
                || !(icon.getLayoutParams() instanceof FrameLayout.LayoutParams iconParams)
                || !(area.getLayoutParams() instanceof RelativeLayout.LayoutParams areaParams)
                || areaParams.getRule(RelativeLayout.CENTER_IN_PARENT) == 0) {
            return;
        }

        LayoutParams controlsParams = controls.getLayoutParams();
        if (controlsParams == null || controlsParams.height <= 0 || iconParams.width <= 0
                || iconParams.height <= 0 || areaParams.width <= 0 || areaParams.height <= 0) {
            return;
        }

        // Resize actual layout bounds, not the visual transform. The native TouchDelegate stays
        // inside its FrameLayout and the neighboring controls stay anchored to its edges.
        int minTouchSize = Math.round(48 * controls.getResources().getDisplayMetrics().density);
        float scale = percent / 100f;
        int width = Math.max(minTouchSize, Math.round(areaParams.width * scale));
        int height = Math.max(minTouchSize, Math.round(areaParams.height * scale));
        resizeIcon(icon, iconParams, scale, width, height);
        areaParams.width = width;
        areaParams.height = height;
        area.setLayoutParams(areaParams);

        // Keep the stock row height when shrinking; only grow it to avoid clipping the new target.
        if (height > controlsParams.height) {
            controlsParams.height = height;
            controls.setLayoutParams(controlsParams);
        }

        if (percent > DEFAULT_PERCENT) {
            int key = EnlargedCenter.REPLAY_SELECTOR;
            if (key != 0) icon.setTag(key, Boolean.TRUE);
        }
    }

    private static View findControl(View controls, String name) {
        int id = ResourceUtils.getIdentifier(name, ResourceType.ID, controls.getContext());
        return id == 0 ? null : controls.findViewById(id);
    }

    private static void resizeIcon(View icon, LayoutParams params, float scale, int maxWidth, int maxHeight) {
        params.width = Math.min(maxWidth, Math.round(params.width * scale));
        params.height = Math.min(maxHeight, Math.round(params.height * scale));
        icon.setLayoutParams(params);
        icon.setPadding(
                Math.round(icon.getPaddingLeft() * scale),
                Math.round(icon.getPaddingTop() * scale),
                Math.round(icon.getPaddingRight() * scale),
                Math.round(icon.getPaddingBottom() * scale));
    }

    private static final class EnlargedCenter {
        // This fork-owned resource ID also keys the tag on the resized view.
        static final int REPLAY_SELECTOR = ResourceUtils.getDrawableIdentifier("morphe_center_replay_selector");
    }

    private static boolean isEnlargedCenter(ImageView icon) {
        if (Settings.CENTER_PLAYBACK_BUTTON_SIZE.get() <= DEFAULT_PERCENT) return false;

        int key = EnlargedCenter.REPLAY_SELECTOR;
        return key != 0 && icon.getTag(key) == Boolean.TRUE;
    }

    /** Injection point: load the original glyph before YouTube rasterizes it to add a shadow. */
    public static Drawable loadShadowSource(Resources resources, int id, Resources.Theme theme, ImageView icon) {
        if (!isEnlargedCenter(icon)) return resources.getDrawable(id, theme);

        // Delhi can select either the themed vector or its same-shape bitmap depending on the
        // native icon provider's flags. Only substitute the known center glyphs at this load.
        String vectorName = switch (resources.getResourceEntryName(id)) {
            case "yt_fill_experimental_play_black_24" -> "yt_fill_experimental_play_vd_theme_24";
            case "yt_fill_experimental_pause_black_24" -> "yt_fill_experimental_pause_vd_theme_24";
            case "yt_fill_experimental_play_black_36" -> "yt_fill_experimental_play_vd_theme_36";
            case "yt_fill_experimental_pause_black_36" -> "yt_fill_experimental_pause_vd_theme_36";
            default -> null;
        };
        if (vectorName != null) {
            int vectorId = ResourceUtils.getIdentifier(vectorName, ResourceType.DRAWABLE, icon.getContext());
            if (vectorId != 0) id = vectorId;
        }

        Drawable source = resources.getDrawable(id, theme);
        return source instanceof VectorDrawable ? sizeForShadow(source, icon) : source;
    }

    private static Drawable sizeForShadow(Drawable source, ImageView icon) {
        LayoutParams params = icon.getLayoutParams();
        int width = params.width - icon.getPaddingLeft() - icon.getPaddingRight();
        int height = params.height - icon.getPaddingTop() - icon.getPaddingBottom();
        int sourceWidth = source.getIntrinsicWidth();
        int sourceHeight = source.getIntrinsicHeight();
        float scale = Math.min((float) width / sourceWidth, (float) height / sourceHeight);
        if (scale <= 1f) return source;

        // The native shadow renderer draws at intrinsic size, then returns a bitmap. Give it the
        // final glyph dimensions so ImageView never has to enlarge that bitmap.
        return new ShadowSource(source, Math.round(sourceWidth * scale), Math.round(sourceHeight * scale));
    }

    /** Injection point: the native selector uses a PNG and has no vector counterpart. */
    public static Drawable loadReplay(Context context, int stockId, ImageView icon) {
        return context.getDrawable(isEnlargedCenter(icon) ? EnlargedCenter.REPLAY_SELECTOR : stockId);
    }

    private static final class ShadowSource extends DrawableWrapper {
        private final int width;
        private final int height;

        ShadowSource(Drawable source, int width, int height) {
            super(source);
            this.width = width;
            this.height = height;
        }

        @Override
        public int getIntrinsicWidth() {
            return width;
        }

        @Override
        public int getIntrinsicHeight() {
            return height;
        }
    }
}
