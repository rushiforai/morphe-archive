/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 0afb0e33 (GPL-3.0),
 * which forked it from
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/extensions/extension/src/main/java/app/andrewliang/extension/ExternalBrowser.java
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for HushThreads (Threads), 2026.
 */
package app.morphe.extension.hushthreads.misc;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import java.util.Locale;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Open links in browser" patch.
 *
 * <p>Threads opens a tapped web link through one launcher (Redex {@code EDj.A00} on 449, the method
 * that logs "ThreadsBrowserLauncher"). It decides there whether the link shows in Threads' own
 * browser activity, in a sheet over the feed, or in the immersive browser screen. The patch calls
 * {@link #open} first thing in that launcher, so one answer covers all three.
 *
 * <p>The link that arrives is often Threads' click tracker rather than the link that was tapped:
 * {@code https://l.threads.com/?u=<the link>&e=<token>}. See {@link #shimDestination}. The
 * destination goes out, so the browser makes one request and Threads doesn't learn the link opened.
 *
 * <p>The link goes to the system as a browsable {@link Intent#ACTION_VIEW}. Android then picks
 * what opens it the way it does for a link from any app: the default browser, or an app that has
 * verified the link's host, such as YouTube for a YouTube link.
 *
 * <p>{@link #open} returns {@code false} when the link has to stay in Threads, and the launcher
 * goes on as before. That covers Meta's own sites (sign-in, the Accounts Center and the help pages
 * need the in-app browser's session), links that aren't web links, and a phone with nothing to open
 * a web link.
 */
public final class ExternalBrowser {

    private ExternalBrowser() {}

    /** The source every event of this hook carries in the diagnostic report. */
    private static final String SOURCE = "ExternalBrowser";

    /**
     * The sites that stay in Threads' browser, with every subdomain. Threads hands the browser its
     * session cookie for threads.com, and sign-in, challenge and Accounts Center pages on any of
     * these need the in-app browser's bridges. No other browser has them.
     */
    private static final String[] INTERNAL_HOSTS = {
        "threads.com",
        "threads.net",
        "instagram.com",
        "facebook.com",
        "fb.com",
        "fb.me",
        "fb.watch",
        "meta.com",
        "meta.ai",
        "messenger.com",
        "m.me",
    };

    /** Threads' click trackers, read from {@code u=} whatever their path. Threads 449 knows these three. */
    private static final String[] SHIM_HOSTS = {
        "l.threads.com",
        "l.threads.net",
        "l.instagram.com",
    };

    /** The sites whose {@code /linkshim} pages are click trackers over https, on 449. */
    private static final String[] LINKSHIM_SITES = {
        "threads.com",
        "threads.net",
        "instagram.com",
    };

    /** How many trackers deep a link is followed. */
    private static final int MAX_SHIMS = 8;

    /**
     * Sends {@code url} to the phone's browser.
     *
     * @param context the context the launcher opens the link from, usually the activity in front.
     * @param url     the link Threads was about to open, as the launcher got it.
     * @return {@code true} when the link went out and the launcher must stop. {@code false} when
     *         the launcher must go on and open its own browser as before.
     */
    public static boolean open(Context context, String url) {
        HookStatus.invoked(FamilyNames.EXTERNAL_BROWSER);
        if (context == null || url == null) return false;
        if (!switchedOn()) return false;

        Uri target;
        try {
            Uri uri = Uri.parse(url);
            if (!isWebUrl(uri)) return false;
            target = unwrapLinkShim(uri);
        } catch (Throwable t) {
            // A link Android can't take apart stays with Threads, which knows what to do with it.
            return false;
        }
        if (isOn(target.getHost(), INTERNAL_HOSTS)) {
            HookStatus.counted(FamilyNames.EXTERNAL_BROWSER, "Meta links kept in the app");
            return false;
        }
        // The destination keeps everything but the tracking keys, fbclid among them.
        target = Uri.parse(LinkCleaner.clean(target.toString()));

        try {
            // Intent filters match a scheme case-sensitively, so HTTPS://... would find no browser.
            Intent view = new Intent(Intent.ACTION_VIEW, target.normalizeScheme());
            // Only an app that declares it opens web links takes it, as for any link from an app.
            view.addCategory(Intent.CATEGORY_BROWSABLE);
            // A context that isn't an activity has no task for the browser to start in.
            if (!(context instanceof Activity)) view.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(view);
        } catch (Throwable t) {
            // ActivityNotFoundException: the phone has no browser, or it's turned off.
            // SecurityException: the app that answered refused the launch. Either way the link
            // stays with Threads and isn't lost. Only the class is reported: the exception's own
            // text quotes the intent, and the intent carries the link.
            final String kind = t.getClass().getSimpleName();
            HookStatus.counted(FamilyNames.EXTERNAL_BROWSER, "links nothing else could open");
            Logger.diagnosticError(DiagnosticCategory.OTHER, SOURCE,
                    () -> "No browser took the link (" + kind + "). It stays in Threads' browser.", null);
            return false;
        }

        HookStatus.counted(FamilyNames.EXTERNAL_BROWSER, "links sent to the browser");
        return true;
    }

    /**
     * The true destination of a Threads click-tracker URL, or {@code uri} when it isn't one. A
     * tracker inside a tracker unwraps to the end.
     */
    static Uri unwrapLinkShim(Uri uri) {
        Uri target = uri;
        for (int depth = 0; depth < MAX_SHIMS; depth++) {
            Uri inner = shimDestination(target);
            if (inner == null) break;
            target = inner;
        }
        return target;
    }

    /**
     * The destination {@code uri} wraps, or null when it's no click tracker or wraps no web link.
     *
     * <p>These are the trackers Threads' own check knows on 449 (Redex {@code JoS.A08}), each read
     * from {@code u} as Threads reads it:
     * <ul>
     *   <li>Any path on l.threads.com, l.threads.net or l.instagram.com.</li>
     *   <li>{@code /linkshim} and the paths under it, over https, on threads.com, threads.net,
     *       instagram.com or a subdomain of one.</li>
     *   <li>{@code /l.php} on facebook.com, a subdomain of it or fb.me, Facebook's tracker.
     *       Threads' check turns away hosts starting "our.intern.", Meta's own intranet, which no
     *       link on a phone reaches.</li>
     * </ul>
     */
    static Uri shimDestination(Uri uri) {
        if (uri.isOpaque()) return null;
        String host = uri.getHost();
        String path = uri.getPath();
        if (host == null) return null;

        host = host.toLowerCase(Locale.ROOT);
        boolean shim;
        if (isExactly(host, SHIM_HOSTS)) {
            shim = true;
        } else if (path != null && (path.equals("/linkshim") || path.startsWith("/linkshim/"))) {
            shim = "https".equalsIgnoreCase(uri.getScheme()) && isOn(host, LINKSHIM_SITES);
        } else if ("/l.php".equals(path)) {
            shim = (host.equals("facebook.com") || host.endsWith(".facebook.com") || host.equals("fb.me"))
                    && !host.startsWith("our.intern.");
        } else {
            shim = false;
        }
        if (!shim) return null;

        String wrapped = uri.getQueryParameter("u");
        if (wrapped == null) return null;

        // A destination that isn't an absolute web URL belongs to some other page. Keep the URL as
        // it is.
        Uri target = Uri.parse(wrapped);
        String targetHost = target.getHost();
        return isWebUrl(target) && targetHost != null && !targetHost.isEmpty() ? target : null;
    }

    /**
     * The HushThreads switch. Off, unreadable, or asked before the settings are ready, the link
     * stays in Threads.
     */
    private static boolean switchedOn() {
        try {
            return Utils.settingsReady() && Settings.OPEN_LINKS_EXTERNALLY.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.EXTERNAL_BROWSER, "switch read", t);
            return false;
        }
    }

    /** Whether the scheme is http or https, in any case: a scheme is case-insensitive (RFC 3986). */
    private static boolean isWebUrl(Uri uri) {
        String scheme = uri.getScheme();
        return "http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme);
    }

    /** Whether {@code host} is one of {@code hosts}, in any case. */
    private static boolean isExactly(String host, String[] hosts) {
        for (String candidate : hosts) {
            if (host.equalsIgnoreCase(candidate)) return true;
        }
        return false;
    }

    /** Whether {@code host} is one of {@code domains}, or a subdomain of one. */
    private static boolean isOn(String host, String[] domains) {
        if (host == null) return false;

        String lower = host.toLowerCase(Locale.ROOT);
        for (String domain : domains) {
            // The dot keeps "notthreads.com" from a match with "threads.com".
            if (lower.equals(domain) || lower.endsWith("." + domain)) return true;
        }

        return false;
    }
}
