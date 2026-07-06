package app.paresh.extension.trackit;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

@SuppressWarnings("unused")
public class EntitlementMapPatch {

    public static Map<String, Object> injectEntitlement(Map<String, Object> original) {
        HashMap<String, Object> result = new HashMap<>(original);

        String now = getCurrentDate();
        HashMap<String, Object> fakeEntitlement = new HashMap<>();
        fakeEntitlement.put("identifier", "ultimate");
        fakeEntitlement.put("isActive", true);
        fakeEntitlement.put("willRenew", true);
        fakeEntitlement.put("periodType", "NORMAL");
        fakeEntitlement.put("store", "PLAY_STORE");
        fakeEntitlement.put("productIdentifier", "trackit_ultimate_lifetime");
        fakeEntitlement.put("ownershipType", "PURCHASED");
        fakeEntitlement.put("verification", "NOT_REQUESTED");
        fakeEntitlement.put("latestPurchaseDate", now);
        fakeEntitlement.put("originalPurchaseDate", now);
        fakeEntitlement.put("expirationDate", null);
        fakeEntitlement.put("unsubscribeDetectedAt", null);
        fakeEntitlement.put("billingIssueDetectedAt", null);
        fakeEntitlement.put("isSandbox", false);
        fakeEntitlement.put("productPlanIdentifier", null);

        // Inject into 'all' sub-map
        Object allObj = result.get("all");
        HashMap<String, Object> allMap = allObj instanceof Map
                ? new HashMap<>((Map<String, Object>) allObj)
                : new HashMap<>();
        allMap.put("ultimate", fakeEntitlement);
        result.put("all", allMap);

        // Inject into 'active' sub-map
        Object activeObj = result.get("active");
        HashMap<String, Object> activeMap = activeObj instanceof Map
                ? new HashMap<>((Map<String, Object>) activeObj)
                : new HashMap<>();
        activeMap.put("ultimate", fakeEntitlement);
        result.put("active", activeMap);

        return result;
    }

    private static String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US);
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        return sdf.format(new Date());
    }
}
