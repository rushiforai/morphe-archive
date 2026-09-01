package defpackage;

import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class xc0 {
    public static final /* synthetic */ int[] a;
    public static final /* synthetic */ int[] b;

    static {
        int[] iArr = new int[SusiOperation.values().length];
        try {
            iArr[SusiOperation.LOGIN.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[SusiOperation.REGISTER.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        a = iArr;
        int[] iArr2 = new int[l3d.values().length];
        try {
            iArr2[l3d.GOOGLE.ordinal()] = 1;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr2[l3d.FACEBOOK.ordinal()] = 2;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr2[l3d.APPLE.ordinal()] = 3;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr2[l3d.X.ordinal()] = 4;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[l3d.MEDIUM.ordinal()] = 5;
        } catch (NoSuchFieldError unused7) {
        }
        b = iArr2;
    }
}
