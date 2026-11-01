package patches.bright;

/** Explicit transport/parse outcomes; a typed document exists only for FULL. */
public final class ArticleResult {

    public enum Outcome {
        FULL,
        DEFER_TO_PUBLISHER,
        AUTH_REJECTED,
        UNSUPPORTED_CONTENT,
        NETWORK_ERROR,
        CANCELLED
    }

    public final Outcome outcome;
    public final ArticleDocument document;
    /** Non-sensitive reason code for diagnostics; never contains bodies or secrets. */
    public final String reason;

    private ArticleResult(Outcome outcome, ArticleDocument document, String reason) {
        this.outcome = outcome;
        this.document = document;
        this.reason = reason;
    }

    public static ArticleResult full(ArticleDocument document) {
        return new ArticleResult(Outcome.FULL, document, null);
    }

    public static ArticleResult defer(Outcome outcome, String reason) {
        if (outcome == Outcome.FULL) {
            throw new IllegalArgumentException("FULL requires a document");
        }
        return new ArticleResult(outcome, null, reason);
    }

    public boolean isFull() {
        return outcome == Outcome.FULL && document != null;
    }
}
