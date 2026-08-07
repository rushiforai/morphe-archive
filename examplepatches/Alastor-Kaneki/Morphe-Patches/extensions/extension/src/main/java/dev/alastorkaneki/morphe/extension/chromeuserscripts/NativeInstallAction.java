package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Guaranteed native install action for Fork script pages.
 *
 * This does not depend on page JavaScript, URL hash polling, Chrome downloads, or Greasy Fork's
 * own click handler. It observes only Chrome's current tab URL and shows a Material You action that
 * opens the native review/install screen.
 */
final class NativeInstallAction implements Runnable {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Activity, NativeInstallAction> ACTIVE = new WeakHashMap<>();
    private static final String TAG =
            "dev.alastorkaneki.monkeyscript.NATIVE_INSTALL_ACTION";

    private final Activity activity;
    private TextView button;
    private String target = "";

    private NativeInstallAction(Activity activity) {
        this.activity = activity;
    }

    static void start(Activity activity) {
        stop(activity);
        NativeInstallAction action = new NativeInstallAction(activity);
        synchronized (ACTIVE) {
            ACTIVE.put(activity, action);
        }
        MAIN.post(action);
    }

    static void stop(Activity activity) {
        NativeInstallAction action;
        synchronized (ACTIVE) {
            action = ACTIVE.remove(activity);
        }
        if (action != null) {
            MAIN.removeCallbacks(action);
            action.remove();
        }
    }

    @Override public void run() {
        if (activity.isFinishing() || activity.isDestroyed()) {
            remove();
            return;
        }
        try {
            String url = MonkeyRuntime.url(activity);
            String marked = ForkSiteSupport.installUrlFromMarker(url);
            String candidate = marked == null ? url : marked;
            if (ForkSiteSupport.isInstallablePage(candidate)) {
                target = candidate;
                show();
            } else {
                target = "";
                hide();
            }
        } catch (Throwable ignored) {
            hide();
        }
        MAIN.postDelayed(this, 250);
    }

    private void show() {
        if (button == null) attach();
        if (button == null) return;
        button.setVisibility(View.VISIBLE);
        button.setEnabled(true);
        button.setOnClickListener(view -> {
            String current = target;
            if (current == null || current.trim().isEmpty()) return;
            ForkSiteSupport.openInstallPreview(activity, current);
        });
    }

    private void attach() {
        View existing = activity.getWindow().getDecorView().findViewWithTag(TAG);
        if (existing instanceof TextView) {
            button = (TextView) existing;
            return;
        }

        TextView view = MonkeyUi.button(activity, "Install userscript", true);
        view.setTag(TAG);
        view.setContentDescription("Install userscript from this page");
        view.setElevation(MonkeyUi.dp(activity, 8));

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL
        );
        int side = MonkeyUi.dp(activity, 16);
        params.setMargins(side, side, side, MonkeyUi.dp(activity, 88));
        activity.addContentView(view, params);
        button = view;
    }

    private void hide() {
        if (button != null) button.setVisibility(View.GONE);
    }

    private void remove() {
        if (button == null) return;
        if (button.getParent() instanceof ViewGroup) {
            ((ViewGroup) button.getParent()).removeView(button);
        }
        button = null;
    }
}
