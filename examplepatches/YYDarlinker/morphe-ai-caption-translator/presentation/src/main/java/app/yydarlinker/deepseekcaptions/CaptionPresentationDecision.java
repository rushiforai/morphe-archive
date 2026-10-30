package app.yydarlinker.deepseekcaptions;

import android.graphics.Rect;

import java.util.Locale;

/**
 * The single numerical owner of reading class, class widths and settled-width decisions. The UI
 * supplies current player/display facts and applies the result; no platform object is retained.
 */
final class CaptionPresentationDecision {
    private static final int STABLE_GEOMETRY_SAMPLES = 3;

    private CaptionPresentationClass.Kind presentationClass;
    private int classFrameWidth, classBaseWidth, reducedVideoWidth;
    private int previousGeometryWidth, stableGeometrySamples;

    CaptionPresentationClass.Kind currentClass() {
        return presentationClass;
    }

    int frameWidth() {
        return classFrameWidth;
    }

    int baseWidth() {
        return classBaseWidth;
    }

    int reducedWidth() {
        return reducedVideoWidth;
    }

    /** Returns a class only when a real commit is required; same-class REDUCED observes width. */
    CaptionPresentationClass.Kind classToCommit(
            Rect video, int screenWidth, int screenHeight, boolean shorts, String playerType) {
        CaptionPresentationClass.Kind next;
        if (!shorts && screenWidth > screenHeight && playerType.contains("SLIDING")) {
            // A slide preserves the current class; if there is none, geometry supplies the first.
            next = presentationClass;
        } else {
            next = directedClass(playerType, screenWidth, screenHeight, shorts);
        }
        if (next == null)
            next = CaptionPresentationClass.classify(
                    presentationClass, video, screenWidth, screenHeight, shorts);
        if (presentationClass != null && next == presentationClass) {
            if (next == CaptionPresentationClass.Kind.REDUCED) {
                int cap = Math.max(1, Math.round(
                        CaptionPresentationClass.referenceVideoWidth(screenWidth, screenHeight)
                                * CaptionPresentationClass.ENTER_REDUCED));
                if (video.width() > 0 && video.width() <= cap) reducedVideoWidth = video.width();
                else if (reducedVideoWidth > cap) reducedVideoWidth = 0;
            }
            return null;
        }
        return next;
    }

    /** Speculation follows the destination of a slide and never changes the committed state. */
    CaptionPresentationClass.Kind prefetchClass(
            String type, int screenWidth, int screenHeight, boolean shorts) {
        if (shorts) return CaptionPresentationClass.Kind.SHORTS_FULL;
        if (screenWidth <= screenHeight) return CaptionPresentationClass.Kind.DETAIL;
        String name = type == null ? "" : type.toUpperCase(Locale.ROOT);
        return directedClass(name, screenWidth, screenHeight, false);
    }

    private static CaptionPresentationClass.Kind directedClass(
            String type, int screenWidth, int screenHeight, boolean shorts) {
        if (shorts) return CaptionPresentationClass.Kind.SHORTS_FULL;
        if (screenWidth <= screenHeight) return CaptionPresentationClass.Kind.DETAIL;
        if (type.contains("FULLSCREEN")) return CaptionPresentationClass.Kind.FULL;
        if (type.contains("MAXIMIZED")) return CaptionPresentationClass.Kind.REDUCED;
        return null;
    }

    /**
     * Prepare the numeric commit before the UI reads the configured glyph tier, as before. FULL
     * starts a fresh reduced-width observation. The caller finishes the class after that read.
     */
    int prepareClassCommit(
            CaptionPresentationClass.Kind next, Rect video, int screenWidth, int screenHeight,
            boolean shorts) {
        if (next == CaptionPresentationClass.Kind.FULL) reducedVideoWidth = 0;
        int videoWidth = layoutVideoWidth(next, video, screenWidth, screenHeight);
        classFrameWidth = readingWidth(videoWidth, shorts);
        classBaseWidth = classFrameWidth;
        resetSamples();
        return videoWidth;
    }

    void finishClassCommit(CaptionPresentationClass.Kind next) {
        presentationClass = next;
    }

    int prefetchWidth(
            CaptionPresentationClass.Kind target, Rect video, int screenWidth, int screenHeight,
            boolean shorts) {
        return Math.min(readingWidth(layoutVideoWidth(target, video, screenWidth, screenHeight),
                shorts), screenWidth);
    }

    private int layoutVideoWidth(
            CaptionPresentationClass.Kind kind, Rect video, int screenWidth, int screenHeight) {
        return kind == CaptionPresentationClass.Kind.FULL
                ? CaptionPresentationClass.referenceVideoWidth(screenWidth, screenHeight)
                : CaptionPresentationClass.layoutVideoWidth(
                        kind, video, screenWidth, screenHeight, reducedVideoWidth);
    }

    static int readingWidth(int videoWidth, boolean shorts) {
        return Math.max(1, Math.round(videoWidth * (shorts ? .78f : .92f)));
    }

    /** Samples before all guards, exactly as the pre-draw adapter did. */
    boolean sampleStableWidth(int videoWidth, int boxWidth, boolean hasText) {
        if (videoWidth == previousGeometryWidth) stableGeometrySamples++;
        else stableGeometrySamples = 1;
        previousGeometryWidth = videoWidth;
        if (stableGeometrySamples < STABLE_GEOMETRY_SAMPLES
                || !hasText || boxWidth <= 0 || classBaseWidth <= 0) return false;
        float difference = Math.abs(videoWidth - boxWidth) / (float) boxWidth;
        return difference > .02f;
    }

    /** Stable re-planning always uses 92%, including Shorts. */
    int stableWide(int videoWidth) {
        return Math.round(videoWidth * .92f);
    }

    /** Padding precedes 8px quantization; a wide video restores the unquantized base. */
    boolean replanStableWidth(int wide, int padding) {
        int plan;
        if (wide >= classBaseWidth) plan = classBaseWidth;
        else {
            int inner = Math.max(8, ((wide - padding) / 8) * 8);
            plan = Math.min(classBaseWidth, inner + padding);
        }
        if (plan == classFrameWidth) return false;
        classFrameWidth = plan;
        stableGeometrySamples = 0;
        return true;
    }

    /** Geometry reset, class commit and same-owner reparent clear only the sampling run. */
    void resetSamples() {
        previousGeometryWidth = 0;
        stableGeometrySamples = 0;
    }

    /** A detached owner additionally forgets its class and both kinds of width memory. */
    void clear() {
        presentationClass = null;
        classFrameWidth = 0;
        classBaseWidth = 0;
        resetSamples();
        reducedVideoWidth = 0;
    }
}
