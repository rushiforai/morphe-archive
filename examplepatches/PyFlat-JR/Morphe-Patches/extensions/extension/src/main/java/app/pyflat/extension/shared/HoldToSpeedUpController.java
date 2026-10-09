package app.pyflat.extension.shared;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.media3.common.Player;

/**
 * YouTube-style "hold to speed up" for Media3 players.
 * Main thread only; players on other loopers are ignored.
 */
public final class HoldToSpeedUpController {

    private static final String TAG = "PyFlat-HoldToSpeedUp";

    public interface PlayerProvider {
        Player getPlayer();
    }

    public interface Callback {
        void onBoostStarted();
    }

    private final PlayerProvider playerProvider;
    private final Callback callback;
    private final float speed;
    private final long holdDelayMs;
    private final Handler handler = new Handler(Looper.getMainLooper());

    private View touchView;
    private float downX;
    private float downY;
    private int touchSlop = -1;

    private Player boostedPlayer;
    private float previousSpeed = 1f;
    private boolean wasPaused;
    private TextView overlay;

    private final Runnable startBoostRunnable = this::startBoost;

    public HoldToSpeedUpController(PlayerProvider playerProvider, Callback callback,
                                   float speed, long holdDelayMs) {
        this.playerProvider = playerProvider;
        this.callback = callback;
        this.speed = speed;
        this.holdDelayMs = holdDelayMs;
    }

    public boolean isBoosting() {
        return boostedPlayer != null;
    }

    /** @return true if the event belongs to the hold and must not reach the app. */
    public boolean onTouchEvent(View view, MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                touchView = view;
                downX = event.getX();
                downY = event.getY();
                if (touchSlop < 0) {
                    touchSlop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                }
                handler.removeCallbacks(startBoostRunnable);
                handler.postDelayed(startBoostRunnable, holdDelayMs);
                return false;

            case MotionEvent.ACTION_MOVE:
                if (!isBoosting()
                        && (Math.abs(event.getX() - downX) > touchSlop
                        || Math.abs(event.getY() - downY) > touchSlop)) {
                    // Drag, not a hold.
                    handler.removeCallbacks(startBoostRunnable);
                }
                return isBoosting();

            case MotionEvent.ACTION_POINTER_DOWN:
                // Pinch to zoom.
                handler.removeCallbacks(startBoostRunnable);
                return isBoosting();

            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                handler.removeCallbacks(startBoostRunnable);
                if (isBoosting()) {
                    stopBoost();
                    return true;
                }
                return false;

            default:
                return isBoosting();
        }
    }

    public void cancel() {
        handler.removeCallbacks(startBoostRunnable);
        if (isBoosting()) stopBoost();
    }

    private void startBoost() {
        View view = touchView;
        if (view == null) return;

        Player player;
        try {
            player = playerProvider.getPlayer();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to get player", ex);
            return;
        }
        if (player == null) return;
        if (player.getApplicationLooper() != Looper.getMainLooper()) {
            Log.w(TAG, "Player is not on the main looper");
            return;
        }
        int state = player.getPlaybackState();
        if (state == Player.STATE_IDLE
                || state == Player.STATE_ENDED
                || player.isPlayingAd()
                || player.isCurrentMediaItemLive()) {
            return;
        }

        previousSpeed = player.getPlaybackParameters().speed;
        player.setPlaybackSpeed(speed);
        // Like YouTube, holding a paused video plays it until released.
        wasPaused = !player.getPlayWhenReady();
        if (wasPaused) player.play();
        boostedPlayer = player;

        vibrate(view);
        if (callback != null) callback.onBoostStarted();
        showOverlay(view);
    }

    private void stopBoost() {
        Player player = boostedPlayer;
        boostedPlayer = null;
        hideOverlay();
        try {
            player.setPlaybackSpeed(previousSpeed);
            if (wasPaused) player.pause();
        } catch (Exception ex) {
            Log.e(TAG, "Failed to restore playback speed", ex);
        }
    }

    // LONG_PRESS is a weak double pulse on some ROMs (HyperOS), YouTube uses a single strong one.
    private static void vibrate(View view) {
        try {
            Vibrator vibrator = (Vibrator) view.getContext().getSystemService(Context.VIBRATOR_SERVICE);
            if (vibrator != null && vibrator.hasVibrator()) {
                vibrator.vibrate(VibrationEffect.createOneShot(25, 255));
                return;
            }
        } catch (Exception ex) {
            Log.w(TAG, "Failed to vibrate", ex);
        }
        view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
    }

    private void showOverlay(View view) {
        FrameLayout parent = findFrameLayoutAncestor(view);
        if (parent == null) return;

        if (overlay == null) {
            float density = view.getResources().getDisplayMetrics().density;

            GradientDrawable background = new GradientDrawable();
            background.setColor(Color.argb(153, 0, 0, 0));
            background.setCornerRadius(16 * density);

            overlay = new TextView(view.getContext());
            overlay.setBackground(background);
            overlay.setTextColor(Color.WHITE);
            overlay.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            overlay.setPadding((int) (12 * density), (int) (6 * density),
                    (int) (12 * density), (int) (6 * density));
            overlay.setText(formatSpeed(speed) + " ▶▶");
            overlay.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);

            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.TOP | Gravity.CENTER_HORIZONTAL);
            params.topMargin = (int) (24 * density);
            overlay.setLayoutParams(params);
        }

        if (overlay.getParent() != null) ((ViewGroup) overlay.getParent()).removeView(overlay);
        parent.addView(overlay);
    }

    private void hideOverlay() {
        if (overlay != null && overlay.getParent() != null) {
            ((ViewGroup) overlay.getParent()).removeView(overlay);
        }
    }

    private static FrameLayout findFrameLayoutAncestor(View view) {
        for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof FrameLayout) return (FrameLayout) parent;
        }
        return null;
    }

    private static String formatSpeed(float speed) {
        return speed == (int) speed ? (int) speed + "x" : speed + "x";
    }
}
