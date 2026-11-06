/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.EnumSet;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/** When the footer switches leave a button or the counts out of a post's footer, and when they don't. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostFooterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void everyPatchIsIn() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        PostFooter.forgetAnswersForTests();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.HIDE_NOTE_COUNTS.resetToDefault();
        Settings.HIDE_LIKE_BUTTON.resetToDefault();
        Settings.HIDE_REBLOG_BUTTON.resetToDefault();
        Settings.HIDE_COMMENT_BUTTON.resetToDefault();
        Settings.HIDE_SHARE_BUTTON.resetToDefault();
        Settings.HIDE_SAVE_BUTTON.resetToDefault();
        PostFooter.forgetAnswersForTests();
        PauseForTests.resume();
        HookStatus.clear();
    }

    @Test
    public void eachButtonSwitchHidesOnlyItsOwnButton() {
        Settings.HIDE_REBLOG_BUTTON.save(true);
        Settings.HIDE_SHARE_BUTTON.save(true);

        assertFalse("its switch is off", PostFooter.hideLikeButton());
        assertTrue(PostFooter.hideReblogButton());
        assertFalse("its switch is off", PostFooter.hideCommentButton());
        assertTrue(PostFooter.hideShareButton());
        assertTrue(PostFooter.hideShareButton());
        assertEquals("the buttons don't touch the counts", 12, PostFooter.noteCount(12));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("reblog button hidden 1"));
        assertTrue(report, report.contains("share button hidden 2"));
    }

    @Test
    public void theSaveSwitchHidesTheSaveButtonAndKeepsItsAnswerUntilTumblrRestarts() {
        assertFalse("it starts off", PostFooter.hideSaveButton());
        PostFooter.forgetAnswersForTests();

        Settings.HIDE_SAVE_BUTTON.save(true);
        assertTrue(PostFooter.hideSaveButton());
        assertFalse("the other buttons have their own switches", PostFooter.hideShareButton());
        Settings.HIDE_SAVE_BUTTON.save(false);
        assertTrue("the footer Compose drew keeps its buttons", PostFooter.hideSaveButton());

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("save button hidden 2"));

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.SHARE_BUTTON));
        PostFooter.forgetAnswersForTests();
        Settings.HIDE_SAVE_BUTTON.save(true);
        assertFalse("its hook isn't in this build", PostFooter.hideSaveButton());
    }

    @Test
    public void theCountsSwitchLeavesACommunityReactionItsEmojiWithoutItsCount() {
        String reacted = "😂🔥 1234";
        assertEquals("its switch is off", reacted, PostFooter.communityReactionsText(reacted, 1234));

        Settings.HIDE_NOTE_COUNTS.save(true);
        assertEquals("😂🔥", PostFooter.communityReactionsText(reacted, 1234));
        assertEquals("a reaction nobody else made yet", "❤️", PostFooter.communityReactionsText("❤️ 1", 1));
        assertEquals("text that doesn't end in its count is Tumblr's", "❤️ 12",
                PostFooter.communityReactionsText("❤️ 12", 2));
        assertNull("nothing to change", PostFooter.communityReactionsText(null, 3));

        Settings.HIDE_NOTE_COUNTS.save(false);
        assertEquals("read each time", reacted, PostFooter.communityReactionsText(reacted, 1234));

        Settings.HIDE_NOTE_COUNTS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.LIKE_BUTTON));
        assertEquals("its hook isn't in this build", reacted, PostFooter.communityReactionsText(reacted, 1234));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("reaction count hidden 2"));
    }

    @Test
    public void aButtonKeepsItsFirstAnswerUntilTumblrRestarts() {
        Settings.HIDE_LIKE_BUTTON.save(true);
        assertTrue(PostFooter.hideLikeButton());
        Settings.HIDE_LIKE_BUTTON.save(false);
        assertTrue("the footer Compose drew keeps its buttons", PostFooter.hideLikeButton());

        assertFalse("another button has its own answer", PostFooter.hideCommentButton());
        Settings.HIDE_COMMENT_BUTTON.save(true);
        assertFalse(PostFooter.hideCommentButton());

        PostFooter.forgetAnswersForTests();
        assertFalse("the next start reads the switch again", PostFooter.hideLikeButton());
        assertTrue(PostFooter.hideCommentButton());
    }

    @Test
    public void theCountsSwitchBlanksEveryCountAndShowsAtOnce() {
        Settings.HIDE_NOTE_COUNTS.save(true);
        assertEquals(0, PostFooter.noteCount(12));
        assertEquals(0, PostFooter.noteCount(1));
        assertEquals("zero is already blank", 0, PostFooter.noteCount(0));
        assertFalse("the counts don't touch the buttons", PostFooter.hideLikeButton());

        Settings.HIDE_NOTE_COUNTS.save(false);
        assertEquals("the switch is read for each count", 12, PostFooter.noteCount(12));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("count hidden 2"));
    }

    @Test
    public void theCountsSwitchPutsAWordInPlaceOfTheCommunityAndNotesCounts() {
        assertEquals("3 comments", PostFooter.communityCommentsText("3 comments"));
        assertEquals("12 notes", PostFooter.notesTitle("12 notes"));

        Settings.HIDE_NOTE_COUNTS.save(true);
        assertEquals("the test app has no Tumblr word, so HushTumblr's", "Comments",
                PostFooter.communityCommentsText("3 comments"));
        assertEquals("Notes", PostFooter.notesTitle("12 notes"));
        assertNull("nothing to swap", PostFooter.notesTitle(null));
        assertEquals("the footer's own counts still go to zero", 0, PostFooter.noteCount(5));

        Settings.HIDE_NOTE_COUNTS.save(false);
        assertEquals("read each time", "3 comments", PostFooter.communityCommentsText("3 comments"));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("comment count hidden 1"));
        assertTrue(report, report.contains("notes count hidden 1"));
    }

    @Test
    public void theCountsSwitchBlanksTheNotesTabsAndIsReadEachTime() {
        assertFalse(PostFooter.hideNotesTabCounts());

        Settings.HIDE_NOTE_COUNTS.save(true);
        assertTrue(PostFooter.hideNotesTabCounts());
        assertTrue("every tab asks", PostFooter.hideNotesTabCounts());

        Settings.HIDE_NOTE_COUNTS.save(false);
        assertFalse("read each time the tabs are drawn", PostFooter.hideNotesTabCounts());

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("notes tab count hidden 2"));
    }

    @Test
    public void theBoldedCountGoesBlankOnlyWhenItsTextWentToTheWord() {
        PostFooter.communityCommentsText("3 comments");
        assertEquals("the text is Tumblr's, so is its count", "3", PostFooter.textCount("3"));

        Settings.HIDE_NOTE_COUNTS.save(true);
        assertEquals("Comments", PostFooter.communityCommentsText("1,234 comments"));
        assertEquals("nothing for Tumblr's bold to land on", "", PostFooter.textCount("1,234"));

        PostFooter.communityCommentsText(null);
        assertEquals("no text, nothing swapped", "5", PostFooter.textCount("5"));

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.LIKE_BUTTON));
        assertEquals("4 comments", PostFooter.communityCommentsText("4 comments"));
        assertEquals("its hook isn't in this build", "4", PostFooter.textCount("4"));
    }

    @Test
    public void aMissingTumblrWordFallsBackToHushTumblrs() {
        assertEquals("Notes", PostFooter.tumblrLabel(null, PostFooter.NOTES_LABEL, () -> "Notes"));
        Context context = RuntimeEnvironment.getApplication();
        assertEquals("Comments", PostFooter.tumblrLabel(context, "no_such_string_here", () -> "Comments"));
    }

    @Test
    public void eachButtonSwitchHidesItsOwnControlsInACommunityFooter() {
        Settings.HIDE_LIKE_BUTTON.save(true);
        Settings.HIDE_SHARE_BUTTON.save(true);
        CommunityFooter footer = new CommunityFooter();

        PostFooter.hideCommunityReactions(footer.root);
        PostFooter.hideCommunityComments(footer.root);
        PostFooter.hideCommunityShare(footer.root);

        assertEquals("a reaction in its row", View.GONE, footer.reaction.getVisibility());
        assertEquals(View.GONE, footer.otherReaction.getVisibility());
        assertEquals(View.GONE, footer.addReaction.getVisibility());
        assertEquals("its switch is off", View.VISIBLE, footer.comments.getVisibility());
        assertEquals(View.GONE, footer.sharing.getVisibility());
        assertEquals("the row the reactions sit in stays", View.VISIBLE, footer.reactions.getVisibility());
        assertEquals("anything else stays", View.VISIBLE, footer.other.getVisibility());

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("community reactions hidden 1"));
        assertTrue(report, report.contains("community share button hidden 1"));
        assertFalse(report, report.contains("community comment button hidden"));
    }

    @Test
    public void aCommunityFooterGetsTheAnswerTheComposeButtonGot() {
        Settings.HIDE_COMMENT_BUTTON.save(true);
        assertTrue(PostFooter.hideCommentButton());
        Settings.HIDE_COMMENT_BUTTON.save(false);

        CommunityFooter footer = new CommunityFooter();
        PostFooter.hideCommunityComments(footer.root);
        assertEquals("the answer holds until Tumblr restarts", View.GONE, footer.comments.getVisibility());

        PostFooter.forgetAnswersForTests();
        CommunityFooter next = new CommunityFooter();
        PostFooter.hideCommunityComments(next.root);
        assertEquals(View.VISIBLE, next.comments.getVisibility());
        PostFooter.hideCommunityComments(null);
    }

    @Test
    public void aCommunityFooterIsTumblrsWhileTheSwitchesAreOffOrTheHookIsOut() {
        CommunityFooter footer = new CommunityFooter();
        PostFooter.hideCommunityReactions(footer.root);
        PostFooter.hideCommunityComments(footer.root);
        PostFooter.hideCommunityShare(footer.root);
        assertEquals(View.VISIBLE, footer.reaction.getVisibility());
        assertEquals(View.VISIBLE, footer.comments.getVisibility());
        assertEquals(View.VISIBLE, footer.sharing.getVisibility());

        Settings.HIDE_SHARE_BUTTON.save(true);
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.LIKE_BUTTON));
        PostFooter.hideCommunityShare(footer.root);
        assertEquals("its hook isn't in this build", View.VISIBLE, footer.sharing.getVisibility());
    }

    @Test
    public void aCommentInTheNotesLosesItsOwnCountsWithTheSwitchAndGetsThemBackWithout() {
        assertEquals("off, the comment shows Tumblr's count", 33, PostFooter.commentCount(33));

        Settings.HIDE_NOTE_COUNTS.save(true);
        assertEquals(0, PostFooter.commentCount(33));
        assertEquals("a liked comment's count goes too", 0, PostFooter.commentCount(34));
        assertEquals("zero is already Tumblr's Reply label", 0, PostFooter.commentCount(0));

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals("paused", 6, PostFooter.commentCount(6));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertEquals("a cold start", 6, PostFooter.commentCount(6)));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.LIKE_BUTTON));
        assertEquals("its hook isn't in this build", 6, PostFooter.commentCount(6));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.NOTE_COUNTS));

        Settings.HIDE_NOTE_COUNTS.save(false);
        assertEquals("the next bind shows the real count", 33, PostFooter.commentCount(33));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("comment card count hidden 2"));
        assertFalse("the footer's own tally is apart", report.contains(": count hidden") || report.contains(", count hidden"));
    }

    @Test
    public void aCommentsButtonsTellTalkBackNoCountWithTheSwitchAndTumblrsOwnWithout() {
        View replies = new View(RuntimeEnvironment.getApplication());
        replies.setContentDescription("3 replies");
        PostFooter.commentRepliesDescription(replies);
        assertEquals("off, the reply button keeps Tumblr's description", "3 replies", replies.getContentDescription());
        assertEquals("off, the like button keeps Tumblr's", "3 likes", PostFooter.commentLikesDescription("3 likes"));

        Settings.HIDE_NOTE_COUNTS.save(true);
        PostFooter.commentRepliesDescription(replies);
        assertNull("the count it had before goes, and TalkBack reads the Reply label", replies.getContentDescription());
        PostFooter.commentRepliesDescription(replies);
        PostFooter.commentRepliesDescription(null);
        assertEquals("the test app has no Tumblr word, so HushTumblr's", "Like", PostFooter.commentLikesDescription("0 likes"));
        assertNull("nothing to swap", PostFooter.commentLikesDescription(null));

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        replies.setContentDescription("4 replies");
        PostFooter.commentRepliesDescription(replies);
        assertEquals("paused", "4 replies", replies.getContentDescription());
        assertEquals("paused", "4 likes", PostFooter.commentLikesDescription("4 likes"));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> {
            PostFooter.commentRepliesDescription(replies);
            assertEquals("a cold start", "4 likes", PostFooter.commentLikesDescription("4 likes"));
        });
        assertEquals("a cold start", "4 replies", replies.getContentDescription());
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.LIKE_BUTTON));
        PostFooter.commentRepliesDescription(replies);
        assertEquals("its hook isn't in this build", "4 replies", replies.getContentDescription());
        assertEquals("its hook isn't in this build", "4 likes", PostFooter.commentLikesDescription("4 likes"));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.NOTE_COUNTS));

        Settings.HIDE_NOTE_COUNTS.save(false);
        assertEquals("read each bind", "5 likes", PostFooter.commentLikesDescription("5 likes"));

        String report = String.join("\n", HookStatus.report());
        assertTrue("only a description that was there is counted", report.contains("comment reply description cleared 1"));
        assertTrue(report, report.contains("comment like description swapped 1"));
    }

    @Test
    public void everySwitchStartsOffSoTheFooterIsTumblrs() {
        assertEquals(7, PostFooter.noteCount(7));
        assertFalse(PostFooter.hideLikeButton());
        assertFalse(PostFooter.hideReblogButton());
        assertFalse(PostFooter.hideCommentButton());
        assertFalse(PostFooter.hideShareButton());
        assertFalse(PostFooter.hideSaveButton());
        assertFalse(PostFooter.hideNotesTabCounts());
    }

    @Test
    public void pauseABuildWithoutTheHookOrAColdStartLeavesTheNotesTabsAlone() {
        Settings.HIDE_NOTE_COUNTS.save(true);

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertFalse(PostFooter.hideNotesTabCounts());
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertFalse(PostFooter.hideNotesTabCounts()));
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.LIKE_BUTTON));
        assertFalse("its hook isn't in this build", PostFooter.hideNotesTabCounts());
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.NOTE_COUNTS));
        assertTrue(PostFooter.hideNotesTabCounts());
    }

    @Test
    public void pauseABuildWithoutTheHookOrAColdStartLeavesTheFooterAlone() {
        Settings.HIDE_NOTE_COUNTS.save(true);
        Settings.HIDE_LIKE_BUTTON.save(true);

        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertEquals(9, PostFooter.noteCount(9));
        assertFalse(PostFooter.hideLikeButton());
        PauseForTests.resume();
        PostFooter.forgetAnswersForTests();

        SettingsContextRule.withoutContext(() -> {
            assertEquals(9, PostFooter.noteCount(9));
            assertFalse(PostFooter.hideLikeButton());
        });
        assertTrue("before the settings were ready nothing was kept", PostFooter.hideLikeButton());
        assertEquals(0, PostFooter.noteCount(9));
        PostFooter.forgetAnswersForTests();

        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.LIKE_BUTTON));
        assertEquals("its hook isn't in this build", 9, PostFooter.noteCount(9));
        assertTrue(PostFooter.hideLikeButton());
        PostFooter.forgetAnswersForTests();
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.NOTE_COUNTS));
        assertEquals(0, PostFooter.noteCount(9));
        assertFalse("its hook isn't in this build", PostFooter.hideLikeButton());
        Settings.HIDE_NOTE_COUNTS.save(true);
        PatchFamilyForTests.capabilities(EnumSet.of(PatchFamily.Capability.LIKE_BUTTON));
        assertEquals("its hook isn't in this build", "4 comments", PostFooter.communityCommentsText("4 comments"));
    }

    /**
     * Stands in for a community post's footer: the reactions in a row of their own, the add reaction,
     * comment and share buttons, and a view that's none of them. The stand-ins share Tumblr's class
     * names, which is what the hooks go by.
     */
    private static final class CommunityFooter {
        final LinearLayout root;
        final LinearLayout reactions;
        final View reaction;
        final View otherReaction;
        final View addReaction;
        final View comments;
        final View sharing;
        final View other;

        CommunityFooter() {
            Context context = RuntimeEnvironment.getApplication();
            root = new LinearLayout(context);
            reactions = new LinearLayout(context);
            reaction = new CommunitiesReactionControl(context);
            otherReaction = new CommunitiesReactionControl(context);
            reactions.addView(reaction);
            reactions.addView(otherReaction);
            addReaction = new CommunitiesAddReactionControl(context);
            comments = new CommunitiesCommentsControl(context);
            sharing = new CommunitiesSharingControl(context);
            other = new View(context);
            root.addView(reactions);
            root.addView(addReaction);
            root.addView(comments);
            root.addView(sharing);
            root.addView(other);
        }
    }

    private static final class CommunitiesReactionControl extends FrameLayout {
        CommunitiesReactionControl(Context context) {
            super(context);
        }
    }

    private static final class CommunitiesAddReactionControl extends FrameLayout {
        CommunitiesAddReactionControl(Context context) {
            super(context);
        }
    }

    private static final class CommunitiesCommentsControl extends FrameLayout {
        CommunitiesCommentsControl(Context context) {
            super(context);
        }
    }

    private static final class CommunitiesSharingControl extends FrameLayout {
        CommunitiesSharingControl(Context context) {
            super(context);
        }
    }
}
