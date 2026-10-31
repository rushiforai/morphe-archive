package com.facebook.ads.redexgen.X;

import android.util.Pair;
import com.facebook.ads.androidx.media3.common.Timeline;

/* loaded from: assets/audience_network/classes.dex */
public final class P3 {
    public static String[] A0B = {"GnEroV9tf25Q74Q4AIL815Rx44kgHmvG", "P063YvyLaUd0U", "1FPz0jD6XCd9GEIx4t71guCP2wVgzCU9", "QppZ1G", "WD4Rw8prweBW9nCmOnoOZ9eITxQmD", "TAEnBdP9yWi256YM1FToN", "eMROy8fWhWETrw9YRXGKpKUkohzw49Ix", "FZX8WufoEexGN39WNk9SO4rP"};
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public C1151Oz A04;
    public C1151Oz A05;
    public C1151Oz A06;
    public Object A07;
    public boolean A08;
    public final UM A09 = new UM();
    public final UK A0A = new UK();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static C1202Rk A06(Timeline timeline, Object obj, long j11, long j12, UM um2) {
        timeline.A0J(obj, um2);
        int iA08 = um2.A08(j11);
        return iA08 == -1 ? new C1202Rk(obj, j12) : new C1202Rk(obj, iA08, um2.A05(iA08), j12);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final P0 A0I(Timeline timeline, P0 p02) {
        long jA0A;
        long j11 = p02.A01;
        boolean zA08 = A08(timeline, p02.A04, j11);
        boolean zA09 = A09(timeline, p02.A04, zA08);
        timeline.A0J(p02.A04.A04, this.A09);
        if (p02.A04.A00()) {
            jA0A = this.A09.A0E(p02.A04.A00, p02.A04.A01);
        } else if (j11 == Long.MIN_VALUE) {
            jA0A = this.A09.A0A();
            if (A0B[6].charAt(21) == 'n') {
                throw new RuntimeException();
            }
            A0B[3] = "zmmIrK";
        } else {
            jA0A = j11;
        }
        return new P0(p02.A04, p02.A03, j11, p02.A02, jA0A, zA08, zA09);
    }

    private long A00(Timeline timeline, Object obj) {
        int oldFrontPeriodIndex;
        int holderWindowIndex = timeline.A0J(obj, this.A09).A00;
        if (this.A07 != null && (oldFrontPeriodIndex = timeline.A0A(this.A07)) != -1) {
            int windowIndex = timeline.A0H(oldFrontPeriodIndex, this.A09).A00;
            if (windowIndex == holderWindowIndex) {
                return this.A03;
            }
        }
        for (C1151Oz mediaPeriodHolder = A0D(); mediaPeriodHolder != null; mediaPeriodHolder = mediaPeriodHolder.A0I()) {
            if (mediaPeriodHolder.A08.equals(obj)) {
                return mediaPeriodHolder.A00.A04.A03;
            }
        }
        for (C1151Oz c1151OzA0D = A0D(); c1151OzA0D != null; c1151OzA0D = c1151OzA0D.A0I()) {
            int iA0A = timeline.A0A(c1151OzA0D.A08);
            if (iA0A != -1) {
                int windowIndex2 = timeline.A0H(iA0A, this.A09).A00;
                if (windowIndex2 == holderWindowIndex) {
                    return c1151OzA0D.A00.A04.A03;
                }
            }
        }
        long j11 = this.A02;
        this.A02 = 1 + j11;
        return j11;
    }

    private P0 A01(Timeline timeline, C1151Oz c1151Oz, long j11) {
        long jLongValue;
        P3 p32 = this;
        P0 p02 = c1151Oz.A00;
        if (p02.A07) {
            int iA09 = timeline.A09(timeline.A0A(p02.A04.A04), p32.A09, p32.A0A, p32.A01, p32.A08);
            if (iA09 == -1) {
                return null;
            }
            int nextPeriodIndex = timeline.A0I(iA09, p32.A09, true).A00;
            Object obj = p32.A09.A04;
            long j12 = p02.A04.A03;
            if (timeline.A0K(nextPeriodIndex, p32.A0A).A00 == iA09) {
                Pair<Object, Long> defaultPosition = timeline.A0F(p32.A0A, p32.A09, nextPeriodIndex, -9223372036854775807L, Math.max(0L, (c1151Oz.A0B() + p02.A00) - j11));
                if (defaultPosition == null) {
                    return null;
                }
                obj = defaultPosition.first;
                jLongValue = ((Long) defaultPosition.second).longValue();
                C1151Oz nextMediaPeriodHolder = c1151Oz.A0I();
                if (A0B[3].length() == 6) {
                    A0B[1] = "EUsp1qGPNfBUG";
                    if (nextMediaPeriodHolder != null && nextMediaPeriodHolder.A08.equals(obj)) {
                        j12 = nextMediaPeriodHolder.A00.A04.A03;
                        p32 = this;
                    } else {
                        p32 = this;
                        j12 = p32.A02;
                        long startPositionUs = 1 + j12;
                        p32.A02 = startPositionUs;
                    }
                }
            } else {
                jLongValue = 0;
            }
            return A02(timeline, A06(timeline, obj, jLongValue, j12, p32.A09), jLongValue, jLongValue);
        }
        C1202Rk c1202Rk = p02.A04;
        timeline.A0J(c1202Rk.A04, p32.A09);
        if (c1202Rk.A00()) {
            int i5 = c1202Rk.A00;
            int iA04 = p32.A09.A04(i5);
            if (iA04 == -1) {
                return null;
            }
            int adGroupIndex = p32.A09.A06(i5, c1202Rk.A01);
            if (adGroupIndex < iA04) {
                if (!p32.A09.A0I(i5, adGroupIndex)) {
                    return null;
                }
                return A03(timeline, c1202Rk.A04, i5, adGroupIndex, p02.A02, c1202Rk.A03);
            }
            return A04(timeline, c1202Rk.A04, p02.A02, c1202Rk.A03);
        }
        long j13 = p02.A01;
        if (A0B[0].charAt(22) != 'b') {
            A0B[5] = "J1GWsAdRIVS2ayMBQJ";
            if (j13 != Long.MIN_VALUE) {
                int iA08 = p32.A09.A08(p02.A01);
                if (iA08 == -1) {
                    return A04(timeline, c1202Rk.A04, p02.A01, c1202Rk.A03);
                }
                int nextAdGroupIndex = p32.A09.A05(iA08);
                UM um2 = p32.A09;
                if (A0B[0].charAt(22) == 'b') {
                    throw new RuntimeException();
                }
                A0B[5] = "uhXbdG";
                if (!um2.A0I(iA08, nextAdGroupIndex)) {
                    return null;
                }
                Object obj2 = c1202Rk.A04;
                long j14 = p02.A01;
                String[] strArr = A0B;
                if (strArr[7].length() != strArr[4].length()) {
                    String[] strArr2 = A0B;
                    strArr2[7] = "Lcz6O6fEnk1Q5jWM2W5E02Xu";
                    strArr2[4] = "tfP1uCtFNo7pxKOt8bVF0piC6TJYH";
                    return A03(timeline, obj2, iA08, nextAdGroupIndex, j14, c1202Rk.A03);
                }
            } else {
                int iA03 = p32.A09.A03();
                if (iA03 == 0) {
                    return null;
                }
                int i11 = iA03 - 1;
                UM um3 = p32.A09;
                if (A0B[5].length() == 7) {
                    throw new RuntimeException();
                }
                A0B[3] = "CbLoUs";
                if (um3.A0D(i11) != Long.MIN_VALUE || p32.A09.A0H(i11)) {
                    return null;
                }
                int adGroupCount = p32.A09.A05(i11);
                if (!p32.A09.A0I(i11, adGroupCount)) {
                    return null;
                }
                return A03(timeline, c1202Rk.A04, i11, adGroupCount, p32.A09.A0A(), c1202Rk.A03);
            }
        }
        throw new RuntimeException();
    }

    private P0 A02(Timeline timeline, C1202Rk c1202Rk, long j11, long j12) {
        timeline.A0J(c1202Rk.A04, this.A09);
        if (c1202Rk.A00()) {
            UM um2 = this.A09;
            int i5 = c1202Rk.A00;
            if (A0B[2].charAt(26) == 'F') {
                throw new RuntimeException();
            }
            A0B[1] = "ItczLf1d2nJIc";
            if (!um2.A0I(i5, c1202Rk.A01)) {
                return null;
            }
            return A03(timeline, c1202Rk.A04, c1202Rk.A00, c1202Rk.A01, j11, c1202Rk.A03);
        }
        return A04(timeline, c1202Rk.A04, j12, c1202Rk.A03);
    }

    private P0 A03(Timeline timeline, Object obj, int i5, int i11, long startPositionUs, long j11) {
        long jA09;
        C1202Rk c1202Rk = new C1202Rk(obj, i5, i11, j11);
        boolean zA08 = A08(timeline, c1202Rk, Long.MIN_VALUE);
        boolean zA09 = A09(timeline, c1202Rk, zA08);
        long jA0E = timeline.A0J(c1202Rk.A04, this.A09).A0E(c1202Rk.A00, c1202Rk.A01);
        if (i11 == this.A09.A05(i5)) {
            UM um2 = this.A09;
            if (A0B[1].length() != 13) {
                throw new RuntimeException();
            }
            String[] strArr = A0B;
            strArr[7] = "irlSq0v10zByQDiXm9i8jont";
            strArr[4] = "UKqJqhXwK0uP7TFoy7H6yLR2FGRqi";
            jA09 = um2.A09();
        } else {
            jA09 = 0;
        }
        return new P0(c1202Rk, jA09, Long.MIN_VALUE, startPositionUs, jA0E, zA08, zA09);
    }

    private P0 A04(Timeline timeline, Object obj, long j11, long j12) {
        long jA0D;
        long jA0A;
        C1202Rk c1202Rk = new C1202Rk(obj, j12);
        timeline.A0J(c1202Rk.A04, this.A09);
        int iA07 = this.A09.A07(j11);
        if (iA07 == -1) {
            jA0D = Long.MIN_VALUE;
        } else {
            jA0D = this.A09.A0D(iA07);
        }
        boolean zA08 = A08(timeline, c1202Rk, jA0D);
        boolean zA09 = A09(timeline, c1202Rk, zA08);
        if (jA0D == Long.MIN_VALUE) {
            jA0A = this.A09.A0A();
        } else {
            jA0A = jA0D;
        }
        return new P0(c1202Rk, j11, jA0D, -9223372036854775807L, jA0A, zA08, zA09);
    }

    private P0 A05(PO po) {
        return A02(po.A03, po.A05, po.A01, po.A02);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x004d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean A07(Timeline timeline) {
        C1151Oz nextMediaPeriodHolder = A0D();
        if (nextMediaPeriodHolder == null) {
            return true;
        }
        int iA0A = timeline.A0A(nextMediaPeriodHolder.A08);
        while (true) {
            UM um2 = this.A09;
            UK uk2 = this.A0A;
            int i5 = this.A01;
            boolean z11 = this.A08;
            if (A0B[2].charAt(26) == 'F') {
                throw new RuntimeException();
            }
            A0B[6] = "aKuQ9ueHtOksulQgEbalhQiU7zzzAfgD";
            iA0A = timeline.A09(iA0A, um2, uk2, i5, z11);
            while (true) {
                C1151Oz c1151OzA0I = nextMediaPeriodHolder.A0I();
                if (A0B[2].charAt(26) == 'F') {
                    if (c1151OzA0I == null) {
                        break;
                    }
                } else {
                    A0B[3] = "Ixtp3Q";
                    if (c1151OzA0I == null) {
                        break;
                    }
                    if (nextMediaPeriodHolder.A00.A07) {
                        break;
                    }
                    nextMediaPeriodHolder = nextMediaPeriodHolder.A0I();
                }
            }
            C1151Oz c1151OzA0I2 = nextMediaPeriodHolder.A0I();
            if (iA0A == -1 || c1151OzA0I2 == null || timeline.A0A(c1151OzA0I2.A08) != iA0A) {
                break;
            }
            nextMediaPeriodHolder = c1151OzA0I2;
        }
        boolean zA0S = A0S(nextMediaPeriodHolder);
        nextMediaPeriodHolder.A00 = A0I(timeline, nextMediaPeriodHolder.A00);
        return (zA0S && A0N()) ? false : true;
    }

    private boolean A08(Timeline timeline, C1202Rk c1202Rk, long j11) {
        int adGroupCount = timeline.A0J(c1202Rk.A04, this.A09).A03();
        if (adGroupCount == 0) {
            return true;
        }
        int lastAdGroupIndex = adGroupCount - 1;
        boolean zA00 = c1202Rk.A00();
        if (this.A09.A0D(lastAdGroupIndex) != Long.MIN_VALUE) {
            return !zA00 && j11 == Long.MIN_VALUE;
        }
        int postrollAdCount = this.A09.A04(lastAdGroupIndex);
        if (postrollAdCount == -1) {
            return false;
        }
        if (((zA00 && c1202Rk.A00 == lastAdGroupIndex && c1202Rk.A01 == postrollAdCount + (-1)) ? 1 : 0) != 0) {
            return true;
        }
        if (!zA00) {
            int iA05 = this.A09.A05(lastAdGroupIndex);
            if (A0B[6].charAt(21) == 'n') {
                throw new RuntimeException();
            }
            String[] strArr = A0B;
            strArr[7] = "9fN1GtT7csoOtzuVOZGTkJkv";
            strArr[4] = "l5pQsPxk6IT0oV754sDRXb3Ilyc1S";
            if (iA05 == postrollAdCount) {
                return true;
            }
        }
        return false;
    }

    private boolean A09(Timeline timeline, C1202Rk c1202Rk, boolean z11) {
        int iA0A = timeline.A0A(c1202Rk.A04);
        return !timeline.A0K(timeline.A0H(iA0A, this.A09).A00, this.A0A).A0D && timeline.A0O(iA0A, this.A09, this.A0A, this.A01, this.A08) && z11;
    }

    private boolean A0A(C1151Oz c1151Oz, P0 p02) {
        P0 p03 = c1151Oz.A00;
        if (p03.A03 == p02.A03 && p03.A01 == p02.A01) {
            boolean zEquals = p03.A04.equals(p02.A04);
            if (A0B[0].charAt(22) == 'b') {
                throw new RuntimeException();
            }
            A0B[3] = "TRWx01";
            if (zEquals) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0052  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final C1151Oz A0B() {
        if (this.A05 != null) {
            C1151Oz c1151Oz = this.A05;
            if (A0B[5].length() == 7) {
                throw new RuntimeException();
            }
            A0B[6] = "BzNnK6vZGZJzhJ0cKUk4sgiDsSKmw8OE";
            if (c1151Oz == this.A06) {
                this.A06 = this.A05.A0I();
            }
            C1151Oz c1151Oz2 = this.A05;
            if (A0B[2].charAt(26) != 'F') {
                A0B[1] = "VaAQRmMnxrRkq";
                c1151Oz2.A0M();
                this.A05 = this.A05.A0I();
                this.A00--;
                if (this.A00 == 0) {
                    this.A04 = null;
                }
            } else {
                A0B[3] = "lvc6uI";
                c1151Oz2.A0M();
                this.A05 = this.A05.A0I();
                this.A00--;
                if (this.A00 == 0) {
                }
            }
        } else {
            this.A05 = this.A04;
            this.A06 = this.A04;
        }
        C1151Oz c1151Oz3 = this.A05;
        if (A0B[3].length() != 6) {
            A0B[0] = "qeaxpnVrjOAzgdW4zxdWcB8fNL6cs9UO";
            return c1151Oz3;
        }
        A0B[1] = "yTcBq02tmy8sK";
        return c1151Oz3;
    }

    public final C1151Oz A0C() {
        AbstractC1062Ln.A08((this.A06 == null || this.A06.A0I() == null) ? false : true);
        this.A06 = this.A06.A0I();
        return this.A06;
    }

    public final C1151Oz A0D() {
        return A0N() ? this.A05 : this.A04;
    }

    public final C1151Oz A0E() {
        return this.A04;
    }

    public final C1151Oz A0F() {
        return this.A05;
    }

    public final C1151Oz A0G() {
        return this.A06;
    }

    public final P0 A0H(long j11, PO po) {
        if (this.A04 == null) {
            return A05(po);
        }
        return A01(po.A03, this.A04, j11);
    }

    public final InterfaceC1203Rl A0J(InterfaceC1153Pe[] interfaceC1153PeArr, long j11, AbstractC1323Wi abstractC1323Wi, InterfaceC1327Wm interfaceC1327Wm, InterfaceC1276Uj interfaceC1276Uj, P0 p02, C1324Wj c1324Wj) {
        long jA0B;
        if (this.A04 != null) {
            jA0B = this.A04.A0B() + this.A04.A00.A00;
        } else {
            jA0B = p02.A03 + j11;
        }
        C1151Oz c1151Oz = new C1151Oz(interfaceC1153PeArr, jA0B, abstractC1323Wi, interfaceC1327Wm, interfaceC1276Uj, p02, c1324Wj);
        if (this.A04 != null) {
            AbstractC1062Ln.A08(A0N());
            this.A04.A0Q(c1151Oz);
        }
        this.A07 = null;
        this.A04 = c1151Oz;
        this.A00++;
        InterfaceC1203Rl interfaceC1203Rl = c1151Oz.A07;
        String[] strArr = A0B;
        if (strArr[7].length() == strArr[4].length()) {
            throw new RuntimeException();
        }
        A0B[6] = "PhVPZKDAM7fppeQiWsfcSWBqFhBUAWSX";
        return interfaceC1203Rl;
    }

    public final C1202Rk A0K(Timeline timeline, Object obj, long j11) {
        return A06(timeline, obj, j11, A00(timeline, obj), this.A09);
    }

    public final void A0L(long j11) {
        if (this.A04 != null) {
            this.A04.A0P(j11);
        }
    }

    public final void A0M(boolean z11) {
        C1151Oz c1151OzA0D = A0D();
        if (c1151OzA0D != null) {
            this.A07 = z11 ? c1151OzA0D.A08 : null;
            this.A03 = c1151OzA0D.A00.A04.A03;
            c1151OzA0D.A0M();
            A0S(c1151OzA0D);
        } else if (!z11) {
            this.A07 = null;
        }
        this.A05 = null;
        this.A04 = null;
        this.A06 = null;
        this.A00 = 0;
    }

    public final boolean A0N() {
        return this.A05 != null;
    }

    public final boolean A0O() {
        return this.A04 == null || (!this.A04.A00.A05 && this.A04.A0R() && this.A04.A00.A00 != -9223372036854775807L && this.A00 < 100);
    }

    public final boolean A0P(Timeline timeline, int i5) {
        this.A01 = i5;
        return A07(timeline);
    }

    public final boolean A0Q(Timeline timeline, C1202Rk c1202Rk, long j11) {
        int iA0A = timeline.A0A(c1202Rk.A04);
        C1151Oz c1151Oz = null;
        for (C1151Oz periodHolder = A0D(); periodHolder != null; periodHolder = periodHolder.A0I()) {
            if (c1151Oz == null) {
                periodHolder.A00 = A0I(timeline, periodHolder.A00);
            } else {
                if (iA0A == -1 || !periodHolder.A08.equals(timeline.A0M(iA0A))) {
                    boolean zA0S = A0S(c1151Oz);
                    if (A0B[5].length() == 7) {
                        throw new RuntimeException();
                    }
                    A0B[2] = "DCZOFO6lnt1pg3dDOgZnxlf9qk01Ij2m";
                    return true ^ zA0S;
                }
                P0 p0A01 = A01(timeline, c1151Oz, j11);
                if (p0A01 == null) {
                    return true ^ A0S(c1151Oz);
                }
                periodHolder.A00 = A0I(timeline, periodHolder.A00);
                if (!A0A(periodHolder, p0A01)) {
                    return true ^ A0S(c1151Oz);
                }
            }
            if (periodHolder.A00.A07) {
                iA0A = timeline.A09(iA0A, this.A09, this.A0A, this.A01, this.A08);
            }
            c1151Oz = periodHolder;
        }
        return true;
    }

    public final boolean A0R(Timeline timeline, boolean z11) {
        this.A08 = z11;
        return A07(timeline);
    }

    public final boolean A0S(C1151Oz c1151Oz) {
        AbstractC1062Ln.A08(c1151Oz != null);
        boolean z11 = false;
        this.A04 = c1151Oz;
        while (c1151Oz.A0I() != null) {
            c1151Oz = c1151Oz.A0I();
            if (c1151Oz == this.A06) {
                this.A06 = this.A05;
                z11 = true;
            }
            c1151Oz.A0M();
            this.A00--;
        }
        this.A04.A0Q(null);
        return z11;
    }

    public final boolean A0T(InterfaceC1203Rl interfaceC1203Rl) {
        return this.A04 != null && this.A04.A07 == interfaceC1203Rl;
    }
}
