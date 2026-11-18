// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.AfterClass;
import org.junit.Test;

public class MoreCommentsTest {
    private static final String LINK = "t3_post";
    private static final ExecutorService POOL = Executors.newFixedThreadPool(4);
    private static final long TIMEOUT = 10_000;

    @AfterClass
    public static void stopPool() {
        POOL.shutdownNow();
    }

    /** Comment pages from a fixed tree: what Reddit would answer for each comment. */
    private static final class Pages implements MoreComments.Source {
        final Map<String, JSONObject> comments = new HashMap<>();
        final Set<String> failing = new HashSet<>();
        final List<String> requested = Collections.synchronizedList(new ArrayList<>());
        volatile int budget = MoreComments.BATCH;
        // The budget Reddit reports once the first page is back, or -1 to keep it.
        volatile int budgetAfterFirst = -1;
        // The budget Reddit reports once a parent's page is back, or -1 to keep it.
        volatile int budgetAfterParent = -1;
        volatile boolean canceled;
        // How long every page takes, and a parent's page.
        volatile long delayMs;
        volatile long parentDelayMs;

        Pages with(JSONObject... things) throws JSONException {
            for (JSONObject thing : things) {
                comments.put(thing.getJSONObject("data").getString("id"), thing);
                JSONObject replies = thing.getJSONObject("data").optJSONObject("replies");
                if (replies == null) continue;
                JSONArray children = replies.getJSONObject("data").getJSONArray("children");
                for (int i = 0; i < children.length(); i++) {
                    if ("t1".equals(children.getJSONObject(i).getString("kind"))) with(children.getJSONObject(i));
                }
            }
            return this;
        }

        @Override
        public JSONObject comment(String id, boolean parent) throws Exception {
            requested.add(id + (parent ? " (parent)" : ""));
            if (budgetAfterFirst >= 0) budget = budgetAfterFirst;
            if (parent && budgetAfterParent >= 0) budget = budgetAfterParent;
            if (delayMs > 0) Thread.sleep(delayMs);
            if (parent && parentDelayMs > 0) Thread.sleep(parentDelayMs);
            if (failing.contains(id)) throw new IOException("Reddit returned 500");
            JSONObject comment = comments.get(id);
            // Fresh JSON for every page, as from the network.
            return comment == null ? null : new JSONObject(comment.toString());
        }

        @Override
        public int budget() {
            return budget;
        }

        @Override
        public boolean canceled() {
            return canceled;
        }
    }

    private static JSONObject comment(String id, String parent, JSONObject... replies) throws JSONException {
        JSONObject data = new JSONObject().put("id", id).put("name", "t1_" + id).put("parent_id", parent)
                .put("link_id", LINK).put("body", "comment " + id);
        if (replies.length == 0) {
            data.put("replies", "");
        } else {
            JSONArray children = new JSONArray();
            for (JSONObject reply : replies) children.put(reply);
            data.put("replies", new JSONObject().put("kind", "Listing")
                    .put("data", new JSONObject().put("children", children)));
        }
        return new JSONObject().put("kind", "t1").put("data", data);
    }

    /** Reddit's "continue this thread" node, which has no children and the ID {@code _}. */
    private static JSONObject continueThread(String parent) throws JSONException {
        return new JSONObject().put("kind", "more").put("data", new JSONObject().put("id", "_")
                .put("parent_id", parent).put("count", 0).put("children", new JSONArray()));
    }

    /** One line per thing, checking on the way that no comment still nests its replies. */
    private static List<String> rows(JSONArray things) throws JSONException {
        List<String> rows = new ArrayList<>();
        for (int i = 0; i < things.length(); i++) {
            JSONObject thing = things.getJSONObject(i);
            JSONObject data = thing.getJSONObject("data");
            if ("more".equals(thing.getString("kind"))) {
                rows.add("more " + data.getJSONArray("children").join(",").replace("\"", "") + " under "
                        + data.getString("parent_id"));
            } else {
                assertEquals("", data.get("replies"));
                rows.add(data.getString("id") + " under " + data.getString("parent_id"));
            }
        }
        return rows;
    }

    private static List<String> ids(int count) {
        List<String> ids = new ArrayList<>();
        for (int i = 0; i < count; i++) ids.add("c" + i);
        return ids;
    }

    @Test
    public void repliesToACommentComeFromTheParentsPageFlattenedInOrder() throws Exception {
        JSONObject more = new JSONObject().put("kind", "more").put("data", new JSONObject().put("id", "x")
                .put("parent_id", "t1_b").put("children", new JSONArray().put("x")));
        Pages pages = new Pages().with(comment("p", LINK,
                comment("shown", "t1_p"),
                comment("a", "t1_p", comment("a1", "t1_a", comment("a2", "t1_a1"))),
                comment("b", "t1_p", more)));

        JSONArray things = MoreComments.things(LINK, Arrays.asList("a", "b"), pages, POOL, TIMEOUT);

        assertEquals(Arrays.asList("a under t1_p", "a1 under t1_a", "a2 under t1_a1", "b under t1_p",
                "more x under t1_b"), rows(things));
        assertEquals(Arrays.asList("a", "p (parent)"), pages.requested);
    }

    @Test
    public void topLevelCommentsAreFetchedOneByOneAndTheRestBecomeAMoreRow() throws Exception {
        Pages pages = new Pages();
        for (String id : ids(25)) pages.with(comment(id, LINK, comment(id + "r", "t1_" + id)));

        List<String> rows = rows(MoreComments.things(LINK, ids(25), pages, POOL, TIMEOUT));

        assertEquals(MoreComments.BATCH, pages.requested.size());
        assertEquals(2 * MoreComments.BATCH + 1, rows.size());
        assertEquals(Arrays.asList("c0 under t3_post", "c0r under t1_c0", "c1 under t3_post"), rows.subList(0, 3));
        assertEquals("c19r under t1_c19", rows.get(2 * MoreComments.BATCH - 1));
        assertEquals("more c20,c21,c22,c23,c24 under t3_post", rows.get(2 * MoreComments.BATCH));
    }

    @Test
    public void goneCommentsAreLeftOutAndFailedOnesComeBackAsMore() throws Exception {
        Pages pages = new Pages().with(comment("c1", LINK), comment("c3", LINK));
        pages.failing.add("c2");

        List<String> rows = rows(MoreComments.things(LINK, ids(4), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("c1 under t3_post", "c3 under t3_post", "more c2 under t3_post"), rows);
    }

    @Test
    public void repliesMissingFromTheParentsPageAreFetchedOneByOne() throws Exception {
        Pages pages = new Pages().with(comment("p", LINK, comment("a", "t1_p")), comment("b", "t1_p"));

        List<String> rows = rows(MoreComments.things(LINK, Arrays.asList("a", "b"), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("a under t1_p", "b under t1_p"), rows);
        assertEquals(Arrays.asList("a", "p (parent)", "b"), pages.requested);
    }

    @Test
    public void aLowRateLimitBudgetLoadsFewerComments() throws Exception {
        Pages pages = new Pages();
        for (String id : ids(5)) pages.with(comment(id, LINK));
        pages.budget = 2;

        List<String> rows = rows(MoreComments.things(LINK, ids(5), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("c0 under t3_post", "c1 under t3_post", "more c2,c3,c4 under t3_post"), rows);
    }

    @Test
    public void theBudgetIsReadAgainAfterTheFirstPage() throws Exception {
        Pages pages = new Pages();
        for (String id : ids(5)) pages.with(comment(id, LINK));
        pages.budgetAfterFirst = 1;

        List<String> rows = rows(MoreComments.things(LINK, ids(5), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("c0 under t3_post", "c1 under t3_post", "more c2,c3,c4 under t3_post"), rows);
    }

    @Test
    public void nothingIsSentOnceTheBudgetIsUsedUp() throws Exception {
        Pages pages = new Pages().with(comment("c0", LINK));
        pages.budget = 0;
        try {
            MoreComments.things(LINK, ids(1), pages, POOL, TIMEOUT);
            fail();
        } catch (IOException expected) {
            assertTrue(pages.requested.isEmpty());
        }
    }

    @Test
    public void nothingIsSentForACanceledRequest() throws Exception {
        Pages pages = new Pages().with(comment("c0", LINK));
        pages.canceled = true;
        try {
            MoreComments.things(LINK, ids(1), pages, POOL, TIMEOUT);
            fail();
        } catch (CancellationException expected) {
            assertTrue(pages.requested.isEmpty());
        }
    }

    @Test
    public void theParentsPageIsSkippedWhenEveryCommentIsFound() throws Exception {
        Pages pages = new Pages().with(comment("p", LINK, comment("a", "t1_p")));

        assertEquals(Arrays.asList("a under t1_p"), rows(MoreComments.things(LINK, Arrays.asList("a"), pages, POOL, TIMEOUT)));
        assertEquals(Arrays.asList("a"), pages.requested);
    }

    @Test
    public void whenTheParentsPageFailsRepliesAreFetchedOneByOne() throws Exception {
        Pages pages = new Pages().with(comment("p", LINK, comment("a", "t1_p"), comment("b", "t1_p")));
        pages.failing.add("p");

        List<String> rows = rows(MoreComments.things(LINK, Arrays.asList("a", "b"), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("a under t1_p", "b under t1_p"), rows);
        assertEquals(Arrays.asList("a", "p (parent)", "b"), pages.requested);
    }

    @Test
    public void aGoneFirstCommentLetsTheNextOneTellTheParent() throws Exception {
        Pages pages = new Pages().with(comment("p", LINK, comment("a", "t1_p"), comment("b", "t1_p")));

        List<String> rows = rows(MoreComments.things(LINK, Arrays.asList("gone", "a", "b"), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("a under t1_p", "b under t1_p"), rows);
        assertEquals(Arrays.asList("gone", "a", "p (parent)"), pages.requested);
    }

    @Test
    public void aCommentAlreadyInAnotherSubtreeIsAddedOnce() throws Exception {
        Pages pages = new Pages().with(comment("x", LINK, comment("y", "t1_x")));

        List<String> rows = rows(MoreComments.things(LINK, Arrays.asList("x", "y"), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("x under t3_post", "y under t1_x"), rows);
    }

    @Test
    public void everyContinueThreadRowIsKept() throws Exception {
        Pages pages = new Pages().with(comment("x", LINK, comment("x1", "t1_x", continueThread("t1_x1")),
                comment("x2", "t1_x", continueThread("t1_x2"))));

        assertEquals(Arrays.asList("x under t3_post", "x1 under t1_x", "more  under t1_x1", "x2 under t1_x",
                "more  under t1_x2"), rows(MoreComments.things(LINK, Arrays.asList("x"), pages, POOL, TIMEOUT)));
    }

    @Test
    public void goneCommentsDoNotGetPastTheBudget() throws Exception {
        Pages pages = new Pages();
        pages.budgetAfterFirst = 0;

        List<String> rows = rows(MoreComments.things(LINK, ids(5), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("c0"), pages.requested);
        assertEquals(Arrays.asList("more c1,c2,c3,c4 under t3_post"), rows);
    }

    @Test
    public void aCommentAlreadyInASubtreeIsNotLeftForLater() throws Exception {
        Pages pages = new Pages().with(comment("x", LINK, comment("y", "t1_x")));
        pages.budget = 1;

        assertEquals(Arrays.asList("x under t3_post", "y under t1_x"),
                rows(MoreComments.things(LINK, Arrays.asList("x", "y"), pages, POOL, TIMEOUT)));
    }

    @Test
    public void theBudgetIsReadAgainAfterTheParentsPage() throws Exception {
        Pages pages = new Pages().with(comment("p", LINK, comment("a", "t1_p")), comment("b", "t1_p"),
                comment("c", "t1_p"));
        pages.budgetAfterParent = 0;

        List<String> rows = rows(MoreComments.things(LINK, Arrays.asList("a", "b", "c"), pages, POOL, TIMEOUT));

        assertEquals(Arrays.asList("a", "p (parent)"), pages.requested);
        assertEquals(Arrays.asList("a under t1_p", "more b,c under t1_p"), rows);
    }

    @Test
    public void pagesNotBackByTheDeadlineAreLeftForLater() throws Exception {
        Pages pages = new Pages();
        for (String id : ids(3)) pages.with(comment(id, LINK));
        pages.delayMs = 300;

        List<String> rows = rows(MoreComments.things(LINK, ids(3), pages, POOL, 450));

        assertEquals(Arrays.asList("c0 under t3_post", "more c1,c2 under t3_post"), rows);
    }

    @Test(expected = TimeoutException.class)
    public void theCallerWaitsNoLongerThanTheDeadline() throws Exception {
        Pages pages = new Pages().with(comment("c0", LINK));
        pages.delayMs = 2_000;
        long start = System.currentTimeMillis();
        try {
            MoreComments.things(LINK, ids(1), pages, POOL, 200);
        } finally {
            assertTrue(System.currentTimeMillis() - start < 1_000);
        }
    }

    @Test
    public void anInterruptWhileWaitingForTheParentsPageStopsTheAnswer() throws Exception {
        final Pages pages = new Pages().with(comment("p", LINK, comment("a", "t1_p")), comment("b", "t1_p"));
        final AtomicReference<Throwable> thrown = new AtomicReference<>();
        Thread caller = new Thread(() -> {
            try {
                MoreComments.things(LINK, Arrays.asList("a", "b"), pages, POOL, TIMEOUT);
            } catch (Throwable error) {
                thrown.set(error);
            }
        });
        pages.parentDelayMs = 2_000;
        caller.start();
        long until = System.currentTimeMillis() + 5_000;
        while (!pages.requested.contains("p (parent)") && System.currentTimeMillis() < until) Thread.sleep(10);
        assertTrue(pages.requested.contains("p (parent)"));
        caller.interrupt();
        caller.join(1_000);

        assertTrue(thrown.get() instanceof InterruptedException);
        assertEquals(Arrays.asList("a", "p (parent)"), pages.requested);
    }

    @Test
    public void aReplyListedBeforeItsParentIsAddedOnce() throws Exception {
        Pages pages = new Pages().with(comment("a", LINK), comment("x", LINK, comment("y", "t1_x")));
        pages.failing.add("y");

        assertEquals(Arrays.asList("a under t3_post", "x under t3_post", "y under t1_x"),
                rows(MoreComments.things(LINK, Arrays.asList("a", "y", "x"), pages, POOL, TIMEOUT)));
    }

    @Test
    public void anIdInANestedMoreRowIsNotLeftForLater() throws Exception {
        JSONObject nested = new JSONObject().put("kind", "more").put("data", new JSONObject().put("id", "y")
                .put("parent_id", "t1_x").put("children", new JSONArray().put("y").put("z")));
        Pages pages = new Pages().with(comment("x", LINK, nested));
        pages.budget = 1;

        assertEquals(Arrays.asList("x under t3_post", "more y,z under t1_x"),
                rows(MoreComments.things(LINK, Arrays.asList("x", "y"), pages, POOL, TIMEOUT)));
    }

    @Test
    public void onlyCommentsAndMoreBecomeRows() throws Exception {
        JSONObject other = new JSONObject().put("kind", "t3").put("data", new JSONObject().put("id", "z"));
        Pages pages = new Pages().with(comment("x", LINK, comment("y", "t1_x"), other));

        assertEquals(Arrays.asList("x under t3_post", "y under t1_x"),
                rows(MoreComments.things(LINK, Arrays.asList("x"), pages, POOL, TIMEOUT)));
    }

    @Test
    public void allCommentsGoneGivesNoThings() throws Exception {
        assertEquals(0, MoreComments.things(LINK, ids(3), new Pages(), POOL, TIMEOUT).length());
    }

    @Test(expected = IOException.class)
    public void theFirstFailureFailsTheAnswer() throws Exception {
        Pages pages = new Pages().with(comment("c1", LINK));
        pages.failing.add("c0");
        MoreComments.things(LINK, ids(2), pages, POOL, TIMEOUT);
    }

    @Test
    public void thePageIsAboutTheCommentOnlyIfItComesFirst() throws Exception {
        JSONObject wanted = comment("abc", LINK);
        JSONArray page = new JSONArray().put(new JSONObject()).put(new JSONObject().put("data",
                new JSONObject().put("children", new JSONArray().put(wanted))));
        assertSame(wanted, MoreComments.focus(page, "abc"));
        // For a comment it no longer has, Reddit sends the post's top comments instead.
        assertNull(MoreComments.focus(page, "zzz"));
    }

    @Test
    public void readsTheAppsForm() throws Exception {
        Map<String, String> form = MoreComments.form(
                "link_id=t3_1xqnf50&children=abc%2Cdef&api_type=json&sort=top".getBytes(StandardCharsets.UTF_8));
        assertEquals("t3_1xqnf50", form.get("link_id"));
        assertEquals(Arrays.asList("abc", "def"), MoreComments.ids(form.get("children")));
        assertEquals("top", MoreComments.sort(form.get("sort")));
        assertEquals(Arrays.asList("abc", "def", "ghi"), MoreComments.ids("abc,,def,abc,../x,DEF,Ghi"));
        assertNull(MoreComments.sort("suggested"));
        assertNull(MoreComments.sort("top&limit=1"));
    }

    @Test
    public void readsRedditsRateLimitHeaders() {
        MoreComments.RateLimit reading = MoreComments.rateLimit("299.0", "120", 1_000);
        assertEquals(299, reading.remaining);
        assertEquals(121_000, reading.windowEnd);
        assertNull(MoreComments.rateLimit(null, "120", 1_000));
        assertNull(MoreComments.rateLimit("299", null, 1_000));
        assertNull(MoreComments.rateLimit("many", "120", 1_000));
    }

    @Test
    public void theBudgetKeepsTheReserveUntilTheWindowEnds() {
        MoreComments.RateLimit reading = MoreComments.rateLimit("25", "60", 0);
        assertEquals(MoreComments.BATCH, MoreComments.budget(null, 0));
        assertEquals(5, MoreComments.budget(reading, 59_999));
        assertEquals(-5, MoreComments.budget(MoreComments.rateLimit("15", "60", 0), 1_000));
        assertEquals(MoreComments.BATCH, MoreComments.budget(reading, 60_000));
    }

    @Test
    public void asksForPagesAsTheAppDoes() {
        assertEquals("https://oauth.reddit.com/comments/post/_/abc.json?always_show_media=1&profile_img=true&limit=50",
                MoreComments.pageUrl("post", "abc", false, null));
        assertEquals("https://oauth.reddit.com/comments/post/_/p.json?always_show_media=1&profile_img=true&limit=500"
                + "&sort=top", MoreComments.pageUrl("post", "p", true, "top"));
    }

    @Test
    public void answersInTheEndpointsShape() throws Exception {
        JSONArray things = new JSONArray().put(comment("a", LINK));
        JSONObject body = new JSONObject(MoreComments.envelope(things).toString());
        assertEquals("a", body.getJSONObject("json").getJSONObject("data").getJSONArray("things")
                .getJSONObject(0).getJSONObject("data").getString("id"));
        assertEquals(0, body.getJSONObject("json").getJSONArray("errors").length());
    }

    @Test
    public void ownsOnlyTheMoreChildrenEndpoint() {
        assertTrue(MoreComments.handles("https://oauth.reddit.com/api/morechildren?always_show_media=1&profile_img=true"));
        assertFalse(MoreComments.handles("https://oauth.reddit.com/comments/abc.json"));
    }
}
