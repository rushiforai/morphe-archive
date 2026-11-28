package app.yydarlinker.aicaptions.overlay;

import android.graphics.Rect;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;

import java.util.Locale;

/**
 * The single numerical owner of reading class, class widths and settled-width decisions. The UI
 * supplies current player/display facts and applies the result; no platform object is retained.
 */
final class CaptionPresentationDecision {
    private static final int STABLE_GEOMETRY_SAMPLES = 3;

    private CaptionPresentationDecision.Kind presentationClass;
    private int classFrameWidth, classBaseWidth, reducedVideoWidth;
    private int previousGeometryWidth, stableGeometrySamples;

    CaptionPresentationDecision.Kind currentClass() {
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
    CaptionPresentationDecision.Kind classToCommit(
            Rect video, int screenWidth, int screenHeight, boolean shorts, String playerType) {
        CaptionPresentationDecision.Kind next;
        if (!shorts && screenWidth > screenHeight && playerType.contains("SLIDING")) {
            // A slide preserves the current class; if there is none, geometry supplies the first.
            next = presentationClass;
        } else {
            next = directedClass(playerType, screenWidth, screenHeight, shorts);
        }
        if (next == null)
            next = CaptionPresentationDecision.classify(
                    presentationClass, video, screenWidth, screenHeight, shorts);
        if (presentationClass != null && next == presentationClass) {
            if (next == CaptionPresentationDecision.Kind.REDUCED) {
                int cap = Math.max(1, Math.round(
                        CaptionPresentationDecision.referenceVideoWidth(screenWidth, screenHeight)
                                * CaptionPresentationDecision.ENTER_REDUCED));
                if (video.width() > 0 && video.width() <= cap) reducedVideoWidth = video.width();
                else if (reducedVideoWidth > cap) reducedVideoWidth = 0;
            }
            return null;
        }
        return next;
    }

    /** Speculation follows the destination of a slide and never changes the committed state. */
    CaptionPresentationDecision.Kind prefetchClass(
            String type, int screenWidth, int screenHeight, boolean shorts) {
        if (shorts) return CaptionPresentationDecision.Kind.SHORTS_FULL;
        if (screenWidth <= screenHeight) return CaptionPresentationDecision.Kind.DETAIL;
        String name = type == null ? "" : type.toUpperCase(Locale.ROOT);
        return directedClass(name, screenWidth, screenHeight, false);
    }

    private static CaptionPresentationDecision.Kind directedClass(
            String type, int screenWidth, int screenHeight, boolean shorts) {
        if (shorts) return CaptionPresentationDecision.Kind.SHORTS_FULL;
        if (screenWidth <= screenHeight) return CaptionPresentationDecision.Kind.DETAIL;
        if (type.contains("FULLSCREEN")) return CaptionPresentationDecision.Kind.FULL;
        if (type.contains("MAXIMIZED")) return CaptionPresentationDecision.Kind.REDUCED;
        return null;
    }

    /**
     * Prepare the numeric commit before the UI reads the configured glyph tier, as before. FULL
     * starts a fresh reduced-width observation. The caller finishes the class after that read.
     */
    int prepareClassCommit(
            CaptionPresentationDecision.Kind next, Rect video, int screenWidth, int screenHeight,
            boolean shorts) {
        if (next == CaptionPresentationDecision.Kind.FULL) reducedVideoWidth = 0;
        int videoWidth = layoutVideoWidth(next, video, screenWidth, screenHeight);
        classFrameWidth = readingWidth(videoWidth, shorts);
        classBaseWidth = classFrameWidth;
        resetSamples();
        return videoWidth;
    }

    void finishClassCommit(CaptionPresentationDecision.Kind next) {
        presentationClass = next;
    }

    int prefetchWidth(
            CaptionPresentationDecision.Kind target, Rect video, int screenWidth, int screenHeight,
            boolean shorts) {
        return Math.min(readingWidth(layoutVideoWidth(target, video, screenWidth, screenHeight),
                shorts), screenWidth);
    }

    private int layoutVideoWidth(
            CaptionPresentationDecision.Kind kind, Rect video, int screenWidth, int screenHeight) {
        return kind == CaptionPresentationDecision.Kind.FULL
                ? CaptionPresentationDecision.referenceVideoWidth(screenWidth, screenHeight)
                : CaptionPresentationDecision.layoutVideoWidth(
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

    enum Kind {
        FULL,
        REDUCED,
        DETAIL,
        SHORTS_FULL,
        SHORTS_REDUCED
    }

    /** Reference width used by the measured detail/full glyph heights. */
    static final float REFERENCE_SHORT_SIDE_PX = 1264f;

    /** Enter REDUCED below this share of the full video width; leave above EXIT. */
    static final float ENTER_REDUCED = .80f;

    static final float EXIT_REDUCED = .82f;

    /** The aspect of the full-viewport reference width, independent of the displayed crop. */
    private static final float REFERENCE_ASPECT = 16f / 9f;

    /**
     * Classify the current viewport. [previous] is the last class (nullable); [screenWidth] and
     * [screenHeight] are the display metrics, [shorts] the verified Shorts surface.
     */
    static Kind classify(
            Kind previous,
            Rect video,
            int screenWidth,
            int screenHeight,
            boolean shorts) {
        return classify(previous, video, 0, screenWidth, screenHeight, shorts);
    }

    /**
     * [observedVideoWidth] is the video's on-screen width, which follows a player-container scale
     * even when the local rectangle does not. Comments-sheet decisions use it so the class can
     * commit at the sheet's endpoint instead of waiting for the local rectangle to be rebuilt.
     */
    static Kind classify(
            Kind previous,
            Rect video,
            int observedVideoWidth,
            int screenWidth,
            int screenHeight,
            boolean shorts) {
        if (video == null || video.width() <= 0 || video.height() <= 0)
            return previous == null ? Kind.DETAIL : previous;
        if (shorts) {
            // Shorts always reads at the detail size. Opening the comments sheet changes the
            // viewport height and position, never the reading size or the page width, so one
            // class also means one plan and no re-layout during the sheet animation.
            return Kind.SHORTS_FULL;
        }
        // Portrait watch page. A rotation can expose the old landscape-sized surface for a few
        // frames; that is not a detail viewport yet, and calling it DETAIL here captured a
        // fullscreen frame width that was later used on the 1264 px detail page.
        if (screenWidth <= screenHeight) {
            if (previous != null && video.width() > screenWidth * 1.02f) return previous;
            // A swipe from fullscreen to the detail page still shows a tall video for most of
            // the gesture. Keep the fullsize reading until the viewport has actually become the
            // short detail rectangle, so the caption cannot shrink half-way down.
            if (previous != null
                    && previous != Kind.DETAIL
                    && video.height() > screenHeight * .62f) return previous;
            return Kind.DETAIL;
        }
        int reference = referenceVideoWidth(screenWidth, screenHeight);
        int width =
                observedVideoWidth > 0
                        ? observedVideoWidth
                        : Math.max(1, video.width());
        width = Math.min(width, Math.max(1, screenWidth));
        float ratio = width / (float) reference;
        if (previous == Kind.REDUCED) return ratio >= EXIT_REDUCED ? Kind.FULL : Kind.REDUCED;
        if (previous == Kind.FULL) return ratio > ENTER_REDUCED ? Kind.FULL : Kind.REDUCED;
        return ratio <= ENTER_REDUCED ? Kind.REDUCED : Kind.FULL;
    }

    /**
     * The stable full-viewport video width: 16:9 fitted into the display. It never depends on the
     * surface's current visible height, which changes when controls or letterboxing animate.
     */
    static int referenceVideoWidth(int screenWidth, int screenHeight) {
        if (screenWidth <= screenHeight) return Math.max(1, screenWidth);
        return Math.max(
                1, Math.min(screenWidth, Math.round(screenHeight * REFERENCE_ASPECT)));
    }

    /**
     * Full-screen reading size only for a full viewport. Shorts uses the detail size, and so does
     * every reduced or portrait viewport.
     */
    static boolean detailSize(Kind kind) {
        return kind != Kind.FULL;
    }

    /**
     * Absolute glyph ink height for the class. The reference heights are physical sizes measured
     * on a 1264 px short side; scale them with the actual short side so a 1080 px phone does not
     * get a caption calibrated for a tablet.
     */
    static float glyphHeightPx(int tier, int screenWidth, int screenHeight, Kind kind) {
        float shortSide = Math.min(screenWidth, screenHeight);
        float base =
                detailSize(kind)
                        ? SubtitleStyleMetrics.detailGlyphHeightPx(tier)
                        : SubtitleStyleMetrics.fullScreenGlyphHeightPx(tier);
        return base * (shortSide / REFERENCE_SHORT_SIDE_PX);
    }

    /**
     * The video width a class should lay its pages out against. FULL uses the stable full-viewport
     * width, not a transient overscan; REDUCED uses the remembered reduced width when one exists,
     * capped at the reduced threshold; DETAIL and Shorts use the displayed video width, capped by
     * the display width so a rotated frame can never create an off-screen box.
     */
    static int layoutVideoWidth(
            Kind kind, Rect video, int screenWidth, int screenHeight, int rememberedReducedWidth) {
        int width = Math.max(1, video == null ? 1 : video.width());
        int reference = referenceVideoWidth(screenWidth, screenHeight);
        if (kind == Kind.FULL) return Math.min(width, reference);
        if (kind == Kind.REDUCED) {
            int cap = Math.max(1, Math.round(reference * ENTER_REDUCED));
            int target =
                    rememberedReducedWidth > 0
                            ? Math.min(rememberedReducedWidth, cap)
                            : Math.round(reference * .66f);
            return Math.max(1, Math.min(width, target));
        }
        return Math.max(1, Math.min(width, Math.max(1, screenWidth)));
    }

    static int physicalLeft(Rect video, int measuredOuterWidth) {
        return video.left + Math.round((video.width() - measuredOuterWidth) / 2f);
    }

    /**
     * The overlay's one placement primitive. The anchor stays at the host's padding origin and
     * every move is a translation, so a content-width change never composes a new margin with an
     * old translation (the one-frame jump the old margin/translation mix produced).
     */
    static void position(
            FrameLayout host, FrameLayout outer, int left, int top, int width, int height) {
        if (host == null || outer == null) return;
        if (outer.getLayoutDirection() != View.LAYOUT_DIRECTION_LTR)
            outer.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
        FrameLayout.LayoutParams p = (FrameLayout.LayoutParams) outer.getLayoutParams();
        int gravity = Gravity.TOP | Gravity.LEFT;
        if (p == null
                || p.width != width
                || p.height != height
                || p.gravity != gravity
                || p.leftMargin != 0
                || p.topMargin != 0
                || p.rightMargin != 0
                || p.isMarginRelative()) {
            p = new FrameLayout.LayoutParams(width, height);
            p.gravity = gravity;
            outer.setLayoutParams(p);
        }
        translate(host, outer, left, top);
    }

    /**
     * Translation-only placement. Used by the pre-draw path, where a LayoutParams change would
     * request a layout that cannot be applied until the next traversal.
     */
    static void translate(FrameLayout host, FrameLayout outer, int left, int top) {
        if (host == null || outer == null) return;
        float x = left - host.getPaddingLeft() + host.getScrollX();
        float y = top - host.getPaddingTop() + host.getScrollY();
        if (outer.getTranslationX() != x) outer.setTranslationX(x);
        if (outer.getTranslationY() != y) outer.setTranslationY(y);
    }
}
