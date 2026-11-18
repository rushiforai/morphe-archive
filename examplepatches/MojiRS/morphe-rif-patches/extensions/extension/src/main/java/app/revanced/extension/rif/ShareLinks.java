package app.revanced.extension.rif;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.io.IOException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Pattern;

/**
 * "Fix share links": Reddit share links (reddit.com/r/{sub}/s/{code}) are resolved to the
 * post's permalink before rif's link router sees them, so rif opens them like any other
 * permalink instead of loading the share link in its in-app browser.
 *
 * Two hooks: {@link #intercept} at the top of rif's link router (taps inside rif), and
 * {@link #interceptIntent} at the top of MainActivity's VIEW-intent dispatch (links from
 * other apps).
 */
public final class ShareLinks {

    private static final String TAG = "RifShareLinks";
    /** Extra on the Intent we re-send unchanged when a link couldn't be resolved. */
    private static final String BYPASS_EXTRA = "revanced_share_bypass";
    private static final String UA =
            "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Mobile Safari/537.36";
    private static final int TIMEOUT_MS = 5000;
    private static final int MAX_REQUESTS = 4;
    /** Overall cap for the placeholder's lookup, then the original link opens as rif would. */
    private static final long DEADLINE_MS = 6000;
    /** When the placeholder's own back stack is read as the "nothing navigated yet" baseline. */
    private static final long BASELINE_DELAY_MS = 800;
    /** How long a placeholder waits for the recreated MainActivity after a config change. */
    private static final long ADOPT_MS = 5000;

    // Codes are case-sensitive: never lowercase.
    private static final Pattern SHARE_PATH = Pattern.compile("^/(r|u|user)/[^/]+/s/[A-Za-z0-9]+/?$");

    // Reddit's Matrix media links; the id redirects to its i.redd.it image.
    private static final Pattern MATRIX_MEDIA = Pattern.compile(
            "^https?://matrix\\.redditspace\\.com/_matrix/media/v\\d+/download/reddit\\.com/[A-Za-z0-9]+/?(\\?.*)?$",
            Pattern.CASE_INSENSITIVE);

    private static final ExecutorService EXECUTOR = Executors.newFixedThreadPool(2, r -> {
        Thread t = new Thread(r, "RifShareLinks");
        t.setDaemon(true);
        return t;
    });
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Resolved links, original URL to permalink. */
    private static final Map<String, String> CACHE = new LinkedHashMap<String, String>(32, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
            return size() > 32;
        }
    };
    /** Links being resolved right now (a second tap on the same link is ignored). */
    private static final Set<String> IN_FLIGHT = new HashSet<>();
    /** While set, the router lets this link through untouched (rif's old behaviour). */
    private static volatile String bypass;

    private ShareLinks() {}

    /**
     * Stub the patch rewrites to call rif's router with the right parameter types; the
     * parameters are rif's router parameters, passed as Objects so this compiles without
     * rif's classes. Never called unpatched.
     */
    public static void route(String url, String p1, Object p2, String p3, String p4, boolean p5,
                             Object p6, Object p7, Context p8, Object p9) {
    }

    /**
     * Called first in the router. Returns true if the link was a share link or media link and
     * is now being handled here (resolve or unwrap, then re-dispatch to the router). rif would
     * open a Matrix media link in its browser, where Reddit's redirects end at reddit.com/media
     * and the "nice hat" post.
     */
    public static boolean intercept(String url, String p1, Object p2, String p3, String p4, boolean p5,
                                    Object p6, Object p7, Context ctx, Object p9) {
        try {
            if (url == null || url.equals(bypass)) return false;
            String media = mediaTarget(url);
            final boolean matrix = isMatrixMedia(url);
            if (media == null && !matrix && !isShareLink(url, true)) return false;
            if (ctx == null) {
                ctx = Settings.context();
                if (ctx == null) return false;
            }
            final Context context = ctx;

            if (media != null) {
                dispatchLater(media, url, p1, p2, p3, p4, p5, p6, p7, context, p9, false);
                return true;
            }

            String cached;
            synchronized (CACHE) {
                cached = CACHE.get(url);
            }
            if (cached != null) {
                dispatchLater(cached, url, p1, p2, p3, p4, p5, p6, p7, context, p9, false);
                return true;
            }
            synchronized (IN_FLIGHT) {
                if (!IN_FLIGHT.add(url)) return true; // double tap
            }
            EXECUTOR.execute(() -> {
                String resolved = null;
                try {
                    resolved = matrix ? resolveMatrixMedia(url) : resolve(url);
                } catch (Throwable ignored) {
                }
                synchronized (IN_FLIGHT) {
                    IN_FLIGHT.remove(url);
                }
                if (resolved != null) {
                    synchronized (CACHE) {
                        CACHE.put(url, resolved);
                    }
                }
                dispatchLater(resolved != null ? resolved : url, url, p1, p2, p3, p4, p5, p6, p7, context, p9,
                        resolved == null);
            });
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "intercept failed", t);
            return false;
        }
    }

    private static void dispatchLater(String target, String original, String p1, Object p2, String p3,
                                      String p4, boolean p5, Object p6, Object p7, Context ctx, Object p9,
                                      boolean useBypass) {
        MAIN.post(() -> {
            if (ctx instanceof Activity) {
                Activity a = (Activity) ctx;
                if (a.isFinishing() || a.isDestroyed()) return;
            }
            // Unresolved: let the router handle the original as if we weren't here.
            if (useBypass) bypass = original;
            try {
                try {
                    route(target, p1, p2, p3, p4, p5, p6, p7, ctx, p9);
                } catch (IllegalStateException e) {
                    // The in-app browser commits a fragment, which fails after the activity
                    // saved its state. With no FragmentManager rif starts MainActivity instead.
                    route(target, p1, p2, p3, p4, p5, p6, null, ctx, p9);
                }
            } catch (Throwable t) {
                Log.w(TAG, "route failed", t);
            } finally {
                bypass = null;
            }
        });
    }

    /**
     * Called first in MainActivity.l1() (the VIEW-intent dispatcher). For a /r/.../s/... share
     * link the activity is turned into a placeholder: its intent now points at the subreddit page
     * and this returns false, so l1() runs normally and rif sets up its state (Back and
     * onSaveInstanceState need it; returning early from l1 crashed them). The link resolves in the
     * background, then a new MainActivity starts for the permalink and the placeholder finishes.
     * A cached link skips the placeholder: that relaunch is synchronous.
     */
    public static boolean interceptIntent(final Activity activity) {
        try {
            final Intent intent = activity.getIntent();
            if (intent == null || intent.getBooleanExtra(BYPASS_EXTRA, false)) return false;
            Uri data = intent.getData();
            if (data == null || !Intent.ACTION_VIEW.equals(intent.getAction())) return false;
            final String url = data.toString();
            // /u/ links go to UserPathDummyActivity, not here.
            if (!isShareLink(url, false)) return false;

            String cached;
            synchronized (CACHE) {
                cached = CACHE.get(url);
            }
            if (cached != null) {
                relaunch(activity, intent, cached);
                return true;
            }
            // Placeholder: show the subreddit while the lookup runs.
            Intent shown = new Intent(intent);
            shown.setData(Uri.parse("https://www.reddit.com/r/" + Uri.parse(url).getPathSegments().get(1)));
            activity.setIntent(shown);

            final Placeholder whenResumed = new Placeholder(activity, intent);
            final long deadline = System.nanoTime() + DEADLINE_MS * 1_000_000L;
            EXECUTOR.execute(() -> {
                String resolved = null;
                try {
                    resolved = resolve(url, deadline);
                } catch (Throwable ignored) {
                }
                if (resolved != null) {
                    synchronized (CACHE) {
                        CACHE.put(url, resolved);
                    }
                }
                final String target = resolved;
                MAIN.post(() -> whenResumed.done(target));
            });
            return false;
        } catch (Throwable t) {
            Log.w(TAG, "interceptIntent failed", t);
            return false;
        }
    }

    // FragmentManager's back stack count by reflection (rif's copy is obfuscated, the class name
    // isn't). Unknown (-1) disables the "user navigated" check.
    private static Method getFragmentManager;
    private static Method getBackStackCount;

    private static int backStackCount(Activity a) {
        try {
            if (getFragmentManager == null) {
                Method found = null;
                for (Method m : a.getClass().getMethods()) {
                    if (m.getParameterTypes().length == 0
                            && m.getReturnType().getName().equals("androidx.fragment.app.FragmentManager")) {
                        if (found != null) return -1;
                        found = m;
                    }
                }
                if (found == null) return -1;
                getFragmentManager = found;
            }
            Object fm = getFragmentManager.invoke(a);
            if (fm == null) return -1;
            if (getBackStackCount == null) {
                Method found = null;
                for (Method m : fm.getClass().getMethods()) {
                    if (m.getDeclaringClass().getName().equals("androidx.fragment.app.FragmentManager")
                            && m.getParameterTypes().length == 0 && m.getReturnType() == int.class
                            && !Modifier.isStatic(m.getModifiers())) {
                        if (found != null) return -1;
                        found = m;
                    }
                }
                if (found == null) return -1;
                getBackStackCount = found;
            }
            return (Integer) getBackStackCount.invoke(fm);
        } catch (Throwable t) {
            return -1;
        }
    }

    /**
     * The placeholder activity waiting for its lookup. Android blocks activity starts from the
     * background, so if the user left (Home, screen off) when the answer arrives, the relaunch
     * waits until the activity is resumed again. Dropped if the activity finishes or is destroyed,
     * except when it is destroyed for a configuration change (dark mode, locale, font scale, rif's
     * own recreate): then the next MainActivity is adopted. The wait is capped by DEADLINE_MS (then
     * the original link opens as rif would have), and nothing happens if the user has navigated in
     * the placeholder meanwhile (its back stack grew). A process death loses the link (accepted).
     */
    private static final class Placeholder implements Application.ActivityLifecycleCallbacks {
        private Activity activity; // null while waiting for the recreated instance
        private final Application app;
        private final Class<?> activityClass;
        private final Intent original;
        private boolean resumed;
        private boolean answered;
        private boolean stopped;
        private String target;
        private int baseline = -1;

        private final Runnable onDeadline = () -> done(null);
        private final Runnable onBaseline = () -> {
            if (activity != null && !stopped) baseline = backStackCount(activity);
        };
        private final Runnable onNotAdopted = () -> {
            if (activity == null) stop();
        };

        Placeholder(Activity activity, Intent original) {
            this.activity = activity;
            this.app = activity.getApplication();
            this.activityClass = activity.getClass();
            this.original = original;
            app.registerActivityLifecycleCallbacks(this);
            // l1 and its first fragment commit have finished by then.
            MAIN.postDelayed(onBaseline, BASELINE_DELAY_MS);
            MAIN.postDelayed(onDeadline, DEADLINE_MS);
        }

        /** Main thread. */
        void done(String resolved) {
            if (stopped || answered) return;
            answered = true;
            target = resolved;
            if (activity == null) return; // the adopted instance continues
            if (activity.isFinishing() || activity.isDestroyed()) {
                stop();
                return;
            }
            if (resumed) go();
        }

        private void go() {
            Activity a = activity;
            stop();
            if (baseline >= 0 && backStackCount(a) > baseline) return; // the user is browsing
            relaunch(a, original, target);
        }

        private void stop() {
            if (stopped) return;
            stopped = true;
            MAIN.removeCallbacks(onDeadline);
            MAIN.removeCallbacks(onBaseline);
            MAIN.removeCallbacks(onNotAdopted);
            app.unregisterActivityLifecycleCallbacks(this);
        }

        @Override public void onActivityResumed(Activity a) {
            if (stopped || a != activity) return;
            resumed = true;
            if (answered && !a.isFinishing()) go();
        }

        @Override public void onActivityPaused(Activity a) {
            if (a == activity) resumed = false;
        }

        @Override public void onActivityDestroyed(Activity a) {
            if (stopped || a != activity) return;
            if (a.isChangingConfigurations()) {
                // Keep waiting: the next MainActivity (restored from saved state) takes over.
                activity = null;
                resumed = false;
                MAIN.postDelayed(onNotAdopted, ADOPT_MS);
            } else {
                stop();
            }
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {
            if (stopped || activity != null || a.getClass() != activityClass) return;
            MAIN.removeCallbacks(onNotAdopted);
            activity = a;
            baseline = -1;
            MAIN.postDelayed(onBaseline, BASELINE_DELAY_MS);
        }

        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
    }

    /** Starts MainActivity on [resolved], or on the original link with the bypass extra if null. */
    private static void relaunch(Activity activity, Intent original, String resolved) {
        try {
            Intent next = new Intent(original);
            next.setComponent(activity.getComponentName());
            // No flags from the caller: SINGLE_TOP would route this back into the finishing activity.
            next.setFlags(0);
            if (resolved != null) {
                next.setData(Uri.parse(resolved));
            } else {
                next.putExtra(BYPASS_EXTRA, true);
            }
            activity.startActivity(next);
            activity.overridePendingTransition(0, 0);
        } catch (Throwable t) {
            Log.w(TAG, "relaunch failed", t);
        }
        activity.finish();
    }

    // ---- link handling ----

    private static boolean isShareLink(String url, boolean allowUser) {
        Uri u = Uri.parse(url);
        String scheme = u.getScheme();
        if (!"https".equalsIgnoreCase(scheme) && !"http".equalsIgnoreCase(scheme)) return false;
        if (!isReddit(u.getHost())) return false;
        String path = u.getPath();
        if (path == null || !SHARE_PATH.matcher(path).matches()) return false;
        return allowUser || path.startsWith("/r/");
    }

    /**
     * The link inside a reddit.com/media?url=... wrapper, or null if [url] isn't one. rif reads
     * /media as a short link to the post with id "media" (a real r/funny post, "nice hat").
     * No /media intent filter exists, so these reach us only through the router; rif's WebViews
     * classify links themselves and skip it. Only Reddit-hosted targets are unwrapped: others
     * keep rif's behaviour. A Matrix media target comes back through the router and resolves.
     */
    static String mediaTarget(String url) {
        Uri u = Uri.parse(url);
        String scheme = u.getScheme();
        if (!"https".equalsIgnoreCase(scheme) && !"http".equalsIgnoreCase(scheme)) return null;
        if (!isReddit(u.getHost())) return null;
        String path = u.getPath();
        if (!"/media".equals(path) && !"/media/".equals(path)) return null;
        String target = u.getQueryParameter("url");
        if (target == null) return null;
        Uri t = Uri.parse(target);
        String targetScheme = t.getScheme();
        if (!"https".equalsIgnoreCase(targetScheme) && !"http".equalsIgnoreCase(targetScheme)) return null;
        return isRedditMedia(t.getHost()) || isMatrixMedia(target) ? target : null;
    }

    static boolean isMatrixMedia(String url) {
        return url != null && MATRIX_MEDIA.matcher(url).matches();
    }

    private static boolean isReddit(String host) {
        if (host == null) return false;
        host = host.toLowerCase();
        return host.equals("reddit.com") || host.endsWith(".reddit.com");
    }

    private static boolean isRedditMedia(String host) {
        if (host == null) return false;
        host = host.toLowerCase();
        return host.equals("redd.it") || host.endsWith(".redd.it");
    }

    /** old./np./m./... pages differ from www (old. redirects to a login wall). */
    private static String toWww(String url) {
        return Uri.parse(url).buildUpon().scheme("https").authority("www.reddit.com").build().toString();
    }

    /** Follows the share link's redirects; returns the permalink or null if anything is off. */
    private static String resolve(String url) {
        return resolve(url, 0);
    }

    /** As above, giving up at deadline (a System.nanoTime() value; 0 = no overall limit). */
    private static String resolve(String url, long deadline) {
        String current = toWww(url);
        for (int i = 0; i < MAX_REQUESTS; i++) {
            int timeout = TIMEOUT_MS;
            if (deadline != 0) {
                long left = (deadline - System.nanoTime()) / 1_000_000L;
                if (left <= 0) return null;
                timeout = (int) Math.min(TIMEOUT_MS, left);
            }
            HttpURLConnection c = null;
            try {
                c = (HttpURLConnection) new URL(current).openConnection();
                c.setRequestMethod("HEAD");
                c.setInstanceFollowRedirects(false);
                c.setConnectTimeout(timeout);
                c.setReadTimeout(timeout);
                c.setRequestProperty("User-Agent", UA);
                int code = c.getResponseCode();
                if (code != 301 && code != 302 && code != 303 && code != 307 && code != 308) return null;
                String location = c.getHeaderField("Location");
                if (location == null) return null;
                URL next = new URL(new URL(current), location);
                if (!isReddit(next.getHost())) return null;
                String path = next.getPath();
                if (path == null || path.startsWith("/login")) return null;
                String nextUrl = next.toString();
                if (isShareLink(nextUrl, true)) {
                    current = toWww(nextUrl);
                    continue;
                }
                return clean(nextUrl);
            } catch (Throwable t) {
                return null;
            } finally {
                if (c != null) c.disconnect();
            }
        }
        return null;
    }

    /**
     * The i.redd.it image a Matrix media link redirects to, or null if anything is off. An
     * http:// link is tried as https:// first (plain http redirects to an internal host); a
     * connection error is retried once, an answer is final.
     */
    static String resolveMatrixMedia(String url) {
        for (String attempt : InlineImages.attempts(url)) {
            try {
                return resolveMatrixMediaOnce(attempt);
            } catch (IOException e) {
                // next attempt
            } catch (Throwable t) {
                break;
            }
        }
        return null;
    }

    private static String resolveMatrixMediaOnce(String url) throws IOException {
        HttpURLConnection c = null;
        try {
            c = (HttpURLConnection) new URL(url).openConnection();
            c.setRequestMethod("HEAD");
            c.setInstanceFollowRedirects(false); // the next hop sends browsers to reddit.com/media
            c.setConnectTimeout(TIMEOUT_MS);
            c.setReadTimeout(TIMEOUT_MS);
            c.setRequestProperty("User-Agent", UA);
            int code = c.getResponseCode();
            if (code != 301 && code != 302 && code != 303 && code != 307 && code != 308) return null;
            String location = c.getHeaderField("Location");
            if (location == null) return null;
            URL next = new URL(new URL(url), location);
            return isRedditMedia(next.getHost()) ? next.toString() : null;
        } finally {
            if (c != null) c.disconnect();
        }
    }

    /** Drops share_id and utm_* tracking parameters, keeps the rest (e.g. context). */
    private static String clean(String url) {
        Uri u = Uri.parse(url);
        Uri.Builder b = u.buildUpon().clearQuery().fragment(null);
        for (String name : u.getQueryParameterNames()) {
            if (name.equals("share_id") || name.startsWith("utm_")) continue;
            for (String value : u.getQueryParameters(name)) b.appendQueryParameter(name, value);
        }
        return b.build().toString();
    }
}
