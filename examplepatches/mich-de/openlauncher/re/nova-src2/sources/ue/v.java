package ue;

import com.google.android.gms.internal.measurement.k2;

/* loaded from: classes3.dex */
public final class v implements e0 {

    /* renamed from: a, reason: collision with root package name */
    public final h f91049a;

    /* renamed from: b, reason: collision with root package name */
    public final ke.x f91050b = new ke.x(new byte[10], 10);

    /* renamed from: c, reason: collision with root package name */
    public int f91051c = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f91052d;

    /* renamed from: e, reason: collision with root package name */
    public wf.t f91053e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f91054f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f91055g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f91056h;

    /* renamed from: i, reason: collision with root package name */
    public int f91057i;

    /* renamed from: j, reason: collision with root package name */
    public int f91058j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f91059k;

    /* renamed from: l, reason: collision with root package name */
    public long f91060l;

    public v(h hVar) {
        this.f91049a = hVar;
    }

    @Override // ue.e0
    public final void a(int i5, com.google.android.gms.internal.consent_sdk.a aVar) {
        int i11;
        int i12;
        int i13;
        wf.a.j(this.f91053e);
        int i14 = i5 & 1;
        h hVar = this.f91049a;
        int i15 = 2;
        int i16 = 0;
        if (i14 != 0) {
            int i17 = this.f91051c;
            if (i17 != 0 && i17 != 1) {
                if (i17 == 2) {
                    wf.a.D("PesReader", "Unexpected start indicator reading extended header");
                } else {
                    if (i17 != 3) {
                        throw new IllegalStateException();
                    }
                    if (this.f91058j != -1) {
                        wf.a.D("PesReader", "Unexpected start indicator: expected " + this.f91058j + " more bytes");
                    }
                    hVar.j();
                }
            }
            this.f91051c = 1;
            this.f91052d = 0;
        }
        int i18 = i5;
        while (aVar.g() > 0) {
            int i19 = this.f91051c;
            if (i19 != 0) {
                ke.x xVar = this.f91050b;
                if (i19 != 1) {
                    if (i19 == i15) {
                        if (b(aVar, xVar.f71449d, Math.min(10, this.f91057i)) && b(aVar, null, this.f91057i)) {
                            xVar.o(i16);
                            this.f91060l = -9223372036854775807L;
                            if (this.f91054f) {
                                xVar.r(4);
                                xVar.r(1);
                                xVar.r(1);
                                long jI = (xVar.i(15) << 15) | (xVar.i(3) << 30) | xVar.i(15);
                                xVar.r(1);
                                if (!this.f91056h && this.f91055g) {
                                    xVar.r(4);
                                    xVar.r(1);
                                    xVar.r(1);
                                    xVar.r(1);
                                    this.f91053e.b((xVar.i(3) << 30) | (xVar.i(15) << 15) | xVar.i(15));
                                    this.f91056h = true;
                                }
                                this.f91060l = this.f91053e.b(jI);
                            }
                            i18 |= this.f91059k ? 4 : 0;
                            hVar.k(i18, this.f91060l);
                            this.f91051c = 3;
                            this.f91052d = 0;
                            i16 = 0;
                            i15 = 2;
                        }
                    } else {
                        if (i19 != 3) {
                            throw new IllegalStateException();
                        }
                        int iG = aVar.g();
                        int i21 = this.f91058j;
                        int i22 = i21 == -1 ? i16 : iG - i21;
                        if (i22 > 0) {
                            iG -= i22;
                            aVar.X(aVar.f31984b + iG);
                        }
                        hVar.f(aVar);
                        int i23 = this.f91058j;
                        if (i23 != -1) {
                            int i24 = i23 - iG;
                            this.f91058j = i24;
                            if (i24 == 0) {
                                hVar.j();
                                this.f91051c = 1;
                                this.f91052d = i16;
                            }
                        }
                    }
                    i11 = i15;
                    i12 = i16;
                } else {
                    i12 = i16;
                    if (b(aVar, xVar.f71449d, 9)) {
                        xVar.o(i12);
                        int i25 = xVar.i(24);
                        if (i25 != 1) {
                            k2.t(i25, "Unexpected start code prefix: ", "PesReader");
                            this.f91058j = -1;
                            i13 = 0;
                            i11 = 2;
                        } else {
                            xVar.r(8);
                            int i26 = xVar.i(16);
                            xVar.r(5);
                            this.f91059k = xVar.h();
                            i11 = 2;
                            xVar.r(2);
                            this.f91054f = xVar.h();
                            this.f91055g = xVar.h();
                            xVar.r(6);
                            int i27 = xVar.i(8);
                            this.f91057i = i27;
                            if (i26 == 0) {
                                this.f91058j = -1;
                            } else {
                                int i28 = (i26 - 3) - i27;
                                this.f91058j = i28;
                                if (i28 < 0) {
                                    wf.a.D("PesReader", "Found negative packet payload size: " + this.f91058j);
                                    this.f91058j = -1;
                                }
                            }
                            i13 = 2;
                        }
                        this.f91051c = i13;
                        i12 = 0;
                        this.f91052d = 0;
                    } else {
                        i11 = 2;
                    }
                }
            } else {
                i11 = i15;
                i12 = i16;
                aVar.Z(aVar.g());
            }
            i16 = i12;
            i15 = i11;
        }
    }

    public final boolean b(com.google.android.gms.internal.consent_sdk.a aVar, byte[] bArr, int i5) {
        int iMin = Math.min(aVar.g(), i5 - this.f91052d);
        if (iMin <= 0) {
            return true;
        }
        if (bArr == null) {
            aVar.Z(iMin);
        } else {
            aVar.z(this.f91052d, iMin, bArr);
        }
        int i11 = this.f91052d + iMin;
        this.f91052d = i11;
        return i11 == i5;
    }

    @Override // ue.e0
    public final void g(wf.t tVar, ke.l lVar, d0 d0Var) {
        this.f91053e = tVar;
        this.f91049a.i(lVar, d0Var);
    }

    @Override // ue.e0
    public final void h() {
        this.f91051c = 0;
        this.f91052d = 0;
        this.f91056h = false;
        this.f91049a.h();
    }
}
