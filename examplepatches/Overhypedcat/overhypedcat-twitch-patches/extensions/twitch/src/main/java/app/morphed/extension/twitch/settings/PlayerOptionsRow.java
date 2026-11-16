package app.morphed.extension.twitch.settings;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.Messages;
import app.morphed.extension.twitch.ui.Screens;

/**
 * The "Patches" row in the player's older Options sheet (the one the vertical view opens): built by the app's own
 * row composable (the patch calls it there), it opens the patches' switches as a sheet of their own. That sheet is
 * drawn by Jetpack Compose, which can't take switches it doesn't hold the state of. The patch makes this class
 * implement the app's click type.
 */
@SuppressWarnings("unused")
public final class PlayerOptionsRow {
    private PlayerOptionsRow() {
    }

    /** Injected: the row's title. */
    public static String title() {
        return "Patches";
    }

    /** Injected: the row's tap handler. */
    public static Object click() {
        return new PlayerOptionsRow();
    }

    /** The app's click type calls this (kotlin's Function0.invoke). */
    public Object invoke() {
        Activity activity = Screens.current();
        try {
            if (activity == null) throw new IllegalStateException("no screen to open it on");
            PlayerOptionsSection.showSheet(activity);
        } catch (Throwable t) {
            Log.e(App.TAG, "Opening the patch switches failed", t);
            Context context = App.application();
            if (context != null) {
                Toast.makeText(context, "The patch switches couldn't be opened: " + Messages.of(t), Toast.LENGTH_LONG).show();
            }
        }
        return PatchSettingsRows.unit();
    }
}
