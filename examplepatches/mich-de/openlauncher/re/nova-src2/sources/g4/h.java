package g4;

import b.c0;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class h extends d {

    /* renamed from: p0, reason: collision with root package name */
    public float f57158p0 = -1.0f;

    /* renamed from: q0, reason: collision with root package name */
    public int f57159q0 = -1;

    /* renamed from: r0, reason: collision with root package name */
    public int f57160r0 = -1;

    /* renamed from: s0, reason: collision with root package name */
    public c f57161s0 = this.I;

    /* renamed from: t0, reason: collision with root package name */
    public int f57162t0 = 0;

    /* renamed from: u0, reason: collision with root package name */
    public boolean f57163u0;

    public h() {
        this.Q.clear();
        this.Q.add(this.f57161s0);
        int length = this.P.length;
        for (int i5 = 0; i5 < length; i5++) {
            this.P[i5] = this.f57161s0;
        }
    }

    @Override // g4.d
    public final void L(e4.c cVar, boolean z11) {
        if (this.S == null) {
            return;
        }
        c cVar2 = this.f57161s0;
        cVar.getClass();
        int iN = e4.c.n(cVar2);
        if (this.f57162t0 == 1) {
            this.X = iN;
            this.Y = 0;
            G(this.S.k());
            J(0);
            return;
        }
        this.X = 0;
        this.Y = iN;
        J(this.S.n());
        G(0);
    }

    public final void M(int i5) {
        this.f57161s0.l(i5);
        this.f57163u0 = true;
    }

    public final void N(int i5) {
        if (this.f57162t0 == i5) {
            return;
        }
        this.f57162t0 = i5;
        ArrayList arrayList = this.Q;
        arrayList.clear();
        if (this.f57162t0 == 1) {
            this.f57161s0 = this.H;
        } else {
            this.f57161s0 = this.I;
        }
        arrayList.add(this.f57161s0);
        c[] cVarArr = this.P;
        int length = cVarArr.length;
        for (int i11 = 0; i11 < length; i11++) {
            cVarArr[i11] = this.f57161s0;
        }
    }

    @Override // g4.d
    public final void b(e4.c cVar, boolean z11) {
        e eVar = (e) this.S;
        if (eVar == null) {
            return;
        }
        Object objI = eVar.i(2);
        Object objI2 = eVar.i(4);
        d dVar = this.S;
        boolean z12 = dVar != null && dVar.f57109o0[0] == 2;
        if (this.f57162t0 == 0) {
            objI = eVar.i(3);
            objI2 = eVar.i(5);
            d dVar2 = this.S;
            z12 = dVar2 != null && dVar2.f57109o0[1] == 2;
        }
        if (this.f57163u0) {
            c cVar2 = this.f57161s0;
            if (cVar2.f57075c) {
                e4.f fVarK = cVar.k(cVar2);
                cVar.d(fVarK, this.f57161s0.d());
                if (this.f57159q0 != -1) {
                    if (z12) {
                        cVar.f(cVar.k(objI2), fVarK, 0, 5);
                    }
                } else if (this.f57160r0 != -1 && z12) {
                    e4.f fVarK2 = cVar.k(objI2);
                    cVar.f(fVarK, cVar.k(objI), 0, 5);
                    cVar.f(fVarK2, fVarK, 0, 5);
                }
                this.f57163u0 = false;
                return;
            }
        }
        if (this.f57159q0 != -1) {
            e4.f fVarK3 = cVar.k(this.f57161s0);
            cVar.e(fVarK3, cVar.k(objI), this.f57159q0, 8);
            if (z12) {
                cVar.f(cVar.k(objI2), fVarK3, 0, 5);
                return;
            }
            return;
        }
        if (this.f57160r0 != -1) {
            e4.f fVarK4 = cVar.k(this.f57161s0);
            e4.f fVarK5 = cVar.k(objI2);
            cVar.e(fVarK4, fVarK5, -this.f57160r0, 8);
            if (z12) {
                cVar.f(fVarK4, cVar.k(objI), 0, 5);
                cVar.f(fVarK5, fVarK4, 0, 5);
                return;
            }
            return;
        }
        if (this.f57158p0 != -1.0f) {
            e4.f fVarK6 = cVar.k(this.f57161s0);
            e4.f fVarK7 = cVar.k(objI2);
            float f11 = this.f57158p0;
            e4.b bVarL = cVar.l();
            bVarL.f52132d.g(fVarK6, -1.0f);
            bVarL.f52132d.g(fVarK7, f11);
            cVar.c(bVarL);
        }
    }

    @Override // g4.d
    public final boolean c() {
        return true;
    }

    @Override // g4.d
    public final c i(int i5) {
        int iF = c0.F(i5);
        if (iF != 1) {
            if (iF != 2) {
                if (iF != 3) {
                    if (iF != 4) {
                        return null;
                    }
                }
            }
            if (this.f57162t0 == 0) {
                return this.f57161s0;
            }
            return null;
        }
        if (this.f57162t0 == 1) {
            return this.f57161s0;
        }
        return null;
    }

    @Override // g4.d
    public final boolean x() {
        return this.f57163u0;
    }

    @Override // g4.d
    public final boolean y() {
        return this.f57163u0;
    }
}
