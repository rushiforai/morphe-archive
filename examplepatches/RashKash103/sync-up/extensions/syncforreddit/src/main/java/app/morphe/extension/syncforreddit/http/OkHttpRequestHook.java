package app.morphe.extension.syncforreddit.http;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.requests.BaseOkHttpRequestHook;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.RedirectGfycatPatch;
import app.morphe.extension.syncforreddit.http.comments.FixMoreCommentsPatch;
import app.morphe.extension.syncforreddit.http.comments.PlayCommentVideoPatch;
import app.morphe.extension.syncforreddit.http.imgur.FixImgurProxyPatch;
import app.morphe.extension.syncforreddit.http.posts.FixPostLookupPatch;
import app.morphe.extension.syncforreddit.http.posts.TappableLinksPatch;
import app.morphe.extension.syncforreddit.http.posts.WebsitePreviewImagePatch;
import app.morphe.extension.syncforreddit.ui.banner.SubredditBannerPatch;
import app.morphe.extension.syncforreddit.ui.comments.CommentMediaSizes;
import app.morphe.extension.syncforreddit.http.profile.ArchivedProfilePatch;
import app.morphe.extension.syncforreddit.http.imgur.RecoverThumbnailsPatch;
import app.morphe.extension.syncforreddit.http.imgur.UndeleteImgurPatch;
import app.morphe.extension.syncforreddit.http.undelete.UndeleteRedditPatch;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;

/**
 * Sync bundles a modified Volley whose BasicNetwork issues okhttp3 calls directly, so a single
 * interceptor placed on the client it uses sees every Reddit API request.
 *
 * <p>Each interceptor here belongs to a patch of its own and passes requests straight through
 * unless that patch was included, so registering them all is harmless.
 *
 * @noinspection unused
 */
public class OkHttpRequestHook extends BaseOkHttpRequestHook {
    // Held at its own type: the getters below are protected, and Java only allows a subclass
    // to reach those through a reference of its own type, not through the base class field.
    private static final OkHttpRequestHook HOOK = new OkHttpRequestHook();

    // Keyed by source client, because this is installed at more than one site and Sync's
    // Volley and Glide each have a client of their own. A single slot would rebuild the
    // derived client on every call as the two sites took turns.
    private static final Map<OkHttpClient, OkHttpClient> instrumented = new IdentityHashMap<>();
    private static final Map<OkHttpClient, OkHttpClient> drawing = new IdentityHashMap<>();

    /**
     * What each instrumented client was made from. Sync hands its clients out through getters
     * that are themselves hooked, so by the time one reaches the drawing side it has been
     * instrumented already, and adding the mark to that would put it on last again.
     */
    private static final Map<OkHttpClient, OkHttpClient> madeFrom = new IdentityHashMap<>();

    private OkHttpRequestHook() {}

    /**
     * Adds what the hook listens with, in the order it listens in.
     */
    private static void addInterceptors(OkHttpClient.Builder builder) {
        init();
        for (Interceptor interceptor : HOOK.getInterceptors()) {
            builder.addInterceptor(interceptor);
        }
        for (Interceptor interceptor : HOOK.getNetworkInterceptors()) {
            builder.addNetworkInterceptor(interceptor);
        }
    }

    public static void init() {
        if (INSTANCE == null) {
            INSTANCE = HOOK;
        }
    }

    /**
     * Derives a client carrying the interceptors. Called with the client Volley makes every
     * call with, so the result is cached rather than rebuilt per request.
     */
    /**
     * The header naming a request as one made to draw a picture. Some addresses are asked for by
     * both the part of Sync that plays something and the part that draws it, and what suits one
     * is of no use to the other, so the client Sync draws through says so.
     */
    public static final String IMAGE_REQUEST = "X-Sync-Up-Image";

    /**
     * As {@link #install}, for the client Sync hands whatever draws its pictures.
     */
    public static synchronized OkHttpClient installForImages(OkHttpClient client) {
        if (client == null) {
            return null;
        }

        OkHttpClient existing = drawing.get(client);
        if (existing != null) {
            return existing;
        }

        // The mark has to go on before anything reads it, and an interceptor added to a client
        // that already has them runs after all of them, so this is built from the plain client.
        OkHttpClient plain = madeFrom.get(client);
        if (plain == null) {
            plain = client;
        }

        OkHttpClient.Builder builder = plain.newBuilder();
        builder.addInterceptor(chain -> chain.proceed(chain.request().newBuilder()
                .header(IMAGE_REQUEST, "1")
                .build()));
        addInterceptors(builder);

        OkHttpClient derived = builder.build();
        drawing.put(plain, derived);
        drawing.put(client, derived);
        drawing.put(derived, derived);
        // Whatever else asks about this one has it accounted for.
        instrumented.put(client, derived);
        instrumented.put(derived, derived);
        return derived;
    }

    public static synchronized OkHttpClient install(OkHttpClient client) {
        if (client == null) {
            // Sync hands out its clients through getters that read a field, and a field can be
            // read before it has been filled in.
            return null;
        }
        init();

        OkHttpClient existing = instrumented.get(client);
        if (existing != null) {
            return existing;
        }

        OkHttpClient.Builder builder = client.newBuilder();
        addInterceptors(builder);

        OkHttpClient derived = builder.build();
        instrumented.put(client, derived);
        // The derived client is handed back to callers, so it can come back in as the source.
        instrumented.put(derived, derived);
        madeFrom.put(derived, client);
        return derived;
    }

    @Override
    protected List<Interceptor> getInterceptors() {
        List<Interceptor> interceptors = new ArrayList<>();
        interceptors.add(new UndeleteRedditPatch());
        interceptors.add(new PlayCommentVideoPatch());
        interceptors.add(new TappableLinksPatch());
        interceptors.add(new ArchivedProfilePatch());
        // Ahead of the undelete: both of these answer by reissuing the request against an
        // ordinary Imgur address, and a request reissued from here carries on down the chain
        // rather than starting again at the top. An image linked in a comment goes through the
        // proxy, which is why one has never been recovered.
        interceptors.add(new FixImgurProxyPatch());
        interceptors.add(new RecoverThumbnailsPatch());
        interceptors.add(new UndeleteImgurPatch());
        interceptors.add(RedirectGfycatPatch.get());
        interceptors.add(new WebsitePreviewImagePatch());
        interceptors.add(new SubredditBannerPatch());
        interceptors.add(new CommentMediaSizes());
        // Last, so that the listing it builds is seen by everything above that reads one,
        // exactly as the response it stands in for would have been.
        interceptors.add(new FixPostLookupPatch());
        interceptors.add(new FixMoreCommentsPatch());
        return interceptors;
    }

    @Override
    protected List<Interceptor> getNetworkInterceptors() {
        return new ArrayList<>();
    }
}
