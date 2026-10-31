package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdSize;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.pU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2356pU {
    public static byte[] A00;
    public static String[] A01 = {"gFe3mTVqEc", "o3XICwck3thy8t5khkuFfgIyTYcE10rb", "CXZamXhEArpjjLRWzP01hTJHhdHKIPhL", "oFEH5ENhqq8Jzm18l75xaKQx7AXJNwzV", "R1QKRY6v8stJjzPTGoE1sFm3d511QSKK", "fRlItu1oZcW1vgjv2TfsauDW1x1gg146", "rMZj8KW6uJSswCV0wJ61u4oJuHgPLcpr", "VRcOG4k1oxgWu574CIBxVkEWQ"};
    public static final Map<EnumC2264nw, EnumC2265nx> A02;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 25);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A00 = new byte[]{125, 95, 80, 25, 74, 30, 93, 76, 91, 95, 74, 91, 30, AbstractJsonLexerKt.TC_INVALID, 90, 109, 87, 68, 91, 30, 75, 77, 87, 80, 89, 30, 74, 86, 87, 77, 30, 73, 87, 90, 74, 86, 30, 95, 80, 90, 30, 86, 91, 87, 89, 86, 74, 16, 115, 72, 77, 72, 73, 81, 72, 6, 103, 66, 117, 79, 92, 67, 6, 82, 95, 86, 67, 8};
    }

    static {
        A07();
        A02 = new HashMap();
        A02.put(EnumC2264nw.A08, EnumC2265nx.A0C);
        A02.put(EnumC2264nw.A06, EnumC2265nx.A0E);
        A02.put(EnumC2264nw.A05, EnumC2265nx.A0D);
    }

    public static AdSize A00(EnumC2264nw enumC2264nw) {
        return AdSize.fromWidthAndHeight(enumC2264nw.A04(), enumC2264nw.A03());
    }

    public static AdSize A01(EnumC2265nx enumC2265nx) {
        for (Map.Entry<EnumC2264nw, EnumC2265nx> entry : A02.entrySet()) {
            if (entry.getValue() == enumC2265nx) {
                return A00(entry.getKey());
            }
        }
        AdSize adSize = AdSize.BANNER_320_50;
        if (A01[2].charAt(13) != 'L') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[3] = "8yxIcOBY3dyXYw8tx9RnPYEelWv3PiEU";
        strArr[5] = "RuT7gwLbx9UlwnZGushHq4GsGVsr9kdh";
        return adSize;
    }

    public static EnumC2264nw A02(int i5) {
        switch (i5) {
            case 4:
                return EnumC2264nw.A04;
            case 5:
                return EnumC2264nw.A05;
            case 6:
                return EnumC2264nw.A06;
            case 7:
                return EnumC2264nw.A08;
            case 100:
                return EnumC2264nw.A07;
            default:
                throw new IllegalArgumentException(A06(48, 20, 63));
        }
    }

    public static EnumC2264nw A03(int i5, int i11) {
        if (EnumC2264nw.A07.A03() == i11 && EnumC2264nw.A07.A04() == i5) {
            EnumC2264nw enumC2264nw = EnumC2264nw.A07;
            if (A01[2].charAt(13) != 'L') {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[4] = "oPyqycdUDaMLkpnFUSD1lOVVut5Ak4ux";
            strArr[6] = "t44MnsVi8idfM7jbHI01veBsrnLqKP4H";
            return enumC2264nw;
        }
        if (EnumC2264nw.A04.A03() == i11 && EnumC2264nw.A04.A04() == i5) {
            return EnumC2264nw.A04;
        }
        if (EnumC2264nw.A05.A03() == i11 && EnumC2264nw.A05.A04() == i5) {
            EnumC2264nw enumC2264nw2 = EnumC2264nw.A05;
            if (A01[1].charAt(1) == 'd') {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[4] = "zTuOoFSTcjvo6siKnZ91TQqR6FN8Kxgy";
            strArr2[6] = "bIxUq8CGRMwo1zGvdui1T5X5wsDAfXTH";
            return enumC2264nw2;
        }
        if (EnumC2264nw.A06.A03() == i11 && EnumC2264nw.A06.A04() == i5) {
            return EnumC2264nw.A06;
        }
        if (EnumC2264nw.A08.A03() == i11 && EnumC2264nw.A08.A04() == i5) {
            return EnumC2264nw.A08;
        }
        throw new IllegalArgumentException(A06(0, 48, 39));
    }

    public static EnumC2264nw A04(AdSize adSize) {
        return A03(adSize.getWidth(), adSize.getHeight());
    }

    public static EnumC2265nx A05(EnumC2264nw enumC2264nw) {
        EnumC2265nx adTemplate = A02.get(enumC2264nw);
        if (adTemplate == null) {
            EnumC2265nx enumC2265nx = EnumC2265nx.A0F;
            if (A01[1].charAt(1) == 'd') {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[3] = "UG6JCyDXDBzWMb76AfK0hQ3l3bgkgswO";
            strArr[5] = "9YhmwLNWXnVy8pTRO5fFllqJZ4ALiPvn";
            return enumC2265nx;
        }
        return adTemplate;
    }
}
