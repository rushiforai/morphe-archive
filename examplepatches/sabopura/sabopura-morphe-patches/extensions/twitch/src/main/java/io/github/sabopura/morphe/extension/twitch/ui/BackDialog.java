package io.github.sabopura.morphe.extension.twitch.ui;

import android.app.Dialog;
import android.content.Context;
import android.os.Build;

/** A dialog whose back gesture is handled by {@link #goBack}, on the key and on predictive back alike. */
abstract class BackDialog extends Dialog {
    private Object backCallback;

    BackDialog(Context context, int theme) {
        super(context, theme);
    }

    abstract void goBack();

    @Override
    @SuppressWarnings("deprecation")
    public void onBackPressed() {
        goBack();
    }

    /** Twitch targets Android 16, where the back gesture no longer arrives as a key event. */
    @Override
    protected void onStart() {
        super.onStart();
        if (Build.VERSION.SDK_INT >= 33 && backCallback == null) {
            android.window.OnBackInvokedCallback callback = this::goBack;
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
            backCallback = callback;
        }
    }

    @Override
    protected void onStop() {
        if (Build.VERSION.SDK_INT >= 33 && backCallback != null) {
            getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(
                    (android.window.OnBackInvokedCallback) backCallback);
            backCallback = null;
        }
        super.onStop();
    }
}
