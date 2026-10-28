package app.originisland.extension;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.View;

import java.util.ArrayList;
import java.util.List;

/**
 * Draws a line of lyrics, and brings out each word as it is sung: words that are still to
 * come are dimmed, and the word that is sung fills with light from its start and lifts a little.
 * A line without times for its words is drawn as a whole.
 * A new line rises into place as the line before it rises away, both fading.
 */
final class LyricLineView extends View {

    interface Position {
        /**
         * @return The position the song is at in milliseconds, or -1 if it is not playing.
         */
        long get();
    }

    private static final class Token {
        final MorpheLyrics.Word word;
        final String text;
        float x;
        float width;
        int row;

        Token(MorpheLyrics.Word word, String text) {
            this.word = word;
            this.text = text;
        }
    }

    /**
     * A line laid out at one text size, so that the line before can still be drawn as it leaves.
     */
    private static final class Layout {
        final List<Token> tokens = new ArrayList<>();
        final float[] rowWidths = new float[MAX_ROWS];
        int rows;
        float textSize;
    }

    private static final float TEXT_SIZE_SP = 19;
    /**
     * Smallest text size a line is shrunk to, to fit in the height it is given.
     */
    private static final float MIN_TEXT_SIZE_SP = 14;
    private static final int MAX_ROWS = 2;
    private static final float PADDING_DP = 28;
    private static final float ROW_SPACING = 1.12f;
    /**
     * Room added between words, as a part of the text size, for the word that is sung
     * to lift into without touching the words next to it.
     */
    private static final float WORD_GAP = 0.14f;

    private static final int ALPHA_SUNG = 0xFF;
    private static final int ALPHA_TO_COME = 0x66;

    /**
     * How much the word that is sung is larger at most, and how far it lifts, as parts of
     * the text size.
     */
    private static final float SWELL = 0.07f;
    private static final float LIFT = 0.04f;
    /**
     * Soft edge of the light that fills the word that is sung, as a part of its width,
     * and the glow around it, as a part of the text size.
     */
    private static final float FILL_EDGE = 0.45f;
    private static final float GLOW = 0.35f;
    /**
     * Time a word takes to fill at least, and to settle after it was sung.
     */
    private static final long MIN_WORD_TIME_MS = 200;
    private static final long SETTLE_TIME_MS = 350;

    /**
     * A new line rises into place this far, as a part of the text size, while the line
     * before it rises away.
     */
    private static final long CHANGE_TIME_MS = 650;
    private static final float CHANGE_DISTANCE = 0.9f;

    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
    private final float padding;
    private final float textSize;
    private final float minTextSize;
    private final Position position;

    private MorpheLyrics.Line line;
    private final List<Token> lineTokens = new ArrayList<>();
    private Layout layout = new Layout();
    private Layout previousLayout;
    private int laidOutWidth = -1;
    private float availableHeight = -1;
    private long lineChangedTime;

    LyricLineView(Context context, Position position) {
        super(context);
        this.position = position;

        padding = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, PADDING_DP,
                getResources().getDisplayMetrics());
        textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, TEXT_SIZE_SP,
                getResources().getDisplayMetrics());
        minTextSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, MIN_TEXT_SIZE_SP,
                getResources().getDisplayMetrics());
        paint.setColor(0xFFFFFFFF);
        paint.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
        paint.setTextSize(textSize);
    }

    void setLine(MorpheLyrics.Line line) {
        if (this.line == line) {
            return;
        }
        boolean hadLine = this.line != null;
        this.line = line;

        previousLayout = hadLine ? layout : null;
        layout = new Layout();
        lineChangedTime = SystemClock.uptimeMillis();

        lineTokens.clear();
        if (line != null) {
            if (line.words.isEmpty()) {
                // A line break starts a new row.
                for (String row : line.text.split("\n")) {
                    if (!lineTokens.isEmpty()) {
                        lineTokens.add(new Token(null, "\n"));
                    }
                    for (String text : row.split(" ")) {
                        if (!text.isEmpty()) {
                            lineTokens.add(new Token(null, text + " "));
                        }
                    }
                }
            } else {
                for (MorpheLyrics.Word word : line.words) {
                    String text = word.text.trim();
                    if (!text.isEmpty()) {
                        lineTokens.add(new Token(word, word.endsWithSpace ? text + " " : text));
                    }
                }
            }
        }

        // The view keeps its size, so that the player is not laid out again with every line.
        laidOutWidth = -1;
        if (getWidth() > 0) {
            layOut(getWidth());
        }
        invalidate();
    }

    /**
     * Sets the height the line is drawn in, from the top of the view, and in the middle of
     * which it is drawn. The line is drawn in a smaller text size if it does not fit.
     */
    void setAvailableHeight(float height) {
        if (Math.abs(height - availableHeight) < 1) {
            return;
        }
        availableHeight = height;
        laidOutWidth = -1;
        if (getWidth() > 0) {
            layOut(getWidth());
        }
        invalidate();
    }

    private float rowHeight(float size) {
        paint.setTextSize(size);
        Paint.FontMetrics metrics = paint.getFontMetrics();
        return (metrics.descent - metrics.ascent) * ROW_SPACING;
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width = MeasureSpec.getSize(widthMeasureSpec);
        // The view keeps one size, of two rows at the full text size and the room the lines
        // move in, so that the player is not laid out again for every line.
        setMeasuredDimension(width, (int) Math.ceil(rowHeight(textSize) * (MAX_ROWS + 2 * CHANGE_DISTANCE)));
        layOut(width);
    }

    /**
     * Lays the line out at the largest text size it fits at, in its rows and in its height.
     */
    private void layOut(int width) {
        if (width == laidOutWidth) {
            return;
        }
        laidOutWidth = width;

        for (float size = textSize; ; size -= textSize / 40) {
            boolean smallest = size - textSize / 40 < minTextSize;
            Layout candidate = new Layout();
            candidate.textSize = Math.max(size, minTextSize);
            boolean whole = layOut(candidate, width);

            float height = candidate.rows * rowHeight(candidate.textSize);
            if (smallest || (whole && (availableHeight < 0 || height <= availableHeight))) {
                layout = candidate;
                return;
            }
        }
    }

    /**
     * Breaks the line into rows at its spaces, and drops what does not fit.
     *
     * @return If the whole line fits in the rows.
     */
    private boolean layOut(Layout candidate, int width) {
        paint.setTextSize(candidate.textSize);
        float available = width - 2 * padding;
        float gap = candidate.textSize * WORD_GAP;
        float x = 0;
        int row = 0;

        for (int i = 0; i < lineTokens.size(); i++) {
            Token source = lineTokens.get(i);
            Token token = new Token(source.word, source.text);

            if (token.text.equals("\n")) {
                if (row == MAX_ROWS - 1) {
                    break;
                }
                candidate.rowWidths[row++] = x;
                x = 0;
                continue;
            }
            token.width = paint.measureText(token.text) + (token.text.endsWith(" ") ? gap : 0);

            // Parts of a word stay together.
            boolean startsWord = i == 0 || lineTokens.get(i - 1).text.endsWith(" ")
                    || lineTokens.get(i - 1).text.equals("\n");
            if (startsWord && x > 0) {
                float wordWidth = 0;
                for (int j = i; j < lineTokens.size(); j++) {
                    wordWidth += paint.measureText(lineTokens.get(j).text.trim());
                    if (lineTokens.get(j).text.endsWith(" ")) {
                        break;
                    }
                }
                if (x + wordWidth > available) {
                    if (row == MAX_ROWS - 1) {
                        candidate.rowWidths[row] = x;
                        candidate.rows = row + 1;
                        return false;
                    }
                    candidate.rowWidths[row++] = x;
                    x = 0;
                }
            }

            token.row = row;
            token.x = x;
            x += token.width;
            candidate.tokens.add(token);
        }

        if (!candidate.tokens.isEmpty()) {
            candidate.rowWidths[row] = x;
            candidate.rows = row + 1;
        }
        return true;
    }

    private static float easeOutCubic(float t) {
        float u = 1 - t;
        return 1 - u * u * u;
    }

    private static float easeInOutSine(float t) {
        return (float) (-(Math.cos(Math.PI * t) - 1) / 2);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        long now = position.get();
        float change = Math.min(1, (SystemClock.uptimeMillis() - lineChangedTime) / (float) CHANGE_TIME_MS);
        float eased = easeOutCubic(change);
        boolean animated = change < 1;

        if (availableHeight >= 0) {
            canvas.clipRect(0, 0, getWidth(), availableHeight);
        }

        // The line before rises away and fades in the first part of the change.
        if (previousLayout != null && change < 1) {
            float leaving = easeOutCubic(Math.min(1, change * 1.6f));
            drawLayout(canvas, previousLayout, now,
                    -leaving * CHANGE_DISTANCE * previousLayout.textSize, 1 - leaving, true);
        }

        animated |= drawLayout(canvas, layout, now,
                (1 - eased) * CHANGE_DISTANCE * layout.textSize, Math.min(1, change * 1.4f), false);

        if (animated && isShown()) {
            postInvalidateOnAnimation();
        }
    }

    /**
     * @return If the line is still animating.
     */
    private boolean drawLayout(Canvas canvas, Layout layout, long now, float offset, float alpha,
                               boolean leaving) {
        if (layout.tokens.isEmpty() || alpha <= 0) {
            return false;
        }

        float rowHeight = rowHeight(layout.textSize);
        Paint.FontMetrics metrics = paint.getFontMetrics();
        float blockHeight = layout.rows * rowHeight;
        float top = availableHeight >= 0 ? (availableHeight - blockHeight) / 2 : 0;
        float spaceWidth = paint.measureText(" ") + layout.textSize * WORD_GAP;
        boolean animated = false;

        for (Token token : layout.tokens) {
            // The space after the last word of a row is not part of what is centered.
            float rowWidth = layout.rowWidths[token.row] - spaceWidth;
            float x = (getWidth() - rowWidth) / 2 + token.x;
            float baseline = top + offset + token.row * rowHeight + (rowHeight - (metrics.descent - metrics.ascent)) / 2
                    - metrics.ascent;

            float brightness = 1;
            float swell = 0;
            float sung = -1;
            if (token.word != null && now >= 0 && !leaving) {
                long start = token.word.startTimeMs;
                long end = Math.max(token.word.endTimeMs, start + MIN_WORD_TIME_MS);
                if (now < start) {
                    brightness = 0;
                    animated = true;
                } else if (now < end) {
                    float progress = (now - start) / (float) (end - start);
                    sung = progress;
                    swell = easeInOutSine(Math.min(1, progress * 2.5f));
                    animated = true;
                } else if (now < end + SETTLE_TIME_MS) {
                    swell = 1 - easeInOutSine((now - end) / (float) SETTLE_TIME_MS);
                    animated = true;
                }
            }

            int baseAlpha = (int) ((ALPHA_TO_COME + (ALPHA_SUNG - ALPHA_TO_COME) * brightness) * alpha);
            paint.setAlpha(baseAlpha);
            if (swell <= 0 && sung < 0) {
                canvas.drawText(token.text, x, baseline, paint);
                continue;
            }

            float textWidth = paint.measureText(token.text.trim());
            if (sung >= 0) {
                // Filled with light from its start to how far it is sung, with a soft edge.
                int lit = ((int) (ALPHA_SUNG * alpha) << 24) | 0xFFFFFF;
                int unlit = ((int) (ALPHA_TO_COME * alpha) << 24) | 0xFFFFFF;
                float edge = sung * (1 + FILL_EDGE);
                float from = Math.min(1, Math.max(0, edge - FILL_EDGE));
                float to = Math.min(1, Math.max(edge, from + 0.001f));
                paint.setShader(new LinearGradient(x, 0, x + textWidth, 0,
                        new int[]{lit, lit, unlit}, new float[]{0, from, to}, Shader.TileMode.CLAMP));
            }
            paint.setShadowLayer(layout.textSize * GLOW * swell, 0, 0,
                    ((int) (0x70 * swell * alpha) << 24) | 0xFFFFFF);

            float scale = 1 + SWELL * swell;
            canvas.save();
            canvas.translate(0, -LIFT * layout.textSize * swell);
            canvas.scale(scale, scale, x + textWidth / 2, baseline);
            canvas.drawText(token.text, x, baseline, paint);
            canvas.restore();

            paint.setShader(null);
            paint.clearShadowLayer();
        }

        return animated;
    }
}
