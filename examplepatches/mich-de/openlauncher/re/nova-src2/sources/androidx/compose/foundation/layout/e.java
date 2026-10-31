package androidx.compose.foundation.layout;

import b2.i;
import b2.j;
import b2.k;
import b2.t;
import e10.j2;
import k0.g0;
import kotlin.jvm.internal.Intrinsics;
import l1.k3;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final FillElement f13971a;

    /* renamed from: b, reason: collision with root package name */
    public static final FillElement f13972b;

    /* renamed from: c, reason: collision with root package name */
    public static final FillElement f13973c;

    /* renamed from: d, reason: collision with root package name */
    public static final WrapContentElement f13974d;

    /* renamed from: e, reason: collision with root package name */
    public static final WrapContentElement f13975e;

    /* renamed from: f, reason: collision with root package name */
    public static final WrapContentElement f13976f;

    /* renamed from: g, reason: collision with root package name */
    public static final WrapContentElement f13977g;

    /* renamed from: h, reason: collision with root package name */
    public static final WrapContentElement f13978h;

    /* renamed from: i, reason: collision with root package name */
    public static final WrapContentElement f13979i;

    static {
        g0 g0Var = g0.f70608b;
        f13971a = new FillElement(g0Var, 1.0f, "fillMaxWidth");
        g0 g0Var2 = g0.f70607a;
        f13972b = new FillElement(g0Var2, 1.0f, "fillMaxHeight");
        g0 g0Var3 = g0.f70609c;
        f13973c = new FillElement(g0Var3, 1.0f, "fillMaxSize");
        i iVar = b2.d.n;
        f13974d = new WrapContentElement(g0Var, new k0.c(iVar, 1), iVar, "wrapContentWidth");
        i iVar2 = b2.d.f17009m;
        f13975e = new WrapContentElement(g0Var, new k0.c(iVar2, 1), iVar2, "wrapContentWidth");
        j jVar = b2.d.f17007k;
        f13976f = new WrapContentElement(g0Var2, new j2(jVar, 4), jVar, "wrapContentHeight");
        j jVar2 = b2.d.f17006j;
        f13977g = new WrapContentElement(g0Var2, new j2(jVar2, 4), jVar2, "wrapContentHeight");
        k kVar = b2.d.f17001e;
        f13978h = new WrapContentElement(g0Var3, new j2(kVar, 5), kVar, "wrapContentSize");
        k kVar2 = b2.d.f16997a;
        f13979i = new WrapContentElement(g0Var3, new j2(kVar2, 5), kVar2, "wrapContentSize");
    }

    public static final t a(t tVar, float f11, float f12) {
        return tVar.then(new UnspecifiedConstraintsElement(f11, f12));
    }

    public static /* synthetic */ t b(t tVar, float f11, float f12, int i5) {
        if ((i5 & 1) != 0) {
            f11 = Float.NaN;
        }
        if ((i5 & 2) != 0) {
            f12 = Float.NaN;
        }
        return a(tVar, f11, f12);
    }

    public static final t c(t tVar, float f11) {
        return tVar.then(f11 == 1.0f ? f13972b : new FillElement(g0.f70607a, f11, "fillMaxHeight"));
    }

    public static t d(t tVar) {
        return tVar.then(f13973c);
    }

    public static final t e(t tVar, float f11) {
        return tVar.then(f11 == 1.0f ? f13971a : new FillElement(g0.f70608b, f11, "fillMaxWidth"));
    }

    public static final t g(t tVar, float f11) {
        return tVar.then(new SizeElement(0.0f, f11, 0.0f, f11, true, 5));
    }

    public static final t h(t tVar, float f11, float f12) {
        return tVar.then(new SizeElement(0.0f, f11, 0.0f, f12, true, 5));
    }

    public static /* synthetic */ t i(t tVar, float f11, float f12, int i5) {
        if ((i5 & 1) != 0) {
            f11 = Float.NaN;
        }
        if ((i5 & 2) != 0) {
            f12 = Float.NaN;
        }
        return h(tVar, f11, f12);
    }

    public static final t j(float f11) {
        return new SizeElement(0.0f, f11, 0.0f, f11, false, 5);
    }

    public static final t k(t tVar, float f11) {
        return tVar.then(new SizeElement(f11, f11, f11, f11, false));
    }

    public static final t l(t tVar, float f11, float f12) {
        return tVar.then(new SizeElement(f11, f12, f11, f12, false));
    }

    public static t m(t tVar, float f11, float f12, float f13, float f14, int i5) {
        return tVar.then(new SizeElement((i5 & 1) != 0 ? Float.NaN : f11, (i5 & 2) != 0 ? Float.NaN : f12, (i5 & 4) != 0 ? Float.NaN : f13, (i5 & 8) != 0 ? Float.NaN : f14, false));
    }

    public static final t n(t tVar, float f11) {
        return tVar.then(new SizeElement(f11, 0.0f, f11, 0.0f, false, 10));
    }

    public static final t o(t tVar, float f11) {
        return tVar.then(new SizeElement(f11, f11, f11, f11, true));
    }

    public static final t p(t tVar, long j11) {
        return q(tVar, y3.i.b(j11), y3.i.a(j11));
    }

    public static final t q(t tVar, float f11, float f12) {
        return tVar.then(new SizeElement(f11, f12, f11, f12, true));
    }

    public static final t r(t tVar, float f11, float f12, float f13, float f14) {
        return tVar.then(new SizeElement(f11, f12, f13, f14, true));
    }

    public static /* synthetic */ t s(t tVar, float f11, float f12, float f13, int i5) {
        float f14 = k3.f73531b;
        if ((i5 & 1) != 0) {
            f11 = Float.NaN;
        }
        if ((i5 & 2) != 0) {
            f14 = Float.NaN;
        }
        if ((i5 & 4) != 0) {
            f12 = Float.NaN;
        }
        if ((i5 & 8) != 0) {
            f13 = Float.NaN;
        }
        return r(tVar, f11, f14, f12, f13);
    }

    public static final t t(t tVar, float f11) {
        return tVar.then(new SizeElement(f11, 0.0f, f11, 0.0f, true, 10));
    }

    public static final t u(t tVar, float f11, float f12) {
        return tVar.then(new SizeElement(f11, 0.0f, f12, 0.0f, true, 10));
    }

    public static /* synthetic */ t v(t tVar, float f11, float f12, int i5) {
        if ((i5 & 1) != 0) {
            f11 = Float.NaN;
        }
        if ((i5 & 2) != 0) {
            f12 = Float.NaN;
        }
        return u(tVar, f11, f12);
    }

    public static t w(t tVar) {
        j jVar = b2.d.f17007k;
        return tVar.then(Intrinsics.b(jVar, jVar) ? f13976f : Intrinsics.b(jVar, b2.d.f17006j) ? f13977g : new WrapContentElement(g0.f70607a, new j2(jVar, 4), jVar, "wrapContentHeight"));
    }

    public static t x(t tVar, k kVar, int i5) {
        int i11 = i5 & 1;
        k kVar2 = b2.d.f17001e;
        if (i11 != 0) {
            kVar = kVar2;
        }
        return tVar.then(kVar.equals(kVar2) ? f13978h : kVar.equals(b2.d.f16997a) ? f13979i : new WrapContentElement(g0.f70609c, new j2(kVar, 5), kVar, "wrapContentSize"));
    }

    public static t y(t tVar) {
        i iVar = b2.d.n;
        return tVar.then(Intrinsics.b(iVar, iVar) ? f13974d : Intrinsics.b(iVar, b2.d.f17009m) ? f13975e : new WrapContentElement(g0.f70608b, new k0.c(iVar, 1), iVar, "wrapContentWidth"));
    }
}
