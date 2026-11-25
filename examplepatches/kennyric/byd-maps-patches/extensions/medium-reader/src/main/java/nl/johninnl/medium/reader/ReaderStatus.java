package nl.johninnl.medium.reader;

public final class ReaderStatus {
    public interface Sink { void publish(ReaderStatus status); }
    public final String postId;
    public final String phase;
    public final String code;
    public final ReaderArticle article;
    public ReaderStatus(String postId, String phase, String code, ReaderArticle article) {
        this.postId = postId; this.phase = phase; this.code = code; this.article = article;
    }
}
