package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.view.View;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ig, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1944ig {
    public static byte[] A03;
    public int A00;
    public final Rect A01;
    public final AbstractC1960iw A02;

    static {
        A04();
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 54);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A03 = new byte[]{84, 83, 75, 92, 81, 84, 89, 29, 82, 79, 84, 88, 83, 73, 92, 73, 84, 82, 83};
    }

    public abstract int A06();

    public abstract int A07();

    public abstract int A08();

    public abstract int A09();

    public abstract int A0A();

    public abstract int A0B();

    public abstract int A0C();

    public abstract int A0D(View view);

    public abstract int A0E(View view);

    public abstract int A0F(View view);

    public abstract int A0G(View view);

    public abstract int A0H(View view);

    public abstract int A0I(View view);

    public abstract void A0K(int i5);

    public AbstractC1944ig(AbstractC1960iw abstractC1960iw) {
        this.A00 = Integer.MIN_VALUE;
        this.A01 = new Rect();
        this.A02 = abstractC1960iw;
    }

    public /* synthetic */ AbstractC1944ig(AbstractC1960iw abstractC1960iw, J4 j42) {
        this(abstractC1960iw);
    }

    public static J4 A00(AbstractC1960iw abstractC1960iw) {
        return new J4(abstractC1960iw);
    }

    public static J3 A01(AbstractC1960iw abstractC1960iw) {
        return new J3(abstractC1960iw);
    }

    public static AbstractC1944ig A02(AbstractC1960iw abstractC1960iw, int i5) {
        switch (i5) {
            case 0:
                return A00(abstractC1960iw);
            case 1:
                return A01(abstractC1960iw);
            default:
                throw new IllegalArgumentException(A03(0, 19, 11));
        }
    }

    public final int A05() {
        if (Integer.MIN_VALUE == this.A00) {
            return 0;
        }
        return A0C() - this.A00;
    }

    public final void A0J() {
        this.A00 = A0C();
    }
}
