package app.morphe.extension.syncforreddit.ui.banner;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.view.View;

import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;

/**
 * What each subreddit says its banner is.
 *
 * <p>Sync asks Reddit about a subreddit when its About page is opened, and the reply carries the
 * banner among everything else. Rather than reach into the model Sync builds out of it — whose
 * every field name is obfuscated — the reply is read here as it goes past, which is the same way
 * everything else in this bundle learns what Reddit said.
 *
 * <p>A feed can be opened without that reply ever having been asked for, so a subreddit nothing
 * is known about is asked about directly, borrowing the credentials off a request of Sync's own.
 *
 * @noinspection unused
 */
public final class SubredditBanners {
    /** What Reddit calls a banner, in the order they are worth showing. */
    private static final String[] NAMES = {
            "banner_background_image", "mobile_banner_image", "banner_img",
    };

    private static final int REMEMBERED = 32;

    /** A subreddit that has been asked about and turned out to have no banner. */
    private static final String NONE = "";

    private static final Map<String, String> banners = Collections.synchronizedMap(
            new LinkedHashMap<String, String>(REMEMBERED, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > REMEMBERED;
                }
            });

    /** Pictures already fetched, so paging back to a feed does not fetch one again. */
    private static final Map<String, Bitmap> drawn = Collections.synchronizedMap(
            new LinkedHashMap<String, Bitmap>(8, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Bitmap> eldest) {
                    return size() > 8;
                }
            });

    /** Borrowed off Sync's own traffic, since Reddit answers nothing without it. */
    private static volatile String authorization;

    private static volatile String userAgent;

    /**
     * What each window's feed is about, recorded where Sync hands it over.
     *
     * <p>Kept per window rather than as one value for the app. A subreddit opened in a new window
     * is a second activity laid over the first, and Sync makes it translucent so the reader can
     * swipe it away — which leaves the feed underneath still drawing. One value for the app was
     * therefore read by both feeds, and the subreddit just opened was drawn over the one the
     * reader had left behind as well as over its own.
     *
     * <p>The window is the activity the view belongs to, held weakly so a window that has gone
     * takes its entry with it.
     */
    private static final Map<Object, String> showing =
            Collections.synchronizedMap(new WeakHashMap<Object, String>());

    /**
     * What to run when a banner becomes known.
     *
     * <p>Reddit's answer about a subreddit usually arrives because Sync asked for it, not
     * because this did, and nothing was then telling the feed to look again: the strip was
     * added, found nothing to draw, and was never asked a second time.
     */
    private static volatile Runnable lookAgain;

    /** Subreddits whose picture is already being fetched, so a redraw does not start another. */
    private static final java.util.Set<String> fetching =
            java.util.Collections.synchronizedSet(new java.util.HashSet<String>());

    private static final Executor FETCHING = Executors.newSingleThreadExecutor();

    private SubredditBanners() {}

    /** Called for every request that goes past, to borrow what Reddit insists on. */
    public static void noticeCredentials(String header, String agent) {
        // Taken however it is written: asking only for one spelling of it left nothing noted
        // at all, and then nothing to ask Reddit with.
        if (header != null && !header.isEmpty() && !header.equals(authorization)) {
            authorization = header;
            Logger.printDebug(() -> "banner: noted the credentials to ask Reddit with ("
                    + header.substring(0, Math.min(12, header.length())) + "…)");
        }
        if (agent != null && !agent.isEmpty()) {
            userAgent = agent;
        }
    }

    /**
     * Called where Sync settles what the feed is about, with the view it settled it on, which is
     * what says which window is meant.
     */
    public static void showing(View where, String subreddit) {
        String named = normalise(subreddit);
        Object window = windowOf(where);
        if (named == null || window == null || named.equals(showing.get(window))) {
            return;
        }
        showing.put(window, named);
        Logger.printDebug(() -> "banner: the feed in " + window.getClass().getSimpleName()
                + " is showing r/" + named);

        // The feed's view is made before this is said, so whatever is hanging there belongs to
        // the subreddit before it and nothing else would ever ask again.
        Runnable again = lookAgain;
        if (again != null) {
            Logger.printDebug(() -> "banner: telling the feed to look again, now r/" + named);
            again.run();
        }
    }

    /** @return What the feed in this view's window is about, or null where nothing has said. */
    @Nullable
    public static String showingIn(@Nullable Context context) {
        Object window = windowOf(context);
        return window == null ? null : showing.get(window);
    }

    @Nullable
    private static Object windowOf(@Nullable View view) {
        return view == null ? null : windowOf(view.getContext());
    }

    /**
     * @return The activity a view belongs to, which is what a window is here. A view is given the
     *         activity to build itself from, sometimes wrapped in a theme, so it is unwrapped
     *         rather than cast.
     */
    @Nullable
    private static Object windowOf(@Nullable Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                return context;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /** @return The address of this subreddit's banner, for opening it as a picture. */
    @Nullable
    public static String linkFor(String subreddit) {
        String named = normalise(subreddit);
        if (named == null) {
            return null;
        }
        String link = banners.get(named);
        return link == null || link.isEmpty() ? null : link;
    }

    /** Reads a reply Reddit gave about a subreddit, whoever asked for it. */
    public static void notice(String subreddit, String body) {
        String named = normalise(subreddit);
        if (named == null || body == null || body.isEmpty()) {
            return;
        }
        try {
            JSONObject about = new JSONObject(body).optJSONObject("data");
            if (about == null) {
                Logger.printDebug(() -> "banner: the reply about r/" + named + " says nothing");
                return;
            }
            String found = pick(about);
            String before = banners.put(named, found == null ? NONE : found);
            Logger.printDebug(() -> "banner: r/" + named + " has "
                    + (found == null ? "no banner" : "a banner at " + found));

            // Whoever asked, the feed showing this subreddit now wants to look again.
            if (found != null && !found.equals(before) && showing.containsValue(named)) {
                Runnable again = lookAgain;
                if (again != null) {
                    Logger.printDebug(() -> "banner: telling the feed to look again at r/" + named);
                    again.run();
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "banner: could not read what Reddit said about r/"
                    + named + ": " + ex);
        }
    }

    @Nullable
    private static String pick(JSONObject about) {
        for (String name : NAMES) {
            String held = about.optString(name, "");
            if (held != null && held.startsWith("http")) {
                // Written as text in JSON, so its ampersands come escaped.
                return held.replace("&amp;", "&");
            }
        }
        return null;
    }

    /**
     * @return The banner for this subreddit, fetched and decoded, or null where it has none or
     *         nothing is known about it yet. Never blocks: a subreddit not yet asked about is
     *         asked in the background and the answer arrives on a later pass.
     */
    @Nullable
    public static Bitmap bannerFor(String subreddit, Runnable whenKnown) {
        String named = normalise(subreddit);
        if (named == null) {
            return null;
        }
        // Held so that an answer arriving from anywhere can ask the feed to look again.
        lookAgain = whenKnown;

        Bitmap already = drawn.get(named);
        if (already != null) {
            return already;
        }

        String link = banners.get(named);
        if (link == null) {
            Logger.printDebug(() -> "banner: nothing known about r/" + named + " yet, asking");
            askAbout(named, whenKnown);
            return null;
        }
        if (link.isEmpty()) {
            return null;
        }

        if (!fetching.add(named)) {
            Logger.printDebug(() -> "banner: already fetching the picture for r/" + named);
            return null;
        }
        Logger.printDebug(() -> "banner: fetching the picture for r/" + named + " from " + link);
        FETCHING.execute(() -> {
            try {
                Bitmap picture = fetch(link);
                if (picture != null) {
                    drawn.put(named, picture);
                    Logger.printDebug(() -> "banner: drew r/" + named + ", "
                            + picture.getWidth() + "x" + picture.getHeight());
                    if (whenKnown != null) {
                        whenKnown.run();
                    }
                }
            } catch (Throwable ex) {
                Logger.printInfo(() -> "banner: could not fetch " + link + ": " + ex);
            } finally {
                fetching.remove(named);
            }
        });
        return null;
    }

    private static void askAbout(String subreddit, Runnable whenKnown) {
        String credentials = authorization;
        if (credentials == null) {
            Logger.printDebug(() -> "banner: nothing to ask Reddit with yet");
            return;
        }
        // Recorded before the answer so a feed drawing repeatedly asks once.
        banners.put(subreddit, NONE);

        FETCHING.execute(() -> {
            HttpURLConnection asking = null;
            try {
                asking = (HttpURLConnection) new URL(
                        "https://oauth.reddit.com/r/" + subreddit + "/about.json").openConnection();
                asking.setRequestProperty("Authorization", credentials);
                if (userAgent != null) {
                    asking.setRequestProperty("User-Agent", userAgent);
                }
                asking.setConnectTimeout(8000);
                asking.setReadTimeout(10000);

                int said = asking.getResponseCode();
                if (said != HttpURLConnection.HTTP_OK) {
                    Logger.printInfo(() -> "banner: Reddit answered " + said + " about r/"
                            + subreddit);
                    return;
                }
                notice(subreddit, read(asking.getInputStream()));
                if (whenKnown != null) {
                    whenKnown.run();
                }
            } catch (Throwable ex) {
                Logger.printInfo(() -> "banner: could not ask about r/" + subreddit + ": " + ex);
            } finally {
                if (asking != null) {
                    asking.disconnect();
                }
            }
        });
    }

    @Nullable
    private static Bitmap fetch(String link) throws IOException {
        HttpURLConnection asking = (HttpURLConnection) new URL(link).openConnection();
        try {
            asking.setConnectTimeout(8000);
            asking.setReadTimeout(10000);
            asking.setInstanceFollowRedirects(true);
            if (userAgent != null) {
                asking.setRequestProperty("User-Agent", userAgent);
            }
            int said = asking.getResponseCode();
            if (said != HttpURLConnection.HTTP_OK) {
                Logger.printInfo(() -> "banner: " + link + " answered " + said);
                return null;
            }
            try (InputStream reading = asking.getInputStream()) {
                ByteArrayOutputStream held = new ByteArrayOutputStream();
                byte[] block = new byte[8192];
                int read;
                while ((read = reading.read(block)) > 0) {
                    held.write(block, 0, read);
                }
                byte[] bytes = held.toByteArray();
                return BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
            }
        } finally {
            asking.disconnect();
        }
    }

    private static String read(InputStream from) throws IOException {
        ByteArrayOutputStream held = new ByteArrayOutputStream();
        byte[] block = new byte[8192];
        int read;
        while ((read = from.read(block)) > 0) {
            held.write(block, 0, read);
        }
        return held.toString("UTF-8");
    }

    @Nullable
    private static String normalise(String subreddit) {
        if (subreddit == null) {
            return null;
        }
        String named = subreddit.trim();
        if (named.toLowerCase(Locale.ROOT).startsWith("r/")) {
            named = named.substring(2);
        }
        // A feed of several subreddits, or a front page, has no banner of its own.
        if (named.isEmpty() || named.contains("+") || named.contains("/")) {
            return null;
        }
        return named;
    }
}
