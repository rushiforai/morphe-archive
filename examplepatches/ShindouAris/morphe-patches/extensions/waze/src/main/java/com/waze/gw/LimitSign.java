package com.waze.gw;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * The square (US style) speed-limit sign. Waze shows it when its "Speedometer sign style" setting
 * (CONFIG_VALUE_MAP_SPEEDOMETER_STYLE) is "us"; the Mod follows that, unless the user forces round or square in
 * Settings ("limit_sign_style": 0 = follow Waze, 1 = round, 2 = square).
 */
final class LimitSign {
    static final String PREF = "limit_sign_style";
    static final int FOLLOW_WAZE = 0;
    static final int ROUND = 1;
    static final int SQUARE = 2;

    private static final long CHECK_MS = 5000L;
    private static volatile boolean square;
    private static volatile long checkedAt;

    private LimitSign() { }

    /** True when the limit sign should be drawn square. Cached for a few seconds. */
    static boolean square() {
        long now = SystemClock.elapsedRealtime();
        if (checkedAt != 0L && now - checkedAt < CHECK_MS) return square;
        checkedAt = now;
        int mode = Gateway.prefInt(PREF, FOLLOW_WAZE);
        boolean value = mode == SQUARE
                || (mode == FOLLOW_WAZE && "us".equalsIgnoreCase(Gateway.cfgString("CONFIG_VALUE_MAP_SPEEDOMETER_STYLE").trim()));
        square = value;
        return value;
    }

    // ---- TextView signs (floating speedometer, HUD): swap the round background for the square one --------------

    private static final class Saved {
        final Drawable background;
        final int left, top, right, bottom;

        Saved(TextView view) {
            background = view.getBackground();
            left = view.getPaddingLeft();
            top = view.getPaddingTop();
            right = view.getPaddingRight();
            bottom = view.getPaddingBottom();
        }
    }

    private static final java.util.WeakHashMap<View, Saved> SAVED = new java.util.WeakHashMap<View, Saved>();

    /** Makes {@code limit} (a TextView whose background is the round sign) match the current sign style. */
    static void apply(TextView limit) {
        if (limit == null) return;
        boolean wantSquare = square();
        boolean isSquare = limit.getBackground() instanceof SquareDrawable;
        if (wantSquare == isSquare) return;
        if (wantSquare) {
            ViewGroup.LayoutParams lp = limit.getLayoutParams();
            int height = lp != null && lp.height > 0 ? lp.height : limit.getHeight();
            if (height <= 0) return;   // not laid out yet: try again on the next tick
            SAVED.put(limit, new Saved(limit));
            limit.setBackground(new SquareDrawable());
            limit.setPadding(limit.getPaddingLeft(), Math.round(height * NUMBER_TOP), limit.getPaddingRight(), 0);
        } else {
            Saved saved = SAVED.remove(limit);
            if (saved == null) return;
            limit.setBackground(saved.background);
            limit.setPadding(saved.left, saved.top, saved.right, saved.bottom);
        }
    }

    // ---- bitmap / canvas signs (bubble, floating map, Android Auto) -------------------------------------------------

    private static final java.util.HashMap<Integer, Bitmap> BITMAPS = new java.util.HashMap<Integer, Bitmap>();

    /** A square sign showing {@code limit}, cached. */
    static Bitmap bitmap(int limit) {
        Integer key = Integer.valueOf(limit);
        synchronized (BITMAPS) {
            Bitmap cached = BITMAPS.get(key);
            if (cached != null) return cached;
            int size = 256;
            Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            drawFace(canvas, 0f, 0f, size);
            drawNumber(canvas, String.valueOf(limit), size / 2f, size * NUMBER_CENTER, size);
            BITMAPS.put(key, bitmap);
            return bitmap;
        }
    }

    private static final java.util.HashMap<Integer, Bitmap> ROUND_BITMAPS = new java.util.HashMap<Integer, Bitmap>();

    /** A round (red ring) sign showing {@code limit}, cached; unlike the bundled artwork it exists for any value. */
    static Bitmap roundBitmap(int limit) {
        Integer key = Integer.valueOf(limit);
        synchronized (ROUND_BITMAPS) {
            Bitmap cached = ROUND_BITMAPS.get(key);
            if (cached != null) return cached;
            int size = 256;
            Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            paint.setColor(0xFFE6261F);
            canvas.drawCircle(size / 2f, size / 2f, size / 2f, paint);
            paint.setColor(0xFFFFFFFF);
            canvas.drawCircle(size / 2f, size / 2f, size / 2f * 0.79f, paint);
            drawNumber(canvas, String.valueOf(limit), size / 2f, size / 2f, size);
            ROUND_BITMAPS.put(key, bitmap);
            return bitmap;
        }
    }

    /** The sign for a picker tile in the style Waze uses here (square or round), for any limit value. */
    static Bitmap anyBitmap(int limit) {
        return square() ? bitmap(limit) : roundBitmap(limit);
    }

    /** Draws the sign face (white rounded square, black border) into a {@code size} square. */
    static void drawFace(Canvas canvas, float left, float top, float size) {
        new SquareDrawable().drawAt(canvas, left, top, size);
    }

    /** Vertical centre of the number, as a fraction of the sign height. */
    static final float NUMBER_CENTER = 0.5f;
    /** Top padding that centres a TextView number on {@link #NUMBER_CENTER}. */
    private static final float NUMBER_TOP = 0f;

    static void drawNumber(Canvas canvas, String number, float cx, float cy, float size) {
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(0xFF000000);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setTextAlign(Paint.Align.CENTER);
        paint.setTextSize(size * (number.length() >= 3 ? 0.46f : 0.58f));
        Paint.FontMetrics metrics = paint.getFontMetrics();
        canvas.drawText(number, cx, cy - (metrics.ascent + metrics.descent) / 2f, paint);
    }

    /** White rounded square with a black border. The number is drawn by the host. */
    static final class SquareDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        @Override public void draw(Canvas canvas) {
            android.graphics.Rect bounds = getBounds();
            drawAt(canvas, bounds.left, bounds.top, Math.min(bounds.width(), bounds.height()));
        }

        void drawAt(Canvas canvas, float left, float top, float size) {
            // Like Waze's own sign: a white plate, a dark ring set in from its edge, white face inside.
            float margin = size * 0.035f;
            float stroke = Math.max(2f, size * 0.07f);
            float radius = size * 0.18f;
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(0xFFFFFFFF);
            canvas.drawRoundRect(new RectF(left, top, left + size, top + size), radius, radius, paint);
            float inset = margin + stroke / 2f;
            RectF ring = new RectF(left + inset, top + inset, left + size - inset, top + size - inset);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
            paint.setColor(0xFF2B2B2B);
            canvas.drawRoundRect(ring, radius - inset, radius - inset, paint);
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
