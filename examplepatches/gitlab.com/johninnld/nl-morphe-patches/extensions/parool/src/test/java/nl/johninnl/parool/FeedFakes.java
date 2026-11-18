package nl.johninnl.parool;

import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Local page/block/content fakes mirroring the getters the feed walk uses. */
final class FeedFakes {
    private FeedFakes() {}

    static Object page(Object... groups) {
        List<Object> components = new ArrayList<Object>();
        Collections.addAll(components, groups);
        return new Page(components);
    }

    static final class Page {
        private final List<Object> components;

        Page(List<Object> components) {
            this.components = components;
        }

        public List<Object> getPageComponents() {
            return components;
        }
    }

    static Object group(Object... blocks) {
        List<Object> list = new ArrayList<Object>();
        Collections.addAll(list, blocks);
        return new nl.persgroep.edition.overview.domain.model.OverviewPageComponent.Group(list);
    }

    static Object block(Object... items) {
        List<Object> list = new ArrayList<Object>();
        Collections.addAll(list, items);
        return new Block(list);
    }

    static final class Block {
        private final List<Object> items;

        Block(List<Object> items) {
            this.items = items;
        }

        public List<Object> getItems() {
            return items;
        }
    }

    static Object article(String urn, String title, String image, boolean premium, Long durationMs, ZonedDateTime published) {
        return new ContentItem(new Tts(urn, title, image, premium, durationMs), published);
    }

    static Object articleWithoutTts(ZonedDateTime published) {
        return new ContentItem(null, published);
    }

    static final class ContentItem {
        private final Tts textToSpeech;
        private final ZonedDateTime publicationDateTime;

        ContentItem(Tts textToSpeech, ZonedDateTime publicationDateTime) {
            this.textToSpeech = textToSpeech;
            this.publicationDateTime = publicationDateTime;
        }

        public Tts getTextToSpeech() {
            return textToSpeech;
        }

        public ZonedDateTime getPublicationDateTime() {
            return publicationDateTime;
        }
    }

    static final class Tts {
        private final String articleUrn;
        private final String title;
        private final String imageUrl;
        private final boolean isPremium;
        private final Long durationMs;

        Tts(String articleUrn, String title, String imageUrl, boolean isPremium, Long durationMs) {
            this.articleUrn = articleUrn;
            this.title = title;
            this.imageUrl = imageUrl;
            this.isPremium = isPremium;
            this.durationMs = durationMs;
        }

        public String getArticleUrn() {
            return articleUrn;
        }

        public String getTitle() {
            return title;
        }

        public String getImageUrl() {
            return imageUrl;
        }

        public boolean getIsPremium() {
            return isPremium;
        }

        public Long getDurationMs() {
            return durationMs;
        }
    }
}
