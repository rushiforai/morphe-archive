package app.linkedin.extension;

import android.util.Log;

import java.util.List;

/**
 * Hook for the server driven UI (SDUI) screens, which render through
 * ComponentTransformer.doTransform(Component, ...). Returning true makes doTransform
 * return null, which the transformer already does for components it skips.
 *
 * Markers below were taken from real payloads of LinkedIn 4.1.1255.1 (viewTracking.viewName).
 */
@SuppressWarnings("unused")
public final class SduiComponentFilter {
    private static final String MEDIA_SCREEN_PREFIX = "com.linkedin.sdui.impl.mediaproduct.screens.";
    private static final String PROFILE_MEDIA_PREFIX = "com.linkedin.sdui.impl.profile.destinations.";

    public static boolean shouldHide(Object component) {
        try {
            Object viewTracking = Proto.is(component, "hasViewTracking")
                    ? Proto.call(component, "getViewTracking") : null;
            String viewName = Proto.string(viewTracking, "getViewName");
            String screenName = Proto.string(component, "getObservabilityViewName");

            switch (viewName) {
                case "feed-full-update":
                    return hideFeedUpdate(component, viewTracking);
                case "job-card":
                    return hidePromotedJob(component);
                case "multiphoto-viewer":
                    collectMedia(component, viewName);
                    return false;
                case "feed-reaction-count":
                case "feed-comment-count":
                case "feed-repost-count":
                case "comment-reaction-count":
                    return hide(Settings.focusMode(), "focus mode: " + viewName);
                case "feed-new-update-pill":
                    return hide(Settings.hideNewPostsPill(), "new posts pill");
                case "feed-see-translation":
                    return hide(Settings.hideTranslation(), "see translation");
                case "profile-card-promo":
                    // "Suggested for you" profile section; hidden when it carries Premium upsells.
                    return hide(Settings.hidePremium()
                            && ProtoScanner.containsAscii(payload(component), "premium-upsell-card"), "profile promo");
                default:
                    break;
            }

            if (Settings.hidePremium() && viewName.contains("upsell")) {
                // premium-upsell-card, profile-ai-enhance-card-upsell, taj-home-upsell, ...
                return hide(true, "premium upsell: " + viewName);
            }

            if (screenName.startsWith(MEDIA_SCREEN_PREFIX) || screenName.startsWith(PROFILE_MEDIA_PREFIX)) {
                collectMedia(component, screenName);
            }
            return false;
        } catch (Throwable t) {
            Log.e(Settings.TAG, "shouldHide failed", t);
            return false;
        }
    }

    private static boolean hideFeedUpdate(Object component, Object viewTracking) {
        boolean ads = Settings.hideAds();
        boolean suggested = Settings.hideSuggested();
        boolean celebrations = Settings.hideCelebrations();
        boolean jobs = Settings.hideFeedJobs();
        boolean reposts = Settings.hideReposts();
        boolean videos = Settings.hideVideoPosts();
        boolean shortLinks = Settings.resolveShortLinks();
        if (!ads && !suggested && !celebrations && !jobs && !reposts && !videos && !shortLinks) return false;

        byte[] payload = payload(component);
        if (shortLinks && ProtoScanner.containsAscii(payload, ShortLinkResolver.PREFIX)) {
            for (String s : ProtoScanner.scan(payload).strings) {
                if (s.contains(ShortLinkResolver.PREFIX)) OpenLinksDirectlyPatch.prefetchShortLinks(s);
            }
        }
        if (ads && (hasSponsoredTracking(viewTracking)
                || ProtoScanner.containsAscii(payload, "urn:li:sponsoredContentV2:"))) {
            return hide(true, "sponsored feed update");
        }
        // Child components are embedded in the post payload, so their view names identify the post type.
        if (celebrations && ProtoScanner.containsAscii(payload, "feed-celebrations-update-detail")) {
            return hide(true, "celebration post");
        }
        if (jobs && ProtoScanner.containsAscii(payload, "feed-job-card-entity")) {
            return hide(true, "job post");
        }
        if (reposts && ProtoScanner.containsAscii(payload, "feed-original-share-description")) {
            return hide(true, "repost");
        }
        if (videos && ProtoScanner.containsAscii(payload, "large-single-video-view")) {
            return hide(true, "video post");
        }
        // The header label is its own string field, so match the whole string, never a substring
        // of post text.
        if (suggested && ProtoScanner.hasExactString(payload, "Suggested", "Disarankan")) {
            return hide(true, "suggested post");
        }
        return false;
    }

    private static boolean hidePromotedJob(Object component) {
        if (!Settings.hidePromotedJobs()) return false;
        return hide(ProtoScanner.hasExactString(payload(component), "Promoted", "Dipromosikan"), "promoted job");
    }

    private static boolean hide(boolean hide, String reason) {
        if (hide) Settings.debugLog("hide " + reason);
        return hide;
    }

    /** viewTracking.metadata[] contains a TrackingMetadata with sponsoredData for ads. */
    private static boolean hasSponsoredTracking(Object viewTracking) {
        Object metadata = Proto.call(viewTracking, "getMetadataList");
        if (!(metadata instanceof List)) return false;
        for (Object item : (List<?>) metadata) {
            if (Proto.is(item, "hasSponsoredData")) return true;
        }
        return false;
    }

    private static void collectMedia(Object component, String source) {
        if (!Settings.downloadMedia()) return;
        SduiMediaDownload.offer(ProtoScanner.scan(payload(component)), source, source.startsWith(PROFILE_MEDIA_PREFIX));
    }

    private static byte[] payload(Object component) {
        Object bytes = Proto.call(component, "toByteArray");
        return bytes instanceof byte[] ? (byte[]) bytes : null;
    }
}
