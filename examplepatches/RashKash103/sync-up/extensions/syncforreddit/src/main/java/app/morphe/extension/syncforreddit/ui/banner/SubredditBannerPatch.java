package app.morphe.extension.syncforreddit.ui.banner;

import android.graphics.Bitmap;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;

import androidx.annotation.NonNull;

import java.io.IOException;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.requests.PatchedditInterceptor;
import app.morphe.extension.syncforreddit.settings.SyncUpSettings;

import okhttp3.HttpUrl;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/**
 * The subreddit's banner, at the top of its feed rather than only on its About page.
 *
 * <p>Two halves: what goes past on the wire is watched for Reddit's answer about a subreddit, so
 * the banner is known without reaching into Sync's own model of it; and the feed is given a strip
 * at the top to draw it in.
 *
 * @noinspection unused
 */
public class SubredditBannerPatch extends PatchedditInterceptor {
    private static final String SHOW_BANNER = "sync_up_subreddit_banner";

    /** What the strip is tagged with, so it is found again rather than added twice. */
    private static final String TAG = "sync-up-subreddit-banner";

    private static final int HEIGHT_DP = 72;

    /** Kept between the banner and the first post, which otherwise sit against each other. */
    private static final int GAP_DP = 8;

    private static boolean said;

    @Override
    public boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    // region What goes past on the wire.

    @NonNull
    @Override
    protected Response doIntercept(@NonNull Chain chain) throws IOException {
        Request request = chain.request();
        HttpUrl url = request.url();

        // Borrowed off whatever Sync is asking, so a subreddit never asked about can be.
        if (url.host().endsWith("reddit.com")) {
            SubredditBanners.noticeCredentials(
                    request.header("Authorization"), request.header("User-Agent"));
        }

        Response response = chain.proceed(request);
        String subreddit = aboutWhichSubreddit(url);
        if (subreddit == null) {
            return response;
        }

        try {
            ResponseBody body = response.body();
            if (body == null) {
                return response;
            }
            String text = body.string();
            SubredditBanners.notice(subreddit, text);
            // Read once: the body is a stream, so what was taken has to be put back.
            return response.newBuilder()
                    .body(ResponseBody.create(text, body.contentType()))
                    .build();
        } catch (Exception ex) {
            Logger.printInfo(() -> "banner: could not read the reply about r/" + subreddit
                    + ": " + ex);
            return response;
        }
    }

    /** @return The subreddit a request is asking about, or null where it asks something else. */
    private static String aboutWhichSubreddit(HttpUrl url) {
        java.util.List<String> parts = url.pathSegments();
        for (int at = 0; at + 2 < parts.size(); at++) {
            if ("r".equals(parts.get(at)) && parts.get(at + 2).startsWith("about")) {
                return parts.get(at + 1);
            }
        }
        return null;
    }

    // endregion

    // region The strip at the top of the feed.

    /**
     * Called as the feed's view is made. What the feed is about is not asked of the fragment,
     * whose every accessor is obfuscated, but taken from where Sync hands it to its own button.
     */
    public static void attach(View root) {
        if (!isIncluded()) {
            return;
        }
        try {
            if (!said) {
                said = true;
                SyncUpSettings.report("banner", SHOW_BANNER);
            }
            if (!SyncUpSettings.flag(SHOW_BANNER, true)) {
                Logger.printDebug(() -> "banner: turned off");
                return;
            }

            String subreddit = SubredditBanners.showing();
            Logger.printDebug(() -> "banner: the feed's view was made, showing r/" + subreddit);
            if (subreddit == null) {
                return;
            }
            if (!(root instanceof ViewGroup)) {
                Logger.printInfo(() -> "banner: the feed's view is not one things can go in");
                return;
            }
            // Deferred by a frame: the feed's own view is what arrives here, and the strip goes
            // in whatever holds it, which is not always attached yet.
            root.post(() -> {
                try {
                    draw((ViewGroup) root, subreddit);
                } catch (Throwable ex) {
                    Logger.printInfo(() -> "banner: could not be drawn: " + ex);
                }
            });
        } catch (Throwable ex) {
            // A feed that draws is worth more than the banner above it.
            Logger.printInfo(() -> "banner: could not be added: " + ex);
        }
    }

    /** Reads the patched flag through an instance, since the flag is an instance method. */
    private static boolean isIncluded() {
        return new SubredditBannerPatch().isPatchIncluded();
    }

    private static void draw(ViewGroup feed, String subreddit) {
        ViewGroup holder = feed.getParent() instanceof ViewGroup
                ? (ViewGroup) feed.getParent() : null;
        if (holder == null) {
            Logger.printInfo(() -> "banner: the feed is not in anything the strip can go in");
            return;
        }

        ImageView strip = holder.findViewWithTag(TAG);
        if (strip != null && !subreddit.equals(strip.getTag(WHOSE))) {
            // Another subreddit in the same window: what is hanging there belongs to the last
            // one, and standing until the next picture arrives is worse than nothing.
            final ImageView stale = strip;
            Logger.printDebug(() -> "banner: the strip was r/" + stale.getTag(WHOSE)
                    + " and is now r/" + subreddit);
            stale.setImageDrawable(null);
            stale.setVisibility(View.GONE);
            stale.setOnClickListener(null);
            stale.setClickable(false);
            makeRoom(feed, 0);
        }
        if (strip == null) {
            strip = new ImageView(holder.getContext());
            strip.setTag(TAG);
            strip.setScaleType(ImageView.ScaleType.CENTER_CROP);
            strip.setVisibility(View.GONE);

            int height = height(holder);
            if (holder instanceof FrameLayout) {
                // Stacked on top of the feed, which is what a frame does with its children.
                strip.setLayoutParams(new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, height, Gravity.TOP));
            } else {
                Logger.printDebug(() -> "banner: the feed sits in a "
                        + holder.getClass().getName() + ", which is not a frame; placing the "
                        + "strip by its own rules and hoping it lands at the top");
                strip.setLayoutParams(new ViewGroup.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, height));
            }
            // Added last so it is drawn over the posts rather than behind them.
            holder.addView(strip);

            final ViewGroup added = holder;
            Logger.printDebug(() -> "banner: added the strip to " + added.getClass().getName()
                    + ", now " + added.getChildCount() + " children");
        }

        strip.setTag(WHOSE, subreddit);

        final ImageView showing = strip;
        Bitmap picture = SubredditBanners.bannerFor(subreddit,
                () -> showing.post(() -> {
                    try {
                        // Asked again rather than taken from here: by the time this runs the
                        // window may be showing something else, and drawing what it was showing
                        // when the strip went up is how the last subreddit's banner stayed.
                        String nowShowing = SubredditBanners.showing();
                        if (nowShowing != null) {
                            draw(feed, nowShowing);
                        }
                    } catch (Throwable ex) {
                        Logger.printInfo(() -> "banner: could not be drawn: " + ex);
                    }
                }));
        if (picture == null) {
            Logger.printDebug(() -> "banner: nothing to draw for r/" + subreddit + " yet");
            makeRoom(feed, 0);
            showing.setVisibility(View.GONE);
            return;
        }
        showing.setImageBitmap(picture);
        showing.setVisibility(View.VISIBLE);
        makeRoom(feed, height(holder) + gap(holder));

        String link = SubredditBanners.linkFor(subreddit);
        if (link != null) {
            showing.setClickable(true);
            showing.setOnClickListener(view -> open(view, link));
        }
        followTheList(feed, showing);
        Logger.printDebug(() -> "banner: drawn for r/" + subreddit);
    }

    /**
     * Opens the banner the way tapping a picture linked in a post opens it.
     *
     * <p>Asked for without what Reddit signs it with: the address is decided on by its ending,
     * and one ending in a signature rather than in .png is taken for a page and handed to a
     * browser. The picture is served either way.
     */
    private static void open(View from, String link) {
        int signature = link.indexOf('?');
        String plain = signature < 0 ? link : link.substring(0, signature);
        try {
            Logger.printDebug(() -> "banner: opening " + plain);
            new mb.d(plain).onClick(from);
        } catch (Throwable ex) {
            Logger.printInfo(() -> "banner: could not open " + plain + ": " + ex);
        }
    }

    /**
     * Moves the banner up with the posts, so it scrolls off rather than standing at the top.
     *
     * <p>How far the list has gone is asked of it by a name the framework gave it, which
     * minifying cannot rename; the name Sync's own androidx would use for a listener can be, and
     * asking for one of those is what would fail without a word.
     */
    private static void followTheList(ViewGroup feed, View strip) {
        View list = listIn(feed);
        if (list == null) {
            return;
        }
        if (Boolean.TRUE.equals(strip.getTag(FOLLOWING))) {
            return;
        }
        strip.setTag(FOLLOWING, Boolean.TRUE);

        strip.getViewTreeObserver().addOnPreDrawListener(() -> {
            try {
                int gone = scrolledBy(list);
                if (gone >= 0) {
                    strip.setTranslationY(-gone);
                }
            } catch (Throwable ex) {
                Logger.printDebug(() -> "banner: could not follow the list: " + ex);
            }
            return true;
        });
        Logger.printDebug(() -> "banner: the strip will now move with the posts");
    }

    /** What the strip is marked with once it is following the list. */
    private static final int FOLLOWING = 0x7E000001;

    /** Which subreddit the strip is currently showing. */
    private static final int WHOSE = 0x7E000002;

    /** How many times the offset is worth writing down before the point is made. */
    private static int said2;

    /** @return How far the list has scrolled, or -1 where it will not say. */
    private static int scrolledBy(View list) {
        try {
            java.lang.reflect.Method how =
                    list.getClass().getMethod("computeVerticalScrollOffset");
            how.setAccessible(true);
            int gone = (Integer) how.invoke(list);
            if (said2 < 3) {
                said2++;
                Logger.printDebug(() -> "banner: the list has gone " + gone + " so far");
            }
            return gone;
        } catch (Throwable ex) {
            if (said2 < 3) {
                said2++;
                Logger.printInfo(() -> "banner: the list will not say how far it has gone: " + ex);
            }
            return -1;
        }
    }

    private static int gap(ViewGroup holder) {
        return (int) (GAP_DP * holder.getContext().getResources().getDisplayMetrics().density);
    }

    private static int height(ViewGroup holder) {
        return (int) (HEIGHT_DP
                * holder.getContext().getResources().getDisplayMetrics().density);
    }

    /**
     * Starts the posts below the strip rather than behind it. The list keeps drawing into the
     * space as it scrolls, so the strip stands still and the posts pass under it.
     */
    private static void makeRoom(ViewGroup feed, int height) {
        View list = listIn(feed);
        if (list == null) {
            Logger.printInfo(() -> "banner: no list in the feed to start below the strip");
            return;
        }
        if (list.getPaddingTop() == height) {
            return;
        }
        if (list instanceof ViewGroup) {
            ((ViewGroup) list).setClipToPadding(false);
        }
        list.setPadding(list.getPaddingLeft(), height, list.getPaddingRight(),
                list.getPaddingBottom());
        Logger.printDebug(() -> "banner: the list now starts " + height + " below the top");
    }

    /** @return The posts themselves, found by what they are rather than by an obfuscated id. */
    private static View listIn(ViewGroup feed) {
        for (int at = 0; at < feed.getChildCount(); at++) {
            View child = feed.getChildAt(at);
            if (child.getClass().getName().contains("RecyclerView")) {
                return child;
            }
        }
        return null;
    }

    // endregion
}
