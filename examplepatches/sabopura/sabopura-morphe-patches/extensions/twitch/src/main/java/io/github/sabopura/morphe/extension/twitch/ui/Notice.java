/*
 * The notice pill follows Bencho's toast-stack block (ToastStack.tsx), MIT License.
 * Copyright (c) 2026 Lorenzo Cabra
 */
package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.View;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityManager;
import android.widget.Toast;

import java.lang.ref.WeakReference;

/**
 * A pill near the top of the screen in place of a Toast. It is drawn on a window overlay so it can never
 * take a touch; a repeat replaces the words instead of queueing another pill. Being drawn, it is also
 * said aloud for TalkBack, which reads a Toast by itself but cannot see an overlay.
 */
public final class Notice {
    private static final float[] EXIT = {.4f, 0f, 1f, 1f};
    private static final int EXIT_MS = 220;
    private static WeakReference<View> preferred = new WeakReference<>(null);
    private static WeakReference<View> player = new WeakReference<>(null);
    /** Weak: a window that closes while its pill shows must not be kept by this class. */
    private static WeakReference<Pill> active = new WeakReference<>(null);

    private Notice() {
    }

    /** While a dialog covers the player, its notices must show in that dialog. */
    static void prefer(View host) {
        preferred = new WeakReference<>(host);
    }

    /** Remembers the player's window, for notices raised with only the application context. */
    static void rememberPlayer(View root) {
        player = new WeakReference<>(root);
    }

    public static void show(Context context, String text) {
        try {
            View root = host(context);
            if (root == null) {
                Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
                return;
            }
            Pill current = active.get();
            if (current != null && current.root == root && !current.closing) {
                current.replace(text);
                return;
            }
            if (current != null) current.remove();
            current = new Pill(root, text);
            active = new WeakReference<>(current);
            root.getOverlay().add(current);
            current.enter();
        } catch (RuntimeException e) {
            Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
        }
    }

    /** A window that is on screen; a closed activity's decor would swallow the words and outlive it. */
    private static View host(Context context) {
        View dialog = preferred.get();
        if (dialog != null && dialog.isAttachedToWindow()) return dialog.getRootView();
        android.app.Activity activity = Ui.activity(context);
        if (activity != null && activity.getWindow() != null && !activity.isFinishing()) {
            View decor = activity.getWindow().peekDecorView();
            if (decor != null && decor.isAttachedToWindow()) return decor;
        }
        View root = player.get();
        return root != null && root.isAttachedToWindow() ? root.getRootView() : null;
    }

    /** The reading time, raised to the user's accessibility timeout where Android 10+ has one. */
    private static int millisFor(Context context, int millis) {
        if (Build.VERSION.SDK_INT < 29) return millis;
        AccessibilityManager manager = (AccessibilityManager) context.getSystemService(Context.ACCESSIBILITY_SERVICE);
        return manager == null ? millis : manager.getRecommendedTimeoutMillis(millis, AccessibilityManager.FLAG_CONTENT_TEXT);
    }

    private static final class Pill extends Drawable implements Motion.Step {
        final View root;
        boolean closing;
        private final Paint box = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final TextPaint paint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final Spring rise = new Spring(1).tune(380, 34, 1);
        private final Motion.Loop loop;
        private final float density;
        private final Runnable leave = this::exit;
        private StaticLayout layout;
        private long exitStart = -1;
        private float alpha = 0, slide = 0;
        private int top;

        Pill(View root, String text) {
            this.root = root;
            density = root.getResources().getDisplayMetrics().density;
            box.setColor(0xF022222A);
            paint.setColor(0xFFEFEFF1);
            paint.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14,
                    root.getResources().getDisplayMetrics()));
            loop = new Motion.Loop(root, this);
            setText(text);
        }

        private void setText(String text) {
            int maxWidth = Math.min(Math.round(root.getWidth() * .84f), Math.round(440 * density));
            maxWidth = Math.max(Math.round(120 * density), maxWidth);
            layout = StaticLayout.Builder.obtain(text, 0, text.length(), paint, maxWidth)
                    .setAlignment(Layout.Alignment.ALIGN_CENTER).setMaxLines(4)
                    .setEllipsize(android.text.TextUtils.TruncateAt.END).build();
            setBounds(0, 0, Math.max(1, root.getWidth()), Math.max(1, root.getHeight()));
            top = topInset();
            root.removeCallbacks(leave);
            root.postDelayed(leave, millisFor(root.getContext(), PortMath.noticeMillis(text.length())));
            root.announceForAccessibility(text);
            invalidateSelf();
            root.invalidate();
        }

        void replace(String text) {
            setText(text);
        }

        void enter() {
            rise.target = 0;
            loop.start();
        }

        private void exit() {
            if (closing) return;
            closing = true;
            exitStart = 0;
            loop.start();
        }

        void remove() {
            loop.stop();
            root.removeCallbacks(leave);
            root.getOverlay().remove(this);
        }

        @Override
        public boolean frame(float seconds, long nowMs) {
            if (closing) {
                if (exitStart == 0) exitStart = nowMs;
                float t = Math.min(1, (nowMs - exitStart) / (float) EXIT_MS);
                float e = Ease.bezier(EXIT, t);
                alpha = 1 - e;
                slide = e * 60 * density;
                invalidateSelf();
                if (t >= 1) {
                    finish();
                    return false;
                }
                return true;
            }
            boolean moving = rise.step(seconds, 4, .002f, .01f);
            alpha = 1 - rise.value;
            invalidateSelf();
            return moving;
        }

        @Override
        public void snap() {
            if (closing) {
                finish();
            } else {
                rise.jump(0);
                alpha = 1;
                invalidateSelf();
            }
        }

        private void finish() {
            root.getOverlay().remove(this);
            if (active.get() == this) active.clear();
        }

        @SuppressWarnings("deprecation")
        private int topInset() {
            WindowInsets insets = root.getRootWindowInsets();
            if (insets == null) return 0;
            if (Build.VERSION.SDK_INT >= 30)
                return insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout()).top;
            return insets.getSystemWindowInsetTop();
        }

        @Override
        public void draw(Canvas canvas) {
            float padX = 16 * density, padY = 10 * density;
            float width = 0;
            for (int i = 0; i < layout.getLineCount(); i++) width = Math.max(width, layout.getLineWidth(i));
            float boxW = width + padX * 2, boxH = layout.getHeight() + padY * 2;
            float left = (getBounds().width() - boxW) / 2 + slide;
            float top = this.top + 12 * density + rise.value * 24 * density;
            float radius = layout.getLineCount() > 1 ? 18 * density : boxH / 2;
            rect.set(left, top, left + boxW, top + boxH);
            int a = Math.round(Math.max(0, Math.min(1, alpha)) * 255);
            box.setAlpha(Math.round(a * 240f / 255f));
            paint.setAlpha(a);
            canvas.drawRoundRect(rect, radius, radius, box);
            canvas.save();
            canvas.translate(left + padX - (layout.getWidth() - width) / 2, top + padY);
            layout.draw(canvas);
            canvas.restore();
        }

        @Override
        public void setAlpha(int value) {
        }

        @Override
        public void setColorFilter(ColorFilter filter) {
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
