/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.concurrent.atomic.AtomicReference;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Default comment order as the constructor of a comment request's params asks it, and as a comment
 * sheet's pick handler tells it about a pick: which requests get the chosen order, which keep their
 * own or Facebook's, and how a pick stays with its post.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DefaultCommentOrderTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String POST = "ZmVlZGJhY2s6MTAx";
    private static final String OTHER_POST = "ZmVlZGJhY2s6MjAy";
    private static final String COMMENT = "Y29tbWVudDoxMDFfNQ==";

    private static final String RELEVANT = "RANKED_FILTERED_INTENT_V1";
    private static final String NEWEST = "RECENT_ACTIVITY_INTENT_V1";
    private static final String ALL = "RANKED_UNFILTERED_CHRONOLOGICAL_REPLIES_INTENT_V1";

    @Before
    public void inBuild() {
        DefaultCommentOrderForTests.inBuild(Boolean.TRUE);
        DefaultCommentOrder.forget();
        DefaultCommentOrder.nowForTests = 1_000L;
    }

    @After
    public void restore() {
        DefaultCommentOrderForTests.inBuild(null);
        DefaultCommentOrderForTests.order(null);
        DefaultCommentOrder.nowForTests = null;
        DefaultCommentOrder.failNextForTests = null;
        DefaultCommentOrder.forget();
        PauseForTests.resume();
        Settings.DEFAULT_COMMENT_ORDER.resetToDefault();
        Settings.COMMENT_ORDER.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.DEFAULT_COMMENT_ORDER + ":")) return line;
        }
        return null;
    }

    private static int occurrences(String text, String part) {
        int count = 0;
        for (int at = text.indexOf(part); at >= 0; at = text.indexOf(part, at + 1)) count++;
        return count;
    }

    /** What a sheet's own request would name after a pick in its menu: the pick, then the request. */
    private static String pick(String token, String post) {
        DefaultCommentOrder.picked(token);
        return DefaultCommentOrder.requestedOrder(token, post, null);
    }

    @Test
    public void theTokensAreFacebooksOwn() {
        assertNull(CommentOrder.FACEBOOK.token);
        assertEquals(RELEVANT, CommentOrder.MOST_RELEVANT.token);
        assertEquals(NEWEST, CommentOrder.NEWEST.token);
        assertEquals(ALL, CommentOrder.ALL_COMMENTS.token);
        for (CommentOrder order : CommentOrder.values()) {
            assertSame(order, CommentOrder.fromFile(order.fileValue));
            if (order.token != null) assertSame(order, CommentOrder.ofToken(order.token));
        }
        assertNull(CommentOrder.fromFile("NEWEST"));
        assertNull(CommentOrder.fromFile(2));
        assertNull(CommentOrder.ofToken("STARS_INTENT_V1"));
        assertNull(CommentOrder.ofToken(null));
    }

    /** Picked in Morphe Manager, the switch is on and the order is Facebook's, so nothing changes. */
    @Test
    public void onItsDefaultsARequestIsFacebooksOwn() {
        assertTrue("picking the patch is the choice to use it", Settings.DEFAULT_COMMENT_ORDER.get());
        assertSame(CommentOrder.FACEBOOK, Settings.COMMENT_ORDER.get());
        assertNull(DefaultCommentOrder.requestedOrder(null, POST, null));
        assertEquals("", DefaultCommentOrder.requestedOrder("", POST, null));
        assertEquals(FamilyNames.DEFAULT_COMMENT_ORDER + ": invoked 2, 1 found, 0 missing", statusLine());
    }

    @Test
    public void aRequestThatNamesNoOrderAsksForTheChosenOne() {
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        assertEquals(NEWEST, DefaultCommentOrder.requestedOrder(null, POST, null));
        assertEquals("an empty order is none", NEWEST, DefaultCommentOrder.requestedOrder("", POST, ""));
        Settings.COMMENT_ORDER.save(CommentOrder.ALL_COMMENTS);
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(null, POST, null));
        Settings.COMMENT_ORDER.save(CommentOrder.MOST_RELEVANT);
        assertEquals(RELEVANT, DefaultCommentOrder.requestedOrder(null, OTHER_POST, null));
    }

    /** A pick in the menu, a list that names its own, a restored request: the order named stays. */
    @Test
    public void aRequestThatNamesAnOrderKeepsIt() {
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(ALL, POST, null));
        assertEquals(RELEVANT, DefaultCommentOrder.requestedOrder(RELEVANT, POST, null));
        assertEquals("a token this build doesn't know stays too", "STARS_INTENT_V1",
                DefaultCommentOrder.requestedOrder("STARS_INTENT_V1", POST, null));
    }

    /** A link to one comment opens where Facebook puts it, and a request without a post is left alone. */
    @Test
    public void aLinkToACommentAndARequestWithoutAPostKeepFacebooksOrder() {
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        assertNull(DefaultCommentOrder.requestedOrder(null, POST, COMMENT));
        assertEquals("", DefaultCommentOrder.requestedOrder("", POST, COMMENT));
        assertNull(DefaultCommentOrder.requestedOrder(null, null, null));
        assertNull(DefaultCommentOrder.requestedOrder(null, "", null));
        assertEquals(FamilyNames.DEFAULT_COMMENT_ORDER + ": invoked 4, 1 found, 0 missing", statusLine());
    }

    @Test
    public void offPausedOrNotInTheBuildARequestIsFacebooksOwn() {
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        Settings.DEFAULT_COMMENT_ORDER.save(false);
        assertNull(DefaultCommentOrder.requestedOrder(null, POST, null));
        Settings.DEFAULT_COMMENT_ORDER.save(true);

        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            assertNull(why.name(), DefaultCommentOrder.requestedOrder(null, POST, null));
        }
        PauseForTests.resume();

        HookStatus.clear();
        DefaultCommentOrderForTests.inBuild(Boolean.FALSE);
        assertNull(DefaultCommentOrder.requestedOrder(null, POST, null));
        DefaultCommentOrder.picked(ALL);
        assertNull("a build without the patch reports nothing", statusLine());
        DefaultCommentOrderForTests.inBuild(Boolean.TRUE);

        boolean[] asked = {true};
        SettingsContextRule.withoutContext(() -> asked[0] = DefaultCommentOrderForTests.asksForTheChosenOrder());
        assertFalse("a request built before the context got an order", asked[0]);
        assertTrue(DefaultCommentOrderForTests.asksForTheChosenOrder());
    }

    /**
     * The order picked in a post's menu comes back for that post whenever its comments are fetched
     * with none, a refresh or a reopening, and only for that post, until Facebook restarts.
     */
    @Test
    public void anOrderPickedInAPostsMenuStaysWithThatPost() {
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        assertEquals(ALL, pick(ALL, POST));
        assertEquals("a refresh of that post", ALL, DefaultCommentOrder.requestedOrder(null, POST, null));
        assertEquals("another post", NEWEST, DefaultCommentOrder.requestedOrder(null, OTHER_POST, null));
        // A later pick replaces it.
        assertEquals(RELEVANT, pick(RELEVANT, POST));
        assertEquals(RELEVANT, DefaultCommentOrder.requestedOrder(null, POST, null));
        // A link to one of its comments still keeps Facebook's order.
        assertNull(DefaultCommentOrder.requestedOrder(null, POST, COMMENT));

        // With the order left as Facebook's, or the switch off, a pick changes nothing afterwards.
        Settings.COMMENT_ORDER.save(CommentOrder.FACEBOOK);
        assertNull(DefaultCommentOrder.requestedOrder(null, POST, null));
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        Settings.DEFAULT_COMMENT_ORDER.save(false);
        assertNull(DefaultCommentOrder.requestedOrder(null, POST, null));
        Settings.DEFAULT_COMMENT_ORDER.save(true);
        assertEquals(RELEVANT, DefaultCommentOrder.requestedOrder(null, POST, null));

        // A new process has none.
        DefaultCommentOrder.forget();
        assertEquals(NEWEST, DefaultCommentOrder.requestedOrder(null, POST, null));
    }

    /**
     * Only the request a pick sends counts as the pick: the same token, next on the same thread,
     * within the window. Another request that names an order, such as a prefetch Facebook sends
     * with the last order it was asked for, isn't a pick for its post.
     */
    @Test
    public void onlyTheRequestAPickSendsKeepsTheOrderForItsPost() {
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        // No pick heard: an order named for a post isn't kept for it.
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(ALL, POST, null));
        assertEquals(NEWEST, DefaultCommentOrder.requestedOrder(null, POST, null));

        // Another token than the one picked, and the pick is used up.
        DefaultCommentOrder.picked(ALL);
        assertEquals(RELEVANT, DefaultCommentOrder.requestedOrder(RELEVANT, POST, null));
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(ALL, POST, null));
        assertEquals(NEWEST, DefaultCommentOrder.requestedOrder(null, POST, null));

        // Too late.
        DefaultCommentOrder.picked(ALL);
        DefaultCommentOrder.nowForTests = 1_000L + DefaultCommentOrder.PICK_WINDOW_MS + 1;
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(ALL, POST, null));
        assertEquals(NEWEST, DefaultCommentOrder.requestedOrder(null, POST, null));

        // Another thread.
        DefaultCommentOrder.nowForTests = 5_000L;
        DefaultCommentOrder.picked(ALL);
        AtomicReference<String> sent = new AtomicReference<>();
        Thread other = new Thread(() -> sent.set(DefaultCommentOrder.requestedOrder(ALL, OTHER_POST, null)));
        other.start();
        try {
            other.join();
        } catch (InterruptedException interrupted) {
            throw new AssertionError(interrupted);
        }
        assertEquals(ALL, sent.get());
        assertEquals(NEWEST, DefaultCommentOrder.requestedOrder(null, OTHER_POST, null));
        // The pick still waits on this thread for its own request.
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(ALL, POST, null));
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(null, POST, null));

        // An empty pick is none.
        DefaultCommentOrder.picked("");
        DefaultCommentOrder.picked(null);
        assertEquals(RELEVANT, DefaultCommentOrder.requestedOrder(RELEVANT, OTHER_POST, null));
        assertEquals(NEWEST, DefaultCommentOrder.requestedOrder(null, OTHER_POST, null));
    }

    @Test
    public void onlyTheMostRecentlyUsedPicksAreKept() {
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        assertEquals(ALL, pick(ALL, "post-0"));
        for (int i = 1; i <= DefaultCommentOrder.REMEMBERED_POSTS; i++) {
            if (i == 100) assertEquals("reading a pick keeps it", ALL, DefaultCommentOrder.requestedOrder(null, "post-0", null));
            pick(RELEVANT, "post-" + i);
        }
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(null, "post-0", null));
        assertEquals("the oldest one went", NEWEST, DefaultCommentOrder.requestedOrder(null, "post-1", null));
        assertEquals(RELEVANT, DefaultCommentOrder.requestedOrder(null, "post-2", null));
    }

    /** A failure in the hook leaves the request as it was and says so in Hook status. */
    @Test
    public void aFailureLeavesTheRequestAlone() {
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        DefaultCommentOrder.failNextForTests = new IllegalStateException("for this test");
        assertNull(DefaultCommentOrder.requestedOrder(null, POST, null));
        DefaultCommentOrder.failNextForTests = new IllegalStateException("for this test");
        assertEquals(ALL, DefaultCommentOrder.requestedOrder(ALL, POST, null));
        String line = statusLine();
        assertNotNull(line);
        assertTrue(line, line.contains("1 missing"));
        assertTrue(line, line.contains("'comment request' hook (it threw java.lang.IllegalStateException)"));
        assertEquals(NEWEST, DefaultCommentOrder.requestedOrder(null, POST, null));
    }

    /**
     * With Debug logging on, each decision has a line naming the order, for the phone check, up to
     * forty, then one line per fifty. No line names the post.
     */
    @Test
    public void debugLoggingSaysWhatEachRequestAskedFor() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        Settings.COMMENT_ORDER.save(CommentOrder.NEWEST);
        DefaultCommentOrder.requestedOrder(null, POST, null);
        DefaultCommentOrder.requestedOrder(null, POST, COMMENT);
        pick(ALL, POST);
        DefaultCommentOrder.requestedOrder(null, POST, null);
        String report = LogBufferManager.buildExportText();
        assertEquals(report, 1, occurrences(report, "Default comment order: asked for newest (" + NEWEST + ")."));
        assertEquals(report, 1, occurrences(report, "Default comment order: left a link to one comment in Facebook's order."));
        assertEquals(report, 1, occurrences(report, "Default comment order: kept all_comments (" + ALL
                + "), picked in a post's comments, for that post until Facebook restarts."));
        assertEquals(report, 1, occurrences(report,
                "Default comment order: asked for the order picked for this post, all_comments (" + ALL + ")."));
        assertEquals(report, 0, occurrences(report, POST));
        assertEquals(report, 0, occurrences(report, COMMENT));

        LogBufferManager.clearLogBuffer();
        for (int i = 4; i < DefaultCommentOrder.LOGGED_ONE_BY_ONE + 2 * DefaultCommentOrder.SUMMED_UP_BY; i++) {
            DefaultCommentOrder.requestedOrder(null, OTHER_POST, null);
        }
        report = LogBufferManager.buildExportText();
        assertEquals(report, DefaultCommentOrder.LOGGED_ONE_BY_ONE - 4,
                occurrences(report, "Default comment order: asked for newest"));
        assertEquals(report, 2, occurrences(report, " comment requests so far. The last one asked for newest"));
        assertEquals(report, 1, occurrences(report, "Default comment order: 50 comment requests so far."));
        assertEquals(report, 1, occurrences(report, "Default comment order: 100 comment requests so far."));
    }
}
