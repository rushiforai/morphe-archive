package app.template.extension.smartwod;

import android.util.Log;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;

/**
 * Replaces react-native-iap's {@code RNIapModule.getAvailableItemsByType(type, promise)}.
 * SmartWOD's JS decides premium from the owned purchases this method resolves (it only reads
 * each entry's {@code productId}), and revokes premium whenever the product is missing, so the
 * owned purchases are reported on every call without touching Play Billing.
 */
@SuppressWarnings("unused")
public final class EnablePremiumPatch {
    private static final String TAG = "Morphe-SmartWOD";

    private static final String PACKAGE_NAME = "net.smartwod.timer";

    /** Lifetime premium (counts as Premium+), and the ad-free in-app product. */
    private static final String[] OWNED_PRODUCTS = {
            "net.smartwod.timer.premium.lifetime",
            "inapp.adfree",
    };

    /** Purchase.PurchaseState.PURCHASED (the originalJson uses 0 for the same state). */
    private static final int PURCHASE_STATE_PURCHASED = 1;

    private EnablePremiumPatch() {
    }

    /**
     * Injection point: start of {@code getAvailableItemsByType}. Resolves an empty list for
     * subscriptions and the owned one-time products otherwise. Never throws.
     */
    public static void resolve(String type, Promise promise) {
        if (promise == null) return;
        try {
            WritableArray items = Arguments.createArray();
            if (!"subs".equals(type)) {
                long now = System.currentTimeMillis();
                for (String productId : OWNED_PRODUCTS) {
                    items.pushMap(purchase(productId, now));
                }
            }
            promise.resolve(items);
        } catch (Throwable t) {
            Log.w(TAG, "could not build purchases", t);
            try {
                promise.resolve(Arguments.createArray());
            } catch (Throwable ignored) {
                // Promise already settled.
            }
        }
    }

    /** Same keys and value types that RNIapModule puts for a Purchase of type "inapp". */
    private static WritableMap purchase(String productId, long purchaseTime) {
        String orderId = "GPA.0000-0000-0000-" + Math.abs(productId.hashCode() % 100000);
        String purchaseToken = "morphe." + productId;

        WritableMap map = Arguments.createMap();
        map.putString("productId", productId);

        WritableArray productIds = Arguments.createArray();
        productIds.pushString(productId);
        map.putArray("productIds", productIds);

        map.putString("transactionId", orderId);
        map.putDouble("transactionDate", (double) purchaseTime);
        map.putString("transactionReceipt", "{\"orderId\":\"" + orderId + "\","
                + "\"packageName\":\"" + PACKAGE_NAME + "\","
                + "\"productId\":\"" + productId + "\","
                + "\"purchaseTime\":" + purchaseTime + ","
                + "\"purchaseState\":0,"
                + "\"purchaseToken\":\"" + purchaseToken + "\","
                + "\"quantity\":1,"
                + "\"acknowledged\":true}");
        map.putString("orderId", orderId);
        map.putString("purchaseToken", purchaseToken);
        map.putString("developerPayloadAndroid", "");
        map.putString("signatureAndroid", "morphe");
        map.putInt("purchaseStateAndroid", PURCHASE_STATE_PURCHASED);
        // true keeps the JS from calling finishTransaction -> acknowledgePurchase.
        map.putBoolean("isAcknowledgedAndroid", true);
        map.putString("packageNameAndroid", PACKAGE_NAME);
        map.putNull("obfuscatedAccountIdAndroid");
        map.putNull("obfuscatedProfileIdAndroid");
        // autoRenewingAndroid is only set for "subs" purchases, so it is omitted here.
        return map;
    }
}
