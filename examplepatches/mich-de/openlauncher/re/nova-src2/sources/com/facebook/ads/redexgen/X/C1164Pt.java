package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Pt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1164Pt extends AbstractC1394Zg {
    public static byte[] A03;
    public static String[] A04 = {"cwKPgcDxQqSwLVVQELp9bbZKCqW2fYMY", "DcD4H6cvJNFGOch4DZZ", "HmuDAeT", "MV0xSeIo98jdtWfuEBVaVTM5BunnSac8", "udXiIF1tmpILKj", "XN7xHJl0ang0BApPoxGfzkNNgR5gmJr7", "T52Kaur", "oifYkOYfoN4"};
    public static final int[] A05;
    public int A00;
    public boolean A01;
    public boolean A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 44);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{109, -95, -112, -107, -101, 76, -110, -101, -98, -103, -115, -96, 76, -102, -101, -96, 76, -97, -95, -100, -100, -101, -98, -96, -111, -112, 102, 76, -2, 18, 1, 6, 12, -52, 4, -44, -50, -50, -54, -2, 9, -2, 20, -31, -11, -28, -23, -17, -81, -25, -73, -79, -79, -83, -19, -20, -31, -9, -81, -61, -78, -73, -67, 125, -69, -66, -126, -81, 123, -70, -81, -62, -69, -66, -46, -63, -58, -52, -116, -54, -51, -62, -60};
    }

    static {
        A01();
        A05 = new int[]{5512, 11025, 22050, 44100};
    }

    public C1164Pt(ZP zp2) {
        super(zp2);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1394Zg
    public final boolean A0B(C1084Mk c1084Mk) throws C1160Pp {
        if (!this.A02) {
            int iA0I = c1084Mk.A0I();
            int header = iA0I >> 4;
            this.A00 = header & 15;
            if (this.A00 == 2) {
                int header2 = iA0I >> 2;
                super.A00.A7E(new C1029Ke().A11(A00(73, 10, 49)).A0b(1).A0m(A05[header2 & 3]).A14());
                this.A01 = true;
            } else if (this.A00 == 7 || this.A00 == 8) {
                super.A00.A7E(new C1029Ke().A11(this.A00 == 7 ? A00(28, 15, 113) : A00(43, 15, 84)).A0b(1).A0m(8000).A14());
                this.A01 = true;
            } else if (this.A00 != 10) {
                throw new C1160Pp(A00(0, 28, 0) + this.A00);
            }
            this.A02 = true;
        } else {
            c1084Mk.A0g(1);
        }
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0053, code lost:
    
        if (r6 == false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0055, code lost:
    
        r0 = r14.A07();
        r5 = new byte[r0];
        r0 = r5.length;
        r14.A0k(r5, 0, r0);
        r7 = com.facebook.ads.redexgen.X.YZ.A03(r5);
        r1 = new com.facebook.ads.redexgen.X.C1029Ke().A11(A00(58, 15, 34)).A0w(r7.A02);
        r0 = r7.A00;
        r1 = r1.A0b(r0);
        r0 = r7.A01;
        r13.A00.A7E(r1.A0m(r0).A12(java.util.Collections.singletonList(r5)).A14());
        r13.A01 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x009b, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x009c, code lost:
    
        if (r6 == false) goto L16;
     */
    @Override // com.facebook.ads.redexgen.X.AbstractC1394Zg
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A0C(C1084Mk c1084Mk, long j11) throws L9 {
        if (this.A00 == 2) {
            int iA07 = c1084Mk.A07();
            if (A04[5].charAt(6) != 'l') {
                throw new RuntimeException();
            }
            A04[3] = "Z6NslPj4LWXVgCk6NVecY9IZYFeIgrup";
            super.A00.AK9(c1084Mk, iA07);
            super.A00.AKC(j11, 1, iA07, 0, null);
            return true;
        }
        int iA0I = c1084Mk.A0I();
        if (iA0I == 0) {
            boolean z11 = this.A01;
            if (A04[0].charAt(18) != 'P') {
                A04[3] = "OBVJrK5FTOFCpAWewp2IsecHctW31BOX";
            }
        }
        if (this.A00 == 10 && iA0I != 1) {
            return false;
        }
        int iA072 = c1084Mk.A07();
        super.A00.AK9(c1084Mk, iA072);
        super.A00.AKC(j11, 1, iA072, 0, null);
        return true;
    }
}
