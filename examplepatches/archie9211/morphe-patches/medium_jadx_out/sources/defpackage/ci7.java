package defpackage;

import com.medium.android.graphql.type.MembershipType;
import com.medium.android.graphql.type.PaymentProvider;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class ci7 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[PaymentProvider.values().length];
        try {
            iArr[PaymentProvider.APPLE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[PaymentProvider.BRAINTREE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[PaymentProvider.GOOGLE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[PaymentProvider.MEDIUM_GIFT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[PaymentProvider.PAYPAL.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[PaymentProvider.STRIPE.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[PaymentProvider.UNKNOWN.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[PaymentProvider.UNKNOWN__.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        a = iArr;
        int[] iArr2 = new int[MembershipType.values().length];
        try {
            iArr2[MembershipType.MONTHLY.ordinal()] = 1;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr2[MembershipType.YEARLY.ordinal()] = 2;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr2[MembershipType.PREMIUM_MONTHLY.ordinal()] = 3;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr2[MembershipType.PREMIUM_YEARLY.ordinal()] = 4;
        } catch (NoSuchFieldError unused12) {
        }
        b = iArr2;
    }
}
