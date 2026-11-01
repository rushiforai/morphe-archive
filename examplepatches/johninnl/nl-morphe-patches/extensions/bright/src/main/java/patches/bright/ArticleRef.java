package patches.bright;

/** A typed, validated reference to one publisher article. Immutable. */
public final class ArticleRef {

    public final long id;
    public final String url;

    private ArticleRef(long id, String url) {
        this.id = id;
        this.url = url;
    }

    /** Positive numeric id and a non-empty canonical https URL. */
    public static ArticleRef create(long id, String url) {
        if (id <= 0) {
            return null;
        }
        if (url == null || url.isEmpty() || !url.startsWith("https://")) {
            return null;
        }
        return new ArticleRef(id, url);
    }

    @Override
    public boolean equals(Object other) {
        if (!(other instanceof ArticleRef)) {
            return false;
        }
        ArticleRef ref = (ArticleRef) other;
        return id == ref.id && url.equals(ref.url);
    }

    @Override
    public int hashCode() {
        return (int) (id ^ (id >>> 32)) * 31 + url.hashCode();
    }

    @Override
    public String toString() {
        return "article " + id;
    }
}
