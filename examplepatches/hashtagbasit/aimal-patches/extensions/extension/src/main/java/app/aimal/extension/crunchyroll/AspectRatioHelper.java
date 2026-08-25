package app.aimal.extension.crunchyroll;

import android.content.Context;
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
 * A persistent aspect-ratio toggle for Crunchyroll's player.
 *
 * Crunchyroll's InternalPlayerViewLayout extends androidx.media3.ui.PlayerView,
 * so the picture is reshaped through media3's own {@code setResizeMode(int)} —
 * reached by reflection so nothing here has to link against media3-ui. That
 * keeps the app's own layout logic intact and works on DRM output.
 *
 * An earlier version tied a button's visibility to the app's showControls /
 * hideControls callbacks. Those stopped firing the button into view on 3.117.0,
 * so it never appeared. This version is deliberately self-contained: a small
 * chip added once when the player attaches, always present, dimming a couple of
 * seconds after the last tap. It depends on nothing but the framework.
 */
public final class AspectRatioHelper {

    /** Unlikely to collide with the app's own view ids; used for idempotency. */
    private static final int BUTTON_ID = 0x7f0a9990;

    /** androidx.media3.ui.PlayerView / AspectRatioFrameLayout resize modes. */
    private static final int RESIZE_FIT = 0;
    private static final int RESIZE_FILL = 3;

    private static final int[] MODES = {RESIZE_FIT, RESIZE_FILL};
    private static final String[] LABELS = {"FIT", "STRETCH"};

    private static final long IDLE_MS = 2500;
    private static final float IDLE_ALPHA = 0.35f;

    /** Remembered across player re-creations within the process. */
    private static int index = 0;

    private AspectRatioHelper() {
    }

    /**
     * Called from InternalPlayerViewLayout.onAttachedToWindow with the player
     * view as the argument. Must not throw — it runs on the view's attach path.
     */
    public static void addAspectRatioButton(final View playerView) {
        try {
            if (!(playerView instanceof ViewGroup)) return;
            final ViewGroup parent = (ViewGroup) playerView;

            // Defer to a laid-out state so the player's own overlays exist and
            // the view has a usable size.
            playerView.post(new Runnable() {
                @Override
                public void run() {
                    attach(playerView, parent);
                }
            });
        } catch (Throwable ignored) {
            // Never take the player down for a control chip.
        }
    }

    private static void attach(final View playerView, final ViewGroup parent) {
        try {
            if (parent.findViewById(BUTTON_ID) != null) return;

            final Context ctx = playerView.getContext();
            final TextView button = new TextView(ctx);
            button.setId(BUTTON_ID);
            button.setText(LABELS[index]);
            button.setTextColor(Color.WHITE);
            button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            button.setGravity(Gravity.CENTER);
            button.setPadding(dp(ctx, 12), dp(ctx, 6), dp(ctx, 12), dp(ctx, 6));

            GradientDrawable bg = new GradientDrawable();
            bg.setColor(0xB3000000);
            bg.setCornerRadius(dp(ctx, 18));
            button.setBackground(bg);
            // Draw above the media3 controller, which the app adds in-tree.
            button.setElevation(dp(ctx, 10));

            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.WRAP_CONTENT,
                    FrameLayout.LayoutParams.WRAP_CONTENT);
            params.gravity = Gravity.TOP | Gravity.END;
            params.topMargin = dp(ctx, 24);
            params.rightMargin = dp(ctx, 16);
            button.setLayoutParams(params);

            final Handler handler = new Handler(Looper.getMainLooper());
            final Runnable dim = new Runnable() {
                @Override
                public void run() {
                    button.animate().alpha(IDLE_ALPHA).setDuration(300).start();
                }
            };

            button.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    index = (index + 1) % MODES.length;
                    button.setText(LABELS[index]);
                    applyResizeMode(playerView, MODES[index]);

                    button.animate().cancel();
                    button.setAlpha(1f);
                    handler.removeCallbacks(dim);
                    handler.postDelayed(dim, IDLE_MS);
                }
            });

            parent.addView(button);

            // Re-assert the current choice (a fresh player defaults to FIT) and
            // start the idle timer.
            applyResizeMode(playerView, MODES[index]);
            handler.postDelayed(dim, IDLE_MS);
        } catch (Throwable ignored) {
        }
    }

    private static void applyResizeMode(View playerView, int mode) {
        Method method = findSetResizeMode(playerView.getClass());
        if (method == null) return;
        try {
            method.setAccessible(true);
            method.invoke(playerView, mode);
        } catch (Throwable ignored) {
        }
    }

    /** setResizeMode(int) is declared on media3's PlayerView, a superclass. */
    private static Method findSetResizeMode(Class<?> type) {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                return c.getDeclaredMethod("setResizeMode", int.class);
            } catch (NoSuchMethodException ignored) {
                // Keep walking up.
            }
        }
        return null;
    }

    private static int dp(Context ctx, int dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, ctx.getResources().getDisplayMetrics());
    }
}
