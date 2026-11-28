package semicoloncolonel.mobilestream.extension.yttv;

import android.view.MotionEvent;
import android.view.View;

/**
 * One touch hook on the YouTube TV watch screen (WatchLayout), shared by
 * "Volume and brightness sliders" and "Press and hold to speed up".
 *
 * WatchLayout is the root of the watch screen and sits above the whole player,
 * so it sees every touch on the player before the player's own layouts do. Each
 * feature patch turns itself on by overwriting its flag method below to return
 * true, so the hook is added once even when both patches are applied.
 */
public final class YttvPlayerTouch {

    private YttvPlayerTouch() {}

    // Overwritten to return true by "Volume and brightness sliders".
    public static boolean slidersEnabled() {
        return false;
    }

    // Overwritten to return true by "Press and hold to speed up".
    public static boolean holdEnabled() {
        return false;
    }

    /** Pass the event to the layout as usual. */
    public static final int PASS = 0;
    /** The event is handled here; do not pass it on. */
    public static final int CONSUME = 1;
    /** Handled here from now on: send the children one ACTION_CANCEL, then consume. */
    public static final int CANCEL_CHILDREN = 2;

    /** WatchLayout.dispatchTouchEvent, for every touch event on the watch screen. */
    public static int onDispatch(View view, MotionEvent event) {
        if (holdEnabled()) YttvPlaybackSpeed.onPlayerTouch(view, event);
        return slidersEnabled() ? YttvScreenGestures.handle(view, event) : PASS;
    }

    /** A copy of the event as ACTION_CANCEL, so the children drop the touch they started. */
    public static MotionEvent cancelOf(MotionEvent event) {
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        return cancel;
    }

    /** True when the point (raw screen coordinates) is on the visible player. */
    static boolean inPlayer(View watchLayout, float rawX, float rawY) {
        View player = player(watchLayout);
        if (player == null || !player.isShown()) return false;
        android.graphics.Rect r = new android.graphics.Rect();
        if (!player.getGlobalVisibleRect(r)) return false;
        return r.contains((int) rawX, (int) rawY);
    }

    /** True when the player fills the watch screen (fullscreen). */
    static boolean playerFillsScreen(View watchLayout) {
        View player = player(watchLayout);
        if (player == null || !player.isShown()) return false;
        return player.getHeight() >= watchLayout.getHeight() * 0.9f
            && player.getWidth() >= watchLayout.getWidth() * 0.9f;
    }

    private static int playerId;

    private static View player(View watchLayout) {
        if (playerId == 0) {
            // The patched app has a new package name, but its resources keep the
            // original one, so try both.
            android.content.res.Resources res = watchLayout.getResources();
            playerId = res.getIdentifier("player_container", "id", watchLayout.getContext().getPackageName());
            if (playerId == 0) {
                playerId = res.getIdentifier("player_container", "id", "com.google.android.apps.youtube.unplugged");
            }
            if (playerId == 0) return null;
        }
        return watchLayout.findViewById(playerId);
    }
}
