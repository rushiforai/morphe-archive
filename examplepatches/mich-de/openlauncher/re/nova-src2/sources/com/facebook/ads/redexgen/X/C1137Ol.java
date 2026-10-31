package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import org.checkerframework.checker.nullness.qual.EnsuresNonNullIf;

/* renamed from: com.facebook.ads.redexgen.X.Ol, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1137Ol extends AbstractC1498bN {
    public static byte[] A05;
    public static String[] A06 = {"f4hmizXnk4eUcZYhGb2hTcaGj4LsWpJG", "vO8iNNOKmtT0aojzPvJ07La63dWK77mZ", "YVEe1lt0HfKCogOnzou4wstWnYjMmQeq", "sPHBhQiWjr4nmZeUAWCadqMd1tIUNzKa", "acQN", "up1PPXAggeJlG1052YaAMkLDvw3y9Bmq", "4IZNn8Fc1vNv", "OdFj"};
    public int A00;
    public ZT A01;
    public ZV A02;
    public C1499bO A03;
    public boolean A04;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final C1499bO A02(C1084Mk c1084Mk) throws IOException {
        if (this.A02 == null) {
            this.A02 = ZW.A06(c1084Mk);
            return null;
        }
        if (this.A01 == null) {
            this.A01 = ZW.A04(c1084Mk);
            return null;
        }
        ZV zv2 = this.A02;
        ZT zt2 = this.A01;
        byte[] bArr = new byte[c1084Mk.A0A()];
        System.arraycopy(c1084Mk.A0l(), 0, bArr, 0, c1084Mk.A0A());
        return new C1499bO(zv2, zt2, bArr, ZW.A0D(c1084Mk, zv2.A05), ZW.A00(r6.length - 1));
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 29);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A05 = new byte[]{62, 42, 59, 54, 48, 112, 41, 48, 45, 61, 54, 44};
    }

    static {
        A04();
    }

    public static int A00(byte b11, int i5, int i11) {
        return (b11 >> i11) & (255 >>> (8 - i5));
    }

    public static int A01(byte b11, C1499bO c1499bO) {
        if (!c1499bO.A04[A00(b11, c1499bO.A00, 1)].A03) {
            int modeNumber = c1499bO.A02.A03;
            return modeNumber;
        }
        int modeNumber2 = c1499bO.A02.A04;
        return modeNumber2;
    }

    public static void A05(C1084Mk c1084Mk, long j11) {
        if (c1084Mk.A08() < c1084Mk.A0A() + 4) {
            c1084Mk.A0i(Arrays.copyOf(c1084Mk.A0l(), c1084Mk.A0A() + 4));
        } else {
            c1084Mk.A0e(c1084Mk.A0A() + 4);
        }
        byte[] bArrA0l = c1084Mk.A0l();
        int iA0A = c1084Mk.A0A() - 4;
        byte b11 = (byte) (j11 & 255);
        String[] strArr = A06;
        if (strArr[2].charAt(2) == strArr[0].charAt(2)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A06;
        strArr2[2] = "qaWAiaxYqTAD5Oj7eR7fE5Vz9sMQGbQK";
        strArr2[0] = "w9RFcpU6ob8zEcu9yY8sByQC8cPGnUwn";
        bArrA0l[iA0A] = b11;
        bArrA0l[c1084Mk.A0A() - 3] = (byte) ((j11 >>> 8) & 255);
        bArrA0l[c1084Mk.A0A() - 2] = (byte) ((j11 >>> 16) & 255);
        bArrA0l[c1084Mk.A0A() - 1] = (byte) (255 & (j11 >>> 24));
    }

    public static boolean A06(C1084Mk c1084Mk) {
        try {
            return ZW.A0C(1, c1084Mk, true);
        } catch (L9 unused) {
            return false;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    public final long A0E(C1084Mk c1084Mk) {
        int i5 = 0;
        if ((c1084Mk.A0l()[0] & 1) == 1) {
            return -1L;
        }
        int iA01 = A01(c1084Mk.A0l()[0], (C1499bO) AbstractC1062Ln.A02(this.A03));
        if (this.A04) {
            int packetBlockSize = this.A00;
            i5 = (packetBlockSize + iA01) / 4;
        }
        A05(c1084Mk, i5);
        this.A04 = true;
        this.A00 = iA01;
        return i5;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    public final void A0F(long j11) {
        super.A0F(j11);
        this.A04 = j11 != 0;
        this.A00 = this.A02 != null ? this.A02.A03 : 0;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    public final void A0I(boolean z11) {
        super.A0I(z11);
        if (z11) {
            this.A03 = null;
            this.A02 = null;
            this.A01 = null;
        }
        this.A00 = 0;
        String[] strArr = A06;
        if (strArr[5].charAt(31) == strArr[1].charAt(31)) {
            throw new RuntimeException();
        }
        A06[3] = "2Qx3QXABpUk6ZDyrPRepkIvunbBSV8Ku";
        this.A04 = false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    @EnsuresNonNullIf
    public final boolean A0J(C1084Mk c1084Mk, long j11, C1497bM c1497bM) throws IOException {
        if (this.A03 != null) {
            AbstractC1062Ln.A01(c1497bM.A00);
            return false;
        }
        this.A03 = A02(c1084Mk);
        if (this.A03 == null) {
            return true;
        }
        C1499bO c1499bO = this.A03;
        ZV zv2 = c1499bO.A02;
        ArrayList<byte[]> codecInitializationData = new ArrayList<>();
        codecInitializationData.add(zv2.A09);
        codecInitializationData.add(c1499bO.A03);
        c1497bM.A00 = new C1029Ke().A11(A03(0, 12, 66)).A0a(zv2.A02).A0j(zv2.A00).A0b(zv2.A05).A0m(zv2.A06).A12(codecInitializationData).A0v(ZW.A02(XR.A02(c1499bO.A01.A02))).A14();
        return true;
    }
}
