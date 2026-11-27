package app.jimaku.extension.jobs;

/** A job's step, by the gateway's names. Downloading reads "getting ready" to the viewer. */
public enum JobState {
    WAITING("waiting"), DOWNLOADING("downloading"), TRANSCRIBING("transcribing"), TRANSLATING("translating"), DONE("done"), FAILED("failed");

    public final String wire;

    JobState(String wire) {
        this.wire = wire;
    }

    /** The state the gateway names, or null for a name it doesn't use. */
    public static JobState of(String name) {
        for (JobState state : values()) if (state.wire.equals(name)) return state;
        return null;
    }

    public boolean ended() {
        return this == DONE || this == FAILED;
    }
}
