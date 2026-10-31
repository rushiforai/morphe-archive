package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.util.Arrays;
import java.util.Map;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Va, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1293Va {
    public static <K, V> Map<K, V> A00(int expectedSize) {
        return W0.A0B(expectedSize);
    }

    public static <T> T[] A01(T[] tArr, int i5) {
        if (tArr.length != 0) {
            tArr = (T[]) Arrays.copyOf(tArr, 0);
        }
        return (T[]) Arrays.copyOf(tArr, i5);
    }

    public static <T> T[] A02(Object[] objArr, int i5, int i11, T[] tArr) {
        return (T[]) Arrays.copyOfRange(objArr, i5, i11, tArr.getClass());
    }
}
