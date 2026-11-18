package io.github.sabopura.morphe.extension.twitch.ui;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

import android.content.Context;
import android.content.Intent;

/** Offers to start the app again, for the few settings Twitch only reads when it starts. */
final class AppRestart {
    private AppRestart() {
    }

    static void offer(Catalog.Env env) {
        Context context = env.context();
        Ui.show(env.ui().modal(context, label("アプリの再起動が必要です", "The app needs a restart"),
                label("この設定は、Twitch を起動し直したときに反映します。今すぐ再起動すると、再生中の配信は閉じます。",
                        "Twitch reads this setting when it starts. Restarting now closes what is playing."),
                null, label("今すぐ再起動", "Restart now"), () -> restart(env), label("あとで", "Later")), context);
    }

    private static void restart(Catalog.Env env) {
        Context context = env.context();
        try {
            Context app = context.getApplicationContext();
            Intent launch = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
            if (launch == null || launch.getComponent() == null) throw new IllegalStateException("no launcher activity");
            // A save still waiting to be written would be lost with the process.
            for (Catalog.Store store : Catalog.Store.values()) env.prefs(store).edit().commit();
            app.startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
            Runtime.getRuntime().exit(0);
        } catch (RuntimeException e) {
            Notice.show(context, label("再起動できませんでした。アプリを開き直してください", "Could not restart. Please reopen the app"));
        }
    }
}
