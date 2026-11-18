// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.TreeMap;
import org.junit.After;
import org.junit.Test;

public class RequestHookTest {
    private static final String INFO = "https://oauth.reddit.com/api/info.json?id=t3_abc";

    /** Stands in for the app's pair class, whose toString() reads like AndroidX's. */
    private static final class Pair {
        final Object first;
        final Object second;

        Pair(Object first, Object second) {
            this.first = first;
            this.second = second;
        }

        @Override
        public String toString() {
            return "Pair{" + first + " " + second + "}";
        }
    }

    private static class Fake extends RequestHook.Handler {
        boolean on = true;
        boolean get;
        RuntimeException rewriteError;
        Exception responseError;
        RequestHook.Request seen;

        @Override
        protected boolean isOn() {
            return on;
        }

        @Override
        protected boolean handles(RequestHook.Request request) {
            return request.appUrl.contains("/api/info.json");
        }

        @Override
        protected void rewrite(RequestHook.Request request) {
            seen = request;
            request.url = "https://oauth.reddit.com/comments/abc.json";
            if (get) request.sendWithoutForm();
            if (rewriteError != null) throw rewriteError;
        }

        @Override
        protected InputStream response(RequestHook.Request request, InputStream body) throws Exception {
            if (responseError != null) throw responseError;
            return stream("changed");
        }
    }

    @After
    public void clearThread() throws IOException {
        // Leaves no claim behind for the next test on this thread.
        RequestHook.response(stream(""));
    }

    @Test
    public void leavesEverythingAloneWithoutHandlers() throws IOException {
        InputStream body = stream("{}");
        assertEquals(INFO, RequestHook.request(null, INFO, "token", null));
        assertTrue(RequestHook.sendsForm());
        assertSame(body, RequestHook.response(body));
    }

    @Test
    public void leavesEverythingAloneWhileTheHandlerIsOff() throws IOException {
        Fake fake = new Fake();
        fake.on = false;
        InputStream body = stream("{}");
        assertEquals(INFO, RequestHook.dispatch(new RequestHook.Handler[] {fake}, INFO, null, null));
        assertSame(body, RequestHook.response(body));
        assertNull(fake.seen);
    }

    @Test
    public void rewritesTheRequestAndItsReply() throws IOException {
        Fake fake = new Fake();
        fake.get = true;
        String url = RequestHook.dispatch(new RequestHook.Handler[] {fake}, INFO, "token", null);
        assertEquals("https://oauth.reddit.com/comments/abc.json", url);
        assertEquals(INFO, fake.seen.appUrl);
        assertEquals("token", fake.seen.token);
        assertFalse(RequestHook.sendsForm());
        assertEquals("changed", read(RequestHook.response(stream("{}"))));
        // The reply ended the claim: the next reply on this thread passes through.
        InputStream next = stream("{}");
        assertSame(next, RequestHook.response(next));
    }

    @Test
    public void passesOtherRequestsThrough() throws IOException {
        Fake fake = new Fake();
        String other = "https://oauth.reddit.com/r/android/hot.json";
        assertEquals(other, RequestHook.dispatch(new RequestHook.Handler[] {fake}, other, null, null));
        assertTrue(RequestHook.sendsForm());
        InputStream body = stream("{}");
        assertSame(body, RequestHook.response(body));
    }

    @Test
    public void aNewRequestDropsAnUnansweredClaim() throws IOException {
        Fake fake = new Fake();
        fake.get = true;
        RequestHook.dispatch(new RequestHook.Handler[] {fake}, INFO, null, null);
        // The first request failed before its reply; the next one is the app's own.
        RequestHook.dispatch(new RequestHook.Handler[] {fake}, "https://oauth.reddit.com/.json", null, null);
        assertTrue(RequestHook.sendsForm());
        InputStream body = stream("{}");
        assertSame(body, RequestHook.response(body));
    }

    @Test
    public void sendsTheAppsRequestWhenARewriteFails() throws IOException {
        Fake fake = new Fake();
        fake.get = true;
        fake.rewriteError = new IllegalStateException("broken");
        assertEquals(INFO, RequestHook.dispatch(new RequestHook.Handler[] {fake}, INFO, null, null));
        assertTrue(RequestHook.sendsForm());
        InputStream body = stream("{}");
        assertSame(body, RequestHook.response(body));
    }

    @Test
    public void failsTheRequestWhenItsReplyCantBeChanged() {
        Fake fake = new Fake();
        fake.responseError = new IllegalStateException("bad JSON");
        RequestHook.dispatch(new RequestHook.Handler[] {fake}, INFO, null, null);
        try {
            RequestHook.response(stream("{}"));
            fail("expected an IOException");
        } catch (IOException expected) {
            assertTrue(expected.getCause() instanceof IllegalStateException);
        }
    }

    @Test
    public void readsTheFormFromTheAppsPairs() {
        Map<String, String> form = RequestHook.form(new Object[] {
            new Pair("link_id", "t3_abc"), new Pair("children", "c1,c2"), new Pair("text", "two words}"),
        });
        assertEquals("{link_id=t3_abc, children=c1,c2, text=two words}}", form.toString());
    }

    @Test
    public void handsTheFormToTheHandler() {
        Fake fake = new Fake();
        RequestHook.dispatch(new RequestHook.Handler[] {fake}, INFO, null, new Object[] {new Pair("api_type", "json")});
        assertEquals("json", fake.seen.form.get("api_type"));
    }

    @Test
    public void readsNoFormFromSomethingElse() {
        assertNull(RequestHook.form(null));
        assertEquals(0, RequestHook.form(new Object[0]).size());
        assertNull(RequestHook.form(new Object[] {"api_type=json"}));
    }

    @Test
    public void getsOnlyRedditApiUrls() {
        assertTrue(RequestHook.isRedditApi("https://oauth.reddit.com/comments/abc.json"));
        assertFalse(RequestHook.isRedditApi("http://oauth.reddit.com/comments/abc.json"));
        assertFalse(RequestHook.isRedditApi("https://i.redd.it/abc.jpg"));
        assertFalse(RequestHook.isRedditApi("https://reddit.com.example.org/r/x.json"));
        assertFalse(RequestHook.isRedditApi("https://oauth.reddit.com/api/v1/access_token"));
        assertFalse(RequestHook.isRedditApi("not a url"));
        assertFalse(RequestHook.isRedditApi(null));
        try {
            new RequestHook.Request(INFO, "token", null).get("https://example.org/");
            fail("expected an IOException");
        } catch (IOException expected) {
            assertTrue(expected.getMessage().contains("example.org"));
        }
    }

    @Test
    public void resolvesRedirectsForRechecking() throws IOException {
        String from = "https://oauth.reddit.com/comments/abc.json";
        assertNull(RequestHook.redirectTarget(from, reply(200, "https://example.org/")));
        assertNull(RequestHook.redirectTarget(from, reply(302, null)));
        assertEquals("https://oauth.reddit.com/r/x/comments/abc.json",
                RequestHook.redirectTarget(from, reply(302, "/r/x/comments/abc.json")));
        String away = RequestHook.redirectTarget(from, reply(307, "https://example.org/steal"));
        assertEquals("https://example.org/steal", away);
        assertFalse(RequestHook.isRedditApi(away));
    }

    private static Http.Reply reply(int status, String location) {
        Map<String, String> headers = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        if (location != null) headers.put("location", location);
        return new Http.Reply(status, new byte[0], headers);
    }

    private static InputStream stream(String text) {
        return new ByteArrayInputStream(text.getBytes(StandardCharsets.UTF_8));
    }

    private static String read(InputStream in) throws IOException {
        return new String(Http.readAll(in), StandardCharsets.UTF_8);
    }
}
