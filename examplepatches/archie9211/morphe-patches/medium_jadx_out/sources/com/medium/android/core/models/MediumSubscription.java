package com.medium.android.core.models;

import com.medium.android.graphql.type.MembershipType;
import defpackage.bs7;
import defpackage.g04;
import defpackage.rv8;
import defpackage.z73;
import gen.model.MediumMembershipType;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001e\b\u0087\u0081\u0002\u0018\u0000 \u001c2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u001dB9\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u000e\u001a\u0004\b\u0011\u0010\u0010R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u000e\u001a\u0004\b\u0012\u0010\u0010R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u0013\u001a\u0004\b\u0014\u0010\u0015R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010\u0016\u001a\u0004\b\u0017\u0010\u0018R\u0017\u0010\u000b\u001a\u00020\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010\u0019\u001a\u0004\b\u001a\u0010\u001bj\u0002\b\u001ej\u0002\b\u001fj\u0002\b j\u0002\b!j\u0002\b\"j\u0002\b#j\u0002\b$j\u0002\b%j\u0002\b&j\u0002\b'¨\u0006("}, d2 = {"Lcom/medium/android/core/models/MediumSubscription;", "", "", "productId", "planId", "mediumPlanId", "Lgen/model/MediumMembershipType;", "mediumMembershipType", "Lcom/medium/android/graphql/type/MembershipType;", "membershipType", "Lcom/medium/android/core/models/BillingPeriod;", "billingPeriod", "<init>", "(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/MediumMembershipType;Lcom/medium/android/graphql/type/MembershipType;Lcom/medium/android/core/models/BillingPeriod;)V", "Ljava/lang/String;", "getProductId", "()Ljava/lang/String;", "getPlanId", "getMediumPlanId", "Lgen/model/MediumMembershipType;", "getMediumMembershipType", "()Lgen/model/MediumMembershipType;", "Lcom/medium/android/graphql/type/MembershipType;", "getMembershipType", "()Lcom/medium/android/graphql/type/MembershipType;", "Lcom/medium/android/core/models/BillingPeriod;", "getBillingPeriod", "()Lcom/medium/android/core/models/BillingPeriod;", "Companion", "bs7", "REGULAR_MONTHLY", "REGULAR_YEARLY", "PREMIUM_MONTHLY", "PREMIUM_YEARLY", "TEST_MONTHLY", "TEST_YEARLY", "TEST_PREMIUM_MONTHLY", "TEST_PREMIUM_YEARLY", "OLD_REGULAR_MONTHLY", "OLD_REGULAR_YEARLY", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@z73
public final class MediumSubscription {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ MediumSubscription[] $VALUES;
    public static final bs7 Companion;
    public static final MediumSubscription OLD_REGULAR_MONTHLY;
    public static final MediumSubscription OLD_REGULAR_YEARLY;
    public static final MediumSubscription PREMIUM_MONTHLY;
    public static final MediumSubscription PREMIUM_YEARLY;
    public static final MediumSubscription REGULAR_MONTHLY;
    public static final MediumSubscription REGULAR_YEARLY;
    public static final MediumSubscription TEST_MONTHLY;
    public static final MediumSubscription TEST_PREMIUM_MONTHLY;
    public static final MediumSubscription TEST_PREMIUM_YEARLY;
    public static final MediumSubscription TEST_YEARLY;
    private final BillingPeriod billingPeriod;
    private final MediumMembershipType mediumMembershipType;
    private final String mediumPlanId;
    private final MembershipType membershipType;
    private final String planId;
    private final String productId;

    private static final /* synthetic */ MediumSubscription[] $values() {
        return new MediumSubscription[]{REGULAR_MONTHLY, REGULAR_YEARLY, PREMIUM_MONTHLY, PREMIUM_YEARLY, TEST_MONTHLY, TEST_YEARLY, TEST_PREMIUM_MONTHLY, TEST_PREMIUM_YEARLY, OLD_REGULAR_MONTHLY, OLD_REGULAR_YEARLY};
    }

    static {
        MediumMembershipType mediumMembershipType = MediumMembershipType.MEDIUM_MONTHLY;
        MembershipType membershipType = MembershipType.MONTHLY;
        BillingPeriod billingPeriod = BillingPeriod.ONE_MONTH;
        REGULAR_MONTHLY = new MediumSubscription("REGULAR_MONTHLY", 0, "medium_monthly_subscription_with_trial", "p1m", "905dd7e72d10", mediumMembershipType, membershipType, billingPeriod);
        MediumMembershipType mediumMembershipType2 = MediumMembershipType.MEDIUM_YEARLY;
        MembershipType membershipType2 = MembershipType.YEARLY;
        BillingPeriod billingPeriod2 = BillingPeriod.ONE_YEAR;
        REGULAR_YEARLY = new MediumSubscription("REGULAR_YEARLY", 1, "medium_yearly_subscription_with_trial", "p1y", "ce983bb22987", mediumMembershipType2, membershipType2, billingPeriod2);
        MediumMembershipType mediumMembershipType3 = MediumMembershipType.PREMIUM_MEDIUM_MONTHLY;
        MembershipType membershipType3 = MembershipType.PREMIUM_MONTHLY;
        PREMIUM_MONTHLY = new MediumSubscription("PREMIUM_MONTHLY", 2, "medium_monthly_premium", "monthly-premium-base-plan", "12a660186432", mediumMembershipType3, membershipType3, billingPeriod);
        MediumMembershipType mediumMembershipType4 = MediumMembershipType.PREMIUM_MEDIUM_YEARLY;
        MembershipType membershipType4 = MembershipType.PREMIUM_YEARLY;
        PREMIUM_YEARLY = new MediumSubscription("PREMIUM_YEARLY", 3, "medium_yearly_premium", "yearly-premium-plan", "4a442ace1476", mediumMembershipType4, membershipType4, billingPeriod2);
        TEST_MONTHLY = new MediumSubscription("TEST_MONTHLY", 4, "medium_test_sub_1", "p1m", "d8064e34e11c", mediumMembershipType, membershipType, billingPeriod);
        TEST_YEARLY = new MediumSubscription("TEST_YEARLY", 5, "medium_test_yearly_subscription", "p1y", "84c75e883579", mediumMembershipType2, membershipType2, billingPeriod2);
        TEST_PREMIUM_MONTHLY = new MediumSubscription("TEST_PREMIUM_MONTHLY", 6, "medium_test_monthly_premium_subscription", "p1m", "d8064e34e11c", mediumMembershipType3, membershipType3, billingPeriod);
        TEST_PREMIUM_YEARLY = new MediumSubscription("TEST_PREMIUM_YEARLY", 7, "medium_test_yearly_premium_subscription", "p1y", "84c75e883579", mediumMembershipType4, membershipType4, billingPeriod2);
        OLD_REGULAR_MONTHLY = new MediumSubscription("OLD_REGULAR_MONTHLY", 8, "medium_monthly_subscription", "p1m", "60e220181034", mediumMembershipType, membershipType, billingPeriod);
        OLD_REGULAR_YEARLY = new MediumSubscription("OLD_REGULAR_YEARLY", 9, "medium_yearly_subscription", "p1y", "2c754bcc2995", mediumMembershipType2, membershipType2, billingPeriod2);
        MediumSubscription[] mediumSubscriptionArr$values = $values();
        $VALUES = mediumSubscriptionArr$values;
        $ENTRIES = rv8.x(mediumSubscriptionArr$values);
        Companion = new bs7();
    }

    private MediumSubscription(String str, int i, String str2, String str3, String str4, MediumMembershipType mediumMembershipType, MembershipType membershipType, BillingPeriod billingPeriod) {
        this.productId = str2;
        this.planId = str3;
        this.mediumPlanId = str4;
        this.mediumMembershipType = mediumMembershipType;
        this.membershipType = membershipType;
        this.billingPeriod = billingPeriod;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static MediumSubscription valueOf(String str) {
        return (MediumSubscription) Enum.valueOf(MediumSubscription.class, str);
    }

    public static MediumSubscription[] values() {
        return (MediumSubscription[]) $VALUES.clone();
    }

    public final BillingPeriod getBillingPeriod() {
        return this.billingPeriod;
    }

    public final MediumMembershipType getMediumMembershipType() {
        return this.mediumMembershipType;
    }

    public final String getMediumPlanId() {
        return this.mediumPlanId;
    }

    public final MembershipType getMembershipType() {
        return this.membershipType;
    }

    public final String getPlanId() {
        return this.planId;
    }

    public final String getProductId() {
        return this.productId;
    }
}
