package app.noam.extension.chesscom.settings;

import android.app.Activity;
import android.content.Context;
import android.view.KeyEvent;

import app.noam.extension.chesscom.OverlayDialog;
import app.noam.extension.chesscom.Utils;

/**
 * The Quwi's Patches screen in a dialog, for a root mount, where the activity the patch declares
 * in the manifest does not exist.
 */
final class SettingsDialog extends OverlayDialog {
    private SettingsScreen screen;

    private SettingsDialog(Activity activity) {
        super(activity);
    }

    /** Shows the screen over the activity in front; nothing needs to be in the manifest. */
    static boolean show(Context context, String page) {
        Activity activity = context instanceof Activity ? (Activity) context : Utils.topActivity();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            Utils.toast("Couldn't open that screen. Try again from the More tab.");
            return false;
        }
        try {
            new SettingsDialog(activity).open(page);
            return true;
        } catch (Throwable throwable) {
            Utils.logError("Could not show the settings dialog", throwable);
            Utils.toast("Couldn't open that screen. Try again from the More tab.");
            return false;
        }
    }

    private void open(String page) {
        screen = new SettingsScreen(getContext());
        screen.onClose(this::dismiss);
        screen.window(getWindow());
        showFullScreen(screen.create(page, 0));
        // There is no other window here, so back closes the screen, as it does on a normal install.
        setOnKeyListener((dialog, keyCode, event) -> {
            if (keyCode != KeyEvent.KEYCODE_BACK || event.getAction() != KeyEvent.ACTION_UP) return false;
            if (!screen.goBack()) dismiss();
            return true;
        });
    }

    @Override
    protected void onDismissed() {
        if (screen != null) {
            screen.destroy();
            screen = null;
        }
    }
}
