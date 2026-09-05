package app.supreme.extension;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

import okhttp3.OkHttpClient;

/**
 * Fake premium state for Reclub: RevenueCat bridge maps and backend entitlements API.
 */
@SuppressWarnings("unused")
public final class UnlockPremiumHelper {

    private UnlockPremiumHelper() {
    }

    public static OkHttpClient.Builder addEntitlementsInterceptor(OkHttpClient.Builder builder) {
        return builder.addInterceptor(new EntitlementsInterceptor());
    }

    /**
     * Wraps clients returned by a custom {@code OkHttpClientFactory} that bypasses
     * {@code createClientBuilder()}.
     */
    public static OkHttpClient wrapOkHttpClient(OkHttpClient client) {
        if (client == null) {
            return null;
        }
        return client.newBuilder()
                .addInterceptor(new EntitlementsInterceptor())
                .build();
    }

    /**
     * Flips the Reclub account payload to a premium supporter.
     *
     * The live {@code /user/sync} response carries {@code "isPremium":false} and an
     * empty {@code "entitlements":[]} array; both gate Supporter features.
     */
    public static String grantPremium(String body) {
        if (body == null || body.isEmpty()) {
            return body;
        }

        String modified = body.replace("\"isPremium\":false", "\"isPremium\":true");
        modified = modified.replace("\"isPremium\":null", "\"isPremium\":true");
        modified = modified.replace("\"entitlements\":[]", "\"entitlements\":[\"PREMIUM_SUPPORTER\"]");
        return modified;
    }

    public static Map<String, Object> fakeEntitlementsMap() {
        Map<String, Object> byId = new HashMap<>();
        for (String id : new String[]{
                "PREMIUM_SUPPORTER",
                "premium_supporter",
                "premium",
                "supporter",
                "reclub_premium",
                "Reclub Premium",
        }) {
            byId.put(id, fakeEntitlement(id));
        }

        Map<String, Object> result = new HashMap<>();
        result.put("all", byId);
        result.put("active", byId);
        result.put("verification", "NOT_REQUESTED");
        return result;
    }

    public static Map<String, Object> fakeCustomerInfoMap() {
        Map<String, Object> entitlements = fakeEntitlementsMap();

        Map<String, Object> result = new HashMap<>();
        result.put("entitlements", entitlements);
        result.put("activeSubscriptions", java.util.Collections.singletonList("reclub_premium"));
        result.put("allPurchasedProductIdentifiers", java.util.Collections.singletonList("reclub_premium"));
        result.put("latestExpirationDate", null);
        result.put("latestExpirationDateMillis", null);
        result.put("firstSeen", "2020-01-01T00:00:00Z");
        result.put("firstSeenMillis", 1577836800000L);
        result.put("originalAppUserId", "patched-user");
        result.put("requestDate", "2020-01-01T00:00:00Z");
        result.put("requestDateMillis", 1577836800000L);
        result.put("allExpirationDates", new HashMap<String, Object>());
        result.put("allExpirationDatesMillis", new HashMap<String, Object>());
        result.put("allPurchaseDates", new HashMap<String, Object>());
        result.put("allPurchaseDatesMillis", new HashMap<String, Object>());
        result.put("managementURL", null);
        result.put("originalPurchaseDate", "2020-01-01T00:00:00Z");
        result.put("originalPurchaseDateMillis", 1577836800000L);
        result.put("nonSubscriptionTransactions", java.util.Collections.emptyList());
        result.put("subscriptionsByProductIdentifier", new HashMap<String, Object>());
        return result;
    }

    public static Map<String, Object> fakeEntitlementMap(String identifier) {
        return fakeEntitlement(identifier);
    }

    private static Map<String, Object> fakeEntitlement(String identifier) {
        long now = System.currentTimeMillis();
        String iso = "2099-12-31T23:59:59Z";

        Map<String, Object> map = new HashMap<>();
        map.put("identifier", identifier);
        map.put("EntitlementIdentifier", identifier.toUpperCase(Locale.US));
        map.put("isActive", true);
        map.put("willRenew", true);
        map.put("periodType", "NORMAL");
        map.put("latestPurchaseDateMillis", now);
        map.put("latestPurchaseDate", iso);
        map.put("originalPurchaseDateMillis", now);
        map.put("originalPurchaseDate", iso);
        map.put("expirationDateMillis", null);
        map.put("expirationDate", null);
        map.put("store", "PLAY_STORE");
        map.put("productIdentifier", "reclub_premium");
        map.put("productPlanIdentifier", null);
        map.put("isSandbox", false);
        map.put("unsubscribeDetectedAt", null);
        map.put("unsubscribeDetectedAtMillis", null);
        map.put("billingIssueDetectedAt", null);
        map.put("billingIssueDetectedAtMillis", null);
        map.put("ownershipType", "PURCHASED");
        map.put("verification", "NOT_REQUESTED");
        return map;
    }
}
