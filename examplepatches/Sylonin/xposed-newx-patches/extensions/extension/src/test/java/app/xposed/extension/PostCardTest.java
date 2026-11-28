package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import java.time.Instant;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PostCardTest {
    private static final List<String[]> NO_LINKS = Collections.emptyList();

    @Test
    public void textIsCutToTheDisplayRangeInCodePointsAndLinksAreExpanded() {
        // "@alice " is 7 code points; the emoji is one code point but two chars.
        String text = "@alice \uD83D\uDE00 see https://t.co/abc https://t.co/pic";
        List<String[]> links = Collections.singletonList(new String[]{"https://t.co/abc", "https://example.com/page"});
        assertEquals("\uD83D\uDE00 see https://example.com/page", PostCard.displayText(text, 7, 29, links));
    }

    @Test
    public void textRangesAreClampedAsXClampsThem() {
        assertEquals("hello", PostCard.displayText("hello", 0, 99, NO_LINKS));
        assertEquals("", PostCard.displayText("hello", 4, 2, NO_LINKS));
        assertEquals("", PostCard.displayText("hello", 9, 12, NO_LINKS));
        assertEquals("whole text", PostCard.displayText(" whole text ", -1, -1, NO_LINKS));
        assertEquals("", PostCard.displayText(null, 0, 3, NO_LINKS));
    }

    @Test
    public void linksWithoutADestinationStayAsTheyAre() {
        List<String[]> links = Arrays.asList(new String[]{"https://t.co/a", null}, new String[]{null, "https://x.org"});
        assertEquals("see https://t.co/a", PostCard.displayText("see https://t.co/a", -1, -1, links));
    }

    @Test
    public void datesAreUtcInXPosedsFormat() {
        long millis = Instant.parse("2026-03-05T04:07:09Z").toEpochMilli();
        assertEquals("5 Mar 2026 \u00B7 04:07 UTC", PostCard.formatUtc(millis, false));
        assertEquals("5 Mar 2026 \u00B7 04:07:09 UTC", PostCard.formatUtc(millis, true));
    }

    @Test
    public void countsComeFromWhicheverStateOfTheActionXGave() {
        Map<String, Long> counts = new HashMap<>();
        counts.put("Unfavorite", 40L);
        counts.put("Reply", 0L);
        assertEquals(40, PostCard.count(counts, "Favorite", "Unfavorite"));
        assertEquals(0, PostCard.count(counts, "Reply"));
        assertEquals(-1, PostCard.count(counts, "ViewCount"));
    }

    @Test
    public void theMediaNoteSaysWhatTheCardLeavesOut() {
        assertNull(PostCard.mediaNote(2, 2, 0, 0));
        assertEquals("Showing 4 of 5 photos.", PostCard.mediaNote(4, 5, 0, 0));
        assertEquals("A photo marked as sensitive is not shown. A video or GIF is not shown.", PostCard.mediaNote(0, 0, 1, 1));
        assertEquals("2 photos marked as sensitive are not shown. 3 videos or GIFs are not shown.", PostCard.mediaNote(1, 1, 2, 3));
    }

    @Test
    public void photosAreAskedForAsMediumJpegsFromXsImageServerOnly() {
        assertEquals("https://pbs.twimg.com/media/AbC_d-1?format=jpg&name=medium",
                PostCard.photoUrl("https://pbs.twimg.com/media/AbC_d-1.png"));
        assertEquals("https://pbs.twimg.com/media/AbC?format=jpg&name=medium",
                PostCard.photoUrl("https://pbs.twimg.com/media/AbC?format=png&name=small"));
        assertNull(PostCard.photoUrl("http://pbs.twimg.com/media/AbC.jpg"));
        assertNull(PostCard.photoUrl("https://example.com/media/AbC.jpg"));
        assertNull(PostCard.photoUrl("https://pbs.twimg.com/profile_images/1/a.jpg"));
        assertNull(PostCard.photoUrl(null));
    }

    @Test
    public void theCaptionNamesTheLocationWhenXGivesOne() {
        assertEquals("X lists this account\u2019s location as Germany. (via X-Posed)", PostCard.caption("Germany"));
        assertEquals("Account information reported by X. (via X-Posed)", PostCard.caption("Unknown"));
        assertEquals("Account information reported by X. (via X-Posed)", PostCard.caption(null));
    }

    @Test
    public void onlyANewPostMentionsTheAccountAtTheEnd() {
        assertEquals("Look. @alice", PostCard.composerText(PostCard.Mode.POST, " Look. ", "alice"));
        assertEquals("@alice", PostCard.composerText(PostCard.Mode.POST, "", "alice"));
        assertEquals("Look.", PostCard.composerText(PostCard.Mode.QUOTE, "Look. ", "alice"));
        assertEquals("Look.", PostCard.composerText(PostCard.Mode.REPLY, "Look.", "alice"));
    }

    @Test
    public void fileNamesAreSafe() {
        assertEquals("x-posed-alice_1-123.png", PostCard.fileName("alice_1", 123));
        assertEquals("x-posed-post-5.png", PostCard.fileName("../", 5));
    }
}
