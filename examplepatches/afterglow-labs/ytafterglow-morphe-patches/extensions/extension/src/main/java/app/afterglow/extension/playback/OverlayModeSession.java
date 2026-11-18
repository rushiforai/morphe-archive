package app.afterglow.extension.playback;

/** App-session eye modes from the active iOS overlay presentation policy. */
public final class OverlayModeSession {
    public static final long TIMEOUT_MS = 3000;
    private int mode;
    private boolean controlsVisible = true;
    private long deadline;

    public int mode() { return mode; }
    public boolean suppressStock() { return mode != 0; }
    public boolean controlsVisible() { return controlsVisible; }
    public long deadline() { return deadline; }
    public float eyeOpacity() {
        switch (mode) {
            case 1: return .85f;
            case 2: return controlsVisible ? .65f : .16f;
            case 3: return .10f;
            default: return 1f;
        }
    }

    public void cycle(long now) {
        mode = (mode + 1) % 4;
        controlsVisible = mode != 3;
        deadline = mode == 2 ? now + TIMEOUT_MS : 0;
    }

    /** A duplicate native show must not keep extending an already visible timed row. */
    public boolean nativeShow(long now) {
        if (mode != 2 || controlsVisible) return false;
        controlsVisible = true;
        deadline = now + TIMEOUT_MS;
        return true;
    }

    public boolean timeout(long now) {
        if (mode != 2 || deadline == 0 || now < deadline) return false;
        controlsVisible = false;
        deadline = 0;
        return true;
    }

    /** Rebuilding a host reads this session; it never resets visibility or its deadline. */
    public void reset() { mode = 0; controlsVisible = true; deadline = 0; }
}
