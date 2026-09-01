package defpackage;

import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class jr0 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[BillingPeriod.values().length];
        try {
            iArr[BillingPeriod.ONE_MONTH.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[BillingPeriod.ONE_YEAR.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
        int[] iArr2 = new int[aw7.values().length];
        try {
            iArr2[aw7.YELLOW.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        b = iArr2;
    }
}
