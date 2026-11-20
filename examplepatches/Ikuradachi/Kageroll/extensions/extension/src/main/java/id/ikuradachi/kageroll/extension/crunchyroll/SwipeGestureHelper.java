package id.ikuradachi.kageroll.extension.crunchyroll;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Handles vertical left-half brightness and right-half volume swipe gestures on
 * PlayerGesturesLayout, displaying a transient percentage HUD overlay.
 */
public final class SwipeGestureHelper {

    public static final int MASK_BRIGHTNESS = 1;
    public static final int MASK_VOLUME = 1 << 1;

    private static final int HUD_TAG = 0x7e110001;
    private static final long HUD_HIDE_DELAY_MS = 850L;
    private static final float EDGE_INSET_DP = 24f;
    private static final float GESTURE_RANGE_FRACTION = 0.65f;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Map<ViewGroup, GestureState> STATES = new WeakHashMap<>();

    private SwipeGestureHelper() {
    }

    /**
     * Bitmask of enabled swipe gestures. Patched at build time by PlayerGesturesPatch.
     */
    public static int getEnabledSwipeMask() {
        return MASK_BRIGHTNESS | MASK_VOLUME;
    }

    private static final class GestureState {
        final int touchSlop;
        final float edgeInsetPx;
        boolean tracking;
        boolean active;
        boolean isBrightness;
        float downX;
        float downY;
        float startBrightness;
        int startVolume;
        int maxVolume;
        float volumeAccumulator;
        LinearLayout hudRoot;
        TextView hudIcon;
        TextView hudLabel;
        ProgressBar hudProgress;
        Runnable hideRunnable;

        GestureState(Context context) {
            this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
            this.edgeInsetPx = dpToPx(context, EDGE_INSET_DP);
        }
    }

    public static void attach(ViewGroup container) {
        if (container == null || getEnabledSwipeMask() == 0) {
            return;
        }
        synchronized (STATES) {
            if (!STATES.containsKey(container)) {
                STATES.put(container, new GestureState(container.getContext()));
            }
        }
        ensureHud(container);
    }

    public static boolean onTouch(ViewGroup container, MotionEvent event) {
        if (container == null || event == null) {
            return false;
        }
        int mask = getEnabledSwipeMask();
        if (mask == 0) {
            return false;
        }

        GestureState state;
        synchronized (STATES) {
            state = STATES.get(container);
            if (state == null) {
                state = new GestureState(container.getContext());
                STATES.put(container, state);
            }
        }

        int action = event.getActionMasked();
        if (event.getPointerCount() > 1) {
            if (state.active) {
                scheduleHideHud(state);
            }
            state.tracking = false;
            state.active = false;
            return false;
        }

        switch (action) {
            case MotionEvent.ACTION_DOWN: {
                float x = event.getX();
                float y = event.getY();
                int w = container.getWidth();
                int h = container.getHeight();
                state.active = false;
                if (w <= 0 || h <= 0) {
                    state.tracking = false;
                    return false;
                }
                if (y < state.edgeInsetPx || y > h - state.edgeInsetPx
                        || x < state.edgeInsetPx || x > w - state.edgeInsetPx) {
                    state.tracking = false;
                    return false;
                }
                boolean leftSide = x < (w * 0.5f);
                if ((leftSide && (mask & MASK_BRIGHTNESS) == 0)
                        || (!leftSide && (mask & MASK_VOLUME) == 0)) {
                    state.tracking = false;
                    return false;
                }
                state.tracking = true;
                state.isBrightness = leftSide;
                state.downX = x;
                state.downY = y;
                return false;
            }
            case MotionEvent.ACTION_MOVE: {
                if (!state.tracking) {
                    return false;
                }
                float dx = event.getX() - state.downX;
                float dy = state.downY - event.getY(); // up is positive
                if (!state.active) {
                    if (Math.abs(dx) > state.touchSlop && Math.abs(dx) > Math.abs(dy)) {
                        state.tracking = false;
                        return false;
                    }
                    if (Math.abs(dy) > state.touchSlop && Math.abs(dy) > Math.abs(dx)) {
                        state.active = true;
                        state.downY = event.getY();
                        initGestureBaseline(container, state);
                        dy = 0f;
                    } else {
                        return false;
                    }
                }
                float range = Math.max(container.getHeight() * GESTURE_RANGE_FRACTION, 1f);
                float deltaFraction = dy / range;
                if (state.isBrightness) {
                    applyBrightness(container, state, deltaFraction);
                } else {
                    applyVolume(container, state, deltaFraction);
                }
                return true;
            }
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL: {
                boolean wasActive = state.active;
                state.tracking = false;
                state.active = false;
                if (wasActive) {
                    scheduleHideHud(state);
                    return true;
                }
                return false;
            }
            default:
                return state.active;
        }
    }

    private static void initGestureBaseline(ViewGroup container, GestureState state) {
        if (state.isBrightness) {
            Activity activity = findActivity(container.getContext());
            float current = -1f;
            if (activity != null && activity.getWindow() != null) {
                current = activity.getWindow().getAttributes().screenBrightness;
            }
            if (current < 0f) {
                try {
                    int sys = Settings.System.getInt(
                            container.getContext().getContentResolver(),
                            Settings.System.SCREEN_BRIGHTNESS
                    );
                    current = Math.max(0.01f, Math.min(1f, sys / 255f));
                } catch (Exception ignored) {
                    current = 0.5f;
                }
            }
            state.startBrightness = current;
        } else {
            AudioManager am = (AudioManager) container.getContext().getSystemService(Context.AUDIO_SERVICE);
            if (am != null) {
                state.maxVolume = Math.max(1, am.getStreamMaxVolume(AudioManager.STREAM_MUSIC));
                state.startVolume = am.getStreamVolume(AudioManager.STREAM_MUSIC);
                state.volumeAccumulator = state.startVolume;
            } else {
                state.maxVolume = 15;
                state.startVolume = 0;
                state.volumeAccumulator = 0f;
            }
        }
    }

    private static void applyBrightness(ViewGroup container, GestureState state, float deltaFraction) {
        float target = Math.max(0.01f, Math.min(1.0f, state.startBrightness + deltaFraction));
        Activity activity = findActivity(container.getContext());
        if (activity != null) {
            Window window = activity.getWindow();
            if (window != null) {
                WindowManager.LayoutParams lp = window.getAttributes();
                lp.screenBrightness = target;
                window.setAttributes(lp);
            }
        }
        int percent = Math.round(target * 100f);
        showHud(container, state, "\u2600", percent + "%", percent);
    }

    private static void applyVolume(ViewGroup container, GestureState state, float deltaFraction) {
        AudioManager am = (AudioManager) container.getContext().getSystemService(Context.AUDIO_SERVICE);
        if (am == null || state.maxVolume <= 0) {
            return;
        }
        float raw = state.startVolume + (deltaFraction * state.maxVolume);
        int target = Math.max(0, Math.min(state.maxVolume, Math.round(raw)));
        if (target != am.getStreamVolume(AudioManager.STREAM_MUSIC)) {
            am.setStreamVolume(AudioManager.STREAM_MUSIC, target, 0);
        }
        int percent = Math.round((target * 100f) / state.maxVolume);
        String icon = target == 0 ? "\uD83D\uDD07" : "\uD83D\uDD0A";
        showHud(container, state, icon, percent + "%", percent);
    }

    private static void ensureHud(ViewGroup container) {
        View existing = container.findViewById(HUD_TAG);
        if (existing instanceof LinearLayout) {
            return;
        }

        Context context = container.getContext();
        LinearLayout hud = new LinearLayout(context);
        hud.setId(HUD_TAG);
        hud.setOrientation(LinearLayout.VERTICAL);
        hud.setGravity(Gravity.CENTER);
        int padH = dpToPxInt(context, 18f);
        int padV = dpToPxInt(context, 12f);
        hud.setPadding(padH, padV, padH, padV);
        hud.setVisibility(View.GONE);
        hud.setClickable(false);
        hud.setFocusable(false);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.argb(185, 20, 20, 24));
        bg.setCornerRadius(dpToPx(context, 14f));
        hud.setBackground(bg);

        TextView iconView = new TextView(context);
        iconView.setTextColor(Color.WHITE);
        iconView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
        iconView.setGravity(Gravity.CENTER);
        hud.addView(iconView);

        TextView labelView = new TextView(context);
        labelView.setTextColor(Color.WHITE);
        labelView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        labelView.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams labelLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        labelLp.topMargin = dpToPxInt(context, 4f);
        labelLp.bottomMargin = dpToPxInt(context, 6f);
        hud.addView(labelView, labelLp);

        ProgressBar progress = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
        progress.setMax(100);
        LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(
                dpToPxInt(context, 108f),
                dpToPxInt(context, 4f)
        );
        hud.addView(progress, barLp);

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER
        );
        container.addView(hud, lp);

        GestureState state;
        synchronized (STATES) {
            state = STATES.get(container);
        }
        if (state != null) {
            state.hudRoot = hud;
            state.hudIcon = iconView;
            state.hudLabel = labelView;
            state.hudProgress = progress;
        }
    }

    private static void showHud(
            ViewGroup container,
            GestureState state,
            String icon,
            String text,
            int progress
    ) {
        if (state.hudRoot == null) {
            ensureHud(container);
        }
        if (state.hudRoot == null) {
            return;
        }
        if (state.hideRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.hideRunnable);
        }
        state.hudIcon.setText(icon);
        state.hudLabel.setText(text);
        state.hudProgress.setProgress(Math.max(0, Math.min(100, progress)));
        state.hudRoot.animate().cancel();
        state.hudRoot.setAlpha(1f);
        state.hudRoot.setVisibility(View.VISIBLE);
    }

    private static void scheduleHideHud(final GestureState state) {
        if (state.hudRoot == null) {
            return;
        }
        if (state.hideRunnable != null) {
            MAIN_HANDLER.removeCallbacks(state.hideRunnable);
        }
        state.hideRunnable = new Runnable() {
            @Override
            public void run() {
                if (state.hudRoot != null) {
                    state.hudRoot.animate()
                            .alpha(0f)
                            .setDuration(180L)
                            .withEndAction(new Runnable() {
                                @Override
                                public void run() {
                                    if (!state.active && state.hudRoot != null) {
                                        state.hudRoot.setVisibility(View.GONE);
                                    }
                                }
                            })
                            .start();
                }
            }
        };
        MAIN_HANDLER.postDelayed(state.hideRunnable, HUD_HIDE_DELAY_MS);
    }

    private static Activity findActivity(Context context) {
        Context current = context;
        while (current instanceof ContextWrapper) {
            if (current instanceof Activity) {
                return (Activity) current;
            }
            current = ((ContextWrapper) current).getBaseContext();
        }
        return null;
    }

    private static float dpToPx(Context context, float dp) {
        return TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP,
                dp,
                context.getResources().getDisplayMetrics()
        );
    }

    private static int dpToPxInt(Context context, float dp) {
        return Math.round(dpToPx(context, dp));
    }
}
