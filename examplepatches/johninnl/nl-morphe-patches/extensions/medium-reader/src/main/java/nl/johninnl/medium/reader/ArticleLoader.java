package nl.johninnl.medium.reader;

public interface ArticleLoader {
    default long cacheEpoch() { return 0; }
    ReaderArticle load(ArticleRequest request, Cancellation cancellation) throws ArticleException;
}
