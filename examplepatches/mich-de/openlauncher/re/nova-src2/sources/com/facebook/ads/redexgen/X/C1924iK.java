package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.iK, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1924iK {
    public static byte[] A03;
    public static String[] A04 = {"QoGKHhEqLDc7cPbroRD", "LQzzwNJ4o6QHlfYkxXGOUA5ejYw8qpDj", "6ipC3ASGLl4rMOedI", "OPBJh0aCf", "l4bQelOwEyQeTpTSi", "DWBJmVB67PV4ItRyT2e9caL16z1NK91I", "0G1mJvoVA", "nRnK55wdJbrp31Rh0MWe0TNMbF4aeg8Y"};
    public final InterfaceC1923iJ A01;
    public final C1922iI A00 = new C1922iI();
    public final List<View> A02 = new ArrayList();

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 78);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        if (A04[5].charAt(2) != 'B') {
            throw new RuntimeException();
        }
        A04[1] = "YzFnrN17WwgSKMGcQI3u7PJ5Pdf81qGi";
        A03 = new byte[]{-81, -93, -21, -20, -25, -25, -24, -15, -93, -17, -20, -10, -9, -67, -23, -25, -18, -34, -29, -36, -107, -23, -28, -107, -22, -29, -35, -34, -39, -38, -107, -42, -107, -21, -34, -38, -20, -107, -23, -35, -42, -23, -107, -20, -42, -24, -107, -29, -28, -23, -107, -35, -34, -39, -39, -38, -29, -35, -48, -52, -34, -121, -48, -38, -121, -43, -42, -37, -121, -56, -121, -54, -49, -48, -45, -53, -109, -121, -54, -56, -43, -43, -42, -37, -121, -49, -48, -53, -52, -121};
    }

    static {
        A02();
    }

    public C1924iK(InterfaceC1923iJ interfaceC1923iJ) {
        this.A01 = interfaceC1923iJ;
    }

    private int A00(int i5) {
        if (i5 < 0) {
            return -1;
        }
        int offset = this.A01.A7t();
        int limit = i5;
        while (limit < offset) {
            int iA03 = i5 - (limit - this.A00.A03(limit));
            if (iA03 == 0) {
                while (this.A00.A08(limit)) {
                    limit++;
                }
                return limit;
            }
            limit += iA03;
        }
        return -1;
    }

    private void A03(View view) {
        this.A02.add(view);
        this.A01.AEq(view);
    }

    private boolean A04(View view) {
        if (this.A02.remove(view)) {
            this.A01.AFd(view);
            return true;
        }
        return false;
    }

    public final int A05() {
        return this.A01.A7t() - this.A02.size();
    }

    public final int A06() {
        return this.A01.A7t();
    }

    public final int A07(View view) {
        int iAAl = this.A01.AAl(view);
        if (iAAl == -1 || this.A00.A08(iAAl)) {
            return -1;
        }
        int index = this.A00.A03(iAAl);
        return iAAl - index;
    }

    public final View A08(int i5) {
        int size = this.A02.size();
        for (int i11 = 0; i11 < size; i11++) {
            View view = this.A02.get(i11);
            AbstractC1978jE abstractC1978jEA7w = this.A01.A7w(view);
            int count = abstractC1978jEA7w.A0T();
            if (count == i5 && !abstractC1978jEA7w.A0m() && !abstractC1978jEA7w.A0n()) {
                return view;
            }
        }
        return null;
    }

    public final View A09(int i5) {
        return this.A01.A7s(A00(i5));
    }

    public final View A0A(int i5) {
        return this.A01.A7s(i5);
    }

    public final void A0B() {
        this.A00.A04();
        for (int size = this.A02.size() - 1; size >= 0; size--) {
            this.A01.AFd(this.A02.get(size));
            this.A02.remove(size);
        }
        this.A01.AJh();
    }

    public final void A0C(int i5) {
        int iA00 = A00(i5);
        this.A00.A09(iA00);
        this.A01.A6V(iA00);
    }

    public final void A0D(int i5) {
        int iA00 = A00(i5);
        View view = this.A01.A7s(iA00);
        if (view == null) {
            return;
        }
        if (this.A00.A09(iA00)) {
            A04(view);
        }
        this.A01.AJn(iA00);
        if (A04[4].length() == 16) {
            throw new RuntimeException();
        }
        A04[7] = "KJlsfCUfVwwQNNRDjM0AzdkkAy1m1QjD";
    }

    public final void A0E(View view) {
        int iAAl = this.A01.AAl(view);
        if (iAAl >= 0) {
            this.A00.A06(iAAl);
            A03(view);
            return;
        }
        throw new IllegalArgumentException(A01(57, 33, 25) + view);
    }

    public final void A0F(View view) {
        int iAAl = this.A01.AAl(view);
        if (iAAl < 0) {
            return;
        }
        if (this.A00.A09(iAAl)) {
            A04(view);
        }
        this.A01.AJn(iAAl);
    }

    public final void A0G(View view) {
        int iAAl = this.A01.AAl(view);
        if (iAAl >= 0) {
            if (this.A00.A08(iAAl)) {
                this.A00.A05(iAAl);
                A04(view);
                return;
            }
            throw new RuntimeException(A01(14, 43, 39) + view);
        }
        throw new IllegalArgumentException(A01(57, 33, 25) + view);
    }

    public final void A0H(View view, int i5, ViewGroup.LayoutParams layoutParams, boolean z11) {
        int iA00;
        if (i5 < 0) {
            iA00 = this.A01.A7t();
        } else {
            iA00 = A00(i5);
        }
        C1922iI c1922iI = this.A00;
        if (A04[5].charAt(2) != 'B') {
            throw new RuntimeException();
        }
        A04[1] = "KHr0McsaN13zWmBdzhmfm62h5mt8zSB0";
        c1922iI.A07(iA00, z11);
        if (z11) {
            A03(view);
        }
        this.A01.A4l(view, iA00, layoutParams);
    }

    public final void A0I(View view, int i5, boolean z11) {
        int iA00;
        if (i5 < 0) {
            iA00 = this.A01.A7t();
        } else {
            iA00 = A00(i5);
        }
        this.A00.A07(iA00, z11);
        if (z11) {
            A03(view);
        }
        this.A01.addView(view, iA00);
    }

    public final void A0J(View view, boolean z11) {
        A0I(view, -1, z11);
    }

    public final boolean A0K(View view) {
        return this.A02.contains(view);
    }

    public final boolean A0L(View view) {
        int iAAl = this.A01.AAl(view);
        if (iAAl == -1) {
            A04(view);
            if (A04[5].charAt(2) != 'B') {
                throw new RuntimeException();
            }
            A04[0] = "HipCYWSrBpzIS13Odtj";
            return true;
        }
        if (this.A00.A08(iAAl)) {
            this.A00.A09(iAAl);
            A04(view);
            this.A01.AJn(iAAl);
            return true;
        }
        return false;
    }

    public final String toString() {
        return this.A00.toString() + A01(0, 14, 53) + this.A02.size();
    }
}
