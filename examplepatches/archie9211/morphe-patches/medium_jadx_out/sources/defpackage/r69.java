package defpackage;

import gen.model.PaymentProvider;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r69 {
    public static PaymentProvider a(int i) {
        switch (i) {
            case 0:
                return PaymentProvider.UNKNOWN_PROVIDER;
            case 1:
                return PaymentProvider.STRIPE;
            case 2:
                return PaymentProvider.APPLE;
            case 3:
                return PaymentProvider.GOOGLE;
            case 4:
                return PaymentProvider.PAYPAL;
            case 5:
                return PaymentProvider.MEDIUM_GIFT;
            case 6:
                return PaymentProvider.BRAINTREE;
            default:
                return null;
        }
    }
}
