package patches.bright;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.net.URI;

/**
 * Ordered typed article content. Only audited block shapes are modeled;
 * anything else must fail parsing as UNSUPPORTED_CONTENT rather than being
 * silently dropped.
 */
public final class ArticleDocument {

    public enum BlockType {RICH_TEXT, IMAGE, VIDEO, RELATED}

    /** One related link; destination stays a publisher https URL. */
    public static final class Related {
        public final String url;
        public final String title;

        Related(String url, String title) {
            this.url = url;
            this.title = title;
        }
    }

    public static final class Block {
        public final BlockType type;
        /** richTextBlock html, sanitized at render time; never null for RICH_TEXT. */
        public final String html;
        /** Image source or optional video poster (https only); null when absent. */
        public final String imageUrl;
        /** Reviewed public MP4 source; null for non-video blocks. */
        public final String videoUrl;
        /** Publisher alternative text; null when absent. */
        public final String imageAlt;
        /** image caption/credit; null when absent. */
        public final String caption;
        /** relatedBlock heading; null when absent. */
        public final String title;
        /** relatedBlock links; empty for non-related blocks. */
        public final List<Related> related;

        Block(BlockType type, String html, String imageUrl, String caption, String title, List<Related> related) {
            this(type, html, imageUrl, caption, title, related, null);
        }

        Block(BlockType type, String html, String imageUrl, String caption, String title,
              List<Related> related, String imageAlt) {
            this(type, html, imageUrl, caption, title, related, imageAlt, null);
        }

        private Block(BlockType type, String html, String imageUrl, String caption, String title,
                      List<Related> related, String imageAlt, String videoUrl) {
            this.type = type;
            this.html = html;
            this.imageUrl = imageUrl;
            this.videoUrl = videoUrl;
            this.imageAlt = imageAlt;
            this.caption = caption;
            this.title = title;
            this.related = related == null
                    ? Collections.<Related>emptyList()
                    : Collections.unmodifiableList(new ArrayList<Related>(related));
        }

        /** Accept only the observed public Bright object-store MP4 route. */
        static Block video(String url, String poster, String title) {
            try {
                URI uri = new URI(url);
                if (!"https".equals(uri.getScheme()) || !"objectstore.true.nl".equals(uri.getHost())
                        || uri.getRawUserInfo() != null || uri.getRawQuery() != null || uri.getRawFragment() != null
                        || (uri.getPort() != -1 && uri.getPort() != 443)
                        || !uri.getRawPath().matches("/digitalenterprises:bright/[A-Za-z0-9_-]+\\.mp4")) {
                    return null;
                }
                return new Block(BlockType.VIDEO, null, poster, null, title, null, null, url);
            } catch (Exception malformed) {
                return null;
            }
        }
    }

    public final long id;
    public final String title;
    public final String canonicalUrl;
    /** Optional lead image from the article's root image metadata. */
    public final Block heroImage;
    private final List<Block> blocks;

    public ArticleDocument(long id, String title, String canonicalUrl, List<Block> blocks) {
        this(id, title, canonicalUrl, blocks, null);
    }

    public ArticleDocument(long id, String title, String canonicalUrl, List<Block> blocks, Block heroImage) {
        this.id = id;
        this.title = title == null ? "" : title;
        this.canonicalUrl = canonicalUrl == null ? "" : canonicalUrl;
        this.heroImage = heroImage;
        this.blocks = Collections.unmodifiableList(new ArrayList<Block>(blocks));
    }

    public List<Block> blocks() {
        return blocks;
    }

    /** Rendered body must cover every block; a zero-block document is never full. */
    public boolean isRenderable() {
        return !blocks.isEmpty();
    }
}
