package app.revanced.extension.rif;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.SequenceInputStream;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * "Explain Reddit blocks": when Reddit's edge answers a feed listing with its HTML "Blocked"
 * page (HTTP 403, "You've been blocked by network security"), rif can't parse the body as its
 * JSON error, skips its token retry and toasts "Error: forbidden" with no reason. We recognise
 * the page where rif parses a listing's 403 body and show a clearer toast instead.
 *
 * Only for requests rif signed in (OAuth, oauth.reddit.com). A logged-out rif gets the same page
 * for every listing (api.reddit.com/hot/.json), permanently, so it keeps rif's own "forbidden".
 *
 * Three hooks: rif's request base calls {@link #noteRequest} as it starts handling a response
 * (says whether the request was signed in), the listing loader's 403 body parser calls
 * {@link #inspect} (flags the loader if the body is the block page and the request was signed
 * in; hands back an equal stream so rif's own parse and failure are unchanged), and the
 * front-page/subreddit fragment's load-error method calls {@link #handle} first (shows our toast
 * and skips rif's when the loader was flagged).
 */
public final class RedditBlocks {

    static final String MESSAGE =
            "Reddit is temporarily blocking requests. Try again in a few minutes.";

    /** The real page is about 190 KB with the text at the very end; read at most this much. */
    private static final int MAX_BODY = 1 << 20;

    /** Loaders whose 403 body was the block page. Written on a worker thread, read on main. */
    private static final Map<Object, Boolean> BLOCKED =
            Collections.synchronizedMap(new WeakHashMap<Object, Boolean>());

    /** Whether the response being handled on this thread answers a signed-in (OAuth) request. */
    private static final ThreadLocal<Boolean> SIGNED_IN = new ThreadLocal<Boolean>();

    private RedditBlocks() {}

    /** Called first thing when rif's request base handles a non-200 response, on the worker thread. */
    public static void noteRequest(boolean signedIn) {
        SIGNED_IN.set(signedIn);
    }

    /**
     * Called with the loader and the 403 response body before rif parses it. Returns a stream
     * with the same bytes. Never throws.
     */
    public static InputStream inspect(Object loader, InputStream in) {
        if (in == null) return in;
        ByteArrayOutputStream head = new ByteArrayOutputStream();
        try {
            byte[] buf = new byte[8192];
            int n;
            while (head.size() < MAX_BODY && (n = in.read(buf)) > 0) {
                head.write(buf, 0, n);
            }
        } catch (Throwable t) {
            // Let rif hit the same read problem itself.
            return new SequenceInputStream(new ByteArrayInputStream(head.toByteArray()), in);
        }
        byte[] bytes = head.toByteArray();
        try {
            if (Boolean.TRUE.equals(SIGNED_IN.get()) && isBlockPage(bytes)) {
                BLOCKED.put(loader, Boolean.TRUE);
            }
        } catch (Throwable t) {
            Log.w("RedditBlocks", "inspect failed", t);
        }
        if (bytes.length < MAX_BODY) return new ByteArrayInputStream(bytes);
        return new SequenceInputStream(new ByteArrayInputStream(bytes), in);
    }

    /**
     * Called first in the listing fragment's load-error method. True when we showed our toast,
     * so rif's own must be skipped. Never throws.
     */
    public static boolean handle(Object loader, Context context) {
        try {
            if (loader == null || BLOCKED.remove(loader) == null) return false;
            Context ctx = context != null ? context : Settings.context();
            if (ctx == null) return false;
            Toast.makeText(ctx, MESSAGE, Toast.LENGTH_LONG).show();
            return true;
        } catch (Throwable t) {
            Log.w("RedditBlocks", "handle failed", t);
            return false;
        }
    }

    /** True for Reddit's HTML block page, false for JSON and every other body. */
    static boolean isBlockPage(byte[] body) {
        if (body == null || body.length == 0) return false;
        int i = 0;
        while (i < body.length && body[i] <= ' ') i++;
        if (i >= body.length || body[i] == '{' || body[i] == '[') return false; // JSON error
        String text = new String(body, java.nio.charset.StandardCharsets.ISO_8859_1)
                .toLowerCase(Locale.ROOT);
        return text.contains("blocked by network security")
                || text.contains("<title>blocked</title>");
    }
}
