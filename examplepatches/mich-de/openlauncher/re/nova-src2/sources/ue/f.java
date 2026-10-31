package ue;

import fe.j0;
import fe.k0;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class f implements h {

    /* renamed from: b, reason: collision with root package name */
    public final String f90881b;

    /* renamed from: c, reason: collision with root package name */
    public String f90882c;

    /* renamed from: d, reason: collision with root package name */
    public ke.v f90883d;

    /* renamed from: f, reason: collision with root package name */
    public int f90885f;

    /* renamed from: g, reason: collision with root package name */
    public int f90886g;

    /* renamed from: h, reason: collision with root package name */
    public long f90887h;

    /* renamed from: i, reason: collision with root package name */
    public k0 f90888i;

    /* renamed from: j, reason: collision with root package name */
    public int f90889j;

    /* renamed from: a, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f90880a = new com.google.android.gms.internal.consent_sdk.a(new byte[18]);

    /* renamed from: e, reason: collision with root package name */
    public int f90884e = 0;

    /* renamed from: k, reason: collision with root package name */
    public long f90890k = -9223372036854775807L;

    public f(String str) {
        this.f90881b = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:64:0x0237  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x023f  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0279  */
    @Override // ue.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(com.google.android.gms.internal.consent_sdk.a aVar) {
        int i5;
        int i11;
        int i12;
        byte b11;
        int i13;
        int i14;
        int i15;
        int i16;
        byte b12;
        int i17;
        byte b13;
        int i18;
        ke.x xVar;
        wf.a.j(this.f90883d);
        while (aVar.g() > 0) {
            int i19 = this.f90884e;
            int i21 = 8;
            int i22 = 2;
            com.google.android.gms.internal.consent_sdk.a aVar2 = this.f90880a;
            if (i19 == 0) {
                while (aVar.g() > 0) {
                    int i23 = this.f90886g << 8;
                    this.f90886g = i23;
                    int iN = i23 | aVar.N();
                    this.f90886g = iN;
                    if (iN == 2147385345 || iN == -25230976 || iN == 536864768 || iN == -14745368) {
                        byte[] bArr = (byte[]) aVar2.f31986d;
                        bArr[0] = (byte) ((iN >> 24) & 255);
                        bArr[1] = (byte) ((iN >> 16) & 255);
                        bArr[2] = (byte) ((iN >> 8) & 255);
                        bArr[3] = (byte) (iN & 255);
                        this.f90885f = 4;
                        this.f90886g = 0;
                        this.f90884e = 1;
                        break;
                    }
                }
            } else if (i19 == 1) {
                byte[] bArr2 = (byte[]) aVar2.f31986d;
                int iMin = Math.min(aVar.g(), 18 - this.f90885f);
                aVar.z(this.f90885f, iMin, bArr2);
                int i24 = this.f90885f + iMin;
                this.f90885f = i24;
                if (i24 == 18) {
                    byte[] bArr3 = (byte[]) aVar2.f31986d;
                    if (this.f90888i == null) {
                        String str = this.f90882c;
                        i11 = 0;
                        if (bArr3[0] == 127) {
                            xVar = new ke.x(bArr3, bArr3.length);
                            i5 = 8;
                            i18 = 2;
                        } else {
                            byte[] bArrCopyOf = Arrays.copyOf(bArr3, bArr3.length);
                            byte b14 = bArrCopyOf[0];
                            if (b14 == -2 || b14 == -1) {
                                for (int i25 = 0; i25 < bArrCopyOf.length - 1; i25 += 2) {
                                    byte b15 = bArrCopyOf[i25];
                                    int i26 = i25 + 1;
                                    bArrCopyOf[i25] = bArrCopyOf[i26];
                                    bArrCopyOf[i26] = b15;
                                }
                            }
                            ke.x xVar2 = new ke.x(bArrCopyOf, bArrCopyOf.length);
                            if (bArrCopyOf[0] == 31) {
                                ke.x xVar3 = new ke.x(bArrCopyOf, bArrCopyOf.length);
                                while (xVar3.b() >= 16) {
                                    xVar3.r(i22);
                                    int i27 = xVar3.i(14) & 16383;
                                    int iMin2 = Math.min(8 - xVar2.f71448c, 14);
                                    int i28 = i22;
                                    int i29 = xVar2.f71448c;
                                    int i31 = (8 - i29) - iMin2;
                                    byte[] bArr4 = xVar2.f71449d;
                                    int i32 = xVar2.f71447b;
                                    byte b16 = (byte) (bArr4[i32] & ((65280 >> i29) | ((1 << i31) - 1)));
                                    bArr4[i32] = b16;
                                    int i33 = 14 - iMin2;
                                    bArr4[i32] = (byte) (b16 | ((i27 >>> i33) << i31));
                                    int i34 = i32 + 1;
                                    while (i33 > i21) {
                                        xVar2.f71449d[i34] = (byte) (i27 >>> (i33 - 8));
                                        i33 -= 8;
                                        i34++;
                                        i21 = i21;
                                    }
                                    int i35 = i21;
                                    byte[] bArr5 = xVar2.f71449d;
                                    byte b17 = (byte) (bArr5[i34] & ((1 << r4) - 1));
                                    bArr5[i34] = b17;
                                    bArr5[i34] = (byte) (((i27 & ((1 << i33) - 1)) << (8 - i33)) | b17);
                                    xVar2.r(14);
                                    xVar2.a();
                                    i22 = i28;
                                    i21 = i35;
                                }
                            }
                            i5 = i21;
                            i18 = i22;
                            xVar2.n(bArrCopyOf.length, bArrCopyOf);
                            xVar = xVar2;
                        }
                        xVar.r(60);
                        int i36 = he.a.f59663j[xVar.i(6)];
                        int i37 = he.a.f59664k[xVar.i(4)];
                        int i38 = xVar.i(5);
                        int i39 = i38 >= 29 ? -1 : (he.a.f59665l[i38] * 1000) / 2;
                        xVar.r(10);
                        int i40 = i36 + (xVar.i(i18) > 0 ? 1 : 0);
                        j0 j0Var = new j0();
                        j0Var.f54846a = str;
                        j0Var.f54856k = "audio/vnd.dts";
                        j0Var.f54851f = i39;
                        j0Var.f54867x = i40;
                        j0Var.f54868y = i37;
                        j0Var.n = null;
                        j0Var.f54848c = this.f90881b;
                        k0 k0Var = new k0(j0Var);
                        this.f90888i = k0Var;
                        this.f90883d.a(k0Var);
                    } else {
                        i5 = 8;
                        i11 = 0;
                    }
                    byte b18 = bArr3[i11];
                    if (b18 != -2) {
                        if (b18 == -1) {
                            i17 = ((bArr3[7] & 3) << 12) | ((bArr3[6] & 255) << 4);
                            b13 = bArr3[9];
                        } else if (b18 != 31) {
                            i12 = ((bArr3[5] & 3) << 12) | ((bArr3[6] & 255) << 4);
                            b11 = bArr3[7];
                        } else {
                            i17 = ((bArr3[6] & 3) << 12) | ((bArr3[7] & 255) << 4);
                            b13 = bArr3[i5];
                        }
                        i14 = (i17 | ((b13 & 60) >> 2)) + 1;
                        i13 = 1;
                        if (i13 != 0) {
                            i14 = (i14 * 16) / 14;
                        }
                        this.f90889j = i14;
                        if (b18 == -2) {
                            if (b18 == -1) {
                                i15 = (bArr3[4] & 7) << 4;
                                b12 = bArr3[7];
                            } else if (b18 != 31) {
                                i15 = (bArr3[4] & 1) << 6;
                                i16 = bArr3[5] & 252;
                            } else {
                                i15 = (bArr3[5] & 7) << 4;
                                b12 = bArr3[6];
                            }
                            i16 = b12 & 60;
                        } else {
                            i15 = (bArr3[5] & 1) << 6;
                            i16 = bArr3[4] & 252;
                        }
                        this.f90887h = (int) ((((((i16 >> 2) | i15) + 1) * 32) * 1000000) / this.f90888i.f54895z);
                        aVar2.Y(i11);
                        this.f90883d.d(18, aVar2);
                        this.f90884e = 2;
                    } else {
                        i12 = ((bArr3[4] & 3) << 12) | ((bArr3[7] & 255) << 4);
                        b11 = bArr3[6];
                    }
                    i14 = (i12 | ((b11 & 240) >> 4)) + 1;
                    i13 = i11;
                    if (i13 != 0) {
                    }
                    this.f90889j = i14;
                    if (b18 == -2) {
                    }
                    this.f90887h = (int) ((((((i16 >> 2) | i15) + 1) * 32) * 1000000) / this.f90888i.f54895z);
                    aVar2.Y(i11);
                    this.f90883d.d(18, aVar2);
                    this.f90884e = 2;
                }
            } else {
                if (i19 != 2) {
                    throw new IllegalStateException();
                }
                int iMin3 = Math.min(aVar.g(), this.f90889j - this.f90885f);
                this.f90883d.d(iMin3, aVar);
                int i41 = this.f90885f + iMin3;
                this.f90885f = i41;
                int i42 = this.f90889j;
                if (i41 == i42) {
                    long j11 = this.f90890k;
                    if (j11 != -9223372036854775807L) {
                        this.f90883d.b(j11, 1, i42, 0, null);
                        this.f90890k += this.f90887h;
                    }
                    this.f90884e = 0;
                }
            }
        }
    }

    @Override // ue.h
    public final void h() {
        this.f90884e = 0;
        this.f90885f = 0;
        this.f90886g = 0;
        this.f90890k = -9223372036854775807L;
    }

    @Override // ue.h
    public final void i(ke.l lVar, d0 d0Var) {
        d0Var.a();
        d0Var.b();
        this.f90882c = d0Var.f90859e;
        d0Var.b();
        this.f90883d = lVar.s(d0Var.f90858d, 1);
    }

    @Override // ue.h
    public final void j() {
    }

    @Override // ue.h
    public final void k(int i5, long j11) {
        if (j11 != -9223372036854775807L) {
            this.f90890k = j11;
        }
    }
}
