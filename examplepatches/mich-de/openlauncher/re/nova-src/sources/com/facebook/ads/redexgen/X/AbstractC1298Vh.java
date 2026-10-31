package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collection;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Vh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1298Vh<K0> {
    public static byte[] A00;
    public static String[] A01 = {"NCmgtE7mLsHswiI1KU1fD79FtmEU6NCc", "PIzQSysLlo", "9ION7uxlTtvGYi5oQtUEUuvU4tAfjNPf", "dp340J4R6jKwPELw4vlLmhe0ZwjXG0", "HGvj", "yTuerXynFCQ22hCobp3RuVrDx5j1B6Al", "tDGkFewwJ18L", "79dL"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            if (A01[6].length() == 27) {
                throw new RuntimeException();
            }
            A01[3] = "8bYxTqf7QMllR5OEDQwe";
            bArrCopyOfRange[i13] = (byte) ((b11 ^ i12) ^ 35);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{33, 60, 52, 33, 39, 48, 33, 32, 18, 37, 40, 49, 33, 55, 20, 33, 54, 15, 33, 61};
    }

    public abstract <K extends K0, V> Map<K, Collection<V>> A04();

    static {
        A02();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vh != com.google.common.collect.MultimapBuilder$MultimapBuilderWithKeys<K0> */
    private final C9Z<K0, Object> A00(final int expectedValuesPerKey) {
        W7.A00(expectedValuesPerKey, A01(0, 20, 103));
        return new C9Z<K0, Object>(this) { // from class: com.facebook.ads.redexgen.X.4Z
            public final /* synthetic */ AbstractC1298Vh A01;

            {
                this.A01 = this;
            }

            @Override // com.facebook.ads.redexgen.X.C9Z
            public final <K extends K0, V> InterfaceC07519i<K, V> A00() {
                return AbstractC1296Vf.A00(this.A01.A04(), new C07439a(expectedValuesPerKey));
            }
        };
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vh != com.google.common.collect.MultimapBuilder$MultimapBuilderWithKeys<K0> */
    public final C9Z<K0, Object> A03() {
        return A00(2);
    }
}
