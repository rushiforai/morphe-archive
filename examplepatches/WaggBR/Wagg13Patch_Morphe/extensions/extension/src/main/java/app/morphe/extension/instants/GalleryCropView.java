package app.morphe.extension.instants;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;

/**
 * Square crop selector. Pinch to zoom the photo; drag outside the square to move the photo under
 * it; drag inside the square to move the square; drag its lower-right corner to resize it. The
 * source bitmap is never modified.
 */
final class GalleryCropView extends View {
    private static final float MAX_ZOOM = 6f;

    private final Bitmap bitmap;
    private final Paint imagePaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint shadePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint cornerPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint gridPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint handlePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    // The image fitted to the view at zoom 1, and where it is drawn now (zoom and pan applied).
    private final RectF imageRect = new RectF();
    private final RectF drawRect = new RectF();
    // Visible part of the drawn image: the square can only be placed inside it.
    private final RectF cropBounds = new RectF();
    private final RectF crop = new RectF();
    private final ScaleGestureDetector scaleDetector;

    private float zoom = 1f;
    private float downX, downY;
    private boolean resizing;
    private boolean panning;
    private float minimum = 96f;

    GalleryCropView(Context context, Bitmap bitmap) {
        super(context);
        this.bitmap = bitmap;
        shadePaint.setColor(0x99000000);
        borderPaint.setColor(0xFFFFFFFF);
        borderPaint.setStyle(Paint.Style.STROKE);
        borderPaint.setStrokeWidth(2.5f * density());
        cornerPaint.setColor(0xFFFFFFFF);
        cornerPaint.setStyle(Paint.Style.STROKE);
        cornerPaint.setStrokeCap(Paint.Cap.ROUND);
        cornerPaint.setStrokeWidth(4f * density());
        gridPaint.setColor(0x59FFFFFF);
        gridPaint.setStyle(Paint.Style.STROKE);
        gridPaint.setStrokeWidth(1f * density());
        handlePaint.setColor(0xFFFFFFFF);
        scaleDetector = new ScaleGestureDetector(context,
                new ScaleGestureDetector.SimpleOnScaleGestureListener() {
                    @Override public boolean onScale(ScaleGestureDetector detector) {
                        zoomBy(detector.getScaleFactor(), detector.getFocusX(), detector.getFocusY());
                        return true;
                    }
                });
        scaleDetector.setQuickScaleEnabled(false);
    }

    @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        float scale = Math.min((float) w / bitmap.getWidth(), (float) h / bitmap.getHeight());
        float iw = bitmap.getWidth() * scale, ih = bitmap.getHeight() * scale;
        imageRect.set((w-iw)/2f, (h-ih)/2f, (w+iw)/2f, (h+ih)/2f);
        drawRect.set(imageRect);
        zoom = 1f;
        float side = Math.min(iw, ih) * 0.82f;
        crop.set(drawRect.centerX()-side/2f, drawRect.centerY()-side/2f,
                drawRect.centerX()+side/2f, drawRect.centerY()+side/2f);
        minimum = 72f * density();
        updateCropBounds();
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawBitmap(bitmap, null, drawRect, imagePaint);
        int w = getWidth(), h = getHeight();
        // Dim what stays outside the square. Drawing the shade around it keeps the image visible
        // inside: clearing the square would erase the image drawn underneath as well.
        canvas.drawRect(0, 0, w, crop.top, shadePaint);
        canvas.drawRect(0, crop.bottom, w, h, shadePaint);
        canvas.drawRect(0, crop.top, crop.left, crop.bottom, shadePaint);
        canvas.drawRect(crop.right, crop.top, w, crop.bottom, shadePaint);
        canvas.drawRect(crop, borderPaint);
        drawGrid(canvas);
        drawCorners(canvas);
        canvas.drawCircle(crop.right, crop.bottom, 6f * density(), handlePaint);
    }

    // Rule-of-thirds guides, so the framing can be judged before the photo is sent.
    private void drawGrid(Canvas canvas) {
        float thirdX = crop.width() / 3f, thirdY = crop.height() / 3f;
        for (int i = 1; i < 3; i++) {
            float x = crop.left + thirdX * i, y = crop.top + thirdY * i;
            canvas.drawLine(x, crop.top, x, crop.bottom, gridPaint);
            canvas.drawLine(crop.left, y, crop.right, y, gridPaint);
        }
    }

    // Brackets on the square's corners: the usual crop affordance, and the lower-right one is the
    // drag handle used to resize.
    private void drawCorners(Canvas canvas) {
        float length = 20f * density();
        drawCorner(canvas, crop.left, crop.top, length, length);
        drawCorner(canvas, crop.right, crop.top, -length, length);
        drawCorner(canvas, crop.left, crop.bottom, length, -length);
        drawCorner(canvas, crop.right, crop.bottom, -length, -length);
    }

    private void drawCorner(Canvas canvas, float x, float y, float dx, float dy) {
        canvas.drawLine(x, y, x + dx, y, cornerPaint);
        canvas.drawLine(x, y, x, y + dy, cornerPaint);
    }

    @Override public boolean onTouchEvent(MotionEvent event) {
        float x = event.getX(), y = event.getY();
        scaleDetector.onTouchEvent(event);
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = x; downY = y;
                beginDrag(x, y);
                return true;
            case MotionEvent.ACTION_POINTER_DOWN:
                resizing = false;
                panning = false;
                return true;
            case MotionEvent.ACTION_POINTER_UP:
                // Keep dragging with the pointer that remains, from where it is now.
                int remaining = event.getActionIndex() == 0 ? 1 : 0;
                downX = event.getX(remaining);
                downY = event.getY(remaining);
                beginDrag(downX, downY);
                return true;
            case MotionEvent.ACTION_MOVE:
                if (event.getPointerCount() > 1 || scaleDetector.isInProgress()) {
                    downX = x; downY = y;
                    return true;
                }
                float dx = x - downX, dy = y - downY;
                if (resizing) resizeBy(Math.max(dx, dy));
                else if (panning) panBy(dx, dy);
                else moveCropBy(dx, dy);
                downX = x; downY = y;
                invalidate();
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                resizing = false;
                panning = false;
                performClick();
                return true;
        }
        return true;
    }

    @Override public boolean performClick() { super.performClick(); return true; }

    private void beginDrag(float x, float y) {
        float handle = 28f * density();
        resizing = Math.abs(x-crop.right) < handle && Math.abs(y-crop.bottom) < handle;
        panning = !resizing && !crop.contains(x, y);
    }

    private void moveCropBy(float dx, float dy) {
        float nx = clamp(crop.left + dx, cropBounds.left, cropBounds.right - crop.width());
        float ny = clamp(crop.top + dy, cropBounds.top, cropBounds.bottom - crop.height());
        crop.offsetTo(nx, ny);
    }

    private void resizeBy(float delta) {
        float limit = Math.min(cropBounds.right - crop.left, cropBounds.bottom - crop.top);
        float side = clamp(crop.width() + delta, Math.min(minimum, limit), limit);
        crop.right = crop.left + side;
        crop.bottom = crop.top + side;
    }

    private void panBy(float dx, float dy) {
        drawRect.offset(dx, dy);
        clampImage();
        updateCropBounds();
    }

    private void zoomBy(float factor, float focusX, float focusY) {
        if (factor <= 0f) return;
        // Zooming out must stop while the image still covers the square; otherwise the crop would
        // include empty space. The square may have been resized while zoomed in.
        float minZoom = Math.max(crop.width() / imageRect.width(), crop.height() / imageRect.height());
        float next = clamp(zoom * factor, Math.max(1f, minZoom), MAX_ZOOM);
        float k = next / zoom;
        if (Math.abs(k - 1f) < 0.001f) return;
        if (next == 1f) {
            drawRect.set(imageRect);
        } else {
            drawRect.set(focusX + (drawRect.left-focusX)*k, focusY + (drawRect.top-focusY)*k,
                    focusX + (drawRect.right-focusX)*k, focusY + (drawRect.bottom-focusY)*k);
        }
        zoom = next;
        clampImage();
        updateCropBounds();
        invalidate();
    }

    // The image must keep covering the square, otherwise the crop would include empty space.
    private void clampImage() {
        if (drawRect.width() >= crop.width()) {
            if (drawRect.left > crop.left) drawRect.offset(crop.left - drawRect.left, 0);
            else if (drawRect.right < crop.right) drawRect.offset(crop.right - drawRect.right, 0);
        }
        if (drawRect.height() >= crop.height()) {
            if (drawRect.top > crop.top) drawRect.offset(0, crop.top - drawRect.top);
            else if (drawRect.bottom < crop.bottom) drawRect.offset(0, crop.bottom - drawRect.bottom);
        }
    }

    private void updateCropBounds() {
        cropBounds.set(Math.max(drawRect.left, 0), Math.max(drawRect.top, 0),
                Math.min(drawRect.right, getWidth()), Math.min(drawRect.bottom, getHeight()));
    }

    Bitmap createCroppedBitmap(int maxSide) {
        float scaleX = (float) bitmap.getWidth() / drawRect.width();
        float scaleY = (float) bitmap.getHeight() / drawRect.height();
        int left = clampInt(Math.round((crop.left-drawRect.left)*scaleX), 0, bitmap.getWidth()-1);
        int top = clampInt(Math.round((crop.top-drawRect.top)*scaleY), 0, bitmap.getHeight()-1);
        int side = Math.min(Math.min(bitmap.getWidth()-left, bitmap.getHeight()-top),
                Math.round(crop.width()*scaleX));
        if (side <= 0) return null;
        Bitmap square = Bitmap.createBitmap(bitmap, left, top, side, side);
        if (side <= maxSide) return square;
        Bitmap scaled = Bitmap.createScaledBitmap(square, maxSide, maxSide, true);
        if (scaled != square) square.recycle();
        return scaled;
    }

    private float density() {
        return getResources().getDisplayMetrics().density;
    }

    private static float clamp(float value, float low, float high) {
        return value < low ? low : (value > high ? high : value);
    }

    private static int clampInt(int value, int low, int high) {
        return value < low ? low : (value > high ? high : value);
    }
}
