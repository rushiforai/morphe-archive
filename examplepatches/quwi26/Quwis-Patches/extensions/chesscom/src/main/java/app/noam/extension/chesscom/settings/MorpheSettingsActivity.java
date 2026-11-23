package app.noam.extension.chesscom.settings;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.window.OnBackInvokedDispatcher;

import app.noam.extension.chesscom.Utils;

/**
 * Hosts {@link SettingsScreen} in a window of its own. A root mount only gets the stock app's
 * manifest, so this activity cannot be started there; {@link #show(Context, String)} then shows
 * the same screen in a dialog instead.
 */
public final class MorpheSettingsActivity extends Activity {
    public static final String EXTRA_PAGE = "morphe_page";

    private SettingsScreen screen;

    /** Opens the screen: its own window when the app's manifest has it, else a dialog. */
    public static boolean show(Context context, String page) {
        if (context == null) return false;
        Intent intent = new Intent(context, MorpheSettingsActivity.class);
        if (page != null) intent.putExtra(EXTRA_PAGE, page);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
            return true;
        } catch (Throwable throwable) {
            Utils.logError("The app's manifest has no " + MorpheSettingsActivity.class.getName()
                + "; showing the screen in a dialog", throwable);
            return SettingsDialog.show(context, page);
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        screen = new SettingsScreen(this);
        screen.window(getWindow());
        screen.onClose(this::finish);
        // Every page is a window of its own here, as before the dialog existed.
        screen.pages(page -> startActivity(new Intent(this, MorpheSettingsActivity.class)
            .putExtra(EXTRA_PAGE, page)));
        int step = savedInstanceState == null ? 0 : savedInstanceState.getInt("welcome_step");
        setContentView(screen.create(getIntent().getStringExtra(EXTRA_PAGE), step));
        // Back goes a welcome screen or a page back; Android 13 and later asks the callback.
        if (Build.VERSION.SDK_INT >= 33) {
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT, this::back);
        }
    }

    private void back() {
        if (!screen.goBack()) finish();
    }

    @Override
    @SuppressWarnings("deprecation")
    public void onBackPressed() {
        back();
    }

    @Override
    protected void onResume() {
        super.onResume();
        screen.resume();
    }

    @Override
    protected void onPause() {
        screen.pause();
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        screen.destroy();
        super.onDestroy();
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt("welcome_step", screen.welcomeStep());
    }
}
