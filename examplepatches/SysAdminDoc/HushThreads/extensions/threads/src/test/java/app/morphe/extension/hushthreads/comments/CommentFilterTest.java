/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.comments;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CommentFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Each reply in these tests is its own text. */
    private static final CommentFilter.ReplyText OWN_TEXT = reply -> (String) reply;

    private static final List<String> REPLIES = Collections.unmodifiableList(Arrays.asList(
            "Great post",
            "Cheap shoes at SHOPEE.vn/abc",
            "Agreed, thanks",
            "read more on https://example.com/x",
            "buy followers now"));

    @Before @After public void restore() {
        PauseForTests.resume();
        Settings.FILTER_COMMENTS.resetToDefault();
        Settings.HIDE_COMMENT_LINKS.resetToDefault();
        CommentSettings.FILTER_COMMENT_PATTERNS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void patternsSplitOnLinesAndCommasAndIgnoreCase() {
        assertEquals(Arrays.asList("shopee.vn", "buy followers", "spam"),
                CommentFilter.patterns("Shopee.VN, buy followers\r\n\n  spam  ,,"));
        assertTrue(CommentFilter.patterns("").isEmpty());
        assertTrue(CommentFilter.patterns(null).isEmpty());
        assertTrue(CommentFilter.patterns(" ,\n, ").isEmpty());
    }

    @Test public void aLinkIsAnAddressNotAnyDot() {
        List<String> none = Collections.emptyList();
        assertTrue(CommentFilter.matches("see https://example.com", none, true));
        assertTrue(CommentFilter.matches("see http://example.com", none, true));
        assertTrue(CommentFilter.matches("WWW.Example.org", none, true));
        assertTrue(CommentFilter.matches("shop.example/abc", none, true));
        assertFalse(CommentFilter.matches("e.g. this. And that.", none, true));
        assertFalse(CommentFilter.matches("version 1.2 is out", none, true));
        assertFalse("links count only while they're hidden",
                CommentFilter.matches("see https://example.com", none, false));
        assertFalse(CommentFilter.matches(null, Collections.singletonList("x"), true));
        assertFalse(CommentFilter.matches("", Collections.singletonList("x"), true));
    }

    /** The patterns' matches, the replies that stay in their order, and the list kept as it was otherwise. */
    @Test public void matchingRepliesGoAndTheRestKeepTheirOrder() {
        Settings.FILTER_COMMENTS.save(true);
        CommentSettings.FILTER_COMMENT_PATTERNS.save("shopee.vn\nBuy Followers");
        assertEquals(Arrays.asList("Great post", "Agreed, thanks", "read more on https://example.com/x"),
                CommentFilter.filter(REPLIES, OWN_TEXT));

        Settings.HIDE_COMMENT_LINKS.save(true);
        assertEquals(Arrays.asList("Great post", "Agreed, thanks"), CommentFilter.filter(REPLIES, OWN_TEXT));

        CommentSettings.FILTER_COMMENT_PATTERNS.save("nothing like these");
        Settings.HIDE_COMMENT_LINKS.save(false);
        assertSame(REPLIES, CommentFilter.filter(REPLIES, OWN_TEXT));
    }

    /**
     * Hide comments with links sits under Filter comments and is greyed out while it's off, so it
     * takes nothing out on its own, and neither do saved patterns.
     */
    @Test public void nothingGoesWhileFilterCommentsIsOff() {
        Settings.HIDE_COMMENT_LINKS.save(true);
        CommentSettings.FILTER_COMMENT_PATTERNS.save("shopee.vn");
        assertSame(REPLIES, CommentFilter.filter(REPLIES, OWN_TEXT));
        assertFalse(CommentFilter.removes("read more on https://example.com/x"));
        assertFalse(CommentFilter.removes("Cheap shoes at shopee.vn/abc"));
        assertFalse(String.join("\n", HookStatus.report()).contains("matching replies taken out"));
    }

    @Test public void pauseKeepsEveryReply() {
        Settings.FILTER_COMMENTS.save(true);
        Settings.HIDE_COMMENT_LINKS.save(true);
        CommentSettings.FILTER_COMMENT_PATTERNS.save("shopee.vn");
        assertTrue(CommentFilter.removes("Cheap shoes at shopee.vn/abc"));
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertSame(REPLIES, CommentFilter.filter(REPLIES, OWN_TEXT));
        assertFalse(CommentFilter.removes("Cheap shoes at shopee.vn/abc"));
    }

    /** With the switch on and nothing listed, the list is handed back untouched and nothing is counted. */
    @Test public void anEmptyListChangesNothing() {
        Settings.FILTER_COMMENTS.save(true);
        assertSame(REPLIES, CommentFilter.filter(REPLIES, OWN_TEXT));
        assertFalse(String.join("\n", HookStatus.report()).contains("reply lists checked"));
    }

    /** A reply whose text can't be read is a failure the report shows, and every reply stays. */
    @Test public void aReadThatThrowsKeepsTheList() {
        Settings.FILTER_COMMENTS.save(true);
        CommentSettings.FILTER_COMMENT_PATTERNS.save("shopee.vn");
        assertSame(REPLIES, CommentFilter.filter(REPLIES, reply -> {
            throw new IllegalStateException("renamed");
        }));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("'reply list' hook (it threw java.lang.IllegalStateException)"));
    }

    /** Unpatched, the stubs read nothing, so every reply stays even with every switch on. */
    @Test public void unpatchedEveryReplyStays() {
        Settings.FILTER_COMMENTS.save(true);
        Settings.HIDE_COMMENT_LINKS.save(true);
        CommentSettings.FILTER_COMMENT_PATTERNS.save("shopee.vn");
        assertSame(REPLIES, CommentFilter.filter(REPLIES));
        assertSame(null, CommentFilter.filter(null));
    }
}
