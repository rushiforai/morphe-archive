package app.jimaku.extension.jobs;

/** What a job makes, by the gateway's names: a transcript and its translation, a translation of a cached transcript, or Standard. */
public enum JobKind {
    PREMIUM("premium"), TRANSLATE("translate"), CAPTIONS("captions");

    public final String wire;

    JobKind(String wire) {
        this.wire = wire;
    }

    /** The kind the gateway names, or null for a name it doesn't use. */
    public static JobKind of(String name) {
        for (JobKind kind : values()) if (kind.wire.equals(name)) return kind;
        return null;
    }
}
