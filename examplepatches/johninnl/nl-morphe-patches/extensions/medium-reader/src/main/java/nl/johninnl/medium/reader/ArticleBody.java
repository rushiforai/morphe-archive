package nl.johninnl.medium.reader;

import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Editorial data only. Native account/entitlement objects never enter the reader store. */
public final class ArticleBody {
    public final String postId;
    public final String title;
    public final URI canonicalUrl;
    public final String sourceUpdatedAt;
    public final List<Block> blocks;
    public final List<String> notices;

    public ArticleBody(String postId, String title, URI canonicalUrl, String sourceUpdatedAt, List<Block> blocks) {
        this(postId, title, canonicalUrl, sourceUpdatedAt, blocks, Collections.emptyList());
    }
    public ArticleBody(String postId, String title, URI canonicalUrl, String sourceUpdatedAt, List<Block> blocks, List<String> notices) {
        this.postId = postId; this.title = title; this.canonicalUrl = canonicalUrl;
        this.sourceUpdatedAt = sourceUpdatedAt; this.blocks = immutable(blocks);
        this.notices = immutable(notices);
    }

    private static <T> List<T> immutable(List<T> source) {
        return Collections.unmodifiableList(new ArrayList<>(source));
    }

    public static final class Block {
        public final String type;
        public final String text;
        public final List<Markup> markups;
        public final Image image;
        public final String language;
        public Block(String type, String text, List<Markup> markups, Image image, String language) {
            this.type = type; this.text = text; this.markups = immutable(markups);
            this.image = image; this.language = language;
        }
    }

    public static final class Markup {
        public final String type;
        public final int start;
        public final int end;
        public final String href;
        public Markup(String type, int start, int end, String href) {
            this.type = type; this.start = start; this.end = end; this.href = href;
        }
    }

    public static final class Image {
        public final String id;
        public final URI url;
        public final String alt;
        public final int width;
        public final int height;
        public Image(String id, URI url, String alt, int width, int height) {
            this.id = id; this.url = url; this.alt = alt; this.width = width; this.height = height;
        }
    }
}
