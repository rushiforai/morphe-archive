package app.polishapps.extension.meteo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

/**
 * Builds RevenueCat CustomerInfo maps in exactly the shape the hybrid-common serializer emits
 * (keys, ISO-8601 UTC date strings, Long millis), so purchases_flutter's Dart parser accepts them.
 */
@SuppressWarnings("unused")
public final class MeteoPatch {

    /**
     * RevenueCat entitlement identifier. The app exposes its subscription as "Meteo Plus", but the
     * entitlement key it checks is {@code plus}; an entitlement named {@code premium} leaves the app
     * reporting the free tier.
     */
    private static final String ENTITLEMENT_ID = "plus";
    private static final String PRODUCT_ID = "premium_lifetime";
    private static final String VERIFICATION = "NOT_REQUESTED";

    private MeteoPatch() {
    }

    private static String iso(long millis) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
        f.setTimeZone(TimeZone.getTimeZone("UTC"));
        return f.format(new Date(millis));
    }

    /** Stable "purchase" time so values don't change on every call. */
    private static final long PURCHASE_MILLIS = 1700000000000L;

    private static Map<String, Object> buildPremiumEntitlement() {
        String purchased = iso(PURCHASE_MILLIS);
        Map<String, Object> e = new LinkedHashMap<>();
        e.put("identifier", ENTITLEMENT_ID);
        e.put("isActive", Boolean.TRUE);
        e.put("willRenew", Boolean.TRUE);
        e.put("periodType", "NORMAL");
        e.put("latestPurchaseDateMillis", PURCHASE_MILLIS);
        e.put("latestPurchaseDate", purchased);
        e.put("originalPurchaseDateMillis", PURCHASE_MILLIS);
        e.put("originalPurchaseDate", purchased);
        e.put("expirationDateMillis", null);
        e.put("expirationDate", null);
        e.put("store", "PLAY_STORE");
        e.put("productIdentifier", PRODUCT_ID);
        e.put("productPlanIdentifier", null);
        e.put("isSandbox", Boolean.FALSE);
        e.put("unsubscribeDetectedAt", null);
        e.put("unsubscribeDetectedAtMillis", null);
        e.put("billingIssueDetectedAt", null);
        e.put("billingIssueDetectedAtMillis", null);
        e.put("ownershipType", "PURCHASED");
        e.put("verification", VERIFICATION);
        return e;
    }

    @SuppressWarnings("unchecked")
    private static Map<String, Object> mutableCopy(Object o) {
        Map<String, Object> copy = new LinkedHashMap<>();
        if (o instanceof Map) copy.putAll((Map<String, Object>) o);
        return copy;
    }

    @SuppressWarnings("unchecked")
    private static ArrayList<Object> mutableList(Object o) {
        ArrayList<Object> list = new ArrayList<>();
        if (o instanceof java.util.Collection) list.addAll((java.util.Collection<Object>) o);
        return list;
    }

    /**
     * Adds the premium entitlement to a real serialized CustomerInfo. Every nested container is
     * copied first: the serializer may hand out immutable Kotlin maps/lists (e.g. emptyMap()).
     */
    public static Map<String, Object> injectPremium(Map<String, Object> map) {
        if (map == null) return null;
        try {
            Map<String, Object> out = mutableCopy(map);

            Map<String, Object> entitlements = mutableCopy(out.get("entitlements"));
            Map<String, Object> all = mutableCopy(entitlements.get("all"));
            Map<String, Object> active = mutableCopy(entitlements.get("active"));
            Map<String, Object> premium = buildPremiumEntitlement();
            all.put(ENTITLEMENT_ID, premium);
            active.put(ENTITLEMENT_ID, premium);
            entitlements.put("all", all);
            entitlements.put("active", active);
            if (entitlements.get("verification") == null) entitlements.put("verification", VERIFICATION);
            out.put("entitlements", entitlements);

            ArrayList<Object> purchased = mutableList(out.get("allPurchasedProductIdentifiers"));
            if (!purchased.contains(PRODUCT_ID)) purchased.add(PRODUCT_ID);
            out.put("allPurchasedProductIdentifiers", purchased);

            Map<String, Object> purchaseDates = mutableCopy(out.get("allPurchaseDates"));
            purchaseDates.put(PRODUCT_ID, iso(PURCHASE_MILLIS));
            out.put("allPurchaseDates", purchaseDates);
            Map<String, Object> purchaseMillis = mutableCopy(out.get("allPurchaseDatesMillis"));
            purchaseMillis.put(PRODUCT_ID, PURCHASE_MILLIS);
            out.put("allPurchaseDatesMillis", purchaseMillis);
            return out;
        } catch (Throwable t) {
            return map;
        }
    }

    /**
     * A complete CustomerInfo map with an active premium entitlement, returned directly from the
     * getCustomerInfo channel handler (the RC backend rejects re-signed APKs).
     */
    public static Map<String, Object> buildPremiumResponse() {
        long now = System.currentTimeMillis();
        String nowIso = iso(now);

        Map<String, Object> entitlements = new LinkedHashMap<>();
        entitlements.put("all", new LinkedHashMap<String, Object>());
        entitlements.put("active", new LinkedHashMap<String, Object>());
        entitlements.put("verification", VERIFICATION);

        Map<String, Object> map = new LinkedHashMap<>();
        map.put("entitlements", entitlements);
        map.put("activeSubscriptions", new ArrayList<>());
        map.put("allPurchasedProductIdentifiers", new ArrayList<>());
        map.put("latestExpirationDate", null);
        map.put("latestExpirationDateMillis", null);
        map.put("firstSeen", iso(PURCHASE_MILLIS));
        map.put("firstSeenMillis", PURCHASE_MILLIS);
        map.put("originalAppUserId", "$RCAnonymousID:patched");
        map.put("requestDate", nowIso);
        map.put("requestDateMillis", now);
        map.put("allExpirationDates", new LinkedHashMap<String, Object>());
        map.put("allExpirationDatesMillis", new LinkedHashMap<String, Object>());
        map.put("allPurchaseDates", new LinkedHashMap<String, Object>());
        map.put("allPurchaseDatesMillis", new LinkedHashMap<String, Object>());
        map.put("originalApplicationVersion", null);
        map.put("managementURL", null);
        map.put("originalPurchaseDate", iso(PURCHASE_MILLIS));
        map.put("originalPurchaseDateMillis", PURCHASE_MILLIS);
        map.put("nonSubscriptionTransactions", new ArrayList<>());
        map.put("subscriptionsByProductIdentifier", new LinkedHashMap<String, Object>());
        return injectPremium(map);
    }
}
