package semicoloncolonel.mobilestream.extension.moviebase;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Tells which Premium screens Moviebase opens on its own. Those carry a
 * purchase source of app launch or onboarding. Screens the user opens, from
 * Settings, a banner, or a list limit, carry other sources and still open.
 */
@SuppressWarnings("unused")
public final class UpsellFilter {
    private static final Set<String> AUTOMATIC = new HashSet<>(Arrays.asList(
            "AppLaunch", "Onboarding", "OnboardingLegacy", "DefaultOnboarding"));

    private UpsellFilter() {
    }

    /** Injection point: the Premium screen opener, with its PurchaseSource. */
    public static boolean isAutomatic(Object source) {
        return source instanceof Enum && AUTOMATIC.contains(((Enum<?>) source).name());
    }
}
