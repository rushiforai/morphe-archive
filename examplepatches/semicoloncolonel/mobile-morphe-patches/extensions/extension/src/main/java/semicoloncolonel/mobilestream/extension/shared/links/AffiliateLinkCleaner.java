package semicoloncolonel.mobilestream.extension.shared.links;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

/**
 * Shared "Strip affiliate links": opens deals at the store's own URL.
 *
 * The patch swaps every startActivity / startActivityForResult call in the app
 * for the static methods below, which clean a VIEW intent's URL first, and the
 * app's WebView.loadUrl calls for {@link #loadUrl}. Custom tabs and React
 * Native's Linking.openURL both end in startActivity, so they are covered too.
 *
 * A link is cleaned in two steps:
 *   1. Redirectors whose query names the destination are unwrapped, repeatedly.
 *   2. Affiliate and tracking parameters are dropped from the final URL, and
 *      the Associates parameters on Amazon hosts.
 *
 * Some deal sites send every click through their own tracker, whose URL does
 * not name the store (DealNews: www.dealnews.com/lw/click.html?…). For those,
 * the tracker's redirect is read with one request that carries no cookies,
 * and the activity starts on the main thread once it answers. The site still
 * counts the click, but the affiliate network's link is then unwrapped here,
 * so the browser never visits it. If the request fails, the original link
 * opens as before.
 *
 * Any URL that does not match passes through unchanged. Every outbound URL is
 * logged under MSP-LINKS, so new link shapes can be read with logcat.
 */
@SuppressWarnings("unused")
public final class AffiliateLinkCleaner {
    private static final String TAG = "MSP-LINKS";

    /** Redirectors whose query names the destination: {host, parameter...}. */
    private static final String[][] REDIRECTORS = {
            // DealSeek's click log; Walmart links carry only the item ID (see dealSeek).
            {"api.dealseek.com", "destination_url"},
            // Impact
            {"goto.walmart.com", "u", "url"},
            {"goto.target.com", "u", "url"},
            {"7tiv.net", "u", "url"},
            {"ojrq.net", "return"},
            {"sjv.io", "u", "url"},
            {"pxf.io", "u", "url"},
            {"pjtra.com", "url"},
            {"evyy.net", "u", "url"},
            {"ztk5.net", "u", "url"},
            {"r7cb.net", "u", "url"},
            // Sovrn Commerce (VigLink)
            {"sovrn.co", "u"},
            {"redirect.viglink.com", "u"},
            {"ncls1.com", "d"},
            // Skimlinks
            {"go.skimresources.com", "url"},
            // Rakuten Advertising (LinkSynergy)
            {"click.linksynergy.com", "murl", "RD_PARM1"},
            // CJ Affiliate
            {"anrdoezrs.net", "url"},
            {"dpbolvw.net", "url"},
            {"jdoqocy.com", "url"},
            {"kqzyfj.com", "url"},
            {"tkqlhce.com", "url"},
            {"emjcd.com", "url"},
            // Awin, ShareASale, Partnerize, FlexOffers, Avantlink
            {"awin1.com", "ued", "p"},
            {"shareasale.com", "urllink"},
            {"prf.hn", "destination"},
            {"track.flexlinkspro.com", "url"},
            {"avantlink.com", "url"},
            // eBay Partner Network rover links
            {"rover.ebay.com", "mpre"},
            // Deal sites' own click trackers
            {"slickdeals.net", "u2"},
            {"dealnews.com", "u", "url"},
    };

    /** Click trackers that hide the destination: {host, path prefix}. */
    private static final String[][] OPAQUE_TRACKERS = {
            {"dealnews.com", "/lw/click.html"},
    };

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Amazon Associates parameters, dropped on Amazon hosts only. */
    private static final String[] AMAZON_PARAMS = {
            "tag", "ascsubtag", "linkCode", "linkId", "creative", "creativeASIN", "camp", "ref_",
    };

    /** Affiliate and tracking parameters dropped from every final store URL. */
    private static final String[] STRIPPED_PARAMS = {
            // Impact
            "irclickid", "irgwc", "clickid", "sharedid", "subId1", "subId2", "subId3",
            "veh", "affiliates_ad_id", "wmlspartner", "afsrc",
            // eBay Partner Network
            "mkcid", "mkrid", "mkevt", "campid", "toolid", "customid",
            // Rakuten and CJ
            "ranMID", "ranEAID", "ranSiteID", "cjevent", "cjdata",
            // Awin, Partnerize, Skimlinks
            "awc", "clickref", "sv1", "sv_campaign_id", "skimlinks_id",
            // Ad click IDs
            "gclid", "gbraid", "wbraid", "fbclid", "msclkid", "dclid",
    };

    private AffiliateLinkCleaner() {
    }

    // ── Call-site replacements ─────────────────────────────────────────────

    public static void startActivity(Object receiver, Intent intent) {
        dispatch(intent, () -> {
            if (receiver instanceof Context) {
                ((Context) receiver).startActivity(intent);
            } else {
                invoke(receiver, "startActivity", new Class<?>[]{Intent.class}, intent);
            }
        });
    }

    public static void startActivity(Object receiver, Intent intent, Bundle options) {
        dispatch(intent, () -> {
            if (receiver instanceof Context) {
                ((Context) receiver).startActivity(intent, options);
            } else {
                invoke(receiver, "startActivity", new Class<?>[]{Intent.class, Bundle.class}, intent, options);
            }
        });
    }

    public static void startActivityForResult(Object receiver, Intent intent, int requestCode) {
        dispatch(intent, () -> {
            if (receiver instanceof Activity) {
                ((Activity) receiver).startActivityForResult(intent, requestCode);
            } else {
                invoke(receiver, "startActivityForResult", new Class<?>[]{Intent.class, int.class},
                        intent, requestCode);
            }
        });
    }

    public static void startActivityForResult(Object receiver, Intent intent, int requestCode, Bundle options) {
        dispatch(intent, () -> {
            if (receiver instanceof Activity) {
                ((Activity) receiver).startActivityForResult(intent, requestCode, options);
            } else {
                invoke(receiver, "startActivityForResult",
                        new Class<?>[]{Intent.class, int.class, Bundle.class}, intent, requestCode, options);
            }
        });
    }

    /** Replaces WebView.loadUrl(String). */
    public static void loadUrl(Object webView, String url) {
        if (url != null && isOpaqueTracker(url)) {
            resolveThen(url, resolved -> MAIN.post(() -> load(webView, clean(resolved))));
        } else {
            load(webView, clean(url));
        }
    }

    private static void load(Object webView, String url) {
        if (webView instanceof android.webkit.WebView) {
            ((android.webkit.WebView) webView).loadUrl(url);
        } else {
            invoke(webView, "loadUrl", new Class<?>[]{String.class}, url);
        }
    }

    // ── Cleaning ───────────────────────────────────────────────────────────

    private interface UrlCallback {
        void accept(String url);
    }

    /** Cleans a VIEW intent's URL, then runs {@code start}, at once or after a tracker answers. */
    private static void dispatch(Intent intent, Runnable start) {
        Intent share = shareIntent(intent);
        if (share != null) {
            cleanShare(share, share == intent ? null : intent, start);
            return;
        }
        String before = viewUrl(intent);
        if (before == null) {
            start.run();
            return;
        }
        if (isOpaqueTracker(before)) {
            resolveThen(before, resolved -> MAIN.post(() -> {
                setUrl(intent, before, clean(resolved));
                start.run();
            }));
            return;
        }
        setUrl(intent, before, clean(before));
        start.run();
    }

    // ── Shared links ───────────────────────────────────────────────────────

    private static final java.util.regex.Pattern URL_IN_TEXT =
            java.util.regex.Pattern.compile("https?://[^\\s<>\"']+");

    /** The ACTION_SEND intent, directly or inside a chooser, or null. */
    private static Intent shareIntent(Intent intent) {
        try {
            if (intent == null) {
                return null;
            }
            if (Intent.ACTION_SEND.equals(intent.getAction())) {
                return intent;
            }
            if (Intent.ACTION_CHOOSER.equals(intent.getAction())) {
                Intent inner = intent.getParcelableExtra(Intent.EXTRA_INTENT);
                if (inner != null && Intent.ACTION_SEND.equals(inner.getAction())) {
                    return inner;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /** Cleans every link in a shared text, resolving trackers first when there are any. */
    private static void cleanShare(Intent share, Intent chooser, Runnable start) {
        CharSequence text = share.getCharSequenceExtra(Intent.EXTRA_TEXT);
        if (text == null) {
            start.run();
            return;
        }
        String original = text.toString();
        boolean tracker = false;
        java.util.regex.Matcher matcher = URL_IN_TEXT.matcher(original);
        while (matcher.find()) {
            if (isOpaqueTracker(matcher.group())) {
                tracker = true;
                break;
            }
        }
        if (!tracker) {
            setShareText(share, chooser, original, cleanText(original, false));
            start.run();
            return;
        }
        new Thread(() -> {
            String cleaned = cleanText(original, true);
            MAIN.post(() -> {
                setShareText(share, chooser, original, cleaned);
                start.run();
            });
        }, "MSP-LINKS").start();
    }

    private static String cleanText(String text, boolean resolveTrackers) {
        java.util.regex.Matcher matcher = URL_IN_TEXT.matcher(text);
        StringBuilder out = new StringBuilder();
        int last = 0;
        while (matcher.find()) {
            String url = matcher.group();
            if (resolveTrackers && isOpaqueTracker(url)) {
                url = resolve(url);
            }
            out.append(text, last, matcher.start()).append(cleanQuietly(url));
            last = matcher.end();
        }
        return out.append(text.substring(last)).toString();
    }

    private static void setShareText(Intent share, Intent chooser, String before, String after) {
        try {
            Log.i(TAG, after.equals(before) ? "share " + before : "share " + after + " instead of " + before);
            if (!after.equals(before)) {
                share.putExtra(Intent.EXTRA_TEXT, after);
                if (chooser != null) {
                    // The chooser holds its own copy of the send intent.
                    chooser.putExtra(Intent.EXTRA_INTENT, share);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "share clean failed: " + t);
        }
    }

    /** Replaces ClipboardManager.setPrimaryClip(ClipData): copied links are cleaned too. */
    public static void setPrimaryClip(Object clipboard, android.content.ClipData clip) {
        android.content.ClipData cleaned = clip;
        try {
            if (clip != null && clip.getItemCount() == 1 && clip.getItemAt(0).getText() != null) {
                String before = clip.getItemAt(0).getText().toString();
                String after = cleanText(before, false);
                if (!after.equals(before)) {
                    Log.i(TAG, "copy " + after + " instead of " + before);
                    CharSequence label = clip.getDescription() == null ? null : clip.getDescription().getLabel();
                    cleaned = android.content.ClipData.newPlainText(label, after);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "clip clean failed: " + t);
        }
        if (clipboard instanceof android.content.ClipboardManager) {
            ((android.content.ClipboardManager) clipboard).setPrimaryClip(cleaned);
        } else {
            invoke(clipboard, "setPrimaryClip", new Class<?>[]{android.content.ClipData.class}, cleaned);
        }
    }

    private static String viewUrl(Intent intent) {
        try {
            if (intent == null || !Intent.ACTION_VIEW.equals(intent.getAction())) {
                return null;
            }
            Uri data = intent.getData();
            return data == null ? null : data.toString();
        } catch (Throwable t) {
            return null;
        }
    }

    private static void setUrl(Intent intent, String before, String after) {
        try {
            if (!after.equals(before)) {
                intent.setDataAndType(Uri.parse(after), intent.getType());
            }
        } catch (Throwable t) {
            Log.w(TAG, "intent clean failed: " + t);
        }
    }

    private static boolean isOpaqueTracker(String url) {
        try {
            Uri uri = Uri.parse(url);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || path == null) {
                return false;
            }
            host = host.toLowerCase(Locale.US);
            for (String[] tracker : OPAQUE_TRACKERS) {
                if (matches(host, tracker[0]) && path.startsWith(tracker[1])) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Reads the tracker's redirect off the main thread: up to three hops, while
     * the answer is still an opaque tracker. Gives back the original URL when
     * a request fails or no redirect comes.
     */
    private static void resolveThen(String url, UrlCallback callback) {
        new Thread(() -> callback.accept(resolve(url)), "MSP-LINKS").start();
    }

    /** Blocking; never on the main thread. */
    private static String resolve(String url) {
        String current = url;
        try {
            for (int hop = 0; hop < 3 && isOpaqueTracker(current); hop++) {
                HttpURLConnection connection = (HttpURLConnection) new URL(current).openConnection();
                connection.setInstanceFollowRedirects(false);
                connection.setUseCaches(false);
                connection.setConnectTimeout(5000);
                connection.setReadTimeout(5000);
                connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android)");
                int code = connection.getResponseCode();
                String location = connection.getHeaderField("Location");
                connection.disconnect();
                if (code < 300 || code >= 400 || location == null) {
                    Log.i(TAG, "tracker gave no redirect (" + code + "): " + current);
                    return url;
                }
                current = new URL(new URL(current), location).toString();
            }
            return isOpaqueTracker(current) ? url : current;
        } catch (Throwable t) {
            Log.w(TAG, "tracker request failed: " + t);
            return url;
        }
    }

    /** Returns the URL to open in place of {@code url}. Never throws. */
    public static String clean(String url) {
        if (url == null || url.isEmpty()) {
            return url;
        }
        try {
            String result = clean(Uri.parse(url), 0).toString();
            if (result.equals(url)) {
                Log.i(TAG, "open " + url);
            } else {
                Log.i(TAG, "open " + result + " instead of " + url);
            }
            return result;
        } catch (Throwable t) {
            Log.w(TAG, "clean failed: " + t);
            return url;
        }
    }

    private static String cleanQuietly(String url) {
        try {
            return clean(Uri.parse(url), 0).toString();
        } catch (Throwable t) {
            return url;
        }
    }

    /** Drop-in for Uri.parse(String). */
    public static Uri parse(String url) {
        return Uri.parse(clean(url));
    }

    private static Uri clean(Uri uri, int depth) {
        String host = uri.getHost();
        if (host == null || depth > 5 || uri.isOpaque()) {
            return uri;
        }
        host = host.toLowerCase(Locale.US);

        if (host.equals("api.dealseek.com") && "/deeplink/redirect".equals(uri.getPath())) {
            Uri destination = dealSeek(uri);
            return destination == null ? uri : clean(destination, depth + 1);
        }

        for (String[] redirector : REDIRECTORS) {
            if (!matches(host, redirector[0])) {
                continue;
            }
            for (int i = 1; i < redirector.length; i++) {
                String destination = query(uri, redirector[i]);
                if (destination != null && looksLikeUrl(destination)) {
                    return clean(Uri.parse(destination), depth + 1);
                }
            }
            break;
        }

        boolean amazon = host.equals("amazon.com") || host.contains(".amazon.") || host.startsWith("amazon.")
                || host.equals("amzn.to");
        return stripParams(uri, amazon);
    }

    private static Uri dealSeek(Uri uri) {
        String destination = query(uri, "destination_url");
        if (destination != null) {
            return Uri.parse(destination);
        }
        String asin = query(uri, "asin");
        if (asin != null && "walmart".equals(query(uri, "platform"))) {
            return Uri.parse("https://www.walmart.com/ip/" + Uri.encode(asin));
        }
        return null;
    }

    private static Uri stripParams(Uri uri, boolean amazon) {
        if (uri.getEncodedQuery() == null) {
            return uri;
        }
        boolean changed = false;
        Uri.Builder builder = uri.buildUpon().clearQuery();
        for (String name : uri.getQueryParameterNames()) {
            if (isStripped(name) || (amazon && contains(AMAZON_PARAMS, name))) {
                changed = true;
                continue;
            }
            for (String value : uri.getQueryParameters(name)) {
                builder.appendQueryParameter(name, value);
            }
        }
        return changed ? builder.build() : uri;
    }

    private static boolean isStripped(String name) {
        return name.startsWith("utm_") || contains(STRIPPED_PARAMS, name);
    }

    private static boolean looksLikeUrl(String value) {
        String lower = value.toLowerCase(Locale.US);
        return lower.startsWith("http://") || lower.startsWith("https://");
    }

    private static boolean contains(String[] names, String name) {
        for (String candidate : names) {
            if (candidate.equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    /** The query parameter {@code name}, matched without case: Impact names it u or URL. */
    private static String query(Uri uri, String name) {
        for (String candidate : uri.getQueryParameterNames()) {
            if (candidate.equalsIgnoreCase(name)) {
                String value = uri.getQueryParameter(candidate);
                return value == null || value.isEmpty() ? null : value;
            }
        }
        return null;
    }

    private static boolean matches(String host, String domain) {
        return host.equals(domain) || host.endsWith("." + domain);
    }

    private static void invoke(Object receiver, String name, Class<?>[] types, Object... args) {
        try {
            Method method = receiver.getClass().getMethod(name, types);
            method.invoke(receiver, args);
        } catch (java.lang.reflect.InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new RuntimeException(cause);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException(e);
        }
    }
}
