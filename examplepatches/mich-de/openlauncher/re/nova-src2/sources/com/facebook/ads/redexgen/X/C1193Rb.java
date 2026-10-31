package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.Looper;
import com.facebook.ads.androidx.media3.common.DrmInitData;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Rb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1193Rb implements ZP {
    public static byte[] A0Y;
    public static String[] A0Z = {"9SuFUez5PaLoVpB9bApPkgwJIALbVXxB", "WnP4p2P3d4GjCnesSI4pEdpA9z2FpgBb", "FqyoJbhNEKbWYkuOxNvLVuwDDeYkeemR", "gfxw0ZtY8Un17pXHHWpTZUSfyFF3Yz", "sUnHKy7JKoFDN1jmpp", "sTSS3r2YgpKPlpnV6FGptzKl5TVzo2lo", "bSQQjejOVBGpBwfgiuD782ifo2xy8M", "S0rjmSH8elRPo8MiCELFBH3Nt2uU8uFt"};
    public int A00;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public long A08;

    @MetaExoPlayerCustomization
    public Uri A0A;
    public VC A0B;
    public VC A0C;
    public VC A0D;
    public InterfaceC1198Rg A0E;
    public VB A0F;
    public boolean A0G;
    public boolean A0H;
    public boolean A0I;
    public boolean A0J;
    public boolean A0K;
    public final C1207Rp A0T;
    public final InterfaceC1212Ru A0U;
    public final V7 A0V;
    public final V9 A0W = new V9();
    public int A01 = 1000;
    public int[] A0P = new int[this.A01];
    public long[] A0Q = new long[this.A01];
    public long[] A0R = new long[this.A01];
    public int[] A0N = new int[this.A01];
    public int[] A0O = new int[this.A01];
    public ZN[] A0S = new ZN[this.A01];
    public final VQ<VA> A0X = new VQ<>(new InterfaceC1072Ly() { // from class: com.facebook.ads.redexgen.X.Rc
        @Override // com.facebook.ads.redexgen.X.InterfaceC1072Ly
        public final void A3V(Object obj) {
            ((VA) obj).A01.AIp();
        }
    });
    public long A09 = Long.MIN_VALUE;
    public long A06 = Long.MIN_VALUE;
    public long A07 = Long.MIN_VALUE;
    public boolean A0L = true;
    public boolean A0M = true;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private synchronized int A03(C1140Oo c1140Oo, T2 t22, boolean z11, boolean z12, V9 v92) {
        t22.A04 = false;
        if (!A0K()) {
            if (!z12 && !this.A0G) {
                if (this.A0D == null || (!z11 && this.A0D == this.A0B)) {
                    return -3;
                }
                A0H((VC) AbstractC1062Ln.A01(this.A0D), c1140Oo);
                return -5;
            }
            t22.A02(4);
            return -4;
        }
        VC vc = this.A0X.A01(A0O()).A00;
        if (z11 || vc != this.A0B) {
            A0H(vc, c1140Oo);
            return -5;
        }
        int iA00 = A00(this.A03);
        if (!A0L(iA00)) {
            t22.A04 = true;
            return -3;
        }
        t22.A02(this.A0N[iA00]);
        t22.A01 = this.A0R[iA00];
        if (t22.A01 < this.A09) {
            t22.A00(Integer.MIN_VALUE);
        }
        v92.A00 = this.A0O[iA00];
        v92.A01 = this.A0Q[iA00];
        v92.A02 = this.A0S[iA00];
        return -4;
    }

    public static String A0C(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0Y, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 106);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0E() {
        A0Y = new byte[]{-62, -23, -40, -27, -27, -36, -41, -36, -31, -38, -109, -24, -31, -40, -21, -29, -40, -42, -25, -40, -41, -109, -31, -30, -31, -96, -26, -20, -31, -42, -109, -26, -44, -32, -29, -33, -40, -109, -39, -30, -27, -109, -39, -30, -27, -32, -44, -25, -83, -109, 7, 21, 33, 36, 32, 25, 5, 41, 25, 41, 25};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private synchronized void A0G(long j11, int i5, long j12, int i11, ZN zn2) {
        if (this.A02 > 0) {
            int iA00 = A00(this.A02 - 1);
            AbstractC1062Ln.A07(this.A0Q[iA00] + ((long) this.A0O[iA00]) <= j12);
        }
        this.A0G = (536870912 & i5) != 0;
        this.A07 = Math.max(this.A07, j11);
        int iA002 = A00(this.A02);
        this.A0R[iA002] = j11;
        this.A0Q[iA002] = j12;
        this.A0O[iA002] = i11;
        this.A0N[iA002] = i5;
        this.A0S[iA002] = zn2;
        this.A0P[iA002] = this.A05;
        if (this.A0X.A06() || !this.A0X.A00().A00.equals(this.A0D)) {
            this.A0X.A05(A0P(), new VA((VC) AbstractC1062Ln.A01(this.A0D), this.A0U != null ? this.A0U.AIG(this.A0T, this.A0D) : InterfaceC1211Rt.A00));
        }
        this.A02++;
        if (this.A02 == this.A01) {
            int i12 = this.A01 + 1000;
            int[] iArr = new int[i12];
            long[] jArr = new long[i12];
            long[] jArr2 = new long[i12];
            int[] iArr2 = new int[i12];
            int[] iArr3 = new int[i12];
            ZN[] znArr = new ZN[i12];
            int i13 = this.A01 - this.A04;
            System.arraycopy(this.A0Q, this.A04, jArr, 0, i13);
            System.arraycopy(this.A0R, this.A04, jArr2, 0, i13);
            System.arraycopy(this.A0N, this.A04, iArr2, 0, i13);
            System.arraycopy(this.A0O, this.A04, iArr3, 0, i13);
            System.arraycopy(this.A0S, this.A04, znArr, 0, i13);
            System.arraycopy(this.A0P, this.A04, iArr, 0, i13);
            int i14 = this.A04;
            System.arraycopy(this.A0Q, 0, jArr, i13, i14);
            System.arraycopy(this.A0R, 0, jArr2, i13, i14);
            System.arraycopy(this.A0N, 0, iArr2, i13, i14);
            System.arraycopy(this.A0O, 0, iArr3, i13, i14);
            System.arraycopy(this.A0S, 0, znArr, i13, i14);
            System.arraycopy(this.A0P, 0, iArr, i13, i14);
            this.A0Q = jArr;
            this.A0R = jArr2;
            this.A0N = iArr2;
            this.A0O = iArr3;
            this.A0S = znArr;
            this.A0P = iArr;
            this.A04 = 0;
            this.A01 = i12;
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final synchronized long A0S() {
        return this.A02 == 0 ? Long.MIN_VALUE : this.A0R[this.A04];
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final /* synthetic */ int AK7(KR kr2, int i5, boolean z11) {
        return ZM.A00(this, kr2, i5, z11);
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final /* synthetic */ void AK9(C1084Mk c1084Mk, int i5) {
        ZM.A01(this, c1084Mk, i5);
    }

    static {
        A0E();
    }

    public C1193Rb(InterfaceC1327Wm interfaceC1327Wm, InterfaceC1212Ru interfaceC1212Ru, C1207Rp c1207Rp) {
        this.A0U = interfaceC1212Ru;
        this.A0T = c1207Rp;
        this.A0V = new V7(interfaceC1327Wm);
    }

    private int A00(int i5) {
        int i11 = this.A04 + i5;
        int relativeIndex = this.A01;
        if (i11 < relativeIndex) {
            return i11;
        }
        int relativeIndex2 = this.A01;
        return i11 - relativeIndex2;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0027 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int A01(int i5, int i11, long j11, boolean z11) {
        int sampleCountToTarget;
        int i12 = -1;
        for (int i13 = 0; i13 < i11 && this.A0R[i5] <= j11; i13++) {
            if (z11) {
                int sampleCountToTarget2 = this.A0N[i5];
                if ((sampleCountToTarget2 & 1) != 0) {
                }
                i5++;
                sampleCountToTarget = this.A01;
                if (i5 != sampleCountToTarget) {
                    i5 = 0;
                }
            }
            i12 = i13;
            if (this.A0R[i5] == j11) {
                break;
            }
            i5++;
            sampleCountToTarget = this.A01;
            if (i5 != sampleCountToTarget) {
            }
        }
        return i12;
    }

    private int A02(long j11) {
        int i5 = this.A02;
        int count = this.A02;
        int iA00 = A00(count - 1);
        while (true) {
            int i11 = this.A03;
            int relativeSampleIndex = A0Z[4].length();
            if (relativeSampleIndex != 18) {
                throw new RuntimeException();
            }
            A0Z[4] = "dolUKH4gThNCszSjox";
            if (i5 <= i11 || this.A0R[iA00] < j11) {
                break;
            }
            i5--;
            iA00--;
            if (iA00 == -1) {
                int count2 = this.A01;
                iA00 = count2 - 1;
            }
        }
        return i5;
    }

    private synchronized long A04() {
        if (this.A02 == 0) {
            return -1L;
        }
        return A06(this.A02);
    }

    private final synchronized long A05() {
        return Math.max(this.A06, A08(this.A03));
    }

    private long A06(int i5) {
        this.A06 = Math.max(this.A06, A08(i5));
        this.A02 -= i5;
        this.A00 += i5;
        this.A04 += i5;
        if (this.A04 >= this.A01) {
            this.A04 -= this.A01;
        }
        this.A03 -= i5;
        if (this.A03 < 0) {
            this.A03 = 0;
        }
        this.A0X.A04(this.A00);
        if (this.A02 == 0) {
            int relativeLastDiscardIndex = this.A04 == 0 ? this.A01 : this.A04;
            int i11 = relativeLastDiscardIndex - 1;
            long j11 = this.A0Q[i11];
            int relativeLastDiscardIndex2 = this.A0O[i11];
            return j11 + relativeLastDiscardIndex2;
        }
        return this.A0Q[this.A04];
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0048  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private long A07(int i5) {
        boolean z11;
        int iA0P = A0P() - i5;
        boolean z12 = false;
        if (iA0P >= 0) {
            int i11 = this.A02;
            int discardCount = this.A03;
            z11 = iA0P <= i11 - discardCount;
        }
        AbstractC1062Ln.A07(z11);
        int discardCount2 = this.A02;
        this.A02 = discardCount2 - iA0P;
        long j11 = this.A06;
        int discardCount3 = this.A02;
        this.A07 = Math.max(j11, A08(discardCount3));
        if (iA0P == 0 && this.A0G) {
            z12 = true;
        }
        this.A0G = z12;
        this.A0X.A03(i5);
        if (A0Z[2].length() != 32) {
            throw new RuntimeException();
        }
        String[] strArr = A0Z;
        strArr[1] = "WhDqBbGJpUVteLYbNN2pGPdH9fo7UT1Z";
        strArr[5] = "Qpgc0TIFuwgBW8otUHgpzRVMIfcbDu1O";
        int discardCount4 = this.A02;
        if (discardCount4 != 0) {
            int discardCount5 = this.A02;
            int relativeLastWriteIndex = A00(discardCount5 - 1);
            long j12 = this.A0Q[relativeLastWriteIndex];
            int discardCount6 = this.A0O[relativeLastWriteIndex];
            return j12 + discardCount6;
        }
        return 0L;
    }

    private long A08(int i5) {
        if (i5 == 0) {
            return Long.MIN_VALUE;
        }
        long jMax = Long.MIN_VALUE;
        int iA00 = A00(i5 - 1);
        for (int i11 = 0; i11 < i5; i11++) {
            long largestTimestampUs = this.A0R[iA00];
            jMax = Math.max(jMax, largestTimestampUs);
            if ((this.A0N[iA00] & 1) != 0) {
                break;
            }
            iA00--;
            String[] strArr = A0Z;
            if (strArr[6].length() != strArr[3].length()) {
                throw new RuntimeException();
            }
            A0Z[2] = "usCo8IkQcOtWzCeRf5569H09U9ARgSIq";
            if (iA00 == -1) {
                iA00 = this.A01 - 1;
                String[] strArr2 = A0Z;
                if (strArr2[6].length() == strArr2[3].length()) {
                    String[] strArr3 = A0Z;
                    strArr3[0] = "6fALZlBJzYUAMnzI8m0wk3vRuD20Qqhi";
                    strArr3[7] = "MCdHgjZSMyybecfiEYiH0gkFZTJrWOO9";
                }
            }
        }
        return jMax;
    }

    private synchronized long A09(long j11, boolean z11, boolean z12) {
        if (this.A02 != 0 && j11 >= this.A0R[this.A04]) {
            int iA01 = A01(this.A04, (!z12 || this.A03 == this.A02) ? this.A02 : this.A03 + 1, j11, z11);
            if (iA01 == -1) {
                return -1L;
            }
            return A06(iA01);
        }
        return -1L;
    }

    private final VC A0A(VC vc) {
        if (this.A08 != 0 && vc.A0M != Long.MAX_VALUE) {
            return vc.A07().A0s(vc.A0M + this.A08).A14();
        }
        return vc;
    }

    public static C1193Rb A0B(InterfaceC1327Wm interfaceC1327Wm, InterfaceC1212Ru interfaceC1212Ru, C1207Rp c1207Rp) {
        return new C1193Rb(interfaceC1327Wm, (InterfaceC1212Ru) AbstractC1062Ln.A01(interfaceC1212Ru), (C1207Rp) AbstractC1062Ln.A01(c1207Rp));
    }

    private void A0D() {
        if (this.A0E != null) {
            this.A0E.AIq(this.A0T);
            this.A0E = null;
            this.A0B = null;
        }
    }

    private synchronized void A0F() {
        this.A03 = 0;
        this.A0V.A0B();
    }

    private void A0H(VC vc, C1140Oo c1140Oo) {
        VC vcA08;
        boolean z11 = this.A0B == null;
        DrmInitData drmInitData = z11 ? null : this.A0B.A0O;
        this.A0B = vc;
        DrmInitData drmInitData2 = vc.A0O;
        String[] strArr = A0Z;
        if (strArr[1].charAt(19) != strArr[5].charAt(19)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0Z;
        strArr2[0] = "HbiMpST0tqhR09QJOdPYbUVQsjPtPdov";
        strArr2[7] = "Qlot8tHVBiln5H0gJBF7F9JPhKcdWQqe";
        if (this.A0U != null) {
            vcA08 = vc.A08(this.A0U.A87(vc));
        } else {
            vcA08 = vc;
        }
        c1140Oo.A00 = vcA08;
        c1140Oo.A01 = this.A0E;
        if (this.A0U == null) {
            return;
        }
        if (!z11) {
            boolean isFirstFormat = N1.A1E(drmInitData, drmInitData2);
            if (isFirstFormat) {
                return;
            }
        }
        if (Looper.myLooper() == null) {
            return;
        }
        InterfaceC1198Rg interfaceC1198Rg = this.A0E;
        this.A0E = this.A0U.A3Y(this.A0T, vc);
        c1140Oo.A01 = this.A0E;
        if (interfaceC1198Rg != null) {
            interfaceC1198Rg.AIq(this.A0T);
        }
    }

    private final void A0J(boolean z11) {
        this.A0V.A0A();
        this.A02 = 0;
        this.A00 = 0;
        this.A04 = 0;
        this.A03 = 0;
        this.A0M = true;
        this.A09 = Long.MIN_VALUE;
        this.A06 = Long.MIN_VALUE;
        this.A07 = Long.MIN_VALUE;
        this.A0G = false;
        this.A0X.A02();
        if (z11) {
            if (A0Z[4].length() != 18) {
                throw new RuntimeException();
            }
            A0Z[4] = "sqzZn8w9e9BdGX6uTk";
            this.A0C = null;
            this.A0D = null;
            this.A0L = true;
        }
    }

    private boolean A0K() {
        return this.A03 != this.A02;
    }

    private boolean A0L(int i5) {
        return this.A0E == null || this.A0E.A9n() == 4 || ((this.A0N[i5] & 1073741824) == 0 && this.A0E.AIE());
    }

    private synchronized boolean A0M(long j11) {
        boolean z11 = true;
        if (this.A02 == 0) {
            if (j11 <= this.A06) {
                z11 = false;
            }
            return z11;
        }
        if (A05() >= j11) {
            return false;
        }
        int iA02 = A02(j11);
        int retainCount = this.A00;
        A07(retainCount + iA02);
        return true;
    }

    private synchronized boolean A0N(VC vc) {
        this.A0L = false;
        if (N1.A1E(vc, this.A0D)) {
            return false;
        }
        if (!this.A0X.A06() && this.A0X.A00().A00.equals(vc)) {
            this.A0D = this.A0X.A00().A00;
        } else {
            this.A0D = vc;
        }
        this.A0J = L8.A0G(this.A0D.A0W, this.A0D.A0R);
        this.A0H = false;
        return true;
    }

    public final int A0O() {
        return this.A00 + this.A03;
    }

    public final int A0P() {
        return this.A00 + this.A02;
    }

    public final synchronized int A0Q(long j11, boolean z11) {
        int iA00 = A00(this.A03);
        if (A0K() && j11 >= this.A0R[iA00]) {
            if (j11 > this.A07 && z11) {
                int i5 = this.A02;
                int relativeReadIndex = this.A03;
                return i5 - relativeReadIndex;
            }
            int i11 = this.A02;
            int relativeReadIndex2 = this.A03;
            int offset = A01(iA00, i11 - relativeReadIndex2, j11, true);
            if (offset == -1) {
                return 0;
            }
            return offset;
        }
        return 0;
    }

    public final int A0R(C1140Oo c1140Oo, T2 t22, int i5, boolean z11) {
        int iA03 = A03(c1140Oo, t22, (i5 & 2) != 0, z11, this.A0W);
        if (iA03 == -4 && !t22.A05()) {
            int result = i5 & 1;
            boolean z12 = result != 0;
            int result2 = i5 & 4;
            if (result2 == 0) {
                if (z12) {
                    this.A0V.A0E(t22, this.A0W);
                } else {
                    V7 v72 = this.A0V;
                    if (A0Z[4].length() != 18) {
                        throw new RuntimeException();
                    }
                    String[] strArr = A0Z;
                    strArr[0] = "rRp7KszPCIiV4HBOEBmrHkgqycUSCs5l";
                    strArr[7] = "qRl4ES6PqkxlrpPTaqmIy64A96Rs88bh";
                    v72.A0F(t22, this.A0W);
                }
            }
            if (!z12) {
                int result3 = this.A03;
                this.A03 = result3 + 1;
            }
        }
        return iA03;
    }

    public final synchronized long A0T() {
        return this.A07;
    }

    public final synchronized VC A0U() {
        return this.A0L ? null : this.A0D;
    }

    public final void A0V() {
        this.A0V.A0C(A04());
    }

    public final void A0W() throws IOException {
        if (this.A0E == null || this.A0E.A9n() != 1) {
        } else {
            throw ((C1196Re) AbstractC1062Ln.A01(this.A0E.A8b()));
        }
    }

    public final void A0X() {
        A0V();
        A0D();
    }

    public final void A0Y() {
        A0J(true);
        A0D();
    }

    public final void A0Z() {
        A0J(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x000c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized void A0a(int i5) {
        if (i5 >= 0) {
            boolean z11 = this.A03 + i5 <= this.A02;
            AbstractC1062Ln.A07(z11);
            this.A03 += i5;
        }
    }

    public final void A0b(long j11) {
        this.A09 = j11;
    }

    public final void A0c(long j11, boolean z11, boolean z12) {
        this.A0V.A0C(A09(j11, z11, z12));
    }

    public final void A0d(VB vb2) {
        this.A0F = vb2;
    }

    public final synchronized boolean A0e() {
        return this.A0G;
    }

    public final synchronized boolean A0f(long j11, boolean z11) {
        A0F();
        int iA00 = A00(this.A03);
        if (!A0K() || j11 < this.A0R[iA00] || (j11 > this.A07 && !z11)) {
            return false;
        }
        int i5 = this.A02;
        int relativeReadIndex = this.A03;
        int offset = A01(iA00, i5 - relativeReadIndex, j11, true);
        if (offset == -1) {
            return false;
        }
        this.A09 = j11;
        int relativeReadIndex2 = this.A03;
        this.A03 = relativeReadIndex2 + offset;
        return true;
    }

    public final synchronized boolean A0g(boolean z11) {
        boolean z12 = true;
        if (!A0K()) {
            if (!z11 && !this.A0G && (this.A0D == null || this.A0D == this.A0B)) {
                z12 = false;
            }
            return z12;
        }
        if (this.A0X.A01(A0O()).A00 != this.A0B) {
            return true;
        }
        return A0L(A00(this.A03));
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final void A7E(VC vc) {
        VC vcA0A = A0A(vc);
        this.A0K = false;
        this.A0C = vc;
        boolean upstreamFormatChanged = A0N(vcA0A);
        if (this.A0F != null && upstreamFormatChanged) {
            this.A0F.AHV(vcA0A);
        }
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final int AK8(KR kr2, int i5, boolean z11, int i11) throws IOException {
        return this.A0V.A08(kr2, i5, z11);
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final void AKA(C1084Mk c1084Mk, int i5, int i11) {
        this.A0V.A0D(c1084Mk, i5);
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    public final void AKC(long j11, int i5, int i11, int flags, ZN zn2) {
        int i12 = i5;
        if (this.A0K) {
            A7E((VC) AbstractC1062Ln.A02(this.A0C));
        }
        boolean z11 = (i12 & 1) != 0;
        if (this.A0M) {
            if (!z11) {
                return;
            } else {
                this.A0M = false;
            }
        }
        long j12 = j11 + this.A08;
        if (this.A0J) {
            if (j12 < this.A09) {
                return;
            }
            if ((i12 & 1) == 0) {
                if (!this.A0H) {
                    MV.A07(A0C(50, 11, 74), A0C(0, 50, 9) + this.A0D);
                    this.A0H = true;
                }
                i12 |= 1;
            }
        }
        if (this.A0I) {
            if (!z11 || !A0M(j12)) {
                return;
            } else {
                this.A0I = false;
            }
        }
        A0G(j12, i12, (this.A0V.A09() - i11) - flags, i11, zn2);
    }

    @Override // com.facebook.ads.redexgen.X.ZP
    @MetaExoPlayerCustomization
    public final void ALz(Uri uri) {
        this.A0A = uri;
    }
}
