package io.github.jordanwoodson.extension.shared.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.os.Build;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;

import java.lang.ref.WeakReference;

import io.github.jordanwoodson.extension.shared.Logger;

/**
 * The Lurk settings screen ({@link SettingsScreen}) as a full-screen dialog over one of the app's own
 * activities, for installs whose manifest has no {@link SettingsActivity}: Android reads the manifest of the
 * APK that was installed, so a patched APK mounted over the original app (a root "mount" install) can't add
 * an activity. A dialog needs no manifest entry. It can't receive a file picker's result, so export and
 * import go through the clipboard here.
 */
@SuppressWarnings("deprecation")
final class SettingsDialog extends Dialog implements SettingsScreen.Host {
    private static WeakReference<SettingsDialog> showing = new WeakReference<>(null);

    private final SettingsScreen screen;

    /** Shows the screen over {@code activity}, once: a second tap while it is open does nothing. */
    static void show(Activity activity) {
        SettingsDialog current = showing.get();
        if (current != null && current.isShowing()) return;
        try {
            SettingsDialog dialog = new SettingsDialog(activity);
            dialog.show();
            showing = new WeakReference<>(dialog);
        } catch (RuntimeException e) {
            // The activity is on its way out (no window token left).
            Logger.w("settings: couldn't open over " + activity.getClass().getSimpleName() + ": " + e);
        }
    }

    private SettingsDialog(Activity activity) {
        super(activity, SettingsScreen.theme(SettingsScreen.dark(activity)));
        setOwnerActivity(activity);
        // The dialog's context carries the theme, so the screen's views don't take the app's.
        screen = new SettingsScreen(getContext(), this, null);
        setContentView(screen.create());
        Window window = getWindow();
        if (window != null) window.setLayout(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT);
        screen.attached();
    }

    @Override
    public void onBackPressed() {
        if (!screen.onBack()) super.onBackPressed();
    }

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        // Back from a choice dialog or the browser: the dialog has no onResume of its own.
        if (hasFocus) screen.resumed();
    }

    @Override
    public Window window() {
        return getWindow();
    }

    @Override
    public void close() {
        dismiss();
    }

    @Override
    public boolean pick(Intent intent, int request) {
        return false;
    }

    @Override
    public android.window.OnBackInvokedDispatcher backDispatcher() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU ? getOnBackInvokedDispatcher() : null;
    }
}
