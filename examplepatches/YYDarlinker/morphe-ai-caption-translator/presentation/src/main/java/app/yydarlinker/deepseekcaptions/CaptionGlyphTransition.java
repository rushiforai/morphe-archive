package app.yydarlinker.deepseekcaptions;

/** Painted glyph height on a caller-supplied frame clock; owns no scheduling or Android state. */
final class CaptionGlyphTransition {
    private static final long GLYPH_TRANSITION_NANOS = 180_000_000L;
    private float displayedGlyphPx;
    private float glyphFromPx, glyphToPx;
    private long glyphStartNanos = -1;
    private boolean glyphPending;

    /** Returns whether the caller should request a frame (the caller coalesces requests). */
    boolean noteTarget(float target) {
        if (!(target > 0f)) return false;
        if (!(displayedGlyphPx > 0f)) {
            displayedGlyphPx = target;
            glyphStartNanos = -1;
            glyphPending = false;
            return false;
        }
        if (Math.abs(target - displayedGlyphPx) / displayedGlyphPx <= .02f) {
            displayedGlyphPx = target;
            glyphStartNanos = -1;
            glyphPending = false;
            return false;
        }
        // A transition already heading to this target (within the same 2% band) is not restarted:
        // a stationary step must reach its endpoint, not be re-armed by every pre-draw.
        if (glyphStartNanos >= 0
                && Math.abs(target - glyphToPx) <= .02f * Math.abs(glyphToPx)) {
            return true;
        }
        glyphFromPx = displayedGlyphPx;
        glyphToPx = target;
        glyphStartNanos = -1;
        glyphPending = true;
        return true;
    }

    /** First frame preserves the old value; later frames interpolate, returning the need for more. */
    boolean advance(long frameTimeNanos) {
        if (glyphStartNanos < 0) {
            if (!glyphPending) return false;
            glyphStartNanos = frameTimeNanos;
            glyphFromPx = displayedGlyphPx;
            glyphPending = false;
        }
        float progress =
                (frameTimeNanos - glyphStartNanos) / (float) GLYPH_TRANSITION_NANOS;
        if (progress >= 1f) {
            displayedGlyphPx = glyphToPx;
            glyphStartNanos = -1;
            return false;
        }
        displayedGlyphPx =
                glyphFromPx + (glyphToPx - glyphFromPx) * Math.max(0f, progress);
        return true;
    }

    float displayedPx() {
        return displayedGlyphPx;
    }

    void reset() {
        displayedGlyphPx = 0f;
        glyphFromPx = 0f;
        glyphToPx = 0f;
        glyphStartNanos = -1;
        glyphPending = false;
    }

    void settle() {
        displayedGlyphPx = glyphStartNanos >= 0 || glyphPending ? glyphToPx : displayedGlyphPx;
        glyphStartNanos = -1;
        glyphPending = false;
    }
}
