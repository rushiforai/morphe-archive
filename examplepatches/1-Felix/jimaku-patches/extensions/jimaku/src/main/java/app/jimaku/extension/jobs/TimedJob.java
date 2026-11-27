package app.jimaku.extension.jobs;

/** A running job as the estimate needs it: its step, its percent, and when Jimaku saw it get there. */
public final class TimedJob {
    /** How far a translation had come when Jimaku saw it, and when, in ms. */
    public static final class Sample {
        public final double at;
        public final double percent;

        public Sample(double at, double percent) {
            this.at = at;
            this.percent = percent;
        }
    }

    public final JobKind kind;
    public final JobState state;
    /** Null until the job reports one. */
    public final Double percent;
    /** When Jimaku saw the job reach its current step, in ms. */
    public final double since;
    /** The first percent Jimaku saw it translate at, and the latest, each when it first showed. */
    public final Sample first;
    public final Sample last;

    public TimedJob(JobKind kind, JobState state, Double percent, double since, Sample first, Sample last) {
        this.kind = kind;
        this.state = state;
        this.percent = percent;
        this.since = since;
        this.first = first;
        this.last = last;
    }
}
