package app.syncit.extension;

import android.graphics.Color;
import android.text.style.ForegroundColorSpan;

import gb.i;

/**
 * Colours a post's score by its value.
 *
 * <p>Positive scores move towards the orange Reddit uses for a post that has been upvoted,
 * negative scores towards the periwinkle used for one that has been downvoted. The larger the
 * score, the further the colour moves from the theme's text colour; a score of a few points is
 * only tinted, and a score in the thousands is drawn in the full colour.
 *
 * @noinspection unused
 */
public final class ScoreColorPatch {
    private static final int POSITIVE = 0xFFFF4500;
    private static final int NEGATIVE = 0xFF7193FF;

    /** Colour mixed in at the smallest non-zero score. */
    private static final float MIN_TINT = 0.35f;

    /** Score at which the colour is fully used. */
    private static final int FULL_TINT_SCORE = 1000;

    private ScoreColorPatch() {}

    /**
     * Colours the score text that was just appended to [builder].
     *
     * @param builder  The builder the score was written to.
     * @param start    Where the score starts.
     * @param score    The post's score.
     */
    public static void apply(oc.c builder, int start, int score) {
        if (score == 0) {
            return;
        }

        // The score ends where the builder is now; the caller appends anything else after this.
        int end = builder.n();
        if (end <= start) {
            return;
        }

        // Color the number only. The text is "<n> point(s)", so the first space found walking
        // back from the end is the one before the word. Without one, color the whole score.
        int numberEnd = end;
        while (numberEnd > start && builder.f(numberEnd - 1) != ' ') {
            numberEnd--;
        }
        int coloredEnd = numberEnd > start ? numberEnd - 1 : end;
        if (coloredEnd <= start) {
            return;
        }

        int tint = score > 0 ? POSITIVE : NEGATIVE;
        float magnitude = Math.min(Math.abs((float) score), (float) FULL_TINT_SCORE);
        // Logarithmic, so the first handful of points is where most of the change happens and a
        // post with thousands of points does not look the same as one with hundreds.
        float level = (float) (Math.log10(1 + magnitude) / Math.log10(1 + FULL_TINT_SCORE));
        float amount = MIN_TINT + (1 - MIN_TINT) * level;

        builder.s(new ForegroundColorSpan(blend(i.x(), tint, amount)), start, coloredEnd, 33);
    }

    /** Mixes [amount] of [to] into [from], keeping the result opaque. */
    private static int blend(int from, int to, float amount) {
        float rest = 1 - amount;
        return Color.rgb(
                Math.round(Color.red(from) * rest + Color.red(to) * amount),
                Math.round(Color.green(from) * rest + Color.green(to) * amount),
                Math.round(Color.blue(from) * rest + Color.blue(to) * amount)
        );
    }
}
