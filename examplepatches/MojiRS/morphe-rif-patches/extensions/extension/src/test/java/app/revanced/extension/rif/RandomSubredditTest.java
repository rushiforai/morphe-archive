package app.revanced.extension.rif;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class RandomSubredditTest {

    @Test
    public void recognisesRandomListings() {
        assertEquals(Boolean.FALSE, RandomSubreddit.randomKind("/r/random"));
        assertEquals(Boolean.FALSE, RandomSubreddit.randomKind("/r/random/"));
        assertEquals(Boolean.FALSE, RandomSubreddit.randomKind("/r/random/new/.json"));
        assertEquals(Boolean.FALSE, RandomSubreddit.randomKind("/r/Random/hot"));
        assertEquals(Boolean.FALSE, RandomSubreddit.randomKind("/r/random.json"));
        assertEquals(Boolean.FALSE, RandomSubreddit.randomKind("/r/random/top.json"));
        assertEquals(Boolean.TRUE, RandomSubreddit.randomKind("/r/randnsfw/rising/.json"));
        assertEquals(Boolean.TRUE, RandomSubreddit.randomKind("/r/randnsfw"));
    }

    @Test
    public void ignoresEverythingElse() {
        assertNull(RandomSubreddit.randomKind(null));
        assertNull(RandomSubreddit.randomKind(""));
        assertNull(RandomSubreddit.randomKind("/r/randomstuff/hot"));
        assertNull(RandomSubreddit.randomKind("/r/randomstuff"));
        assertNull(RandomSubreddit.randomKind("/r/random/about.json"));
        assertNull(RandomSubreddit.randomKind("/r/random/comments/abc/title/"));
        assertNull(RandomSubreddit.randomKind("/r/pics/hot"));
        assertNull(RandomSubreddit.randomKind("/user/random/submitted"));
        assertNull(RandomSubreddit.randomKind("/random"));
        assertNull(RandomSubreddit.randomKind("/r/all/random"));
    }

    @Test
    public void swapsTheName() {
        assertEquals("/r/woahdude/new/.json", RandomSubreddit.swapPath("/r/random/new/.json", "woahdude"));
        assertEquals("/r/woahdude", RandomSubreddit.swapPath("/r/random", "woahdude"));
        assertEquals("/r/woahdude.json", RandomSubreddit.swapPath("/r/random.json", "woahdude"));
        assertEquals("/r/iso8601/hot", RandomSubreddit.swapPath("/r/randnsfw/hot", "iso8601"));
        assertNull(RandomSubreddit.swapPath("/r/pics/hot", "woahdude"));
    }

    @Test
    public void parsesTheReply() {
        assertEquals("woahdude", RandomSubreddit.parseName("{\"url\":\"/r/woahdude/\"}"));
        assertEquals("30rock", RandomSubreddit.parseName("{ \"url\" : \"\\/r\\/30rock\\/\" }"));
        assertEquals("a_b", RandomSubreddit.parseName("{\"url\":\"/r/a_b\"}"));
    }

    @Test
    public void rejectsBadReplies() {
        assertNull(RandomSubreddit.parseName(null));
        assertNull(RandomSubreddit.parseName(""));
        assertNull(RandomSubreddit.parseName("<html>error</html>"));
        assertNull(RandomSubreddit.parseName("{\"url\":\"/u/someone/\"}"));
        assertNull(RandomSubreddit.parseName("{\"url\":\"/r/a/b/../c\"}"));
        assertNull(RandomSubreddit.parseName("{\"error\":\"x\"}"));
    }
}
