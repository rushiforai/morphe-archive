package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collection;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0Y, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C0Y extends AbstractC05700v {
    public static byte[] A00;
    public static String[] A01 = {"p4G6IChFiN1YlRVXcRHvnoDfdcYXdk4m", "qDKLbm18WUnAbHtOnOqFa8EC8wELOwkL", "HbrrZmoqSsWuBeL2DNY6", "t6OCMUcw4Dky2jOH0SrHrslGw3iwCJ7I", "tYR7Cnk37CgkrvB3pV64", "YfKmN3dH3V2P9WZ4G", "stoUQgnFXCo7NoSp5hffM9rf08oYokie", "74r5lOIBShcOIJyc9zEN"};

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 57);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A00 = new byte[]{-63, -7, -19, -18, -8, -61};
    }

    static {
        A07();
    }

    public static final <T> int A05(Iterable<? extends T> iterable, int i5) {
        C1h.A09(iterable, A06(0, 6, 76));
        if (!(iterable instanceof Collection)) {
            return i5;
        }
        Collection collection = (Collection) iterable;
        if (A01[3].charAt(28) == '6') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[6] = "bp3Xqw7E010zGfgkdZMEgYifLHH7bWdi";
        strArr[0] = "r5xcnKC361516P8KXhB2q6WfvbJWaIVh";
        return collection.size();
    }
}
