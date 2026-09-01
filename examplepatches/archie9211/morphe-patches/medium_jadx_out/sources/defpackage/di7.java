package defpackage;

import com.medium.android.graphql.MembershipStatusQuery;
import com.medium.android.graphql.type.MembershipType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class di7 {
    public static final ww7 a(MembershipStatusQuery.Membership membership) {
        s69 s69Var;
        zw7 zw7VarB = b(membership.getMembershipProductType());
        boolean zIsCancelled = membership.isCancelled();
        String membershipId = membership.getMembershipId();
        String membershipPlanId = membership.getMembershipPlanId();
        Long expiresAt = membership.getExpiresAt();
        long startedAt = membership.getStartedAt();
        zw7 zw7Var = membership.isGrantedPremium() ? zw7.PREMIUM : zw7VarB;
        switch (ci7.a[membership.getPaymentProvider().ordinal()]) {
            case 1:
                s69Var = s69.APPLE;
                break;
            case 2:
                s69Var = s69.BRAINTREE;
                break;
            case 3:
                s69Var = s69.GOOGLE;
                break;
            case 4:
                s69Var = s69.MEDIUM_GIFT;
                break;
            case 5:
                s69Var = s69.PAYPAL;
                break;
            case 6:
                s69Var = s69.STRIPE;
                break;
            case 7:
                s69Var = s69.UNKNOWN;
                break;
            case 8:
                s69Var = s69.UNKNOWN;
                break;
            default:
                ygf.a();
                return null;
        }
        s69 s69Var2 = s69Var;
        MembershipStatusQuery.MobilePlan mobilePlan = membership.getMobilePlan();
        return new ww7(zIsCancelled, expiresAt, s69Var2, zw7Var, zw7VarB, membershipId, startedAt, membershipPlanId, mobilePlan != null ? mobilePlan.getProductId() : null, qw7.b(membership.getMembershipProductType()));
    }

    public static final zw7 b(MembershipType membershipType) {
        membershipType.getClass();
        int i = ci7.b[membershipType.ordinal()];
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? zw7.NOT_A_MEMBER : zw7.PREMIUM : zw7.PREMIUM : zw7.REGULAR : zw7.REGULAR;
    }
}
