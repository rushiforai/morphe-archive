/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.os.Looper;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Issue #317: while the filters leave buckets out of Home's tray, a gray placeholder coming into
 * view loads the tray's next page even with the server flag off, a page that adds nothing in view
 * is followed by another while a placeholder is still in view, and a fetch still running when the
 * page settles is waited out.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StoriesTrayPagingTest {
    /**
     * Stands in for the tray's tile handler once the patch has made it a Pager: hands the extension
     * each tile and asks the flag for a placeholder, as the patched method does.
     */
    static final class Handler implements StoriesTrayPaging.Pager {
        boolean flag;
        boolean fetching;
        final List<Integer> loads = new ArrayList<>();

        void show(String bucketId, int position) {
            StoriesTrayPaging.tileShown(this, bucketId, position);
            if (!StoriesTrayPaging.PLACEHOLDER.equals(bucketId) || fetching) return;
            if (StoriesTrayPaging.placeholderPages(flag)) loads.add(position);
        }

        @Override public void hushShowPlaceholder(int position) {
            show(StoriesTrayPaging.PLACEHOLDER, position);
        }
    }

    private final Handler handler = new Handler();

    @Before public void setUp() {
        StoriesTrayPaging.reset();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After public void tearDown() {
        StoriesTrayPaging.reset();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static void settle() {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(StoriesTrayPaging.SETTLE_MS + 50));
    }

    private static String line() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(StoriesTrayPaging.ROUTE + ":")) return line;
        }
        return "";
    }

    /** The one kept bucket at 1 after Create story, then the three placeholders coming into view. */
    private void showShortRow() {
        handler.show("bucket", 1);
        handler.show(StoriesTrayPaging.PLACEHOLDER, 2);
        handler.show(StoriesTrayPaging.PLACEHOLDER, 3);
        handler.show(StoriesTrayPaging.PLACEHOLDER, 4);
    }

    @Test public void aFilteredRowsPlaceholdersLoadTheNextPageOnce() {
        StoriesTrayPaging.sawTray(1, 14);
        showShortRow();
        assertEquals("the first placeholder in view asks, the two with it don't", List.of(2), handler.loads);
        assertTrue(line(), line().contains("Kinds: " + StoriesTrayPaging.NEXT_PAGE + " 1"));
    }

    @Test public void anUnfilteredTrayKeepsTheServersAnswer() {
        StoriesTrayPaging.sawTray(15, 0);
        showShortRow();
        settle();
        assertEquals(List.of(), handler.loads);
        assertEquals("", line());

        handler.flag = true;
        handler.show(StoriesTrayPaging.PLACEHOLDER, 5);
        assertEquals("the flag on still loads", List.of(5), handler.loads);
        assertEquals("and isn't counted as ours", "", line());
    }

    @Test public void aPageWithNothingKeptIsFollowedByAnotherWhileAPlaceholderIsInView() {
        StoriesTrayPaging.sawTray(1, 14);
        showShortRow();
        // The next page arrives with nothing kept, so nothing new comes into view.
        StoriesTrayPaging.sawTray(1, 18);
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(StoriesTrayPaging.SETTLE_MS / 2));
        assertEquals("not before the page settles", 1, handler.loads.size());
        settle();
        assertEquals("the last placeholder in view is shown again", List.of(2, 4), handler.loads);
    }

    @Test public void placeholdersOutOfViewAreLeftAlone() {
        StoriesTrayPaging.sawTray(1, 14);
        showShortRow();
        for (int tile = 0; tile < 3; tile++) StoriesTrayPaging.placeholderHidden();
        StoriesTrayPaging.sawTray(1, 18);
        settle();
        assertEquals(List.of(2), handler.loads);
        StoriesTrayPaging.placeholderHidden();
        StoriesTrayPaging.sawTray(1, 20);
        settle();
        assertEquals("never counts below none", List.of(2), handler.loads);
    }

    private static void idleRetries(int count) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(count * StoriesTrayPaging.RETRY_MS + 50));
    }

    @Test public void aFetchRunningAsksNothingUntilItEnds() {
        StoriesTrayPaging.sawTray(1, 14);
        handler.fetching = true;
        showShortRow();
        settle();
        idleRetries(2);
        assertEquals(List.of(), handler.loads);
        assertEquals("", line());

        // A cold start's first page settles before its fetch does: once the fetch ends, the tile shown again asks.
        handler.fetching = false;
        idleRetries(1);
        assertEquals(List.of(4), handler.loads);
        idleRetries(3);
        assertEquals("one ask, then nothing more to look again for", List.of(4), handler.loads);
    }

    @Test public void aFetchThatNeverEndsIsLookedAtOnlyALimitedNumberOfTimes() {
        StoriesTrayPaging.sawTray(1, 14);
        handler.fetching = true;
        showShortRow();
        settle();
        idleRetries(StoriesTrayPaging.MAX_RETRIES + 3);
        handler.fetching = false;
        idleRetries(3);
        assertEquals("it stopped looking", List.of(), handler.loads);

        StoriesTrayPaging.sawTray(1, 18);
        settle();
        assertEquals("the next page starts it again", List.of(4), handler.loads);
    }

    @Test public void pagesThatAddNoKeptStoryStopAfterTheLimit() {
        StoriesTrayPaging.sawTray(1, 14);
        showShortRow();
        for (int page = 0; page < StoriesTrayPaging.MAX_EMPTY_PAGES + 3; page++) {
            StoriesTrayPaging.sawTray(1, 18 + page);
            settle();
        }
        assertEquals(StoriesTrayPaging.MAX_EMPTY_PAGES, handler.loads.size());
        assertTrue(line(), line().contains(StoriesTrayPaging.GAVE_UP + " 1"));

        StoriesTrayPaging.sawTray(2, 40);
        settle();
        assertEquals("a page that adds a kept story starts it again", StoriesTrayPaging.MAX_EMPTY_PAGES + 1, handler.loads.size());
    }

    @Test public void theHandlersOwnShowingIsntCountedAsATileInView() {
        StoriesTrayPaging.sawTray(1, 14);
        showShortRow();
        StoriesTrayPaging.sawTray(1, 18);
        settle();
        // Three came into view, the extension showed one again, and three leave.
        for (int tile = 0; tile < 3; tile++) StoriesTrayPaging.placeholderHidden();
        StoriesTrayPaging.sawTray(1, 20);
        settle();
        assertEquals(List.of(2, 4), handler.loads);
    }

    @Test public void noTrayYetIsLeftAlone() {
        StoriesTrayPaging.sawTray(1, 14);
        settle();
        StoriesTrayPaging.check();
        assertEquals(List.of(), handler.loads);
        assertTrue(HookStatus.missing().toString(), HookStatus.missing().isEmpty());
    }

    @Test public void aHandlerThatThrowsIsRecordedAndLetGo() {
        StoriesTrayPaging.Pager broken = position -> {
            throw new IllegalStateException("gone");
        };
        StoriesTrayPaging.sawTray(1, 14);
        StoriesTrayPaging.tileShown(broken, StoriesTrayPaging.PLACEHOLDER, 2);
        settle();
        assertTrue(HookStatus.missing().toString(), HookStatus.missing().toString().contains("tray paging"));
        StoriesTrayPaging.tileShown(handler, "bucket", 1);
        StoriesTrayPaging.tileShown(handler, StoriesTrayPaging.PLACEHOLDER, 2);
        StoriesTrayPaging.sawTray(1, 18);
        settle();
        assertEquals("the next check still runs", List.of(2), handler.loads);
    }
}
