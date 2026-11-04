package app.wordfeudwordfinder.extension.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;

/**
 * A letter tile: letter in the middle, point value small in the bottom-right corner.
 * States: {@link State#NORMAL} (cream), {@link State#DIMMED} (rack letter used by the selected word),
 * {@link State#NEW} (newly placed: white with a blue border, optional score badge).
 * All colours come from {@link Theme}. Sizes scale with the bounds.
 */
public final class TileDrawable extends Drawable {
    public enum State { NORMAL, DIMMED, NEW }

    private final Theme theme;
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint border = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint letterPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint pointsPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint badgeFill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint badgeText = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF rect = new RectF();

    private String letter = "";
    private int points;
    private State state = State.NORMAL;
    private String badge;
    private int alpha = 255;

    public TileDrawable(Theme theme, Typeface letterFace, Typeface pointsFace) {
        this.theme = theme;
        fill.setStyle(Paint.Style.FILL);
        border.setStyle(Paint.Style.STROKE);
        letterPaint.setTextAlign(Paint.Align.CENTER);
        letterPaint.setTypeface(letterFace);
        letterPaint.setFakeBoldText(true);
        pointsPaint.setTextAlign(Paint.Align.RIGHT);
        pointsPaint.setTypeface(pointsFace);
        badgeFill.setStyle(Paint.Style.FILL);
        badgeText.setTextAlign(Paint.Align.CENTER);
        badgeText.setTypeface(letterFace);
        badgeText.setFakeBoldText(true);
    }

    /**
     * @param letter text shown (already upper case); null is treated as ""
     * @param points point value; 0 or less hides it (blank)
     * @param badge score badge text for a NEW tile, or null for none
     */
    public void set(String letter, int points, State state, String badge) {
        this.letter = letter == null ? "" : letter;
        this.points = points;
        this.state = state == null ? State.NORMAL : state;
        this.badge = badge;
        invalidateSelf();
    }

    @Override
    public void draw(Canvas canvas) {
        Rect b = getBounds();
        float w = b.width();
        float h = b.height();
        if (w <= 0 || h <= 0) return;
        float s = Math.min(w, h);
        float radius = s * 0.14f;
        int a = state == State.DIMMED ? theme.tileDimmedAlpha * alpha / 255 : alpha;

        boolean isNew = state == State.NEW;
        rect.set(b);
        float stroke = isNew ? Math.max(1f, s * 0.08f) : 0f;
        if (isNew) rect.inset(stroke / 2f, stroke / 2f);

        fill.setColor(isNew ? theme.tileNewFill : theme.tileFill);
        fill.setAlpha(a);
        canvas.drawRoundRect(rect, radius, radius, fill);
        if (isNew) {
            border.setColor(theme.tileNewBorder);
            border.setAlpha(a);
            border.setStrokeWidth(stroke);
            canvas.drawRoundRect(rect, radius, radius, border);
        }

        int textColor = isNew ? theme.tileNewText : theme.tileText;
        letterPaint.setColor(textColor);
        letterPaint.setAlpha(a);
        letterPaint.setTextSize(s * 0.58f);
        float cx = b.left + w * (points > 0 ? 0.46f : 0.5f);
        float cy = b.top + h * 0.5f - (letterPaint.descent() + letterPaint.ascent()) / 2f;
        canvas.drawText(letter, cx, cy, letterPaint);

        if (points > 0) {
            pointsPaint.setColor(textColor);
            pointsPaint.setAlpha(a);
            pointsPaint.setTextSize(s * 0.26f);
            canvas.drawText(String.valueOf(points), b.right - s * 0.08f, b.bottom - s * 0.09f, pointsPaint);
        }

        if (isNew && badge != null && !badge.isEmpty()) {
            float r = s * 0.3f;
            drawBadge(canvas, b.right - r * 0.6f, b.top + r * 0.6f, r, badge, a);
        }
    }

    /** Draws a round score bubble centred at (cx, cy); used for the board's last new tile as well. */
    public void drawBadge(Canvas canvas, float cx, float cy, float r, String text, int a) {
        badgeFill.setColor(theme.badgeFill);
        badgeFill.setAlpha(a);
        float half = badgeHalfWidth(r, text);
        rect.set(cx - half, cy - r, cx + half, cy + r);
        canvas.drawRoundRect(rect, r, r, badgeFill);
        badgeText.setColor(theme.badgeText);
        badgeText.setAlpha(a);
        canvas.drawText(text, cx, cy - (badgeText.descent() + badgeText.ascent()) / 2f, badgeText);
    }

    /** Half the width of the bubble {@link #drawBadge} draws: r, or wider (a pill) for long scores. */
    public float badgeHalfWidth(float r, String text) {
        badgeText.setTextSize(r * 1.05f);
        float tw = badgeText.measureText(text == null ? "" : text);
        return tw > r * 1.4f ? tw / 2f + r * 0.3f : r;
    }

    @Override
    public void setAlpha(int alpha) {
        this.alpha = alpha;
        invalidateSelf();
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        fill.setColorFilter(colorFilter);
        border.setColorFilter(colorFilter);
        letterPaint.setColorFilter(colorFilter);
        pointsPaint.setColorFilter(colorFilter);
        invalidateSelf();
    }

    @Override
    @SuppressWarnings("deprecation")
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
