package com.facebook.ads.redexgen.X;

import java.util.Calendar;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class YE {
    public static final YE A00 = new YE();

    @JvmStatic
    public static final int A00(int i5, int i11, int i12) {
        if (A00.A01(i5) && !Y9.A01.A00()) {
            return i5;
        }
        if (A02(i11, i12)) {
            return 1;
        }
        return 3;
    }

    private final boolean A01(int i5) {
        return -1 <= i5 && i5 < 7;
    }

    @JvmStatic
    public static final boolean A02(int i5, int i11) {
        int i12 = Calendar.getInstance().get(11);
        return i12 >= i5 || i12 <= i11;
    }
}
