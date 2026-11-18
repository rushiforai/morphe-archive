package app.medium.extension;

import android.util.Log;

public class PaywallBypassHelper {
    private static final String TAG = "PaywallBypassHelper";
    private static final String FREEDIUM_PREFIX = "https://freedium.cfd/";

    /**
     * Called when Medium tries to load an article URL or API endpoint.
     * Rewrites paywalled URLs to Freedium proxy URL.
     */
    public static String getBypassedUrl(String originalUrl) {
        if (originalUrl == null) return originalUrl;

        // Check if URL is a Medium article
        if (originalUrl.contains("medium.com") || originalUrl.contains("towardsdatascience.com")) {
            if (!originalUrl.startsWith(FREEDIUM_PREFIX)) {
                Log.d(TAG, "Redirecting paywalled URL: " + originalUrl + " -> " + FREEDIUM_PREFIX + originalUrl);
                return FREEDIUM_PREFIX + originalUrl;
            }
        }
        return originalUrl;
    }

    /**
     * Called by hooked method to determine if paywall should be disabled.
     */
    public static boolean isPaywallEnabled() {
        return false; // Force unlock paywalled articles
    }

    /**
     * Hook for Medium GraphQL / REST article response `isLocked` property.
     */
    public static boolean overrideIsLocked(boolean originalIsLocked) {
        return false;
    }
}