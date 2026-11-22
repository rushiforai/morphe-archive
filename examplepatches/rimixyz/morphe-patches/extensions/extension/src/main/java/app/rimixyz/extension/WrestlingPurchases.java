package app.rimixyz.extension;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Locale;

/**
 * Synthetic purchase payloads injected into the Distriqt InAppBilling events.
 *
 * The extension dispatches a JSON string to ActionScript. The Distriqt Java
 * layer already verified real purchases (SHA1withRSA) before formatting the
 * payload; the formatted JSON itself is not verified again, so replacing it
 * here is enough to make Purchases_Distriqt.as see an owned SKU.
 *
 * Called from UnlockProPatch.kt:
 *   PlayBillingController$5.onSuccess -> getPurchasesComplete()
 *   PlayBillingController$4.onSuccess -> getPurchasesUpdated()
 */
@SuppressWarnings("unused")
public final class WrestlingPurchases {

    private static final String PACKAGE_NAME = "air.WRCareer";

    /**
     * Both SKUs are present in the ActionScript pool. The APK is the
     * Wrestling Revolution build (air.WRCareer), so wr_upgrade is the
     * important one; br_upgrade is included because the game can unlock both
     * careers and the catalog recognises it.
     */
    private static final String[] PRODUCT_IDS = {"wr_upgrade", "br_upgrade"};

    private static final long PURCHASE_TIME = 1730000000000L;

    /**
     * Non-empty, valid-base64 placeholder. The real RSA verification happens
     * in the Distriqt ANE before the event; if Purchases_Distriqt.as performs a
     * mere presence check on productSignature, this passes. If it re-verifies
     * the RSA signature, no value can pass without the private key.
     */
    private static final String SIGNATURE = "TW9ycGhlU2lnbmF0dXJl";

    private WrestlingPurchases() {
    }

    /** Payload for get:purchases:complete (normal query). */
    public static String getPurchasesComplete() {
        return build("transaction:purchased");
    }

    /** Payload for purchases:updated (restore / onPurchasesUpdated).
     *
     * Purchases_Distriqt.as treats STATE_RESTORED as a failure (FailPurchase(0)),
     * so this must report STATE_PURCHASED to reach ActivatePurchase().
     */
    public static String getPurchasesUpdated() {
        return build("transaction:purchased");
    }

    private static String build(String transactionState) {
        StringBuilder purchases = new StringBuilder();
        for (int i = 0; i < PRODUCT_IDS.length; i++) {
            if (i > 0) {
                purchases.append(',');
            }
            purchases.append(purchase(PRODUCT_IDS[i], transactionState, i));
        }
        return "{\"purchases\":[" + purchases + "],\"errorCode\":\"0\",\"message\":\"\"}";
    }

    private static String purchase(String productId, String transactionState, int index) {
        String orderId = "GPA.0000-0000-0000-" + String.format(Locale.US, "%05d", index);
        String token = "morphe-" + productId;
        String original = originalJson(productId, orderId, token);

        return "{"
                + "\"productId\":\"" + productId + "\","
                + "\"productIds\":[\"" + productId + "\"],"
                + "\"quantity\":1,"
                + "\"transactionTimestamp\":" + PURCHASE_TIME + ","
                + "\"transactionIdentifier\":\"" + token + "\","
                + "\"transactionState\":\"" + transactionState + "\","
                + "\"transactionReceipt\":\"" + orderId + "\","
                + "\"packageName\":\"" + PACKAGE_NAME + "\","
                + "\"developerPayload\":\"\","
                + "\"signature\":\"" + SIGNATURE + "\","
                + "\"originalMessage\":\"" + urlEncode(original) + "\","
                + "\"isAutoRenewing\":false"
                + "}";
    }

    /**
     * Minimal Play-Billing-shaped JSON. PlayBillingUtils.purchaseToObject()
     * URL-encodes this into originalMessage, so the shape mirrors what the
     * real extension produces.
     */
    private static String originalJson(String productId, String orderId, String token) {
        return "{"
                + "\"orderId\":\"" + orderId + "\","
                + "\"packageName\":\"" + PACKAGE_NAME + "\","
                + "\"productId\":\"" + productId + "\","
                + "\"productIds\":[\"" + productId + "\"],"
                + "\"purchaseTime\":" + PURCHASE_TIME + ","
                + "\"purchaseState\":0,"
                + "\"purchaseToken\":\"" + token + "\","
                + "\"acknowledged\":true,"
                + "\"autoRenewing\":false,"
                + "\"quantity\":1"
                + "}";
    }

    private static String urlEncode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }
}
