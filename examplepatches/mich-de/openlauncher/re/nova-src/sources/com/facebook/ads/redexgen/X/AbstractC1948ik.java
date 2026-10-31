package com.facebook.ads.redexgen.X;

import android.view.ViewGroup;
import com.facebook.ads.redexgen.X.AbstractC1978jE;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.ik, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1948ik<VH extends AbstractC1978jE> {
    public static byte[] A02;
    public static String[] A03 = {"W324oDAhe3QD27ZyNAxx1dE4409WhTwA", "Ikg10MzvREcGgl38", "tAS262iMJzRr57vvpxPoG7SYxewns3xN", "rCt", "3uu7", "cbDGC8uMMSmc1mSYy17nilWnTwttZfvA", "2T", "U5f6pdP97"};
    public final C1949il A01 = new C1949il();
    public boolean A00 = false;

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A03[2].charAt(21) != '7') {
                throw new RuntimeException();
            }
            String[] strArr = A03;
            strArr[1] = "WHsKZN6zyncpMK6d";
            strArr[4] = "wlW4";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 32);
            i13++;
        }
    }

    public static void A09() {
        A02 = new byte[]{-48, -44, -98, -63, -16, -29, -33, -14, -29, -44, -25, -29, -11, -54, -50, -104, -57, -26, -70, -31, -26, -36, -50, -31, -35, -17};
    }

    public abstract int A0B();

    public abstract VH A0F(ViewGroup viewGroup, int i5);

    public abstract void A0M(VH vh2, int i5);

    static {
        A09();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    private final void A0A(VH holder, int i5, List<Object> payloads) {
        A0M(holder, i5);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public int A0C(int i5) {
        return 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public final long A0D(int i5) {
        return -1L;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public final VH A0E(ViewGroup viewGroup, int i5) {
        AbstractC1842gy.A01(A08(0, 13, 94));
        VH vh2 = (VH) A0F(viewGroup, i5);
        vh2.A00 = i5;
        AbstractC1842gy.A00();
        return vh2;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public final void A0G() {
        this.A01.A00();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public final void A0H(int i5) {
        this.A01.A01(i5, 1);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public final void A0I(AbstractC1950im abstractC1950im) {
        this.A01.registerObserver(abstractC1950im);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public final void A0J(AbstractC1950im abstractC1950im) {
        this.A01.unregisterObserver(abstractC1950im);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public void A0K(VH holder) {
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0L(VH vh2, int i5) {
        ViewGroup.LayoutParams layoutParams;
        String[] strArr;
        vh2.A03 = i5;
        if (A0O()) {
            long jA0D = A0D(i5);
            String[] strArr2 = A03;
            if (strArr2[7].length() != strArr2[6].length()) {
                String[] strArr3 = A03;
                strArr3[7] = "OgtetI94x";
                strArr3[6] = "QU";
                vh2.A05 = jA0D;
                vh2.A0f(1, 519);
                AbstractC1842gy.A01(A08(13, 13, 88));
                A0A(vh2, i5, vh2.A0W());
                vh2.A0Y();
                layoutParams = vh2.A0H.getLayoutParams();
                if (layoutParams instanceof C1961ix) {
                    ((C1961ix) layoutParams).A01 = true;
                }
                AbstractC1842gy.A00();
                strArr = A03;
                if (strArr[5].charAt(31) == strArr[0].charAt(31)) {
                    String[] strArr4 = A03;
                    strArr4[7] = "GQKIQ0ZEK";
                    strArr4[6] = "Zf";
                    return;
                }
            }
        } else {
            vh2.A0f(1, 519);
            AbstractC1842gy.A01(A08(13, 13, 88));
            A0A(vh2, i5, vh2.A0W());
            vh2.A0Y();
            layoutParams = vh2.A0H.getLayoutParams();
            if (layoutParams instanceof C1961ix) {
            }
            AbstractC1842gy.A00();
            strArr = A03;
            if (strArr[5].charAt(31) == strArr[0].charAt(31)) {
            }
        }
        throw new RuntimeException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public void A0N(C7O c7o) {
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public final boolean A0O() {
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.ik != com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView$Adapter<VH extends com.facebook.ads.redexgen.X.jE> */
    public final boolean A0P(VH holder) {
        return false;
    }
}
