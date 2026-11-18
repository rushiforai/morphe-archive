package nl.johninnl.medium.reader;

/** A failed article attempt; its stable code is safe for local status/diagnostics. */
public final class ArticleException extends Exception {
    public final String code;
    public ArticleException(String code, String message) { super(message); this.code = code; }
    public ArticleException(String code, String message, Throwable cause) { super(message, cause); this.code = code; }
}
