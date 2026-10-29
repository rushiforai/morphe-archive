package app.fakhradio.extension;

import android.content.Context;
import android.graphics.Canvas;
import android.text.Layout;
import android.util.AttributeSet;
import android.widget.TextView;

/**
 * A text view whose sideways scroll only the marquee sets. TextView scrolls itself back to the start every time it is
 * laid out again, which the player does every second, and that flashed the title back to its start for a frame.
 */
public class MarqueeLabel extends TextView {
    private int marqueeX;
    final Marquee marquee;

    public MarqueeLabel(Context context, AttributeSet attrs) {
        super(context, attrs);
        marquee = Marquee.attach(this);
    }

    /** Moves the text to [x], the only scroll this view accepts. */
    void setMarqueeX(int x) {
        marqueeX = x;
        super.scrollTo(x, 0);
    }

    /** The space between the end of the text and its start coming round again. */
    float loopGap() {
        return 40 * getResources().getDisplayMetrics().density;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Layout layout = getLayout();
        if (marqueeX == 0 || layout == null) {
            return;
        }
        // The start of the text again, after the gap, for the loop.
        canvas.save();
        canvas.clipRect(getCompoundPaddingLeft() + getScrollX(), 0,
                getWidth() - getCompoundPaddingRight() + getScrollX(), getHeight());
        canvas.translate(getCompoundPaddingLeft() + layout.getLineWidth(0) + loopGap(), getTotalPaddingTop());
        getPaint().setColor(getCurrentTextColor());
        layout.draw(canvas);
        canvas.restore();
    }

    @Override
    public void scrollTo(int x, int y) {
        super.scrollTo(marqueeX, y);
    }
}
