package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.checkerframework.checker.nullness.qual.EnsuresNonNullIf;

/* renamed from: com.facebook.ads.redexgen.X.Ou, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1146Ou extends AbstractC1498bN {
    public static String[] A02 = {"TnwZAmxDKpyiewBHq1zALDGPAC", "qh", "aThQ", "z0ej3MYGCGwekuoCvJxS7B9Et33A8ru0", "QOafhvN4Pp3vgl3mCXMQpfXUIS1cyRXp", "w4mPGiXHbzN1hKRmoyPK0EUKM", "y05ALp6FvEZ4aBhjZJ5maRhlyCG1wwv5", "XQXtqklqAEfO74j7cCui9ELoqD"};
    public Z5 A00;
    public C1147Ov A01;

    private int A00(C1084Mk c1084Mk) {
        int i5 = (c1084Mk.A0l()[2] & 255) >> 4;
        if (i5 == 6 || i5 == 7) {
            c1084Mk.A0g(4);
            c1084Mk.A0S();
        }
        int result = Z1.A00(c1084Mk, i5);
        c1084Mk.A0f(0);
        return result;
    }

    public static boolean A01(C1084Mk c1084Mk) {
        return c1084Mk.A07() >= 5 && c1084Mk.A0I() == 127 && c1084Mk.A0Q() == 1179402563;
    }

    public static boolean A02(byte[] bArr) {
        return bArr[0] == -1;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    public final long A0E(C1084Mk c1084Mk) {
        if (!A02(c1084Mk.A0l())) {
            return -1L;
        }
        int iA00 = A00(c1084Mk);
        if (A02[2].length() != 4) {
            throw new RuntimeException();
        }
        A02[5] = "pKTAGQ1wxe";
        return iA00;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    public final void A0I(boolean z11) {
        super.A0I(z11);
        if (z11) {
            this.A00 = null;
            this.A01 = null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x006d, code lost:
    
        if (r3 != false) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0071, code lost:
    
        if (r7.A01 == null) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0073, code lost:
    
        r7.A01.A00(r9);
        r11.A01 = r7.A01;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x007c, code lost:
    
        com.facebook.ads.redexgen.X.AbstractC1062Ln.A01(r11.A00);
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0081, code lost:
    
        return false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x008e, code lost:
    
        if (r3 != false) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0091, code lost:
    
        return true;
     */
    @Override // com.facebook.ads.redexgen.X.AbstractC1498bN
    @EnsuresNonNullIf
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A0J(C1084Mk c1084Mk, long j11, C1497bM c1497bM) {
        byte[] bArrA0l = c1084Mk.A0l();
        Z5 z52 = this.A00;
        if (z52 == null) {
            Z5 z53 = new Z5(bArrA0l, 17);
            this.A00 = z53;
            c1497bM.A00 = z53.A08(Arrays.copyOfRange(bArrA0l, 9, c1084Mk.A0A()), null);
            return true;
        }
        if (A02[2].length() != 4) {
            throw new RuntimeException();
        }
        A02[2] = "cbra";
        if ((bArrA0l[0] & AbstractJsonLexerKt.TC_INVALID) == 3) {
            Z4 z4A03 = Z3.A03(c1084Mk);
            Z5 streamMetadata = z52.A09(z4A03);
            this.A00 = streamMetadata;
            this.A01 = new C1147Ov(streamMetadata, z4A03);
            return true;
        }
        boolean zA02 = A02(bArrA0l);
        String[] strArr = A02;
        if (strArr[0].length() == strArr[7].length()) {
            String[] strArr2 = A02;
            strArr2[0] = "b73cmtYX3wIJs4UOVfH1bb1hIz";
            strArr2[7] = "IA5SzLN2NEFqdpoOdBfp6xAjdj";
        }
    }
}
