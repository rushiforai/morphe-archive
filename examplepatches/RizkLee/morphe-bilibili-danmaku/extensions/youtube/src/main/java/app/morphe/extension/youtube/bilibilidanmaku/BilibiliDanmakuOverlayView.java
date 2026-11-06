package app.morphe.extension.youtube.bilibilidanmaku;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.view.DisplayCutout;
import android.view.View;
import android.view.WindowInsets;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/** Video-time based overlay; rendering has no network or blocking operations. */
final class BilibiliDanmakuOverlayView extends View {
    static final int DEFAULT_LINE_SPACING = 110;
    private static final int MAX_LANDSCAPE_ROWS = 30;

    private final DanmakuPainter painter;
    private final float density;
    private List<DanmakuComment> comments = Collections.emptyList();
    private int[] lanes = new int[0];
    private float[] textWidths = new float[0];
    private boolean active;
    private boolean playing;
    private int fontSp = 19;
    private int opacity = 85;
    private int area = 75;
    private int lineSpacing = DEFAULT_LINE_SPACING;
    private int travelSeconds = 8;
    private int maxLength = 120;
    private String blockedWords = "";
    private String[] blockedTokens = new String[0];
    private boolean hideColored;
    private boolean hideTopBottom;
    private double rate = 1.0;
    private long offsetMs;
    private float safeTop;

    BilibiliDanmakuOverlayView(Context context) {
        super(context);
        density = context.getResources().getDisplayMetrics().density;
        painter = new DanmakuPainter(context);
        setWillNotDraw(false);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        setVisibility(GONE);
    }

    void setActive(boolean enabled) {
        active = enabled;
        setVisibility(enabled ? VISIBLE : GONE);
        invalidate();
    }

    void setPlaying(boolean value) {
        playing = value;
        invalidate();
    }

    void updateSettings(int font, int alpha, int travel, int areaPercent, int spacingPercent, int max,
                        boolean filterColored, boolean filterFixed, String keywords,
                        double timelineRate, long timelineOffset) {
        int newFont = Math.max(10, Math.min(40, font));
        int newArea = Math.max(20, Math.min(100, areaPercent));
        int newTravel = Math.max(3, Math.min(25, travel));
        int newSpacing = Math.max(80, Math.min(200, spacingPercent));
        boolean geometryChanged = newFont != fontSp || newArea != area || newTravel != travelSeconds
                || newSpacing != lineSpacing || max != maxLength;
        if (newFont != fontSp) resetWidthCache();
        fontSp = newFont;
        opacity = Math.max(5, Math.min(100, alpha));
        travelSeconds = newTravel;
        area = newArea;
        lineSpacing = newSpacing;
        maxLength = Math.max(1, Math.min(500, max));
        hideColored = filterColored;
        hideTopBottom = filterFixed;
        String newWords = keywords == null ? "" : keywords.toLowerCase(Locale.ROOT);
        if (!newWords.equals(blockedWords)) {
            blockedWords = newWords;
            blockedTokens = Arrays.stream(newWords.split("[,，;；\\n]"))
                    .map(String::trim).filter(s -> !s.isEmpty()).toArray(String[]::new);
        }
        rate = timelineRate > 0 && Double.isFinite(timelineRate) ? timelineRate : 1.0;
        offsetMs = timelineOffset;
        // Opacity is applied to the composed layer, so outlines never darken the inside of glyphs.
        setAlpha(opacity / 100f);
        if (geometryChanged) rebuildLanes();
        invalidate();
    }

    void setComments(List<DanmakuComment> loaded) {
        comments = new ArrayList<>(loaded);
        Collections.sort(comments);
        resetWidthCache();
        rebuildLanes();
        invalidate();
    }

    void clearComments() {
        comments = Collections.emptyList();
        lanes = new int[0];
        textWidths = new float[0];
        invalidate();
    }

    List<DanmakuComment> findComments(String text, int limit) {
        String needle = text.toLowerCase(Locale.ROOT);
        List<DanmakuComment> found = new ArrayList<>();
        for (DanmakuComment comment : comments) {
            if (comment.text.toLowerCase(Locale.ROOT).contains(needle)) {
                found.add(comment);
                if (found.size() >= limit) break;
            }
        }
        return found;
    }

    double rate() { return rate; }
    long offsetMs() { return offsetMs; }

    @Override public boolean hasOverlappingRendering() {
        // Required so that the view alpha is applied to the composed text, not per stroke/fill.
        return true;
    }

    @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        // Font size depends on the available width. Cached measurements from
        // the previous orientation would otherwise make comments jump or clip.
        if (w != oldw) resetWidthCache();
        rebuildLanes();
    }

    private int rowCount() {
        float lineHeight = lineHeightPx();
        if (portraitFullscreen()) return BilibiliPortraitLayout.rowCount(portraitAreaHeight(), lineHeight);
        return Math.max(1, Math.min(MAX_LANDSCAPE_ROWS, (int) (getHeight() * area / 100.0 / lineHeight)));
    }

    private boolean portraitFullscreen() { return getHeight() > getWidth(); }

    private float computeSafeTop() {
        WindowInsets insets = getRootWindowInsets();
        if (insets == null) return 0;
        DisplayCutout cutout = insets.getDisplayCutout();
        if (cutout == null) return 0;
        int[] location = new int[2];
        getLocationOnScreen(location);
        return Math.max(0, cutout.getSafeInsetTop() - location[1]);
    }

    @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        float next = computeSafeTop();
        if (next != safeTop) {
            safeTop = next;
            rebuildLanes();
        }
    }

    /** Reserve the title/player controls above and the seek bar and buttons below portrait fullscreen video. */
    private float portraitTop() { return BilibiliPortraitLayout.top(getHeight(), density, safeTop); }

    private float portraitBottom() { return BilibiliPortraitLayout.bottom(getHeight(), density); }

    private float portraitAreaHeight() {
        return BilibiliPortraitLayout.areaHeight(getHeight(), portraitTop(), portraitBottom(), area, lineHeightPx());
    }

    private int fixedLaneCount() {
        return getHeight() >= 160 * density ? 2 : 1;
    }

    private float fontSizePx() { return painter.fontSizePx(fontSp, getWidth()); }

    private float lineHeightPx() { return painter.lineHeightPx(fontSizePx(), lineSpacing); }

    private void resetWidthCache() {
        textWidths = new float[comments.size()];
        Arrays.fill(textWidths, -1f);
    }

    private void rebuildLanes() {
        if (getWidth() <= 0 || getHeight() <= 0) {
            lanes = new int[0];
            return;
        }
        int count = Math.max(1, rowCount());
        long[] scrollNextFree = new long[count];
        long[] topNextFree = new long[fixedLaneCount()];
        long[] bottomNextFree = new long[fixedLaneCount()];
        int[] result = new int[comments.size()];
        Arrays.fill(result, -1);
        boolean scatter = portraitFullscreen();
        int[] free = new int[Math.max(count, fixedLaneCount())];
        for (int i = 0; i < comments.size(); i++) {
            DanmakuComment item = comments.get(i);
            // Unsupported advanced/code modes have no visual representation here;
            // they must not occupy lanes needed by ordinary scrolling comments.
            if (item.mode < 1 || item.mode > 6 || item.text.length() > maxLength) continue;
            long[] laneFree;
            if (item.mode == 5) laneFree = topNextFree;
            else if (item.mode == 4) laneFree = bottomNextFree;
            else laneFree = scrollNextFree;
            int best = -1;
            int available = laneFree.length;
            if (scatter && laneFree == scrollNextFree) {
                // Tall portrait area: walking the lanes in order draws a diagonal "staircase"
                // from top-left to bottom-right. Pick a free lane pseudo-randomly instead
                // (deterministic per comment, so rebuilding the layout keeps positions stable).
                int freeCount = 0;
                for (int lane = 0; lane < available; lane++)
                    if (laneFree[lane] <= item.timeMs) free[freeCount++] = lane;
                if (freeCount > 0) best = free[Math.floorMod(scatterHash(item, i), freeCount)];
            } else {
                for (int k = 0; k < available; k++) {
                    int lane = (i + k) % available;
                    if (laneFree[lane] <= item.timeMs) { best = lane; break; }
                }
            }
            // Drop excessive overlapping comments rather than drawing over existing ones.
            if (best < 0) continue;
            result[i] = best;
            double estimatedWidth = Math.min(item.text.length(), maxLength) * fontSizePx() * .57;
            double travelMs = travelSeconds * 1000.0;
            long gap = item.mode == 4 || item.mode == 5 ? 4100L
                    : (long) (travelMs * estimatedWidth / (getWidth() + estimatedWidth) + 250);
            laneFree[best] = item.timeMs + gap;
        }
        lanes = result;
    }

    /** Stable pseudo-random value per comment (independent of view size). */
    private static int scatterHash(DanmakuComment item, int index) {
        long h = item.timeMs * 0x9E3779B97F4A7C15L + item.text.hashCode() * 31L + index;
        h ^= h >>> 33;
        h *= 0xFF51AFD7ED558CCDL;
        h ^= h >>> 33;
        return (int) h;
    }

    /** First index with comment.timeMs >= timeMs. */
    private int lowerBound(long timeMs) {
        int low = 0, high = comments.size();
        while (low < high) {
            int mid = (low + high) >>> 1;
            if (comments.get(mid).timeMs < timeMs) low = mid + 1;
            else high = mid;
        }
        return low;
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!active || comments.isEmpty()) return;
        long videoTimeMs = BilibiliDanmakuController.currentTimeMs();
        if (videoTimeMs < 0) return;
        double biliTime = videoTimeMs * rate + offsetMs;
        double scrollDurationMs = travelSeconds * 1000.0;
        double maxWindowBiliMs = Math.max(scrollDurationMs, 4000) * rate;
        int first = lowerBound((long) (biliTime - maxWindowBiliMs));
        if (lanes.length != comments.size()) return;
        float lineHeight = lineHeightPx();
        int count = rowCount();
        painter.prepare(fontSizePx());
        boolean portrait = portraitFullscreen();
        float areaTop = portrait ? portraitTop() : 7 * density;
        float fixedBottom = portrait ? getHeight() - portraitBottom() : getHeight() - 10 * density;
        float centerOffset = painter.baselineOffset(lineHeight);
        for (int i = first; i < comments.size(); i++) {
            DanmakuComment item = comments.get(i);
            if (lanes[i] < 0) continue;
            if (item.timeMs > biliTime) break;
            if (item.mode == 7 || item.mode == 8 || item.mode <= 0) continue;
            if (hideTopBottom && (item.mode == 4 || item.mode == 5)) continue;
            if (hideColored && item.color != 0xffffff) continue;
            if (item.text.length() > maxLength) continue;
            if (blockedTokens.length > 0) {
                boolean skip = false;
                String lower = item.text.toLowerCase(Locale.ROOT);
                for (String word : blockedTokens) {
                    if (lower.contains(word)) {
                        skip = true; break;
                    }
                }
                if (skip) continue;
            }
            double elapsed = (biliTime - item.timeMs) / rate;
            double duration = (item.mode == 4 || item.mode == 5) ? 4000 : scrollDurationMs;
            if (elapsed < 0 || elapsed > duration) continue;
            float rowTop;
            if (item.mode == 5) rowTop = areaTop + lineHeight * lanes[i];
            else if (item.mode == 4) rowTop = fixedBottom - lineHeight * (lanes[i] + 1);
            else rowTop = areaTop + lineHeight * (lanes[i] % count);
            float baseline = rowTop + centerOffset;
            float width = textWidths[i];
            if (width < 0) textWidths[i] = width = painter.measure(item.text);
            float x;
            if (item.mode == 4 || item.mode == 5) x = (getWidth() - width) / 2;
            else if (item.mode == 6) x = -width + (float) (elapsed / duration) * (getWidth() + width);
            else x = getWidth() - (float) (elapsed / duration) * (getWidth() + width);
            painter.draw(canvas, item.text, x, baseline, item.color);
        }
        if (playing) postInvalidateOnAnimation();
    }

    /**
     * Shared Bilibili-style text renderer: a thin, fully opaque dark outline drawn outside a
     * fully opaque fill (opacity is applied to the whole layer by the caller).
     */
    static final class DanmakuPainter {
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
        private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
        private final Paint.FontMetrics metrics = new Paint.FontMetrics();
        private final float density;
        private final float scaledDensity;

        DanmakuPainter(Context context) {
            density = context.getResources().getDisplayMetrics().density;
            scaledDensity = context.getResources().getDisplayMetrics().scaledDensity;
            Typeface bold = Typeface.create(Typeface.DEFAULT, Typeface.BOLD);
            fill.setTypeface(bold);
            stroke.setTypeface(bold);
            stroke.setStyle(Paint.Style.STROKE);
            stroke.setStrokeJoin(Paint.Join.ROUND);
            stroke.setStrokeCap(Paint.Cap.ROUND);
        }

        /** Use the same physical font size for portrait embedded and fullscreen playback. */
        float fontSizePx(int fontSp, int availableWidthPx) {
            float availableDp = availableWidthPx / density;
            return fontSp * scaledDensity * Math.max(.68f, Math.min(1f, availableDp / 500f));
        }

        float lineHeightPx(float fontPx, int spacingPercent) {
            return (fontPx + 5f * density) * spacingPercent / 100f;
        }

        void prepare(float fontPx) {
            fill.setTextSize(fontPx);
            stroke.setTextSize(fontPx);
            // About 0.8 px of outline outside the glyph per 10 px of text, like the Bilibili app.
            stroke.setStrokeWidth(Math.max(1.6f, fontPx * .08f));
            fill.getFontMetrics(metrics);
        }

        /** Baseline offset that centres a line of text vertically inside a track. */
        float baselineOffset(float lineHeight) {
            return (lineHeight - (metrics.descent - metrics.ascent)) / 2f - metrics.ascent;
        }

        float measure(String text) { return fill.measureText(text); }

        void draw(Canvas canvas, String text, float x, float baseline, int rgb) {
            int r = (rgb >>> 16) & 0xff, g = (rgb >>> 8) & 0xff, b = rgb & 0xff;
            boolean darkText = r * 299 + g * 587 + b * 114 < 48_000;
            stroke.setColor(darkText ? Color.argb(235, 255, 255, 255) : Color.BLACK);
            fill.setColor(Color.rgb(r, g, b));
            canvas.drawText(text, x, baseline, stroke);
            canvas.drawText(text, x, baseline, fill);
        }
    }
}
