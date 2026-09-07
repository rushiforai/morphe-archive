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
import android.widget.Toast;
import android.widget.LinearLayout;
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
            SubtitleStyler.init(ctx);

            final LinearLayout row = new LinearLayout(ctx);
            row.setId(BUTTON_ID);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            // Draw above the media3 controller, which the app adds in-tree.
            row.setElevation(dp(ctx, 10));

            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.WRAP_CONTENT,
                    FrameLayout.LayoutParams.WRAP_CONTENT);
            // Top-left: the top-right corner is where Crunchyroll puts cast,
            // settings and close, and the chips were landing on top of them.
            params.gravity = Gravity.TOP | Gravity.START;
            params.topMargin = dp(ctx, 24);
            params.leftMargin = dp(ctx, 16);
            row.setLayoutParams(params);

            final Handler handler = new Handler(Looper.getMainLooper());
            final Runnable dim = new Runnable() {
                @Override
                public void run() {
                    row.animate().alpha(IDLE_ALPHA).setDuration(300).start();
                }
            };
            final Runnable wake = new Runnable() {
                @Override
                public void run() {
                    row.animate().cancel();
                    row.setAlpha(1f);
                    handler.removeCallbacks(dim);
                    handler.postDelayed(dim, IDLE_MS);
                }
            };

            final TextView aspect = chip(ctx, LABELS[index]);
            aspect.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    index = (index + 1) % MODES.length;
                    aspect.setText(LABELS[index]);
                    applyResizeMode(playerView, MODES[index]);
                    wake.run();
                }
            });
            row.addView(aspect);

            // Subtitle controls. These only take effect on the next track load,
            // because the script is rewritten on its way into libass.
            final TextView size = chip(ctx, SubtitleStyler.sizeLabel());
            size.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    SubtitleStyler.cycleSize();
                    size.setText(SubtitleStyler.sizeLabel());
                    toast(ctx);
                    wake.run();
                }
            });

            final TextView font = chip(ctx, SubtitleStyler.fontLabel());
            font.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    SubtitleStyler.cycleFont();
                    font.setText(SubtitleStyler.fontLabel());
                    toast(ctx);
                    wake.run();
                }
            });

            final TextView border = chip(ctx, SubtitleStyler.borderLabel());
            border.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    SubtitleStyler.cycleBorder();
                    border.setText(SubtitleStyler.borderLabel());
                    toast(ctx);
                    wake.run();
                }
            });

            size.setVisibility(View.GONE);
            font.setVisibility(View.GONE);
            border.setVisibility(View.GONE);

            final TextView cc = chip(ctx, "CC");
            cc.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    boolean show = size.getVisibility() != View.VISIBLE;
                    size.setVisibility(show ? View.VISIBLE : View.GONE);
                    font.setVisibility(show ? View.VISIBLE : View.GONE);
                    border.setVisibility(show ? View.VISIBLE : View.GONE);
                    wake.run();
                }
            });

            row.addView(cc);
            row.addView(size);
            row.addView(font);
            row.addView(border);

            parent.addView(row);

            // Re-assert the current choice (a fresh player defaults to FIT) and
            // start the idle timer.
            applyResizeMode(playerView, MODES[index]);
            handler.postDelayed(dim, IDLE_MS);
        } catch (Throwable ignored) {
        }
    }

    /**
     * The rewritten script is only read when libass loads a track, so a change
     * shows up on the next episode or after switching the subtitle language.
     */
    private static void toast(Context ctx) {
        try {
            String message = SubtitleStyler.hookSeen()
                    ? "Applies on the next episode or subtitle change"
                    : "Saved - no subtitle track has loaded yet";
            Toast.makeText(ctx, message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
        }
    }

    private static TextView chip(Context ctx, String text) {
        TextView view = new TextView(ctx);
        view.setText(text);
        view.setTextColor(Color.WHITE);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        view.setGravity(Gravity.CENTER);
        view.setPadding(dp(ctx, 10), dp(ctx, 6), dp(ctx, 10), dp(ctx, 6));

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xB3000000);
        bg.setCornerRadius(dp(ctx, 18));
        view.setBackground(bg);

        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        params.setMargins(dp(ctx, 3), 0, dp(ctx, 3), 0);
        view.setLayoutParams(params);
        return view;
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
