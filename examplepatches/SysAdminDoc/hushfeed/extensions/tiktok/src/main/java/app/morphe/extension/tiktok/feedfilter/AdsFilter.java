/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/feedfilter/AdsFilter.java
 */
package app.morphe.extension.tiktok.feedfilter;

import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import org.json.JSONException;
import org.json.JSONObject;

public class AdsFilter implements IFilter {
    private static final String DISCLOSURE_HOOK_FAMILY = "feed ad disclosures";
    private static final String PANEL_DISCLOSURE = "panel_top_disclosure_label";

    @Override
    public boolean getEnabled() {
        return Settings.REMOVE_ADS.get();
    }

    @Override
    public boolean getFiltered(Aweme item) {
        return item.isAd()
                || item.isSoftAd()
                || item.getAwemeRawAd() != null
                || item.isWithPromotionalMusic()
                || hasCreatorCommissionDisclosure(item)
                || ContentMarkerFilters.hasPaidPartnershipMarker(item);
    }

    /**
     * TikTok builds the visible creator-commission label from this serialized anchor model.
     * Reading its stable JSON keys avoids depending on translated disclosure text or an
     * obfuscated renderer class.
     */
    static boolean hasCreatorCommissionDisclosure(Aweme item) {
        if (hasLocalAllianceDisclosure(item)) return true;
        String extras = anchorsExtras(item);
        if (extras == null) return false;
        if (extras.isEmpty() || !extras.contains("\"" + PANEL_DISCLOSURE + "\"")) return false;

        try {
            JSONObject disclosure = new JSONObject(extras).optJSONObject(PANEL_DISCLOSURE);
            return disclosure != null
                    && (nonBlankString(disclosure.opt("display_text"))
                    || nonBlankString(disclosure.opt("truncatable_text")));
        } catch (JSONException ignored) {
            // Anchor metadata comes from the network. A malformed item is ordinary feed content,
            // not evidence that the hook contract changed.
            return false;
        }
    }

    /**
     * The location-affiliate label uses ContentModel, not shopping's anchorsExtras.
     * PoiCreatorBottomLabelTriggerAssem reads this same named model chain before rendering.
     * showBottomLabel requires allianceItemLabelType == 1 and nonempty label text; a location
     * or an incomplete alliance object alone is not ad evidence. Read at list delivery so
     * the video is removed before the renderer runs, independently of locale or its UI gate.
     */
    private static boolean hasLocalAllianceDisclosure(Aweme item) {
        Object content = Reflect.required(item, "getContentModel", DISCLOSURE_HOOK_FAMILY);
        Object business = Reflect.requiredField(content, "standardBusinessModel", DISCLOSURE_HOOK_FAMILY);
        Object alliance = Reflect.required(business, "getLocalAllianceInfo", DISCLOSURE_HOOK_FAMILY);
        return Boolean.TRUE.equals(Reflect.required(alliance, "showBottomLabel", DISCLOSURE_HOOK_FAMILY));
    }

    /**
     * A cheap signature for ad metadata TikTok can fill after the first delivery callback.
     * FeedItemsFilter uses it to distinguish a true duplicate list from the same Aweme objects
     * after a cache or hydration pass added disclosure data.
     */
    static int evidenceFingerprint(Aweme item) {
        if (item == null) return 0;
        int result = 1;
        try {
            result = 31 * result + (item.isAd() ? 1 : 0);
            result = 31 * result + (item.isSoftAd() ? 1 : 0);
            Object rawAd = item.getAwemeRawAd();
            result = 31 * result + (rawAd == null ? 0 : System.identityHashCode(rawAd));
            result = 31 * result + (item.isWithPromotionalMusic() ? 1 : 0);
        } catch (Throwable ignored) {
            // A host getter that fails must not stop a feed delivery. The serialized disclosure
            // and branded-content checks below can still invalidate the duplicate-list cache.
        }
        String extras = anchorsExtras(item);
        result = 31 * result + (extras == null ? 0 : extras.hashCode());
        result = 31 * result + (hasLocalAllianceDisclosure(item) ? 1 : 0);
        result = 31 * result + (ContentMarkerFilters.hasPaidPartnershipMarker(item) ? 1 : 0);
        return result;
    }

    private static String anchorsExtras(Aweme item) {
        Object value = Reflect.required(item, "getAnchorsExtras", DISCLOSURE_HOOK_FAMILY);
        if (!(value instanceof String)) return null;
        String extras = ((String) value).trim();
        return extras.isEmpty() ? null : extras;
    }

    private static boolean nonBlankString(Object value) {
        return value instanceof String && !((String) value).trim().isEmpty();
    }
}
