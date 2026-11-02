package app.morphe.extension.facebook.marketplace;

import java.util.HashMap;
import java.util.Map;

/**
 * Forces OFF the MobileConfig flags that tell Marketplace's listing page (PDP) it can render end-to-end /
 * dynamic ad modules, so the ad blocks are not requested or drawn (no view scanning; Facebook 582.0.0.50.54).
 * Same hook points and flag format as {@link GroupSuggestions}: names/specifiers are from assets/rn_params.txt.
 */
@SuppressWarnings("unused")
public final class PdpAdFlags {
    private static final long DEFAULT_TRUE_MARKER = 0x2000000000000000L;
    private static final Map<String, Boolean> BY_NAME = new HashMap<>();
    private static final Map<Long, Boolean> BY_SPEC = new HashMap<>();

    private static void add(String name, long spec) {
        BY_NAME.put(name, Boolean.FALSE);
        BY_SPEC.put(spec & ~DEFAULT_TRUE_MARKER, Boolean.FALSE);
    }

    static {
        add("fb_marketplace_ads:enable_marketplace_pdp_e2e_ads_rendering_capability", 0x8100b0046908cfL);
        add("fb_marketplace_ads:enable_marketplace_pdp_e2e_carousel_ads", 0x8100b0039f0889L);
        add("fb_marketplace_ads:should_use_dynamic_ad_modules", 0x8100b001ab07ddL);
        // The listing page's two ad modules: "personalized" (boosted listings) and "contextual" (instant-intent /
        // relevant ads). Their dedup flag (dedup_between_pdp_contextual_and_personalized_module_v2) shows they pair.
        add("marketplace_boosted_listing:mp_pdp_personalized_bl_ads_enabled", 0x1010ae8000b59e7L);
        add("mp_ecomm_fundamentals_pdp_rewrite:should_show_boosted_listing_ads", 0x8110b8000d5a6dL);
        add("fb_marketplace_ads:should_show_instant_intent_ads", 0x8100b0008e07b0L);
        add("fb_marketplace_ads:show_instant_intent_ads", 0x208100b0035c0869L);
        add("fb_marketplace_ads:should_show_instant_intent_ads_photo_view", 0x8100b0009307b1L);
        add("fb_marketplace_ads:fetch_more_ads_for_pdp_deduped_module", 0x8100b002e30836L);
    }

    private PdpAdFlags() {
    }

    public static boolean filterBoolByName(String name, boolean original) {
        try {
            return name != null && BY_NAME.containsKey(name) ? false : original;
        } catch (Throwable t) {
            return original;
        }
    }

    public static boolean filterBoolBySpec(long spec, boolean original) {
        try {
            return BY_SPEC.containsKey(spec & ~DEFAULT_TRUE_MARKER) ? false : original;
        } catch (Throwable t) {
            return original;
        }
    }
}
