package app.ckzombies.extension;

import android.graphics.Canvas;

/**
 * Centres the text of the resource screen's text areas (ResFileDownloadView$GluTextArea).
 *
 * Glu's draw() puts the first line in the middle of the area and the rest below it, which is
 * fine for the one line Glu's own messages have and runs a longer one into the buttons. begin()
 * gives draw() a first line that centres the whole block on the area's middle instead, and
 * shrinks the canvas around that middle when the block is taller than the area; end() undoes
 * the shrinking.
 */
@SuppressWarnings("unused")
public final class CenteredText {

    /** The canvas state begin() saved, or -1 when it did not scale. draw() runs on the UI thread only. */
    private static int saved = -1;

    private CenteredText() {
    }

    /**
     * Called in draw() once it has the line height, the line count and the area's middle, which
     * Glu uses as the first line's position; returns the position to use instead.
     */
    public static float begin(Canvas canvas, float lineHeight, int lines, float middle, int areaHeight) {
        saved = -1;
        try {
            float scale = scale(lines, lineHeight, areaHeight);
            if (scale < 1f) {
                saved = canvas.save();
                canvas.scale(scale, scale, canvas.getWidth() / 2f, middle);
            }
            return firstLine(middle, lineHeight, lines);
        } catch (Throwable ignored) {
            return middle;
        }
    }

    /** Called where draw() returns. */
    public static void end(Canvas canvas) {
        if (saved < 0) {
            return;
        }
        try {
            canvas.restoreToCount(saved);
        } catch (Throwable ignored) {
            // Nothing else draws on this canvas state.
        } finally {
            saved = -1;
        }
    }

    /**
     * Glu draws line i at first + i * lineHeight; with one line the first stays in the middle,
     * as Glu has it, and with more the block's middle line does.
     */
    static float firstLine(float middle, float lineHeight, int lines) {
        return lines > 1 ? middle - (lines - 1) * lineHeight / 2f : middle;
    }

    /** How much to shrink so all lines, plus half a line to spare, fit the area; 1 when they fit. */
    static float scale(int lines, float lineHeight, int areaHeight) {
        float block = (lines + 0.5f) * lineHeight;
        return lines > 0 && areaHeight > 0 && block > areaHeight ? areaHeight / block : 1f;
    }
}
