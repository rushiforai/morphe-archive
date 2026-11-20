package id.ikuradachi.kageroll.extension.crunchyroll;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.lang.reflect.Method;

/**
 * Cycles player video resize modes (FIT=0 -> ZOOM=4 -> FILL=3 -> FIT=0) and persists
 * the active resize mode in SharedPreferences across player sessions.
 */
public final class AspectHelper {

    public static final int RESIZE_MODE_FIT = 0;
    public static final int RESIZE_MODE_FILL = 3;
    public static final int RESIZE_MODE_ZOOM = 4;

    private static final String PREFS_NAME = "kageroll_player_prefs";
    private static final String KEY_RESIZE_MODE = "aspect_resize_mode";
    private static final int PILL_TAG = 0x7e110002;
    private static final long PILL_HIDE_DELAY_MS = 1000L;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static volatile Method cachedGetResizeMode;

    private AspectHelper() {
    }

    /**
     * Default resize mode when no user choice has been saved yet. Patched at build time.
     */
    public static int getDefaultResizeMode() {
        return RESIZE_MODE_FIT;
    }

    /**
     * Whether 3-way cycling (FIT -> ZOOM -> FILL -> FIT) is enabled on pinch-out.
     * Patched at build time by AspectModePatch.
     */
    public static boolean isThreeWayCycleEnabled() {
        return true;
    }

    /**
     * Resolves the resize mode to apply from a scale gesture request, saves it,
     * shows a brief mode badge on the player view, and returns the resolved Media3 constant.
     */
    public static int resolveAndSaveResizeMode(View playerView, int requestedMode) {
        if (playerView == null) {
            return requestedMode;
        }

        int currentMode = readCurrentResizeMode(playerView);
        int nextMode;
        if (requestedMode == RESIZE_MODE_ZOOM && isThreeWayCycleEnabled()) {
            if (currentMode == RESIZE_MODE_FIT) {
                nextMode = RESIZE_MODE_ZOOM;
            } else if (currentMode == RESIZE_MODE_ZOOM) {
                nextMode = RESIZE_MODE_FILL;
            } else if (currentMode == RESIZE_MODE_FILL) {
                nextMode = RESIZE_MODE_FIT;
            } else {
                nextMode = RESIZE_MODE_ZOOM;
            }
        } else {
            nextMode = requestedMode;
        }

        saveResizeMode(playerView.getContext(), nextMode);
        if (playerView instanceof ViewGroup) {
            showModeBadge((ViewGroup) playerView, nextMode);
        }
        return nextMode;
    }

    /**
     * Returns the persisted resize mode (or patch default) to apply on player attachment.
     */
    public static int getSavedResizeMode(View playerView) {
        if (playerView == null) {
            return -1;
        }
        Context context = playerView.getContext();
        SharedPreferences prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        int mode = prefs.getInt(KEY_RESIZE_MODE, getDefaultResizeMode());
        if (mode == RESIZE_MODE_FIT || mode == RESIZE_MODE_FILL || mode == RESIZE_MODE_ZOOM) {
            return mode;
        }
        return RESIZE_MODE_FIT;
    }

    private static void saveResizeMode(Context context, int mode) {
        if (context == null) {
            return;
        }
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .edit()
                .putInt(KEY_RESIZE_MODE, mode)
                .apply();
    }

    private static int readCurrentResizeMode(View playerView) {
        try {
            Method method = cachedGetResizeMode;
            if (method == null || !method.getDeclaringClass().isInstance(playerView)) {
                method = playerView.getClass().getMethod("getResizeMode");
                cachedGetResizeMode = method;
            }
            Object result = method.invoke(playerView);
            if (result instanceof Integer) {
                return (Integer) result;
            }
        } catch (Exception ignored) {
        }
        return getSavedResizeMode(playerView);
    }

    private static void showModeBadge(ViewGroup playerView, int mode) {
        String label;
        switch (mode) {
            case RESIZE_MODE_ZOOM:
                label = "Zoom";
                break;
            case RESIZE_MODE_FILL:
                label = "Fill";
                break;
            case RESIZE_MODE_FIT:
            default:
                label = "Fit";
                break;
        }

        Context context = playerView.getContext();
        View existing = playerView.findViewById(PILL_TAG);
        final TextView badge;
        if (existing instanceof TextView) {
            badge = (TextView) existing;
        } else {
            badge = new TextView(context);
            badge.setId(PILL_TAG);
            badge.setTextColor(Color.WHITE);
            badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            int padH = dpToPxInt(context, 14f);
            int padV = dpToPxInt(context, 6f);
            badge.setPadding(padH, padV, padH, padV);
            badge.setClickable(false);
            badge.setFocusable(false);

            GradientDrawable bg = new GradientDrawable();
            bg.setColor(Color.argb(190, 20, 20, 24));
            bg.setCornerRadius(dpToPx(context, 16f));
            badge.setBackground(bg);

            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.TOP | Gravity.CENTER_HORIZONTAL
            );
            lp.topMargin = dpToPxInt(context, 24f);
            playerView.addView(badge, lp);
        }

        Runnable pendingHide = badge.getTag() instanceof Runnable ? (Runnable) badge.getTag() : null;
        if (pendingHide != null) {
            MAIN_HANDLER.removeCallbacks(pendingHide);
        }
        badge.setText(label);
        badge.animate().cancel();
        badge.setAlpha(1f);
        badge.setVisibility(View.VISIBLE);

        Runnable hideTask = new Runnable() {
            @Override
            public void run() {
                badge.animate()
                        .alpha(0f)
                        .setDuration(180L)
                        .withEndAction(new Runnable() {
                            @Override
                            public void run() {
                                badge.setVisibility(View.GONE);
                            }
                        })
                        .start();
            }
        };
        badge.setTag(hideTask);
        MAIN_HANDLER.postDelayed(hideTask, PILL_HIDE_DELAY_MS);
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
