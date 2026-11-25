package com.feurstagram.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import org.junit.Test;

/**
 * The ad flag Instagram's inline media parser drives (Instagram 453 and 456: the parser calls
 * itself for carousel children), and the feed-unit tokens. Config is on its JVM defaults, which
 * are the shipping ones: ads, suggestions and Meta AI blocked.
 */
public class BlockAdFlagsTest {

    private static final Object MEDIA = new Object();

    /** One media parsed with the given field names, top level. */
    private static Object parse(String... fields) {
        Block.onMediaParseStart();
        for (String f : fields) Block.onMediaField(f);
        return Block.onMediaParseEnd(MEDIA);
    }

    @Test
    public void organicMediaPasses() {
        assertSame(MEDIA, parse("media_type", "caption", "image_versions2"));
        // Ad-sounding, but organic posts carry them: that is why the list stays narrow.
        assertSame(MEDIA, parse("should_request_ads", "is_paid_partnership"));
    }

    @Test
    public void aMediaWithTheInjectedFieldIsAnAd() {
        assertNull(parse("injected"));
        assertNull(parse("caption", "injected", "image_versions2"));
    }

    @Test
    public void aSponsoredChildFlagsItsCarousel() {
        Block.onMediaParseStart();                         // the carousel
        Block.onMediaField("carousel_media");
        Block.onMediaParseStart();                         // a slide
        Block.onMediaField("injected");
        assertNull(Block.onMediaParseEnd(MEDIA));          // the slide goes
        assertNull(Block.onMediaParseEnd(MEDIA));          // and so does the carousel around it
    }

    @Test
    public void aCleanSlideOfAnAdIsKeptUntilTheAdItself() {
        Block.onMediaParseStart();                         // the carousel, an ad
        Block.onMediaField("injected");
        Block.onMediaParseStart();                         // a slide
        Block.onMediaField("caption");
        assertSame(MEDIA, Block.onMediaParseEnd(MEDIA));   // the slide starts clean
        assertNull(Block.onMediaParseEnd(MEDIA));          // the carousel is still the ad
    }

    @Test
    public void theEnclosingFlagSurvivesDeeperNesting() {
        Block.onMediaParseStart();
        Block.onMediaField("injected");
        Block.onMediaParseStart();
        Block.onMediaParseStart();
        assertSame(MEDIA, Block.onMediaParseEnd(MEDIA));
        assertSame(MEDIA, Block.onMediaParseEnd(MEDIA));
        assertNull(Block.onMediaParseEnd(MEDIA));
    }

    @Test
    public void oneUnitNeverStainsTheNext() {
        assertNull(parse("injected"));
        assertSame(MEDIA, parse("caption"));
    }

    @Test
    public void aParseThatThrowsLeavesNoStain() {
        Block.onMediaParseStart();
        Block.onMediaField("injected");                    // this parse never reaches its end
        assertSame(MEDIA, parse("caption"));
    }

    @Test
    public void unbalancedStartsNeverUnderflow() {
        for (int i = 0; i < 200; i++) Block.onMediaParseStart();  // past the stack cap
        for (int i = 0; i < 200; i++) assertSame(MEDIA, Block.onMediaParseEnd(MEDIA));
    }

    @Test
    public void noMediaStaysNoMedia() {
        Block.onMediaParseStart();
        Block.onMediaField("injected");
        assertNull(Block.onMediaParseEnd(null));
    }

    @Test
    public void eachUnitTypeIsAnsweredOnce() {
        assertEquals("feurstagram_blocked", Block.replaceFeedItemType("ad4ad"));
        assertEquals("feurstagram_blocked", Block.replaceFeedItemType("stories_netego"));
        assertEquals("feurstagram_blocked", Block.replaceFeedItemType("vibes_in_feed_unit"));
        assertEquals("media_or_ad", Block.replaceFeedItemType("media_or_ad")); // dropping it would empty the feed
        assertEquals("media", Block.replaceFeedItemType("media"));
        assertNull(Block.replaceFeedItemType(null));
    }
}
