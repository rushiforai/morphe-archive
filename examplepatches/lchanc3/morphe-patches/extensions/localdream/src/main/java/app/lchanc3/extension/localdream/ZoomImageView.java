package app.lchanc3.extension.localdream;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.animation.DecelerateInterpolator;

import java.io.File;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Shows one picture that can be pinched, dragged and double tapped, and swiped
 * sideways to the next one when it is not zoomed in.
 *
 * The picture is laid out at its full size, but drawn from a copy small enough
 * to put on screen. An upscaled result is far larger than that copy, so once it
 * is zoomed in past what the copy holds, the part on screen is decoded again
 * from the file at the detail the zoom needs, and drawn over it.
 */
final class ZoomImageView extends View {

    interface OnSwipeListener {
        /** +1 to go to the next picture, -1 to the previous one. */
        void onSwipe(int direction);
    }

    private static final ExecutorService DECODER = Executors.newSingleThreadExecutor(r -> {
        Thread thread = new Thread(r, "BatchUpscaleRegions");
        thread.setPriority(Thread.NORM_PRIORITY - 1);
        return thread;
    });

    private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.ANTI_ALIAS_FLAG);
    private final RectF contentRect = new RectF();
    private final ScaleGestureDetector scaleDetector;
    private final GestureDetector gestureDetector;
    private OnSwipeListener swipeListener;

    private int contentWidth;
    private int contentHeight;
    private Bitmap base;
    private Bitmap alternate;

    private volatile File regionFile;
    private BitmapRegionDecoder decoder;
    private Bitmap detail;
    private final RectF detailRect = new RectF();
    private int detailSample;
    private int generation;

    private float scale = 1f;
    private float translateX;
    private float translateY;
    private boolean fitted = true;
    private ValueAnimator animator;

    private final Runnable detailUpdate = this::updateDetail;

    ZoomImageView(Context context) {
        super(context);
        scaleDetector = new ScaleGestureDetector(context, new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            @Override
            public boolean onScale(ScaleGestureDetector detector) {
                zoomTo(scale * detector.getScaleFactor(), detector.getFocusX(), detector.getFocusY());
                return true;
            }
        });
        gestureDetector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
            @Override
            public boolean onDown(MotionEvent e) {
                if (animator != null) animator.cancel();
                return true;
            }

            @Override
            public boolean onScroll(MotionEvent e1, MotionEvent e2, float dx, float dy) {
                if (scaleDetector.isInProgress()) return false;
                translateX -= dx;
                translateY -= dy;
                clamp();
                changed();
                return true;
            }

            @Override
            public boolean onFling(MotionEvent e1, MotionEvent e2, float vx, float vy) {
                if (swipeListener == null || scale > fitScale() * 1.05f) return false;
                if (Math.abs(vx) > Math.abs(vy) * 1.5f && Math.abs(vx) > 800 * getResources().getDisplayMetrics().density) {
                    swipeListener.onSwipe(vx < 0 ? 1 : -1);
                    return true;
                }
                return false;
            }

            @Override
            public boolean onDoubleTap(MotionEvent e) {
                float fit = fitScale();
                if (scale > fit * 1.05f) {
                    animateTo(fit, e.getX(), e.getY());
                } else {
                    // Straight to one pixel of the picture per pixel of the
                    // screen, which is what a result is double tapped to check.
                    animateTo(Math.max(Math.min(1f, maxScale()), fit * 2.5f), e.getX(), e.getY());
                }
                return true;
            }
        });
    }

    void setOnSwipeListener(OnSwipeListener listener) {
        swipeListener = listener;
    }

    /**
     * Shows a picture [width] by [height] pixels, drawn from [base], and from
     * [regionFile] once zoomed in further than [base] reaches. Starts out
     * fitted to the view.
     */
    void setImage(int width, int height, Bitmap base, File regionFile) {
        boolean sameContent = width == contentWidth && height == contentHeight;
        this.contentWidth = width;
        this.contentHeight = height;
        this.base = base;
        this.alternate = null;
        if (base != null) base.setHasMipMap(true);
        if (regionFile == null || !regionFile.equals(this.regionFile)) {
            closeDecoder();
            this.regionFile = regionFile;
            detail = null;
        }
        if (!sameContent || fitted) {
            fit();
        }
        changed();
    }

    /** Draws [bitmap] over the whole picture instead, keeping the zoom, until set back to null. */
    void setAlternate(Bitmap bitmap) {
        if (bitmap != null) bitmap.setHasMipMap(true);
        alternate = bitmap;
        invalidate();
    }

    void clear() {
        contentWidth = 0;
        contentHeight = 0;
        base = null;
        alternate = null;
        closeDecoder();
        regionFile = null;
        detail = null;
        invalidate();
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        fit();
        changed();
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(detailUpdate);
        closeDecoder();
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (contentWidth == 0) return false;
        boolean handled = scaleDetector.onTouchEvent(event);
        handled |= gestureDetector.onTouchEvent(event);
        if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
            getParent().requestDisallowInterceptTouchEvent(true);
        }
        return handled || super.onTouchEvent(event);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (contentWidth == 0) return;
        Bitmap bitmap = alternate != null ? alternate : base;
        canvas.save();
        canvas.translate(translateX, translateY);
        canvas.scale(scale, scale);
        contentRect.set(0, 0, contentWidth, contentHeight);
        if (bitmap != null) {
            canvas.drawBitmap(bitmap, null, contentRect, paint);
        }
        if (alternate == null && detail != null) {
            canvas.drawBitmap(detail, null, detailRect, paint);
        }
        canvas.restore();
    }

    // ---------------------------------------------------------------- zoom

    private float fitScale() {
        if (contentWidth == 0 || getWidth() == 0) return 1f;
        return Math.min(getWidth() / (float) contentWidth, getHeight() / (float) contentHeight);
    }

    private float maxScale() {
        return Math.max(2f, fitScale() * 3f);
    }

    private void fit() {
        scale = fitScale();
        fitted = true;
        clamp();
    }

    private void zoomTo(float target, float focusX, float focusY) {
        float next = Math.max(fitScale(), Math.min(maxScale(), target));
        translateX = focusX - (focusX - translateX) * next / scale;
        translateY = focusY - (focusY - translateY) * next / scale;
        scale = next;
        fitted = next <= fitScale() * 1.001f;
        clamp();
        changed();
    }

    private void animateTo(float target, float focusX, float focusY) {
        if (animator != null) animator.cancel();
        float from = scale;
        animator = ValueAnimator.ofFloat(0f, 1f);
        animator.setDuration(250);
        animator.setInterpolator(new DecelerateInterpolator());
        animator.addUpdateListener(animation -> {
            float t = (float) animation.getAnimatedValue();
            zoomTo(from + (target - from) * t, focusX, focusY);
        });
        animator.start();
    }

    /** Keeps the picture on screen, centered along a side it does not fill. */
    private void clamp() {
        float width = contentWidth * scale;
        float height = contentHeight * scale;
        if (width <= getWidth()) {
            translateX = (getWidth() - width) / 2f;
        } else {
            translateX = Math.min(0f, Math.max(getWidth() - width, translateX));
        }
        if (height <= getHeight()) {
            translateY = (getHeight() - height) / 2f;
        } else {
            translateY = Math.min(0f, Math.max(getHeight() - height, translateY));
        }
    }

    private void changed() {
        invalidate();
        removeCallbacks(detailUpdate);
        postDelayed(detailUpdate, 120);
    }

    // ---------------------------------------------------------------- detail

    private void updateDetail() {
        File file = regionFile;
        Bitmap base = this.base;
        if (file == null || base == null || contentWidth == 0 || getWidth() == 0) return;

        // The copy holds base.getWidth() of the picture's pixels across; past
        // that, zooming only blurs it.
        float baseScale = base.getWidth() / (float) contentWidth;
        if (scale <= baseScale * 1.15f) {
            if (detail != null) {
                detail = null;
                invalidate();
            }
            return;
        }

        int sample = 1;
        while (sample * 2 <= 1f / scale) {
            sample *= 2;
        }

        float left = Math.max(0f, -translateX / scale);
        float top = Math.max(0f, -translateY / scale);
        float right = Math.min(contentWidth, (getWidth() - translateX) / scale);
        float bottom = Math.min(contentHeight, (getHeight() - translateY) / scale);
        if (right <= left || bottom <= top) return;
        if (detail != null && detailSample == sample && detailRect.contains(left, top, right, bottom)) return;

        // A margin around what is on screen, so a small drag needs no new decode.
        float marginX = (right - left) * 0.25f;
        float marginY = (bottom - top) * 0.25f;
        Rect region = new Rect(
            (int) Math.max(0, Math.floor(left - marginX)),
            (int) Math.max(0, Math.floor(top - marginY)),
            (int) Math.min(contentWidth, Math.ceil(right + marginX)),
            (int) Math.min(contentHeight, Math.ceil(bottom + marginY)));
        int requested = ++generation;
        int decodeSample = sample;

        DECODER.execute(() -> {
            if (requested != generation) return;
            try {
                BitmapRegionDecoder decoder = openDecoder(file);
                if (decoder == null) return;
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = decodeSample;
                Bitmap bitmap = decoder.decodeRegion(region, options);
                if (bitmap == null) return;
                post(() -> {
                    if (requested != generation || !file.equals(regionFile)) return;
                    detail = bitmap;
                    detailRect.set(region);
                    detailSample = decodeSample;
                    invalidate();
                });
            } catch (Throwable ex) {
                android.util.Log.w(BatchUpscalePatch.LOG_TAG, "Could not decode a region of " + file, ex);
            }
        });
    }

    /** Runs on [DECODER]. */
    @SuppressWarnings("deprecation")
    private BitmapRegionDecoder openDecoder(File file) throws java.io.IOException {
        synchronized (this) {
            if (!file.equals(regionFile)) return null;
            if (decoder == null) {
                decoder = BitmapRegionDecoder.newInstance(file.getAbsolutePath(), false);
            }
            return decoder;
        }
    }

    private void closeDecoder() {
        generation++;
        BitmapRegionDecoder old;
        synchronized (this) {
            old = decoder;
            decoder = null;
        }
        if (old != null) {
            DECODER.execute(old::recycle);
        }
    }
}
