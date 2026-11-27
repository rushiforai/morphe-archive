package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class PostRelationsTest {
    private static final int MATCH = 1;

    private static PostRelations.Relation post(long id, String author, long replyTo, String replyToAuthor, long quote) {
        return new PostRelations.Relation(id, 0, author, null, replyTo, replyToAuthor, quote);
    }

    /** Only @spammer's posts match. */
    private static int judge(PostRelations.Relation p) {
        return "spammer".equals(p.author) ? MATCH : 0;
    }

    @Test
    public void aReplyDeepInAChainNamesTheFirstStep() {
        PostRelations relations = new PostRelations();
        relations.put(post(1, "spammer", 0, null, 0));
        relations.put(post(2, "alice", 1, "spammer", 0));
        relations.put(post(3, "bob", 2, "alice", 0));
        PostRelations.Source source = relations.find(3, PostRelationsTest::judge);
        assertNotNull(source);
        assertFalse(source.quote);
        assertEquals(MATCH, source.reasons);
    }

    @Test
    public void aQuoteOfAReplyToAFilteredPostCountsAsAQuote() {
        PostRelations relations = new PostRelations();
        relations.put(post(1, "spammer", 0, null, 0));
        relations.put(post(2, "alice", 1, "spammer", 0));
        relations.put(post(3, "bob", 0, null, 2));
        assertTrue(relations.find(3, PostRelationsTest::judge).quote);
    }

    @Test
    public void theReplyAuthorJudgesAParentThatWasNeverParsed() {
        PostRelations relations = new PostRelations();
        relations.put(post(2, "alice", 1, "spammer", 0));
        assertNotNull(relations.find(2, PostRelationsTest::judge));
        // A quoted post known only by id has no author to judge.
        relations.put(post(4, "alice", 0, null, 1));
        assertNull(relations.find(4, PostRelationsTest::judge));
    }

    @Test
    public void thePostItselfAndUnknownPostsNeverMatch() {
        PostRelations relations = new PostRelations();
        relations.put(post(1, "spammer", 0, null, 0));
        assertNull(relations.find(1, PostRelationsTest::judge));
        assertNull(relations.find(99, PostRelationsTest::judge));
    }

    @Test
    public void chainsStopAtTheDepthLimitAndLoopsEnd() {
        PostRelations relations = new PostRelations();
        long depth = PostRelations.MAX_DEPTH + 1;
        relations.put(post(1, "spammer", 0, null, 0));
        for (long id = 2; id <= depth + 1; id++) relations.put(post(id, "alice", id - 1, "alice", 0));
        assertNull(relations.find(depth + 1, PostRelationsTest::judge));
        assertNotNull(relations.find(depth, PostRelationsTest::judge));

        PostRelations loop = new PostRelations();
        loop.put(post(10, "alice", 11, "alice", 0));
        loop.put(post(11, "alice", 10, "alice", 0));
        assertNull(loop.find(10, PostRelationsTest::judge));
    }

    @Test
    public void sparseCopiesKeepWhatFullerOnesTaught() {
        PostRelations relations = new PostRelations();
        relations.put(new PostRelations.Relation(5, 50, "alice", "en", 4, "bob", 3));
        relations.put(new PostRelations.Relation(5, 0, null, null, 0, null, 0));
        PostRelations.Relation merged = relations.get(5);
        assertEquals(4, merged.replyToId);
        assertEquals("bob", merged.replyToAuthor);
        assertEquals(3, merged.quoteId);
        assertEquals("en", merged.language);
        // A different parent without an author drops the old parent's author.
        relations.put(new PostRelations.Relation(5, 0, null, null, 6, null, 0));
        assertEquals(6, relations.get(5).replyToId);
        assertNull(relations.get(5).replyToAuthor);
    }
}
