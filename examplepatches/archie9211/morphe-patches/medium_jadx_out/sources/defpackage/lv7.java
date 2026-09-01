package defpackage;

import gen.model.MembershipDiscount;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lv7 {
    public static MembershipDiscount a(int i) {
        switch (i) {
            case 0:
                return MembershipDiscount.NO_DISCOUNT;
            case 1:
                return MembershipDiscount.FIFTY_PERCENT_OFF_ONE_YEAR;
            case 2:
                return MembershipDiscount.STUDENT_DISCOUNT;
            case 3:
                return MembershipDiscount.TWENTY_FIVE_PERCENT_OFF_ONE_YEAR;
            case 4:
                return MembershipDiscount.TEN_PERCENT_OFF_ONE_YEAR;
            case 5:
                return MembershipDiscount.TWENTY_PERCENT_OFF_ONE_YEAR;
            case 6:
                return MembershipDiscount.FIFTEEN_PERCENT_OFF_ONE_YEAR;
            case 7:
                return MembershipDiscount.FREE_ONE_YEAR;
            default:
                return null;
        }
    }
}
