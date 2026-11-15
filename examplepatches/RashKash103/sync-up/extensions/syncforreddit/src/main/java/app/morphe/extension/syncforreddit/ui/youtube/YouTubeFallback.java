package app.morphe.extension.syncforreddit.ui.youtube;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;

import java.io.ByteArrayInputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

/**
 * Playing a YouTube video in the app where Sync's own player will not start.
 *
 * <p>Sync plays YouTube through the YouTube Android Player API, a small client library that does
 * none of the playing itself: it binds to a service inside the official YouTube app and asks
 * that to draw the video. Google retired the API and took the service out, so on a current
 * YouTube app the bind fails and the library reports back that it could not initialize. Nothing
 * about this is Sync's doing and nothing in Sync can fix it — the thing it was talking to is
 * gone.
 *
 * <p>What the app does with that answer is where this steps in, and it is two different things in
 * two places. In the sheet a link opens in, the failure handler hides the frame the video was to
 * be drawn in, so the video silently is not there. In the full screen player it puts up the
 * library's own dialog — the one offering to get or update the YouTube app, which will not help
 * — then turns Sync's internal YouTube link handling off for good and hands the link to a
 * browser.
 *
 * <p>Both of those are failure handlers, which is the whole reason this is safe: it is reached
 * only when the native player has already declined, so anyone whose YouTube app still answers
 * keeps the player they had. Where it is reached, a WebView holding YouTube's own embedded player
 * is put up in the space the video was going to occupy. That needs no YouTube app, no API key and
 * no service.
 *
 * <p>Where even that cannot be put up, the link is handed to whatever opens it, which is what the
 * reader wanted in the first place. The one thing deliberately not reproduced is Sync turning its
 * own link handling off: that setting is how the reader asked for YouTube to open in the app, and
 * a failure that is now handled is no reason to take it away from them.
 *
 * @noinspection unused
 */
public final class YouTubeFallback {
    private YouTubeFallback() {}

    /** The player view in Sync's full screen YouTube activity, which is a view group. */
    private static final String YOUTUBE_VIEW = "youtube_view";

    /** What Sync puts the address under when it starts that activity. */
    private static final String URL_EXTRA = "url";

    /** An id is eleven characters of the URL-safe alphabet. */
    private static final Pattern ID = Pattern.compile(
            "(?:v=|/v/|youtu\\.be/|/embed/|/shorts/|/live/|/e/)([A-Za-z0-9_-]{11})");

    /** {@code t} and {@code start} are either plain seconds or {@code 1h2m3s}. */
    private static final Pattern START = Pattern.compile("[?&](?:t|start)=([0-9hms]+)");

    private static final Pattern CLOCK = Pattern.compile("(?:(\\d+)h)?(?:(\\d+)m)?(?:(\\d+)s)?");

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * Called in place of the embedded player's failure handler, which hid the frame.
     *
     * <p>The video id, the moment to start at and the frame are all fields of the listener this
     * is handed, and they are found by their types rather than their names: the names are the
     * minifier's and would not survive a rebuild, while the types — a frame layout, a string and
     * an int — pick out one field each.
     *
     * @param listener Sync's own {@code OnInitializedListener} for the sheet's player.
     */
    public static void instead(Object listener) {
        FrameLayout frame = null;
        try {
            if (listener == null) {
                return;
            }

            String id = null;
            int startMs = 0;
            for (Field field : listener.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                Class<?> type = field.getType();
                if (FrameLayout.class.isAssignableFrom(type)) {
                    frame = (FrameLayout) field.get(listener);
                } else if (type == String.class) {
                    id = (String) field.get(listener);
                } else if (type == int.class) {
                    startMs = field.getInt(listener);
                }
            }

            if (!isPatchIncluded() || frame == null || id == null || id.isEmpty()) {
                hide(frame);
                return;
            }

            WebView player = player(frame.getContext(), id, startMs / 1000);
            if (player == null) {
                hide(frame);
                return;
            }

            hideChildren(frame);
            frame.addView(player, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT));
            frame.setVisibility(View.VISIBLE);
            banner(frame);

            final String played = id;
            Logger.printInfo(() -> "youtube: playing " + played + " in the app, since Sync's "
                    + "player could not start");
        } catch (Throwable ex) {
            Logger.printInfo(() -> "youtube: could not stand in for the sheet's player: " + ex);
            hide(frame);
        }
    }

    /**
     * Called in place of the full screen player's failure handler, which put up the library's own
     * dialog, turned Sync's YouTube link handling off and opened a browser.
     *
     * @param activity Sync's own YouTube activity, which carries the address it was started with.
     */
    public static void insteadFullScreen(Activity activity) {
        String url = null;
        try {
            if (activity == null) {
                return;
            }

            Intent intent = activity.getIntent();
            url = intent == null ? null : intent.getStringExtra(URL_EXTRA);

            View found = activity.findViewById(
                    ResourceUtils.getIdentifier(ResourceType.ID, YOUTUBE_VIEW));
            String id = idIn(url);

            if (!isPatchIncluded() || !(found instanceof ViewGroup) || id == null) {
                open(activity, url);
                return;
            }

            // The player view itself refuses to hold anything: adding to it throws
            // UnsupportedOperationException("No views can be added on top of the player").
            // So the one that is taking its place goes where it is rather than inside it, and
            // the player view is left in the tree but not drawn.
            ViewGroup container = (ViewGroup) found.getParent();
            if (container == null) {
                open(activity, url);
                return;
            }

            WebView player = player(activity, id, startIn(url));
            if (player == null) {
                open(activity, url);
                return;
            }

            found.setVisibility(View.GONE);
            container.addView(player, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT));

            Logger.printInfo(() -> "youtube: playing " + id + " full screen in the app, since "
                    + "Sync's player could not start");
        } catch (Throwable ex) {
            Logger.printInfo(() -> "youtube: could not stand in for the full screen player: "
                    + ex);
            open(activity, url);
        }
    }

    /**
     * Where the page holding the player is served from.
     *
     * <p>The host is deliberately one that cannot exist: `.invalid` is reserved and never
     * resolves, and nothing is ever asked of it, since the page is handed over from here rather
     * than fetched. It is there only to give the page an origin.
     */
    private static final String PLAYER_PAGE = "https://sync-up.invalid/player";

    /**
     * One transparent pixel, which is what the WebView is given to draw in place of the poster
     * it would otherwise put over a video that has not started. Made once, since the view asks
     * for it each time a video appears.
     */
    private static final Bitmap NOTHING_TO_SEE_YET =
            Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);

    /**
     * @return A view playing the video, or nothing where a WebView cannot be had at all — which
     *         is a real possibility on a device whose WebView is being updated.
     */
    private static WebView player(Context context, String id, int startSeconds) {
        try {
            WebView view = new WebView(context);
            WebSettings settings = view.getSettings();
            settings.setJavaScriptEnabled(true);
            settings.setDomStorageEnabled(true);
            // Without this the embedded player waits for a tap that the reader has already
            // given by opening the link.
            settings.setMediaPlaybackRequiresUserGesture(false);
            // A WebView announces itself as one, and the player is happier being asked by
            // something that looks like the browser it was written for.
            settings.setUserAgentString(
                    "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) "
                            + "Chrome/147.0.0.0 Mobile Safari/537.36");
            view.setBackgroundColor(Color.BLACK);

            // A video that has not drawn a frame yet is given a poster by the WebView itself: a
            // grey play button, scaled to whatever shape the video box is, which is what was
            // being seen stretched across the player for the second before it started. There is
            // no way to turn it off, but what is drawn is whatever this hands back, so it is
            // handed one transparent pixel.
            view.setWebChromeClient(new WebChromeClient() {
                @Override
                public Bitmap getDefaultVideoPoster() {
                    return NOTHING_TO_SEE_YET;
                }
            });

            final String page = page(id, startSeconds);
            view.setWebViewClient(new WebViewClient() {
                @Override
                public WebResourceResponse shouldInterceptRequest(WebView view,
                                                                  WebResourceRequest request) {
                    if (PLAYER_PAGE.equals(request.getUrl().toString())) {
                        return new WebResourceResponse(
                                "text/html",
                                "utf-8",
                                200,
                                "OK",
                                Collections.emptyMap(),
                                new ByteArrayInputStream(
                                        page.getBytes(StandardCharsets.UTF_8)));
                    }
                    // Everything else — the player itself and what it fetches — goes to the
                    // network as usual.
                    return null;
                }
            });

            view.loadUrl(PLAYER_PAGE);
            return view;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "youtube: no WebView to play in: " + ex);
            return null;
        }
    }

    /**
     * The smallest page that holds YouTube's own player and nothing else.
     *
     * <p>It has to be served to the view rather than handed to it. What decides whether the
     * player plays at all is the origin of the page framing it, and that was measured four ways
     * against the same video: a page given to {@code loadDataWithBaseURL}, whose origin is
     * opaque whatever base URL is named, is refused; the embed loaded as the whole document is
     * refused, with and without a referrer; a page served at an address on `youtube.com` itself
     * is refused — all of them with *This video is unavailable, error 152*. A page served at an
     * address on any other host plays. So the embed wants to be framed by a third party, which
     * is the thing it is built to be, and the only way to be one in a WebView is to answer for
     * an address rather than to hand over a document.
     */
    private static String page(String id, int startSeconds) {
        String start = startSeconds > 0 ? "&start=" + startSeconds : "";
        return "<!DOCTYPE html><html><head>"
                + "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1,"
                + "user-scalable=no\">"
                + "<style>html,body{margin:0;padding:0;height:100%;background:#000;"
                + "overflow:hidden}iframe{display:block;border:0;width:100%;height:100%}</style>"
                + "</head><body><iframe src=\"https://www.youtube.com/embed/" + id
                + "?autoplay=1&playsinline=1&rel=0&modestbranding=1&fs=1" + start + "\" "
                + "allow=\"autoplay;encrypted-media;picture-in-picture\" allowfullscreen>"
                + "</iframe></body></html>";
    }

    /** Settles the picture's shape for the sheet, where the frame has no height of its own. */
    private static void banner(FrameLayout frame) {
        frame.addOnLayoutChangeListener((view, left, top, right, bottom,
                                        oldLeft, oldTop, oldRight, oldBottom) -> {
            try {
                int width = right - left;
                if (width <= 0) {
                    return;
                }
                int wanted = Math.round(width * 9f / 16f);
                ViewGroup.LayoutParams params = view.getLayoutParams();
                if (params == null || params.height == wanted) {
                    return;
                }
                params.height = wanted;
                view.setLayoutParams(params);
            } catch (Throwable ex) {
                Logger.printInfo(() -> "youtube: could not shape the player: " + ex);
            }
        });
    }

    /**
     * Takes whatever the failed player left behind out of sight without taking it out of the
     * tree, which the fragment manager that put it there would not thank us for.
     */
    private static void hideChildren(ViewGroup parent) {
        for (int i = 0; i < parent.getChildCount(); i++) {
            parent.getChildAt(i).setVisibility(View.GONE);
        }
    }

    private static void hide(FrameLayout frame) {
        // What Sync did, so that a frame with nothing in it does not take up room.
        try {
            if (frame != null) {
                frame.setVisibility(View.GONE);
            }
        } catch (Throwable ignored) {
            // Nothing to do about it and nothing depends on it.
        }
    }

    /** Hands the address to whatever opens it, and closes the player that cannot. */
    private static void open(Activity activity, String url) {
        try {
            if (activity == null) {
                return;
            }
            if (url != null && !url.isEmpty()) {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activity.startActivity(intent);
            }
            activity.finish();
        } catch (Throwable ex) {
            Logger.printInfo(() -> "youtube: could not hand the link on: " + ex);
        }
    }

    /** @return The video's id out of the address, or nothing where there is none to find. */
    static String idIn(String url) {
        if (url == null) {
            return null;
        }
        Matcher matcher = ID.matcher(url);
        return matcher.find() ? matcher.group(1) : null;
    }

    /** @return How many seconds in the address asks to start, or zero. */
    static int startIn(String url) {
        if (url == null) {
            return 0;
        }
        Matcher matcher = START.matcher(url);
        if (!matcher.find()) {
            return 0;
        }

        String written = matcher.group(1).toLowerCase(Locale.ROOT);
        try {
            return Integer.parseInt(written);
        } catch (NumberFormatException plainSecondsItIsNot) {
            Matcher clock = CLOCK.matcher(written);
            if (!clock.matches()) {
                return 0;
            }
            return 3600 * number(clock.group(1))
                    + 60 * number(clock.group(2))
                    + number(clock.group(3));
        }
    }

    private static int number(String written) {
        try {
            return written == null ? 0 : Integer.parseInt(written);
        } catch (NumberFormatException ex) {
            return 0;
        }
    }
}
