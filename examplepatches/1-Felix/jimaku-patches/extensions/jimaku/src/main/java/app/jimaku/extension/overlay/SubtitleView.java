package app.jimaku.extension.overlay;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.LocaleList;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextDirectionHeuristics;
import android.text.TextPaint;
import android.view.View;
import android.view.accessibility.CaptioningManager;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Objects;

/**
 * Draws the captions inside the visible part of the video, centred near its bottom: the
 * translation, and above it the original where Original caption shows one. Each line of a caption
 * is laid out on its own and wraps within 90% of the video's width; each row gets a dark ground as
 * wide as its words, and the rows' grounds touch without overlapping. While Settings is open they
 * carry a dashed outline and, to their left, the grip they are dragged by. The view takes no
 * touches and no focus, so taps reach the player below it.
 */
public final class SubtitleView extends View {
    /**
     * The text size is a fixed part plus a share of the visible video's height, as YouTube sizes
     * its own captions at their default size: measured on YouTube 21.16.256 as 13.7 dp in the
     * portrait player (video 232 dp tall) and 15.9 dp in fullscreen (411 dp).
     */
    private static final float TEXT_SIZE_BASE_DP = 10.9f;
    private static final float TEXT_SIZE_FRACTION = 0.0122f;
    /** The original is four fifths of the translation's base size, never under 12 dp, as in the extension. */
    private static final float ORIGINAL_FRACTION = 0.8f;
    private static final float ORIGINAL_MIN_DP = 12f;
    private static final float WRAP_FRACTION = 0.9f;
    /** Gap between the subtitle and the video's bottom edge, of the video's height. */
    private static final float BOTTOM_GAP_FRACTION = 0.06f;
    /** Gap between the subtitle and the controls while they show, of the text size. */
    private static final float CONTROLS_GAP_EMS = 0.5f;
    /** Ground beyond the words on each side, of the text size. */
    private static final float GROUND_PADDING_EMS = 0.25f;
    /** The outline's distance from the captions, as the extension's outline-offset. */
    private static final float OUTLINE_OFFSET_DP = 6f;
    /** The grip's target: this wide to the captions' left, and this far above and below them. */
    public static final float GRIP_WIDTH_DP = 40f;
    public static final float GRIP_OVER_DP = 8f;
    /** The extension's reach for dragged captions, in dp: see {@code REACH} in its overlay. */
    private static final float REACH_SIDE_DP = 60f;
    private static final float REACH_DOWN_DP = 64f;
    private static final float REACH_TOP_DP = 78f;

    /** Told when the view may have started or stopped being on screen. */
    public interface OnScreenChange {
        void onScreenChange();
    }

    /** One caption block: its text, its language and its paint. */
    private final class Block {
        final TextPaint paint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        final List<StaticLayout> layouts = new ArrayList<>();
        String text;
        String lang;
        String laidOutText;
        String laidOutLang;
        int laidOutWidth;
        float laidOutSize;
        int height;
        float width;

        Block() {
            paint.setColor(Color.WHITE);
            paint.setTypeface(Typeface.DEFAULT);
        }

        void layOut(float size, int wrapWidth) {
            if (text == null) {
                height = 0;
                width = 0;
                return;
            }
            if (Objects.equals(text, laidOutText) && Objects.equals(lang, laidOutLang)
                    && wrapWidth == laidOutWidth && size == laidOutSize) {
                return;
            }
            paint.setTextSize(size);
            paint.setTextLocales(lang != null ? new LocaleList(Locale.forLanguageTag(lang)) : LocaleList.getDefault());
            layouts.clear();
            height = 0;
            width = 0;
            for (String line : text.split("\n", -1)) {
                StaticLayout layout = StaticLayout.Builder.obtain(line, 0, line.length(), paint, wrapWidth)
                        .setAlignment(Layout.Alignment.ALIGN_CENTER)
                        .setTextDirection(TextDirectionHeuristics.FIRSTSTRONG_LTR)
                        .setIncludePad(false)
                        .setUseLineSpacingFromFallbacks(true)
                        .build();
                layouts.add(layout);
                height += layout.getHeight();
                for (int row = 0; row < layout.getLineCount(); row++) width = Math.max(width, layout.getLineMax(row));
            }
            laidOutText = text;
            laidOutLang = lang;
            laidOutWidth = wrapWidth;
            laidOutSize = size;
        }

        /** Draws the block with its top at {@code y}; {@code left} is the wrap box's left. */
        void draw(Canvas canvas, float left, int y, float padding) {
            for (StaticLayout layout : layouts) {
                for (int row = 0; row < layout.getLineCount(); row++) {
                    if (layout.getLineMax(row) <= 0) continue;
                    canvas.drawRect(
                            left + layout.getLineLeft(row) - padding,
                            y + layout.getLineTop(row),
                            left + layout.getLineRight(row) + padding,
                            y + layout.getLineBottom(row),
                            groundPaint);
                }
                canvas.save();
                canvas.translate(left, y);
                layout.draw(canvas);
                canvas.restore();
                y += layout.getHeight();
            }
        }
    }

    private final Block translation = new Block();
    private final Block original = new Block();
    private final Paint groundPaint = new Paint();
    private final Paint outlinePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint gripPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint dotPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final float fontScale;
    private final float density;
    private final Rect video = new Rect();
    private final RectF box = new RectF();
    private final RectF grip = new RectF();
    private final Rect covered = new Rect();

    private OnScreenChange onScreenChange;
    private boolean dragging;
    /** Where the captions were last drawn, in px from the middle and up from their own place without YouTube's controls. */
    private float drawnDx;
    private float drawnDy;
    private int controlsTop = -1;
    private float translationScale = 1f;
    private float originalScale = 1f;
    private boolean editing;
    /** Where the captions were dropped, as shares of the video's width and height from their own place. */
    private float shareX;
    private float shareY;

    public SubtitleView(Context context) {
        super(context);
        setClickable(false);
        setLongClickable(false);
        setFocusable(false);
        setFocusableInTouchMode(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);

        groundPaint.setStyle(Paint.Style.FILL);
        setBackgroundShare(75);

        CaptioningManager captioning = context.getSystemService(CaptioningManager.class);
        fontScale = captioning != null ? captioning.getFontScale() : 1f;
        density = context.getResources().getDisplayMetrics().density;

        outlinePaint.setStyle(Paint.Style.STROKE);
        outlinePaint.setStrokeWidth(1.5f * density);
        outlinePaint.setColor(0xCCFFFFFF);
        outlinePaint.setPathEffect(new DashPathEffect(new float[]{4 * density, 3 * density}, 0));
        gripPaint.setColor(0xEB1C1C1C);
        dotPaint.setColor(Color.WHITE);
    }

    public void setOnScreenChange(OnScreenChange listener) {
        onScreenChange = listener;
    }

    /** The translation to show and its language as a BCP 47 tag, or null for none. */
    public void setText(String text, String lang) {
        if (Objects.equals(translation.text, text) && Objects.equals(translation.lang, lang)) return;
        translation.text = text;
        translation.lang = lang;
        invalidate();
    }

    /** The original to show above the translation and its language, or null for none. */
    public void setOriginal(String text, String lang) {
        if (Objects.equals(original.text, text) && Objects.equals(original.lang, lang)) return;
        original.text = text;
        original.lang = lang;
        invalidate();
    }

    /** Both sizes in percent and the ground's opacity in percent, as Settings sets them. */
    public void setLook(int translationPercent, int originalPercent, int backgroundPercent) {
        float t = translationPercent / 100f;
        float o = originalPercent / 100f;
        int before = groundPaint.getColor();
        setBackgroundShare(backgroundPercent);
        if (t == translationScale && o == originalScale && before == groundPaint.getColor()) return;
        translationScale = t;
        originalScale = o;
        invalidate();
    }

    private void setBackgroundShare(int percent) {
        groundPaint.setColor(Color.argb(Math.round(255 * Math.max(0, Math.min(100, percent)) / 100f), 0, 0, 0));
    }

    /** While Settings is open: the outline and the grip show. */
    public void setEditing(boolean value) {
        if (editing == value) return;
        editing = value;
        invalidate();
    }

    /** Where the captions were dropped, as shares of the video's width and height from their own place, up positive. */
    public void setPosition(float x, float y) {
        if (shareX == x && shareY == y) return;
        shareX = x;
        shareY = y;
        invalidate();
    }

    /** The part of this view the video covers on screen. */
    public void setVideoArea(Rect area) {
        if (video.equals(area)) return;
        video.set(area);
        invalidate();
    }

    public Rect videoArea() {
        return video;
    }

    /**
     * The part of this view Jimaku's Settings sheet covers at the screen's edge, or null. Captions
     * that would reach under it move in beside it, as dropped captions move in at the player's
     * edge; where they were dropped doesn't change.
     */
    public void setCovered(Rect area) {
        if (area == null ? covered.isEmpty() : covered.equals(area)) return;
        if (area == null) covered.setEmpty();
        else covered.set(area);
        invalidate();
    }

    /** The top of the controls in this view's coordinates while they show, otherwise -1. */
    public void setControlsTop(int top) {
        if (controlsTop == top) return;
        controlsTop = top;
        invalidate();
    }

    /** While the captions are dragged by their grip: they follow it, under the Settings sheet too. */
    public void setDragging(boolean value) {
        if (dragging == value) return;
        dragging = value;
        invalidate();
    }

    /** Where the captions were last drawn, in px right of the middle, within the reach. */
    public float drawnOffsetX() {
        return drawnDx;
    }

    /** Where the captions were last drawn, in px up from their own place, within the reach. */
    public float drawnOffsetY() {
        return drawnDy;
    }

    /** The grip's target in this view's coordinates as last drawn, empty when it isn't drawn. */
    public RectF gripArea() {
        return grip;
    }

    /** The captions' box as last drawn, empty when nothing is drawn. */
    public RectF captionsArea() {
        return box;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        box.setEmpty();
        grip.setEmpty();
        if ((translation.text == null && original.text == null) || video.isEmpty()) return;
        float base = TEXT_SIZE_BASE_DP * density + video.height() * TEXT_SIZE_FRACTION;
        float size = base * translationScale * fontScale;
        float originalSize = Math.max(ORIGINAL_MIN_DP * density, base * ORIGINAL_FRACTION) * originalScale * fontScale;
        int wrapWidth = Math.max(1, Math.round(video.width() * WRAP_FRACTION));
        float padding = size * GROUND_PADDING_EMS;
        float originalPadding = originalSize * GROUND_PADDING_EMS;

        // Beside the Settings sheet the captions keep their outline, and the grip at their left, clear
        // of it; while they are dragged they follow the finger, under the sheet too.
        boolean coverRight = false, coverLeft = false;
        if (!dragging && !covered.isEmpty() && covered.left < video.right && covered.right > video.left) {
            coverRight = covered.exactCenterX() >= video.exactCenterX();
            coverLeft = !coverRight;
        }
        int freeLeft = coverLeft ? Math.min(video.right, covered.right) : video.left;
        int freeRight = coverRight ? Math.max(video.left, covered.left) : video.right;
        float clear = (OUTLINE_OFFSET_DP + 8) * density;
        float gripRoom = editing ? GRIP_WIDTH_DP * density : 0;
        if (coverLeft || coverRight) {
            float room = freeRight - freeLeft - 2 * clear - gripRoom - 2 * Math.max(padding, originalPadding);
            wrapWidth = Math.max(1, Math.min(wrapWidth, Math.round(room)));
        }
        translation.layOut(size, wrapWidth);
        original.layOut(originalSize, wrapWidth);
        float widthDp = video.width() / density;
        int gap = translation.height > 0 && original.height > 0
                ? Math.round((widthDp < 600 ? 4 : widthDp > 1000 ? 8 : 6) * density) : 0;
        int height = original.height + gap + translation.height;

        float lead = translation.height > 0 ? size : originalSize;
        float half = Math.max(translation.width / 2 + padding, original.width / 2 + originalPadding);
        float width = video.width();
        float tall = video.height();
        int baseGap = Math.round(tall * BOTTOM_GAP_FRACTION);
        int baseBottom = video.bottom - baseGap;
        float dx;
        float dy;
        if (shareX != 0 || shareY != 0) {
            // The extension's reach: the middle at least 60 dp from either side, the grip at their left
            // inside the player, down to the grip's edge at the player's bottom, at most 64 dp, and up
            // until their bottom is 78 dp below the player's top, so the grip is always there to drag them back by.
            float gripWidth = GRIP_WIDTH_DP * density;
            float over = GRIP_OVER_DP * density;
            float side = REACH_SIDE_DP * density;
            dx = clamp(shareX * width, Math.max(half + gripWidth, side) - width / 2, width / 2 - Math.max(half, side));
            dy = clamp(shareY * tall, -Math.min(REACH_DOWN_DP * density, baseGap - over),
                    tall - baseGap - Math.max(height + over, REACH_TOP_DP * density));
        } else {
            // Their own place, above YouTube's controls while they show; a drag starts from here.
            dx = 0;
            dy = controlsTop >= 0 ? Math.max(0, baseBottom - (controlsTop - Math.round(lead * CONTROLS_GAP_EMS))) : 0;
        }
        drawnDx = dx;
        drawnDy = dy;
        int bottom = Math.min(Math.round(baseBottom - dy), video.bottom);
        int top = Math.max(video.top, bottom - height);
        float centre = video.exactCenterX() + dx;
        if (coverRight && centre + half > freeRight - clear) {
            centre = Math.max(freeRight - clear - half, video.left + gripRoom + half);
        } else if (coverLeft && centre - half - gripRoom < freeLeft + clear) {
            centre = Math.min(freeLeft + clear + gripRoom + half, video.right - half);
        }
        float left = centre - wrapWidth / 2f;
        box.set(centre - half, top, centre + half, top + height);

        canvas.save();
        canvas.clipRect(video);
        if (original.height > 0) original.draw(canvas, left, top, originalPadding);
        if (translation.height > 0) translation.draw(canvas, left, top + original.height + gap, padding);
        if (editing) drawEditing(canvas);
        canvas.restore();
    }

    /** {@code value} within the range, or the captions' own place where a player too small leaves no range. */
    private static float clamp(float value, float min, float max) {
        return max < min ? 0 : Math.min(Math.max(value, min), max);
    }

    /** The extension's dashed outline round the captions and its grip of six dots to their left. */
    private void drawEditing(Canvas canvas) {
        float offset = OUTLINE_OFFSET_DP * density;
        canvas.drawRoundRect(box.left - offset, box.top - offset, box.right + offset, box.bottom + offset,
                2 * density, 2 * density, outlinePaint);
        float over = GRIP_OVER_DP * density;
        grip.set(box.left - GRIP_WIDTH_DP * density, box.top - over, box.left, box.bottom + over);
        float dot = 4 * density;
        float spacing = 3 * density;
        float tabWidth = 6 * density * 2 + dot * 2 + spacing;
        float tabHeight = 7 * density * 2 + dot * 3 + spacing * 2;
        float tabLeft = grip.left + 6 * density;
        float tabTop = grip.centerY() - tabHeight / 2;
        canvas.drawRoundRect(tabLeft, tabTop, tabLeft + tabWidth, tabTop + tabHeight, 6 * density, 6 * density, gripPaint);
        for (int column = 0; column < 2; column++) {
            for (int row = 0; row < 3; row++) {
                float cx = tabLeft + 6 * density + dot / 2 + column * (dot + spacing);
                float cy = tabTop + 7 * density + dot / 2 + row * (dot + spacing);
                canvas.drawCircle(cx, cy, dot / 2, dotPaint);
            }
        }
    }

    @Override
    protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        if (onScreenChange != null) onScreenChange.onScreenChange();
    }

    @Override
    public void onVisibilityAggregated(boolean isVisible) {
        super.onVisibilityAggregated(isVisible);
        if (onScreenChange != null) onScreenChange.onScreenChange();
    }
}
