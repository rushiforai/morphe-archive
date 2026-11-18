// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collections;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * Opens Reddit share links ({@code reddit.com/r/<sub>/s/<code>}, {@code /u/<name>/s/<code>}), which the app can't
 * classify: it shows them in its browser, or as a profile. Reddit answers a share link with a redirect to the post.
 *
 * <p>Every entry point hands the link to the app's {@code RedditMailClickDummyActivity}, the invisible activity that
 * unwraps email links and routes a Reddit URL to the activity for its type. It stays open while the redirect is
 * fetched, so the app is in the foreground when it opens the result, and the user can back out; it then routes the
 * result. (Not {@code RedditTrackingLinkDummyActivity}: an AppCompat activity with a plain theme, which crashes unless
 * it finishes in {@code onCreate}.)
 */
public final class ShareLinks {
    private static final String PACKAGE = "com.andrewshu.android.reddit";
    static final String ROUTER = PACKAGE + ".intentfilter.RedditMailClickDummyActivity";
    static final String MAIN = PACKAGE + ".MainActivity";
    /** Marks the app's own handling of a link that didn't resolve, so it isn't handed over again. */
    static final String UNRESOLVED = "app.edbfi.extension.rifisfun.SHARE_LINK_UNRESOLVED";

    private static final Pattern SHARE_PATH = Pattern.compile("/(?:r|u|user)/[^/]+/s/[A-Za-z0-9]+/?");

    private ShareLinks() {}

    /**
     * Called first by the app's in-app link opener with the link and the context it opens from. Returns true when it
     * took the link over. A caller without a context (a detached fragment) passes null; that link is left to the
     * app, which opens it with the application's context as before.
     */
    public static boolean open(String url, Context context) {
        if (context == null || !isShareLink(url)) return false;
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url)).setClassName(context, ROUTER);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
        return true;
    }

    /**
     * Called by the activities that take links from other apps, {@code MainActivity} and {@code
     * UserPathDummyActivity}, before they read the intent. Returns true when it handed the link over and finished
     * the activity.
     */
    public static boolean forward(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent == null || intent.getBooleanExtra(UNRESOLVED, false)) return false;
        Uri data = intent.getData();
        if (data == null || !isShareLink(data.toString())) return false;
        activity.startActivity(new Intent(Intent.ACTION_VIEW, data).setClassName(activity, ROUTER));
        activity.finish();
        return true;
    }

    /**
     * Called by {@code RedditMailClickDummyActivity} after {@code super.onCreate}. Returns true when it is resolving a
     * share link: the activity then stays open, and opens the result in a new copy of itself before it finishes.
     */
    public static boolean resolve(Activity activity) {
        Intent intent = activity.getIntent();
        Uri data = intent == null ? null : intent.getData();
        if (data == null || !isShareLink(data.toString())) return false;
        String url = data.toString();
        String userAgent = SpoofClient.redditUserAgent();
        Waiter waiter = new Waiter(activity);
        activity.getApplication().registerActivityLifecycleCallbacks(waiter);
        new Thread(() -> {
            String target = null;
            try {
                Http.Reply reply = Http.send("GET", https(url), Collections.singletonMap("User-Agent", userAgent), null, false);
                target = target(RequestHook.redirectTarget(https(url), reply));
            } catch (Exception error) {
                Log.w(App.TAG, "Could not resolve " + url, error);
            }
            String resolved = target;
            new Handler(Looper.getMainLooper()).post(() -> waiter.whenResumed(() -> finish(activity, url, resolved)));
        }, "edbfi-share-link").start();
        return true;
    }

    /**
     * Holds the result until the resolving activity is in the foreground. Should the user leave the app while the
     * redirect loads, Android may block the start, losing the link, or let it pull the app back over what the user
     * went to; the result opens when they come back instead.
     */
    private static final class Waiter implements Application.ActivityLifecycleCallbacks {
        private final Activity activity;
        private boolean resumed;
        private Runnable pending;

        Waiter(Activity activity) {
            this.activity = activity;
        }

        void whenResumed(Runnable action) {
            if (resumed) {
                action.run();
            } else {
                pending = action;
            }
        }

        @Override
        public void onActivityResumed(Activity resumedActivity) {
            if (resumedActivity != activity) return;
            resumed = true;
            Runnable action = pending;
            pending = null;
            if (action != null) action.run();
        }

        @Override
        public void onActivityPaused(Activity pausedActivity) {
            if (pausedActivity == activity) resumed = false;
        }

        @Override
        public void onActivityDestroyed(Activity destroyedActivity) {
            if (destroyedActivity != activity) return;
            pending = null;
            activity.getApplication().unregisterActivityLifecycleCallbacks(this);
        }

        @Override
        public void onActivityCreated(Activity created, Bundle state) {}

        @Override
        public void onActivityStarted(Activity started) {}

        @Override
        public void onActivityStopped(Activity stopped) {}

        @Override
        public void onActivitySaveInstanceState(Activity saving, Bundle state) {}
    }

    private static void finish(Activity activity, String url, String target) {
        // The user backed out, or the activity was recreated and resolves again.
        if (activity.isFinishing() || activity.isDestroyed()) return;
        Intent intent;
        if (target != null) {
            intent = new Intent(Intent.ACTION_VIEW, Uri.parse(target)).setClassName(activity, ROUTER);
        } else {
            Log.w(App.TAG, "No post for " + url);
            Toast.makeText(activity, "Could not open the share link", Toast.LENGTH_SHORT).show();
            // The app's own handling: its browser.
            intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url)).setClassName(activity, MAIN).putExtra(UNRESOLVED, true);
        }
        activity.startActivity(intent);
        activity.finish();
    }

    /** Whether the URL is a Reddit share link. */
    static boolean isShareLink(String url) {
        URI uri = parse(url);
        return uri != null && isReddit(uri) && uri.getRawPath() != null && SHARE_PATH.matcher(uri.getRawPath()).matches();
    }

    private static String https(String url) {
        return url.regionMatches(true, 0, "http:", 0, 5) ? "https:" + url.substring(5) : url;
    }

    /**
     * The Reddit page a share link's redirect points to, without tracking parameters, or null for no redirect, or one
     * that leaves Reddit or points to another share link.
     */
    static String target(String location) {
        URI uri = parse(location);
        if (uri == null || !"https".equalsIgnoreCase(uri.getScheme()) || !isReddit(uri) || isShareLink(location)) {
            return null;
        }
        return withoutTracking(location);
    }

    /** Drops the share and campaign parameters Reddit adds to the redirect target. */
    static String withoutTracking(String url) {
        int fragmentAt = url.indexOf('#');
        String fragment = fragmentAt >= 0 ? url.substring(fragmentAt) : "";
        String rest = fragmentAt >= 0 ? url.substring(0, fragmentAt) : url;
        int queryAt = rest.indexOf('?');
        if (queryAt < 0) return url;
        StringBuilder kept = new StringBuilder(rest.substring(0, queryAt));
        char separator = '?';
        for (String parameter : rest.substring(queryAt + 1).split("&")) {
            String name = parameter.split("=", 2)[0];
            if (parameter.isEmpty() || name.equals("share_id") || name.startsWith("utm_")) continue;
            kept.append(separator).append(parameter);
            separator = '&';
        }
        return kept.append(fragment).toString();
    }

    /** Whether the URI is http(s) on reddit.com or one of its subdomains. */
    static boolean isReddit(URI uri) {
        String scheme = uri.getScheme();
        String host = uri.getHost();
        if (scheme == null || host == null) return false;
        if (!scheme.equalsIgnoreCase("https") && !scheme.equalsIgnoreCase("http")) return false;
        host = host.toLowerCase(Locale.ROOT);
        return host.equals("reddit.com") || host.endsWith(".reddit.com");
    }

    static URI parse(String url) {
        if (url == null) return null;
        try {
            return new URI(url);
        } catch (URISyntaxException error) {
            return null;
        }
    }
}
