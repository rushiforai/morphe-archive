package app.jimaku.extension.overlay;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;

import app.jimaku.extension.jobs.Glide;
import app.jimaku.extension.ui.Icons;

/**
 * Jimaku's button in the player's top bar, beside YouTube's CC button and the size of it: the
 * extension's control glyph in white, filled while subtitles or the original caption show, as YouTube
 * fills its CC button while captions are on. It opens Jimaku's menu.
 *
 * <p>While a job runs it carries the extension's thin bar under the glyph, filling as the job goes or
 * sweeping where that can't be estimated; after a start that didn't arrive, "!" stands in the
 * sparkle's place. It shows both only while the top bar shows, as it does.
 */
public final class PlayerButton extends View {
    private static final float GLYPH_DP = 24;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float density;
    /** The control's bar: 12 px of light under a 24 px glyph in the extension. */
    private final Bar bar;
    private boolean on;
    private boolean error;

    public PlayerButton(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        bar = new Bar(12 * density);
        paint.setColor(Color.WHITE);
        // YouTube's own player buttons cast a faint shadow, so they read over a white video.
        paint.setShadowLayer(2 * density, 0, 0, 0x66000000);
        setLayerType(LAYER_TYPE_SOFTWARE, null);
        setBackground(new RippleDrawable(ColorStateList.valueOf(0x33FFFFFF), null, null));
        setClickable(true);
        setFocusable(true);
    }

    /** Whether subtitles or the original caption show. */
    public void setOn(boolean value) {
        if (on == value) return;
        on = value;
        invalidate();
    }

    /**
     * The running job's bar: filling along {@code glide}, sweeping where {@code working} without one,
     * none where nothing runs. {@code failed}: the last start didn't arrive, shown while nothing runs.
     */
    public void setWork(boolean working, Glide glide, boolean failed) {
        bar.setGlide(working ? glide : null);
        bar.setScan(working && glide == null);
        error = failed && !working;
        invalidate();
    }

    /** The extension's control name, as "Jimaku subtitles: English available". */
    public void setName(String name) {
        if (name.contentEquals(getContentDescription() == null ? "" : getContentDescription())) return;
        setContentDescription(name);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        float size = GLYPH_DP * density;
        float left = (getWidth() - size) / 2f;
        float top = (getHeight() - size) / 2f;
        Icons.Icon glyph = error ? (on ? Icons.CONTROL_ON_BANG : Icons.CONTROL_BANG) : on ? Icons.CONTROL_ON : Icons.CONTROL;
        Icons.draw(canvas, glyph, left, top, size, paint);
        // Under the glyph and its width, as the extension's bar at 50% + 12 px with 12 px insets.
        if (bar.draw(canvas, left, top + size, left + size, 3 * density)) postInvalidateOnAnimation();
    }

    @Override
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClassName("android.widget.Button");
    }
}
