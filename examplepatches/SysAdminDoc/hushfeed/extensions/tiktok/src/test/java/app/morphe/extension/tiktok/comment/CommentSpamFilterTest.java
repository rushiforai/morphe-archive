/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.comment;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * Hide spam comments (#187) drops bot comments that send the reader somewhere else, and keeps
 * ordinary talk, your own comments and anything the creator stands behind.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CommentSpamFilterTest {
    /** Stands in for the comment model, with the fields the spam filter reads. */
    public static class Comment {
        public String text = "";
        public boolean authorPin;
        public boolean isAuthorDigged;
        public String labelText;
        public List<Object> replyComments;
        public User user;
    }

    /** Stands in for the profile model. */
    public static class User {
        public String uid;
        public String secUid;

        User(String uid) {
            this.uid = uid;
        }
    }

    /** Stands in for CommentItemList. */
    public static class ItemList {
        List<Object> items;

        ItemList(List<Object> items) {
            this.items = items;
        }
    }

    private static Comment says(String text) {
        Comment comment = new Comment();
        comment.text = text;
        comment.user = new User("someone");
        return comment;
    }

    @Before
    public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        Settings.HIDE_SPAM_COMMENTS.save(false);
        Settings.HIDE_COMMENT_MEDIA.save(false);
        Settings.HIDE_COMMENT_POLLS.save(false);
        Settings.HIDE_COMMENT_REPLY_PREVIEWS.save(false);
        Settings.COMMENT_KEYWORD_FILTER.save(false);
        CommentTools.signedInUserIdForTests = null;
        HookStatus.clear();
    }

    @After
    public void tearDown() {
        Settings.HIDE_SPAM_COMMENTS.save(false);
        CommentTools.signedInUserIdForTests = null;
        HookStatus.clear();
    }

    @Test
    public void botShapesAreSpam() {
        for (String text : Arrays.asList(
                "Check my bio 🔥",
                "omg LINK IN BIO",
                "visit   my profile for more",
                "go to my profile babe",
                "free followers here",
                "f4f anyone?",
                "dm me on telegram @cashking",
                "WhatsApp +1 555 0100",
                "earn daily at quickcash . com",
                "quickcash(dot)com",
                "https://bit.example/x",
                "join t.me/somechannel",
                "mira mi perfil",
                "link na bio",
                "profilime bak",
                "ссылка в профиле",
                // A zero-width space slipped between the words to dodge word filters.
                "check" + (char) 0x200B + " my bio")) {
            assertTrue(text, SpamComments.looksLikeSpam(text));
        }
    }

    @Test
    public void ordinaryTalkIsNot() {
        for (String text : Arrays.asList(
                "",
                "this is so true",
                "I agree. Me too",
                "you can see my profile picture is a cat lol",
                "she quit onlyfans years ago",
                "I use telegram 24/7",
                "the dot com bubble was wild",
                "what's in his bio?",
                "biology class flashbacks",
                "great link between the two scenes",
                "free time is the best time")) {
            assertFalse(text, SpamComments.looksLikeSpam(text));
        }
        assertFalse(SpamComments.looksLikeSpam(null));
    }

    @Test
    public void spamGoesAndPeopleStay() {
        Settings.HIDE_SPAM_COMMENTS.save(true);

        Comment person = says("this made my day");
        Comment bot = says("Check my bio for the full video");
        Comment linker = says("cheap coins at coinz.xyz");

        ItemList page = new ItemList(new ArrayList<>(Arrays.asList(person, bot, linker)));
        CommentTools.onCommentListLoaded(page);

        assertEquals(Collections.singletonList(person), page.items);
    }

    @Test
    public void spamRepliesGoFromUnderAKeptComment() {
        Settings.HIDE_SPAM_COMMENTS.save(true);

        Comment reply = says("hey");
        Comment botReply = says("link in bio");
        Comment parent = says("anyone know the song?");
        parent.replyComments = new ArrayList<>(Arrays.asList(reply, botReply));

        ItemList page = new ItemList(new ArrayList<>(Collections.singletonList(parent)));
        CommentTools.onCommentListLoaded(page);

        assertEquals(Collections.singletonList(parent), page.items);
        assertEquals(Collections.singletonList(reply), parent.replyComments);
    }

    @Test
    public void whatTheCreatorBacksAndYourOwnStay() {
        // A creator pointing to their own bio for part 2 is not spam to their viewers, and your
        // own comment vanishing would read as it having failed to send.
        Settings.HIDE_SPAM_COMMENTS.save(true);
        CommentTools.signedInUserIdForTests = "me-1";

        Comment pinned = says("link in bio for part 2");
        pinned.authorPin = true;
        Comment liked = says("check my profile, I made a cover");
        liked.isAuthorDigged = true;
        Comment byCreator = says("link in bio");
        byCreator.labelText = "Creator";
        Comment mine = says("check my bio");
        mine.user = new User("me-1");
        Comment bot = says("check my bio");

        ItemList page = new ItemList(new ArrayList<>(
                Arrays.asList(pinned, liked, byCreator, mine, bot)));
        CommentTools.onCommentListLoaded(page);

        assertEquals(Arrays.asList(pinned, liked, byCreator, mine), page.items);
    }

    @Test
    public void switchedOffNothingGoes() {
        Comment bot = says("link in bio");
        ItemList page = new ItemList(new ArrayList<>(Collections.singletonList(bot)));

        CommentTools.onCommentListLoaded(page);

        assertEquals(Collections.singletonList(bot), page.items);
    }
}
