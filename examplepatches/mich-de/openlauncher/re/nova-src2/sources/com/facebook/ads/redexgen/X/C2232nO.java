package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.nO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2232nO {
    public static byte[] A02;
    public static String[] A03 = {"0EK1zjbC0rvKFRySirHuNeKu7O6M1c2K", "EZ3WTNSY5ayWns4cE", "iOTwBXJJn2mTXQ1MI7WizzznsNyhmcwj", "DnXRTJeCR1MDANpnyW3y9Xegmk", "0BaBrbX1x0DXsftKwoONmcZPElrNX48m", "JdhHjDAP4IE4TNrXk8Fag99Jau", "kO1FJ5pbtA78NTGKnINecVB8MAIDEUuG", "0uD1E8KeZOnBJibGqVh9DEewsO4i87jr"};
    public final InterfaceC2224nG A00;
    public final String A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A03[4].charAt(5) != 'b') {
                throw new RuntimeException();
            }
            A03[4] = "OpSsMbmoyiuJLyOxEkBMoj5ebplLMUgU";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 40);
            i13++;
        }
    }

    public static void A01() {
        A02 = new byte[]{24, 30, 9, 31, 18, 27, 14};
    }

    static {
        A01();
    }

    public C2232nO(String str, InterfaceC2224nG interfaceC2224nG) {
        this.A01 = str;
        this.A00 = interfaceC2224nG;
    }

    public static void A02(EnumC2231nN enumC2231nN, Map<String, String> map, String str, InterfaceC2224nG interfaceC2224nG) {
        A03(enumC2231nN.A03(), map, str, interfaceC2224nG);
    }

    public static void A03(String str, Map<String, String> map, String str2, InterfaceC2224nG interfaceC2224nG) {
        if (!AbstractC2234nQ.A0B(str2, str)) {
            return;
        }
        if (map == null) {
            map = new HashMap<>();
        }
        map.put(A00(0, 7, 67), str);
        interfaceC2224nG.AC2(str2, map);
    }

    public final void A04(EnumC2231nN enumC2231nN, Map<String, String> data) {
        A05(enumC2231nN.A03(), data);
    }

    public final void A05(String str, Map<String, String> data) {
        A03(str, data, this.A01, this.A00);
    }
}
