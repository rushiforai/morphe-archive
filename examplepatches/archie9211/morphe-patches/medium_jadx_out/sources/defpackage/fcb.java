package defpackage;

import com.android.billingclient.api.ProductDetails;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fcb {
    public static final ecb a(mw7 mw7Var, List list) {
        Object next;
        List<ProductDetails.SubscriptionOfferDetails> subscriptionOfferDetails;
        ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails2;
        Object next2;
        Object next3;
        mw7Var.getClass();
        String str = mw7Var.c;
        list.getClass();
        Iterator it2 = list.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (g76.L(((ProductDetails) next).getProductId(), mw7Var.a)) {
                break;
            }
        }
        ProductDetails productDetails = (ProductDetails) next;
        if (productDetails == null || (subscriptionOfferDetails = productDetails.getSubscriptionOfferDetails()) == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : subscriptionOfferDetails) {
            if (g76.L(((ProductDetails.SubscriptionOfferDetails) obj).getBasePlanId(), mw7Var.b)) {
                arrayList.add(obj);
            }
        }
        if (str != null) {
            Iterator it3 = arrayList.iterator();
            while (true) {
                if (!it3.hasNext()) {
                    next3 = null;
                    break;
                }
                next3 = it3.next();
                if (g76.L(((ProductDetails.SubscriptionOfferDetails) next3).getOfferId(), str)) {
                    break;
                }
            }
            subscriptionOfferDetails2 = (ProductDetails.SubscriptionOfferDetails) next3;
        } else {
            subscriptionOfferDetails2 = null;
        }
        Iterator it4 = arrayList.iterator();
        while (true) {
            if (!it4.hasNext()) {
                next2 = null;
                break;
            }
            next2 = it4.next();
            ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails3 = (ProductDetails.SubscriptionOfferDetails) next2;
            subscriptionOfferDetails3.getClass();
            if (m2a.b(subscriptionOfferDetails3) == null) {
                break;
            }
        }
        ProductDetails.SubscriptionOfferDetails subscriptionOfferDetails4 = (ProductDetails.SubscriptionOfferDetails) next2;
        if (subscriptionOfferDetails2 == null) {
            if (subscriptionOfferDetails4 == null) {
                return null;
            }
            subscriptionOfferDetails2 = subscriptionOfferDetails4;
        }
        ProductDetails.PricingPhase pricingPhaseA = m2a.a(subscriptionOfferDetails2);
        if (pricingPhaseA == null) {
            return null;
        }
        boolean z = str != null && g76.L(subscriptionOfferDetails2.getOfferId(), str);
        ProductDetails.PricingPhase pricingPhaseC = m2a.c(subscriptionOfferDetails2);
        ProductDetails.PricingPhase pricingPhase = (pricingPhaseC == null || !z) ? null : pricingPhaseC;
        ProductDetails.PricingPhase pricingPhaseB = m2a.b(subscriptionOfferDetails2);
        String productId = productDetails.getProductId();
        productId.getClass();
        String offerToken = subscriptionOfferDetails2.getOfferToken();
        offerToken.getClass();
        return new ecb(productId, offerToken, pricingPhaseA, pricingPhaseB != null, pricingPhaseB != null ? pricingPhaseB.getBillingPeriod() : null, pricingPhase, mw7Var.e, mw7Var.f, mw7Var.d, mw7Var.g, mw7Var.h);
    }
}
