package app.afterglow.extension.playback;

/** A user lock request may wait briefly for native fullscreen, for this video only. */
public final class OverlayLockRequest {
    public static final int CANCEL = -1, WAIT = 0, APPLY = 1;
    private Object owner;
    private String video;
    private long deadline;

    public void begin(Object owner, String video, long now) {
        cancel();
        if (owner == null || video == null || video.isEmpty()) return;
        this.owner = owner;
        this.video = video;
        deadline = now + 2000;
    }

    public boolean pending() { return owner != null; }

    public int advance(Object owner, String video, long now, boolean foreground,
                       boolean enabled, boolean fullscreen) {
        if (!pending() || this.owner != owner || !this.video.equals(video)
                || now >= deadline || !foreground || !enabled) {
            cancel();
            return CANCEL;
        }
        if (!fullscreen) return WAIT;
        cancel();
        return APPLY;
    }

    public void cancel() { owner = null; video = null; deadline = 0; }
}
