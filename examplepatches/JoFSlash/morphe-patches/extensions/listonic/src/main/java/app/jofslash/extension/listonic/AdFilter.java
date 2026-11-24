package app.jofslash.extension.listonic;

import java.util.ArrayList;
import java.util.List;

/**
 * Hide ads: every ad slot in Listonic reads the list of ad types (networks) to try from its
 * AdUnitConfig.getAdStack(). Only rewarded ads, which you start yourself to earn Broccoli coins,
 * are left in it; every other slot gets an empty list and loads nothing.
 */
@SuppressWarnings("unused")
public final class AdFilter {
    private AdFilter() {
    }

    /** The ad types of [adStack] (AdType enum constants) that are rewarded ads. */
    public static List<Object> rewardedOnly(List<?> adStack) {
        List<Object> kept = new ArrayList<>();
        if (adStack == null) return kept;
        for (Object adType : adStack) {
            // AdType constants are named <NETWORK>_<FORMAT>, e.g. ADMOB_REWARDED, APPLOVIN_REWARDED.
            if (adType instanceof Enum && ((Enum<?>) adType).name().endsWith("_REWARDED")) {
                kept.add(adType);
            }
        }
        return kept;
    }
}
