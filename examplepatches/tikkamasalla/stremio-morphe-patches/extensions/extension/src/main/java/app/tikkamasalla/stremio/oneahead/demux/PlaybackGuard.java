package app.tikkamasalla.stremio.oneahead.demux;

/**
 * The caller decides when background work must yield to the viewer. It is polled before every
 * range request, between socket reads and between decoder batches.
 */
public interface PlaybackGuard {
    /** True while the player is buffering, just started or sought, or its buffer is thin. */
    boolean shouldPause();

    /** True when the job is no longer wanted. */
    boolean isCancelled();

    /** Never pauses, never cancels. */
    PlaybackGuard NONE = new PlaybackGuard() {
        @Override
        public boolean shouldPause() {
            return false;
        }

        @Override
        public boolean isCancelled() {
            return false;
        }
    };
}
