package app.template.extension.shazam;

import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.Locale;

/**
 * Opens the Spotify login of Shazam's bundled Spotify Auth SDK (1.2.3) in a browser tab instead
 * of the SDK's WebView dialog (issue #62). Spotify's login page no longer works in that WebView:
 * the email step resets and Facebook login lands on the account page instead of redirecting back,
 * and Google refuses WebViews outright. Spotify's own SDK 2.x moved to the same browser flow.
 *
 * <p>The SDK's {@code LoginActivity} stays open (translucent) under the tab. Spotify redirects to
 * {@code shazam-spotifyoauth://spotifylogincallback/...}, {@link SpotifyRedirectReceiverActivity}
 * catches it and brings {@code LoginActivity} back to the front, and when it resumes the redirect
 * goes to the SDK's own completion listener, exactly as the WebView dialog would hand it over.
 * Closing the tab without logging in reports a cancel the same way.
 *
 * <p>The SDK keeps its public, un-renamed API in this build; the patch checks every class and
 * method used here, so reflection only stands in for compile-time stubs.
 */
@SuppressWarnings("unused")
public final class SpotifyBrowserLoginPatch {
    private static final String TAG = "Morphe-Shazam";

    private static final String SDK = "com.spotify.sdk.android.auth.";
    private static final String CUSTOM_TABS_SERVICE = "android.support.customtabs.action.CustomTabsService";
    private static final String CUSTOM_TABS_SESSION = "android.support.customtabs.extra.SESSION";
    private static final String SPOTIFY_APP = "com.spotify.music";

    /** The login waiting for its redirect, or null. Only touched on the main thread. */
    private static Login pending;

    private SpotifyBrowserLoginPatch() {
    }

    /**
     * Injection point: start of {@code WebViewAuthHandler.start(Activity, AuthorizationRequest)}.
     *
     * @return true when the login opened in a browser (the handler then reports it started),
     *         false to fall back to the stock WebView dialog. Never throws.
     */
    public static boolean openInBrowser(Activity activity, Object request, Object listener) {
        if (activity == null || request == null || listener == null) return false;
        Login login = null;
        try {
            Uri authUri = (Uri) request.getClass().getMethod("toUri").invoke(request);
            String redirectUri = authUri == null ? null : authUri.getQueryParameter("redirect_uri");
            if (redirectUri == null || redirectUri.isEmpty()) return false;

            String browser = pickBrowser(activity.getPackageManager());
            if (browser == null) {
                Log.i(TAG, "No browser for the Spotify login, using the in-app page");
                return false;
            }

            Intent intent = new Intent(Intent.ACTION_VIEW, authUri).setPackage(browser);
            // A null session binder is what CustomTabsIntent sends without a bound session; it
            // makes Custom Tabs browsers open a tab inside Shazam's task. Other browsers ignore it.
            Bundle extras = new Bundle();
            extras.putBinder(CUSTOM_TABS_SESSION, null);
            intent.putExtras(extras);

            login = new Login(activity, redirectUri, authUri.getQueryParameter("state"), listener);
            login.start();
            activity.startActivity(intent);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Spotify browser login failed, using the in-app page", t);
            if (login != null) login.end();
            return false;
        }
    }

    /** Called by {@link SpotifyRedirectReceiverActivity} with the redirect it caught. */
    static void onRedirect(Uri uri) {
        Login login = pending;
        // Only while the tab is open: the receiver is exported, so another app could fire it.
        if (login == null || uri == null || !login.left) return;
        Locale locale = Locale.ENGLISH;
        if (!uri.toString().toLowerCase(locale).startsWith(login.redirectUri.toLowerCase(locale))
                || (login.state != null && !login.state.equals(uri.getQueryParameter("state")))) {
            Log.w(TAG, "Ignoring a Spotify redirect that does not match the request");
            return;
        }
        Activity target = login.activity.get();
        if (target == null) return;
        login.response = uri;
        // Clears the tab and this receiver off Shazam's task; the resume delivers the response.
        Intent back = new Intent(target, target.getClass())
                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        target.startActivity(back);
    }

    /**
     * The default browser when it supports Custom Tabs, else the first browser that does, else
     * the default browser as a plain browser. Never the Spotify app, which rejects this build.
     */
    private static String pickBrowser(PackageManager pm) {
        Intent probe = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com"))
                .addCategory(Intent.CATEGORY_BROWSABLE);
        ResolveInfo defaultInfo = pm.resolveActivity(probe, PackageManager.MATCH_DEFAULT_ONLY);
        String defaultBrowser = defaultInfo == null || defaultInfo.activityInfo == null
                ? null : defaultInfo.activityInfo.packageName;
        // "android" is the chooser: no default browser is set.
        if ("android".equals(defaultBrowser) || SPOTIFY_APP.equals(defaultBrowser)) defaultBrowser = null;

        String firstCustomTabs = null;
        String firstBrowser = null;
        List<ResolveInfo> browsers = pm.queryIntentActivities(probe, 0);
        for (ResolveInfo info : browsers) {
            if (info.activityInfo == null) continue;
            String pkg = info.activityInfo.packageName;
            if (SPOTIFY_APP.equals(pkg)) continue;
            if (firstBrowser == null) firstBrowser = pkg;
            if (pm.resolveService(new Intent(CUSTOM_TABS_SERVICE).setPackage(pkg), 0) == null) continue;
            if (pkg.equals(defaultBrowser)) return pkg;
            if (firstCustomTabs == null) firstCustomTabs = pkg;
        }
        if (firstCustomTabs != null) return firstCustomTabs;
        return defaultBrowser != null ? defaultBrowser : firstBrowser;
    }

    /** One browser login, tied to the SDK's LoginActivity that started it. */
    private static final class Login implements Application.ActivityLifecycleCallbacks {
        final WeakReference<Activity> activity;
        final String redirectUri;
        /** The request's state, which the redirect must echo; null when the app sets none. */
        final String state;
        final Object listener;
        final Application application;

        /** The LoginActivity went to the background (the tab opened). */
        boolean left;
        Uri response;

        Login(Activity activity, String redirectUri, String state, Object listener) {
            this.activity = new WeakReference<>(activity);
            this.redirectUri = redirectUri;
            this.state = state;
            this.listener = listener;
            this.application = activity.getApplication();
        }

        void start() {
            if (pending != null) pending.end();
            pending = this;
            application.registerActivityLifecycleCallbacks(this);
        }

        void end() {
            application.unregisterActivityLifecycleCallbacks(this);
            if (pending == this) pending = null;
        }

        @Override
        public void onActivityResumed(Activity a) {
            Activity target = activity.get();
            if (a != target) return;
            if (response == null && !left) return; // first resume, before the tab covered it
            Uri uri = response;
            end();
            try {
                ClassLoader loader = target.getClassLoader();
                Class<?> listenerType = Class.forName(SDK + "AuthorizationHandler$OnCompleteListener", false, loader);
                if (uri == null) {
                    // The tab was closed without a redirect: same result as closing the dialog.
                    listenerType.getMethod("onCancel").invoke(listener);
                    return;
                }
                Class<?> responseType = Class.forName(SDK + "AuthorizationResponse", false, loader);
                Object result = responseType.getMethod("fromUri", Uri.class).invoke(null, uri);
                listenerType.getMethod("onComplete", responseType).invoke(listener, result);
            } catch (Throwable t) {
                Log.e(TAG, "Could not hand the Spotify login result to the SDK", t);
                target.finish();
            }
        }

        @Override
        public void onActivityPaused(Activity a) {
            if (a == activity.get()) left = true;
        }

        @Override
        public void onActivityStopped(Activity a) {
            if (a == activity.get()) left = true;
        }

        @Override
        public void onActivityDestroyed(Activity a) {
            // LoginActivity.onDestroy cancels the SDK client itself.
            if (a == activity.get()) end();
        }

        @Override
        public void onActivityCreated(Activity a, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity a) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity a, Bundle outState) {
        }
    }
}
