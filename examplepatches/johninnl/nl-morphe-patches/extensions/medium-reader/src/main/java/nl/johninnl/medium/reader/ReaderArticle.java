package nl.johninnl.medium.reader;

public final class ReaderArticle {
    public final ArticleBody body;
    public final boolean fromCache;
    public final long fetchedAtMillis;
    public final boolean sourceRevisionVerified;
    public final boolean olderSnapshot;
    public final long cacheEpoch;
    final BodyCache.Key cacheKey;
    public ReaderArticle(ArticleBody body, boolean fromCache, long fetchedAtMillis, boolean sourceRevisionVerified) {
        this(body, fromCache, fetchedAtMillis, sourceRevisionVerified, false);
    }
    public ReaderArticle(ArticleBody body, boolean fromCache, long fetchedAtMillis, boolean sourceRevisionVerified, boolean olderSnapshot) {
        this(body, fromCache, fetchedAtMillis, sourceRevisionVerified, olderSnapshot, 0, null);
    }
    ReaderArticle(ArticleBody body, boolean fromCache, long fetchedAtMillis, boolean sourceRevisionVerified, boolean olderSnapshot, long cacheEpoch, BodyCache.Key cacheKey) {
        this.body = body; this.fromCache = fromCache; this.fetchedAtMillis = fetchedAtMillis;
        this.sourceRevisionVerified = sourceRevisionVerified;
        this.olderSnapshot = olderSnapshot;
        this.cacheEpoch = cacheEpoch; this.cacheKey = cacheKey;
    }
}
