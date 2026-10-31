package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.util.SparseArray;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Map;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* renamed from: com.facebook.ads.redexgen.X.Nx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1123Nx implements InterfaceC1383Yv {
    public static String[] A0B = {"KD", "kcMNvio4G3DEX28ais91M9OdSvZXUzpH", "jMSpLO78YTulddvolRwlpZfkxqB5QQvI", "2s3G2SNp8sXZvbPUX00cHrQTL9epTMX1", "UHgtdTaxHkIm3hLRbOUK", "thfc7mFxeR2nMxavOWYbMiHLyEGGeD0r", "UwXZ0Io3IdfFHjfODXhM8U7", "6tOn2tG0jzsHhwaJBsZkxAEhN0GSuDUK"};
    public static final InterfaceC1387Yz A0C = new InterfaceC1387Yz() { // from class: com.facebook.ads.redexgen.X.Ny
        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final InterfaceC1383Yv[] A5w() {
            return C1123Nx.A01();
        }

        @Override // com.facebook.ads.redexgen.X.InterfaceC1387Yz
        public final /* synthetic */ InterfaceC1383Yv[] A5x(Uri uri, Map map) {
            return AbstractC1386Yy.A01(this, uri, map);
        }
    };
    public long A00;
    public InterfaceC1384Yw A01;
    public C1125Nz A02;
    public boolean A03;
    public boolean A04;
    public boolean A05;
    public boolean A06;
    public final SparseArray<C1592ct> A07;
    public final C1084Mk A08;
    public final C1092Ms A09;
    public final C1591cs A0A;

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0088, code lost:
    
        if (r1 < 4) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x008a, code lost:
    
        return -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x008b, code lost:
    
        if (r1 < 4) goto L28;
     */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0170  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x01eb  */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int AIY(Q9 q92, ZH zh2) throws IOException {
        long j11;
        AbstractC1062Ln.A02(this.A01);
        long jA90 = q92.A90();
        if ((jA90 != -1) && !this.A0A.A0E()) {
            return this.A0A.A0B(q92, zh2);
        }
        A00(jA90);
        String[] strArr = A0B;
        if (strArr[0].length() == strArr[1].length()) {
            throw new RuntimeException();
        }
        A0B[2] = "KvsGu6Q7sBIl30M4HFqDUFvOdO79urBf";
        if (this.A02 != null && this.A02.A0B()) {
            return this.A02.A08(q92, zh2);
        }
        q92.AK3();
        long jA9L = jA90 != -1 ? jA90 - q92.A9L() : -1L;
        if (jA9L != -1) {
            String[] strArr2 = A0B;
            if (strArr2[6].length() != strArr2[4].length()) {
                String[] strArr3 = A0B;
                strArr3[6] = "au3y3uhTRFkuh11XmywePlM";
                strArr3[4] = "lD1X4wxQ7ed4UqvlEkcn";
            }
        }
        if (!q92.AI7(this.A08.A0l(), 0, 4, true)) {
            return -1;
        }
        this.A08.A0f(0);
        int iA0C = this.A08.A0C();
        if (iA0C == 441) {
            return -1;
        }
        if (iA0C == 442) {
            q92.AI6(this.A08.A0l(), 0, 10);
            this.A08.A0f(9);
            q92.ALL((this.A08.A0I() & 7) + 14);
            return 0;
        }
        if (iA0C == 443) {
            q92.AI6(this.A08.A0l(), 0, 2);
            this.A08.A0f(0);
            q92.ALL(this.A08.A0M() + 6);
            return 0;
        }
        if (((iA0C & (-256)) >> 8) != 1) {
            q92.ALL(1);
            return 0;
        }
        int i5 = iA0C & 255;
        C1592ct c1592ct = this.A07.get(i5);
        if (!this.A03) {
            if (c1592ct == null) {
                InterfaceC1580ch ob2 = null;
                if (A0B[5].charAt(24) == '1') {
                    throw new RuntimeException();
                }
                String[] strArr4 = A0B;
                strArr4[6] = "Np7q2NQSHnfG2fs3d63EHjd";
                strArr4[4] = "oXEUzeHzUACN3ZH4kaDX";
                if (i5 == 189) {
                    ob2 = new ON();
                    this.A04 = true;
                    this.A00 = q92.A9Q();
                } else if ((i5 & Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE) == 192) {
                    ob2 = new O3();
                    this.A04 = true;
                    this.A00 = q92.A9Q();
                } else if ((i5 & 240) == 224) {
                    ob2 = new OB();
                    this.A05 = true;
                    this.A00 = q92.A9Q();
                }
                if (ob2 != null) {
                    ob2.A6B(this.A01, new C1601d2(i5, 256));
                    c1592ct = new C1592ct(ob2, this.A09);
                    this.A07.put(i5, c1592ct);
                }
            }
            if (this.A04) {
                boolean z11 = this.A05;
                if (A0B[3].charAt(14) != 'V') {
                    A0B[7] = "UqYoYupgce0qmcaUzpVQJmHCPh2jIG1i";
                    j11 = z11 ? this.A00 + 8192 : 1048576L;
                } else {
                    A0B[5] = "ohW1HOsx5FUJanJe9lHCzXvJlIH7RFAd";
                    if (z11) {
                    }
                }
                if (q92.A9Q() > j11) {
                    this.A03 = true;
                    this.A01.A6x();
                }
            }
        }
        q92.AI6(this.A08.A0l(), 0, 2);
        this.A08.A0f(0);
        int iA0M = this.A08.A0M() + 6;
        if (c1592ct == null) {
            q92.ALL(iA0M);
        } else {
            this.A08.A0d(iA0M);
            q92.readFully(this.A08.A0l(), 0, iA0M);
            this.A08.A0f(6);
            c1592ct.A03(this.A08);
            this.A08.A0e(this.A08.A08());
        }
        String[] strArr5 = A0B;
        if (strArr5[0].length() == strArr5[1].length()) {
            return 0;
        }
        A0B[7] = "dBIllPwXP7HhXVaLQw6c9dyi7QtSDZsI";
        return 0;
    }

    public C1123Nx() {
        this(new C1092Ms(0L));
    }

    public C1123Nx(C1092Ms c1092Ms) {
        this.A09 = c1092Ms;
        this.A08 = new C1084Mk(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
        this.A07 = new SparseArray<>();
        this.A0A = new C1591cs();
    }

    @RequiresNonNull
    private void A00(long j11) {
        if (!this.A06) {
            this.A06 = true;
            if (this.A0A.A0C() != -9223372036854775807L) {
                this.A02 = new C1125Nz(this.A0A.A0D(), this.A0A.A0C(), j11);
                this.A01.AKP(this.A02.A09());
            } else {
                this.A01.AKP(new Q4(this.A0A.A0C()));
            }
        }
    }

    public static /* synthetic */ InterfaceC1383Yv[] A01() {
        return new InterfaceC1383Yv[]{new C1123Nx()};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AAq(InterfaceC1384Yw interfaceC1384Yw) {
        this.A01 = interfaceC1384Yw;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AIp() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final void AKO(long j11, long j12) {
        boolean z11 = false;
        boolean resetTimestampAdjuster = this.A09.A04() == -9223372036854775807L;
        if (!resetTimestampAdjuster) {
            long jA02 = this.A09.A02();
            if (jA02 != -9223372036854775807L && jA02 != 0 && jA02 != j12) {
                z11 = true;
            }
            resetTimestampAdjuster = z11;
        }
        if (resetTimestampAdjuster) {
            this.A09.A07(j12);
        }
        if (this.A02 != null) {
            this.A02.A0A(j12);
        }
        for (int i5 = 0; i5 < this.A07.size(); i5++) {
            this.A07.valueAt(i5).A02();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1383Yv
    public final boolean ALN(Q9 q92) throws IOException {
        byte[] bArr = new byte[14];
        q92.AI6(bArr, 0, 14);
        if (442 != (((bArr[0] & 255) << 24) | ((bArr[1] & 255) << 16) | ((bArr[2] & 255) << 8) | (bArr[3] & 255)) || (bArr[4] & 196) != 68 || (bArr[6] & 4) != 4 || (bArr[8] & 4) != 4 || (bArr[9] & 1) != 1 || (bArr[12] & 3) != 3) {
            return false;
        }
        int packStuffingLength = bArr[13] & 7;
        q92.A4X(packStuffingLength);
        q92.AI6(bArr, 0, 3);
        int packStuffingLength2 = bArr[0];
        int i5 = (packStuffingLength2 & 255) << 16;
        int packStuffingLength3 = bArr[1];
        int i11 = i5 | ((packStuffingLength3 & 255) << 8);
        int packStuffingLength4 = bArr[2];
        return 1 == ((packStuffingLength4 & 255) | i11);
    }
}
