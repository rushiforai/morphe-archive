/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.Date;

/**
 * What a save knows of its post, read off Facebook's tree models by the hashes their own code
 * uses and the accessors Redex keeps: the owner's name, then the first actor's; the creation
 * time, then the creation story's. A model that isn't a tree, or whose tree is gone, gives
 * nothing and is never read natively.
 */
public class PostDetailsTest {
    private static final long SECONDS = 1_756_728_000L;

    private static TreeJNI actor(String name) {
        return new TreeJNI().with("name", name);
    }

    /** The hashes are the ones Facebook's generated getters load, the Java hash of the GraphQL name. */
    @Test
    public void theFieldsAreReadByTheHashesFacebooksOwnGettersLoad() {
        assertEquals("owner".hashCode(), PostDetails.OWNER);
        assertEquals("actors".hashCode(), PostDetails.ACTORS);
        assertEquals("name".hashCode(), PostDetails.NAME);
        assertEquals("creation_time".hashCode(), PostDetails.CREATION_TIME);
        assertEquals("creation_story".hashCode(), PostDetails.CREATION_STORY);
        assertEquals(3373707, PostDetails.NAME);
        assertEquals(TreeJNI.class.getName(), PostDetails.TREE);
    }

    @Test
    public void thePosterIsTheOwnerAndThenTheFirstActor() {
        TreeJNI video = new TreeJNI().with("owner", actor("Page Owner"));
        TreeJNI post = new TreeJNI().with("actors", Arrays.asList(actor("First Actor"), actor("Second Actor")));
        assertEquals("Page Owner", PostDetails.ownerOf(video));
        assertEquals("First Actor", PostDetails.ownerOf(post));
        assertEquals("Page Owner", PostDetails.read("1", video, post).owner);
        assertEquals("First Actor", PostDetails.read("1", post, video).owner);
        assertEquals("First Actor", PostDetails.read("1", new TreeJNI(), post).owner);
        // An owner without a name doesn't hide the actors, and a blank name is no name.
        TreeJNI both = new TreeJNI().with("owner", new TreeJNI()).with("actors", Collections.singletonList(actor("Actor")));
        assertEquals("Actor", PostDetails.ownerOf(both));
        assertNull(PostDetails.ownerOf(new TreeJNI().with("owner", actor("  "))));
        assertNull(PostDetails.ownerOf(new TreeJNI().with("actors", Collections.<TreeJNI>emptyList())));
        assertNull(PostDetails.ownerOf(new TreeJNI()));
        // Like Facebook's own first-actor helper, an actor without a name is passed over.
        TreeJNI nameless = new TreeJNI().with("actors", Arrays.asList(new TreeJNI(), actor(" "), actor("Named Actor")));
        assertEquals("Named Actor", PostDetails.ownerOf(nameless));
    }

    /** A reel whose story names no actor still has its short-form video's owner. */
    @Test
    public void aReelFallsBackToItsShortFormVideosOwner() {
        TreeJNI reel = new TreeJNI().with("short_form_video_context",
                new TreeJNI().with("video_owner", actor("Reel Owner"))).with("creation_time", SECONDS);
        assertEquals("Reel Owner", PostDetails.ownerOf(reel));
        assertEquals("Actor", PostDetails.ownerOf(reel.with("actors", Collections.singletonList(actor("Actor")))));
        assertNull(PostDetails.ownerOf(new TreeJNI().with("short_form_video_context", new TreeJNI())));
        // A released context is never read.
        TreeJNI context = new TreeJNI().with("video_owner", actor("Reel Owner"));
        context.releasedTree();
        assertNull(PostDetails.ownerOf(new TreeJNI().with("short_form_video_context", context)));
        assertFalse(context.readAfterRelease);
    }

    @Test
    public void thePostDayIsTheCreationTimeAndThenTheCreationStorys() {
        TreeJNI post = new TreeJNI().with("creation_time", SECONDS);
        TreeJNI video = new TreeJNI().with("creation_story", new TreeJNI().with("creation_time", SECONDS + 60));
        assertEquals(new Date(SECONDS * 1000), PostDetails.postedOf(post));
        assertEquals(new Date((SECONDS + 60) * 1000), PostDetails.postedOf(video));
        assertEquals(new Date(SECONDS * 1000), PostDetails.read("1", video.with("creation_time", SECONDS), post).posted);
        assertNull(PostDetails.postedOf(new TreeJNI()));
        assertNull(PostDetails.postedOf(new TreeJNI().with("creation_time", 0L)));
        assertNull(PostDetails.postedOf(new TreeJNI().with("creation_time", -5L)));
    }

    @Test
    public void aReleasedTreeGivesNothingAndIsNeverReadNatively() {
        TreeJNI gone = new TreeJNI().with("owner", actor("Page Owner")).with("creation_time", SECONDS);
        gone.releasedTree();
        PostDetails details = PostDetails.read("1", gone);
        assertNull(details.owner);
        assertNull(details.posted);
        assertFalse("a released tree was read", gone.readAfterRelease);
        // A released actor under a live post gives no name either.
        TreeJNI actor = actor("Page Owner");
        actor.releasedTree();
        assertNull(PostDetails.ownerOf(new TreeJNI().with("owner", actor)));
        assertFalse(actor.readAfterRelease);
    }

    @Test
    public void whatIsntATreeGivesNothing() {
        assertNull(PostDetails.ownerOf("a string"));
        assertNull(PostDetails.ownerOf(new Object()));
        assertNull(PostDetails.ownerOf(null));
        assertNull(PostDetails.postedOf(null));
        PostDetails none = PostDetails.read("1", "x", null, new Object());
        assertEquals("1", none.videoId);
        assertNull(none.owner);
        assertNull(none.posted);
        assertTrue(none.hasVideoId());
        assertFalse(none.hasOwner());
        assertFalse(none.hasPosted());
        assertTrue(PostDetails.treesIn(new Object()).isEmpty());
        assertTrue(PostDetails.treesIn(null).isEmpty());
    }

    /**
     * A card's kept getTimestamp is its own tree's creation_time in milliseconds, so it's the post
     * time, and the tree with that creation time is the card's story. Another tree the card holds
     * lends no poster, even one read first.
     */
    @Test
    public void aStoryCardIsReadThroughTheTreeItsTimestampComesFrom() {
        TreeJNI story = new TreeJNI().with("actors", Collections.singletonList(actor("Story Teller"))).with("creation_time", SECONDS);
        TreeJNI decoy = new TreeJNI().with("owner", actor("Music Owner")).with("creation_time", SECONDS - 3600);
        PostDetails read = PostDetails.ofCard("1", new SubCard("id", story, decoy, SECONDS * 1000));
        assertEquals("the tree read first isn't the card's story", Arrays.<Object>asList(decoy, story),
                PostDetails.treesIn(new SubCard("id", story, decoy, SECONDS * 1000)));
        assertEquals("Story Teller", read.owner);
        assertEquals(new Date(SECONDS * 1000), read.posted);

        // No tree has the card's time: the time stands, and nobody is named.
        PostDetails unmatched = PostDetails.ofCard("1", new SubCard("id", decoy, new TreeJNI(), SECONDS * 1000));
        assertNull(unmatched.owner);
        assertEquals(new Date(SECONDS * 1000), unmatched.posted);

        // No timestamp: a card of one tree is read from it, a card of two from neither.
        PostDetails single = PostDetails.ofCard("1", new Card("id", story, 0));
        assertEquals("Story Teller", single.owner);
        assertEquals(new Date(SECONDS * 1000), single.posted);
        PostDetails two = PostDetails.ofCard("1", new SubCard("id", story, decoy, 0));
        assertNull(two.owner);
        assertNull(two.posted);

        assertNull(PostDetails.ofCard("1", new Card("id", new TreeJNI(), 0)).posted);
        assertNull(PostDetails.ofCard("1", new Card("id", null, 0)).posted);
        assertNull(PostDetails.ofCard("1", null).posted);
        assertNull(PostDetails.ofCard("1", new Object()).posted);
        assertNull(PostDetails.ofCard("1", new Object()).owner);

        // The trees come in declaration order, the parent's after the card's own.
        assertEquals(Arrays.<Object>asList(story), PostDetails.treesIn(new Card("id", story, 0)));
    }

    @Test
    public void theOwnerIsCleanedLikeAFolderNameAndBounded() {
        assertEquals("a_b", new PostDetails(null, " a/b ", null).owner);
        assertEquals("Stevi Ous", new PostDetails(null, "Stevi Ous", null).owner);
        assertNull(new PostDetails(null, "", null).owner);
        assertNull(new PostDetails(null, " . ", null).owner);
        assertNull(new PostDetails(null, null, null).owner);
        String emoji = new String(Character.toChars(0x1F3AC));
        StringBuilder many = new StringBuilder();
        for (int i = 0; i < 80; i++) many.append(emoji);
        String bounded = new PostDetails(null, many.toString(), null).owner;
        assertEquals(FileNameTemplate.MAX_OWNER_CODE_POINTS, bounded.codePointCount(0, bounded.length()));
        assertEquals(PostDetails.NONE, PostDetails.of(null));
        assertEquals("12", PostDetails.of("12").videoId);
        assertFalse(PostDetails.of("x/1").hasVideoId());
    }

    /** A details object can land in a diagnostic line, so it never says who or which. */
    @Test
    public void toStringNamesNothing() {
        String text = new PostDetails("1234567890123456", "Stevi Ous", new Date(SECONDS * 1000)).toString();
        assertFalse(text, text.contains("Stevi") || text.contains("1234567890123456") || text.contains("2026"));
        assertTrue(text, text.contains("known"));
        assertTrue(PostDetails.NONE.toString().contains("unknown"));
    }

    static class Card {
        final String id;
        final TreeJNI tree;
        final long millis;

        Card(String id, TreeJNI tree, long millis) {
            this.id = id;
            this.tree = tree;
            this.millis = millis;
        }

        public long getTimestamp() {
            return millis;
        }
    }

    /** A card holding a second tree in a field of its own, which the walk reads before the parent's. */
    static final class SubCard extends Card {
        final TreeJNI own;

        SubCard(String id, TreeJNI tree, TreeJNI own, long millis) {
            super(id, tree, millis);
            this.own = own;
        }
    }
}
