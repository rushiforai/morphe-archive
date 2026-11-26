package arpit.morphe.extension.macrofactor.diet;

import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

import app.morphe.extension.shared.Logger;

/**
 * Runtime hook injected by the MacroFactor ({@code com.sbs.diet}) "Unlock Premium (Root)"
 * patch into RevenueCat's {@code CustomerInfoFactory.buildCustomerInfo} overload.
 *
 * <p>Rewrites the subscriber JSON so the SDK parses an active premium entitlement. The
 * existing {@code subscriptions}/{@code entitlements} maps are mutated rather than
 * replaced, so any products the backend really returns are preserved.
 *
 * <p>Context-free on purpose: it may run before the activity hook sets the context.
 */
@SuppressWarnings("unused")
public class UnlockPremiumPatch {

    /**
     * MacroFactor's yearly subscription product id. It is a RevenueCat dashboard id, so it
     * does not appear in the app's binaries; the value is the one the upstream MacroFactor
     * patch has been shipping against.
     */
    private static final String PRODUCT_ID = "com.sbs.diet.1y0599.2w0";

    /**
     * Entitlement ids to activate. {@code subscription} is the id the app gates on;
     * {@code subscription_workouts} is also present in this binary (shared MacroFactor
     * core code) and is included so either lookup resolves.
     */
    private static final String[] ENTITLEMENT_IDS = {
            "subscription",
            "subscription_workouts"
    };

    private static final String DATE_PATTERN = "yyyy-MM-dd'T'HH:mm:ss'Z'";

    private static final TimeZone UTC = TimeZone.getTimeZone("UTC");

    /**
     * Injection point. Called with the raw parsed customer-info body before the SDK
     * validates or reads it.
     *
     * @param json the {@code subscriber}-containing customer info JSON, may be null
     *             (the SDK's own null check runs after this hook).
     */
    public static void updateCustomerInfo(JSONObject json) {
        if (json == null) {
            return;
        }

        try {
            JSONObject subscriber = json.optJSONObject("subscriber");
            if (subscriber == null) {
                return;
            }

            String pastDate = pastDateFromSeed(subscriber.optString("original_app_user_id", ""));
            String futureDate = oneYearFuture();

            // Subscriber-level dates. `first_seen` is read with getString() by the SDK and
            // must always be present and ISO8601-parseable.
            subscriber.put("first_seen", pastDate);
            subscriber.put("original_purchase_date", pastDate);

            // Complete product object. `original_purchase_date`, `is_sandbox` and `store`
            // are required by EntitlementInfoFactoriesKt.buildEntitlementInfo; a missing
            // key makes the SDK throw while parsing.
            JSONObject product = new JSONObject();
            product.put("original_purchase_date", pastDate);
            product.put("purchase_date", pastDate);
            product.put("expires_date", futureDate);
            product.put("is_sandbox", false);
            product.put("period_type", "normal");
            product.put("ownership_type", "PURCHASED");
            product.put("store", "app_store");
            product.put("refunded_at", JSONObject.NULL);
            product.put("unsubscribe_detected_at", JSONObject.NULL);
            product.put("grace_period_expires_date", JSONObject.NULL);
            product.put("billing_issues_detected_at", JSONObject.NULL);
            product.put("auto_resume_date", JSONObject.NULL);

            JSONObject subscriptions = subscriber.optJSONObject("subscriptions");
            if (subscriptions == null) {
                subscriptions = new JSONObject();
                subscriber.put("subscriptions", subscriptions);
            }
            subscriptions.put(PRODUCT_ID, product);

            JSONObject entitlements = subscriber.optJSONObject("entitlements");
            if (entitlements == null) {
                entitlements = new JSONObject();
                subscriber.put("entitlements", entitlements);
            }
            for (String entitlementId : ENTITLEMENT_IDS) {
                JSONObject entitlement = new JSONObject();
                // `product_identifier` must match a key in `subscriptions` or the SDK
                // silently drops the entitlement; `purchase_date` is required.
                entitlement.put("product_identifier", PRODUCT_ID);
                entitlement.put("purchase_date", pastDate);
                entitlement.put("expires_date", futureDate);
                entitlement.put("grace_period_expires_date", JSONObject.NULL);
                entitlements.put(entitlementId, entitlement);
            }
        } catch (Exception ex) {
            // This hook runs before the SDK's own validation; never break the parse.
            Logger.printException(
                    () -> "Failed to unlock MacroFactor premium", ex);
        }
    }

    private static String oneYearFuture() {
        Calendar calendar = Calendar.getInstance(UTC, Locale.US);
        calendar.add(Calendar.YEAR, 1);
        return format(calendar.getTime());
    }

    /**
     * Deterministic past date in 2025 seeded from the user id, so the fake purchase date
     * stays stable across launches for a given install.
     */
    private static String pastDateFromSeed(String seed) {
        Calendar calendar = Calendar.getInstance(UTC, Locale.US);
        calendar.set(Calendar.YEAR, 2025);
        calendar.set(Calendar.MONTH, Calendar.JANUARY);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.add(Calendar.DAY_OF_YEAR, Math.floorMod(seed.hashCode(), 365));
        return format(calendar.getTime());
    }

    private static String format(Date date) {
        SimpleDateFormat format = new SimpleDateFormat(DATE_PATTERN, Locale.US);
        format.setTimeZone(UTC);
        return format.format(date);
    }
}
