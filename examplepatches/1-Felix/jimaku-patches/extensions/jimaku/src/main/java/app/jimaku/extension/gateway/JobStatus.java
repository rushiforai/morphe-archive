package app.jimaku.extension.gateway;

import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.jobs.JobState;

/** Where a job stands, as the gateway answers a check. */
public final class JobStatus {
    public final String job;
    public final String video;
    public final JobKind kind;
    public final String lang;
    public final JobState state;
    public final Double percent;
    /** Why a failed job failed, by the gateway's code, or null. */
    public final String reason;

    public JobStatus(String job, String video, JobKind kind, String lang, JobState state, Double percent, String reason) {
        this.job = job;
        this.video = video;
        this.kind = kind;
        this.lang = lang;
        this.state = state;
        this.percent = percent;
        this.reason = reason;
    }
}
