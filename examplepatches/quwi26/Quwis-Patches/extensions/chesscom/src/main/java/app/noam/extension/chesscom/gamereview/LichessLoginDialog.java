package app.noam.extension.chesscom.gamereview;

import android.app.Activity;

import app.noam.extension.chesscom.OverlayDialog;
import app.noam.extension.chesscom.Utils;

/** Lichess's login page in a dialog, for a root mount, where no new activity can be started. */
final class LichessLoginDialog extends OverlayDialog {
    private LichessLoginScreen screen;

    private LichessLoginDialog(Activity activity) {
        super(activity);
    }

    static boolean show(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return false;
        try {
            new LichessLoginDialog(activity).open();
            return true;
        } catch (Throwable throwable) {
            Utils.logError("Could not show the Lichess login dialog", throwable);
            return false;
        }
    }

    private void open() {
        screen = new LichessLoginScreen(getContext());
        screen.onClose(this::dismiss);
        showFullScreen(screen.create());
    }

    @Override
    protected void onDismissed() {
        if (screen != null) {
            screen.destroy();
            screen = null;
        }
    }
}
