package h4;

import b.c0;

/* loaded from: classes2.dex */
public abstract class o implements d {

    /* renamed from: a, reason: collision with root package name */
    public int f59132a;

    /* renamed from: b, reason: collision with root package name */
    public g4.d f59133b;

    /* renamed from: c, reason: collision with root package name */
    public l f59134c;

    /* renamed from: d, reason: collision with root package name */
    public int f59135d;

    /* renamed from: e, reason: collision with root package name */
    public final g f59136e = new g(this);

    /* renamed from: f, reason: collision with root package name */
    public int f59137f = 0;

    /* renamed from: g, reason: collision with root package name */
    public boolean f59138g = false;

    /* renamed from: h, reason: collision with root package name */
    public final f f59139h = new f(this);

    /* renamed from: i, reason: collision with root package name */
    public final f f59140i = new f(this);

    /* renamed from: j, reason: collision with root package name */
    public int f59141j = 1;

    public o(g4.d dVar) {
        this.f59133b = dVar;
    }

    public static void b(f fVar, f fVar2, int i5) {
        fVar.f59118l.add(fVar2);
        fVar.f59112f = i5;
        fVar2.f59117k.add(fVar);
    }

    public static f h(g4.c cVar) {
        g4.c cVar2 = cVar.f57078f;
        if (cVar2 == null) {
            return null;
        }
        g4.d dVar = cVar2.f57076d;
        int iF = c0.F(cVar2.f57077e);
        if (iF == 1) {
            return dVar.f57088d.f59139h;
        }
        if (iF == 2) {
            return dVar.f57090e.f59139h;
        }
        if (iF == 3) {
            return dVar.f57088d.f59140i;
        }
        if (iF == 4) {
            return dVar.f57090e.f59140i;
        }
        if (iF != 5) {
            return null;
        }
        return dVar.f57090e.f59124k;
    }

    public static f i(g4.c cVar, int i5) {
        g4.c cVar2 = cVar.f57078f;
        if (cVar2 == null) {
            return null;
        }
        g4.d dVar = cVar2.f57076d;
        o oVar = i5 == 0 ? dVar.f57088d : dVar.f57090e;
        int iF = c0.F(cVar2.f57077e);
        if (iF == 1 || iF == 2) {
            return oVar.f59139h;
        }
        if (iF == 3 || iF == 4) {
            return oVar.f59140i;
        }
        return null;
    }

    public final void c(f fVar, f fVar2, int i5, g gVar) {
        fVar.f59118l.add(fVar2);
        fVar.f59118l.add(this.f59136e);
        fVar.f59114h = i5;
        fVar.f59115i = gVar;
        fVar2.f59117k.add(fVar);
        gVar.f59117k.add(fVar);
    }

    public abstract void d();

    public abstract void e();

    public abstract void f();

    public final int g(int i5, int i11) {
        if (i11 == 0) {
            g4.d dVar = this.f59133b;
            int i12 = dVar.f57115u;
            int iMax = Math.max(dVar.f57114t, i5);
            if (i12 > 0) {
                iMax = Math.min(i12, i5);
            }
            if (iMax != i5) {
                return iMax;
            }
        } else {
            g4.d dVar2 = this.f59133b;
            int i13 = dVar2.f57118x;
            int iMax2 = Math.max(dVar2.f57117w, i5);
            if (i13 > 0) {
                iMax2 = Math.min(i13, i5);
            }
            if (iMax2 != i5) {
                return iMax2;
            }
        }
        return i5;
    }

    public long j() {
        if (this.f59136e.f59116j) {
            return r0.f59113g;
        }
        return 0L;
    }

    public abstract boolean k();

    /* JADX WARN: Removed duplicated region for block: B:28:0x0054  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l(g4.c cVar, g4.c cVar2, int i5) {
        f fVarH = h(cVar);
        f fVarH2 = h(cVar2);
        if (fVarH.f59116j && fVarH2.f59116j) {
            int iE = cVar.e() + fVarH.f59113g;
            int iE2 = fVarH2.f59113g - cVar2.e();
            int i11 = iE2 - iE;
            g gVar = this.f59136e;
            if (!gVar.f59116j && this.f59135d == 3) {
                int i12 = this.f59132a;
                if (i12 == 0) {
                    gVar.d(g(i11, i5));
                } else if (i12 == 1) {
                    gVar.d(Math.min(g(gVar.f59119m, i5), i11));
                } else if (i12 == 2) {
                    g4.d dVar = this.f59133b;
                    g4.d dVar2 = dVar.S;
                    if (dVar2 != null) {
                        if ((i5 == 0 ? dVar2.f57088d : dVar2.f57090e).f59136e.f59116j) {
                            gVar.d(g((int) ((r6.f59113g * (i5 == 0 ? dVar.f57116v : dVar.f57119y)) + 0.5f), i5));
                        }
                    }
                } else if (i12 == 3) {
                    g4.d dVar3 = this.f59133b;
                    o oVar = dVar3.f57088d;
                    if (oVar.f59135d == 3 && oVar.f59132a == 3) {
                        m mVar = dVar3.f57090e;
                        if (mVar.f59135d != 3 || mVar.f59132a != 3) {
                        }
                    } else {
                        if (i5 == 0) {
                            oVar = dVar3.f57090e;
                        }
                        if (oVar.f59136e.f59116j) {
                            float f11 = dVar3.V;
                            gVar.d(i5 == 1 ? (int) ((r6.f59113g / f11) + 0.5f) : (int) ((f11 * r6.f59113g) + 0.5f));
                        }
                    }
                }
            }
            if (gVar.f59116j) {
                int i13 = gVar.f59113g;
                f fVar = this.f59140i;
                f fVar2 = this.f59139h;
                if (i13 == i11) {
                    fVar2.d(iE);
                    fVar.d(iE2);
                    return;
                }
                float f12 = i5 == 0 ? this.f59133b.f57087c0 : this.f59133b.f57089d0;
                if (fVarH == fVarH2) {
                    iE = fVarH.f59113g;
                    iE2 = fVarH2.f59113g;
                    f12 = 0.5f;
                }
                fVar2.d((int) ((((iE2 - iE) - i13) * f12) + iE + 0.5f));
                fVar.d(fVar2.f59113g + gVar.f59113g);
            }
        }
    }
}
