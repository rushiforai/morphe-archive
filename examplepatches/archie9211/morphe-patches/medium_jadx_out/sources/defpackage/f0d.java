package defpackage;

import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class f0d {
    public static final /* synthetic */ int[] a;

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
    }
}
