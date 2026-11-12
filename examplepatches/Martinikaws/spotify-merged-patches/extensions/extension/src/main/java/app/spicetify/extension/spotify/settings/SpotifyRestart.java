package app.spicetify.extension.spotify.settings;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/** Restarts Spotify so settings read at startup, such as the theme palette, take effect. */
final class SpotifyRestart {
    static Runnable terminate = () -> Runtime.getRuntime().exit(0);

    private SpotifyRestart() {}

    /** Asks before restarting; choosing Later leaves the restart bar on the settings screens. */
    static void prompt(Context context, String title) {
        new SpotifySheet(context, title, "Playback stops for a moment while Spotify reopens.")
                .primary("Restart now", () -> {
                    restart(context);
                    return true;
                })
                .secondary("Later")
                .show();
    }

    /** Relaunches Spotify's main screen in a fresh process, then ends this one. */
    static void restart(Context context) {
        Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (launch == null || launch.getComponent() == null) {
            Log.e("SpicetifyRestart", "Spotify has no launch activity to restart into");
            return;
        }
        ComponentName main = launch.getComponent();
        context.startActivity(Intent.makeRestartActivityTask(main));
        terminate.run();
    }
}
