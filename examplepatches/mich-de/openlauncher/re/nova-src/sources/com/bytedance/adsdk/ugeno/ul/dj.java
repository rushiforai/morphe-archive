package com.bytedance.adsdk.ugeno.ul;

import java.util.Collection;

/* loaded from: classes2.dex */
public class dj {
    public static int ycx(boolean z11, int i5, int i11) {
        if (i11 == 0 || !z11) {
            return i5;
        }
        int i12 = i5 - 512;
        int iAbs = Math.abs(i12) % i11;
        return (i12 >= 0 || iAbs == 0) ? iAbs : i11 - iAbs;
    }

    public static boolean ycx(int i5, Collection<?> collection) {
        return i5 >= 0 && i5 < collection.size();
    }
}
