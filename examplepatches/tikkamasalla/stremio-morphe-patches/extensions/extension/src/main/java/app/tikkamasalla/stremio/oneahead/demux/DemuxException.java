package app.tikkamasalla.stremio.oneahead.demux;

/** Every clean failure of the fetch-and-decode path. Messages never contain a URL. */
public final class DemuxException extends Exception {
    public enum Kind {
        IO, LINK_EXPIRED, RATE_LIMITED, NO_RANGE_SUPPORT, FILE_CHANGED, BUDGET, CANCELLED,
        MALFORMED, UNSUPPORTED, NO_TRACK, DECODER_MISSING, DECODER_BUSY, DECODER_FAILED
    }

    public final Kind kind;

    public DemuxException(Kind kind, String message) {
        super(kind + ": " + message);
        this.kind = kind;
    }
}
