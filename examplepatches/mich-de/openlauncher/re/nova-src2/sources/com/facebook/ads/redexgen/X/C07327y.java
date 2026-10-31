package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.util.Log;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.7y, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07327y implements TE {
    public static byte[] A0M;
    public static String[] A0N = {"EODIHkgA2ZyrIgnLGnp0dpS4o2nJxdd", "WQo", "GliZIkNeiCnyTXys850SVrhp4KurKCVm", "6oWQL2d3pXYFDFwkyJzEliAr3yK7LktZ", "mstNtXyga4JetAb1MMzdB19HSEn7nvfv", "1tgZmsf1cc3q2ZPragL47xg7EPzshINt", "vZm65Fq1JHlbcWfmwU5AQjRPykSJkysz", "BT6lEJ7JTAeLRZHkfDUXugVZieTM5hq"};
    public long A00;
    public long A01;
    public long A02;
    public long A03;
    public long A04;
    public Uri A05;
    public TE A06;
    public NX A07;
    public NX A08;

    @MetaExoPlayerCustomization
    public C1667e7 A09;
    public C1681eL A0A;
    public boolean A0B;
    public boolean A0C;
    public final TE A0D;
    public final TE A0E;
    public final TE A0F;
    public final InterfaceC1671eB A0G;
    public final InterfaceC1674eE A0H;
    public final InterfaceC1680eK A0I;
    public final boolean A0J;
    public final boolean A0K;
    public final boolean A0L;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0M, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 25);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A0M = new byte[]{21, 55, 53, 62, 51, 18, 55, 34, 55, 5, 57, 35, 36, 53, 51, 30, 50, 40, 49, 57, 51, 122, 41, 125, 40, 45, 57, 60, 41, 56, 125, 47, 56, 57, 52, 47, 56, 62, 41, 56, 57, 125, 8, 15, 20, 115, 125, 9, 53, 52, 46, 125, 48, 52, 58, 53, 41, 125, 62, 60, 40, 46, 56, 125, 47, 56, 49, 60, 41, 52, 43, 56, 125, 8, 15, 20, 46, 125, 58, 56, 41, 125, 47, 56, 46, 50, 49, 43, 56, 57, 125, 52, 51, 62, 50, 47, 47, 56, 62, 41, 49, 36, 115, 13, 12, 33, 3, 1, 10, 7, 6, 32, 27, 22, 7, 17, 48, 7, 3, 6};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00ea A[Catch: all -> 0x0105, TRY_ENTER, TryCatch #0 {all -> 0x0105, blocks: (B:2:0x0000, B:6:0x0037, B:12:0x0059, B:14:0x006b, B:20:0x008e, B:21:0x0095, B:25:0x009e, B:27:0x00a4, B:29:0x00aa, B:31:0x00b0, B:33:0x00b6, B:34:0x00b8, B:36:0x00bd, B:35:0x00ba, B:46:0x00f0, B:47:0x00f3, B:49:0x00f9, B:50:0x00fc, B:44:0x00ea, B:24:0x009c), top: B:57:0x0000 }] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00f0 A[Catch: all -> 0x0105, TryCatch #0 {all -> 0x0105, blocks: (B:2:0x0000, B:6:0x0037, B:12:0x0059, B:14:0x006b, B:20:0x008e, B:21:0x0095, B:25:0x009e, B:27:0x00a4, B:29:0x00aa, B:31:0x00b0, B:33:0x00b6, B:34:0x00b8, B:36:0x00bd, B:35:0x00ba, B:46:0x00f0, B:47:0x00f3, B:49:0x00f9, B:50:0x00fc, B:44:0x00ea, B:24:0x009c), top: B:57:0x0000 }] */
    @Override // com.facebook.ads.redexgen.X.TE
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long AHv(NX nx2) throws IOException {
        try {
            String strA5H = this.A0I.A5H(nx2);
            NX nxA09 = nx2.A04().A08(strA5H).A09();
            this.A08 = nxA09;
            this.A05 = A01(this.A0G, strA5H, nxA09.A06);
            this.A03 = nx2.A04;
            this.A09 = new C1667e7(nx2.A07);
            this.A0B = A00(nx2) != -1;
            boolean z11 = this.A0B;
            boolean z12 = this.A0B;
            if (A0N[4].charAt(1) == 'h') {
                throw new RuntimeException();
            }
            A0N[4] = "DKZf1VuH8SAQQeVRHDRzVNWOaR28tamI";
            if (z12) {
                this.A00 = -1L;
            } else {
                this.A00 = AbstractC1691eV.A00(this.A0G.A83(strA5H));
                if (this.A00 != -1) {
                    this.A00 -= nx2.A04;
                    long j11 = this.A00;
                    if (A0N[4].charAt(1) == 'h') {
                        throw new RuntimeException();
                    }
                    A0N[1] = b.f42142b;
                    if (j11 < 0) {
                        throw new NQ(2008);
                    }
                }
            }
            boolean z13 = nx2.A07.A08 <= 0 && nx2.A07.A07 <= 0;
            if (nx2.A03 != -1) {
                this.A00 = this.A00 == -1 ? nx2.A03 : Math.min(this.A00, nx2.A03);
            }
            long j12 = this.A00;
            String[] strArr = A0N;
            if (strArr[5].charAt(24) != strArr[3].charAt(24)) {
                A0N[4] = "LD2ew1FtkfnlOPATYBkIiVwopmp1IvEa";
                if (j12 <= 0) {
                    if (this.A00 == -1) {
                        A06(nxA09, false, z13);
                    }
                }
            } else if (j12 <= 0) {
            }
            return nx2.A03 != -1 ? nx2.A03 : this.A00;
        } catch (Throwable th2) {
            A09(th2);
            throw th2;
        }
    }

    static {
        A05();
    }

    public C07327y(InterfaceC1671eB interfaceC1671eB, final TE te2, TE te3, final NL nl2, InterfaceC1680eK interfaceC1680eK, int i5, final LS ls2, final int i11, InterfaceC1674eE interfaceC1674eE) {
        this.A0G = interfaceC1671eB;
        this.A0D = te3;
        this.A0I = interfaceC1680eK == null ? InterfaceC1680eK.A00 : interfaceC1680eK;
        this.A0J = (i5 & 1) != 0;
        this.A0L = (i5 & 2) != 0;
        this.A0K = (i5 & 4) != 0;
        if (te2 != null) {
            te2 = ls2 != null ? new TE(te2, ls2, i11) { // from class: com.facebook.ads.redexgen.X.9A
                public static byte[] A03;
                public static String[] A04 = {"fi42VJOcvh6gHZK2DTPtDLqKKJ6VNkoR", "48gk7M", "6L6spAAwpgwWYSE0", "d4FLyAPw7CK6GF6vAtSemAxDbucATq9m", "bvhFcp", "6GnnHW3XSw", "yktXoX", "ep06XeFGBv"};
                public final int A00;
                public final LS A01;
                public final TE A02;

                public static String A00(int i12, int i13, int i14) {
                    byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i12, i12 + i13);
                    int i15 = 0;
                    while (true) {
                        int length = bArrCopyOfRange.length;
                        if (A04[3].charAt(7) == 'J') {
                            throw new RuntimeException();
                        }
                        String[] strArr = A04;
                        strArr[7] = "vffMbrqZhi";
                        strArr[5] = "OYF6OnDYEA";
                        if (i15 >= length) {
                            return new String(bArrCopyOfRange);
                        }
                        bArrCopyOfRange[i15] = (byte) ((bArrCopyOfRange[i15] ^ i14) ^ 8);
                        i15++;
                    }
                }

                public static void A01() {
                    A03 = new byte[]{33, 35, 62, 50, 52, 52, 53, 30, 35, 5, 57, 35, 62, 38};
                }

                static {
                    A01();
                }

                {
                    this.A02 = (TE) AbstractC1062Ln.A01(te2);
                    AbstractC1062Ln.A01(ls2);
                    this.A01 = null;
                    this.A00 = i11;
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final void A4T(InterfaceC1108Ni interfaceC1108Ni) {
                    AbstractC1062Ln.A01(interfaceC1108Ni);
                    this.A02.A4T(interfaceC1108Ni);
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final Map<String, List<String>> A9W() {
                    return this.A02.A9W();
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final Uri AA2() {
                    return this.A02.AA2();
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final long AHv(NX nx2) throws IOException {
                    throw new NullPointerException(A00(0, 14, 89));
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final void close() throws IOException {
                    this.A02.close();
                }

                @Override // com.facebook.ads.redexgen.X.KR
                public final int read(byte[] bArr, int i12, int i13) throws IOException {
                    throw new NullPointerException(A00(0, 14, 89));
                }
            } : te2;
            this.A0F = te2;
            this.A0E = nl2 != null ? new TE(te2, nl2) { // from class: com.facebook.ads.redexgen.X.98
                public static String[] A04 = {"UJHVwBYxPEVBKbkCLrBMcLtCT6WuZcAu", "JGdCep40AY2ra8A5tRqCMSkWjrTrM01Y", "jpmm8WTAjiaT6F1GW", "hCOCNPdYrQe6i9Dr4VlHJtZD0QWRqRvI", "UM18O6ty1otoSDqmzVN25H8CnUfpg3Id", "liOUxUbxSG7kHzPVcyH04AFcb3RIHNnN", "83qHFCna6vZvrK3QM6kBLRxUZ4hvrfyz", "80YJwI2nBCNK3O4CL"};
                public long A00;
                public boolean A01;
                public final NL A02;
                public final TE A03;

                {
                    this.A03 = (TE) AbstractC1062Ln.A01(te2);
                    this.A02 = (NL) AbstractC1062Ln.A01(nl2);
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final void A4T(InterfaceC1108Ni interfaceC1108Ni) {
                    AbstractC1062Ln.A01(interfaceC1108Ni);
                    this.A03.A4T(interfaceC1108Ni);
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final Map<String, List<String>> A9W() {
                    return this.A03.A9W();
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final Uri AA2() {
                    return this.A03.AA2();
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final long AHv(NX nx2) throws IOException {
                    this.A00 = this.A03.AHv(nx2);
                    if (this.A00 == 0) {
                        return 0L;
                    }
                    if (nx2.A03 == -1) {
                        long j11 = this.A00;
                        if (A04[6].charAt(14) == 's') {
                            throw new RuntimeException();
                        }
                        String[] strArr = A04;
                        strArr[5] = "TpcC34pmvpLXayexhoYKr45IxXzse8Ke";
                        strArr[0] = "xYCJnhqVgzWyWEoMI8eoYFyWKlfa4Hwu";
                        if (j11 != -1) {
                            nx2 = nx2.A05(0L, this.A00);
                        }
                    }
                    this.A01 = true;
                    this.A02.AHx(nx2);
                    return this.A00;
                }

                @Override // com.facebook.ads.redexgen.X.TE
                public final void close() throws IOException {
                    try {
                        this.A03.close();
                        boolean z11 = this.A01;
                        String[] strArr = A04;
                        if (strArr[4].charAt(17) != strArr[3].charAt(17)) {
                            throw new RuntimeException();
                        }
                        String[] strArr2 = A04;
                        strArr2[7] = "Q3XntvrUZwdHLkhNL";
                        strArr2[2] = "I621lVCee7gkMKd4D";
                        if (z11) {
                            this.A01 = false;
                            this.A02.close();
                        }
                    } catch (Throwable th2) {
                        if (this.A01) {
                            this.A01 = false;
                            this.A02.close();
                        }
                        throw th2;
                    }
                }

                @Override // com.facebook.ads.redexgen.X.KR
                public final int read(byte[] bArr, int i12, int i13) throws IOException {
                    if (this.A00 == 0) {
                        return -1;
                    }
                    TE te4 = this.A03;
                    if (A04[6].charAt(14) == 's') {
                        throw new RuntimeException();
                    }
                    String[] strArr = A04;
                    strArr[5] = "2c3CIpWyvIGDnm7MoZsVV0a27dM3iQpB";
                    strArr[0] = "mK1vyJexEQCNSP1Qdv3UbXCFrYuSPrXM";
                    int bytesRead = te4.read(bArr, i12, i13);
                    if (bytesRead > 0) {
                        this.A02.write(bArr, i12, bytesRead);
                        if (this.A00 != -1) {
                            this.A00 -= bytesRead;
                        }
                    }
                    return bytesRead;
                }
            } : null;
        } else {
            this.A0F = C9B.A02;
            this.A0E = null;
        }
        this.A0H = interfaceC1674eE;
    }

    private int A00(NX nx2) {
        if (this.A0L && this.A0C) {
            return 0;
        }
        if (!this.A0K || nx2.A03 != -1) {
            return -1;
        }
        if (A0N[2].charAt(18) != '0') {
            throw new RuntimeException();
        }
        A0N[2] = "W4c5ltPVk8tlmclkH20KnHifTbatFjEL";
        return 1;
    }

    public static Uri A01(InterfaceC1671eB interfaceC1671eB, String str, Uri redirectedUri) {
        Uri redirectedUri2 = AbstractC1691eV.A01(interfaceC1671eB.A83(str));
        return redirectedUri2 != null ? redirectedUri2 : redirectedUri;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void A03() throws IOException {
        if (this.A06 == null) {
            return;
        }
        try {
            this.A06.close();
        } finally {
            this.A07 = null;
            this.A06 = null;
            if (this.A0A != null) {
                this.A0G.AIu(this.A0A);
                this.A0A = null;
            }
        }
    }

    private void A04() {
        if (0 != 0 && this.A04 > 0) {
            this.A0G.A7k();
            throw new NullPointerException(A02(103, 17, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:66:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01c3  */
    @MetaExoPlayerCustomization
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A06(NX nx2, boolean z11, boolean z12) throws IOException {
        C1681eL c1681eLALT;
        long jMin;
        NX nextDataSpec;
        TE te2;
        long j11;
        long jAHv;
        C1693eX c1693eX;
        Uri uri;
        String str = (String) N1.A0f(nx2.A08);
        EnumC1669e9 enumC1669e9 = z12 ? EnumC1669e9.A02 : EnumC1669e9.A05;
        if (this.A0B) {
            c1681eLALT = null;
        } else {
            boolean z13 = this.A0J;
            if (A0N[4].charAt(1) != 'h') {
                String[] strArr = A0N;
                strArr[7] = "JT7saidIq7sqYLRpMzQbt6gHMTzwGQC";
                strArr[0] = "yOLGqMeUmt8xF0b0ejupTLff4oBz1pg";
                if (z13) {
                    try {
                        c1681eLALT = this.A0G.ALT(str, this.A03, this.A00, enumC1669e9);
                    } catch (InterruptedException unused) {
                        Thread.currentThread().interrupt();
                        throw new InterruptedIOException();
                    }
                } else {
                    str = str;
                    c1681eLALT = this.A0G.ALU(str, this.A03, this.A00, enumC1669e9);
                }
            }
            throw new RuntimeException();
        }
        if (c1681eLALT == null) {
            te2 = this.A0F;
            nextDataSpec = nx2.A04().A04(this.A03).A03(this.A00).A07(this.A09).A09();
        } else {
            if (c1681eLALT.A05) {
                Uri uriFromFile = Uri.fromFile((File) N1.A0f(c1681eLALT.A03));
                long j12 = c1681eLALT.A02;
                long j13 = this.A03 - j12;
                long jMin2 = c1681eLALT.A01 - j13;
                if (this.A00 != -1) {
                    jMin2 = Math.min(jMin2, this.A00);
                }
                nextDataSpec = nx2.A04().A06(uriFromFile).A05(j12).A04(j13).A03(jMin2).A07(this.A09).A09();
                te2 = this.A0D;
                if (A0N[6].charAt(5) != 'O') {
                    A0N[2] = "7dgnQnYhiJfp8yUJUL04bl6EtBahXoSC";
                }
                throw new RuntimeException();
            }
            if (c1681eLALT.A0C()) {
                jMin = this.A00;
            } else {
                jMin = c1681eLALT.A01;
                if (this.A00 != -1) {
                    jMin = Math.min(jMin, this.A00);
                }
            }
            nextDataSpec = nx2.A04().A04(this.A03).A03(jMin).A07(this.A09).A09();
            if (this.A0E != null) {
                te2 = this.A0E;
            } else {
                te2 = this.A0F;
                this.A0G.AIu(c1681eLALT);
                c1681eLALT = null;
            }
        }
        if (!this.A0B && te2 == this.A0F) {
            j11 = this.A03 + 102400;
        } else {
            j11 = Long.MAX_VALUE;
        }
        this.A01 = j11;
        if (z11) {
            AbstractC1062Ln.A08(A0A());
            if (te2 == this.A0F) {
                return;
            }
            try {
                A03();
            } catch (Throwable th2) {
                if (((C1681eL) N1.A0f(c1681eLALT)).A0B()) {
                    this.A0G.AIu(c1681eLALT);
                }
                throw th2;
            }
        }
        if (c1681eLALT != null) {
            boolean zA0B = c1681eLALT.A0B();
            if (A0N[6].charAt(5) != 'O') {
                A0N[2] = "EGh6OH0nAuqmyDhdsz0MXNjXqdUFLTgG";
                if (zA0B) {
                    this.A0A = c1681eLALT;
                }
                this.A06 = te2;
                this.A07 = nextDataSpec;
                this.A02 = 0L;
                jAHv = te2.AHv(nextDataSpec);
                c1693eX = new C1693eX();
                if (nextDataSpec.A03 == -1 && jAHv != -1) {
                    this.A00 = jAHv;
                    C1693eX.A00(c1693eX, this.A03 + this.A00);
                }
                if (A0C()) {
                    this.A05 = te2.AA2();
                    if (!nx2.A06.equals(this.A05)) {
                        uri = this.A05;
                    } else {
                        uri = null;
                    }
                    C1693eX.A01(c1693eX, uri);
                }
                boolean isRedirected = A0D();
                if (A0N[6].charAt(5) != 'O') {
                    A0N[6] = "QunNUHcgR7Xa5uZxGh7xKDLdVQCZYJKb";
                    if (isRedirected) {
                        this.A0G.A4f(str, c1693eX);
                    }
                    A08(str, this.A05);
                    return;
                }
            }
        } else {
            this.A06 = te2;
            this.A07 = nextDataSpec;
            this.A02 = 0L;
            jAHv = te2.AHv(nextDataSpec);
            c1693eX = new C1693eX();
            if (nextDataSpec.A03 == -1) {
                this.A00 = jAHv;
                C1693eX.A00(c1693eX, this.A03 + this.A00);
            }
            if (A0C()) {
            }
            boolean isRedirected2 = A0D();
            if (A0N[6].charAt(5) != 'O') {
            }
        }
        throw new RuntimeException();
    }

    private void A07(String str) throws IOException {
        this.A00 = 0L;
        if (A0D()) {
            C1693eX c1693eX = new C1693eX();
            C1693eX.A00(c1693eX, this.A03);
            this.A0G.A4f(str, c1693eX);
        }
    }

    @MetaExoPlayerCustomization
    private void A08(String str, Uri uri) {
        if (!A0D()) {
            return;
        }
        C1693eX c1693eX = new C1693eX();
        if (!uri.equals(this.A05)) {
            C1693eX.A01(c1693eX, this.A05);
        } else {
            C1693eX.A01(c1693eX, null);
        }
        try {
            this.A0G.A4f(str, c1693eX);
        } catch (C1668e8 e3) {
            String message = A02(15, 88, 68);
            Log.w(A02(0, 15, 79), message, e3);
        }
    }

    private void A09(Throwable th2) {
        if (A0B() || (th2 instanceof C1668e8)) {
            this.A0C = true;
        }
    }

    private boolean A0A() {
        return this.A06 == this.A0F;
    }

    private boolean A0B() {
        return this.A06 == this.A0D;
    }

    private boolean A0C() {
        return !A0B();
    }

    private boolean A0D() {
        return this.A06 == this.A0E;
    }

    public final InterfaceC1671eB A0E() {
        return this.A0G;
    }

    public final InterfaceC1680eK A0F() {
        return this.A0I;
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final void A4T(InterfaceC1108Ni interfaceC1108Ni) {
        AbstractC1062Ln.A01(interfaceC1108Ni);
        this.A0D.A4T(interfaceC1108Ni);
        this.A0F.A4T(interfaceC1108Ni);
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final Map<String, List<String>> A9W() {
        if (A0C()) {
            return this.A0F.A9W();
        }
        return Collections.emptyMap();
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final Uri AA2() {
        return this.A05;
    }

    @Override // com.facebook.ads.redexgen.X.TE
    public final void close() throws IOException {
        this.A08 = null;
        this.A05 = null;
        this.A03 = 0L;
        A04();
        try {
            A03();
        } catch (Throwable e3) {
            A09(e3);
            throw e3;
        }
    }

    @Override // com.facebook.ads.redexgen.X.KR
    public final int read(byte[] bArr, int i5, int i11) throws Throwable {
        if (i11 == 0) {
            return 0;
        }
        if (this.A00 == 0) {
            return -1;
        }
        NX currentDataSpec = (NX) AbstractC1062Ln.A01(this.A08);
        NX nx2 = (NX) AbstractC1062Ln.A01(this.A07);
        try {
            if (this.A03 >= this.A01) {
                A06(currentDataSpec, true, false);
            }
            try {
                int bytesRead = ((TE) AbstractC1062Ln.A01(this.A06)).read(bArr, i5, i11);
                if (bytesRead != -1) {
                    if (A0B()) {
                        this.A04 += bytesRead;
                    }
                    this.A03 += bytesRead;
                    this.A02 += bytesRead;
                    if (this.A00 != -1) {
                        this.A00 -= bytesRead;
                    }
                } else if (A0C() && (nx2.A03 == -1 || this.A02 < nx2.A03)) {
                    A07((String) N1.A0f(currentDataSpec.A08));
                } else if (this.A00 > 0 || this.A00 == -1) {
                    A03();
                    A06(currentDataSpec, false, false);
                    return read(bArr, i5, i11);
                }
                return bytesRead;
            } catch (Throwable th2) {
                e = th2;
                A09(e);
                throw e;
            }
        } catch (Throwable th3) {
            e = th3;
        }
    }
}
