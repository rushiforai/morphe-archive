/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.privacy;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.pinterest.settings.SettingsBackup;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;
import app.hushpinterest.extension.shared.settings.Setting;

/** #48: the list Like and comment history keeps, and the hooks that fill it. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ActivityHistoryTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final long START = 1_790_000_000_000L;

    private Context app;
    private long now = START;

    @Before public void turnedOn() {
        app = RuntimeEnvironment.getApplication();
        HookStatus.clear();
        ActivityHistory.clear(app);
        ActivityHistory.nowForTests = now;
        Settings.LIKE_COMMENT_HISTORY.save(true);
    }

    @After public void restore() {
        ActivityHistory.nowForTests = null;
        ActivityHistory.clear(app);
        Settings.LIKE_COMMENT_HISTORY.resetToDefault();
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** A pin as the hooks see Pinterest's model: an id, both media fields and maybe a title. */
    private static Map<String, Object> pin(String id, String title) {
        Map<String, Object> pin = new HashMap<>();
        pin.put("id", id);
        pin.put("images", null);
        pin.put("videos", null);
        if (title != null) pin.put("title", title);
        return pin;
    }

    private void later(long millis) {
        now += millis;
        ActivityHistory.nowForTests = now;
    }

    private List<ActivityHistory.Entry> entries() {
        List<ActivityHistory.Entry> found = ActivityHistory.entries(app);
        assertNotNull("the list reads", found);
        return found;
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    private SharedPreferences file() {
        return app.getSharedPreferences(ActivityHistory.STORE, Context.MODE_PRIVATE);
    }

    @Test public void startsOffAndNotesNothingUntilTurnedOn() {
        Settings.LIKE_COMMENT_HISTORY.resetToDefault();
        assertFalse(Settings.LIKE_COMMENT_HISTORY.get());
        ActivityHistory.likeSent(pin("4242", "Blue kitchen"), "4242", 1);
        ActivityHistory.commentPosted("4242", "Nice");
        ActivityHistory.replyPosted("4242", "Thanks");
        assertTrue(entries().isEmpty());
        assertFalse("nothing written", file().contains(ActivityHistory.ENTRIES));
        assertTrue(report(), report().contains(FamilyNames.LIKE_COMMENT_HISTORY));
        assertFalse(report(), report().contains("noted"));
    }

    @Test public void likesCommentsAndRepliesAreNotedNewestFirst() {
        ActivityHistory.likeSent(pin("4242", "  Blue kitchen  "), "4242", 1);
        later(1_000);
        ActivityHistory.commentPosted("4242", "  Love this  ");
        later(1_000);
        ActivityHistory.replyPosted("5151", "Thanks!");

        List<ActivityHistory.Entry> found = entries();
        assertEquals(3, found.size());
        ActivityHistory.Entry reply = found.get(0);
        assertEquals(ActivityHistory.Kind.REPLY, reply.kind);
        assertEquals("5151", reply.pinId);
        assertEquals("Thanks!", reply.text);
        assertNull("no title known for this pin", reply.title);
        assertEquals(START + 2_000, reply.time);
        ActivityHistory.Entry comment = found.get(1);
        assertEquals(ActivityHistory.Kind.COMMENT, comment.kind);
        assertEquals("Love this", comment.text);
        assertEquals("the like's title carries over", "Blue kitchen", comment.title);
        ActivityHistory.Entry like = found.get(2);
        assertEquals(ActivityHistory.Kind.LIKE, like.kind);
        assertEquals("4242", like.pinId);
        assertEquals(1, like.reaction);
        assertEquals("Blue kitchen", like.title);
        assertNull(like.text);
        assertEquals(START, like.time);
        assertEquals("https://www.pinterest.com/pin/4242/", like.pinUrl());

        String report = report();
        assertTrue(report, report.contains("like noted 1"));
        assertTrue(report, report.contains("comment noted 1"));
        assertTrue(report, report.contains("reply noted 1"));
    }

    @Test public void theGridTitleStandsInAndAnotherPinsModelGivesNone() {
        Map<String, Object> grid = pin("4242", null);
        grid.put("grid_title", "Garden ideas");
        ActivityHistory.likeSent(grid, "4242", 1);
        ActivityHistory.likeSent(pin("1111", "Someone else's pin"), "5151", 1);
        ActivityHistory.likeSent(new Object(), "6262", 1);
        ActivityHistory.likeSent(null, "7373", 1);
        List<ActivityHistory.Entry> found = entries();
        assertEquals(4, found.size());
        assertNull(found.get(0).title);
        assertNull(found.get(1).title);
        assertNull("a model for another pin isn't this pin's title", found.get(2).title);
        assertEquals("Garden ideas", found.get(3).title);
    }

    @Test public void aPinLikedAgainMovesToTheTopOnce() {
        ActivityHistory.likeSent(pin("4242", "Blue kitchen"), "4242", 1);
        later(1_000);
        ActivityHistory.likeSent(null, "5151", 1);
        later(1_000);
        ActivityHistory.likeSent(null, "4242", 5);
        List<ActivityHistory.Entry> found = entries();
        assertEquals(2, found.size());
        assertEquals("4242", found.get(0).pinId);
        assertEquals(START + 2_000, found.get(0).time);
        assertEquals(5, found.get(0).reaction);
        assertEquals("its title is kept", "Blue kitchen", found.get(0).title);
        assertEquals("5151", found.get(1).pinId);
    }

    @Test public void unlikingTakesTheLikeOffAndKeepsTheComments() {
        ActivityHistory.likeSent(null, "4242", 1);
        ActivityHistory.likeSent(null, "5151", 1);
        ActivityHistory.commentPosted("4242", "Nice");
        ActivityHistory.likeRemoved("4242");
        List<ActivityHistory.Entry> found = entries();
        assertEquals(2, found.size());
        assertEquals(ActivityHistory.Kind.COMMENT, found.get(0).kind);
        assertEquals("4242", found.get(0).pinId);
        assertEquals(ActivityHistory.Kind.LIKE, found.get(1).kind);
        assertEquals("5151", found.get(1).pinId);
        assertTrue(report(), report().contains("like taken back 1"));

        ActivityHistory.likeRemoved("9999");
        ActivityHistory.likeRemoved("4242");
        assertEquals(2, entries().size());
        assertTrue("only a real change counts", report().contains("like taken back 1"));
    }

    @Test public void pausedOffOrBeforeSettingsAreReadyTheListStaysAsItIs() {
        ActivityHistory.likeSent(null, "4242", 1);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        ActivityHistory.likeSent(null, "5151", 1);
        ActivityHistory.commentPosted("5151", "Nice");
        ActivityHistory.replyPosted("5151", "Thanks");
        ActivityHistory.likeRemoved("4242");
        assertEquals("paused", 1, entries().size());
        PauseForTests.resume();

        Settings.LIKE_COMMENT_HISTORY.save(false);
        ActivityHistory.likeRemoved("4242");
        ActivityHistory.commentPosted("5151", "Nice");
        assertEquals("off", 1, entries().size());
        Settings.LIKE_COMMENT_HISTORY.save(true);

        SettingsContextRule.withoutContext(() -> {
            ActivityHistory.likeSent(null, "6262", 1);
            ActivityHistory.commentPosted("6262", "Nice");
        });
        List<ActivityHistory.Entry> found = entries();
        assertEquals("before Pinterest's start", 1, found.size());
        assertEquals("4242", found.get(0).pinId);
    }

    @Test public void theListKeepsTheNewestFiveHundred() {
        for (int i = 0; i < ActivityHistory.LIMIT + 5; i++) {
            later(1);
            ActivityHistory.likeSent(null, String.valueOf(10_000 + i), 1);
        }
        List<ActivityHistory.Entry> found = entries();
        assertEquals(500, found.size());
        assertEquals(String.valueOf(10_000 + ActivityHistory.LIMIT + 4), found.get(0).pinId);
        assertEquals("the oldest five went", "10005", found.get(found.size() - 1).pinId);
    }

    @Test public void theSameCommentRightAfterIsNotedOnce() {
        ActivityHistory.commentPosted("4242", "Nice");
        later(5_000);
        ActivityHistory.commentPosted("4242", "Nice");
        assertEquals("a retry", 1, entries().size());
        ActivityHistory.replyPosted("4242", "Nice");
        ActivityHistory.commentPosted("4242", "Nicer");
        ActivityHistory.commentPosted("5151", "Nice");
        assertEquals(4, entries().size());
        later(ActivityHistory.SAME_COMMENT_MILLIS);
        ActivityHistory.commentPosted("4242", "Nice");
        assertEquals("a minute on, a second comment", 5, entries().size());
    }

    @Test public void badIdsAreSkippedAndAPhotoCommentHasNoText() {
        ActivityHistory.likeSent(null, "not-a-pin", 1);
        ActivityHistory.likeSent(null, null, 1);
        ActivityHistory.commentPosted(null, "Nice");
        ActivityHistory.replyPosted("12a", "Nice");
        assertTrue(entries().isEmpty());
        ActivityHistory.commentPosted("4242", "   ");
        ActivityHistory.Entry photo = entries().get(0);
        assertEquals(ActivityHistory.Kind.COMMENT, photo.kind);
        assertNull(photo.text);
    }

    @Test public void aLongCommentIsCutWithoutSplittingACharacter() {
        StringBuilder text = new StringBuilder();
        for (int i = 0; i < ActivityHistory.TEXT_LIMIT - 1; i++) text.append('a');
        text.append(Character.toChars(0x1F600));
        ActivityHistory.commentPosted("4242", text.toString());
        String kept = entries().get(0).text;
        assertEquals(ActivityHistory.TEXT_LIMIT - 1, kept.length());
        assertFalse(Character.isHighSurrogate(kept.charAt(kept.length() - 1)));
    }

    @Test public void theListSurvivesARestartAndClearEmptiesIt() {
        ActivityHistory.likeSent(pin("4242", "Blue kitchen"), "4242", 1);
        ActivityHistory.commentPosted("5151", "Nice");
        String saved = file().getString(ActivityHistory.ENTRIES, null);
        assertNotNull(saved);
        assertTrue(saved, saved.contains("4242") && saved.contains("Blue kitchen") && saved.contains("Nice"));

        // A fresh process reads the file it left: forget what this one parsed, then put the file back.
        assertTrue(ActivityHistory.clear(app));
        assertTrue(file().edit().putString(ActivityHistory.ENTRIES, saved).commit());
        List<ActivityHistory.Entry> found = entries();
        assertEquals(2, found.size());
        assertEquals(ActivityHistory.Kind.COMMENT, found.get(0).kind);
        assertEquals("Blue kitchen", found.get(1).title);

        assertTrue(ActivityHistory.clear(app));
        assertTrue(entries().isEmpty());
        assertFalse(file().contains(ActivityHistory.ENTRIES));
    }

    @Test public void anUnreadableListIsReportedAndTheNextLikeStartsAgain() {
        assertTrue(file().edit().putString(ActivityHistory.ENTRIES, "not a list").commit());
        assertNull(ActivityHistory.entries(app));
        assertTrue(report(), report().contains("list read"));
        ActivityHistory.likeSent(null, "4242", 1);
        List<ActivityHistory.Entry> found = entries();
        assertEquals(1, found.size());
        assertEquals("4242", found.get(0).pinId);
    }

    @Test public void aSettingsExportCarriesTheSwitchButNeverTheList() throws Exception {
        ActivityHistory.likeSent(pin("4242", "Blue kitchen"), "4242", 1);
        ActivityHistory.commentPosted("5151", "A comment of mine");
        assertFalse(ActivityHistory.STORE.equals(Setting.preferences.name));
        String export = SettingsBackup.create();
        assertTrue(export, export.contains(Settings.LIKE_COMMENT_HISTORY.key));
        for (String kept : new String[] {"Blue kitchen", "A comment of mine", ActivityHistory.ENTRIES}) {
            assertFalse(kept, export.contains(kept));
        }
    }
}
