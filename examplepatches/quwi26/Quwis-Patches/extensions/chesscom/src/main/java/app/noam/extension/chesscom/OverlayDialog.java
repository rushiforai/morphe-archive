package app.noam.extension.chesscom;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;

/**
 * A screen in a full-screen dialog over the activity in front. A root mount bind-mounts the
 * patched APK over the stock app, but Android keeps the manifest it parsed from the stock APK, so
 * an activity a patch adds is never declared and cannot be started there; a dialog needs no entry
 * in the manifest. The dialog goes away together with the activity under it.
 */
public abstract class OverlayDialog extends Dialog {
    private final Activity owner;
    private Application.ActivityLifecycleCallbacks lifecycle;

    protected OverlayDialog(Activity owner) {
        super(owner);
        this.owner = owner;
    }

    /** Fills the screen with the view and shows the dialog. */
    protected void showFullScreen(View content) {
        Window window = getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            window.setDimAmount(0.6f);
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        }
        setContentView(content);
        watchOwner();
        show();
    }

    /** Dismisses the dialog when the activity it is shown over goes away. */
    private void watchOwner() {
        lifecycle = new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity activity, Bundle state) {}
            @Override public void onActivityStarted(Activity activity) {}
            @Override public void onActivityResumed(Activity activity) {}
            @Override public void onActivityPaused(Activity activity) {}
            @Override public void onActivityStopped(Activity activity) {}
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
            @Override public void onActivityDestroyed(Activity activity) {
                if (activity == owner) dismiss();
            }
        };
        owner.getApplication().registerActivityLifecycleCallbacks(lifecycle);
    }

    @Override
    public void dismiss() {
        if (lifecycle != null) {
            owner.getApplication().unregisterActivityLifecycleCallbacks(lifecycle);
            lifecycle = null;
        }
        onDismissed();
        if (!isShowing()) return;
        try {
            super.dismiss();
        } catch (Throwable throwable) {
            Utils.logError("Could not dismiss a screen", throwable);
        }
    }

    /** The screen's own cleanup; the window goes after this. */
    protected void onDismissed() {}
}
