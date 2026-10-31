package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.androidx.support.v7.widget.RecyclerView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.is, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1956is {
    public static byte[] A06;
    public static String[] A07 = {"wCFFy4v0UHolBGzubHhtaTK0KlaK5TU8", "WXL", "veTi", "n3", "rW28yUWMMTgiQlEcIz6smwE3e87Fn5Ax", "QU5acghFPGL2KQJts4swUt9W5A9MK8iM", "qIZlYUWuFA6tmX766BSANKSPkXlWbMWT", "RhPzJuizv3JTUr3AZhw4zLdz5ZpO"};
    public InterfaceC1954iq A04 = null;
    public ArrayList<RecyclerView.ItemAnimator.ItemAnimatorFinishedListener> A05 = new ArrayList<>();
    public long A00 = 120;
    public long A03 = 120;
    public long A02 = 250;
    public long A01 = 250;

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 42);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A06 = new byte[]{85, 84, 123, 84, 83, 87, 91, 78, 83, 85, 84, 73, 124, 83, 84, 83, 73, 82, 95, 94};
    }

    public abstract void A0H();

    public abstract void A0I();

    public abstract void A0L(AbstractC1978jE abstractC1978jE);

    public abstract boolean A0M();

    public abstract boolean A0N(AbstractC1978jE abstractC1978jE);

    public abstract boolean A0O(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2);

    public abstract boolean A0P(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2);

    public abstract boolean A0Q(AbstractC1978jE abstractC1978jE, C1955ir c1955ir, C1955ir c1955ir2);

    public abstract boolean A0R(AbstractC1978jE abstractC1978jE, AbstractC1978jE abstractC1978jE2, C1955ir c1955ir, C1955ir c1955ir2);

    static {
        A09();
    }

    public static int A06(AbstractC1978jE abstractC1978jE) {
        int i5 = abstractC1978jE.A0C & 14;
        if (abstractC1978jE.A0m()) {
            return 4;
        }
        int flags = i5 & 4;
        if (flags == 0) {
            int iA0U = abstractC1978jE.A0U();
            int iA0R = abstractC1978jE.A0R();
            String[] strArr = A07;
            String str = strArr[3];
            String str2 = strArr[1];
            int oldPos = str.length();
            int flags2 = str2.length();
            if (oldPos == flags2) {
                throw new RuntimeException();
            }
            A07[0] = "z6mPnscAmNwlAliMzxZ9cFQDVALsWjfG";
            if (iA0U != -1 && iA0R != -1 && iA0U != iA0R) {
                return i5 | 2048;
            }
            return i5;
        }
        return i5;
    }

    private final C1955ir A07() {
        return new C1955ir();
    }

    public final long A0A() {
        return this.A00;
    }

    public final long A0B() {
        return this.A01;
    }

    public final long A0C() {
        return this.A02;
    }

    public final long A0D() {
        return this.A03;
    }

    public final C1955ir A0E(C1975jB c1975jB, AbstractC1978jE abstractC1978jE) {
        return A07().A01(abstractC1978jE);
    }

    public final C1955ir A0F(C1975jB c1975jB, AbstractC1978jE abstractC1978jE, int i5, List<Object> payloads) {
        return A07().A01(abstractC1978jE);
    }

    public final void A0G() {
        int count = this.A05.size();
        if (0 < count) {
            this.A05.get(0);
            throw new NullPointerException(A08(0, 20, 16));
        }
        this.A05.clear();
    }

    public final void A0J(InterfaceC1954iq interfaceC1954iq) {
        this.A04 = interfaceC1954iq;
    }

    public final void A0K(AbstractC1978jE abstractC1978jE) {
        if (this.A04 != null) {
            this.A04.ADr(abstractC1978jE);
        }
    }

    public boolean A0S(AbstractC1978jE abstractC1978jE, List<Object> payloads) {
        return A0N(abstractC1978jE);
    }
}
