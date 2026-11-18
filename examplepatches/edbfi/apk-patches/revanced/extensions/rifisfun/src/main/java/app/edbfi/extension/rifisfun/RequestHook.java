// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.util.Log;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Lets feature patches change the Reddit API requests the app sends through its request engine, and their replies.
 * The engine calls {@link #request} just before it builds a request, {@link #sendsForm} where it would add a POST
 * form, and {@link #response} with the body of a successful (1xx-3xx) reply before the app parses it. All three run
 * on the request's thread.
 *
 * <p>A feature adds one {@link Handler} to {@link #HANDLERS}; its patch depends on the request hook patch and turns
 * the handler on. With no handler on, every request and reply passes through unchanged.
 *
 * <p>Reddit's API goes through the engine, and so did the Imgur album viewer, which the Fix Imgur patch takes off it.
 * Redgifs and other hosts are requested with the app's OkHttp clients directly and need a hook of their own where the
 * app builds the request.
 */
public final class RequestHook {
    /** One line per feature, for example {@code Galleries.HANDLER,}. A request goes to the first handler that takes it. */
    private static final Handler[] HANDLERS = {
        MoreComments.HANDLER,
        Galleries.HANDLER,
    };

    /** The request the current thread's engine call is sending, while a handler has it. */
    private static final ThreadLocal<Claim> CURRENT = new ThreadLocal<>();

    private RequestHook() {}

    /** What a feature changes. Its methods run for the requests it {@link #handles}; exceptions are logged. */
    public abstract static class Handler {
        /** Whether the feature's patch turned it on, usually the feature class's {@code isEnabled()}. */
        protected abstract boolean isOn();

        /** Whether the handler takes this request. Runs for every request while it is on: keep it cheap. */
        protected abstract boolean handles(Request request);

        /**
         * Changes the request before it is sent: {@link Request#url} and {@link Request#sendWithoutForm}. Should it
         * throw, the app's own request goes out and {@link #response} isn't called.
         */
        protected void rewrite(Request request) throws Exception {}

        /**
         * The body the app parses instead of a successful reply's. May read {@code body} and return a new stream, or
         * send more requests, such as with {@link Request#get}. Should it throw, the app treats the request as failed.
         */
        protected InputStream response(Request request, InputStream body) throws Exception {
            return body;
        }
    }

    /** One request the engine is about to send. */
    public static final class Request {
        /** The URL the app would send, after it moved Reddit URLs to oauth.reddit.com for a token. */
        public final String appUrl;
        /** The bearer token the request carries, or null without one. */
        public final String token;
        /** The POST form fields in order, or null for a request without a form or one whose form didn't read. */
        public final Map<String, String> form;
        /** The URL to send instead; {@link #appUrl} until a handler changes it. */
        public String url;
        private boolean withoutForm;

        Request(String appUrl, String token, Map<String, String> form) {
            this.appUrl = appUrl;
            this.token = token;
            this.form = form;
            this.url = appUrl;
        }

        /** Sends the request as a GET, without the app's form. */
        public void sendWithoutForm() {
            withoutForm = true;
        }

        boolean sendsForm() {
            return !withoutForm;
        }

        /**
         * A GET of another Reddit API URL with this request's token and Reddit's User-Agent. Throws for any other URL,
         * and for a redirect to one, so the token never goes elsewhere.
         */
        public Http.Reply get(String url) throws IOException {
            return get(url, Http.TIMEOUT_MS);
        }

        /** As {@link #get(String)}, with {@code timeoutMs} for each hop's connection and reads. */
        public Http.Reply get(String url, int timeoutMs) throws IOException {
            Map<String, String> headers = new LinkedHashMap<>();
            if (token != null) headers.put("Authorization", "bearer " + token);
            headers.put("User-Agent", SpoofClient.redditUserAgent());
            for (int hop = 0; hop <= MAX_REDIRECTS; hop++) {
                if (!isRedditApi(url)) throw new IOException("Not a Reddit API URL: " + url);
                Http.Reply reply = Http.send("GET", url, headers, null, false, timeoutMs);
                String target = redirectTarget(url, reply);
                if (target == null) return reply;
                url = target;
            }
            throw new IOException("Too many redirects, last to " + url);
        }
    }

    static final int MAX_REDIRECTS = 5;

    /** Where a redirect reply to {@code url} points, or null for a reply that isn't a redirect. */
    static String redirectTarget(String url, Http.Reply reply) throws IOException {
        String location = reply.headers.get("Location");
        boolean redirect = reply.status == 301 || reply.status == 302 || reply.status == 303
                || reply.status == 307 || reply.status == 308;
        if (!redirect || location == null) return null;
        try {
            return new URI(url).resolve(location.trim()).toString();
        } catch (URISyntaxException | IllegalArgumentException error) {
            throw new IOException("Bad redirect from " + url, error);
        }
    }

    /** Whether {@code url} is an https URL that takes Reddit's API token. */
    static boolean isRedditApi(String url) {
        if (url == null) return false;
        try {
            URI uri = new URI(url);
            String scheme = uri.getScheme();
            return "https".equalsIgnoreCase(scheme) && SpoofClient.usesAppToken(scheme, uri.getHost(), uri.getPath());
        } catch (URISyntaxException error) {
            return false;
        }
    }

    private static final class Claim {
        final Handler handler;
        final Request request;

        Claim(Handler handler, Request request) {
            this.handler = handler;
            this.request = request;
        }
    }

    /**
     * Called by the engine with the URL it is about to send, the bearer token it adds (or null), and the form of a
     * POST as the app's own pair objects (or null). Returns the URL to send.
     */
    public static String request(Object engine, String url, String token, Object[] form) {
        return dispatch(HANDLERS, url, token, form);
    }

    static String dispatch(Handler[] handlers, String url, String token, Object[] form) {
        CURRENT.remove();
        Request request = null;
        for (Handler handler : handlers) {
            try {
                if (!handler.isOn()) continue;
                if (request == null) request = new Request(url, token, form(form));
                if (!handler.handles(request)) continue;
                handler.rewrite(request);
                CURRENT.set(new Claim(handler, request));
                return request.url;
            } catch (Exception error) {
                Log.w(App.TAG, "Request hook failed for " + url, error);
                return url;
            }
        }
        return url;
    }

    /** Whether the engine adds the app's form to the request it is building. */
    public static boolean sendsForm() {
        Claim claim = CURRENT.get();
        return claim == null || claim.request.sendsForm();
    }

    /** Called by the engine with a successful reply's body; returns the body the app parses. */
    public static InputStream response(InputStream body) throws IOException {
        Claim claim = CURRENT.get();
        CURRENT.remove();
        if (claim == null) return body;
        try {
            return claim.handler.response(claim.request, body);
        } catch (IOException error) {
            Log.w(App.TAG, "Response hook failed for " + claim.request.url, error);
            throw error;
        } catch (Exception error) {
            Log.w(App.TAG, "Response hook failed for " + claim.request.url, error);
            throw new IOException("Response hook failed for " + claim.request.url, error);
        }
    }

    /**
     * The form fields of the app's pairs, or null for no form or one that doesn't read. The pair class is AndroidX's
     * {@code Pair}, renamed, so its fields can't be named here; its {@code toString()} is {@code Pair{<first>
     * <second>}}, and form field names hold no space.
     */
    static Map<String, String> form(Object[] pairs) {
        if (pairs == null) return null;
        Map<String, String> fields = new LinkedHashMap<>();
        for (Object pair : pairs) {
            String text = String.valueOf(pair);
            int space = text.indexOf(' ');
            if (!text.startsWith("Pair{") || !text.endsWith("}") || space < 0) return null;
            fields.put(text.substring("Pair{".length(), space), text.substring(space + 1, text.length() - 1));
        }
        return Collections.unmodifiableMap(fields);
    }
}
