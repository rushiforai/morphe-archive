package app.sledgesune.extension.syncme;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@SuppressWarnings("unused")
public final class HideUpgradePromptsPatch {

    /**
     * Call-history banners that advertise a purchase.
     * Matched by enum constant name, which is not obfuscated.
     * DEFAULT_DIALER, CALL_THEMES and NOTIFICATION_LISTENER are setup hints and are kept.
     */
    private static final Set<String> UPSELL_BANNERS = new HashSet<>(Arrays.asList(
            "UPGRADE_PRO",
            "REMOVE_ADS",
            "FREE_GIFT",
            "ENABLE_SMS_FRAUD"
    ));

    /**
     * Injection point. Filters the list returned by PromoBannerUtil.getFilteredPromoBanners().
     */
    public static List<Object> filterPromoBanners(List<Object> banners) {
        if (banners == null) return null;

        List<Object> filtered = new ArrayList<>(banners.size());
        for (Object banner : banners) {
            if (banner instanceof Enum && UPSELL_BANNERS.contains(((Enum<?>) banner).name())) {
                continue;
            }
            filtered.add(banner);
        }
        return filtered;
    }
}
