package io.github.jordanwoodson.extension.shared.rumble;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityManager;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Player gestures for Rumble: in landscape, a vertical swipe on the left of the video changes the window's
 * brightness, on the right the media volume. Rumble's own taps and double-taps (play, pause, skip) are left
 * alone: a touch only becomes a swipe once it moves vertically past the touch slop, and then the rest of the app
 * gets a cancel.
 */
@SuppressWarnings("unused")
public final class RumbleGestures {
    static final String KEY = "player_gestures";

    /** Media3's video frame, inflated from XML, so the name survives R8. */
    private static final String FRAME = "androidx.media3.ui.AspectRatioFrameLayout";

    private static final int IDLE = 0;
    private static final int CANDIDATE = 1;
    private static final int CLAIMED = 2;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static int state = IDLE;
    private static int pointer;
    private static float downX;
    private static float downY;
    private static float height;
    private static float start;
    private static boolean brightness;
    private static boolean brightnessSet;
    private static WeakReference<TextView> indicator = new WeakReference<>(null);
    private static final Runnable HIDE = RumbleGestures::hideIndicator;

    private RumbleGestures() {
    }

    /**
     * Injection point: the start of the main activity's dispatchTouchEvent. True consumes the event; false lets
     * the activity dispatch it as usual.
     */
    public static boolean dispatch(Activity activity, MotionEvent event) {
        if (activity == null || event == null) return false;
        try {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    state = IDLE;
                    resetBrightness(activity);
                    if (on() && begin(activity, event)) state = CANDIDATE;
                    return false;
                case MotionEvent.ACTION_MOVE:
                    if (state == CANDIDATE) return move(activity, event);
                    if (state == CLAIMED) {
                        int index = event.findPointerIndex(pointer);
                        if (index >= 0) apply(activity, (downY - event.getY(index)) / height);
                        return true;
                    }
                    return false;
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    boolean claimed = state == CLAIMED;
                    state = IDLE;
                    if (claimed) {
                        MAIN.removeCallbacks(HIDE);
                        MAIN.postDelayed(HIDE, 700);
                    }
                    return claimed;
                default:
                    // A second finger: leave pinch and the rest to Rumble.
                    if (state == CLAIMED) {
                        state = IDLE;
                        hideIndicator();
                        return true;
                    }
                    state = IDLE;
                    return false;
            }
        } catch (Throwable t) {
            state = IDLE;
            Logger.d("gestures: " + t);
            return false;
        }
    }

    private static boolean on() {
        return Settings.isRegistered(KEY) && Settings.isEnabled(KEY);
    }

    /** Whether a touch here may become a swipe: landscape, a large video frame, its left or right side. */
    private static boolean begin(Activity activity, MotionEvent event) {
        if (event.getPointerCount() != 1) return false;
        if (activity.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE) return false;
        if (activity.isInPictureInPictureMode()) return false;
        AccessibilityManager accessibility = (AccessibilityManager) activity.getSystemService(Context.ACCESSIBILITY_SERVICE);
        if (accessibility != null && accessibility.isTouchExplorationEnabled()) return false;
        View decor = activity.getWindow().getDecorView();
        View frame = largestFrame(decor, null);
        if (frame == null || frame.getWidth() < decor.getWidth() / 2) return false;
        int[] location = new int[2];
        frame.getLocationOnScreen(location);
        Rect rect = new Rect(location[0], location[1], location[0] + frame.getWidth(), location[1] + frame.getHeight());
        float x = event.getRawX();
        float y = event.getRawY();
        if (!rect.contains((int) x, (int) y)) return false;
        // Leave the top edge (system bars, the close button) and the seek bar at the bottom alone.
        if (y < rect.top + rect.height() * 0.15f || y > rect.bottom - rect.height() * 0.2f) return false;
        float relative = (x - rect.left) / rect.width();
        if (relative > 0.35f && relative < 0.65f) return false;
        pointer = event.getPointerId(0);
        downX = event.getX();
        downY = event.getY();
        height = Math.max(1, rect.height());
        brightness = relative <= 0.35f;
        return true;
    }

    private static boolean move(Activity activity, MotionEvent event) {
        int index = event.findPointerIndex(pointer);
        if (index < 0 || event.getPointerCount() > 1) {
            state = IDLE;
            return false;
        }
        float dx = event.getX(index) - downX;
        float dy = event.getY(index) - downY;
        int slop = ViewConfiguration.get(activity).getScaledTouchSlop();
        if (Math.abs(dy) > slop && Math.abs(dy) > 2 * Math.abs(dx)) {
            if (!claim(activity)) {
                state = IDLE;
                return false;
            }
            state = CLAIMED;
            downY = event.getY(index);
            // The rest of the app saw the touch go down; it gets a cancel instead of the swipe.
            MotionEvent cancel = MotionEvent.obtain(event);
            cancel.setAction(MotionEvent.ACTION_CANCEL);
            activity.getWindow().superDispatchTouchEvent(cancel);
            cancel.recycle();
            return true;
        }
        if (Math.abs(dx) > slop) state = IDLE;
        return false;
    }

    private static boolean claim(Activity activity) {
        if (brightness) {
            float current = activity.getWindow().getAttributes().screenBrightness;
            if (current < 0) {
                try {
                    current = android.provider.Settings.System.getInt(activity.getContentResolver(),
                            android.provider.Settings.System.SCREEN_BRIGHTNESS) / 255f;
                } catch (android.provider.Settings.SettingNotFoundException e) {
                    current = 0.5f;
                }
            }
            start = current;
        } else {
            AudioManager audio = (AudioManager) activity.getSystemService(Context.AUDIO_SERVICE);
            if (audio == null) return false;
            start = audio.getStreamVolume(AudioManager.STREAM_MUSIC);
        }
        return true;
    }

    private static void apply(Activity activity, float fraction) {
        String text;
        if (brightness) {
            Window window = activity.getWindow();
            float value = Math.max(0.01f, Math.min(1f, start + fraction));
            WindowManager.LayoutParams attributes = window.getAttributes();
            attributes.screenBrightness = value;
            window.setAttributes(attributes);
            brightnessSet = true;
            text = "Brightness " + Math.round(value * 100) + "%";
        } else {
            AudioManager audio = (AudioManager) activity.getSystemService(Context.AUDIO_SERVICE);
            if (audio == null) return;
            int max = audio.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
            int value = Math.max(0, Math.min(max, Math.round(start + fraction * max)));
            if (value != audio.getStreamVolume(AudioManager.STREAM_MUSIC)) {
                audio.setStreamVolume(AudioManager.STREAM_MUSIC, value, 0);
            }
            text = "Volume " + Math.round(value * 100f / Math.max(1, max)) + "%";
        }
        showIndicator(activity, text);
    }

    /** Back out of landscape, the window's brightness goes back to the system's, if a swipe changed it. */
    private static void resetBrightness(Activity activity) {
        if (!brightnessSet) return;
        if (activity.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE) return;
        brightnessSet = false;
        Window window = activity.getWindow();
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.screenBrightness = WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE;
        window.setAttributes(attributes);
    }

    private static View largestFrame(View view, View best) {
        if (view.getVisibility() != View.VISIBLE) return best;
        if (view.getClass().getName().equals(FRAME) && view.isShown()
                && (best == null || (long) view.getWidth() * view.getHeight() > (long) best.getWidth() * best.getHeight())) {
            best = view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) best = largestFrame(group.getChildAt(i), best);
        }
        return best;
    }

    private static void showIndicator(Activity activity, String text) {
        ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
        TextView view = indicator.get();
        if (view == null || view.getParent() != decor) {
            if (view != null && view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
            float density = activity.getResources().getDisplayMetrics().density;
            view = new TextView(activity);
            view.setTextColor(Color.WHITE);
            view.setTextSize(16);
            int padding = Math.round(12 * density);
            view.setPadding(padding * 2, padding, padding * 2, padding);
            GradientDrawable background = new GradientDrawable();
            background.setColor(0xB3000000);
            background.setCornerRadius(12 * density);
            view.setBackground(background);
            view.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            decor.addView(view, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
            indicator = new WeakReference<>(view);
        }
        view.setText(text);
        view.setTranslationX(0);
        view.setTranslationY(0);
        view.setVisibility(View.VISIBLE);
        MAIN.removeCallbacks(HIDE);
    }

    /** Shows {@code text} over the middle of {@code frame} for a moment: Remote control's play, pause and skips. */
    static void flash(Activity activity, String text, View frame) {
        showIndicator(activity, text);
        TextView view = indicator.get();
        if (view != null && frame != null && frame.isShown()) {
            View decor = activity.getWindow().getDecorView();
            int[] at = new int[2];
            int[] root = new int[2];
            frame.getLocationInWindow(at);
            decor.getLocationInWindow(root);
            view.setTranslationX(at[0] - root[0] + (frame.getWidth() - decor.getWidth()) / 2f);
            view.setTranslationY(at[1] - root[1] + (frame.getHeight() - decor.getHeight()) / 2f);
        }
        MAIN.postDelayed(HIDE, 800);
    }

    private static void hideIndicator() {
        TextView view = indicator.get();
        if (view != null && view.getParent() instanceof ViewGroup) ((ViewGroup) view.getParent()).removeView(view);
        indicator = new WeakReference<>(null);
    }
}
