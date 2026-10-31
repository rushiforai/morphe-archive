package n8;

import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import i2.r0;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import p1.e1;
import p1.s2;
import p1.z1;
import t70.k0;
import t70.m0;
import t70.y0;
import w70.i2;
import w70.u1;

/* loaded from: classes.dex */
public final class l extends n2.c implements z1 {

    /* renamed from: e, reason: collision with root package name */
    public y70.d f77989e;

    /* renamed from: f, reason: collision with root package name */
    public final i2 f77990f = u1.c(new h2.e(0));

    /* renamed from: g, reason: collision with root package name */
    public final e1 f77991g = androidx.compose.runtime.d.k(null);

    /* renamed from: h, reason: collision with root package name */
    public final e1 f77992h = androidx.compose.runtime.d.k(Float.valueOf(1.0f));

    /* renamed from: i, reason: collision with root package name */
    public final e1 f77993i = androidx.compose.runtime.d.k(null);

    /* renamed from: j, reason: collision with root package name */
    public h f77994j;

    /* renamed from: k, reason: collision with root package name */
    public n2.c f77995k;

    /* renamed from: l, reason: collision with root package name */
    public Function1 f77996l;

    /* renamed from: m, reason: collision with root package name */
    public z2.l f77997m;
    public int n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final e1 f77998p;

    /* renamed from: q, reason: collision with root package name */
    public final e1 f77999q;

    /* renamed from: r, reason: collision with root package name */
    public final e1 f78000r;

    public l(x8.k kVar, m8.k kVar2) {
        d dVar = d.f77978a;
        this.f77994j = dVar;
        this.f77996l = b.f77975l;
        this.f77997m = z2.k.f98095b;
        this.n = 1;
        this.f77998p = androidx.compose.runtime.d.k(dVar);
        this.f77999q = androidx.compose.runtime.d.k(kVar);
        this.f78000r = androidx.compose.runtime.d.k(kVar2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // p1.z1
    public final void a() {
        if (this.f77989e != null) {
            return;
        }
        t70.i2 i2VarD = m0.d();
        a80.e eVar = y0.f88884a;
        y70.d dVarA = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, y70.o.f96819a.f90673f));
        this.f77989e = dVarA;
        n2.c cVar = this.f77995k;
        Object[] objArr = 0;
        z1 z1Var = cVar instanceof z1 ? (z1) cVar : null;
        if (z1Var != null) {
            z1Var.a();
        }
        if (!this.o) {
            m0.t(dVarA, null, null, new a60.d(this, objArr == true ? 1 : 0, 26), 3);
            return;
        }
        x8.i iVarA = x8.k.a((x8.k) ((s2) this.f77999q).getValue());
        iVarA.f95305b = ((m8.k) ((s2) this.f78000r).getValue()).f76076b;
        iVarA.f95325x = 0;
        x8.k kVarA = iVarA.a();
        Drawable drawableB = c9.e.b(kVarA, kVarA.f95345v, kVarA.f95344u, kVarA.f95349z.f95289j);
        k(new f(drawableB != null ? j(drawableB) : null));
    }

    @Override // n2.c
    public final void b(float f11) {
        ((s2) this.f77992h).setValue(Float.valueOf(f11));
    }

    @Override // n2.c
    public final void c(i2.t tVar) {
        ((s2) this.f77993i).setValue(tVar);
    }

    @Override // n2.c
    public final long f() {
        n2.c cVar = (n2.c) ((s2) this.f77991g).getValue();
        if (cVar != null) {
            return cVar.f();
        }
        return 9205357640488583168L;
    }

    @Override // p1.z1
    public final void g() {
        y70.d dVar = this.f77989e;
        if (dVar != null) {
            k0.c(dVar, null);
        }
        this.f77989e = null;
        Object obj = this.f77995k;
        z1 z1Var = obj instanceof z1 ? (z1) obj : null;
        if (z1Var != null) {
            z1Var.g();
        }
    }

    @Override // n2.c
    public final void h(k2.f fVar) {
        h2.e eVar = new h2.e(fVar.mo94getSizeNHjbRc());
        i2 i2Var = this.f77990f;
        i2Var.getClass();
        i2Var.k(null, eVar);
        n2.c cVar = (n2.c) ((s2) this.f77991g).getValue();
        if (cVar != null) {
            cVar.e(fVar, fVar.mo94getSizeNHjbRc(), ((Number) ((s2) this.f77992h).getValue()).floatValue(), (i2.t) ((s2) this.f77993i).getValue());
        }
    }

    @Override // p1.z1
    public final void i() {
        y70.d dVar = this.f77989e;
        if (dVar != null) {
            k0.c(dVar, null);
        }
        this.f77989e = null;
        Object obj = this.f77995k;
        z1 z1Var = obj instanceof z1 ? (z1) obj : null;
        if (z1Var != null) {
            z1Var.i();
        }
    }

    public final n2.c j(Drawable drawable) {
        return drawable instanceof BitmapDrawable ? t2.c.c(vh.a.k(((BitmapDrawable) drawable).getBitmap()), this.n) : drawable instanceof ColorDrawable ? new n2.b(r0.b(((ColorDrawable) drawable).getColor())) : new cd.b(drawable.mutate());
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0066  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void k(h hVar) {
        x8.l lVar;
        n2.c cVarA;
        h hVar2 = this.f77994j;
        h hVar3 = (h) this.f77996l.invoke(hVar);
        this.f77994j = hVar3;
        ((s2) this.f77998p).setValue(hVar3);
        if (!(hVar3 instanceof g)) {
            if (hVar3 instanceof e) {
                lVar = ((e) hVar3).f77980b;
            }
            cVarA = null;
            if (cVarA == null) {
                cVarA = hVar3.a();
            }
            this.f77995k = cVarA;
            ((s2) this.f77991g).setValue(cVarA);
            if (this.f77989e != null || hVar2.a() == hVar3.a()) {
            }
            Object objA = hVar2.a();
            z1 z1Var = objA instanceof z1 ? (z1) objA : null;
            if (z1Var != null) {
                z1Var.i();
            }
            Object objA2 = hVar3.a();
            z1 z1Var2 = objA2 instanceof z1 ? (z1) objA2 : null;
            if (z1Var2 != null) {
                z1Var2.a();
                return;
            }
            return;
        }
        lVar = ((g) hVar3).f77983b;
        b9.f fVarA = lVar.b().f95332g.a(n.f78001a, lVar);
        if (fVarA instanceof b9.b) {
            cVarA = new t(hVar2 instanceof f ? hVar2.a() : null, hVar3.a(), this.f77997m, ((b9.b) fVarA).f17644c, ((lVar instanceof x8.r) && ((x8.r) lVar).f95373g) ? false : true);
        } else {
            cVarA = null;
        }
        if (cVarA == null) {
        }
        this.f77995k = cVarA;
        ((s2) this.f77991g).setValue(cVarA);
        if (this.f77989e != null) {
        }
    }
}
