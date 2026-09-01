package defpackage;

import com.android.billingclient.api.ProductDetails;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m2a {
    public static final ProductDetails.PricingPhase a(ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails) {
        Object next;
        List<ProductDetails.PricingPhase> pricingPhaseList = subscriptionOfferDetails.getPricingPhases().getPricingPhaseList();
        pricingPhaseList.getClass();
        Iterator<T> it2 = pricingPhaseList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((ProductDetails.PricingPhase) next).getRecurrenceMode() == 1) {
                break;
            }
        }
        return (ProductDetails.PricingPhase) next;
    }

    public static final ProductDetails.PricingPhase b(ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails) {
        Object next;
        List<ProductDetails.PricingPhase> pricingPhaseList = subscriptionOfferDetails.getPricingPhases().getPricingPhaseList();
        pricingPhaseList.getClass();
        Iterator<T> it2 = pricingPhaseList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((ProductDetails.PricingPhase) next).getPriceAmountMicros() == 0) {
                break;
            }
        }
        return (ProductDetails.PricingPhase) next;
    }

    public static final ProductDetails.PricingPhase c(ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails) {
        Object next;
        List<ProductDetails.PricingPhase> pricingPhaseList = subscriptionOfferDetails.getPricingPhases().getPricingPhaseList();
        pricingPhaseList.getClass();
        Iterator<T> it2 = pricingPhaseList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            ProductDetails.PricingPhase pricingPhase = (ProductDetails.PricingPhase) next;
            if (pricingPhase.getRecurrenceMode() == 2 && pricingPhase.getPriceAmountMicros() != 0) {
                break;
            }
        }
        return (ProductDetails.PricingPhase) next;
    }
}
