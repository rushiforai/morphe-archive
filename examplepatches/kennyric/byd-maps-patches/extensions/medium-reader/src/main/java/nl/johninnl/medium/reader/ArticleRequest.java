package nl.johninnl.medium.reader;

public final class ArticleRequest {
    public final String postId;
    public final String revision;
    public final Long mediumUpdatedAt;
    public final String mediumUrl;
    public ArticleRequest(String postId, String revision, Long mediumUpdatedAt) {
        this(postId, revision, mediumUpdatedAt, null);
    }
    public ArticleRequest(String postId, String revision, Long mediumUpdatedAt, String mediumUrl) {
        this.postId = postId; this.revision = revision == null ? "unknown" : revision; this.mediumUpdatedAt = mediumUpdatedAt;
        this.mediumUrl = mediumUrl;
    }
}
