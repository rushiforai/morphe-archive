package dev.twitchpatches.extension.settings;

import android.graphics.drawable.ColorDrawable;
import android.content.res.Configuration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import dev.twitchpatches.extension.ui.UiSettings;
import dev.twitchpatches.extension.ui.UiWindowBars;

public final class SettingsWindow {
    private SettingsWindow() { }

    public static void configure(Window window, int background) {
        window.setBackgroundDrawable(new ColorDrawable(background));
        window.setDimAmount(0);
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE |
                WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
    }

    public static AutoCloseable bind(Window window, int background) {
        configure(window, background);
        return new Session(window);
    }

    private static final class Session implements AutoCloseable, ViewTreeObserver.OnGlobalLayoutListener,
            ViewTreeObserver.OnWindowFocusChangeListener {
        private final Window window;
        private final UiWindowBars bars = new UiWindowBars();
        private final AutoCloseable subscription;
        private boolean active = true;

        Session(Window window) {
            this.window = window;
            window.getDecorView().getViewTreeObserver().addOnGlobalLayoutListener(this);
            window.getDecorView().getViewTreeObserver().addOnWindowFocusChangeListener(this);
            subscription = PatchSettings.group(UiSettings.KEY) == null ? null : UiSettings.observe(() ->
                    window.getDecorView().post(this::onGlobalLayout));
            onGlobalLayout();
        }

        @Override public void onWindowFocusChanged(boolean focused) {
            if (focused) { bars.invalidate(); onGlobalLayout(); }
        }

        @Override public void onGlobalLayout() {
            if (!active) return;
            boolean landscape = window.getContext().getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
            apply(landscape && UiSettings.enabled("fullscreen_hide_status_bar"),
                    landscape && UiSettings.enabled("fullscreen_hide_navigation_bar"));
        }

        private void apply(boolean status, boolean navigation) {
            if (bars.apply(window, status, navigation)) window.getDecorView().requestLayout();
        }

        @Override public void close() throws Exception {
            active = false;
            apply(false, false);
            if (subscription != null) subscription.close();
            ViewTreeObserver observer = window.getDecorView().getViewTreeObserver();
            if (observer.isAlive()) {
                observer.removeOnGlobalLayoutListener(this);
                observer.removeOnWindowFocusChangeListener(this);
            }
        }
    }
}
