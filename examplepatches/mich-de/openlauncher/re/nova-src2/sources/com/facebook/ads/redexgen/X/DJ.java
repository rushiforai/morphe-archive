package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class DJ extends AbstractRunnableC2319oq {
    public static byte[] A01;
    public static String[] A02 = {"LNqwTEh", "UoGpOHWV9zHxP9FbUdEz4AfHC6dRmkkT", "hfOxm6dlyJX329RbZJiPwJyHrQdpnD2L", "dxOBxsDFly3Ic3Z24bv10J1v8B7eOgI2", "LgMDq1dJk1yoReKJo0dnYxBdoAo1sJ7B", "xQvnj7vSZUV5pzubj8OO0RfBcZ3kcgkz", "iFWo4Rp1bPuWnwdsiYVjrK4a", "qesZqXmrCSvDM9D5ryLU3XP6M74MWjBR"};
    public final /* synthetic */ C06805y A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 113);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{102, 89, 84, 85, 95, 16, 71, 81, 67, 16, 94, 85, 70, 85, 66, 16, 64, 66, 85, 64, 81, 66, 85, 84};
    }

    static {
        A01();
    }

    public DJ(C06805y c06805y) {
        this.A00 = c06805y;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        if (!this.A00.A0a) {
            C06805y c06805y = this.A00;
            String[] strArr = A02;
            if (strArr[1].charAt(13) != strArr[2].charAt(13)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[1] = "rubP5cEt439s89VQ4GFWkKBY0aIf15w5";
            strArr2[2] = "xsBepKfmc9LAf9wWQ0M2ZBIiIgFfXGPT";
            c06805y.A13(A00(0, 24, 65));
        }
    }
}
