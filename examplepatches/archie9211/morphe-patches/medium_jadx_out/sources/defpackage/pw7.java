package defpackage;

import com.medium.android.graphql.type.MembershipFrequency;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.graphql.type.OfferColorScheme;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class pw7 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;

    static {
        int[] iArr = new int[MembershipFrequency.values().length];
        try {
            iArr[MembershipFrequency.MONTHLY.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[MembershipFrequency.ANNUAL.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[MembershipFrequency.UNKNOWN__.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
        int[] iArr2 = new int[MembershipType.values().length];
        try {
            iArr2[MembershipType.MONTHLY.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[MembershipType.YEARLY.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[MembershipType.PREMIUM_MONTHLY.ordinal()] = 3;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[MembershipType.PREMIUM_YEARLY.ordinal()] = 4;
        } catch (NoSuchFieldError unused7) {
        }
        b = iArr2;
        int[] iArr3 = new int[OfferColorScheme.values().length];
        try {
            iArr3[OfferColorScheme.YELLOW.ordinal()] = 1;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr3[OfferColorScheme.UNKNOWN__.ordinal()] = 2;
        } catch (NoSuchFieldError unused9) {
        }
        c = iArr3;
    }
}
