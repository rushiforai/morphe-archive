package ue;

import com.google.android.gms.internal.measurement.wg;
import fe.j0;
import fe.k0;

/* loaded from: classes3.dex */
public final class b implements h {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90811a;

    /* renamed from: b, reason: collision with root package name */
    public final ke.x f90812b;

    /* renamed from: c, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f90813c;

    /* renamed from: d, reason: collision with root package name */
    public final String f90814d;

    /* renamed from: e, reason: collision with root package name */
    public String f90815e;

    /* renamed from: f, reason: collision with root package name */
    public ke.v f90816f;

    /* renamed from: g, reason: collision with root package name */
    public int f90817g;

    /* renamed from: h, reason: collision with root package name */
    public int f90818h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f90819i;

    /* renamed from: j, reason: collision with root package name */
    public long f90820j;

    /* renamed from: k, reason: collision with root package name */
    public k0 f90821k;

    /* renamed from: l, reason: collision with root package name */
    public int f90822l;

    /* renamed from: m, reason: collision with root package name */
    public long f90823m;

    public b(String str, int i5) {
        this.f90811a = i5;
        switch (i5) {
            case 1:
                byte[] bArr = new byte[16];
                this.f90812b = new ke.x(bArr, 16);
                this.f90813c = new com.google.android.gms.internal.consent_sdk.a(bArr);
                this.f90817g = 0;
                this.f90818h = 0;
                this.f90819i = false;
                this.f90823m = -9223372036854775807L;
                this.f90814d = str;
                break;
            default:
                byte[] bArr2 = new byte[128];
                this.f90812b = new ke.x(bArr2, 128);
                this.f90813c = new com.google.android.gms.internal.consent_sdk.a(bArr2);
                this.f90817g = 0;
                this.f90823m = -9223372036854775807L;
                this.f90814d = str;
                break;
        }
    }

    private final void a() {
    }

    private final void b() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:177:0x0316  */
    /* JADX WARN: Removed duplicated region for block: B:198:0x0356  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x035e  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x038b  */
    /* JADX WARN: Removed duplicated region for block: B:227:0x03a0  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x03bd  */
    @Override // ue.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(com.google.android.gms.internal.consent_sdk.a aVar) {
        int i5;
        int i11;
        int i12;
        String str;
        int i13;
        int i14;
        int i15;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        int i23;
        int i24;
        int i25;
        switch (this.f90811a) {
            case 0:
                wf.a.j(this.f90816f);
                while (aVar.g() > 0) {
                    int i26 = this.f90817g;
                    com.google.android.gms.internal.consent_sdk.a aVar2 = this.f90813c;
                    if (i26 == 0) {
                        while (true) {
                            if (aVar.g() <= 0) {
                                break;
                            }
                            if (this.f90819i) {
                                int iN = aVar.N();
                                if (iN == 119) {
                                    this.f90819i = false;
                                    this.f90817g = 1;
                                    byte[] bArr = (byte[]) aVar2.f31986d;
                                    bArr[0] = 11;
                                    bArr[1] = 119;
                                    this.f90818h = 2;
                                } else {
                                    this.f90819i = iN == 11;
                                }
                            } else {
                                this.f90819i = aVar.N() == 11;
                            }
                        }
                    } else if (i26 == 1) {
                        byte[] bArr2 = (byte[]) aVar2.f31986d;
                        int iMin = Math.min(aVar.g(), 128 - this.f90818h);
                        aVar.z(this.f90818h, iMin, bArr2);
                        int i27 = this.f90818h + iMin;
                        this.f90818h = i27;
                        if (i27 == 128) {
                            ke.x xVar = this.f90812b;
                            xVar.o(0);
                            int[] iArr = he.a.f59659f;
                            int[] iArr2 = he.a.f59657d;
                            int iG = xVar.g();
                            xVar.r(40);
                            Object[] objArr = xVar.i(5) > 10;
                            xVar.o(iG);
                            if (objArr == true) {
                                xVar.r(16);
                                int i28 = xVar.i(2);
                                char c11 = i28 != 0 ? i28 != 1 ? i28 != 2 ? (char) 65535 : (char) 2 : (char) 1 : (char) 0;
                                xVar.r(3);
                                i13 = (xVar.i(11) + 1) * 2;
                                int i29 = xVar.i(2);
                                if (i29 == 3) {
                                    i14 = he.a.f59658e[xVar.i(2)];
                                    i15 = 3;
                                    i16 = 6;
                                } else {
                                    int i31 = xVar.i(2);
                                    int i32 = he.a.f59656c[i31];
                                    i14 = iArr2[i29];
                                    i15 = i31;
                                    i16 = i32;
                                }
                                i12 = i16 * 256;
                                int i33 = xVar.i(3);
                                boolean zH = xVar.h();
                                i11 = iArr[i33] + (zH ? 1 : 0);
                                xVar.r(10);
                                if (xVar.h()) {
                                    xVar.r(8);
                                }
                                if (i33 == 0) {
                                    xVar.r(5);
                                    if (xVar.h()) {
                                        xVar.r(8);
                                    }
                                }
                                if (c11 == 1 && xVar.h()) {
                                    xVar.r(16);
                                }
                                if (xVar.h()) {
                                    if (i33 > 2) {
                                        xVar.r(2);
                                    }
                                    if ((i33 & 1) == 0 || i33 <= 2) {
                                        i21 = 6;
                                    } else {
                                        i21 = 6;
                                        xVar.r(6);
                                    }
                                    if ((i33 & 4) != 0) {
                                        xVar.r(i21);
                                    }
                                    if (zH && xVar.h()) {
                                        xVar.r(5);
                                    }
                                    if (c11 == 0) {
                                        if (xVar.h()) {
                                            i22 = 6;
                                            xVar.r(6);
                                        } else {
                                            i22 = 6;
                                        }
                                        if (i33 == 0 && xVar.h()) {
                                            xVar.r(i22);
                                        }
                                        if (xVar.h()) {
                                            xVar.r(i22);
                                        }
                                        int i34 = xVar.i(2);
                                        if (i34 == 1) {
                                            xVar.r(5);
                                            i24 = 2;
                                        } else {
                                            if (i34 == 2) {
                                                xVar.r(12);
                                            } else if (i34 == 3) {
                                                int i35 = xVar.i(5);
                                                if (xVar.h()) {
                                                    xVar.r(5);
                                                    if (xVar.h()) {
                                                        i25 = 4;
                                                        xVar.r(4);
                                                    } else {
                                                        i25 = 4;
                                                    }
                                                    if (xVar.h()) {
                                                        xVar.r(i25);
                                                    }
                                                    if (xVar.h()) {
                                                        xVar.r(i25);
                                                    }
                                                    if (xVar.h()) {
                                                        xVar.r(i25);
                                                    }
                                                    if (xVar.h()) {
                                                        xVar.r(i25);
                                                    }
                                                    if (xVar.h()) {
                                                        xVar.r(i25);
                                                    }
                                                    if (xVar.h()) {
                                                        xVar.r(i25);
                                                    }
                                                    if (xVar.h()) {
                                                        if (xVar.h()) {
                                                            xVar.r(i25);
                                                        }
                                                        if (xVar.h()) {
                                                            xVar.r(i25);
                                                        }
                                                    }
                                                }
                                                if (xVar.h()) {
                                                    xVar.r(5);
                                                    if (xVar.h()) {
                                                        xVar.r(7);
                                                        if (xVar.h()) {
                                                            i23 = 8;
                                                            xVar.r(8);
                                                        } else {
                                                            i23 = 8;
                                                        }
                                                        i24 = 2;
                                                        xVar.r((i35 + 2) * i23);
                                                        xVar.c();
                                                    }
                                                }
                                            }
                                            i24 = 2;
                                        }
                                        if (i33 < i24) {
                                            if (xVar.h()) {
                                                xVar.r(14);
                                            }
                                            if (i33 == 0 && xVar.h()) {
                                                xVar.r(14);
                                            }
                                        }
                                        if (xVar.h()) {
                                            i17 = i15;
                                            if (i17 == 0) {
                                                xVar.r(5);
                                            } else {
                                                for (int i36 = 0; i36 < i16; i36++) {
                                                    if (xVar.h()) {
                                                        xVar.r(5);
                                                    }
                                                }
                                            }
                                        }
                                        if (xVar.h()) {
                                        }
                                        if (c11 == 0) {
                                            xVar.q();
                                        }
                                        if (c11 == 2) {
                                            i19 = 6;
                                            if (!xVar.h()) {
                                            }
                                        }
                                    }
                                } else {
                                    i17 = i15;
                                    if (xVar.h()) {
                                        i18 = 3;
                                    } else {
                                        xVar.r(5);
                                        if (i33 == 2) {
                                            xVar.r(4);
                                        }
                                        if (i33 >= 6) {
                                            xVar.r(2);
                                        }
                                        if (xVar.h()) {
                                            xVar.r(8);
                                        }
                                        if (i33 == 0 && xVar.h()) {
                                            xVar.r(8);
                                        }
                                        i18 = 3;
                                        if (i29 < 3) {
                                            xVar.q();
                                        }
                                    }
                                    if (c11 == 0 && i17 != i18) {
                                        xVar.q();
                                    }
                                    if (c11 == 2 || !(i17 == i18 || xVar.h())) {
                                        i19 = 6;
                                    } else {
                                        i19 = 6;
                                        xVar.r(6);
                                    }
                                    str = (!xVar.h() && xVar.i(i19) == 1 && xVar.i(8) == 1) ? "audio/eac3-joc" : "audio/eac3";
                                }
                            } else {
                                xVar.r(32);
                                int i37 = xVar.i(2);
                                String str2 = i37 == 3 ? null : "audio/ac3";
                                int iB = he.a.b(i37, xVar.i(6));
                                xVar.r(8);
                                int i38 = xVar.i(3);
                                if ((i38 & 1) == 0 || i38 == 1) {
                                    i5 = 2;
                                } else {
                                    i5 = 2;
                                    xVar.r(2);
                                }
                                if ((i38 & 4) != 0) {
                                    xVar.r(i5);
                                }
                                if (i38 == i5) {
                                    xVar.r(i5);
                                }
                                int i39 = i37 < 3 ? iArr2[i37] : -1;
                                i11 = iArr[i38] + (xVar.h() ? 1 : 0);
                                i12 = 1536;
                                str = str2;
                                i13 = iB;
                                i14 = i39;
                            }
                            k0 k0Var = this.f90821k;
                            if (k0Var == null || i11 != k0Var.f54894y || i14 != k0Var.f54895z || !wf.v.a(str, k0Var.f54883l)) {
                                j0 j0Var = new j0();
                                j0Var.f54846a = this.f90815e;
                                j0Var.f54856k = str;
                                j0Var.f54867x = i11;
                                j0Var.f54868y = i14;
                                j0Var.f54848c = this.f90814d;
                                k0 k0Var2 = new k0(j0Var);
                                this.f90821k = k0Var2;
                                this.f90816f.a(k0Var2);
                            }
                            this.f90822l = i13;
                            this.f90820j = (i12 * 1000000) / this.f90821k.f54895z;
                            aVar2.Y(0);
                            this.f90816f.d(128, aVar2);
                            this.f90817g = 2;
                        }
                    } else if (i26 == 2) {
                        int iMin2 = Math.min(aVar.g(), this.f90822l - this.f90818h);
                        this.f90816f.d(iMin2, aVar);
                        int i40 = this.f90818h + iMin2;
                        this.f90818h = i40;
                        int i41 = this.f90822l;
                        if (i40 == i41) {
                            long j11 = this.f90823m;
                            if (j11 != -9223372036854775807L) {
                                this.f90816f.b(j11, 1, i41, 0, null);
                                this.f90823m += this.f90820j;
                            }
                            this.f90817g = 0;
                        }
                    }
                }
                break;
            default:
                wf.a.j(this.f90816f);
                while (aVar.g() > 0) {
                    int i42 = this.f90817g;
                    com.google.android.gms.internal.consent_sdk.a aVar3 = this.f90813c;
                    if (i42 == 0) {
                        while (aVar.g() > 0) {
                            if (this.f90819i) {
                                int iN2 = aVar.N();
                                this.f90819i = iN2 == 172;
                                if (iN2 == 64 || iN2 == 65) {
                                    Object[] objArr2 = iN2 == 65;
                                    this.f90817g = 1;
                                    byte[] bArr3 = (byte[]) aVar3.f31986d;
                                    bArr3[0] = -84;
                                    bArr3[1] = (byte) (objArr2 == true ? 65 : 64);
                                    this.f90818h = 2;
                                }
                            } else {
                                this.f90819i = aVar.N() == 172;
                            }
                        }
                    } else if (i42 == 1) {
                        byte[] bArr4 = (byte[]) aVar3.f31986d;
                        int iMin3 = Math.min(aVar.g(), 16 - this.f90818h);
                        aVar.z(this.f90818h, iMin3, bArr4);
                        int i43 = this.f90818h + iMin3;
                        this.f90818h = i43;
                        if (i43 == 16) {
                            ke.x xVar2 = this.f90812b;
                            xVar2.o(0);
                            wg wgVarE = he.a.e(xVar2);
                            int i44 = wgVarE.f33198a;
                            k0 k0Var3 = this.f90821k;
                            if (k0Var3 == null || 2 != k0Var3.f54894y || i44 != k0Var3.f54895z || !"audio/ac4".equals(k0Var3.f54883l)) {
                                j0 j0Var2 = new j0();
                                j0Var2.f54846a = this.f90815e;
                                j0Var2.f54856k = "audio/ac4";
                                j0Var2.f54867x = 2;
                                j0Var2.f54868y = i44;
                                j0Var2.f54848c = this.f90814d;
                                k0 k0Var4 = new k0(j0Var2);
                                this.f90821k = k0Var4;
                                this.f90816f.a(k0Var4);
                            }
                            this.f90822l = wgVarE.f33199b;
                            this.f90820j = (wgVarE.f33200c * 1000000) / this.f90821k.f54895z;
                            aVar3.Y(0);
                            this.f90816f.d(16, aVar3);
                            this.f90817g = 2;
                        }
                    } else if (i42 == 2) {
                        int iMin4 = Math.min(aVar.g(), this.f90822l - this.f90818h);
                        this.f90816f.d(iMin4, aVar);
                        int i45 = this.f90818h + iMin4;
                        this.f90818h = i45;
                        int i46 = this.f90822l;
                        if (i45 == i46) {
                            long j12 = this.f90823m;
                            if (j12 != -9223372036854775807L) {
                                this.f90816f.b(j12, 1, i46, 0, null);
                                this.f90823m += this.f90820j;
                            }
                            this.f90817g = 0;
                        }
                    }
                }
                break;
        }
    }

    @Override // ue.h
    public final void h() {
        switch (this.f90811a) {
            case 0:
                this.f90817g = 0;
                this.f90818h = 0;
                this.f90819i = false;
                this.f90823m = -9223372036854775807L;
                break;
            default:
                this.f90817g = 0;
                this.f90818h = 0;
                this.f90819i = false;
                this.f90823m = -9223372036854775807L;
                break;
        }
    }

    @Override // ue.h
    public final void i(ke.l lVar, d0 d0Var) {
        switch (this.f90811a) {
            case 0:
                d0Var.a();
                d0Var.b();
                this.f90815e = d0Var.f90859e;
                d0Var.b();
                this.f90816f = lVar.s(d0Var.f90858d, 1);
                break;
            default:
                d0Var.a();
                d0Var.b();
                this.f90815e = d0Var.f90859e;
                d0Var.b();
                this.f90816f = lVar.s(d0Var.f90858d, 1);
                break;
        }
    }

    @Override // ue.h
    public final void j() {
        int i5 = this.f90811a;
    }

    @Override // ue.h
    public final void k(int i5, long j11) {
        switch (this.f90811a) {
            case 0:
                if (j11 != -9223372036854775807L) {
                    this.f90823m = j11;
                    break;
                }
                break;
            default:
                if (j11 != -9223372036854775807L) {
                    this.f90823m = j11;
                    break;
                }
                break;
        }
    }
}
