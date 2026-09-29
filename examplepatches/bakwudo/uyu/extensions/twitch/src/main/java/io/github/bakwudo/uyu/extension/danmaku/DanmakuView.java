package io.github.bakwudo.uyu.extension.danmaku;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.os.SystemClock;
import android.view.View;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

import io.github.bakwudo.uyu.extension.settings.Setting;

/**
 * Draws danmaku comments scrolling from right to left, Niconico style.
 * <ul>
 *     <li>Every comment takes the same time to cross, so longer comments move faster.</li>
 *     <li>A comment takes the first row, from the top, where it does not catch up with the
 *     comments already there. If there is none, it goes on a random row.</li>
 *     <li>While paused, comments stop and new ones are dropped.</li>
 * </ul>
 * Must be used on the main thread.
 */
public final class DanmakuView extends View {
    private static final String SETTING_PREFIX = "danmaku_";

    private final ArrayList<DanmakuComment> comments = new ArrayList<>();
    private final Random random = new Random();
    private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint imagePaint = new Paint(Paint.FILTER_BITMAP_FLAG);
    private final RectF imageRect = new RectF();

    private final SharedPreferences.OnSharedPreferenceChangeListener settingsListener =
            (preferences, key) -> {
                if (key == null || key.startsWith(SETTING_PREFIX)) setStyle(DanmakuStyle.fromSettings());
            };

    private DanmakuStyle style;
    private float lineHeight;
    private float strokeWidth;
    /** Distance from the top of a row to the text baseline. */
    private float baseline;
    private float emoteSize;
    /** Minimum gap between two comments on the same row. */
    private float gap;

    /** Running time in milliseconds. Stops while paused. */
    private long clock;
    /** Uptime when the clock was last advanced, or -1 while paused. */
    private long lastTick = -1;
    private boolean paused;

    public DanmakuView(Context context) {
        super(context);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeJoin(Paint.Join.ROUND);
        stroke.setStrokeCap(Paint.Cap.ROUND);
        setStyle(DanmakuStyle.fromSettings());
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        Setting.addChangeListener(settingsListener);
        setStyle(DanmakuStyle.fromSettings());
    }

    @Override
    protected void onDetachedFromWindow() {
        Setting.removeChangeListener(settingsListener);
        clear();
        super.onDetachedFromWindow();
    }

    void setStyle(DanmakuStyle style) {
        this.style = style;
        setAlpha(style.opacity);
        updateMetrics();
    }

    /**
     * Starts a comment at the right edge. Dropped while paused, before the view is laid out, or
     * when the maximum number of comments is already shown.
     */
    public void addComment(DanmakuComment comment) {
        if (paused || getWidth() == 0 || getHeight() == 0) return;
        if (comments.size() >= style.maxComments) return;

        tick();
        layoutComment(comment);
        comment.row = pickRow(comment.width);
        comment.start = clock;
        comments.add(comment);
        postInvalidateOnAnimation();
    }

    public void setPaused(boolean paused) {
        if (this.paused == paused) return;
        tick();
        this.paused = paused;
        lastTick = paused ? -1 : SystemClock.uptimeMillis();
        invalidate();
    }

    public boolean isPaused() {
        return paused;
    }

    /** Comments shown now. */
    int getCommentCount() {
        return comments.size();
    }

    /** Settings the comments are drawn with. */
    DanmakuStyle getStyle() {
        return style;
    }

    public void clear() {
        comments.clear();
        invalidate();
    }

    @Override
    protected void onSizeChanged(int width, int height, int oldWidth, int oldHeight) {
        super.onSizeChanged(width, height, oldWidth, oldHeight);
        updateMetrics();
    }

    /**
     * The row height includes the outline and the space between rows. The text size is the
     * largest that fits the font's ascent, descent and outline in one row.
     */
    private void updateMetrics() {
        if (style == null) return;
        lineHeight = getHeight() / (float) style.rows;

        fill.setTypeface(style.typeface);
        fill.setTextSize(100);
        Paint.FontMetrics metrics = fill.getFontMetrics();
        float heightRatio = (metrics.descent - metrics.ascent) / 100f;
        float textSize = lineHeight / (heightRatio + style.outlineRatio);

        strokeWidth = textSize * style.outlineRatio;
        baseline = strokeWidth / 2 - metrics.ascent / 100f * textSize;
        emoteSize = lineHeight - strokeWidth;
        gap = lineHeight * 0.2f;

        fill.setTextSize(textSize);
        fill.setColor(style.textColor);
        stroke.setTypeface(style.typeface);
        stroke.setTextSize(textSize);
        stroke.setStrokeWidth(strokeWidth);
        stroke.setColor(style.outlineColor);

        for (DanmakuComment comment : comments) layoutComment(comment);
        invalidate();
    }

    private void layoutComment(DanmakuComment comment) {
        float width = strokeWidth;
        for (int i = 0; i < comment.parts.length; i++) {
            Object part = comment.parts[i];
            float partWidth = part instanceof String text ? fill.measureText(text) : emoteSize;
            comment.partWidths[i] = partWidth;
            width += partWidth;
        }
        comment.width = width;
    }

    private int pickRow(float width) {
        for (int row = 0; row < style.usableRows; row++) {
            if (fitsInRow(row, width)) return row;
        }
        return random.nextInt(style.usableRows);
    }

    /**
     * @return true if a comment of this width can start now on the row without touching the
     * comments already on it. The new comment must start behind each of them, and must not
     * catch up with them before they leave at the left edge.
     */
    private boolean fitsInRow(int row, float width) {
        float viewWidth = getWidth();
        for (DanmakuComment other : comments) {
            if (other.row != row) continue;
            float remaining = 1 - (clock - other.start) / (float) style.durationMs;
            float otherRightEdge = remaining * (viewWidth + other.width);
            if (otherRightEdge + gap > viewWidth) return false;
            float travelBeforeOtherLeaves = remaining * (viewWidth + width);
            if (travelBeforeOtherLeaves + gap > viewWidth) return false;
        }
        return true;
    }

    private void tick() {
        long now = SystemClock.uptimeMillis();
        if (!paused && lastTick >= 0) clock += now - lastTick;
        lastTick = paused ? -1 : now;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        tick();

        float viewWidth = getWidth();
        boolean drawOutline = strokeWidth > 0 && Color.alpha(style.outlineColor) > 0;
        Iterator<DanmakuComment> iterator = comments.iterator();
        while (iterator.hasNext()) {
            DanmakuComment comment = iterator.next();
            float progress = (clock - comment.start) / (float) style.durationMs;
            if (progress >= 1) {
                iterator.remove();
                continue;
            }

            float x = viewWidth - progress * (viewWidth + comment.width) + strokeWidth / 2;
            float top = comment.row * lineHeight;
            for (int i = 0; i < comment.parts.length; i++) {
                Object part = comment.parts[i];
                float partWidth = comment.partWidths[i];
                if (x + partWidth >= 0 && x <= viewWidth) {
                    if (part instanceof String text) {
                        if (drawOutline) canvas.drawText(text, x, top + baseline, stroke);
                        canvas.drawText(text, x, top + baseline, fill);
                    } else if (part instanceof DanmakuComment.Emote emote) {
                        drawEmote(canvas, emote, x, top + strokeWidth / 2);
                    }
                }
                x += partWidth;
            }
        }

        if (!comments.isEmpty() && !paused) postInvalidateOnAnimation();
    }

    private void drawEmote(Canvas canvas, DanmakuComment.Emote emote, float left, float top) {
        Bitmap bitmap = EmoteImages.get(emote.id, emoteSize);
        if (bitmap == null) return;

        // Fit inside a square one line high, keeping the aspect ratio.
        float scale = emoteSize / Math.max(bitmap.getWidth(), bitmap.getHeight());
        float width = bitmap.getWidth() * scale;
        float height = bitmap.getHeight() * scale;
        float x = left + (emoteSize - width) / 2;
        float y = top + (emoteSize - height) / 2;
        imageRect.set(x, y, x + width, y + height);
        canvas.drawBitmap(bitmap, null, imageRect, imagePaint);
    }
}
