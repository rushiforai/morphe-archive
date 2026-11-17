/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;

import androidx.annotation.Nullable;

import java.io.File;
import java.util.concurrent.atomic.AtomicBoolean;

import app.hushpinterest.extension.pinterest.actions.CopyImage.Result;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/**
 * Long-press View (#37): a pin's full-size picture full screen over Pinterest, without opening the
 * pin. The screen opens at the tap with a spinner. The picture is fetched the way Copy image fetches
 * it, into its own cache folder, decoded no larger than {@link #MAX_SIDE} on a side, and its file is
 * deleted as soon as it's decoded, so nothing of it stays on the disk. Pinch or double-tap to zoom.
 * Back or the X closes it, and a picture that lands after that is dropped quietly.
 */
final class PinViewer {
    private PinViewer() {}

    /** The longest side a decoded picture may have. Android won't draw a much larger bitmap. */
    static final int MAX_SIDE = 4096;

    /** One picture at a time: a second tap while the first fetches is told so. */
    private static final AtomicBoolean RUNNING = new AtomicBoolean();

    /** True when [media] is a picture View can show. Videos aren't. */
    static boolean offered(@Nullable PinMedia.Resolution media) {
        return media != null && media.source != null && media.source.mime != null
                && !media.source.mime.startsWith("video/");
    }

    /**
     * Opens the screen for the picture [pin] carries, read again now, and starts fetching it. True
     * when the screen opened. A fetch that fails closes the screen and says why in a toast.
     */
    static boolean open(@Nullable Object pin, @Nullable Context context) {
        try {
            PinMedia.Resolution media = PinMedia.resolve(pin);
            if (!offered(media)) return false;
            Activity activity = activity(context);
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return false;
            if (!RUNNING.compareAndSet(false, true)) {
                report(Result.BUSY);
                return false;
            }
            Screen screen;
            try {
                screen = new Screen(activity);
                screen.show();
            } catch (Throwable failure) {
                RUNNING.set(false);
                throw failure;
            }
            Context app = activity.getApplicationContext();
            boolean queued = Utils.runOnBackgroundThread(() -> {
                Loaded made = load(app, media);
                Utils.runOnMainThread(() -> {
                    RUNNING.set(false);
                    try {
                        screen.landed(made.bitmap, made.result);
                    } catch (Throwable failure) {
                        HookStatus.threw(FamilyNames.LONG_PRESS_DOWNLOAD, "show viewed picture", failure);
                    }
                });
            });
            if (!queued) {
                RUNNING.set(false);
                screen.dismiss();
                report(Result.FAILED);
            }
            return queued;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LONG_PRESS_DOWNLOAD, "open viewed picture", failure);
            report(Result.FAILED);
            return false;
        }
    }

    /** The decoded picture, or null with why not. */
    private static final class Loaded {
        @Nullable final Bitmap bitmap;
        final Result result;

        Loaded(@Nullable Bitmap bitmap, Result result) {
            this.bitmap = bitmap;
            this.result = result;
        }
    }

    /** Fetches and decodes the picture. Worker threads only. The fetched file never outlives this. */
    private static Loaded load(Context app, PinMedia.Resolution media) {
        CopyImage.Fetch fetched;
        try {
            fetched = CopyImage.fetch(media, CopiedImages.viewDir(app));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LONG_PRESS_DOWNLOAD, "fetch viewed picture", failure);
            return new Loaded(null, Result.FAILED);
        }
        File file = fetched.file;
        if (file == null) return new Loaded(null, fetched.result == Result.COPIED ? Result.FAILED : fetched.result);
        try {
            Bitmap bitmap = decode(file);
            return new Loaded(bitmap, bitmap == null ? Result.NOT_IMAGE : Result.COPIED);
        } catch (OutOfMemoryError tooBig) {
            return new Loaded(null, Result.TOO_LARGE);
        } catch (RuntimeException failure) {
            HookStatus.threw(FamilyNames.LONG_PRESS_DOWNLOAD, "decode viewed picture", failure);
            return new Loaded(null, Result.NOT_IMAGE);
        } finally {
            if (file.exists() && !file.delete()) file.deleteOnExit();
        }
    }

    /** The picture in [file], sampled down by {@link #sampleSize}, or null when it isn't one. */
    @Nullable
    static Bitmap decode(File file) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getPath(), bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleSize(bounds.outWidth, bounds.outHeight);
        return BitmapFactory.decodeFile(file.getPath(), options);
    }

    /** The smallest power of two that brings both sides to {@link #MAX_SIDE} or less. */
    static int sampleSize(int width, int height) {
        int sample = 1;
        while (sample < (1 << 30) && (sides(width, sample) > MAX_SIDE || sides(height, sample) > MAX_SIDE)) {
            sample *= 2;
        }
        return sample;
    }

    private static long sides(int side, int sample) {
        return ((long) side + sample - 1) / sample;
    }

    /** The activity [context] belongs to, or the one in front. */
    @Nullable
    private static Activity activity(@Nullable Context context) {
        Context at = context;
        for (int depth = 0; depth < 16 && at != null; depth++) {
            if (at instanceof Activity) return (Activity) at;
            at = at instanceof ContextWrapper ? ((ContextWrapper) at).getBaseContext() : null;
        }
        return Utils.getActivity();
    }

    private static void report(Result result) {
        switch (result) {
            case TOO_LARGE:
                HookStatus.counted(FamilyNames.LONG_PRESS_DOWNLOAD, "view picture too large");
                Utils.showToastLong(L10n.t("That image is too big to open."));
                break;
            case NOT_IMAGE:
                HookStatus.counted(FamilyNames.LONG_PRESS_DOWNLOAD, "view picture not an image");
                Utils.showToastLong(L10n.t("Pinterest didn't send a usable image."));
                break;
            case TIMED_OUT:
                HookStatus.counted(FamilyNames.LONG_PRESS_DOWNLOAD, "view picture timed out");
                Utils.showToastLong(L10n.t("Getting the image took too long. Try again."));
                break;
            case BUSY:
                Utils.showToastShort(L10n.t("Still getting the last image ready."));
                break;
            case FAILED:
                HookStatus.counted(FamilyNames.LONG_PRESS_DOWNLOAD, "view picture failed");
                Utils.showToastLong(L10n.t("Couldn't open the image. Check your connection and try again."));
                break;
            default:
                break;
        }
    }

    /** The full-screen window: the picture, a spinner until it lands, and an X to close. */
    static final class Screen extends Dialog {
        final ZoomView picture;
        final ProgressBar spinner;
        final View close;

        Screen(Activity activity) {
            super(activity, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
            float density = activity.getResources().getDisplayMetrics().density;
            FrameLayout root = new FrameLayout(activity);
            root.setBackgroundColor(Color.BLACK);
            root.setLayoutDirection(L10n.layoutDirection());

            picture = new ZoomView(activity);
            picture.setContentDescription(L10n.t("Pin image"));
            root.addView(picture, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            spinner = new ProgressBar(activity);
            spinner.setIndeterminate(true);
            root.addView(spinner, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));

            close = new CloseMark(activity, density);
            close.setContentDescription(L10n.t("Close"));
            close.setOnClickListener(clicked -> dismiss());
            int side = Math.round(48 * density);
            int margin = Math.round(8 * density);
            FrameLayout.LayoutParams corner = new FrameLayout.LayoutParams(side, side, Gravity.TOP | Gravity.END);
            corner.setMargins(margin, margin, margin, margin);
            root.addView(close, corner);

            // Pinterest's windows are edge to edge, and a cutout can sit where the X goes.
            root.setOnApplyWindowInsetsListener((view, insets) -> {
                int left, top, right;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    android.graphics.Insets bars = insets.getInsets(
                            WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                    left = bars.left;
                    top = bars.top;
                    right = bars.right;
                } else {
                    left = insets.getSystemWindowInsetLeft();
                    top = insets.getSystemWindowInsetTop();
                    right = insets.getSystemWindowInsetRight();
                }
                FrameLayout.LayoutParams at = (FrameLayout.LayoutParams) close.getLayoutParams();
                at.setMargins(margin + left, margin + top, margin + right, margin);
                close.setLayoutParams(at);
                return insets;
            });

            setContentView(root);
            setCancelable(true);
            Window window = getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
                window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            }
        }

        /** The fetch is done. A closed screen drops it; a missing picture closes the screen and says why. */
        void landed(@Nullable Bitmap bitmap, Result result) {
            if (!isShowing()) return;
            if (bitmap == null) {
                dismiss();
                report(result);
                return;
            }
            spinner.setVisibility(View.GONE);
            picture.setPicture(bitmap);
        }
    }

    /** A drawn X on a dark disc, so it shows over a white picture too. */
    private static final class CloseMark extends View {
        private final Paint disc = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint cross = new Paint(Paint.ANTI_ALIAS_FLAG);

        CloseMark(Context context, float density) {
            super(context);
            disc.setColor(0x99000000);
            cross.setColor(Color.WHITE);
            cross.setStrokeWidth(2.5f * density);
            cross.setStrokeCap(Paint.Cap.ROUND);
            setClickable(true);
            setFocusable(true);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight();
            canvas.drawCircle(w / 2, h / 2, Math.min(w, h) / 2, disc);
            float inset = Math.min(w, h) * 0.32f;
            canvas.drawLine(inset, inset, w - inset, h - inset, cross);
            canvas.drawLine(w - inset, inset, inset, h - inset, cross);
        }
    }

    /**
     * The picture, fitted and centered. Pinching zooms up to {@link #MOST} times that, a drag pans
     * without pulling an edge into the screen, and a double tap zooms in or fits it again.
     */
    static final class ZoomView extends ImageView {
        static final float MOST = 6f;
        static final float DOUBLE_TAP = 2.5f;

        private final Matrix matrix = new Matrix();
        private final float[] values = new float[9];
        private final ScaleGestureDetector pinch;
        private final GestureDetector gestures;
        @Nullable private Bitmap bitmap;
        private float fit = 1f;

        ZoomView(Context context) {
            super(context);
            setScaleType(ScaleType.MATRIX);
            pinch = new ScaleGestureDetector(context, new ScaleGestureDetector.SimpleOnScaleGestureListener() {
                @Override
                public boolean onScale(ScaleGestureDetector detector) {
                    zoomBy(detector.getScaleFactor(), detector.getFocusX(), detector.getFocusY());
                    return true;
                }
            });
            gestures = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
                @Override
                public boolean onDown(MotionEvent e) {
                    return true;
                }

                @Override
                public boolean onScroll(@Nullable MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
                    if (pinch.isInProgress()) return false;
                    panBy(-distanceX, -distanceY);
                    return true;
                }

                @Override
                public boolean onDoubleTap(MotionEvent e) {
                    toggle(e.getX(), e.getY());
                    return true;
                }
            });
        }

        void setPicture(Bitmap picture) {
            bitmap = picture;
            setImageBitmap(picture);
            fitPicture();
        }

        @Nullable
        Bitmap bitmap() {
            return bitmap;
        }

        /** Where the picture sits on the screen now. */
        RectF shown() {
            Bitmap at = bitmap;
            if (at == null) return new RectF();
            RectF rect = new RectF(0, 0, at.getWidth(), at.getHeight());
            matrix.mapRect(rect);
            return rect;
        }

        @Override
        protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            fitPicture();
        }

        private void fitPicture() {
            Bitmap at = bitmap;
            int w = getWidth(), h = getHeight();
            if (at == null || w <= 0 || h <= 0 || at.getWidth() <= 0 || at.getHeight() <= 0) return;
            float scale = Math.min((float) w / at.getWidth(), (float) h / at.getHeight());
            matrix.reset();
            matrix.postScale(scale, scale);
            matrix.postTranslate((w - at.getWidth() * scale) / 2f, (h - at.getHeight() * scale) / 2f);
            fit = scale;
            setImageMatrix(matrix);
        }

        private float scale() {
            matrix.getValues(values);
            return values[Matrix.MSCALE_X];
        }

        /** Zooms by [factor] about the point (x, y), kept between fitted and {@link #MOST} times that. */
        void zoomBy(float factor, float x, float y) {
            if (bitmap == null || getWidth() <= 0 || getHeight() <= 0) return;
            float now = scale();
            if (now <= 0) return;
            float target = Math.max(fit, Math.min(fit * MOST, now * factor));
            float by = target / now;
            if (by != 1f) matrix.postScale(by, by, x, y);
            keepInside();
        }

        /** A double tap: fits a zoomed picture again, or zooms a fitted one in about (x, y). */
        void toggle(float x, float y) {
            if (bitmap == null) return;
            if (scale() > fit * 1.01f) fitPicture();
            else zoomBy(DOUBLE_TAP, x, y);
        }

        void panBy(float dx, float dy) {
            if (bitmap == null || getWidth() <= 0 || getHeight() <= 0) return;
            matrix.postTranslate(dx, dy);
            keepInside();
        }

        /** Centers a side smaller than the screen, and closes any gap at the edges of a larger one. */
        private void keepInside() {
            RectF at = shown();
            float w = getWidth(), h = getHeight();
            float dx = 0, dy = 0;
            if (at.width() <= w) dx = (w - at.width()) / 2f - at.left;
            else if (at.left > 0) dx = -at.left;
            else if (at.right < w) dx = w - at.right;
            if (at.height() <= h) dy = (h - at.height()) / 2f - at.top;
            else if (at.top > 0) dy = -at.top;
            else if (at.bottom < h) dy = h - at.bottom;
            if (dx != 0 || dy != 0) matrix.postTranslate(dx, dy);
            setImageMatrix(matrix);
        }

        @SuppressLint("ClickableViewAccessibility")
        @Override
        public boolean onTouchEvent(MotionEvent event) {
            if (bitmap == null) return super.onTouchEvent(event);
            pinch.onTouchEvent(event);
            gestures.onTouchEvent(event);
            return true;
        }
    }
}
