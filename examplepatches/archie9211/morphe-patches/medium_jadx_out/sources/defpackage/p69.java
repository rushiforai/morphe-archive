package defpackage;

import gen.model.PaymentCurrency;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p69 {
    public static PaymentCurrency a(int i) {
        if (i == 0) {
            return PaymentCurrency.UNKNOWN_CURRENCY;
        }
        if (i == 1) {
            return PaymentCurrency.USD;
        }
        if (i == 2) {
            return PaymentCurrency.CAD;
        }
        if (i == 3) {
            return PaymentCurrency.CURRENCY_NOT_APPLICABLE;
        }
        if (i != 4) {
            return null;
        }
        return PaymentCurrency.EUR;
    }
}
