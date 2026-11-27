package app.jimaku.extension.gateway;

/** What came back from a stop: the seconds refunded, and whether the transcript paid for is kept. */
public final class StoppedJob {
    public final double refunded;
    /** The transcript is finished and kept: every language of the video is then a free translation. */
    public final boolean keptTranscript;

    public StoppedJob(double refunded, boolean keptTranscript) {
        this.refunded = refunded;
        this.keptTranscript = keptTranscript;
    }
}
