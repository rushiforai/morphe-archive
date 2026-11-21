package app.noam.extension.chesscom.discord;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;

import app.noam.extension.chesscom.Utils;

/**
 * Where Discord's browser login comes back to. It keeps the tokens, says how it went and closes;
 * there is nothing to look at here.
 */
public final class DiscordCallbackActivity extends Activity {
    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        final Uri redirect = getIntent() == null ? null : getIntent().getData();
        new Thread(() -> {
            String message;
            try {
                String name = DiscordAuth.complete(this, redirect);
                DiscordPresence.refresh();
                message = name.isEmpty() ? "Discord connected" : "Discord connected as " + name;
            } catch (Throwable failure) {
                Utils.log("Discord login: " + failure);
                String reason = failure.getMessage();
                message = reason == null || reason.isEmpty() ? "Discord could not be connected." : reason;
            }
            final String shown = message;
            runOnUiThread(() -> {
                Utils.toast(shown);
                finish();
            });
        }, "MorpheDiscordLogin").start();
    }
}
