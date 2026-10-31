package com.facebook.ads.redexgen.X;

import android.util.SparseArray;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.co, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1587co {
    public static String[] A0I = {"zorcH0HQPQgzHnkweoL4sf0jfX8i5q6J", "rVxqpu0T4ltanYXApGkISjx4fCHwA2iU", "crOs1I9rituf86jZV", "nQGbvGxlTAQsq5WIEo1XrHiZ1y0lEIUj", "iQe", "JAEFAkeJNOmxVKjiYawuVCOFrihrw", "rEUu1I8BajWKwbQCHk", "CO1NGipHaspfxNWwoT3crtaOgXOw7YVd"};
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public long A04;
    public long A05;
    public boolean A08;
    public boolean A09;
    public boolean A0A;
    public final ZP A0F;
    public final boolean A0G;
    public final boolean A0H;
    public final SparseArray<ZD> A0D = new SparseArray<>();
    public final SparseArray<ZC> A0C = new SparseArray<>();
    public C1586cn A06 = new C1586cn();
    public C1586cn A07 = new C1586cn();
    public byte[] A0B = new byte[128];
    public final ZG A0E = new ZG(this.A0B, 0, 0);

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 26 out of bounds for length 26
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final void A05(byte[] bArr, int i5, int i11) {
        if (this.A08) {
            int i12 = i11 - i5;
            if (this.A0B.length < this.A00 + i12) {
                this.A0B = Arrays.copyOf(this.A0B, (this.A00 + i12) * 2);
            }
            System.arraycopy(bArr, i5, this.A0B, this.A00, i12);
            this.A00 += i12;
            this.A0E.A08(this.A0B, 0, this.A00);
            if (this.A0E.A0B(8)) {
                this.A0E.A06();
                int iA05 = this.A0E.A05(2);
                this.A0E.A07(5);
                if (this.A0E.A09()) {
                    this.A0E.A04();
                    if (this.A0E.A09()) {
                        int iA04 = this.A0E.A04();
                        if (!this.A0H) {
                            this.A08 = false;
                            this.A07.A03(iA04);
                            return;
                        }
                        if (this.A0E.A09()) {
                            int iA042 = this.A0E.A04();
                            if (this.A0C.indexOfKey(iA042) < 0) {
                                this.A08 = false;
                                return;
                            }
                            ZC zc = this.A0C.get(iA042);
                            ZD zd2 = this.A0D.get(zc.A01);
                            if (zd2.A0D) {
                                if (!this.A0E.A0B(2)) {
                                    return;
                                } else {
                                    this.A0E.A07(2);
                                }
                            }
                            if (this.A0E.A0B(zd2.A02)) {
                                boolean zA0A = false;
                                boolean z11 = false;
                                boolean zA0A2 = false;
                                int iA052 = this.A0E.A05(zd2.A02);
                                if (!zd2.A0C) {
                                    if (!this.A0E.A0B(1)) {
                                        return;
                                    }
                                    zA0A = this.A0E.A0A();
                                    if (zA0A) {
                                        ZG zg2 = this.A0E;
                                        if (A0I[5].length() == 21) {
                                            throw new RuntimeException();
                                        }
                                        A0I[5] = "IpXuah1Far9fzL3cOlu0";
                                        if (!zg2.A0B(1)) {
                                            return;
                                        }
                                        zA0A2 = this.A0E.A0A();
                                        z11 = true;
                                    }
                                }
                                boolean z12 = this.A01 == 5;
                                int iA043 = 0;
                                if (z12) {
                                    if (!this.A0E.A09()) {
                                        return;
                                    } else {
                                        iA043 = this.A0E.A04();
                                    }
                                }
                                int iA053 = 0;
                                int iA03 = 0;
                                int iA032 = 0;
                                int iA033 = 0;
                                if (zd2.A07 == 0) {
                                    if (!this.A0E.A0B(zd2.A06)) {
                                        return;
                                    }
                                    iA053 = this.A0E.A05(zd2.A06);
                                    if (zc.A02 && !zA0A) {
                                        if (!this.A0E.A09()) {
                                            return;
                                        } else {
                                            iA03 = this.A0E.A03();
                                        }
                                    }
                                } else if (zd2.A07 == 1 && !zd2.A0B) {
                                    if (!this.A0E.A09()) {
                                        return;
                                    }
                                    iA032 = this.A0E.A03();
                                    boolean z13 = zc.A02;
                                    String[] strArr = A0I;
                                    if (strArr[3].charAt(11) == strArr[7].charAt(11)) {
                                        throw new RuntimeException();
                                    }
                                    String[] strArr2 = A0I;
                                    strArr2[3] = "fR8fvJivqB2uRnCgnwS3dRrhYpBAVfIB";
                                    strArr2[7] = "Uh8RDC5mpi1TZBNrH7APOf2CdU3JNOiF";
                                    if (z13 && !zA0A) {
                                        if (!this.A0E.A09()) {
                                            return;
                                        } else {
                                            iA033 = this.A0E.A03();
                                        }
                                    }
                                }
                                this.A07.A04(zd2, iA05, iA04, iA052, iA042, zA0A, z11, zA0A2, z12, iA043, iA053, iA03, iA032, iA033);
                                this.A08 = false;
                            }
                        }
                    }
                }
            }
        }
    }

    public C1587co(ZP zp2, boolean z11, boolean z12) {
        this.A0F = zp2;
        this.A0G = z11;
        this.A0H = z12;
        A01();
    }

    private void A00(int i5) {
        if (this.A05 == -9223372036854775807L) {
            return;
        }
        boolean z11 = this.A0A;
        this.A0F.AKC(this.A05, z11 ? 1 : 0, (int) (this.A02 - this.A04), i5, null);
    }

    public final void A01() {
        this.A08 = false;
        this.A09 = false;
        this.A07.A02();
    }

    public final void A02(long j11, int i5, long j12) {
        this.A01 = i5;
        this.A03 = j12;
        this.A02 = j11;
        if (!this.A0G || this.A01 != 1) {
            if (!this.A0H) {
                return;
            }
            if (this.A01 != 5 && this.A01 != 1) {
                int i11 = this.A01;
                if (A0I[5].length() == 21) {
                    throw new RuntimeException();
                }
                A0I[2] = "ttXAM0";
                if (i11 != 2) {
                    return;
                }
            }
        }
        C1586cn c1586cn = this.A06;
        C1586cn newSliceHeader = this.A07;
        this.A06 = newSliceHeader;
        this.A07 = c1586cn;
        C1586cn newSliceHeader2 = this.A07;
        newSliceHeader2.A02();
        this.A00 = 0;
        this.A08 = true;
    }

    public final void A03(ZC zc) {
        this.A0C.append(zc.A00, zc);
    }

    public final void A04(ZD zd2) {
        this.A0D.append(zd2.A09, zd2);
    }

    public final boolean A06() {
        return this.A0H;
    }

    public final boolean A07(long j11, int i5, boolean z11, boolean z12) {
        boolean z13 = false;
        if (this.A01 == 9 || (this.A0H && this.A07.A00(this.A06))) {
            if (z11 && this.A09) {
                A00(i5 + ((int) (j11 - this.A02)));
            }
            this.A04 = this.A02;
            this.A05 = this.A03;
            this.A0A = false;
            this.A09 = true;
        }
        if (this.A0G) {
            z12 = this.A07.A05();
        }
        boolean z14 = this.A0A;
        if (this.A01 == 5 || (z12 && this.A01 == 1)) {
            z13 = true;
        }
        this.A0A = z14 | z13;
        boolean treatIFrameAsKeyframe = this.A0A;
        return treatIFrameAsKeyframe;
    }
}
