package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.9a, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07439a<V> implements InterfaceC1317Wb<List<V>>, Serializable {
    public static byte[] A01;
    public static String[] A02 = {"iDYYeQ31KU40zvbeJpWTE", "2Vc", "CBNerzMpePj9he9aCflIZ", "WB7bGmKP", "tKWgeM1UCXsJnqBB7iooCi1sjneNsJxw", "BZpcRruJKyqI4tCWv4Jm4koMLnC", "T2RpLGx0zCmkhPaRs29Ow", "cadmNVCsk1fE"};
    public final int A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A02[7].length() != 12) {
                throw new RuntimeException();
            }
            A02[7] = "3eQarWo70slw";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 19);
            i13++;
        }
    }

    public static void A02() {
        A01 = new byte[]{-85, -66, -74, -85, -87, -70, -85, -86, -100, -89, -78, -69, -85, -71, -106, -85, -72, -111, -85, -65};
    }

    static {
        A02();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9a != com.google.common.collect.MultimapBuilder$ArrayListSupplier<V> */
    public C07439a(int expectedValuesPerKey) {
        this.A00 = W7.A00(expectedValuesPerKey, A00(0, 20, 51));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9a != com.google.common.collect.MultimapBuilder$ArrayListSupplier<V> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1317Wb
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final List<V> get() {
        return new ArrayList(this.A00);
    }
}
