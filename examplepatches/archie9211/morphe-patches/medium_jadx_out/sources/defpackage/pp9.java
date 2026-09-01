package defpackage;

import com.medium.android.graphql.type.PostStatsDailyBundleMembershipType;
import com.medium.android.graphql.type.ReferrerType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class pp9 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[ReferrerType.values().length];
        try {
            iArr[ReferrerType.DIRECT.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[ReferrerType.RSS.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
        int[] iArr2 = new int[PostStatsDailyBundleMembershipType.values().length];
        try {
            iArr2[PostStatsDailyBundleMembershipType.MEMBER.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr2[PostStatsDailyBundleMembershipType.NONMEMBER.ordinal()] = 2;
        } catch (NoSuchFieldError unused4) {
        }
        b = iArr2;
    }
}
