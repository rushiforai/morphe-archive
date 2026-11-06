package app.template.extension.gamesinone;

import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.Purchase;
import com.android.billingclient.api.PurchasesResponseListener;

import java.util.ArrayList;
import java.util.List;

/**
 * Delegating PurchasesResponseListener for the Games In One "Unlock
 * premium" patch.
 *
 * The patch wraps BillingClientImpl.queryPurchasesAsync so the listener
 * Unity IAP registers is swapped for this injector before the real call
 * runs. When Play's answer comes back, the injector appends a forged
 * Purchase for the game's one-time VIP product ("pro_version", recovered
 * from the game's IL2CPP metadata) unless a real one is already present,
 * normalizes a failed or null result to OK, and forwards everything to
 * the real listener. Unity IAP then treats VIP as owned with a receipt
 * and the game grants it through its normal purchase-processing path.
 *
 * The forged purchase carries an empty signature: Unity IAP does not
 * verify signatures unless the app explicitly runs its receipt
 * validator.
 */
public final class VipPurchaseInjector implements PurchasesResponseListener {

    private static final String VIP_PRODUCT_ID = "pro_version";
    private static final String PACKAGE_NAME = "com.MustBeFun.GamesInOneWatchGames";
    private static final int RESPONSE_OK = 0;

    private final PurchasesResponseListener delegate;

    private VipPurchaseInjector(PurchasesResponseListener delegate) {
        this.delegate = delegate;
    }

    /**
     * Called from the patched queryPurchasesAsync before the original
     * method runs. Returns a wrapping listener, or the listener itself
     * when there is nothing to wrap.
     */
    public static PurchasesResponseListener wrap(PurchasesResponseListener listener) {
        if (listener == null || listener instanceof VipPurchaseInjector) {
            return listener;
        }
        return new VipPurchaseInjector(listener);
    }

    @Override
    public void onQueryPurchasesResponse(BillingResult billingResult, List<Purchase> purchases) {
        List<Purchase> out = purchases == null
                ? new ArrayList<Purchase>()
                : new ArrayList<Purchase>(purchases);

        boolean owned = false;
        for (Purchase purchase : out) {
            if (purchase != null
                    && purchase.getProducts() != null
                    && purchase.getProducts().contains(VIP_PRODUCT_ID)) {
                owned = true;
                break;
            }
        }

        if (!owned) {
            try {
                out.add(new Purchase(forgedPurchaseJson(), ""));
            } catch (Exception ignored) {
                // A malformed forge must never break the real response:
                // forward whatever Play actually returned.
            }
        }

        BillingResult result = billingResult;
        if (result == null || result.getResponseCode() != RESPONSE_OK) {
            // Unity IAP only processes the purchase list on an OK result,
            // so a Play-side failure (e.g. billing unavailable on the
            // watch) would otherwise hide the forged purchase too.
            result = BillingResult.newBuilder()
                    .setResponseCode(RESPONSE_OK)
                    .setDebugMessage("")
                    .build();
        }

        delegate.onQueryPurchasesResponse(result, out);
    }

    private static String forgedPurchaseJson() {
        long now = System.currentTimeMillis();
        return "{"
                + "\"orderId\":\"morphe-fake-order-pro-version\","
                + "\"packageName\":\"" + PACKAGE_NAME + "\","
                + "\"productId\":\"" + VIP_PRODUCT_ID + "\","
                + "\"productIds\":[\"" + VIP_PRODUCT_ID + "\"],"
                + "\"purchaseTime\":" + now + ","
                + "\"purchaseState\":0,"
                + "\"purchaseToken\":\"morphe_fake_token_pro_version\","
                + "\"quantity\":1,"
                + "\"acknowledged\":true,"
                + "\"autoRenewing\":false"
                + "}";
    }
}
