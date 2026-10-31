package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Map;
import java.util.TreeMap;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1297Vg<K0, V0> {
    public static byte[] A00;

    static {
        A04();
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{-44, -25, -33, -44, -46, -29, -44, -45, -70, -44, -24, -30};
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vg != com.google.common.collect.MultimapBuilder<K0, V0> */
    public AbstractC1297Vg() {
    }

    public static AbstractC1298Vh<Object> A00(final int expectedKeys) {
        W7.A00(expectedKeys, A03(0, 12, 36));
        return new AbstractC1298Vh<Object>() { // from class: com.facebook.ads.redexgen.X.9c
            @Override // com.facebook.ads.redexgen.X.AbstractC1298Vh
            public final <K, V> Map<K, Collection<V>> A04() {
                return AbstractC1293Va.A00(expectedKeys);
            }
        };
    }

    public static <K0> AbstractC1298Vh<K0> A01(final Comparator<K0> comparator) {
        AbstractC1335Wu.A04(comparator);
        return new AbstractC1298Vh<K0>() { // from class: com.facebook.ads.redexgen.X.9b
            @Override // com.facebook.ads.redexgen.X.AbstractC1298Vh
            public final <K extends K0, V> Map<K, Collection<V>> A04() {
                return new TreeMap(comparator);
            }
        };
    }

    public static AbstractC1298Vh<Comparable> A02() {
        return A01(AbstractC1294Vc.A03());
    }
}
