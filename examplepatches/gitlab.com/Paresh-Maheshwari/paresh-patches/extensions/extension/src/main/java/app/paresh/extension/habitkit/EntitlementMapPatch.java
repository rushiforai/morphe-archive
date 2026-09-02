package app.paresh.extension.habitkit;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

/**
 * Injects a fake active RevenueCat entitlement into the map that purchases_flutter
 * sends to the Flutter layer, so free users are treated as premium.
 *
 * The exact entitlement identifier HabitKit checks is case-ambiguous in the AOT
 * snapshot, so we inject under every likely id and match each entry's "identifier"
 * field to its key to keep EntitlementInfo.fromJson valid.
 */
@SuppressWarnings({"unused", "unchecked"})
public class EntitlementMapPatch {

    private static final String[] ENTITLEMENT_IDS = {
            "pro", "Pro", "premium", "Premium", "plus", "Plus", "rc_premium"
    };

    public static Map<String, Object> injectEntitlement(Map<String, Object> original) {
        HashMap<String, Object> result = new HashMap<>(original);

        HashMap<String, Object> allMap = new HashMap<>();
        Object allObj = result.get("all");
        if (allObj instanceof Map) {
            allMap.putAll((Map<String, Object>) allObj);
        }

        HashMap<String, Object> activeMap = new HashMap<>();
        Object activeObj = result.get("active");
        if (activeObj instanceof Map) {
            activeMap.putAll((Map<String, Object>) activeObj);
        }

        for (String id : ENTITLEMENT_IDS) {
            Map<String, Object> ent = buildEntitlement(id);
            allMap.put(id, ent);
            activeMap.put(id, ent);
        }

        result.put("all", allMap);
        result.put("active", activeMap);
        return result;
    }

    private static Map<String, Object> buildEntitlement(String identifier) {
        String now = getCurrentDate();
        long nowMillis = new Date().getTime();

        HashMap<String, Object> e = new HashMap<>();
        e.put("identifier", identifier);
        e.put("isActive", true);
        e.put("willRenew", false);
        e.put("periodType", "NORMAL");
        e.put("store", "PLAY_STORE");
        e.put("productIdentifier", "rc_lifetime");
        e.put("productPlanIdentifier", null);
        e.put("ownershipType", "PURCHASED");
        e.put("verification", "NOT_REQUESTED");
        e.put("latestPurchaseDate", now);
        e.put("latestPurchaseDateMillis", nowMillis);
        e.put("originalPurchaseDate", now);
        e.put("originalPurchaseDateMillis", nowMillis);
        e.put("expirationDate", null);
        e.put("expirationDateMillis", null);
        e.put("unsubscribeDetectedAt", null);
        e.put("unsubscribeDetectedAtMillis", null);
        e.put("billingIssueDetectedAt", null);
        e.put("billingIssueDetectedAtMillis", null);
        e.put("isSandbox", false);
        return e;
    }

    private static String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        return sdf.format(new Date());
    }
}
