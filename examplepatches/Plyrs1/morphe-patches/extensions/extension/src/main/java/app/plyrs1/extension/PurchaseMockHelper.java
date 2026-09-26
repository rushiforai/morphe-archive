package app.plyrs1.extension;

import android.util.Log;
import java.lang.reflect.Constructor;
import java.util.ArrayList;

/**
 * Provides mock in-app purchase responses using reflection.
 * This avoids requiring com.android.billingclient.api in the extension build.
 */
public final class PurchaseMockHelper {

    private static final String TAG = "PurchaseMock";
    
    // Product ID for lifetime premium (permanent watermark removal)
    public static final String MOCK_PRODUCT_ID = "onetime_purchase";

    /**
     * Build a mock Purchase list containing onetime_purchase entitlement.
     * Returns ArrayList of Purchase objects that will be
     * converted by S1/a.o() into Q2.z.purchases and sent to Dart.
     * 
     * Uses reflection to create Purchase(String json, String signature) instance
     * without requiring billingclient library in the extension.
     */
    public static ArrayList<Object> buildMockPurchases() {
        try {
            long now = System.currentTimeMillis();
            
            // Build a realistic-looking purchase JSON matching Google Play Billing format
            StringBuilder json = new StringBuilder();
            json.append("{\"productId\":\"" + MOCK_PRODUCT_ID + "\",");
            json.append("\"packageName\":\"com.pertaminiku\",");
            json.append("\"purchaseToken\":\"mock_token_" + System.nanoTime() + "\",");
            json.append("\"orderId\":null,");
            json.append("\"developerPayload\":\"\",");
            json.append("\"purchaseState\":0,");
            json.append("\"autoRenewing\":false,");
            json.append("\"acknowledged\":true,");
            json.append("\"purchaseTime\":" + now + ",");
            json.append("\"quantity\":1");
            json.append("}");
            
            Log.d(TAG, "Built mock purchase for: " + MOCK_PRODUCT_ID);
            
            // Use reflection to instantiate Purchase(String json, String signature)
            Class<?> purchaseClass = Class.forName("com.android.billingclient.api.Purchase");
            Constructor<?> constructor = purchaseClass.getConstructor(String.class, String.class);
            Object mockPurchase = constructor.newInstance(json.toString(), "MOCK_SIGNATURE");
            
            ArrayList<Object> list = new ArrayList<>();
            list.add(mockPurchase);
            
            return list;
            
        } catch (Exception e) {
            Log.e(TAG, "Failed to build mock purchase", e);
            return new ArrayList<>();
        }
    }
}
