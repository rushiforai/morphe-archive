package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.b6, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1481b6 {
    A05(true, false),
    A06(true, true);

    public static byte[] A02;
    public static String[] A03 = {"O", "EV50HHvcjD7YLIyebT4WEIV5yebebm0n", "F", "5eKOX", "rITyk", "abzOrFl3CNxf2rC8XtUXLAElYVzjlriN", "oaymDZ7pAEcbNFhv7Y0pKv8En2RbSAw", "1P4e8Svw6pgZkfS1AU7Ku11MIWhAZ0aY"};
    public boolean A00;
    public boolean A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 69);
            if (A03[6].length() != 31) {
                throw new RuntimeException();
            }
            A03[1] = "x5tPmx47tzICoGkmwmxxU8TFYjneGYu3";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{4, 2, 17, -56, -57, -53, -52};
    }

    static {
        A01();
    }

    EnumC1481b6(boolean z11, boolean z12) {
        this.A00 = z11;
        this.A01 = z12;
    }

    public final String A03() {
        return toString();
    }

    public final boolean A04() {
        return this.A00;
    }

    public final boolean A05() {
        return this.A01;
    }
}
