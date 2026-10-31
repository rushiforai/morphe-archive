package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.jM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1986jM {
    public static byte[] A02;
    public static String[] A03 = {"WXpxlTya5H7kpLIT7UUfzIgXOYds4Vfk", "JVDNa5tAOP", "C1CZfaM4quGDjTOWU4x6KBGTC5pPu33J", "VymAVHyd", "K8p7KG0zsDoAf7GmBTiUCUpdPzk9iS4o", "MydLOSuorekD0WEADrXIrTB2aFx1Ufvf", "1zIVUT6Fxq52O6VZbnoN9TsXnO1jN3fj", "z9Q03TMU5lxkReREt3I6AE4mCa6N3G46"};
    public final JR<AbstractC1978jE, C1984jK> A00 = new JR<>();
    public final C1844h0<AbstractC1978jE> A01 = new C1844h0<>();

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 71);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{-99, -59, -61, -60, 112, -64, -62, -65, -58, -71, -76, -75, 112, -74, -68, -79, -73, 112, -96, -94, -107, 112, -65, -62, 112, -96, -97, -93, -92};
    }

    static {
        A02();
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0041, code lost:
    
        if (r5 != 0) goto L12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0043, code lost:
    
        r1 = r3.A00;
        r0 = ~r9;
        r3.A00 = r1 & r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x004a, code lost:
    
        if (r9 != 4) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x004c, code lost:
    
        r5 = r3.A02;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x004e, code lost:
    
        r6 = r3.A00;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x005d, code lost:
    
        if (com.facebook.ads.redexgen.X.C1986jM.A03[5].charAt(20) == 'R') goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x005f, code lost:
    
        r2 = com.facebook.ads.redexgen.X.C1986jM.A03;
        r2[0] = "LDlhycQGZBtlD6IMRSONBH11SqKxQWfy";
        r2[6] = "DCgYh9gvbnrpKHe96mnmPCff01xTtOfJ";
        r0 = r6 & 12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x006d, code lost:
    
        if (r0 != 0) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x006f, code lost:
    
        r7.A00.A0B(r4);
        com.facebook.ads.redexgen.X.C1984jK.A02(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0077, code lost:
    
        return r5;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0078, code lost:
    
        r2 = com.facebook.ads.redexgen.X.C1986jM.A03;
        r2[7] = "9mfdPnfY5V3FVy8Q2gQ6uDsmmOIXndsz";
        r2[2] = "ekMjHGebRREBiMI4gT56rHDvbCCByAvd";
        r0 = r6 & 12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0086, code lost:
    
        if (r0 != 0) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0089, code lost:
    
        r2 = com.facebook.ads.redexgen.X.C1986jM.A03;
        r1 = r2[7];
        r2 = r2[2];
        r1 = r1.charAt(19);
        r0 = r2.charAt(19);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x009d, code lost:
    
        if (r1 == r0) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00a4, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x00a5, code lost:
    
        r2 = com.facebook.ads.redexgen.X.C1986jM.A03;
        r2[1] = "AZoo0ocwP6";
        r2[3] = "Mxzo3dXJ";
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00b1, code lost:
    
        if (r9 != 8) goto L34;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x00b3, code lost:
    
        r5 = r3.A01;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00c2, code lost:
    
        if (r5 != 0) goto L12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00d4, code lost:
    
        throw new java.lang.IllegalArgumentException(A01(0, 29, 9));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private C1955ir A00(AbstractC1978jE abstractC1978jE, int i5) {
        int iA09 = this.A00.A09(abstractC1978jE);
        if (iA09 < 0) {
            return null;
        }
        JR<AbstractC1978jE, C1984jK> jr2 = this.A00;
        if (A03[5].charAt(20) == 'R') {
            throw new RuntimeException();
        }
        A03[5] = "RHZyqyNxFTR6m1AGKtHrgUPkGPlMmpqW";
        C1984jK c1984jKA0C = jr2.A0C(iA09);
        if (c1984jKA0C != null) {
            int i11 = c1984jKA0C.A00 & i5;
            String[] strArr = A03;
            String str = strArr[0];
            String str2 = strArr[6];
            int iCharAt = str.charAt(30);
            int index = str2.charAt(30);
            if (iCharAt == index) {
                String[] strArr2 = A03;
                strArr2[0] = "nmlFinlgwywloeecjd6T2DESHLiwmDf9";
                strArr2[6] = "PTtZpiu630HNHwiWHX52cLnM9FmNSlfo";
            }
        }
        return null;
    }

    public final C1955ir A03(AbstractC1978jE abstractC1978jE) {
        return A00(abstractC1978jE, 8);
    }

    public final C1955ir A04(AbstractC1978jE abstractC1978jE) {
        return A00(abstractC1978jE, 4);
    }

    public final AbstractC1978jE A05(long j11) {
        return this.A01.A08(j11);
    }

    public final void A06() {
        this.A00.clear();
        this.A01.A09();
    }

    public final void A07() {
        C1984jK.A01();
    }

    public final void A08(long j11, AbstractC1978jE abstractC1978jE) {
        this.A01.A0B(j11, abstractC1978jE);
    }

    public final void A09(AbstractC1978jE abstractC1978jE) {
        C1984jK c1984jKA00 = this.A00.get(abstractC1978jE);
        if (c1984jKA00 == null) {
            c1984jKA00 = C1984jK.A00();
            this.A00.put(abstractC1978jE, c1984jKA00);
        }
        c1984jKA00.A00 |= 1;
    }

    public final void A0A(AbstractC1978jE abstractC1978jE) {
        C1984jK c1984jK = this.A00.get(abstractC1978jE);
        if (c1984jK == null) {
            return;
        }
        c1984jK.A00 &= -2;
    }

    public final void A0B(AbstractC1978jE abstractC1978jE) {
        int iA06 = this.A01.A06() - 1;
        while (true) {
            if (iA06 < 0) {
                break;
            }
            if (abstractC1978jE == this.A01.A07(iA06)) {
                this.A01.A0A(iA06);
                break;
            }
            iA06--;
        }
        C1984jK info = this.A00.remove(abstractC1978jE);
        if (info != null) {
            C1984jK.A02(info);
        }
    }

    public final void A0C(AbstractC1978jE abstractC1978jE) {
        A0A(abstractC1978jE);
    }

    public final void A0D(AbstractC1978jE abstractC1978jE, C1955ir c1955ir) {
        C1984jK c1984jKA00 = this.A00.get(abstractC1978jE);
        if (c1984jKA00 == null) {
            c1984jKA00 = C1984jK.A00();
            this.A00.put(abstractC1978jE, c1984jKA00);
        }
        c1984jKA00.A00 |= 2;
        c1984jKA00.A02 = c1955ir;
    }

    public final void A0E(AbstractC1978jE abstractC1978jE, C1955ir c1955ir) {
        C1984jK c1984jKA00 = this.A00.get(abstractC1978jE);
        if (c1984jKA00 == null) {
            c1984jKA00 = C1984jK.A00();
            this.A00.put(abstractC1978jE, c1984jKA00);
        }
        c1984jKA00.A01 = c1955ir;
        c1984jKA00.A00 |= 8;
    }

    public final void A0F(AbstractC1978jE abstractC1978jE, C1955ir c1955ir) {
        C1984jK c1984jKA00 = this.A00.get(abstractC1978jE);
        if (c1984jKA00 == null) {
            c1984jKA00 = C1984jK.A00();
            this.A00.put(abstractC1978jE, c1984jKA00);
        }
        c1984jKA00.A02 = c1955ir;
        c1984jKA00.A00 |= 4;
    }

    public final void A0G(InterfaceC1985jL interfaceC1985jL) {
        for (int size = this.A00.size() - 1; size >= 0; size--) {
            AbstractC1978jE abstractC1978jEA0A = this.A00.A0A(size);
            C1984jK c1984jKA0B = this.A00.A0B(size);
            if ((c1984jKA0B.A00 & 3) == 3) {
                interfaceC1985jL.ALt(abstractC1978jEA0A);
            } else {
                int index = c1984jKA0B.A00;
                if ((index & 1) != 0) {
                    if (c1984jKA0B.A02 == null) {
                        interfaceC1985jL.ALt(abstractC1978jEA0A);
                    } else {
                        C1955ir c1955ir = c1984jKA0B.A02;
                        C1955ir c1955ir2 = c1984jKA0B.A01;
                        if (A03[5].charAt(20) == 'R') {
                            throw new RuntimeException();
                        }
                        String[] strArr = A03;
                        strArr[1] = "fJVAe19tdP";
                        strArr[3] = "3fJsXDGb";
                        interfaceC1985jL.AIO(abstractC1978jEA0A, c1955ir, c1955ir2);
                    }
                } else if ((c1984jKA0B.A00 & 14) == 14) {
                    interfaceC1985jL.AIM(abstractC1978jEA0A, c1984jKA0B.A02, c1984jKA0B.A01);
                } else if ((c1984jKA0B.A00 & 12) == 12) {
                    interfaceC1985jL.AIQ(abstractC1978jEA0A, c1984jKA0B.A02, c1984jKA0B.A01);
                } else {
                    int index2 = c1984jKA0B.A00;
                    if ((index2 & 4) != 0) {
                        interfaceC1985jL.AIO(abstractC1978jEA0A, c1984jKA0B.A02, null);
                    } else {
                        int index3 = c1984jKA0B.A00;
                        if ((index3 & 8) != 0) {
                            interfaceC1985jL.AIM(abstractC1978jEA0A, c1984jKA0B.A02, c1984jKA0B.A01);
                        }
                    }
                }
            }
            C1984jK.A02(c1984jKA0B);
        }
    }

    public final boolean A0H(AbstractC1978jE abstractC1978jE) {
        C1984jK record = this.A00.get(abstractC1978jE);
        return (record == null || (record.A00 & 1) == 0) ? false : true;
    }

    public final boolean A0I(AbstractC1978jE abstractC1978jE) {
        C1984jK record = this.A00.get(abstractC1978jE);
        return (record == null || (record.A00 & 4) == 0) ? false : true;
    }
}
