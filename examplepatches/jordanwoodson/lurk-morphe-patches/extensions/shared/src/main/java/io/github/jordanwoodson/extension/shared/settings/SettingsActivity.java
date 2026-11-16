package io.github.jordanwoodson.extension.shared.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.Window;

/**
 * The Lurk settings screen ({@link SettingsScreen}) as an activity of its own. Declared in the app's manifest
 * by the app's settings patch.
 */
@SuppressWarnings("deprecation")
public final class SettingsActivity extends Activity implements SettingsScreen.Host {
    private SettingsScreen screen;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(SettingsScreen.theme(SettingsScreen.dark(this)));
        super.onCreate(savedInstanceState);
        screen = new SettingsScreen(this, this,
                savedInstanceState == null ? null : savedInstanceState.getString(SettingsScreen.STATE_QUERY, ""));
        setContentView(screen.create());
        screen.attached();
    }

    @Override
    protected void onResume() {
        super.onResume();
        screen.resumed();
    }

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString(SettingsScreen.STATE_QUERY, screen.query());
    }

    @Override
    public void onBackPressed() {
        if (!screen.onBack()) super.onBackPressed();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        screen.onPicked(requestCode, resultCode, data);
    }

    @Override
    public Window window() {
        return getWindow();
    }

    @Override
    public void close() {
        finish();
    }

    @Override
    public boolean pick(Intent intent, int request) {
        startActivityForResult(intent, request);
        return true;
    }

    @Override
    public android.window.OnBackInvokedDispatcher backDispatcher() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU ? getOnBackInvokedDispatcher() : null;
    }
}
