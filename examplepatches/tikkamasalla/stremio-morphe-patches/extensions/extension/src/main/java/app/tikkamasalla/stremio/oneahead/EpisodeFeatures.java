package app.tikkamasalla.stremio.oneahead;

/** What the detector knows about one episode's file: its windows at 4 kHz and what the caller says about it. */
public final class EpisodeFeatures {
    public final String id;
    /** Identity of the served file, for duplicate rejection: byte size and a hash of its first bytes (0 = unknown). */
    public final long fileSize, headHash;
    /** Language of the decoded audio track. Null is unknown. A reference in another language is dropped. */
    public final String language;
    /** Container duration, seconds. */
    public final double duration;
    /** Where the decoded audio really stops; 0 = not measured. */
    public final double audioEnd;
    public final boolean finale;
    public final Track head, tail;

    public EpisodeFeatures(String id, long fileSize, long headHash, String language, double duration, double audioEnd,
                           boolean finale, Track head, Track tail) {
        this.id = id;
        this.fileSize = fileSize;
        this.headHash = headHash;
        this.language = language;
        this.duration = duration;
        this.audioEnd = audioEnd;
        this.finale = finale;
        this.head = head;
        this.tail = tail;
    }

    /** Effective file end: where the audio really stops, when that was measured. A container duration can overshoot it (Blood+ e06 by 43 s, Mononoke by 1.3 s). */
    public double fileEnd() {
        return audioEnd > 0 && audioEnd < duration ? audioEnd : duration;
    }

    public boolean sameFileAs(EpisodeFeatures o) {
        return fileSize != 0 && fileSize == o.fileSize && headHash != 0 && headHash == o.headHash;
    }
}
