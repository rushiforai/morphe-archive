package app.afterglow.extension.playback;

/** Main-thread visibility transitions, including synchronous native callbacks. */
public final class OverlayPauseSession {
    private boolean changing, observed, visible;
    private long revision;

    public boolean begin(boolean enabled, boolean available, long revision, boolean visible) {
        if (changing) return false;
        if (!enabled || !available) {
            observed = false;
            return false;
        }
        if (observed && this.revision == revision && this.visible == visible) return false;
        this.revision = revision;
        this.visible = visible;
        observed = true;
        changing = true;
        return true;
    }

    /** A temporarily unavailable native player may retry on its next update. */
    public void end(boolean accepted) {
        if (!accepted) observed = false;
        changing = false;
    }
}
