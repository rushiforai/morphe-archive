package defpackage;

import gen.model.CancellationType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b61 {
    public static CancellationType a(int i) {
        switch (i) {
            case 0:
                return CancellationType.UNKNOWN_CANCELLATION;
            case 1:
                return CancellationType.ADMIN;
            case 2:
                return CancellationType.USER;
            case 3:
                return CancellationType.PROVIDER_APPLE;
            case 4:
                return CancellationType.TRIAL_ENDED;
            case 5:
                return CancellationType.PROVIDER_GOOGLE;
            case 6:
                return CancellationType.PROVIDER_PAYPAL;
            case 7:
                return CancellationType.GIFT_ENDED;
            case 8:
                return CancellationType.PROVIDER_BRAINTREE;
            case 9:
                return CancellationType.PROVIDER_STRIPE;
            default:
                return null;
        }
    }
}
