package app.jimaku.extension.session;

import app.jimaku.extension.jobs.JobKind;

/** The job this install started and still waits on, so going back to its video picks it up, as the extension's {@code PendingJob}. */
public final class PendingJob {
    public final String job;
    public final String video;
    public final String lang;
    public final JobKind kind;
    public final String title;
    /** Joined a job another install started, and so paid nothing for it. */
    public final boolean joined;

    public PendingJob(String job, String video, String lang, JobKind kind, String title, boolean joined) {
        this.job = job;
        this.video = video;
        this.lang = lang;
        this.kind = kind;
        this.title = title != null ? title : "";
        this.joined = joined;
    }
}
