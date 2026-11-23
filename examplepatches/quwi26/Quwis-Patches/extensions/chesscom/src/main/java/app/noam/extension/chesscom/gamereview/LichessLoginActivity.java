package app.noam.extension.chesscom.gamereview;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import app.noam.extension.chesscom.Utils;

/** Lichess's own login page, shown once so Lichess reviews can use the user's Lichess account. */
public final class LichessLoginActivity extends Activity {
    private LichessLoginScreen screen;

    /** Opens the login page: its own screen on a normal install, a dialog on a root mount. */
    static boolean show(Activity context) {
        if (context == null) return false;
        try {
            context.startActivity(new Intent(context, LichessLoginActivity.class));
            return true;
        } catch (Throwable throwable) {
            Utils.logError("The app's manifest has no " + LichessLoginActivity.class.getName()
                + "; showing the login in a dialog", throwable);
            return LichessLoginDialog.show(context);
        }
    }

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        screen = new LichessLoginScreen(this);
        screen.onClose(this::finish);
        getWindow().setStatusBarColor(screen.background());
        getWindow().setNavigationBarColor(screen.background());
        setContentView(screen.create());
    }

    @Override
    protected void onDestroy() {
        screen.destroy();
        super.onDestroy();
    }
}
