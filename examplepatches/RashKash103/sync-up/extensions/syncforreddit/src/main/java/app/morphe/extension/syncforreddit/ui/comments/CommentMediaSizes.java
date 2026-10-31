package app.morphe.extension.syncforreddit.ui.comments;

import androidx.annotation.NonNull;

import org.json.JSONObject;

import java.io.IOException;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;

import okhttp3.HttpUrl;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * How big the pictures in a comment are, taken from what Reddit says as it says it.
 *
 * <p>Reddit sends the size of every picture it hosts alongside the comments that mention them.
 * Read here, the size is known before a comment is drawn, so the picture goes in the right shape
 * the first time rather than standing as a card until it has been asked about. That is the same
 * ground Sync draws one inline on.
 *
 * <p>What Reddit hosts it gives sizes for. A giphy picture it does not, so that one is measured,
 * started here so it is usually answered before the comment reaches the screen.
 *
 * @noinspection unused
 */
public class CommentMediaSizes extends PatchedditInterceptor {
    /** What Reddit calls the sizes it sends beside the text. */
    private static final String THE_SIZES = "media_metadata";

    /** Where the full-size one is described. */
    private static final String FULL_SIZE = "s";

    /** How Reddit names a giphy picture, which it gives no size for. */
    private static final Pattern A_GIPHY_ONE = Pattern.compile("^giphy\\|([A-Za-z0-9]+)$");

    private static final String GIPHY_URL = "https://media.giphy.com/media/";

    /** What Sync asks giphy for, which has to match or the size would be of something else. */
    private static final String GIPHY_SIZE = "/200.gif";

    /** How long the comments wait altogether for the sizes Reddit did not send. */
    private static final long ASKING_TIME = 2500;

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        Response response = chain.proceed(request);
        if (!isPatchIncluded() || !worthReading(request.url())) {
            return response;
        }

        try {
            ResponseBody body = response.body();
            if (body == null) {
                return response;
            }
            String text = body.string();
            if (text.contains(THE_SIZES)) {
                if (read(text) > 0) {
                    // The ones Reddit gave no size for are being measured. Waited for here,
                    // where there is still time: the comments have not reached the screen, so
                    // a picture whose size arrives now is drawn in shape rather than standing
                    // as a card until it has been asked about.
                    InlineCommentMediaPatch.awaitMeasures(ASKING_TIME);
                }
            }
            // Read once: the body is a stream, so what was taken has to be put back.
            return response.newBuilder()
                    .body(ResponseBody.create(text, body.contentType()))
                    .build();
        } catch (Exception ex) {
            Logger.printInfo(() -> "inline comments: could not read the sizes Reddit sent: " + ex);
            return response;
        }
    }

    /** @return Whether this is something comments come back in. */
    private static boolean worthReading(HttpUrl url) {
        if (!url.host().endsWith("reddit.com")) {
            return false;
        }
        String path = url.encodedPath();
        return path.contains("/comments/") || path.contains("/api/morechildren");
    }

    /**
     * Walks the reply for what Reddit said about each picture. Done by hand rather than by
     * parsing the whole of it as one object: a thread is large, and only one field is wanted.
     */
    private static int read(String text) {
        int at = 0;
        int found = 0;
        int asked = 0;
        while ((at = text.indexOf(THE_SIZES, at)) >= 0) {
            int start = text.indexOf('{', at);
            if (start < 0) {
                break;
            }
            String block = objectAt(text, start);
            at = start + 1;
            if (block == null) {
                continue;
            }
            try {
                int[] counted = sizesIn(new JSONObject(block));
                found += counted[0];
                asked += counted[1];
            } catch (Exception ignored) {
                // Not the object hoped for; the next one may be.
            }
        }
        if (found > 0 || asked > 0) {
            final int said = found;
            final int asking = asked;
            Logger.printDebug(() -> "inline comments: Reddit sent the size of " + said
                    + " picture(s), and " + asking + " had to be asked about");
        }
        return asked;
    }

    /** @return How many sizes were taken from this object, and how many had to be asked for. */
    private static int[] sizesIn(JSONObject sizes) {
        int found = 0;
        int asked = 0;
        for (Iterator<String> names = sizes.keys(); names.hasNext(); ) {
            String name = names.next();
            JSONObject about = sizes.optJSONObject(name);
            if (about == null) {
                continue;
            }

            JSONObject full = about.optJSONObject(FULL_SIZE);
            if (full != null) {
                int wide = full.optInt("x");
                int tall = full.optInt("y");
                for (String where : new String[]{ "u", "gif", "mp4" }) {
                    String link = full.optString(where, "");
                    if (!link.isEmpty()) {
                        InlineCommentMediaPatch.remember(link, wide, tall);
                        found++;
                    }
                }
                continue;
            }

            // Reddit says nothing about a giphy picture but does name it, which is enough to
            // start asking how big it is.
            Matcher giphy = A_GIPHY_ONE.matcher(name);
            if (giphy.matches()) {
                InlineCommentMediaPatch.measureSoon(
                        GIPHY_URL + giphy.group(1) + GIPHY_SIZE);
                asked++;
            }
        }
        return new int[]{ found, asked };
    }

    /** @return The object beginning at this brace, or null where it does not close. */
    private static String objectAt(String text, int start) {
        int depth = 0;
        boolean inString = false;
        boolean escaped = false;
        for (int at = start; at < text.length(); at++) {
            char c = text.charAt(at);
            if (escaped) {
                escaped = false;
                continue;
            }
            if (c == '\\' && inString) {
                escaped = true;
                continue;
            }
            if (c == '"') {
                inString = !inString;
                continue;
            }
            if (inString) {
                continue;
            }
            if (c == '{') {
                depth++;
            } else if (c == '}' && --depth == 0) {
                return text.substring(start, at + 1);
            }
        }
        return null;
    }
}
