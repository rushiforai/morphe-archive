package app.morphe.extension.youtube.patches.player;

import android.view.View;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

@SuppressWarnings("unused")
public final class PlayerCastButtonPatch {
    private static final class CastLayout {
        static final int ID = ResourceUtils.getLayoutIdentifier("player_cast_media_route_button");
    }

    private PlayerCastButtonPatch() {
    }

    /**
     * Injection point.
     */
    public static void markPlayerCastButton(View view) {
        int id = CastLayout.ID;
        if (id == 0) return;

        view.setTag(id, Boolean.TRUE);
        if (Settings.HIDE_PLAYER_CAST_BUTTON.get()) view.setVisibility(View.GONE);
    }

    /**
     * MediaRouteButton is shared with the toolbar. Only its player layout is marked for hiding.
     */
    public static int hideCastButton(View view, int original) {
        return Settings.HIDE_PLAYER_CAST_BUTTON.get() && Boolean.TRUE.equals(view.getTag(CastLayout.ID))
                ? View.GONE
                : original;
    }

    /**
     * Injection point. Removes cast buttons whose visibility is reset by the player layout.
     */
    public static void hideCastButton(View parentView) {
        if (!Settings.HIDE_PLAYER_CAST_BUTTON.get()) {
            return;
        }

        int resourceId = ResourceUtils.getIdIdentifier("media_route_button");
        Utils.runOnMainThread(() -> {
            View castButton = parentView.findViewById(resourceId);
            if (castButton == null) {
                Logger.printException(() -> "Could not find player button: R.id.media_route_button");
                return;
            }

            Utils.hideViewByRemovingFromParentUnderCondition(true, castButton);
        });
    }

    /**
     * Injection point.
     */
    public static boolean getCastButtonOverride(boolean original) {
        if (Settings.HIDE_PLAYER_CAST_BUTTON.get()) {
            return false;
        }

        return original;
    }
}
