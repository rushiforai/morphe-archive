package app.morphe.extension.syncforreddit.http.posts;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * Makes an address written in a post something that can be followed.
 *
 * <p>Sync draws a link where one is written as a link, and turns a bare address into one only
 * where it recognises it: Reddit's own, Imgur's, and a couple besides. Everything else stays the
 * words it was written as. The markdown it draws with could turn any address into a link, but
 * the copy Sync carries offers no way to ask it to, so the address is written as a link instead.
 *
 * <p>Both what a feed carries and what a thread carries are written, because a post is drawn
 * from whichever arrived first.
 *
 * @noinspection unused
 */
public class TappableLinksPatch extends PatchedditInterceptor {
    /**
     * A link already written as one, or an address on its own. Taking them together is what keeps
     * the two apart: a link is matched whole and put back untouched, so the address inside it is
     * never seen as one standing on its own. Matching only addresses would find that one too and
     * wrap it again, leaving brackets within brackets that stop the post being drawn at all.
     */
    private static final Pattern WRITTEN = Pattern.compile(
            "(\\[[^\\]\\n]*\\]\\([^)\\s]*\\))|(?<![\\w@.<])(https?://[^\\s<>\\[\\]()]+)");

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();

        if (!url.host().endsWith("reddit.com")) {
            return chain.proceed(request);
        }

        Response response = chain.proceed(request);
        if (!response.isSuccessful() || response.body() == null) {
            return response;
        }

        MediaType contentType = response.body().contentType();
        if (contentType != null && !"text".equals(contentType.type())
                && !contentType.subtype().contains("json")) {
            // Anything but a picture may carry a post in it, and what a response calls itself is
            // not to be relied on: the interceptor that puts removed text back asks nothing
            // about the kind and works on every listing this one was passing over.
            return response;
        }

        String original = response.body().string();
        response.close();

        try {
            String rewritten = written(original);
            return rebuilt(response, request, contentType,
                    rewritten != null ? rewritten : original);
        } catch (Throwable ex) {
            // A post that cannot be tapped is a far better outcome than one that will not draw.
            Logger.printInfo(() -> "Could not write the links in a post: " + ex);
            return rebuilt(response, request, contentType, original);
        }
    }

    /**
     * @return The rewritten body, or null where no post had an address to write.
     */
    @Nullable
    private static String written(String body) throws JSONException {
        if (body.isEmpty()) {
            return null;
        }

        if (body.charAt(0) == '[') {
            JSONArray listings = new JSONArray(body);
            boolean changed = false;
            for (int i = 0; i < listings.length(); i++) {
                changed |= writePosts(listings.optJSONObject(i));
            }
            return changed ? listings.toString() : null;
        }

        if (body.charAt(0) == '{') {
            JSONObject listing = new JSONObject(body);
            return writePosts(listing) ? listing.toString() : null;
        }
        return null;
    }

    private static boolean writePosts(@Nullable JSONObject listing) throws JSONException {
        JSONObject data = listing == null ? null : listing.optJSONObject("data");
        JSONArray children = data == null ? null : data.optJSONArray("children");
        if (children == null) {
            return false;
        }

        boolean changed = false;
        for (int i = 0; i < children.length(); i++) {
            JSONObject child = children.optJSONObject(i);
            JSONObject post = child == null ? null : child.optJSONObject("data");
            if (post == null) continue;

            String text = post.optString("selftext", "");
            if (text.isEmpty()) continue;

            String written = write(text);
            if (!written.equals(text)) {
                post.put("selftext", written);
                changed = true;
            }
        }
        return changed;
    }

    private static String write(String text) {
        Matcher written = WRITTEN.matcher(text);
        StringBuffer out = new StringBuffer(text.length());

        while (written.find()) {
            String alreadyALink = written.group(1);
            String replacement = alreadyALink != null
                    ? alreadyALink
                    : "[" + written.group(2) + "](" + written.group(2) + ")";
            written.appendReplacement(out, Matcher.quoteReplacement(replacement));
        }
        written.appendTail(out);
        return out.toString();
    }

    private static Response rebuilt(Response response, Request request, MediaType contentType,
                                    String body) {
        return response.newBuilder()
                .request(request)
                .body(ResponseBody.create(body, contentType))
                .build();
    }
}
