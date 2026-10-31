package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Qx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1189Qx implements InterfaceC1327Wm {
    public int A00;
    public int A01;
    public int A02;
    public C1325Wk[] A03;
    public final int A04;
    public final boolean A05;
    public final byte[] A06;

    public C1189Qx(boolean z11, int i5) {
        this(z11, i5, 0);
    }

    public C1189Qx(boolean z11, int i5, int i11) {
        AbstractC1062Ln.A07(i5 > 0);
        AbstractC1062Ln.A07(i11 >= 0);
        this.A05 = z11;
        this.A04 = i5;
        this.A01 = i11;
        this.A03 = new C1325Wk[i11 + 100];
        if (i11 > 0) {
            this.A06 = new byte[i11 * i5];
            for (int i12 = 0; i12 < i11; i12++) {
                this.A03[i12] = new C1325Wk(this.A06, i12 * i5);
            }
            return;
        }
        this.A06 = null;
    }

    public final synchronized int A00() {
        return this.A00 * this.A04;
    }

    public final synchronized void A01() {
        if (this.A05) {
            A02(0);
        }
    }

    public final synchronized void A02(int i5) {
        boolean targetBufferSizeReduced = i5 < this.A02;
        this.A02 = i5;
        if (targetBufferSizeReduced) {
            ALn();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1327Wm
    public final synchronized C1325Wk A4Z() {
        C1325Wk c1325Wk;
        this.A00++;
        if (this.A01 > 0) {
            C1325Wk[] c1325WkArr = this.A03;
            int i5 = this.A01 - 1;
            this.A01 = i5;
            c1325Wk = (C1325Wk) AbstractC1062Ln.A01(c1325WkArr[i5]);
            this.A03[this.A01] = null;
        } else {
            c1325Wk = new C1325Wk(new byte[this.A04], 0);
            if (this.A00 > this.A03.length) {
                this.A03 = (C1325Wk[]) Arrays.copyOf(this.A03, this.A03.length * 2);
            }
        }
        return c1325Wk;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1327Wm
    public final int A8u() {
        return this.A04;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1327Wm
    public final synchronized void AIr(C1325Wk c1325Wk) {
        C1325Wk[] c1325WkArr = this.A03;
        int i5 = this.A01;
        this.A01 = i5 + 1;
        c1325WkArr[i5] = c1325Wk;
        this.A00--;
        notifyAll();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1327Wm
    public final synchronized void AIs(InterfaceC1326Wl interfaceC1326Wl) {
        while (interfaceC1326Wl != null) {
            C1325Wk[] c1325WkArr = this.A03;
            int i5 = this.A01;
            this.A01 = i5 + 1;
            c1325WkArr[i5] = interfaceC1326Wl.A7U();
            this.A00--;
            interfaceC1326Wl = interfaceC1326Wl.ADT();
        }
        notifyAll();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1327Wm
    public final synchronized void ALn() {
        int iA05 = N1.A05(this.A02, this.A04);
        int targetAllocationCount = this.A00;
        int iMax = Math.max(0, iA05 - targetAllocationCount);
        int targetAllocationCount2 = this.A01;
        if (iMax >= targetAllocationCount2) {
            return;
        }
        if (this.A06 != null) {
            int lowIndex = 0;
            int targetAllocationCount3 = this.A01;
            int highIndex = targetAllocationCount3 - 1;
            while (lowIndex <= highIndex) {
                C1325Wk highAllocation = (C1325Wk) AbstractC1062Ln.A01(this.A03[lowIndex]);
                if (highAllocation.A01 == this.A06) {
                    lowIndex++;
                } else {
                    C1325Wk lowAllocation = (C1325Wk) AbstractC1062Ln.A01(this.A03[highIndex]);
                    if (lowAllocation.A01 != this.A06) {
                        highIndex--;
                    } else {
                        this.A03[lowIndex] = lowAllocation;
                        int targetAllocationCount4 = highIndex - 1;
                        this.A03[highIndex] = highAllocation;
                        highIndex = targetAllocationCount4;
                        lowIndex++;
                    }
                }
            }
            iMax = Math.max(iMax, lowIndex);
            int targetAllocationCount5 = this.A01;
            if (iMax >= targetAllocationCount5) {
                return;
            }
        }
        C1325Wk[] c1325WkArr = this.A03;
        int targetAvailableCount = this.A01;
        Arrays.fill(c1325WkArr, iMax, targetAvailableCount, (Object) null);
        this.A01 = iMax;
    }
}
