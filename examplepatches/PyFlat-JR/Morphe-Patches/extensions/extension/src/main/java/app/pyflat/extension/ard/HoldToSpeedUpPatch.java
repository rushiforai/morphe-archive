package app.pyflat.extension.ard;

import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;

import androidx.media3.common.Player;
import androidx.media3.ui.PlayerView;

import app.pyflat.extension.shared.HoldToSpeedUpController;

/**
 * ARD renders its player controls in a WebView on top of the PlayerView,
 * so the WebView gets all touches.
 */
@SuppressWarnings("unused")
public final class HoldToSpeedUpPatch {

    /** Injection point. */
    public static void install(WebView webView) {
        HoldToSpeedUpController controller = new HoldToSpeedUpController(
                () -> findPlayer(webView),
                () -> cancelWebViewTouch(webView),
                getSpeed(),
                getHoldDelayMs()
        );

        webView.setOnTouchListener((view, event) -> controller.onTouchEvent(view, event));
        webView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                controller.cancel();
            }
        });
    }

    private static Player findPlayer(WebView webView) {
        if (!(webView.getParent() instanceof ViewGroup)) return null;
        ViewGroup parent = (ViewGroup) webView.getParent();

        for (int i = 0, count = parent.getChildCount(); i < count; i++) {
            View child = parent.getChildAt(i);
            if (child instanceof PlayerView) {
                return ((PlayerView) child).getPlayer();
            }
        }
        return null;
    }

    // Otherwise the web player treats the release as a tap and toggles the controls.
    private static void cancelWebViewTouch(WebView webView) {
        long now = SystemClock.uptimeMillis();
        MotionEvent cancel = MotionEvent.obtain(now, now, MotionEvent.ACTION_CANCEL, 0f, 0f, 0);
        webView.onTouchEvent(cancel);
        cancel.recycle();
    }

    // Overridden by patch options.
    private static float getSpeed() {
        return 2.0f;
    }

    // Overridden by patch options.
    private static long getHoldDelayMs() {
        return 400L;
    }
}
