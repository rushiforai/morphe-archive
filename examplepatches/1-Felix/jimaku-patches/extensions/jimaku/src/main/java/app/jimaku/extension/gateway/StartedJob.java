package app.jimaku.extension.gateway;

import app.jimaku.extension.jobs.JobKind;
import app.jimaku.extension.jobs.JobState;

/** The gateway's answer to a start: the job, what it makes, where it stands, and whether this install joined one already running. */
public final class StartedJob {
    public final String job;
    public final JobKind kind;
    public final JobState state;
    public final Double percent;
    /** Joined a job another install started, and so paid nothing for it. */
    public final boolean joined;

    public StartedJob(String job, JobKind kind, JobState state, Double percent, boolean joined) {
        this.job = job;
        this.kind = kind;
        this.state = state;
        this.percent = percent;
        this.joined = joined;
    }
}
