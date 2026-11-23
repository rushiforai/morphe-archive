package app.jofslash.extension.booking;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;

import java.lang.reflect.Method;
import java.util.Locale;

/**
 * Used by the Open links in browser patch. The app opens web pages in its own plain web view
 * (com.booking.commonui.web.WebViewActivity), also pages that aren't Booking.com's. The patch opens
 * pages of other sites in your browser instead, as a Custom Tab where the browser has them.
 *
 * <p>Only from the places the patch lists (help, terms and privacy pages, chat, trips, wishlists,
 * settings and similar), never from the booking form, payment, sign-in or the flight, car, taxi and
 * attraction funnels; those calls aren't changed. Pages of Booking.com itself (booking.com,
 * booking.cn, bstatic.com) stay in the app, as they may need your sign-in. A tap on a link to
 * another site inside such a page opens in the browser too. Booking's sign-in, payment and 3-D
 * Secure screens are other web views, which this doesn't touch.
 */
@SuppressWarnings("unused")
public final class OpenInBrowser {
    private static final String TAG = "JoFSlash";
    private static final String WEB_VIEW_ACTIVITY = "com.booking.commonui.web.WebViewActivity";
    private static final String WEB_VIEW_COMPANION = WEB_VIEW_ACTIVITY + "$Companion";
    /** Put on the web view intents made by the places the patch changed. */
    private static final String EXTRA_OUTSIDE = "app.jofslash.open_links_outside";
    private static final String EXTRA_CUSTOM_TABS_SESSION = "android.support.customtabs.extra.SESSION";
    private static final String[] BOOKING_DOMAINS = {"booking.com", "booking.cn", "bstatic.com"};

    private static Method getStartIntent;

    private OpenInBrowser() {
    }

    /**
     * Replaces WebViewActivity.Companion.getStartIntent(context, url, title, userAgent, language,
     * showRefresh) at the places the patch lists. Returns a browser intent for a page of another
     * site, or else the app's own web view intent, marked so that links to other sites in it open
     * in the browser.
     */
    public static Intent getStartIntent(Context context, String url, String title, String userAgent,
            String language, boolean showRefresh) {
        if (isOutside(url)) {
            Intent browser = browserIntent(context, url);
            if (browser != null) {
                Log.d(TAG, "Opening " + Uri.parse(url).getHost() + " in the browser");
                return browser;
            }
        }
        Intent intent = appIntent(context, url, title, userAgent, language, showRefresh);
        try {
            intent.putExtra(EXTRA_OUTSIDE, true);
        } catch (Throwable ignored) {
        }
        return intent;
    }

    private static Intent appIntent(Context context, String url, String title, String userAgent,
            String language, boolean showRefresh) {
        try {
            Method method = getStartIntent;
            if (method == null) {
                method = Class.forName(WEB_VIEW_COMPANION).getMethod("getStartIntent", Context.class,
                        String.class, String.class, String.class, String.class, boolean.class);
                getStartIntent = method;
            }
            return (Intent) method.invoke(null, context, url, title, userAgent, language, showRefresh);
        } catch (java.lang.reflect.InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            throw new RuntimeException(cause);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException("Couldn't find WebViewActivity.getStartIntent", e);
        }
    }

    /**
     * Called first in WebViewBaseActivity.shouldOverrideUrlLoading(WebView, WebResourceRequest).
     * In a web view opened from a place the patch changed, a tap on a link to another site opens
     * the browser. Returns null when it did (the web view stays on its page), or else [view], for
     * the app to go on with.
     */
    public static WebView shouldOverrideUrlLoading(Object activity, WebView view, Object request) {
        return view != null && openedOutside(activity, request) ? null : view;
    }

    private static boolean openedOutside(Object activity, Object request) {
        try {
            if (!(activity instanceof Activity) || !(request instanceof WebResourceRequest)) return false;
            Activity web = (Activity) activity;
            if (!WEB_VIEW_ACTIVITY.equals(web.getClass().getName())) return false;
            Intent started = web.getIntent();
            if (started == null || !started.getBooleanExtra(EXTRA_OUTSIDE, false)) return false;
            WebResourceRequest r = (WebResourceRequest) request;
            // Only links you tap, not redirects or pages the site moves to on its own.
            if (!r.isForMainFrame() || !r.hasGesture() || r.isRedirect()) return false;
            String url = r.getUrl() != null ? r.getUrl().toString() : null;
            if (!isOutside(url)) return false;
            Intent browser = browserIntent(web, url);
            if (browser == null) return false;
            web.startActivity(browser);
            Log.d(TAG, "Opened a link to " + r.getUrl().getHost() + " in the browser");
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't open a link in the browser", t);
            return false;
        }
    }

    /** An http(s) link to a site that isn't Booking.com's. */
    static boolean isOutside(String url) {
        if (url == null) return false;
        try {
            Uri uri = Uri.parse(url.trim());
            String scheme = uri.getScheme();
            if (scheme == null) return false;
            scheme = scheme.toLowerCase(Locale.ROOT);
            if (!scheme.equals("https") && !scheme.equals("http")) return false;
            String host = uri.getHost();
            if (host == null || host.isEmpty()) return false;
            return !isBookingHost(host);
        } catch (Throwable t) {
            return false;
        }
    }

    static boolean isBookingHost(String host) {
        String h = host.toLowerCase(Locale.ROOT);
        while (h.endsWith(".")) h = h.substring(0, h.length() - 1);
        for (String domain : BOOKING_DOMAINS) {
            if (h.equals(domain) || h.endsWith("." + domain)) return true;
        }
        return false;
    }

    /** A Custom Tab (or plain browser) intent for [url], or null when no browser takes it. */
    private static Intent browserIntent(Context context, String url) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url.trim()));
            intent.addCategory(Intent.CATEGORY_BROWSABLE);
            Bundle extras = new Bundle();
            extras.putBinder(EXTRA_CUSTOM_TABS_SESSION, null);
            intent.putExtras(extras);
            if (context == null) return null;
            android.content.pm.ResolveInfo target = context.getPackageManager().resolveActivity(intent, 0);
            if (target == null || target.activityInfo == null
                    || context.getPackageName().equals(target.activityInfo.packageName)) return null;
            if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            return intent;
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't make a browser intent", t);
            return null;
        }
    }
}
