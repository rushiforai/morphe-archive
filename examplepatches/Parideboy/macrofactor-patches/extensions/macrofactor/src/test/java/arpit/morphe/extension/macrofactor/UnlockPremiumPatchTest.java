package arpit.morphe.extension.macrofactor;

import org.json.JSONObject;
import org.junit.jupiter.api.Test;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Plain JVM tests for the subscriber-JSON rewrite behind the "Unlock Premium (Root)" hook.
 * They call {@link UnlockPremiumPatch#rewriteCustomerInfo} directly, so no Android class is
 * touched.
 */
class UnlockPremiumPatchTest {

    private static final String PRODUCT_ID = "com.sbs.diet.1y0599.2w0";

    private static final String[] ENTITLEMENTS = {"subscription", "subscription_workouts"};

    /** The SDK reads these dates with a `Z`-suffixed pattern, so they carry no offset of their own. */
    private static Instant instantOf(String value) {
        return LocalDateTime.parse(value, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'"))
                .toInstant(ZoneOffset.UTC);
    }

    private static JSONObject subscriberOf(String json) throws Exception {
        JSONObject root = new JSONObject(json);
        UnlockPremiumPatch.rewriteCustomerInfo(root, PRODUCT_ID, ENTITLEMENTS);
        return root.getJSONObject("subscriber");
    }

    @Test
    void buildsSubscriptionsAndEntitlementsWithMatchingProductIdentifier() throws Exception {
        JSONObject subscriber = subscriberOf("{\"subscriber\":{\"original_app_user_id\":\"u1\"}}");

        assertTrue(subscriber.getJSONObject("subscriptions").has(PRODUCT_ID));

        JSONObject entitlements = subscriber.getJSONObject("entitlements");
        for (String entitlementId : ENTITLEMENTS) {
            assertEquals(
                    PRODUCT_ID,
                    entitlements.getJSONObject(entitlementId).getString("product_identifier"));
        }
    }

    @Test
    void preservesPreExistingSubscriptionsAndEntitlements() throws Exception {
        JSONObject subscriber = subscriberOf("{\"subscriber\":{"
                + "\"subscriptions\":{\"real.product\":{\"store\":\"play_store\"}},"
                + "\"entitlements\":{\"real_entitlement\":{\"product_identifier\":\"real.product\"}}"
                + "}}");

        assertEquals(
                "play_store",
                subscriber.getJSONObject("subscriptions").getJSONObject("real.product").getString("store"));
        assertEquals(
                "real.product",
                subscriber.getJSONObject("entitlements")
                        .getJSONObject("real_entitlement")
                        .getString("product_identifier"));
        assertTrue(subscriber.getJSONObject("subscriptions").has(PRODUCT_ID));
    }

    @Test
    void subscriberDatesArePresentAndIso8601() throws Exception {
        JSONObject subscriber = subscriberOf("{\"subscriber\":{\"original_app_user_id\":\"u2\"}}");

        for (String key : new String[]{"first_seen", "original_purchase_date"}) {
            String value = subscriber.getString(key);
            assertNotNull(instantOf(value), key + " is not ISO8601 UTC: " + value);
        }
    }

    @Test
    void missingSubscriberIsLeftAlone() throws Exception {
        JSONObject root = new JSONObject("{\"other\":1}");

        UnlockPremiumPatch.rewriteCustomerInfo(root, PRODUCT_ID, ENTITLEMENTS);
        UnlockPremiumPatch.rewriteCustomerInfo(null, PRODUCT_ID, ENTITLEMENTS);

        assertTrue(!root.has("subscriber"));
    }

    @Test
    void expiresDateIsInTheFuture() throws Exception {
        JSONObject subscriber = subscriberOf("{\"subscriber\":{\"original_app_user_id\":\"u3\"}}");

        Instant expires = instantOf(
                subscriber.getJSONObject("subscriptions").getJSONObject(PRODUCT_ID)
                        .getString("expires_date"));

        assertTrue(expires.isAfter(Instant.now()), "expires_date is not in the future: " + expires);
    }
}
