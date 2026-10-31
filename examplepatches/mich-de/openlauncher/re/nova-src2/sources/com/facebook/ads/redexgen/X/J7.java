package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.PointF;
import android.os.Parcelable;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import com.facebook.ads.internal.androidx.support.v7.widget.LinearLayoutManager$SavedState;
import com.facebook.ads.internal.util.parcelable.WrappedParcelable;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.List;

/* loaded from: assets/audience_network/classes.dex */
public class J7 extends AbstractC1960iw implements InterfaceC1972j8 {
    public static byte[] A0F;
    public static String[] A0G = {"VKH6HNPW", "5SG7ZkmA1SrYT5HpW6e3lHPIEdQjCnoY", "GUFAcNFlkHbDslOxTlAKu2zM5da70L8W", "8EarDdUd0wjX", "ogiAdIZLqFL2ODTGKcli7xbzAuQZVFku", "k0c9canuweazyFazM74f3pFcokchiBr", "yJQv9VjGutzUoxdr6", "vBYUiSK7FkagYmvZS"};
    public int A00;
    public int A01;
    public int A02;
    public LinearLayoutManager$SavedState A03;
    public AbstractC1944ig A04;
    public boolean A05;
    public int A06;
    public C1941ib A07;
    public boolean A08;
    public boolean A09;
    public boolean A0A;
    public boolean A0B;
    public boolean A0C;
    public final C1939iZ A0D;
    public final C1940ia A0E;

    public static String A0f(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0F, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0h() {
        A0F = new byte[]{30, 25, 1, 22, 27, 30, 19, 87, 24, 5, 30, 18, 25, 3, 22, 3, 30, 24, 25, 77};
    }

    static {
        A0h();
    }

    public J7(Context context) {
        this(context, 1, false);
    }

    public J7(Context context, int i5, boolean z11) {
        this.A0A = false;
        this.A05 = false;
        this.A0C = false;
        this.A0B = true;
        this.A01 = -1;
        this.A02 = Integer.MIN_VALUE;
        this.A03 = null;
        this.A0D = new C1939iZ(this);
        this.A0E = new C1940ia();
        this.A06 = 2;
        A3F(i5);
        A0t(z11);
        A2q(true);
    }

    private final int A0I(int i5, C1968j4 c1968j4, C1975jB c1975jB) {
        if (A1T() == 0 || i5 == 0) {
            return 0;
        }
        this.A07.A0B = true;
        A3E();
        int absDy = i5 > 0 ? 1 : -1;
        int consumed = Math.abs(i5);
        A0k(absDy, consumed, true, c1975jB);
        int i11 = this.A07.A07;
        int layoutDirection = A0L(c1968j4, this.A07, c1975jB, false);
        int i12 = i11 + layoutDirection;
        if (i12 < 0) {
            return 0;
        }
        int absDy2 = consumed > i12 ? absDy * i12 : i5;
        int layoutDirection2 = -absDy2;
        this.A04.A0K(layoutDirection2);
        this.A07.A04 = absDy2;
        return absDy2;
    }

    private int A0J(int i5, C1968j4 c1968j4, C1975jB c1975jB, boolean z11) {
        int gap = this.A04.A07() - i5;
        if (gap > 0) {
            int i11 = -A0I(-gap, c1968j4, c1975jB);
            int i12 = i5 + i11;
            if (z11) {
                int gap2 = this.A04.A07();
                if (A0G[0].length() == 7) {
                    throw new RuntimeException();
                }
                A0G[0] = "DiKLRwr5Jced9h1IWYQQBSe";
                int gap3 = gap2 - i12;
                if (gap3 > 0) {
                    this.A04.A0K(gap3);
                    return gap3 + i11;
                }
            }
            return i11;
        }
        return 0;
    }

    private int A0K(int i5, C1968j4 c1968j4, C1975jB c1975jB, boolean z11) {
        int iA0B;
        int gap = i5 - this.A04.A0B();
        if (gap > 0) {
            int i11 = -A0I(gap, c1968j4, c1975jB);
            int i12 = i5 + i11;
            if (z11 && (iA0B = i12 - this.A04.A0B()) > 0) {
                this.A04.A0K(-iA0B);
                return i11 - iA0B;
            }
            return i11;
        }
        return 0;
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x00a6, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final int A0L(C1968j4 c1968j4, C1941ib c1941ib, C1975jB c1975jB, boolean z11) {
        int i5 = c1941ib.A00;
        int start = c1941ib.A07;
        if (start != Integer.MIN_VALUE) {
            int start2 = c1941ib.A00;
            if (start2 < 0) {
                int i11 = c1941ib.A07;
                int start3 = c1941ib.A00;
                c1941ib.A07 = i11 + start3;
            }
            A0q(c1968j4, c1941ib);
        }
        int i12 = c1941ib.A00;
        int start4 = c1941ib.A02;
        int i13 = i12 + start4;
        C1940ia layoutChunkResult = this.A0E;
        while (true) {
            if ((!c1941ib.A09 && i13 <= 0) || !c1941ib.A05(c1975jB)) {
                break;
            }
            layoutChunkResult.A00();
            A3I(c1968j4, c1975jB, c1941ib, layoutChunkResult);
            if (layoutChunkResult.A01) {
                break;
            }
            int i14 = c1941ib.A06;
            int remainingSpace = layoutChunkResult.A00;
            int start5 = c1941ib.A05;
            c1941ib.A06 = i14 + (remainingSpace * start5);
            if (!layoutChunkResult.A03 || this.A07.A08 != null || !c1975jB.A07()) {
                int remainingSpace2 = c1941ib.A00;
                int start6 = layoutChunkResult.A00;
                c1941ib.A00 = remainingSpace2 - start6;
                int start7 = layoutChunkResult.A00;
                i13 -= start7;
            }
            int start8 = c1941ib.A07;
            if (start8 != Integer.MIN_VALUE) {
                int remainingSpace3 = c1941ib.A07;
                int start9 = layoutChunkResult.A00;
                c1941ib.A07 = remainingSpace3 + start9;
                int start10 = c1941ib.A00;
                if (start10 < 0) {
                    int i15 = c1941ib.A07;
                    int i16 = c1941ib.A00;
                    int remainingSpace4 = A0G[0].length();
                    if (remainingSpace4 == 7) {
                        break;
                    }
                    A0G[5] = "4Yaap7YPoeEmBfNVznjneaOXF1T3Chf";
                    c1941ib.A07 = i15 + i16;
                }
                A0q(c1968j4, c1941ib);
            }
            if (z11) {
                boolean z12 = layoutChunkResult.A02;
                int remainingSpace5 = A0G[0].length();
                if (remainingSpace5 == 7) {
                    break;
                }
                A0G[1] = "BoRZmQ3r1kYFEVrzuprqJgVQBsgHE2ov";
                if (z12) {
                    break;
                }
            }
        }
        int start11 = c1941ib.A00;
        return i5 - start11;
    }

    private int A0M(C1975jB c1975jB) {
        if (A1T() != 0) {
            A3E();
            return AbstractC1979jF.A00(c1975jB, this.A04, A0d(!this.A0B, true), A0c(!this.A0B, true), this, this.A0B);
        }
        if (A0G[5].length() != 31) {
            throw new RuntimeException();
        }
        A0G[5] = "JS1EmTokFkofHdCiZDqGUekHou375gK";
        return 0;
    }

    private int A0N(C1975jB c1975jB) {
        if (A1T() == 0) {
            return 0;
        }
        A3E();
        return AbstractC1979jF.A02(c1975jB, this.A04, A0d(!this.A0B, true), A0c(!this.A0B, true), this, this.A0B, this.A05);
    }

    private int A0O(C1975jB c1975jB) {
        if (A1T() != 0) {
            A3E();
            return AbstractC1979jF.A01(c1975jB, this.A04, A0d(!this.A0B, true), A0c(!this.A0B, true), this, this.A0B);
        }
        String[] strArr = A0G;
        if (strArr[2].charAt(4) == strArr[4].charAt(4)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0G;
        strArr2[2] = "SnDsIEYZVkVP365fclIsQ2wSHS1GnuqA";
        strArr2[4] = "cd1sjhoNq3y2dBxKlbos6To2J3BafTHs";
        return 0;
    }

    private final int A0P(C1975jB c1975jB) {
        if (c1975jB.A06()) {
            return this.A04.A0C();
        }
        return 0;
    }

    private View A0Q() {
        return A0U(0, A1T());
    }

    private View A0R() {
        return A0U(A1T() - 1, -1);
    }

    private View A0S() {
        return A20(this.A05 ? 0 : A1T() - 1);
    }

    private View A0T() {
        return A20(this.A05 ? A1T() - 1 : 0);
    }

    private final View A0U(int i5, int i11) {
        int next;
        int acceptableBoundsFlag;
        int preferredBoundsFlag;
        A3E();
        if (i11 > i5) {
            next = 1;
        } else {
            next = i11 < i5 ? -1 : 0;
        }
        if (next == 0) {
            View viewA20 = A20(i5);
            String[] strArr = A0G;
            String str = strArr[6];
            String str2 = strArr[7];
            int length = str.length();
            int next2 = str2.length();
            if (length != next2) {
                throw new RuntimeException();
            }
            A0G[5] = "tEP4S10y6AtQbDA9ff3H424KLTnX0k7";
            return viewA20;
        }
        int preferredBoundsFlag2 = this.A04.A0G(A20(i5));
        int next3 = this.A04.A0B();
        if (preferredBoundsFlag2 < next3) {
            acceptableBoundsFlag = 16644;
            preferredBoundsFlag = 16388;
        } else {
            acceptableBoundsFlag = 4161;
            preferredBoundsFlag = 4097;
        }
        int next4 = this.A00;
        if (next4 == 0) {
            return super.A04.A00(i5, i11, acceptableBoundsFlag, preferredBoundsFlag);
        }
        return super.A05.A00(i5, i11, acceptableBoundsFlag, preferredBoundsFlag);
    }

    private final View A0V(int i5, int i11, boolean z11, boolean z12) {
        int i12;
        A3E();
        int i13 = 0;
        if (z11) {
            i12 = 24579;
        } else {
            i12 = Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE;
        }
        if (z12) {
            i13 = Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE;
        }
        int i14 = this.A00;
        int acceptableBoundsFlag = A0G[1].charAt(30);
        if (acceptableBoundsFlag != 111) {
            throw new RuntimeException();
        }
        String[] strArr = A0G;
        strArr[2] = "NnwW0AnvRBQDKBAe7Vp9NN4SqY6y39Zg";
        strArr[4] = "snWQRfIRwdJNOSPMdDWVpUmegwlUrdsl";
        if (i14 == 0) {
            return super.A04.A00(i5, i11, i12, i13);
        }
        return super.A05.A00(i5, i11, i12, i13);
    }

    private View A0W(C1968j4 c1968j4, C1975jB c1975jB) {
        return A3D(c1968j4, c1975jB, 0, A1T(), c1975jB.A03());
    }

    private View A0X(C1968j4 c1968j4, C1975jB c1975jB) {
        return A3D(c1968j4, c1975jB, A1T() - 1, -1, c1975jB.A03());
    }

    private View A0Y(C1968j4 c1968j4, C1975jB c1975jB) {
        return this.A05 ? A0Q() : A0R();
    }

    private View A0Z(C1968j4 c1968j4, C1975jB c1975jB) {
        return this.A05 ? A0R() : A0Q();
    }

    private View A0a(C1968j4 c1968j4, C1975jB c1975jB) {
        return this.A05 ? A0W(c1968j4, c1975jB) : A0X(c1968j4, c1975jB);
    }

    private View A0b(C1968j4 c1968j4, C1975jB c1975jB) {
        return this.A05 ? A0X(c1968j4, c1975jB) : A0W(c1968j4, c1975jB);
    }

    private View A0c(boolean z11, boolean z12) {
        if (this.A05) {
            return A0V(0, A1T(), z11, z12);
        }
        return A0V(A1T() - 1, -1, z11, z12);
    }

    private View A0d(boolean z11, boolean z12) {
        if (this.A05) {
            return A0V(A1T() - 1, -1, z11, z12);
        }
        return A0V(0, A1T(), z11, z12);
    }

    private final C1941ib A0e() {
        return new C1941ib();
    }

    private void A0g() {
        if (this.A00 == 1 || !A3K()) {
            this.A05 = this.A0A;
            return;
        }
        boolean z11 = !this.A0A;
        String[] strArr = A0G;
        if (strArr[2].charAt(4) == strArr[4].charAt(4)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0G;
        strArr2[6] = "rvopS3hSB7itRsuyG";
        strArr2[7] = "9RTUShXs4ZXrU4n03";
        this.A05 = z11;
    }

    private void A0i(int i5, int i11) {
        this.A07.A00 = this.A04.A07() - i11;
        this.A07.A03 = this.A05 ? -1 : 1;
        this.A07.A01 = i5;
        this.A07.A05 = 1;
        this.A07.A06 = i11;
        this.A07.A07 = Integer.MIN_VALUE;
    }

    private void A0j(int i5, int i11) {
        this.A07.A00 = i11 - this.A04.A0B();
        this.A07.A01 = i5;
        this.A07.A03 = this.A05 ? 1 : -1;
        this.A07.A05 = -1;
        this.A07.A06 = i11;
        this.A07.A07 = Integer.MIN_VALUE;
    }

    private void A0k(int i5, int i11, boolean z11, C1975jB c1975jB) {
        int iA0B;
        this.A07.A09 = A0u();
        this.A07.A02 = A0P(c1975jB);
        this.A07.A05 = i5;
        if (i5 == 1) {
            this.A07.A02 += this.A04.A08();
            View viewA0S = A0S();
            C1941ib c1941ib = this.A07;
            if (!this.A05) {
                i = 1;
            }
            c1941ib.A03 = i;
            this.A07.A01 = A1o(viewA0S) + this.A07.A03;
            this.A07.A06 = this.A04.A0D(viewA0S);
            iA0B = this.A04.A0D(viewA0S) - this.A04.A07();
        } else {
            View viewA0T = A0T();
            this.A07.A02 += this.A04.A0B();
            this.A07.A03 = this.A05 ? 1 : -1;
            this.A07.A01 = A1o(viewA0T) + this.A07.A03;
            this.A07.A06 = this.A04.A0G(viewA0T);
            iA0B = (-this.A04.A0G(viewA0T)) + this.A04.A0B();
        }
        this.A07.A00 = i11;
        if (z11) {
            C1941ib c1941ib2 = this.A07;
            int scrollingOffset = c1941ib2.A00;
            c1941ib2.A00 = scrollingOffset - iA0B;
        }
        this.A07.A07 = iA0B;
        if (A0G[0].length() == 7) {
            throw new RuntimeException();
        }
        A0G[1] = "rmKnvh8FAT7bzRdUkYGsCRYa1fX1DRoz";
    }

    private void A0l(C1939iZ c1939iZ) {
        A0i(c1939iZ.A01, c1939iZ.A00);
    }

    private void A0m(C1939iZ c1939iZ) {
        A0j(c1939iZ.A01, c1939iZ.A00);
    }

    private void A0n(C1968j4 c1968j4, int i5) {
        int iA1T = A1T();
        if (i5 < 0) {
            return;
        }
        int iA06 = this.A04.A06() - i5;
        if (this.A05) {
            for (int i11 = 0; i11 < iA1T; i11++) {
                View viewA20 = A20(i11);
                int childCount = this.A04.A0G(viewA20);
                if (childCount >= iA06) {
                    int childCount2 = this.A04.A0I(viewA20);
                    if (childCount2 >= iA06) {
                    }
                }
                A0p(c1968j4, 0, i11);
                return;
            }
            return;
        }
        for (int i12 = iA1T - 1; i12 >= 0; i12--) {
            View viewA202 = A20(i12);
            int childCount3 = this.A04.A0G(viewA202);
            if (childCount3 >= iA06) {
                int childCount4 = this.A04.A0I(viewA202);
                if (childCount4 >= iA06) {
                }
            }
            int childCount5 = iA1T - 1;
            A0p(c1968j4, childCount5, i12);
            return;
        }
    }

    private void A0o(C1968j4 c1968j4, int i5) {
        if (i5 < 0) {
            return;
        }
        String[] strArr = A0G;
        if (strArr[2].charAt(4) == strArr[4].charAt(4)) {
            throw new RuntimeException();
        }
        A0G[0] = "66";
        int iA1T = A1T();
        if (this.A05) {
            for (int i11 = iA1T - 1; i11 >= 0; i11--) {
                View viewA20 = A20(i11);
                int limit = this.A04.A0D(viewA20);
                if (limit <= i5) {
                    AbstractC1944ig abstractC1944ig = this.A04;
                    String[] strArr2 = A0G;
                    String str = strArr2[6];
                    String str2 = strArr2[7];
                    int childCount = str.length();
                    int limit2 = str2.length();
                    if (childCount != limit2) {
                        int limit3 = abstractC1944ig.A0H(viewA20);
                        if (limit3 <= i5) {
                        }
                    } else {
                        A0G[3] = "uDZbJl3GZvnd0";
                        int limit4 = abstractC1944ig.A0H(viewA20);
                        if (limit4 <= i5) {
                        }
                    }
                }
                int limit5 = iA1T - 1;
                A0p(c1968j4, limit5, i11);
                return;
            }
            return;
        }
        for (int i12 = 0; i12 < iA1T; i12++) {
            View viewA202 = A20(i12);
            int iA0D = this.A04.A0D(viewA202);
            int childCount2 = A0G[3].length();
            if (childCount2 == 28) {
                throw new RuntimeException();
            }
            A0G[1] = "ET87P0AumYMcjI6vylu4qFXoEmTHeXod";
            if (iA0D <= i5) {
                int limit6 = this.A04.A0H(viewA202);
                if (limit6 <= i5) {
                }
            }
            A0p(c1968j4, 0, i12);
            return;
        }
    }

    private void A0p(C1968j4 c1968j4, int i5, int i11) {
        if (i5 == i11) {
            return;
        }
        if (i11 > i5) {
            for (int i12 = i11 - 1; i12 >= i5; i12--) {
                A2H(i12, c1968j4);
            }
            return;
        }
        while (i5 > i11) {
            A2H(i5, c1968j4);
            i5--;
        }
    }

    private void A0q(C1968j4 c1968j4, C1941ib c1941ib) {
        if (!c1941ib.A0B || c1941ib.A09) {
            return;
        }
        int i5 = c1941ib.A05;
        String[] strArr = A0G;
        if (strArr[6].length() == strArr[7].length()) {
            String[] strArr2 = A0G;
            strArr2[2] = "M7iaeQoExhHh03f7x1XNzmreS2Lq1zJK";
            strArr2[4] = "3weclwG7n9RXAySrMV3Jn51LrKgutG4n";
            if (i5 == -1) {
                int i11 = c1941ib.A07;
                if (A0G[1].charAt(30) == 'o') {
                    A0G[3] = "CiNTyTfZO3PW6tP";
                    A0n(c1968j4, i11);
                    return;
                }
            } else {
                A0o(c1968j4, c1941ib.A07);
                return;
            }
        }
        throw new RuntimeException();
    }

    private void A0r(C1968j4 c1968j4, C1975jB c1975jB, int scrapExtraEnd, int scrapExtraEnd2) {
        if (!c1975jB.A08() || A1T() == 0 || c1975jB.A07() || !A2x()) {
            return;
        }
        int iA0E = 0;
        int scrapExtraStart = 0;
        List<AbstractC1978jE> listA0K = c1968j4.A0K();
        int i5 = listA0K.size();
        int iA1o = A1o(A20(0));
        for (int scrapSize = 0; scrapSize < i5; scrapSize++) {
            AbstractC1978jE abstractC1978jE = listA0K.get(scrapSize);
            if (!abstractC1978jE.A0n()) {
                int direction = 1;
                if ((abstractC1978jE.A0T() < iA1o) != this.A05) {
                    direction = -1;
                }
                if (direction == -1) {
                    iA0E += this.A04.A0E(abstractC1978jE.A0H);
                } else {
                    scrapExtraStart += this.A04.A0E(abstractC1978jE.A0H);
                }
            }
        }
        this.A07.A08 = listA0K;
        if (iA0E > 0) {
            A0j(A1o(A0T()), scrapExtraEnd);
            this.A07.A02 = iA0E;
            this.A07.A00 = 0;
            this.A07.A04();
            A0L(c1968j4, this.A07, c1975jB, false);
        }
        if (scrapExtraStart > 0) {
            A0i(A1o(A0S()), scrapExtraEnd2);
            this.A07.A02 = scrapExtraStart;
            this.A07.A00 = 0;
            this.A07.A04();
            A0L(c1968j4, this.A07, c1975jB, false);
        }
        this.A07.A08 = null;
    }

    private void A0s(C1968j4 c1968j4, C1975jB c1975jB, C1939iZ c1939iZ) {
        if (A0w(c1975jB, c1939iZ)) {
            return;
        }
        boolean zA0v = A0v(c1968j4, c1975jB, c1939iZ);
        String[] strArr = A0G;
        if (strArr[2].charAt(4) == strArr[4].charAt(4)) {
            throw new RuntimeException();
        }
        A0G[3] = "XDJ2jDWhUW9a7iN";
        if (zA0v) {
            return;
        }
        c1939iZ.A02();
        c1939iZ.A01 = this.A0C ? c1975jB.A03() - 1 : 0;
    }

    private final void A0t(boolean z11) {
        A2p(null);
        if (z11 == this.A0A) {
            return;
        }
        this.A0A = z11;
        A28();
    }

    private final boolean A0u() {
        return this.A04.A09() == 0 && this.A04.A06() == 0;
    }

    private boolean A0v(C1968j4 c1968j4, C1975jB c1975jB, C1939iZ c1939iZ) {
        View viewA0b;
        int iA0B;
        if (A1T() == 0) {
            return false;
        }
        View viewA1y = A1y();
        if (viewA1y != null && c1939iZ.A06(viewA1y, c1975jB)) {
            c1939iZ.A05(viewA1y);
            return true;
        }
        if (this.A08 != this.A0C) {
            return false;
        }
        if (c1939iZ.A02) {
            viewA0b = A0a(c1968j4, c1975jB);
        } else {
            viewA0b = A0b(c1968j4, c1975jB);
        }
        if (viewA0b == null) {
            return false;
        }
        c1939iZ.A04(viewA0b);
        if (!c1975jB.A07() && A2x()) {
            if (this.A04.A0G(viewA0b) >= this.A04.A07() || this.A04.A0D(viewA0b) < this.A04.A0B()) {
                if (c1939iZ.A02) {
                    iA0B = this.A04.A07();
                } else {
                    iA0B = this.A04.A0B();
                }
                c1939iZ.A00 = iA0B;
            }
        }
        return true;
    }

    private boolean A0w(C1975jB c1975jB, C1939iZ c1939iZ) {
        int startGap;
        if (c1975jB.A07() || this.A01 == -1) {
            return false;
        }
        if (this.A01 < 0 || this.A01 >= c1975jB.A03()) {
            this.A01 = -1;
            this.A02 = Integer.MIN_VALUE;
            return false;
        }
        c1939iZ.A01 = this.A01;
        if (this.A03 != null && this.A03.A01()) {
            c1939iZ.A02 = this.A03.A02;
            if (c1939iZ.A02) {
                c1939iZ.A00 = this.A04.A07() - this.A03.A00;
            } else {
                c1939iZ.A00 = this.A04.A0B() + this.A03.A00;
            }
            return true;
        }
        if (this.A02 == Integer.MIN_VALUE) {
            View viewA1z = A1z(this.A01);
            if (viewA1z != null) {
                if (this.A04.A0E(viewA1z) > this.A04.A0C()) {
                    c1939iZ.A02();
                    return true;
                }
                if (this.A04.A0G(viewA1z) - this.A04.A0B() < 0) {
                    c1939iZ.A00 = this.A04.A0B();
                    c1939iZ.A02 = false;
                    return true;
                }
                int endGap = this.A04.A07() - this.A04.A0D(viewA1z);
                if (endGap < 0) {
                    c1939iZ.A00 = this.A04.A07();
                    c1939iZ.A02 = true;
                    return true;
                }
                if (c1939iZ.A02) {
                    int startGap2 = this.A04.A0D(viewA1z);
                    AbstractC1944ig abstractC1944ig = this.A04;
                    String[] strArr = A0G;
                    String str = strArr[2];
                    String str2 = strArr[4];
                    int endGap2 = str.charAt(4);
                    if (endGap2 == str2.charAt(4)) {
                        throw new RuntimeException();
                    }
                    A0G[3] = "ZbIhQvVoqDIGDPkO0OlvW9zioDplzu";
                    startGap = startGap2 + abstractC1944ig.A05();
                } else {
                    startGap = this.A04.A0G(viewA1z);
                }
                c1939iZ.A00 = startGap;
            } else {
                if (A1T() > 0) {
                    View child = A20(0);
                    boolean z11 = this.A01 < A1o(child);
                    boolean z12 = this.A05;
                    if (A0G[1].charAt(30) != 'o') {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A0G;
                    strArr2[2] = "1tNDA9T9nSDYektAgKE77gOe81bMFJSk";
                    strArr2[4] = "TZYqXNdWGZVKxzfIQyf7YZEk7yb7IRTm";
                    c1939iZ.A02 = z11 == z12;
                }
                c1939iZ.A02();
            }
            return true;
        }
        c1939iZ.A02 = this.A05;
        if (this.A05) {
            c1939iZ.A00 = this.A04.A07() - this.A02;
        } else {
            c1939iZ.A00 = this.A04.A0B() + this.A02;
        }
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public int A1g(int i5, C1968j4 c1968j4, C1975jB c1975jB) {
        if (this.A00 == 1) {
            return 0;
        }
        return A0I(i5, c1968j4, c1975jB);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public int A1h(int i5, C1968j4 c1968j4, C1975jB c1975jB) {
        if (this.A00 == 0) {
            return 0;
        }
        int iA0I = A0I(i5, c1968j4, c1975jB);
        String[] strArr = A0G;
        if (strArr[6].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        A0G[3] = "CDnF1shpb";
        return iA0I;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final int A1r(C1975jB c1975jB) {
        return A0M(c1975jB);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final int A1s(C1975jB c1975jB) {
        return A0N(c1975jB);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final int A1t(C1975jB c1975jB) {
        return A0O(c1975jB);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final int A1u(C1975jB c1975jB) {
        return A0M(c1975jB);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final int A1v(C1975jB c1975jB) {
        return A0N(c1975jB);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final int A1w(C1975jB c1975jB) {
        return A0O(c1975jB);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final Parcelable A1x() {
        if (this.A03 != null) {
            return new WrappedParcelable(new LinearLayoutManager$SavedState(this.A03));
        }
        LinearLayoutManager$SavedState linearLayoutManager$SavedState = new LinearLayoutManager$SavedState();
        if (A1T() > 0) {
            A3E();
            boolean didLayoutFromEnd = this.A08 ^ this.A05;
            linearLayoutManager$SavedState.A02 = didLayoutFromEnd;
            if (didLayoutFromEnd) {
                View refChild = A0S();
                linearLayoutManager$SavedState.A00 = this.A04.A07() - this.A04.A0D(refChild);
                linearLayoutManager$SavedState.A01 = A1o(refChild);
            } else {
                View viewA0T = A0T();
                linearLayoutManager$SavedState.A01 = A1o(viewA0T);
                linearLayoutManager$SavedState.A00 = this.A04.A0G(viewA0T) - this.A04.A0B();
            }
        } else {
            linearLayoutManager$SavedState.A00();
        }
        return new WrappedParcelable(linearLayoutManager$SavedState);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final View A1z(int i5) {
        int firstChild = A1T();
        if (firstChild == 0) {
            return null;
        }
        int childCount = i5 - A1o(A20(0));
        if (childCount >= 0 && childCount < firstChild) {
            View viewA20 = A20(childCount);
            if (A1o(viewA20) == i5) {
                return viewA20;
            }
        }
        return super.A1z(i5);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public View A23(View view, int i5, C1968j4 c1968j4, C1975jB c1975jB) {
        int iA3C;
        View viewA0Y;
        View nextCandidate;
        A0g();
        if (A1T() == 0 || (iA3C = A3C(i5)) == Integer.MIN_VALUE) {
            return null;
        }
        A3E();
        A3E();
        int layoutDir = this.A04.A0C();
        A0k(iA3C, (int) (layoutDir * 0.33333334f), false, c1975jB);
        this.A07.A07 = Integer.MIN_VALUE;
        this.A07.A0B = false;
        A0L(c1968j4, this.A07, c1975jB, true);
        if (iA3C == -1) {
            viewA0Y = A0Z(c1968j4, c1975jB);
        } else {
            viewA0Y = A0Y(c1968j4, c1975jB);
        }
        if (iA3C == -1) {
            nextCandidate = A0T();
        } else {
            nextCandidate = A0S();
        }
        boolean zHasFocusable = nextCandidate.hasFocusable();
        if (A0G[0].length() == 7) {
            throw new RuntimeException();
        }
        String[] strArr = A0G;
        strArr[2] = "JGtMOr7ZHjmwUVfbInfaZmEhr0nxGN38";
        strArr[4] = "jCrgpf8bwQbyd1C9u6FfAt5OnK6gBhSa";
        if (zHasFocusable) {
            if (viewA0Y == null) {
                return null;
            }
            return nextCandidate;
        }
        return viewA0Y;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public C1961ix A24() {
        return new C1961ix(-2, -2);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public void A2B(int i5) {
        this.A01 = i5;
        this.A02 = Integer.MIN_VALUE;
        if (this.A03 != null) {
            this.A03.A00();
        }
        A28();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final void A2F(int i5, int i11, C1975jB c1975jB, InterfaceC1958iu interfaceC1958iu) {
        if (this.A00 != 0) {
            i5 = i11;
        }
        int delta = A1T();
        if (delta == 0 || i5 == 0) {
            return;
        }
        A3E();
        int i12 = i5 > 0 ? 1 : -1;
        int delta2 = Math.abs(i5);
        A0k(i12, delta2, true, c1975jB);
        A3J(c1975jB, this.A07, interfaceC1958iu);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final void A2G(int i5, InterfaceC1958iu interfaceC1958iu) {
        boolean z11;
        int direction;
        if (this.A03 != null && this.A03.A01()) {
            z11 = this.A03.A02;
            direction = this.A03.A01;
        } else {
            A0g();
            z11 = this.A05;
            int i11 = this.A01;
            String[] strArr = A0G;
            if (strArr[6].length() != strArr[7].length()) {
                throw new RuntimeException();
            }
            A0G[1] = "j12HxmlCdcFNOCf90EDMVBFIs8rsuaoM";
            if (i11 == -1) {
                direction = z11 ? i5 - 1 : 0;
            } else {
                direction = this.A01;
            }
        }
        int i12 = z11 ? -1 : 1;
        for (int i13 = 0; i13 < this.A06 && direction >= 0 && direction < i5; i13++) {
            interfaceC1958iu.A4S(direction, 0);
            direction += i12;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final void A2J(Parcelable parcelable) {
        if (!(parcelable instanceof WrappedParcelable)) {
            return;
        }
        ClassLoader classLoader = getClass().getClassLoader();
        if (A0G[1].charAt(30) == 'o') {
            A0G[1] = "tHEWx5U9TGfOm0s3U2zrO5nR7UMaVIoI";
            if (classLoader == null) {
                return;
            }
            if (A0G[5].length() == 31) {
                A0G[3] = "tm";
                Parcelable state = ((WrappedParcelable) parcelable).unwrap(classLoader);
                if (state instanceof LinearLayoutManager$SavedState) {
                    this.A03 = (LinearLayoutManager$SavedState) state;
                    A28();
                    return;
                }
                return;
            }
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final void A2U(AccessibilityEvent accessibilityEvent) {
        super.A2U(accessibilityEvent);
        if (A1T() > 0) {
            accessibilityEvent.setFromIndex(A39());
            int iA3A = A3A();
            if (A0G[3].length() == 28) {
                throw new RuntimeException();
            }
            A0G[3] = "9E5bhv9RVKulu";
            accessibilityEvent.setToIndex(iA3A);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00aa  */
    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void A2Z(C1968j4 c1968j4, C1975jB c1975jB) {
        int i5;
        int extra;
        int fixOffset;
        View viewA1z;
        int extra2;
        int startOffset = -1;
        if ((this.A03 != null || this.A01 != -1) && c1975jB.A03() == 0) {
            A2Y(c1968j4);
            return;
        }
        if (this.A03 != null && this.A03.A01()) {
            this.A01 = this.A03.A01;
        }
        A3E();
        this.A07.A0B = false;
        A0g();
        View viewA1y = A1y();
        if (!this.A0D.A03 || this.A01 != -1 || this.A03 != null) {
            this.A0D.A03();
            this.A0D.A02 = this.A05 ^ this.A0C;
            A0s(c1968j4, c1975jB, this.A0D);
            C1939iZ c1939iZ = this.A0D;
            if (A0G[3].length() == 28) {
                throw new RuntimeException();
            }
            A0G[0] = "pP9DXN24lJAGcvrzmJLzNvbz";
            c1939iZ.A03 = true;
        } else if (viewA1y != null && (this.A04.A0G(viewA1y) >= this.A04.A07() || this.A04.A0D(viewA1y) <= this.A04.A0B())) {
            this.A0D.A05(viewA1y);
        }
        int extraForEnd = A0P(c1975jB);
        if (this.A07.A04 >= 0) {
            i5 = 0;
        } else {
            i5 = extraForEnd;
            extraForEnd = 0;
        }
        int iA0B = i5 + this.A04.A0B();
        int extraForEnd2 = extraForEnd + this.A04.A08();
        if (c1975jB.A07()) {
            int extra3 = this.A01;
            String[] strArr = A0G;
            if (strArr[6].length() != strArr[7].length()) {
                A0G[1] = "HnPzY03honFOjhYT25K5WFAFMhFIclok";
                if (extra3 != -1) {
                    if (this.A02 != Integer.MIN_VALUE && (viewA1z = A1z(this.A01)) != null) {
                        if (this.A05) {
                            int extra4 = this.A04.A07() - this.A04.A0D(viewA1z);
                            String[] strArr2 = A0G;
                            if (strArr2[2].charAt(4) != strArr2[4].charAt(4)) {
                                A0G[5] = "r3FnQil1r32czyLALUutLd0XCkxYZ4G";
                                extra2 = extra4 - this.A02;
                            } else {
                                String[] strArr3 = A0G;
                                strArr3[2] = "sdmiyO1ExKOYMO2wbr6XNnW0K6t4WoaH";
                                strArr3[4] = "ty9AfnxQn4ghzZPCSImQPyrccPhuEwJu";
                                extra2 = extra4 - this.A02;
                            }
                        } else {
                            extra2 = this.A02 - (this.A04.A0G(viewA1z) - this.A04.A0B());
                        }
                        if (extra2 > 0) {
                            iA0B += extra2;
                        } else {
                            extraForEnd2 -= extra2;
                        }
                    }
                }
            } else {
                String[] strArr4 = A0G;
                strArr4[2] = "wwbDuuRcKwQkcLvBFtW9wuMbOUuGYFzY";
                strArr4[4] = "YequbpJjhMyIl9uyXvP2gytASLo9xZ7L";
                if (extra3 != -1) {
                }
            }
        }
        if (this.A0D.A02) {
            if (this.A05) {
                startOffset = 1;
            }
        } else if (!this.A05) {
            startOffset = 1;
        }
        A3H(c1968j4, c1975jB, this.A0D, startOffset);
        A2X(c1968j4);
        this.A07.A09 = A0u();
        this.A07.A0A = c1975jB.A07();
        if (this.A0D.A02) {
            A0m(this.A0D);
            this.A07.A02 = iA0B;
            A0L(c1968j4, this.A07, c1975jB, false);
            fixOffset = this.A07.A06;
            int i11 = this.A07.A01;
            if (this.A07.A00 > 0) {
                extraForEnd2 += this.A07.A00;
            }
            A0l(this.A0D);
            this.A07.A02 = extraForEnd2;
            this.A07.A01 += this.A07.A03;
            A0L(c1968j4, this.A07, c1975jB, false);
            extra = this.A07.A06;
            if (this.A07.A00 > 0) {
                int i12 = this.A07.A00;
                A0j(i11, fixOffset);
                this.A07.A02 = i12;
                A0L(c1968j4, this.A07, c1975jB, false);
                fixOffset = this.A07.A06;
            }
        } else {
            A0l(this.A0D);
            this.A07.A02 = extraForEnd2;
            A0L(c1968j4, this.A07, c1975jB, false);
            extra = this.A07.A06;
            int fixOffset2 = this.A07.A01;
            if (this.A07.A00 > 0) {
                iA0B += this.A07.A00;
            }
            A0m(this.A0D);
            this.A07.A02 = iA0B;
            this.A07.A01 += this.A07.A03;
            A0L(c1968j4, this.A07, c1975jB, false);
            fixOffset = this.A07.A06;
            if (this.A07.A00 > 0) {
                int i13 = this.A07.A00;
                A0i(fixOffset2, extra);
                this.A07.A02 = i13;
                A0L(c1968j4, this.A07, c1975jB, false);
                extra = this.A07.A06;
            }
        }
        if (A1T() > 0) {
            if (this.A05 ^ this.A0C) {
                int iA0J = A0J(extra, c1968j4, c1975jB, true);
                int fixOffset3 = fixOffset + iA0J;
                int extra5 = extra + iA0J;
                int iA0K = A0K(fixOffset3, c1968j4, c1975jB, false);
                fixOffset = fixOffset3 + iA0K;
                extra = extra5 + iA0K;
            } else {
                int iA0K2 = A0K(fixOffset, c1968j4, c1975jB, true);
                int fixOffset4 = fixOffset + iA0K2;
                int extra6 = extra + iA0K2;
                int iA0J2 = A0J(extra6, c1968j4, c1975jB, false);
                fixOffset = fixOffset4 + iA0J2;
                extra = extra6 + iA0J2;
            }
        }
        A0r(c1968j4, c1975jB, fixOffset, extra);
        if (!c1975jB.A07()) {
            this.A04.A0J();
        } else {
            this.A0D.A03();
        }
        this.A08 = this.A0C;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public void A2d(C1975jB c1975jB) {
        super.A2d(c1975jB);
        this.A03 = null;
        this.A01 = -1;
        this.A02 = Integer.MIN_VALUE;
        this.A0D.A03();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final void A2m(C7O c7o, C1968j4 c1968j4) {
        super.A2m(c7o, c1968j4);
        if (this.A09) {
            A2Y(c1968j4);
            c1968j4.A0Q();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public void A2o(C7O c7o, C1975jB c1975jB, int i5) {
        J5 linearSmoothScroller = new J5(c7o.getContext());
        linearSmoothScroller.A0H(i5);
        A2c(linearSmoothScroller);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final void A2p(String str) {
        if (this.A03 == null) {
            super.A2p(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final boolean A2u() {
        if (A1V() != 1073741824 && A1f() != 1073741824) {
            boolean zA2r = A2r();
            if (A0G[0].length() == 7) {
                throw new RuntimeException();
            }
            A0G[0] = "ZYU5Lu8KJdo1W8";
            if (zA2r) {
                return true;
            }
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final boolean A2v() {
        return this.A00 == 0;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public final boolean A2w() {
        return this.A00 == 1;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1960iw
    public boolean A2x() {
        return this.A03 == null && this.A08 == this.A0C;
    }

    public final int A38() {
        View child = A0V(0, A1T(), true, false);
        if (child == null) {
            return -1;
        }
        return A1o(child);
    }

    public final int A39() {
        View child = A0V(0, A1T(), false, true);
        if (child == null) {
            return -1;
        }
        return A1o(child);
    }

    public final int A3A() {
        View child = A0V(A1T() - 1, -1, false, true);
        if (child == null) {
            return -1;
        }
        return A1o(child);
    }

    public final int A3B() {
        return this.A00;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x0061, code lost:
    
        if (r4 == 1) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x0063, code lost:
    
        return -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x006b, code lost:
    
        if (r4 == 1) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0072, code lost:
    
        if (A3K() == false) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0074, code lost:
    
        return 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0075, code lost:
    
        return -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int A3C(int i5) {
        switch (i5) {
            case 1:
                int i11 = this.A00;
                String[] strArr = A0G;
                if (strArr[6].length() == strArr[7].length()) {
                    A0G[3] = "tdW2fzf";
                    break;
                }
                break;
            case 2:
                return (this.A00 != 1 && A3K()) ? -1 : 1;
            case 17:
                if (this.A00 == 0) {
                    return -1;
                }
                return Integer.MIN_VALUE;
            case 33:
                if (this.A00 == 1) {
                    return -1;
                }
                return Integer.MIN_VALUE;
            case 66:
                return this.A00 == 0 ? 1 : Integer.MIN_VALUE;
            case MRAID_DOWNLOAD_JS_ERROR_VALUE:
                int i12 = this.A00;
                if (A0G[1].charAt(30) != 'o') {
                    throw new RuntimeException();
                }
                A0G[3] = "6DQtaB3lJkGKNvmH8s9QQc68TsOBLDE";
                return i12 == 1 ? 1 : Integer.MIN_VALUE;
            default:
                return Integer.MIN_VALUE;
        }
    }

    public View A3D(C1968j4 c1968j4, C1975jB c1975jB, int i5, int i11, int i12) {
        A3E();
        View view = null;
        View view2 = null;
        int iA0B = this.A04.A0B();
        int boundsEnd = this.A04.A07();
        int boundsStart = i11 > i5 ? 1 : -1;
        while (i5 != i11) {
            View outOfBoundsMatch = A20(i5);
            int iA1o = A1o(outOfBoundsMatch);
            if (iA1o >= 0 && iA1o < i12) {
                if (((C1961ix) outOfBoundsMatch.getLayoutParams()).A02()) {
                    if (view == null) {
                        view = outOfBoundsMatch;
                    }
                } else if (this.A04.A0G(outOfBoundsMatch) >= boundsEnd || this.A04.A0D(outOfBoundsMatch) < iA0B) {
                    if (view2 == null) {
                        view2 = outOfBoundsMatch;
                    }
                } else {
                    return outOfBoundsMatch;
                }
            }
            i5 += boundsStart;
        }
        return view2 != null ? view2 : view;
    }

    public final void A3E() {
        if (this.A07 == null) {
            this.A07 = A0e();
        }
        if (this.A04 == null) {
            this.A04 = AbstractC1944ig.A02(this, this.A00);
        }
    }

    public final void A3F(int i5) {
        if (i5 != 0 && i5 != 1) {
            throw new IllegalArgumentException(A0f(0, 20, 1) + i5);
        }
        if (A0G[1].charAt(30) != 'o') {
            throw new RuntimeException();
        }
        A0G[1] = "wMuOUB68W5cmyVCUMue198JFnL9Wkeot";
        A2p(null);
        if (i5 == this.A00) {
            return;
        }
        this.A00 = i5;
        this.A04 = null;
        A28();
    }

    public final void A3G(int i5, int i11) {
        this.A01 = i5;
        this.A02 = i11;
        if (this.A03 != null) {
            this.A03.A00();
        }
        A28();
        if (A0G[1].charAt(30) != 'o') {
            throw new RuntimeException();
        }
        A0G[3] = "tDl3kZGUKMTs";
    }

    public void A3H(C1968j4 c1968j4, C1975jB c1975jB, C1939iZ c1939iZ, int i5) {
    }

    public void A3I(C1968j4 c1968j4, C1975jB c1975jB, C1941ib c1941ib, C1940ia c1940ia) {
        int iA1d;
        int right;
        int iA1b;
        int iA0F;
        View viewA03 = c1941ib.A03(c1968j4);
        if (viewA03 == null) {
            c1940ia.A01 = true;
            return;
        }
        C1961ix c1961ix = (C1961ix) viewA03.getLayoutParams();
        if (c1941ib.A08 == null) {
            if (this.A05 == (c1941ib.A05 == -1)) {
                A2L(viewA03);
            } else {
                A2N(viewA03, 0);
            }
        } else {
            boolean z11 = this.A05;
            int bottom = c1941ib.A05;
            if (z11 == (bottom == -1)) {
                A2K(viewA03);
            } else {
                A2M(viewA03, 0);
            }
        }
        A2O(viewA03, 0, 0);
        c1940ia.A00 = this.A04.A0E(viewA03);
        if (this.A00 == 1) {
            if (A3K()) {
                iA0F = A1e() - A1c();
                iA1b = iA0F - this.A04.A0F(viewA03);
            } else {
                iA1b = A1b();
                iA0F = this.A04.A0F(viewA03) + iA1b;
            }
            if (c1941ib.A05 == -1) {
                right = c1941ib.A06;
                iA1d = c1941ib.A06 - c1940ia.A00;
            } else {
                iA1d = c1941ib.A06;
                right = c1941ib.A06 + c1940ia.A00;
            }
        } else {
            iA1d = A1d();
            right = this.A04.A0F(viewA03) + iA1d;
            int bottom2 = c1941ib.A05;
            if (bottom2 == -1) {
                iA0F = c1941ib.A06;
                int i5 = c1941ib.A06;
                int bottom3 = c1940ia.A00;
                iA1b = i5 - bottom3;
            } else {
                iA1b = c1941ib.A06;
                int i11 = c1941ib.A06;
                int bottom4 = c1940ia.A00;
                iA0F = i11 + bottom4;
            }
        }
        A2P(viewA03, iA1b, iA1d, iA0F, right);
        if (c1961ix.A02() || c1961ix.A01()) {
            c1940ia.A03 = true;
        }
        c1940ia.A02 = viewA03.hasFocusable();
    }

    public void A3J(C1975jB c1975jB, C1941ib c1941ib, InterfaceC1958iu interfaceC1958iu) {
        int i5 = c1941ib.A01;
        if (i5 >= 0) {
            int pos = c1975jB.A03();
            if (i5 < pos) {
                int pos2 = c1941ib.A07;
                interfaceC1958iu.A4S(i5, Math.max(0, pos2));
            }
        }
    }

    public final boolean A3K() {
        return A1X() == 1;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1972j8
    public final PointF A5f(int i5) {
        if (A1T() == 0) {
            return null;
        }
        int i11 = (i5 < A1o(A20(0))) != this.A05 ? -1 : 1;
        int i12 = this.A00;
        int firstChildPos = A0G[0].length();
        if (firstChildPos == 7) {
            throw new RuntimeException();
        }
        A0G[5] = "5EjIyJt0kzQOvAP28HqeuGPqaebz9kN";
        if (i12 == 0) {
            return new PointF(i11, 0.0f);
        }
        return new PointF(0.0f, i11);
    }
}
