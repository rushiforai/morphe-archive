package defpackage;

import com.medium.proto.event.MembershipBillingFrequency;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jv7 {
    public static MembershipBillingFrequency a(int i) {
        if (i == 0) {
            return MembershipBillingFrequency.__NULL;
        }
        if (i == 1) {
            return MembershipBillingFrequency.MONTHLY;
        }
        if (i != 2) {
            return null;
        }
        return MembershipBillingFrequency.YEARLY;
    }
}
