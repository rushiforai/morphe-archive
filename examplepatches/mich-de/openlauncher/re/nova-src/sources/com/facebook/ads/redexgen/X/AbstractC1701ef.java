package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ef, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1701ef {
    public static byte[] A04;
    public static String[] A05 = {"1rpqzMoQPEd3EHTy", "IijlYjxUhlQ6PevMfYRhYV7WfLROcFkT", "dB1UvEzmowJDDyIJQtC", "Y16LfJ4", "bBkzI77rkxWR3W5jJ6r", "5uBInXd6C4n2aG1XSy1EsoMIhhWhzvVD", "qxy12m4DqJTCc2OP", "vMu6B29f41r3aRkKMkBlS2SukisJI3wS"};
    public InterfaceC1699ed A00;
    public final C0958Hi A01;
    public final InterfaceC2224nG A02;
    public final String A03;

    public static String A0D(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 4);
            if (A05[3].length() != 7) {
                throw new RuntimeException();
            }
            String[] strArr = A05;
            strArr[0] = "aufIPJgKJ4HaFI8w";
            strArr[6] = "trPirB4HX7kF0W7G";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0F() {
        A04 = new byte[]{-126, -111, -111, -128, -126, -123, -38, -41, -36, -39, -51, -47, -38, -41, -47, -39, -128, 106, 125, 108, 113, 104, 106, 119, 109, 104, 107, 123, 120, -128, 124, 110};
    }

    public abstract EnumC1698ec A0G(String str);

    static {
        A0F();
    }

    public AbstractC1701ef(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, String str) {
        this.A01 = c0958Hi;
        this.A02 = interfaceC2224nG;
        this.A03 = str;
    }

    public static String A0C() {
        return A0D(16, 16, 5);
    }

    public static String A0E(AbstractC1701ef abstractC1701ef) {
        if (abstractC1701ef instanceof C07287u) {
            return A0D(6, 10, 106);
        }
        return A0D(0, 6, 29);
    }

    public final InterfaceC1699ed A0H() {
        return this.A00;
    }

    public final void A0I(InterfaceC1699ed interfaceC1699ed) {
        this.A00 = interfaceC1699ed;
    }
}
