/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.profile;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import app.morphe.extension.hushthreads.download.MediaSave;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.hushthreads.settings.SettingsIcons;
import app.morphe.extension.hushthreads.settings.SettingsStatus;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * A profile picture full screen on black: pinch or double tap to zoom, drag to look around a
 * zoomed picture, tap to hide or show the bar. The bar has Close, the account's name, and Save when
 * the Save media switch is on. Back closes it too. The picture is fetched off the main thread
 * through the same address rules as a save, and decoded no bigger than {@link #MAX_SIDE}.
 */
final class PictureViewer {
    /** The longest side a decoded picture keeps. A profile picture's largest size is far under it. */
    static final int MAX_SIDE = 4096;

    private final Activity activity;
    private final String url;
    private final String username;
    private final ProfilePicture.Source source;
    private final Runnable onClosed;
    private volatile boolean closed;
    /** Set once show() ran, shown or not. Before that the viewer counts as up, since it's on its way. */
    private boolean settled;
    Dialog dialog;

    PictureViewer(Activity activity, String url, String username, ProfilePicture.Source source, Runnable onClosed) {
        this.activity = activity;
        this.url = url;
        this.username = username;
        this.source = source;
        this.onClosed = onClosed;
    }

    /**
     * Whether the viewer covers the screen, or is about to. A screen torn down under it, which takes
     * the window without dismissing the dialog, counts as gone.
     */
    boolean isUp() {
        if (closed || activity.isDestroyed()) return false;
        Dialog shown = dialog;
        return shown == null ? !settled : shown.isShowing();
    }

    /** Puts the viewer up and starts the fetch. Main thread only. Answers false when it couldn't. */
    boolean show() {
        settled = true;
        try {
            if (closed || activity.isFinishing() || activity.isDestroyed()) {
                closed = true;
                return false;
            }
            Dialog shown = new Dialog(activity, android.R.style.Theme_Black_NoTitleBar);
            Window window = shown.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
                window.setStatusBarColor(Color.BLACK);
                window.setNavigationBarColor(Color.BLACK);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) window.setNavigationBarContrastEnforced(false);
            }
            shown.setContentView(build(shown));
            shown.setOnDismissListener(gone -> close());
            shown.show();
            if (window != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && window.getInsetsController() != null) {
                // Light icons on the black bars, whatever Threads' own theme asked for.
                window.getInsetsController().setSystemBarsAppearance(0,
                    android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                        | android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
            }
            dialog = shown;
            return true;
        } catch (Throwable failure) {
            closed = true;
            Logger.printException(() -> "Profile picture: the viewer could not open", failure);
            return false;
        }
    }

    private void close() {
        if (closed) return;
        closed = true;
        onClosed.run();
    }

    private View build(Dialog shown) {
        Context context = activity;
        FrameLayout root = new FrameLayout(context);
        root.setBackgroundColor(Color.BLACK);

        ZoomImageView image = new ZoomImageView(context);
        if (username != null) image.setContentDescription("@" + username);
        root.addView(image, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT));

        ProgressBar spinner = new ProgressBar(context);
        spinner.setIndeterminate(true);
        spinner.setIndeterminateTintList(android.content.res.ColorStateList.valueOf(Color.WHITE));
        root.addView(spinner, new FrameLayout.LayoutParams(dp(48), dp(48), Gravity.CENTER));

        TextView error = new TextView(context);
        error.setText(L10n.t(context, "Couldn't load the picture. Try again in a moment."));
        error.setTextColor(Color.WHITE);
        error.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        error.setGravity(Gravity.CENTER);
        error.setPadding(dp(32), 0, dp(32), 0);
        error.setVisibility(View.GONE);
        root.addView(error, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

        LinearLayout bar = new LinearLayout(context);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
            new int[] {0x99000000, Color.TRANSPARENT}));
        bar.setPaddingRelative(dp(4), dp(4), dp(4), dp(12));

        bar.addView(button(context, SettingsIcons.CLOSE, L10n.t(context, "Close"), v -> shown.dismiss()));

        TextView title = new TextView(context);
        title.setText(username == null || username.isEmpty() ? "" : "@" + username);
        title.setTextColor(Color.WHITE);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setSingleLine(true);
        title.setEllipsize(TextUtils.TruncateAt.END);
        title.setPaddingRelative(dp(8), 0, dp(8), 0);
        bar.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        View save = button(context, SettingsIcons.DOWNLOADS, L10n.t(context, "Save"),
            v -> MediaSave.savePicture(activity, url));
        save.setVisibility(View.INVISIBLE);
        bar.addView(save);

        root.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP));

        // Threads targets a recent API, so the window is edge to edge: keep the bar off the
        // status bar and a cutout. The picture itself fills the screen.
        int barTop = bar.getPaddingTop();
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int top;
            int left;
            int right;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars()
                    | WindowInsets.Type.displayCutout());
                top = bars.top;
                left = bars.left;
                right = bars.right;
            } else {
                top = insets.getSystemWindowInsetTop();
                left = insets.getSystemWindowInsetLeft();
                right = insets.getSystemWindowInsetRight();
            }
            bar.setPadding(dp(4) + left, barTop + top, dp(4) + right, bar.getPaddingBottom());
            return insets;
        });

        image.onTap = () -> {
            boolean hide = bar.getAlpha() > 0.5f;
            bar.animate().alpha(hide ? 0f : 1f).setDuration(150)
                .withStartAction(() -> bar.setVisibility(View.VISIBLE))
                .withEndAction(() -> bar.setVisibility(hide ? View.INVISIBLE : View.VISIBLE))
                .start();
        };

        load(image, spinner, error, save);
        return root;
    }

    private ImageButton button(Context context, String icon, String label, View.OnClickListener click) {
        ImageButton button = new ImageButton(context);
        Drawable drawable = SettingsIcons.icon(context, icon, Color.WHITE);
        button.setImageDrawable(drawable);
        button.setBackground(null);
        button.setPadding(dp(12), dp(12), dp(12), dp(12));
        button.setMinimumWidth(dp(48));
        button.setMinimumHeight(dp(48));
        button.setContentDescription(label);
        button.setOnClickListener(click);
        return button;
    }

    /** Fetches and decodes the picture on a worker thread, then shows it, or the error, on the main thread. */
    private void load(ZoomImageView image, View spinner, TextView error, View save) {
        Context app = activity.getApplicationContext();
        Thread worker = new Thread(() -> {
            Bitmap bitmap = null;
            try {
                byte[] bytes = source.fetch(app, url, () -> closed);
                if (bytes != null) bitmap = decode(bytes);
            } catch (Throwable failure) {
                Logger.printException(() -> "Profile picture: could not load the picture", failure);
            }
            Bitmap picture = bitmap;
            Utils.runOnMainThread(() -> {
                if (closed) return;
                spinner.setVisibility(View.GONE);
                if (picture == null) {
                    error.setVisibility(View.VISIBLE);
                    return;
                }
                image.setImageBitmap(picture);
                if (SettingsStatus.saveMedia() && Settings.SAVE_MEDIA.get()) save.setVisibility(View.VISIBLE);
            });
        }, "hushthreads-picture");
        worker.setDaemon(true);
        worker.start();
    }

    /** [bytes] decoded, halved as often as it takes to bring the longer side to {@link #MAX_SIDE} or under. */
    static Bitmap decode(byte[] bytes) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleSize(bounds.outWidth, bounds.outHeight);
        return BitmapFactory.decodeByteArray(bytes, 0, bytes.length, options);
    }

    /** The power of two a picture [width] by [height] is divided by so its longer side fits {@link #MAX_SIDE}. */
    static int sampleSize(int width, int height) {
        int sample = 1;
        while (Math.max(width, height) / sample > MAX_SIDE) sample *= 2;
        return sample;
    }

    private int dp(int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    /**
     * The picture, fitted to the screen and zoomable from there up to {@link #MAX_ZOOM} times. A
     * zoomed picture always covers the screen edge to edge along any side it's longer than, and a
     * side it's shorter than stays centered.
     */
    static final class ZoomImageView extends ImageView {
        static final float MAX_ZOOM = 5f;
        static final float DOUBLE_TAP_ZOOM = 2.5f;

        /** Fits the picture to the view. */
        private final Matrix base = new Matrix();
        /** The user's zoom and pan, on top of [base], in screen terms. */
        final Matrix zoom = new Matrix();
        private final Matrix shown = new Matrix();
        private final RectF bounds = new RectF();
        private final float[] values = new float[9];
        private final ScaleGestureDetector scaler;
        private final GestureDetector gestures;
        Runnable onTap;

        ZoomImageView(Context context) {
            super(context);
            setScaleType(ScaleType.MATRIX);
            scaler = new ScaleGestureDetector(context, new ScaleGestureDetector.SimpleOnScaleGestureListener() {
                @Override
                public boolean onScale(ScaleGestureDetector detector) {
                    zoomBy(detector.getScaleFactor(), detector.getFocusX(), detector.getFocusY());
                    return true;
                }
            });
            gestures = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
                @Override
                public boolean onDown(MotionEvent event) {
                    return true;
                }

                @Override
                public boolean onScroll(MotionEvent first, MotionEvent event, float dx, float dy) {
                    if (zoomed() <= 1.01f) return false;
                    zoom.postTranslate(-dx, -dy);
                    settle();
                    return true;
                }

                @Override
                public boolean onDoubleTap(MotionEvent event) {
                    if (zoomed() > 1.01f) zoom.reset();
                    else zoom.setScale(DOUBLE_TAP_ZOOM, DOUBLE_TAP_ZOOM, event.getX(), event.getY());
                    settle();
                    return true;
                }

                @Override
                public boolean onSingleTapConfirmed(MotionEvent event) {
                    if (onTap != null) onTap.run();
                    return true;
                }
            });
        }

        /** How far the user has zoomed in, 1 for the fitted picture. */
        float zoomed() {
            zoom.getValues(values);
            return values[Matrix.MSCALE_X];
        }

        /** Zooms by [factor] around ([x], [y]), kept between the fitted picture and {@link #MAX_ZOOM}. */
        void zoomBy(float factor, float x, float y) {
            float now = zoomed();
            float target = Math.max(1f, Math.min(MAX_ZOOM, now * factor));
            zoom.postScale(target / now, target / now, x, y);
            settle();
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            scaler.onTouchEvent(event);
            if (!scaler.isInProgress()) gestures.onTouchEvent(event);
            return true;
        }

        @Override
        public void setImageBitmap(Bitmap bitmap) {
            super.setImageBitmap(bitmap);
            zoom.reset();
            fit();
        }

        @Override
        protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
            super.onSizeChanged(width, height, oldWidth, oldHeight);
            fit();
        }

        private void fit() {
            Drawable picture = getDrawable();
            if (picture == null || getWidth() == 0 || getHeight() == 0) return;
            int width = picture.getIntrinsicWidth();
            int height = picture.getIntrinsicHeight();
            if (width <= 0 || height <= 0) return;
            base.setRectToRect(new RectF(0, 0, width, height), new RectF(0, 0, getWidth(), getHeight()),
                Matrix.ScaleToFit.CENTER);
            settle();
        }

        /** Pulls the picture back over the view after a zoom or a drag, then draws it there. */
        void settle() {
            Drawable picture = getDrawable();
            if (picture == null) return;
            shown.set(base);
            shown.postConcat(zoom);
            bounds.set(0, 0, picture.getIntrinsicWidth(), picture.getIntrinsicHeight());
            shown.mapRect(bounds);
            float dx = pull(bounds.left, bounds.right, getWidth());
            float dy = pull(bounds.top, bounds.bottom, getHeight());
            zoom.postTranslate(dx, dy);
            shown.postTranslate(dx, dy);
            setImageMatrix(shown);
        }

        /**
         * How far to move a picture spanning [start] to [end] along a view [size] long: to the
         * middle when it's shorter than the view, else just enough to leave no gap at either edge.
         */
        static float pull(float start, float end, int size) {
            float length = end - start;
            if (length <= size) return (size - length) / 2f - start;
            if (start > 0) return -start;
            if (end < size) return size - end;
            return 0;
        }
    }
}
