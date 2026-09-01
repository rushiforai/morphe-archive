package defpackage;

import com.medium.android.core.models.BillingPeriod;
import com.medium.android.graphql.type.MembershipFrequency;
import com.medium.android.graphql.type.MembershipType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class qw7 {
    public static final BillingPeriod a(MembershipFrequency membershipFrequency) {
        membershipFrequency.getClass();
        int i = pw7.a[membershipFrequency.ordinal()];
        if (i == 1) {
            return BillingPeriod.ONE_MONTH;
        }
        if (i == 2 || i == 3) {
            return BillingPeriod.ONE_YEAR;
        }
        ygf.a();
        return null;
    }

    public static final BillingPeriod b(MembershipType membershipType) {
        membershipType.getClass();
        int i = pw7.b[membershipType.ordinal()];
        if (i == 1) {
            return BillingPeriod.ONE_MONTH;
        }
        if (i == 2) {
            return BillingPeriod.ONE_YEAR;
        }
        if (i == 3) {
            return BillingPeriod.ONE_MONTH;
        }
        if (i != 4) {
            return null;
        }
        return BillingPeriod.ONE_YEAR;
    }
}
