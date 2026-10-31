package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.widget.Scroller;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class IY extends AbstractC1963iz {
    public static byte[] A03;
    public static String[] A04 = {"WP5CpU5dCfM1vj2iCgRczyLeS833jqA7", "f0t6mABNpir4NiI1IJBR", "VMSqLwjWc3fXvu7D9B7JwatTJSWiKmSt", "2kGOlvpEajHcc9JJ5BV7kSrV8Uhb9VDh", "BGGgbgkg4NpzKA2XjpG6Q8iHB2GG9zH0", "ziOTckvigWpUqNYWulExTvMWDfbzI1Sq", "WkLWBkQ13lLgYVln8HDaQ7gYbGPRUWfj", "hZJ2tRP2pGaevCKAXmW2Fr9GhnOGACBf"};
    public C7O A00;
    public Scroller A01;
    public final AbstractC1965j1 A02 = new IZ(this);

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 53);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        byte[] bArr = {-35, 10, -68, 5, 10, 15, 16, -3, 10, -1, 1, -68, 11, 2, -68, -21, 10, -30, 8, 5, 10, 3, -24, 5, 15, 16, 1, 10, 1, 14, -68, -3, 8, 14, 1, -3, 0, 21, -68, 15, 1, 16, -54};
        if (A04[2].length() != 32) {
            throw new RuntimeException();
        }
        String[] strArr = A04;
        strArr[3] = "Gfsvb5V6ZkZ1EjPhJmDEOg0wCX37AMGK";
        strArr[5] = "BogmwpJuEiSgKohE6B9VLJKkNQC2pxlX";
        A03 = bArr;
    }

    public abstract int A0C(AbstractC1960iw abstractC1960iw, int i5, int i11);

    public abstract View A0D(AbstractC1960iw abstractC1960iw);

    @Deprecated
    public abstract J5 A0E(AbstractC1960iw abstractC1960iw);

    public abstract int[] A0H(AbstractC1960iw abstractC1960iw, View view);

    static {
        A09();
    }

    private final J5 A05(AbstractC1960iw abstractC1960iw) {
        return A0E(abstractC1960iw);
    }

    private void A07() {
        this.A00.A1p(this.A02);
        this.A00.setOnFlingListener(null);
    }

    private void A08() throws IllegalStateException {
        if (this.A00.getOnFlingListener() == null) {
            this.A00.A1o(this.A02);
            this.A00.setOnFlingListener(this);
            return;
        }
        throw new IllegalStateException(A06(0, 43, 103));
    }

    private boolean A0A(AbstractC1960iw abstractC1960iw, int i5, int i11) {
        J5 j5A05;
        if (!(abstractC1960iw instanceof InterfaceC1972j8) || (j5A05 = A05(abstractC1960iw)) == null) {
            return false;
        }
        int iA0C = A0C(abstractC1960iw, i5, i11);
        String[] strArr = A04;
        if (strArr[0].charAt(25) == strArr[7].charAt(25)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A04;
        strArr2[0] = "3QNQgzU1MIdfo8xP0zEWa1SfaSPVi8u7";
        strArr2[7] = "BhxrOivCOMjMD1hwED78TbVHZR3oyoMb";
        if (iA0C == -1) {
            return false;
        }
        j5A05.A0H(iA0C);
        abstractC1960iw.A2c(j5A05);
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1963iz
    public final boolean A0B(int i5, int i11) {
        AbstractC1960iw layoutManager = this.A00.getLayoutManager();
        if (layoutManager == null || this.A00.getAdapter() == null) {
            return false;
        }
        int minFlingVelocity = this.A00.getMinFlingVelocity();
        return (Math.abs(i11) > minFlingVelocity || Math.abs(i5) > minFlingVelocity) && A0A(layoutManager, i5, i11);
    }

    public final void A0F() {
        AbstractC1960iw layoutManager;
        View viewA0D;
        if (this.A00 == null || (layoutManager = this.A00.getLayoutManager()) == null || (viewA0D = A0D(layoutManager)) == null) {
            return;
        }
        int[] iArrA0H = A0H(layoutManager, viewA0D);
        if (iArrA0H[0] != 0 || iArrA0H[1] != 0) {
            this.A00.A1i(iArrA0H[0], iArrA0H[1]);
        }
    }

    public final void A0G(C7O c7o) throws IllegalStateException {
        if (this.A00 == c7o) {
            return;
        }
        if (this.A00 != null) {
            A07();
        }
        this.A00 = c7o;
        if (this.A00 != null) {
            A08();
            this.A01 = new Scroller(this.A00.getContext(), new DecelerateInterpolator());
            A0F();
        }
    }
}
