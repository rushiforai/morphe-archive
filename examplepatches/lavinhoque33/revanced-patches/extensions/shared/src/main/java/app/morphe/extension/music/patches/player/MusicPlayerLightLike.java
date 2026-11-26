/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25
 */

package app.morphe.extension.music.patches.player;

import android.view.View;

import app.morphe.extension.shared.utils.ResourceUtils;

/** Selects Google's light Like animation only when mounted in the expanded player's action bar. */
@SuppressWarnings("unused") // Called before the native Elements Lottie URL cache lookup.
public final class MusicPlayerLightLike {
    private static final String ASSETS = "https://www.gstatic.com/youtube/img/lottie/";
    private static final String MUSIC = ASSETS + "custom_animated_like_icon/animated_like_music_";
    private static final String LEGACY = ASSETS + "animated_like_icon/animated_like_icon_";
    private static final String LEGACY_HTTP_DARK =
            "http://www.gstatic.com/youtube/img/lottie/animated_like_icon/animated_like_icon_dark_v4.json";

    private MusicPlayerLightLike() {
    }

    public static String selectAnimation(View lithoRoot, String stock) {
        if (stock == null || lithoRoot == null || !MusicPlayerLightTheme.isLightPlayerChrome()) return stock;

        // The paired stock compositions retain the filled/unfilled states and colored animation frames.
        final String light = switch (stock) {
            case MUSIC + "dark_v5.json" -> MUSIC + "light_v5.json";
            case LEGACY + "dark_v4.json", LEGACY_HTTP_DARK -> LEGACY + "light_v4.json";
            default -> null;
        };
        return light != null && NowPlaying.contains(lithoRoot) ? light : stock;
    }

    private static final class NowPlaying {
        private static final int ACTION_BAR = ResourceUtils.getIdIdentifier("video_action_bar");
        private static final int PLAYER_PAGE = ResourceUtils.getIdIdentifier("player_page");
        private static final int MEDIA_CONTROLS = ResourceUtils.getIdIdentifier("controls_layout");

        private static boolean contains(View root) {
            if (ACTION_BAR == 0 || PLAYER_PAGE == 0) return false;

            boolean actionBar = false;
            for (View view = root; view != null; view = view.getParent() instanceof View parent ? parent : null) {
                final int id = view.getId();
                if (id == MEDIA_CONTROLS && MEDIA_CONTROLS != 0) return false;
                if (id == PLAYER_PAGE) return actionBar;
                if (id == ACTION_BAR) actionBar = true;
            }
            return false;
        }
    }
}
