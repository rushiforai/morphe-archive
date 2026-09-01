package defpackage;

import gen.model.PaymentMembershipStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q69 {
    public static PaymentMembershipStatus a(int i) {
        if (i == 0) {
            return PaymentMembershipStatus.UNKNOWN_STATUS;
        }
        if (i == 1) {
            return PaymentMembershipStatus.TRIAL;
        }
        if (i == 2) {
            return PaymentMembershipStatus.ACTIVE;
        }
        if (i == 3) {
            return PaymentMembershipStatus.PAST_DUE;
        }
        if (i == 4) {
            return PaymentMembershipStatus.CANCELLED;
        }
        if (i != 5) {
            return null;
        }
        return PaymentMembershipStatus.UNPAID;
    }
}
