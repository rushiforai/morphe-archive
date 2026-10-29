package app.fakhradio.extension;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.ImageView;

/**
 * A round badge with the station logo, drawn over the artwork card. It shows only while a track cover is on screen;
 * without one the logo is the card itself. It draws the logo of the station image view, so it follows the logo the
 * app loads into it.
 */
public class StationBadgeView extends View {
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path circle = new Path();
    private ImageView artwork;
    private ImageView station;
    private final ViewTreeObserver.OnPreDrawListener redraw = () -> {
        invalidate();
        return true;
    };

    public StationBadgeView(Context context, AttributeSet attrs) {
        super(context, attrs);
        paint.setColor(Color.WHITE);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        artwork = Views.image(this, "iv_sp_artwork");
        station = Views.image(this, "iv_sp_station");
        getViewTreeObserver().addOnPreDrawListener(redraw);
    }

    @Override
    protected void onDetachedFromWindow() {
        getViewTreeObserver().removeOnPreDrawListener(redraw);
        super.onDetachedFromWindow();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (artwork == null || station == null || !(artwork.getDrawable() instanceof BitmapDrawable)) {
            return;
        }
        Drawable logo = station.getDrawable();
        if (logo == null) {
            return;
        }
        int width = getWidth();
        int height = getHeight();
        float radius = Math.min(width, height) / 2f;
        canvas.drawCircle(width / 2f, height / 2f, radius, paint);

        int pad = Math.round(8 * getResources().getDisplayMetrics().density);
        int boxWidth = width - 2 * pad;
        int boxHeight = height - 2 * pad;
        int logoWidth = logo.getIntrinsicWidth() > 0 ? logo.getIntrinsicWidth() : boxWidth;
        int logoHeight = logo.getIntrinsicHeight() > 0 ? logo.getIntrinsicHeight() : boxHeight;
        float scale = Math.min(boxWidth / (float) logoWidth, boxHeight / (float) logoHeight);
        int drawWidth = Math.round(logoWidth * scale);
        int drawHeight = Math.round(logoHeight * scale);
        int left = (width - drawWidth) / 2;
        int top = (height - drawHeight) / 2;

        Rect saved = logo.copyBounds();
        circle.reset();
        circle.addCircle(width / 2f, height / 2f, radius, Path.Direction.CW);
        canvas.save();
        canvas.clipPath(circle);
        logo.setBounds(left, top, left + drawWidth, top + drawHeight);
        logo.draw(canvas);
        canvas.restore();
        logo.setBounds(saved);
    }
}
