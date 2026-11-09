package app.badfella.extension.linkedin;


import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@SuppressWarnings("unused")
public final class HideAdsPatch {
    private static final String TAG = "LinkedInPatches";

    /** Bound for reshared/attachment/carousel/aggregated wrapping so a malformed graph cannot recurse. */
    private static final int MAX_UPDATE_DEPTH = 3;

    /** URN entity types and raw tokens that only sponsored rather than organic updates carry. */
    private static final String[] SPONSORED_URN_TOKENS = {
            "sponsoredcontent", "sponsoredcreative", "sponsoredupdate",
            "adcreative", "adupdate", "promotedupdate",
    };

    private static volatile Method copyWithNewElements;

    /**
     * Replaces collectionTemplate.copyWithNewElements(list) in the main feed's model filter.
     */
    public static Object copyWithoutSponsored(Object collectionTemplate, List<Object> updates) throws Exception {
        Method copy = copyWithNewElements;
        if (copy == null) {
            copy = collectionTemplate.getClass().getMethod("copyWithNewElements", List.class);
            copyWithNewElements = copy;
        }
        try {
            return copy.invoke(collectionTemplate, filterSponsored(updates));
        } catch (InvocationTargetException e) {
            // Keep the original call's exception behavior.
            Throwable cause = e.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            throw e;
        }
    }

    static List<Object> filterSponsored(List<Object> updates) {
        if (updates == null || updates.isEmpty() || !Settings.hideAds()) return updates;
        try {
            List<Object> result = new ArrayList<>(updates.size());
            for (Object update : updates) {
                if (!isSponsored(update)) result.add(update);
            }
            Settings.debugLog("legacy feed: removed " + (updates.size() - result.size()) + " of " + updates.size());
            return result;
        } catch (Throwable t) {
            Diagnostics.error("filterSponsored failed", t);
            return updates;
        }
    }

    private static boolean isSponsored(Object update) {
        return isSponsored(update, 0);
    }

    /**
     * Sponsored or promoted content. Sponsored tracking metadata and sponsored URNs are authoritative;
     * lead-gen form content, boosted headers, call-to-action cards and the feed's Promoted/Sponsored
     * labels cover ads that arrive without either. Ads can wrap an inner update or an aggregated list,
     * so nested updates are checked with a bounded depth.
     */
    private static boolean isSponsored(Object update, int depth) {
        if (update == null || depth > MAX_UPDATE_DEPTH) return false;
        if (hasSponsoredUrn(update)) return true;
        if (hasSponsoredTracking(Reflect.get(Reflect.get(update, "metadata"), "trackingData"))) return true;
        if (Reflect.get(update, "leadGenFormContent") != null) return true;
        if (isTrue(update, "hasLeadGenFormContent")) return true;
        if (isTrue(update, "hasBoostHeader") || Reflect.get(update, "boostHeader") != null) return true;
        if (hasCallToAction(update)) return true;
        if (hasPromotedLabel(update)) return true;
        if (hasSponsoredCarouselItem(update, depth)) return true;
        if (isSponsored(Reflect.get(update, "resharedUpdate"), depth + 1)) return true;
        if (isSponsored(Reflect.get(Reflect.get(update, "attachment"), "update"), depth + 1)) return true;
        return hasSponsoredAggregatedUpdate(update, depth);
    }

    /**
     * UpdateMetadata.trackingData. A present sponsoredTracking (SponsoredMetadata) is only attached to
     * ad responses; its adUrn and serving leaves identify the record. The boolean flag covers builds
     * that omit the object.
     */
    private static boolean hasSponsoredTracking(Object tracking) {
        if (tracking == null) return false;
        if (isTrue(tracking, "hasSponsoredTracking")) return true;
        if (Reflect.get(tracking, "adUrn") != null) return true;
        return Reflect.get(tracking, "sponsoredTracking") != null;
    }

    /**
     * Sponsored entity URNs. LinkedIn names ad entities such as sponsoredContent, sponsoredCreative
     * and sponsoredUpdate; organic updates use update/activity. Both the parsed entity type and the
     * raw URN are checked because failures can leave either one populated.
     */
    private static boolean hasSponsoredUrn(Object update) {
        return isSponsoredUrn(Reflect.get(update, "entityUrn"))
                || isSponsoredUrn(Reflect.get(update, "preDashEntityUrn"))
                || isSponsoredUrn(Reflect.get(Reflect.get(update, "attachment"), "entityUrn"))
                || isSponsoredUrn(Reflect.get(Reflect.get(update, "attachment"), "preDashEntityUrn"));
    }

    private static boolean isSponsoredUrn(Object urn) {
        if (urn == null) return false;
        if (mentionsSponsoredUrn(asString(Reflect.get(urn, "entityType")))) return true;
        return mentionsSponsoredUrn(asString(Reflect.get(urn, "rawUrnString")));
    }

    private static boolean mentionsSponsoredUrn(String value) {
        if (value == null) return false;
        String lower = value.toLowerCase(Locale.ROOT);
        for (String token : SPONSORED_URN_TOKENS) {
            if (lower.contains(token)) return true;
        }
        return false;
    }

    private static boolean hasSponsoredAggregatedUpdate(Object update, int depth) {
        Object updates = Reflect.get(Reflect.get(update, "aggregatedContent"), "updates");
        if (!(updates instanceof List)) return false;
        for (Object nested : (List<?>) updates) {
            if (isSponsored(nested, depth + 1)) return true;
        }
        return false;
    }

    private static boolean hasCallToAction(Object update) {
        if (hasComponent(update, "hasCallToActionComponentValue")) return true;
        return Reflect.get(Reflect.get(update, "content"), "callToActionComponentValue") != null
                || Reflect.get(Reflect.get(Reflect.get(update, "attachment"), "content"),
                        "callToActionComponentValue") != null;
    }

    private static boolean hasPromotedLabel(Object update) {
        return hasPromotedActor(Reflect.get(update, "actor"))
                || hasPromotedActor(Reflect.get(Reflect.get(update, "content"), "actorComponentValue"))
                || hasPromotedTextIn(Reflect.get(update, "header"))
                || hasPromotedTextIn(Reflect.get(update, "detailHeader"))
                || hasPromotedTextIn(Reflect.get(update, "contextualHeader"))
                || hasPromotedTextIn(Reflect.get(update, "contextualDescription"));
    }

    private static boolean hasPromotedActor(Object actor) {
        if (actor == null) return false;
        return isPromotedText(Reflect.get(actor, "subDescription"))
                || isPromotedText(Reflect.get(actor, "subDescriptionButton"))
                || isPromotedText(Reflect.get(actor, "supplementaryActorInfo"))
                || isPromotedText(Reflect.get(actor, "description"));
    }

    /** HeaderComponent.text and the ContextualHeaderComponent text variants. */
    private static boolean hasPromotedTextIn(Object header) {
        if (header == null) return false;
        return isPromotedText(Reflect.get(header, "text"))
                || isPromotedText(Reflect.get(header, "title"))
                || isPromotedText(Reflect.get(header, "subtitle"))
                || isPromotedText(Reflect.get(header, "contextualTitle"))
                || isPromotedText(Reflect.get(header, "titleSupplementaryInfo"))
                || isPromotedText(Reflect.get(header, "contextualTitleSupplementaryInfo"));
    }

    /**
     * TextViewModel carries both text and accessibilityText; ButtonComponent carries a plain string.
     * Labels can be joined with separators or non-breaking spaces, so match the words rather than the
     * whole value.
     */
    private static boolean isPromotedText(Object value) {
        if (value == null) return false;
        if (value instanceof CharSequence) return mentionsPromoted(value.toString());
        return mentionsPromoted(asString(Reflect.get(value, "text")))
                || mentionsPromoted(asString(Reflect.get(value, "accessibilityText")));
    }

    private static boolean mentionsPromoted(String text) {
        if (text == null) return false;
        String lower = text.toLowerCase(Locale.ROOT);
        return lower.contains("promoted") || lower.contains("sponsored") || lower.contains("dipromosikan");
    }

    private static boolean hasSponsoredCarouselItem(Object update, int depth) {
        Object items = Reflect.get(carouselOf(update), "items");
        if (!(items instanceof List)) return false;
        for (Object item : (List<?>) items) {
            if (item == null) continue;
            Object itemTracking = Reflect.get(item, "trackingData");
            if (Reflect.get(itemTracking, "sponsoredTracking") != null) return true;
            if (isTrue(itemTracking, "hasSponsoredTracking")) return true;
            if (isSponsored(Reflect.get(item, "update"), depth + 1)) return true;
        }
        return false;
    }

    private static Object carouselOf(Object update) {
        Object carousel = Reflect.get(update, "carouselContent");
        if (carousel == null) carousel = Reflect.get(Reflect.get(update, "attachment"), "carouselContent");
        if (carousel == null) carousel = Reflect.get(Reflect.get(update, "leadGenFormContent"), "carouselContent");
        return carousel;
    }

    private static boolean hasComponent(Object update, String flag) {
        if (update == null) return false;
        if (isTrue(Reflect.get(update, "content"), flag)) return true;
        return isTrue(Reflect.get(Reflect.get(update, "attachment"), "content"), flag);
    }

    private static boolean isTrue(Object owner, String field) {
        Object value = Reflect.get(owner, field);
        return value instanceof Boolean && (Boolean) value;
    }

    private static String asString(Object value) {
        return value instanceof String ? (String) value : null;
    }
}
