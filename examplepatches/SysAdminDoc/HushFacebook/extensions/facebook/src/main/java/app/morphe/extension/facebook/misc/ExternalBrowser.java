/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/extensions/extension/src/main/java/app/andrewliang/extension/ExternalBrowser.java
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.extension.facebook.misc;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the Facebook "[General] Open links in external browser" patch.
 *
 * <p>Facebook opens each tapped link in its own browser. The patch calls this class from the
 * {@code onCreate} and {@code onNewIntent} of that browser, after the superclass call and before
 * the browser is built. This class then builds an {@link Intent#ACTION_VIEW} on the URL and gives
 * it to the system.
 *
 * <p>The in-app browser has an <i>Open with</i> menu action that builds the same intent. That
 * action is not usable from here. It runs from a dispatcher that needs the chrome and the state
 * objects of the browser, and these objects exist only after the browser is built. To use it, the
 * browser must start and then close. The user sees a flash, and a dead entry stays on the back
 * stack.
 *
 * <p>The URL that arrives is not the URL that the user tapped. Facebook wraps each outbound link
 * in its link shim. See {@link #unwrapLinkShim}.
 *
 * <p>An {@code ACTION_VIEW} on an ordinary URL cannot come back into Facebook and make a loop.
 * Each {@code http} and {@code https} intent filter of Facebook is limited to a host that Facebook
 * owns.
 *
 * <p>{@link #redirect} returns {@code false} when the link must stay in the in-app browser. The
 * patch then continues into the original code of Facebook. This covers the domains of Facebook,
 * the schemes that are not web schemes, and a device that has no browser. A link that no other app
 * can open must still open in the app.
 */
public final class ExternalBrowser {

    private ExternalBrowser() {}

    /** The source every event of this hook carries in the diagnostic report. */
    private static final String SOURCE = "ExternalBrowser";

    /**
     * The hosts that stay in the in-app browser.
     *
     * <p>Login, checkout and the web pages of Facebook need the JavaScript bridges and the autofill
     * of the in-app browser. No other browser has them.
     */
    private static final String[] INTERNAL_HOSTS = {
        "facebook.com",
        "fb.com",
        "messenger.com",
        "meta.com",
    };

    /**
     * Facebook's short links, which stay in the in-app browser too. Facebook's manifest claims
     * each of them, but a re-signed Facebook fails Android's check of that claim, so a browser
     * given one opened Facebook's page on the web instead of in the app. None of them is a shim
     * host, except fb.me for /l.php, which Facebook's own shim check counts.
     */
    private static final String[] SHORT_LINK_HOSTS = {
        "fb.watch",
        "fbwat.ch",
        "fb.me",
        "fb.gg",
        "fb.audio",
        "m.me",
    };

    /**
     * The in-app browser's link warning pages, a shim of their own. The browser knows them by a
     * pattern that asks for https on a subdomain of facebook.com.
     */
    private static final String[] WARNING_PATHS = {
        "/flx/warn/",
        "/fblynx/warn/",
        "/si/linkclick/warn/",
    };

    /** Messenger's older shim, /l/&lt;signature&gt;;&lt;destination&gt;, read the way Messenger reads it. */
    private static final Pattern PATH_SHIM = Pattern.compile("^/l/([a-zA-Z0-9_.-]*)(?:;|/)(.*)$");

    /** How many shims deep a link is followed. Facebook's own unwrapping loops the same way. */
    private static final int MAX_SHIMS = 8;

    /**
     * Gives the URL of {@code intent} to the system browser and closes the in-app browser.
     *
     * @param activity the in-app browser activity. It closes only when the link goes out.
     * @param intent   the intent that started the activity. The URL is the data of that intent,
     *                 and not an extra.
     * @return {@code true} when the link went out and the caller must stop. {@code false} when the
     *         caller must continue and open the in-app browser as before.
     */
    public static boolean redirect(Activity activity, Intent intent) {
        HookStatus.invoked(FamilyNames.EXTERNAL_BROWSER);
        if (activity == null || intent == null) return false;
        if (!switchedOn()) return false;

        Uri uri = intent.getData();
        if (uri == null || !isWebUrl(uri)) return false;

        Uri target = unwrapLinkShim(uri);
        if (isInternalHost(target.getHost()) || isOn(target.getHost(), SHORT_LINK_HOSTS)) return false;
        // Facebook adds fbclid to the destination inside the shim, so the site it opens can tell
        // Facebook the link was followed. It goes, and nothing else in the link changes.
        target = Uri.parse(LinkCleaner.clean(target.toString()));

        try {
            Intent view = new Intent(Intent.ACTION_VIEW, target);
            // Only an app that declares it opens web links takes it, as for any link from an app.
            view.addCategory(Intent.CATEGORY_BROWSABLE);
            // The in-app browser closes, thus the link needs a task of its own to live in.
            view.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(view);
        } catch (Throwable t) {
            // ActivityNotFoundException: the device has no browser, or the browser is off.
            // SecurityException: the target that answered refused the launch. In both cases, leave
            // the link to Facebook and do not lose it. Only the class is reported: the exception's
            // own text quotes the intent, and the intent carries the link.
            final String kind = t.getClass().getSimpleName();
            Logger.diagnosticError(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "No external browser took the link (" + kind + "). It stays in the in-app browser.", null);
            return false;
        }

        activity.finish();
        return true;
    }

    /**
     * The true destination of a Facebook link-shim URL, or {@code uri} when it is not a shim.
     *
     * <p>Facebook does not give the browser the link that the user tapped. It gives it
     * {@code https://lm.facebook.com/l.php?u=<the true URL>&h=<signature>}. This is the click
     * tracker of Facebook, and it is on a host that Facebook owns.
     *
     * <p>As a result each outbound link looks internal, and each one stays in the in-app browser.
     * This was the fault that the device test of 2026-09-19 found.
     *
     * <p>The destination goes out, and the shim does not. Thus the browser makes one request and
     * not two, and Facebook does not learn that the link opened. A shim inside a shim unwraps to
     * the end.
     */
    private static Uri unwrapLinkShim(Uri uri) {
        Uri target = uri;
        for (int depth = 0; depth < MAX_SHIMS; depth++) {
            Uri inner = shimDestination(target);
            if (inner == null) break;
            target = inner;
        }
        return target;
    }

    /**
     * The destination {@code uri} wraps, or null when it is no link shim or wraps no web link.
     *
     * <p>The shims are the ones Facebook's own code knows on 577 and 580, host and path
     * (LinkShimFixtureTest), plus Messenger's web shim:
     * <ul>
     *   <li>{@code /l.php} on facebook.com, a subdomain of it, or fb.me. It's the check the rest of
     *       the app asks, and it reads the destination from {@code u}.</li>
     *   <li>{@code /l.php} on messenger.com or a subdomain, reading {@code u}. l.messenger.com is
     *       Meta's shim host for links in chats. Neither build's own checks name it, but it's kept
     *       beyond Facebook's lists because a chat link wrapped that way would otherwise look like
     *       a Messenger page and stay in the in-app browser, the fault of 2026-09-19.</li>
     *   <li>{@code /si/ajax/l/...} and {@code /l/...} on facebook.com or a subdomain, Messenger's
     *       check for the links on its message cards. The first reads {@code u}. The second holds
     *       the destination in its path, with http:// in front when it names no scheme.</li>
     *   <li>The in-app browser's warning pages, {@code /flx/warn/}, {@code /fblynx/warn/} and
     *       {@code /si/linkclick/warn/}, over https on a subdomain of facebook.com, reading
     *       {@code u}.</li>
     * </ul>
     * Facebook's host check also turns away hosts starting "our.intern.", Meta's own intranet,
     * which no link on a phone reaches. Any other page, sharer.php and the share dialog among them,
     * keeps its "u", which there names the page to share and not a destination.
     */
    private static Uri shimDestination(Uri uri) {
        if (uri.isOpaque()) return null;
        String host = uri.getHost();
        String path = uri.getPath();
        if (host == null || path == null) return null;

        host = host.toLowerCase(Locale.ROOT);
        boolean subdomain = host.endsWith(".facebook.com");
        boolean facebook = subdomain || host.equals("facebook.com");
        boolean messenger = host.equals("messenger.com") || host.endsWith(".messenger.com");

        String wrapped;
        if (path.equals("/l.php")) {
            if (!facebook && !messenger && !host.equals("fb.me")) return null;
            wrapped = uri.getQueryParameter("u");
        } else if (facebook && path.startsWith("/si/ajax/l/")) {
            wrapped = uri.getQueryParameter("u");
        } else if (facebook && path.startsWith("/l/")) {
            Matcher inPath = PATH_SHIM.matcher(path);
            if (!inPath.matches()) return null;
            wrapped = inPath.group(2);
            if (Uri.parse(wrapped).getScheme() == null) wrapped = "http://" + wrapped;
        } else if (subdomain && "https".equalsIgnoreCase(uri.getScheme()) && isWarningPage(path)) {
            wrapped = uri.getQueryParameter("u");
        } else {
            return null;
        }
        if (wrapped == null) return null;

        // A destination that is not an absolute web URL belongs to some other page. Keep the URL
        // as it is.
        Uri target = Uri.parse(wrapped);
        String targetHost = target.getHost();
        return isWebUrl(target) && targetHost != null && !targetHost.isEmpty() ? target : null;
    }

    /** Whether {@code path} is one of the browser's warning pages, compared as its pattern does, in any case. */
    private static boolean isWarningPage(String path) {
        for (String warning : WARNING_PATHS) {
            if (path.regionMatches(true, 0, warning, 0, warning.length())) return true;
        }
        return false;
    }

    /**
     * The Hushfacebook switch. Off, unreadable, or asked before the settings are ready, the link
     * stays in the app.
     */
    private static boolean switchedOn() {
        try {
            return Utils.settingsReady() && Settings.OPEN_LINKS_EXTERNALLY.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.EXTERNAL_BROWSER, "switch read", t);
            Logger.diagnosticError(DiagnosticCategory.FEED_AND_NAVIGATION, SOURCE,
                    () -> "Could not read the external browser switch", t);
            return false;
        }
    }

    /** Whether {@code uri} is an {@code http} or an {@code https} URL. */
    /** Whether the scheme is http or https, in any case: a scheme is case-insensitive (RFC 3986). */
    private static boolean isWebUrl(Uri uri) {
        String scheme = uri.getScheme();
        return "http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme);
    }

    /** Whether {@code host} is a domain of Facebook, or a subdomain of one. */
    private static boolean isInternalHost(String host) {
        return isOn(host, INTERNAL_HOSTS);
    }

    /** Whether {@code host} is one of {@code domains}, or a subdomain of one. */
    private static boolean isOn(String host, String[] domains) {
        if (host == null) return false;

        String lower = host.toLowerCase(Locale.ROOT);
        for (String domain : domains) {
            // The dot keeps "notfacebook.com" from a match with "facebook.com".
            if (lower.equals(domain) || lower.endsWith("." + domain)) return true;
        }

        return false;
    }
}
