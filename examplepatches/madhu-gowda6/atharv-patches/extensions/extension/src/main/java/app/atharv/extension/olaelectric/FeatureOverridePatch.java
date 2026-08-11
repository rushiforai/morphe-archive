package app.atharv.extension.olaelectric;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Forces specific server-driven onboarding feature flags to always report as available,
 * regardless of what the backend "onboarding-by-profile-id" API response says.
 *
 * <p>Injected into domain.domainModels.onBoarding.OnBoardingFeaturesEntity#getStatus().
 */
@SuppressWarnings("unused")
public final class FeatureOverridePatch {

    // Matches domain.domainModels.onBoarding.FeatureType#getStatus() key strings.
    private static final Set<String> FORCE_ENABLED_FEATURES = new HashSet<>();

    static {
        FORCE_ENABLED_FEATURES.add("megaphone");
        FORCE_ENABLED_FEATURES.add("tamper_and_fall_detection");
        FORCE_ENABLED_FEATURES.add("is_krutrim_assistant_enabled");
        FORCE_ENABLED_FEATURES.add("kruti_enabled");
    }

    private FeatureOverridePatch() {
    }

    /**
     * @param featureType OnBoardingFeaturesEntity#getFeatureType(), the raw feature key from
     *                     the server response (same value as FeatureType#getStatus()).
     * @return true if this feature's visibility should be forced to SHOW.
     */
    public static boolean shouldForceEnable(String featureType) {
        return featureType != null && FORCE_ENABLED_FEATURES.contains(featureType.toLowerCase(Locale.ROOT));
    }
}
