/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Draw videos with the rest of the screen (#308). Facebook's player shows most reels and many
 * videos on a SurfaceView, which Android hands to the display hardware as a layer of its own. On
 * some phones that layer comes out pale until something on top makes Android compose the screen
 * on the GPU again, which is why Disable HW overlays in developer options cures it. The player can
 * also draw into a TextureView, which Android composes with the rest of the window.
 *
 * <p>Facebook decides per player in two steps (585): one method answers whether this player must
 * use a SurfaceView (reels say yes), and when it doesn't, the player's own TextureView preference
 * picks. While the switch is on the first answer is no and the preference is yes, so every player
 * Facebook builds or attaches from then on draws into a TextureView. Off, paused, or before the
 * settings are ready, both answers are Facebook's own.
 */
public final class TextureVideo {
    /** Counted under the patch's name for each player kept off its own SurfaceView. */
    static final String DRAWN_WITH_THE_SCREEN = "Video drawn with the rest of the screen";

    private static final String FAMILY = FamilyNames.HDR_BRIGHTNESS;

    private static volatile boolean logged;

    private TextureVideo() {
    }

    /**
     * Injection point, at each answer of Facebook's must-use-a-SurfaceView decision: no while the
     * switch is on, Facebook's answer otherwise.
     */
    public static boolean surfaceView(boolean facebook) {
        try {
            HookStatus.invoked(FAMILY);
            if (!on()) return facebook;
            HookStatus.bound(FAMILY, "surfaceView");
            if (facebook) {
                HookStatus.counted(FAMILY, DRAWN_WITH_THE_SCREEN);
                if (!logged) {
                    logged = true;
                    Logger.printDebug(() -> "Draw videos with the rest of the screen: a player kept off its SurfaceView");
                }
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "surfaceView", failure);
            return facebook;
        }
    }

    /**
     * Injection point, where the player reads its own TextureView preference after the decision
     * above said no: yes while the switch is on, the player's own preference otherwise.
     */
    public static boolean preferTextureView(boolean facebook) {
        try {
            HookStatus.invoked(FAMILY);
            if (!on()) return facebook;
            HookStatus.bound(FAMILY, "preferTextureView");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "preferTextureView", failure);
            return facebook;
        }
    }

    private static boolean on() {
        return Utils.settingsReady() && Settings.DRAW_VIDEOS_WITH_THE_SCREEN.get();
    }
}
