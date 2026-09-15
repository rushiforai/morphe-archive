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
                || hasCreatorCommissionDisclosure(item);
    }

    /**
     * TikTok builds the visible creator-commission label from this serialized anchor model.
     * Reading its stable JSON keys avoids depending on translated disclosure text or an
     * obfuscated renderer class.
     */
    static boolean hasCreatorCommissionDisclosure(Aweme item) {
        Object value = Reflect.required(item, "getAnchorsExtras", DISCLOSURE_HOOK_FAMILY);
        if (!(value instanceof String)) return false;
        String extras = ((String) value).trim();
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

    private static boolean nonBlankString(Object value) {
        return value instanceof String && !((String) value).trim().isEmpty();
    }
}
