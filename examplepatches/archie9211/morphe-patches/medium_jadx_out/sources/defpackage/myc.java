package defpackage;

import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class myc {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;
    public static final /* synthetic */ int[] c;
    public static final /* synthetic */ int[] d;

    static {
        int[] iArr = new int[zw7.values().length];
        try {
            iArr[zw7.PREMIUM.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[zw7.REGULAR.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[zw7.NOT_A_MEMBER.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        a = iArr;
        int[] iArr2 = new int[s69.values().length];
        try {
            iArr2[s69.APPLE.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        b = iArr2;
        int[] iArr3 = new int[BillingPeriod.values().length];
        try {
            iArr3[BillingPeriod.ONE_YEAR.ordinal()] = 1;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr3[BillingPeriod.ONE_MONTH.ordinal()] = 2;
        } catch (NoSuchFieldError unused6) {
        }
        c = iArr3;
        int[] iArr4 = new int[aw7.values().length];
        try {
            iArr4[aw7.YELLOW.ordinal()] = 1;
        } catch (NoSuchFieldError unused7) {
        }
        d = iArr4;
    }
}
