package com.bytedance.adsdk.zb;

/* loaded from: classes2.dex */
public enum uh {
    AUTOMATIC,
    HARDWARE,
    SOFTWARE;

    /* renamed from: com.bytedance.adsdk.zb.uh$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[uh.values().length];
            ycx = iArr;
            try {
                iArr[uh.HARDWARE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[uh.SOFTWARE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                ycx[uh.AUTOMATIC.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    public boolean ycx(int i5, boolean z11, int i11) {
        int i12 = AnonymousClass1.ycx[ordinal()];
        if (i12 == 1) {
            return false;
        }
        if (i12 != 2) {
            return (z11 && i5 < 28) || i11 > 4 || i5 <= 25;
        }
        return true;
    }
}
