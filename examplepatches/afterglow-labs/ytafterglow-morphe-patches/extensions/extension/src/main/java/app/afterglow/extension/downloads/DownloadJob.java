package app.afterglow.extension.downloads;

/** Detached queue snapshot. Byte totals can be unknown (-1); progress is then -1. */
public final class DownloadJob {
    public enum State { QUEUED, RUNNING, PAUSED, WAITING_FOR_DELIVERY, SUCCEEDED, FAILED, CANCELLED }
    public enum Phase { METADATA, EXTRACTION, VIDEO_TRANSFER, AUDIO_TRANSFER, CAPTIONS_TRANSFER,
        THUMBNAIL_TRANSFER, MUX, LIBRARY_MOVE, SHARE, FINISHED }
    public final String id, errorMessage, outputItemId;
    public final DownloadRequest request;
    public final State state;
    public final Phase phase;
    public final long bytesTransferred, totalBytes, createdAt, updatedAt;
    public final float progress;
    public final int retryCount;
    DownloadJob(String id, DownloadRequest request, State state, Phase phase, long bytes, long total,
                long created, long updated, String error, String output, int retryCount) {
        this.id=id; this.request=request.copy(); this.state=state; this.phase=phase;
        bytesTransferred=bytes; totalBytes=total; createdAt=created; updatedAt=updated;
        errorMessage=error; outputItemId=output; this.retryCount=retryCount;
        progress=state == State.SUCCEEDED ? 1f : total > 0 ? Math.min(1f,(float)bytes/total) : -1f;
    }
    public boolean isTerminal() { return state==State.SUCCEEDED || state==State.FAILED || state==State.CANCELLED; }
}
