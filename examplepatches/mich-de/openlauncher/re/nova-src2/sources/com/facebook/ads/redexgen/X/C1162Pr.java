package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.io.IOException;
import java.util.Map;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* renamed from: com.facebook.ads.redexgen.X.Pr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1162Pr implements InterfaceC1383Yv {
    public static String[] A0G = {"ZOmDgtZXmbFplr4c", "6ifjKlWOi9qvORbA9AVWUceA2bCMNiC7", "iEnYLP6UxGmGKJn1fOE", "AGvE2CL8JEBQx1euKr4BMx1GEB8reAkr", "pwFgt2PbV7oDiKWKDjaxKcLr059crOAE", "6BIprHsiJ0DYPURFpCJrGC", "G7oyaBjMYnTwXAC1EzLODbaBAwZ3L", "6NoG64DO59zvCB139pJVMaDXP65Qg"};
    public static final InterfaceC1387Yz A0H = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.Ps
        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final InterfaceC1383Yv[] A5w() {
            return C1162Pr.A07();
        }

        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
            return AbstractC1386Yy.A01(this, uri, map);
        }
    };
    public int A00;
    public int A02;
    public int A03;
    public long A04;
    public long A05;
    public InterfaceC1384Yw A06;
    public C1164Pt A07;
    public C1159Po A08;
    public boolean A09;
    public boolean A0A;
    public final C1084Mk A0C = new C1084Mk(4);
    public final C1084Mk A0B = new C1084Mk(9);
    public final C1084Mk A0E = new C1084Mk(11);
    public final C1084Mk A0D = new C1084Mk();
    public final C1161Pq A0F = new C1161Pq();
    public int A01 = 1;

    private long A00() {
        if (this.A09) {
            return this.A04 + this.A05;
        }
        if (this.A0F.A0D() == -9223372036854775807L) {
            return 0L;
        }
        return this.A05;
    }

    private C1084Mk A01(Q9 q92) throws IOException {
        if (this.A02 > this.A0D.A08()) {
            this.A0D.A0j(new byte[Math.max(this.A0D.A08() * 2, this.A02)], 0);
        } else {
            this.A0D.A0f(0);
        }
        this.A0D.A0e(this.A02);
        q92.readFully(this.A0D.A0l(), 0, this.A02);
        return this.A0D;
    }

    @RequiresNonNull
    private void A02() {
        if (!this.A0A) {
            this.A06.AKP(new Q4(-9223372036854775807L));
            this.A0A = true;
        }
    }

    private void A03(Q9 q92) throws IOException {
        q92.ALL(this.A00);
        this.A00 = 0;
        this.A01 = 3;
    }

    @RequiresNonNull
    private boolean A04(Q9 q92) throws IOException {
        if (!q92.AIe(this.A0B.A0l(), 0, 9, true)) {
            return false;
        }
        this.A0B.A0f(0);
        this.A0B.A0g(4);
        int iA0I = this.A0B.A0I();
        int flags = iA0I & 4;
        boolean hasVideo = flags != 0;
        int flags2 = iA0I & 1;
        boolean z11 = flags2 != 0;
        if (hasVideo && this.A07 == null) {
            this.A07 = new C1164Pt(this.A06.ALm(8, 1));
        }
        if (z11) {
            C1159Po c1159Po = this.A08;
            if (A0G[3].charAt(19) == 'h') {
                throw new RuntimeException();
            }
            String[] strArr = A0G;
            strArr[4] = "Khy5rYPINuKpMGIOp9isTczNww9cV1Ap";
            strArr[1] = "30smAkr6jQBG63zglwQ3OcXDj5jlu3KR";
            if (c1159Po == null) {
                this.A08 = new C1159Po(this.A06.ALm(9, 2));
            }
        }
        this.A06.A6x();
        int flags3 = this.A0B.A0C();
        this.A00 = (flags3 - 9) + 4;
        this.A01 = 2;
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x008e  */
    @RequiresNonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean A05(Q9 q92) throws IOException {
        boolean z11 = true;
        boolean zA00 = false;
        long jA00 = A00();
        if (this.A03 == 8 && this.A07 != null) {
            A02();
            zA00 = this.A07.A00(A01(q92), jA00);
        } else if (this.A03 == 9 && this.A08 != null) {
            A02();
            zA00 = this.A08.A00(A01(q92), jA00);
        } else if (this.A03 == 18) {
            boolean wasConsumed = this.A0A;
            if (!wasConsumed) {
                zA00 = this.A0F.A00(A01(q92), jA00);
                long timestampUs = this.A0F.A0D();
                if (timestampUs != -9223372036854775807L) {
                    this.A06.AKP(new Q5(this.A0F.A0E(), this.A0F.A0F(), timestampUs));
                    this.A0A = true;
                }
            } else {
                q92.ALL(this.A02);
                z11 = false;
            }
        }
        boolean z12 = this.A09;
        String[] strArr = A0G;
        if (strArr[4].charAt(21) != strArr[1].charAt(21)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0G;
        strArr2[0] = "wqdT2H3TTMqi8Bli";
        strArr2[5] = "zAA6sZzKbZJelK7aosqVbg";
        if (!z12 && zA00) {
            this.A09 = true;
            this.A04 = this.A0F.A0D() == -9223372036854775807L ? -this.A05 : 0L;
        }
        this.A00 = 4;
        this.A01 = 2;
        return z11;
    }

    private boolean A06(Q9 q92) throws IOException {
        if (!q92.AIe(this.A0E.A0l(), 0, 11, true)) {
            return false;
        }
        this.A0E.A0f(0);
        this.A03 = this.A0E.A0I();
        this.A02 = this.A0E.A0K();
        this.A05 = this.A0E.A0K();
        this.A05 = ((this.A0E.A0I() << 24) | this.A05) * 1000;
        this.A0E.A0g(3);
        this.A01 = 4;
        return true;
    }

    public static /* synthetic */ InterfaceC1383Yv[] A07() {
        return new InterfaceC1383Yv[]{new C1162Pr()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A06 = interfaceC1384Yw;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        AbstractC1062Ln.A02(this.A06);
        while (true) {
            switch (this.A01) {
                case 1:
                    if (!A04(q92)) {
                        return -1;
                    }
                    break;
                case 2:
                    A03(q92);
                    break;
                case 3:
                    if (!A06(q92)) {
                        return -1;
                    }
                    break;
                case 4:
                    if (!A05(q92)) {
                        break;
                    } else {
                        return 0;
                    }
                default:
                    throw new IllegalStateException();
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        if (j11 == 0) {
            this.A01 = 1;
            this.A09 = false;
        } else {
            this.A01 = 3;
        }
        this.A00 = 0;
        String[] strArr = A0G;
        if (strArr[0].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        A0G[2] = "rlYOLfOM7omH4Sms69M";
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        q92.AI6(this.A0C.A0l(), 0, 3);
        this.A0C.A0f(0);
        if (this.A0C.A0K() != 4607062) {
            return false;
        }
        q92.AI6(this.A0C.A0l(), 0, 2);
        this.A0C.A0f(0);
        if ((this.A0C.A0M() & androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION) != 0) {
            return false;
        }
        q92.AI6(this.A0C.A0l(), 0, 4);
        this.A0C.A0f(0);
        int dataOffset = this.A0C.A0C();
        q92.AK3();
        q92.A4X(dataOffset);
        q92.AI6(this.A0C.A0l(), 0, 4);
        this.A0C.A0f(0);
        int dataOffset2 = this.A0C.A0C();
        return dataOffset2 == 0;
    }
}
