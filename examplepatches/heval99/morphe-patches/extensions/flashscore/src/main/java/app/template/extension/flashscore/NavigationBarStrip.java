package app.template.extension.flashscore;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.view.View;

/**
 * The Android 15+ half of "Force edge-to-edge". Flashscore's main screen pads its content view by
 * the navigation bar height and draws nothing in that padding, so the gesture pill sits on the
 * page background, a strip darker than the bottom tab bar right above it. {@link #install} gives
 * the content view a background that paints only that bottom padding, in the colour of the tab
 * bar's last row (read from the rendered bar whenever it is laid out again, so light and dark
 * themes both match). Without a visible tab bar the strip is left as it was.
 */
@SuppressWarnings("unused")
public final class NavigationBarStrip {

    /** Patched in right after EventListActivity.onCreate looks up android.R.id.content. */
    public static void install(View content) {
        try {
            if (content == null) return;
            synchronized (INSTALLED) {
                if (INSTALLED.put(content, Boolean.TRUE) != null) return;
            }
            final int id = content.getResources().getIdentifier("bottom_nav_view", "id", content.getContext().getPackageName());
            if (id == 0) return;
            final StripDrawable strip = new StripDrawable(content.getBackground());
            content.setBackground(strip);
            content.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
                @Override
                public void onLayoutChange(final View v, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                    v.post(new Runnable() {
                        @Override
                        public void run() {
                            sample(v, id, strip);
                        }
                    });
                }
            });
        } catch (Throwable ignored) {
            // Stock look on any error.
        }
    }

    /** The content views that already have the strip. */
    private static final java.util.Map<View, Boolean> INSTALLED = new java.util.WeakHashMap<>();

    private static void sample(View content, int barId, StripDrawable strip) {
        try {
            View bar = content.findViewById(barId);
            if (bar == null || bar.getVisibility() != View.VISIBLE || bar.getWidth() == 0 || bar.getHeight() < 2
                || content.getPaddingBottom() <= 0) {
                strip.setColor(Color.TRANSPARENT);
                return;
            }
            Bitmap pixel = Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(pixel);
            canvas.translate(-bar.getWidth() / 2f, -(bar.getHeight() - 2));
            bar.draw(canvas);
            int color = pixel.getPixel(0, 0);
            pixel.recycle();
            strip.setColor(Color.alpha(color) == 255 ? color : Color.TRANSPARENT);
        } catch (Throwable ignored) {
            strip.setColor(Color.TRANSPARENT);
        }
    }

    /** The content view's own background, with the bottom padding painted in the tab bar colour. */
    private static final class StripDrawable extends Drawable {
        private final Drawable original;
        private final Paint paint = new Paint();
        private int color = Color.TRANSPARENT;

        StripDrawable(Drawable original) {
            this.original = original;
        }

        void setColor(int value) {
            if (value == color) return;
            color = value;
            paint.setColor(value);
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            if (original != null) {
                original.setBounds(getBounds());
                original.draw(canvas);
            }
            if (Color.alpha(color) == 0) return;
            Callback callback = getCallback();
            if (!(callback instanceof View)) return;
            View view = (View) callback;
            int padding = view.getPaddingBottom();
            if (padding <= 0) return;
            canvas.drawRect(0, view.getHeight() - padding, view.getWidth(), view.getHeight(), paint);
        }

        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private NavigationBarStrip() { }
}
