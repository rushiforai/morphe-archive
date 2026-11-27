package app.ayham.extension.music.addons;

/**
 * A failed addon call. kind: "miss" (404, an error field: next source, not a fault), "down" (5xx,
 * timeout, network, 429), "error" (other 4xx, a bad body: permanent), "limit" (§4a stream budget:
 * not a fault). The message never holds a link, only its host.
 */
public final class AddonError extends RuntimeException {
    public final String kind;
    public final Integer status;
    public final Double retryAfterSec;

    public AddonError(String kind, String message) {
        this(kind, message, null, null);
    }

    public AddonError(String kind, String message, Integer status, Double retryAfterSec) {
        super(Protocol.scrub(message));
        this.kind = kind;
        this.status = status;
        this.retryAfterSec = retryAfterSec;
    }
}
