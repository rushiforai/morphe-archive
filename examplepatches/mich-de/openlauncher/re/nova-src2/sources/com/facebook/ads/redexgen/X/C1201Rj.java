package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Rj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1201Rj implements X7, Ub {
    public static String[] A0E = {"XaDD5PgyAmJ", "8zmS63z", "j8ciNHuCepgrbIigmG1k2aMiHO0R8", "k8mv2Mp", "LdWYTg8T9Rti", "vTCnbQfzDGS3p1oDNxDazVjLN5", "FIxjTRthEwDZ", b.f42142b};
    public long A00;
    public NX A01;
    public ZP A02;
    public boolean A04;
    public final Uri A06;
    public final C1071Lx A07;
    public final AnonymousClass99 A08;
    public final InterfaceC1292Uz A09;
    public final InterfaceC1384Yw A0A;
    public volatile boolean A0C;
    public final /* synthetic */ C8p A0D;
    public final ZH A0B = new ZH();
    public boolean A03 = true;
    public final long A05 = Uc.A00();

    public C1201Rj(C8p c8p, Uri uri, TE te2, InterfaceC1292Uz interfaceC1292Uz, InterfaceC1384Yw interfaceC1384Yw, C1071Lx c1071Lx) {
        this.A0D = c8p;
        this.A06 = uri;
        this.A08 = new AnonymousClass99(te2);
        this.A09 = interfaceC1292Uz;
        this.A0A = interfaceC1384Yw;
        this.A07 = c1071Lx;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A04(long j11, long j12) {
        this.A0B.A00 = j11;
        this.A00 = j12;
        this.A03 = true;
        this.A04 = false;
    }

    @Override // com.facebook.ads.redexgen.X.X7
    public final void A5N() {
        this.A0C = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x00a0 A[Catch: all -> 0x012b, TryCatch #1 {all -> 0x012b, blocks: (B:7:0x000c, B:9:0x002d, B:10:0x0034, B:12:0x0044, B:17:0x0067, B:18:0x0087, B:20:0x00a0, B:21:0x00a5, B:23:0x00a9, B:25:0x00b5, B:27:0x00b9, B:28:0x00be, B:30:0x00d7, B:39:0x011f, B:40:0x0124), top: B:53:0x000c, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00a9 A[Catch: all -> 0x012b, TryCatch #1 {all -> 0x012b, blocks: (B:7:0x000c, B:9:0x002d, B:10:0x0034, B:12:0x0044, B:17:0x0067, B:18:0x0087, B:20:0x00a0, B:21:0x00a5, B:23:0x00a9, B:25:0x00b5, B:27:0x00b9, B:28:0x00be, B:30:0x00d7, B:39:0x011f, B:40:0x0124), top: B:53:0x000c, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00d7 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00b3 A[SYNTHETIC] */
    @Override // com.facebook.ads.redexgen.X.X7
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void ABZ() throws IOException {
        long position;
        int result = 0;
        while (result == 0 && !this.A0C) {
            try {
                long j11 = this.A0B.A00;
                this.A01 = new NX(this.A06, j11, -1L, this.A0D.A0b);
                long jAHv = this.A08.AHv(this.A01);
                if (jAHv != -1) {
                    jAHv += j11;
                    this.A0D.A0G();
                }
                this.A0D.A09 = null;
                TE te2 = this.A08;
                if (this.A0D.A09 != null) {
                    int i5 = this.A0D.A09.A01;
                    if (A0E[2].length() != 7) {
                        String[] strArr = A0E;
                        strArr[0] = "Yk5WckqCjpE";
                        strArr[5] = "o7AELwMD0LYTFZS4cgGrm65fOh";
                        if (i5 != -1) {
                            final AnonymousClass99 anonymousClass99 = this.A08;
                            final int i11 = this.A0D.A09.A01;
                            te2 = new TE(anonymousClass99, i11, this) { // from class: com.facebook.ads.redexgen.X.8q
                                public static String[] A05 = {"AADzzswwW8PGyDGYU", "ArC", "orSQ12XGouG4EbDUF", "f0SH1r1qTJ7UOD9Hs", "HhN", "1XCgKSbxB46C", "a4iWK1VOuTlVbRV", "uGTY8cKgmQdhZuobhrqmdzAdtw2h9Ipc"};
                                public int A00;
                                public final int A01;
                                public final TE A02;
                                public final Ub A03;
                                public final byte[] A04;

                                {
                                    AbstractC1062Ln.A07(i11 > 0);
                                    this.A02 = anonymousClass99;
                                    this.A01 = i11;
                                    this.A03 = this;
                                    this.A04 = new byte[1];
                                    this.A00 = i11;
                                }

                                private boolean A00() throws IOException {
                                    int bytesRead = this.A02.read(this.A04, 0, 1);
                                    if (bytesRead == -1) {
                                        return false;
                                    }
                                    int bytesRead2 = this.A04[0];
                                    int metadataLength = (bytesRead2 & 255) << 4;
                                    if (metadataLength == 0) {
                                        return true;
                                    }
                                    int i12 = 0;
                                    int i13 = metadataLength;
                                    byte[] bArr = new byte[metadataLength];
                                    while (i13 > 0) {
                                        int lengthRemaining = this.A02.read(bArr, i12, i13);
                                        if (lengthRemaining == -1) {
                                            return false;
                                        }
                                        i12 += lengthRemaining;
                                        if (A05[7].charAt(19) == 'b') {
                                            throw new RuntimeException();
                                        }
                                        String[] strArr2 = A05;
                                        strArr2[5] = "7FdP2hzljBIR";
                                        strArr2[6] = "oRfwJDo3VBMpfuC";
                                        i13 -= lengthRemaining;
                                    }
                                    while (metadataLength > 0) {
                                        int bytesRead3 = metadataLength - 1;
                                        int lengthRemaining2 = bArr[bytesRead3];
                                        String[] strArr3 = A05;
                                        String str = strArr3[5];
                                        String str2 = strArr3[6];
                                        int length = str.length();
                                        int bytesRead4 = str2.length();
                                        if (length == bytesRead4) {
                                            A05[0] = "ERqxWuTtBALh66gFQPQv9BxDi0";
                                            if (lengthRemaining2 != 0) {
                                                break;
                                            }
                                            metadataLength--;
                                        } else {
                                            A05[0] = "LdT";
                                            if (lengthRemaining2 != 0) {
                                                break;
                                            }
                                            metadataLength--;
                                        }
                                    }
                                    if (metadataLength > 0) {
                                        this.A03.AF8(new C1084Mk(bArr, metadataLength));
                                    }
                                    return true;
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
                                public final long AHv(NX nx2) {
                                    throw new UnsupportedOperationException();
                                }

                                @Override // com.facebook.ads.redexgen.X.TE
                                public final void close() {
                                    throw new UnsupportedOperationException();
                                }

                                @Override // com.facebook.ads.redexgen.X.KR
                                public final int read(byte[] bArr, int i12, int i13) throws IOException {
                                    if (this.A00 == 0) {
                                        if (!A00()) {
                                            return -1;
                                        }
                                        int i14 = this.A01;
                                        String[] strArr2 = A05;
                                        if (strArr2[5].length() == strArr2[6].length()) {
                                            throw new RuntimeException();
                                        }
                                        A05[7] = "Ogl6Bd85LgnoQ5rv529h8eZh0doTaT4v";
                                        this.A00 = i14;
                                    }
                                    int i15 = this.A02.read(bArr, i12, Math.min(this.A00, i13));
                                    if (i15 != -1) {
                                        int bytesRead = this.A00;
                                        this.A00 = bytesRead - i15;
                                    }
                                    return i15;
                                }
                            };
                            this.A02 = this.A0D.A0Z();
                            this.A02.A7E(C8p.A0g);
                        }
                        this.A09.AAp(te2, this.A06, this.A08.A9W(), j11, jAHv, this.A0A);
                        if (this.A0D.A09 != null) {
                            this.A09.A6X();
                        }
                        if (this.A03) {
                            this.A09.AKO(j11, this.A00);
                            this.A03 = false;
                        }
                        while (result == 0 && !this.A0C) {
                            try {
                                this.A07.A00();
                                result = this.A09.AIZ(this.A0B);
                                position = this.A09.A8B();
                                if (position <= this.A0D.A0M + j11) {
                                    j11 = position;
                                    this.A07.A02();
                                    this.A0D.A0O.post(this.A0D.A0a);
                                }
                            } catch (InterruptedException unused) {
                                throw new InterruptedIOException();
                            }
                        }
                        if (result != 1) {
                            result = 0;
                        } else if (this.A09.A8B() != -1) {
                            ZH zh2 = this.A0B;
                            InterfaceC1292Uz interfaceC1292Uz = this.A09;
                            if (A0E[2].length() != 7) {
                                A0E[2] = "gEkEzlsd4WVRbObRS9T";
                                zh2.A00 = interfaceC1292Uz.A8B();
                            }
                        } else {
                            continue;
                        }
                        NS.A00(this.A08);
                    }
                } else {
                    this.A09.AAp(te2, this.A06, this.A08.A9W(), j11, jAHv, this.A0A);
                    if (this.A0D.A09 != null) {
                    }
                    if (this.A03) {
                    }
                    while (result == 0) {
                        this.A07.A00();
                        result = this.A09.AIZ(this.A0B);
                        position = this.A09.A8B();
                        if (position <= this.A0D.A0M + j11) {
                        }
                    }
                    if (result != 1) {
                    }
                    NS.A00(this.A08);
                }
                throw new RuntimeException();
            } catch (Throwable th2) {
                if (result != 1 && this.A09.A8B() != -1) {
                    this.A0B.A00 = this.A09.A8B();
                }
                NS.A00(this.A08);
                throw th2;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.Ub
    public final void AF8(C1084Mk c1084Mk) {
        long jMax;
        if (this.A04) {
            jMax = Math.max(this.A0D.A03(true), this.A00);
        } else {
            jMax = this.A00;
        }
        int iA07 = c1084Mk.A07();
        ZP zp2 = (ZP) AbstractC1062Ln.A01(this.A02);
        zp2.AK9(c1084Mk, iA07);
        zp2.AKC(jMax, 1, iA07, 0, null);
        this.A04 = true;
    }
}
