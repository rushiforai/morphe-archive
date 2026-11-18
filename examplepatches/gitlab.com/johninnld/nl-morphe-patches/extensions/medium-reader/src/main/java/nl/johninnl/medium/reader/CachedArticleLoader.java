package nl.johninnl.medium.reader;

import java.io.IOException;
import java.time.Instant;
import java.time.format.DateTimeParseException;

/** Stores editorial data separately from the app's authenticated query/download caches. */
public final class CachedArticleLoader implements ArticleLoader {
    private final MirrorClient mirror;
    private final BodyCache cache;
    private final java.util.concurrent.atomic.AtomicLong epoch = new java.util.concurrent.atomic.AtomicLong();
    public CachedArticleLoader(MirrorClient mirror, BodyCache cache) { this.mirror = mirror; this.cache = cache; }
    @Override public long cacheEpoch() { return epoch.get(); }
    public java.net.URI origin() { return mirror.origin(); }
    public synchronized boolean isStored(ReaderArticle article) { return article.cacheKey != null && cache.get(article.cacheKey) != null; }
    public synchronized void clear() throws IOException { epoch.incrementAndGet(); cache.clear(); }
    public java.util.List<BodyCache.Entry> saved() throws IOException { return cache.saved(); }
    public void saveNative(ArticleBody body, String revision, long expectedEpoch) throws IOException {
        synchronized (this) {
            if (epoch.get() == expectedEpoch) cache.put(BodyCache.key(body.postId, revision == null ? "unknown" : revision, java.net.URI.create("https://medium.com/")), body);
        }
    }

    @Override public ReaderArticle load(ArticleRequest request, Cancellation cancellation) throws ArticleException {
        cancellation.check();
        BodyCache.Key key = BodyCache.key(request.postId, request.revision, mirror.origin());
        BodyCache.Entry entry;
        long startedEpoch;
        synchronized (this) { startedEpoch = epoch.get(); entry = cache.get(key); }
        if (entry != null) {
            cancellation.check();
            return new ReaderArticle(entry.body, true, entry.fetchedAtMillis, sameRevision(entry.body, request.mediumUpdatedAt), older(entry.body, request.mediumUpdatedAt), startedEpoch, key);
        }
        ArticleBody body = mirror.fetch(request.postId, request.mediumUrl, cancellation);
        cancellation.check();
        long fetchedAt = System.currentTimeMillis();
        synchronized (this) {
            if (epoch.get() == startedEpoch) try { cache.put(key, body); } catch (IOException unavailable) { /* Keep readable network content. */ }
        }
        cancellation.check();
        return new ReaderArticle(body, false, fetchedAt, sameRevision(body, request.mediumUpdatedAt), older(body, request.mediumUpdatedAt), startedEpoch, key);
    }
    private static Long sourceTime(ArticleBody body) {
        if (body.sourceUpdatedAt == null) return null;
        try { return Instant.parse(body.sourceUpdatedAt).toEpochMilli(); }
        catch (DateTimeParseException unknown) { return null; }
    }
    private static boolean older(ArticleBody body, Long expected) {
        Long actual = sourceTime(body);
        return actual != null && expected != null && expected > 0 && actual < expected;
    }
    private static boolean sameRevision(ArticleBody body, Long expected) {
        Long actual = sourceTime(body); return actual != null && actual.equals(expected);
    }
}
