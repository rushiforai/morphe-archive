package defpackage;

import gen.model.PaymentRecurrenceInterval;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t69 {
    public static PaymentRecurrenceInterval a(int i) {
        if (i == 0) {
            return PaymentRecurrenceInterval.UNKNOWN_INTERVAL;
        }
        if (i == 1) {
            return PaymentRecurrenceInterval.DAILY;
        }
        if (i == 2) {
            return PaymentRecurrenceInterval.WEEKLY;
        }
        if (i == 3) {
            return PaymentRecurrenceInterval.MONTHLY;
        }
        if (i != 4) {
            return null;
        }
        return PaymentRecurrenceInterval.YEARLY;
    }
}
