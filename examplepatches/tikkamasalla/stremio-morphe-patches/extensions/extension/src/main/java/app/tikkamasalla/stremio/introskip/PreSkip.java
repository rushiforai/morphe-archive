package app.tikkamasalla.stremio.introskip;

/**
 * Pure decision for the pre-frame skip (no Android classes), unit tested standalone
 * (standalone PreSkipTest): may an auto-skip seek fire before the first moving picture?
 *
 * <p>An auto-skip whose segment starts at 0:00 used to fire about a second into playback
 * (the poll waits for steady playing), so the viewer saw the intro start, then a frozen
 * picture while the seek re-buffered. When the segment is already known before playback
 * has ever moved - still buffering, or held paused at the start position - the same seek
 * can fire at once: the player only ever decodes from the segment end, under the loading
 * screen. Nothing ever waits for this: no prepare hold, no delay. Data that lands after
 * motion starts keeps the normal auto-skip.
 *
 * <p>Thresholds. EPISODE_START_MAX_S (5 s) is a scope limit only: a segment may
 * pre-skip at all only when it begins within the first 5 s, far below a real cold
 * open (30 s and up), which must be watched. It never lets playback at 0:00 jump
 * into a later-starting segment: LEAD_S (0.5 s) separately requires the start
 * position to sit no more than 0.5 s before the segment start, so from 0:00 only
 * a segment starting at or before 0.5 s can fire, and one starting at 2 s keeps
 * the normal auto-skip after 2 s of picture. The 5 s bound matters when playback
 * (re)starts inside the segment (a resume at or inside its start). LEAD_S exists
 * because sources disagree by about half a second at a 0:00 boundary (the engine
 * already tolerates 0.4 s at a segment end); more lead would skip content nobody
 * asked to skip. MIN_REMAIN_S mirrors the engine's 3 s guard (an auto-skip with
 * under 3 s to jump is not worth a seek).
 */
final class PreSkip {
    /** Scope: a segment may pre-skip only when it starts within this of 0:00 (LEAD_S gates firing from 0:00). */
    static final double EPISODE_START_MAX_S = 5.0;
    /** The start position may sit this far before the segment start (source jitter at 0:00). */
    static final double LEAD_S = 0.5;
    /** The segment counts as over this far before its end (same margin as segmentAt). */
    static final double END_MARGIN_S = 0.4;
    /** Under this much segment left, playing through beats a seek (the engine's 3 s guard). */
    static final double MIN_REMAIN_S = 3.0;
    /** The position may drift this far from the start position and still count as "not moved". */
    static final double STILL_TOL_S = 0.5;

    // SkipPlayer playback states (Media3 numbering), mirrored so this class stays pure.
    static final int STATE_BUFFERING = 2;
    static final int STATE_READY = 3;

    private PreSkip() {
    }

    /**
     * Null when the pre-frame seek may fire, else the reason it may not (for logs and tests).
     * Every input is a primitive snapshot taken by the caller on the main thread: the
     * settings and segment filters are evaluated by the engine's own wantsAuto/segmentAt
     * rules and passed in as {@code typeEnabled}/{@code autoWanted}, so this decision can
     * never widen what the normal auto-skip would do. {@code initialPos} < 0 = unknown.
     * {@code durationSec} <= 0 = unknown (no EOF cap then, as in segmentAt).
     */
    static String denyReason(boolean media3, boolean enabled, boolean movieOrUnresolved,
                             boolean typeEnabled, boolean autoWanted, boolean alreadySkipped,
                             boolean attempted, boolean everPlayed, boolean userSeeked, int state,
                             double segStart, double segEnd, double pos, double initialPos,
                             double durationSec) {
        if (!media3) return "engine";
        if (!enabled) return "disabled";
        if (movieOrUnresolved) return "movie";
        if (attempted) return "attempted";
        if (alreadySkipped) return "already-skipped";
        if (!typeEnabled) return "type-off";
        if (!autoWanted) return "not-auto";
        if (state != STATE_BUFFERING && state != STATE_READY) return "state";
        if (everPlayed) return "playing";
        if (userSeeked) return "user-seek";
        if (!(segEnd > segStart) || segStart < 0 || pos != pos) return "bad-segment";
        if (segStart > EPISODE_START_MAX_S) return "not-at-start";
        if (initialPos < 0) return "no-initial";
        if (Math.abs(pos - initialPos) > STILL_TOL_S) return "moved";
        if (pos < segStart - LEAD_S) return "before-segment";
        double limit = segEnd - END_MARGIN_S;
        if (durationSec > 0) limit = Math.min(limit, durationSec - 1.25);
        if (pos >= limit) return "past-segment";
        if (segEnd - pos < MIN_REMAIN_S) return "under-3s";
        return null;
    }
}
