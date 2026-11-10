/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.net.Uri;

/**
 * Skips LinkedIn's external link warning page (https://www.linkedin.com/safety/go/?url=...) and
 * expands lnkd.in links whose target is already known.
 */
@SuppressWarnings("unused")
public final class OpenLinksDirectlyPatch {

    /** Injected at the start of the SDUI NavigateToUrlActionViewData constructor. */
    public static Uri unwrap(Uri uri) {
        try {
            if (uri == null) return null;
            if (!Settings.openLinksDirectly()) return uri;
            return expandShortLink(throughSafetyPage(uri));
        } catch (Throwable failure) {
            Diagnostics.error("unwrap failed", failure);
            return uri;
        }
    }

    /** A LinkedIn "safety" page becomes its url= target; any other URI is returned unchanged. */
    private static Uri throughSafetyPage(Uri uri) {
        String linkHost = uri.getHost();
        String linkPath = uri.getPath();
        if (linkHost == null || linkPath == null) return uri;
        boolean linkedInHost = linkHost.equals("linkedin.com") || linkHost.endsWith(".linkedin.com");
        if (!linkedInHost) return uri;
        if (!linkPath.startsWith("/safety/go")) return uri;

        String destination = uri.getQueryParameter("url");
        if (destination == null) return uri;
        Uri unwrapped = Uri.parse(destination);
        if (!opensInBrowser(unwrapped)) return uri;
        Settings.debugLog("open link directly: " + unwrapped.getHost());
        return unwrapped;
    }

    /**
     * A lnkd.in link becomes its cached target when there is one. Otherwise it opens normally (the
     * warning page) and the target is fetched in the background so the next tap goes direct.
     */
    private static Uri expandShortLink(Uri uri) {
        String linkHost = uri.getHost();
        if (!"lnkd.in".equalsIgnoreCase(linkHost)) return uri;
        if (!Settings.resolveShortLinks()) return uri;

        String shortLink = uri.toString();
        String knownTarget = ShortLinkResolver.cached(shortLink);
        if (knownTarget == null) {
            ShortLinkResolver.prefetch(shortLink);
            return uri;
        }
        Uri expanded = Uri.parse(knownTarget);
        if (!opensInBrowser(expanded)) return uri;
        Settings.debugLog("short link expanded: " + expanded.getHost());
        return expanded;
    }

    private static boolean opensInBrowser(Uri uri) {
        String protocol = uri.getScheme();
        if ("https".equalsIgnoreCase(protocol)) return true;
        return "http".equalsIgnoreCase(protocol);
    }

    /** Called with feed payload text, so links the user is about to tap resolve in advance. */
    static void prefetchShortLinks(String payload) {
        if (!Settings.resolveShortLinks()) return;
        if (!payload.contains(ShortLinkResolver.PREFIX)) return;
        ShortLinkResolver.prefetchAll(payload);
    }

    /** Injected at the start of RichTextUtils.getLinkShimmingLink(String): chat links stay as typed. */
    public static boolean skipMessagingShim() {
        return Settings.openLinksDirectly();
    }
}
