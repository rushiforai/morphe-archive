package app.morphed.extension.twitch.settings;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.ui.DebugMode;
import app.morphed.extension.twitch.ui.Screens;
import app.morphed.extension.twitch.unlock.QualityUnlock;

/**
 * The "Patch settings" group on the app's Settings page: VPN servers and Debug mode. The rows are built by the
 * app's own Settings code (the patch calls its row there); this class gives their texts and handles taps. Each
 * instance is one row's tap handler: the patch makes this class implement the app's click type.
 */
@SuppressWarnings("unused")
public final class PatchSettingsRows {
    public static final int VPN = 0, DEBUG = 1;

    private final int row;

    private PatchSettingsRows(int row) {
        this.row = row;
    }

    /** Injected: the tap handler of a row. */
    public static Object click(int row) {
        return new PatchSettingsRows(row);
    }

    /** Injected: a row's title. */
    public static String title(int row) {
        Screens.noteSettings();
        return row == VPN ? "VPN servers" : "Debug mode";
    }

    /** Injected: a row's second line, what it's set to now. */
    public static String description(int row) {
        try {
            Context context = App.application();
            if (row == VPN) {
                int count = QualityUnlock.servers().names().size();
                return count == 0 ? "None" : count == 1 ? "1 server" : count + " servers";
            }
            return context != null && DebugMode.isOn(context) ? "On" : "Off";
        } catch (Throwable t) {
            Log.e(App.TAG, "Settings row text failed", t);
            return "";
        }
    }

    /** The app's click type calls this (kotlin's Function0.invoke). */
    public Object invoke() {
        Activity activity = Screens.current();
        try {
            if (activity == null) throw new IllegalStateException("no screen to open it on");
            if (row == VPN) VpnServersPage.show(activity);
            else DebugMode.set(activity, !DebugMode.isOn(activity));
        } catch (Throwable t) {
            Log.e(App.TAG, "Settings row failed", t);
            Context context = App.application();
            if (context != null) {
                String what = row == VPN ? "VPN servers couldn't be opened: " : "Debug mode couldn't be switched: ";
                Toast.makeText(context, what + app.morphed.extension.twitch.Messages.of(t), Toast.LENGTH_LONG).show();
            }
        }
        return unit();
    }

    /** kotlin.Unit, what the app's own click handlers give back. */
    static Object unit() {
        if (!unitLooked) {
            unitLooked = true;
            try {
                unit = Class.forName("kotlin.Unit").getField("INSTANCE").get(null);
            } catch (Throwable t) {
                unit = null; // renamed in this app: the row ignores what its handler gives back
            }
        }
        return unit;
    }

    private static Object unit;
    private static boolean unitLooked;
}
