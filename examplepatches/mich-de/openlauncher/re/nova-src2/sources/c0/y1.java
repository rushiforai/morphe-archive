package c0;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import p1.s2;
import p1.y2;

/* loaded from: classes2.dex */
public final class y1 implements y2 {

    /* renamed from: a, reason: collision with root package name */
    public final i2 f19014a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f19015b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.e1 f19016c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f19017d;

    /* renamed from: e, reason: collision with root package name */
    public a1 f19018e;

    /* renamed from: f, reason: collision with root package name */
    public t1 f19019f;

    /* renamed from: g, reason: collision with root package name */
    public final p1.e1 f19020g;

    /* renamed from: h, reason: collision with root package name */
    public final p1.m2 f19021h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f19022i;

    /* renamed from: j, reason: collision with root package name */
    public final p1.e1 f19023j;

    /* renamed from: k, reason: collision with root package name */
    public s f19024k;

    /* renamed from: l, reason: collision with root package name */
    public final p1.q2 f19025l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f19026m;
    public final l1 n;
    public final /* synthetic */ c2 o;

    /* JADX WARN: Type inference failed for: r10v12, types: [java.lang.Object, java.util.Map] */
    public y1(c2 c2Var, Object obj, s sVar, i2 i2Var) {
        this.o = c2Var;
        this.f19014a = i2Var;
        p1.e1 e1VarK = androidx.compose.runtime.d.k(obj);
        this.f19015b = e1VarK;
        Object objInvoke = null;
        p1.e1 e1VarK2 = androidx.compose.runtime.d.k(f.h(0.0f, 0.0f, null, 7));
        this.f19016c = e1VarK2;
        this.f19017d = androidx.compose.runtime.d.k(new t1((c0) ((s2) e1VarK2).getValue(), i2Var, obj, ((s2) e1VarK).getValue(), sVar));
        this.f19020g = androidx.compose.runtime.d.k(Boolean.TRUE);
        this.f19021h = androidx.compose.runtime.d.f(-1.0f);
        this.f19023j = androidx.compose.runtime.d.k(obj);
        this.f19024k = sVar;
        this.f19025l = androidx.compose.runtime.d.h(c().d());
        Float f11 = (Float) q2.f18933a.get(i2Var);
        if (f11 != null) {
            float fFloatValue = f11.floatValue();
            s sVar2 = (s) i2Var.f18832a.invoke(obj);
            int iB = sVar2.b();
            for (int i5 = 0; i5 < iB; i5++) {
                sVar2.e(fFloatValue, i5);
            }
            objInvoke = this.f19014a.f18833b.invoke(sVar2);
        }
        this.n = f.h(0.0f, 0.0f, objInvoke, 3);
    }

    public final void a() {
        this.f19019f = null;
        this.f19018e = null;
        this.f19022i = false;
    }

    public final t1 c() {
        return (t1) ((s2) this.f19017d).getValue();
    }

    public final long d() {
        return this.f19025l.m();
    }

    public final a1 e() {
        return this.f19018e;
    }

    public final float f() {
        return this.f19021h.m();
    }

    public final boolean g() {
        return ((Boolean) ((s2) this.f19020g).getValue()).booleanValue();
    }

    @Override // p1.y2
    public final Object getValue() {
        return ((s2) this.f19023j).getValue();
    }

    public final void h(long j11, boolean z11) {
        if (z11) {
            j11 = c().d();
        }
        n(c().f(j11));
        this.f19024k = c().b(j11);
        if (c().c(j11)) {
            ((s2) this.f19020g).setValue(Boolean.TRUE);
        }
    }

    public final void i() {
        this.f19021h.p(-2.0f);
    }

    public final void j(float f11) {
        if (f11 != -4.0f && f11 != -5.0f) {
            this.f19021h.p(f11);
            return;
        }
        t1 t1Var = this.f19019f;
        if (t1Var != null) {
            c().h(t1Var.f18951c);
            this.f19018e = null;
            this.f19019f = null;
        }
        Object obj = f11 == -4.0f ? c().f18952d : c().f18951c;
        c().h(obj);
        c().i(obj);
        n(obj);
        this.f19025l.p(c().d());
    }

    public final void k(long j11) {
        if (f() == -1.0f) {
            this.f19026m = true;
            if (Intrinsics.b(c().f18951c, c().f18952d)) {
                n(c().f18951c);
            } else {
                n(c().f(j11));
                this.f19024k = c().b(j11);
            }
        }
    }

    public final void m(a1 a1Var) {
        if (!Intrinsics.b(c().f18951c, c().f18952d)) {
            this.f19019f = c();
            this.f19018e = a1Var;
        }
        s2 s2Var = (s2) this.f19023j;
        ((s2) this.f19017d).setValue(new t1(this.n, this.f19014a, s2Var.getValue(), s2Var.getValue(), this.f19024k.c()));
        this.f19025l.p(c().d());
        this.f19022i = true;
    }

    public final void n(Object obj) {
        ((s2) this.f19023j).setValue(obj);
    }

    public final void o(Object obj, boolean z11) {
        t1 t1Var = this.f19019f;
        Object obj2 = t1Var != null ? t1Var.f18951c : null;
        s2 s2Var = (s2) this.f19015b;
        boolean zB = Intrinsics.b(obj2, s2Var.getValue());
        p1.q2 q2Var = this.f19025l;
        p1.e1 e1Var = this.f19017d;
        c0 c0Var = this.n;
        if (zB) {
            ((s2) e1Var).setValue(new t1(c0Var, this.f19014a, obj, obj, this.f19024k.c()));
            this.f19022i = true;
            q2Var.p(c().d());
            return;
        }
        p1.e1 e1Var2 = this.f19016c;
        if (!z11 || this.f19026m || (((c0) ((s2) e1Var2).getValue()) instanceof l1)) {
            c0Var = (c0) ((s2) e1Var2).getValue();
        }
        c2 c2Var = this.o;
        long jE = c2Var.e();
        p1.e1 e1Var3 = c2Var.f18737h;
        ((s2) e1Var).setValue(new t1(jE <= 0 ? c0Var : new m1(c0Var, c2Var.e()), this.f19014a, obj, s2Var.getValue(), this.f19024k));
        q2Var.p(c().d());
        this.f19022i = false;
        ((s2) e1Var3).setValue(Boolean.TRUE);
        if (c2Var.h()) {
            SnapshotStateList snapshotStateList = c2Var.f18738i;
            int size = snapshotStateList.size();
            for (int i5 = 0; i5 < size; i5++) {
                y1 y1Var = (y1) snapshotStateList.get(i5);
                y1Var.d();
                y1Var.k(0L);
            }
            ((s2) e1Var3).setValue(Boolean.FALSE);
        }
    }

    public final void p(Object obj, Object obj2, c0 c0Var) {
        ((s2) this.f19015b).setValue(obj2);
        ((s2) this.f19016c).setValue(c0Var);
        if (Intrinsics.b(c().f18952d, obj) && Intrinsics.b(c().f18951c, obj2)) {
            return;
        }
        o(obj, false);
    }

    public final void q() {
        t1 t1Var;
        a1 a1Var = this.f19018e;
        if (a1Var == null || (t1Var = this.f19019f) == null) {
            return;
        }
        long jC = MathKt.c(a1Var.f18696g * a1Var.f18693d);
        Object objF = t1Var.f(jC);
        if (this.f19022i) {
            c().i(objF);
        }
        c().h(objF);
        this.f19025l.p(c().d());
        if (f() == -2.0f || this.f19022i) {
            n(objF);
        } else {
            k(this.o.e());
        }
        if (jC < a1Var.f18696g) {
            a1Var.f18692c = false;
        } else {
            this.f19018e = null;
            this.f19019f = null;
        }
    }

    public final void r(Object obj, c0 c0Var) {
        if (this.f19022i) {
            t1 t1Var = this.f19019f;
            if (Intrinsics.b(obj, t1Var != null ? t1Var.f18951c : null)) {
                return;
            }
        }
        p1.e1 e1Var = this.f19015b;
        if (Intrinsics.b(((s2) e1Var).getValue(), obj) && f() == -1.0f) {
            return;
        }
        ((s2) e1Var).setValue(obj);
        ((s2) this.f19016c).setValue(c0Var);
        o(f() == -3.0f ? obj : ((s2) this.f19023j).getValue(), !g());
        ((s2) this.f19020g).setValue(Boolean.valueOf(f() == -3.0f));
        if (f() >= 0.0f) {
            n(c().f((long) (f() * c().d())));
        } else if (f() == -3.0f) {
            n(obj);
        }
        this.f19022i = false;
        this.f19021h.p(-1.0f);
    }

    public final String toString() {
        return "current value: " + ((s2) this.f19023j).getValue() + ", target: " + ((s2) this.f19015b).getValue() + ", spec: " + ((c0) ((s2) this.f19016c).getValue());
    }
}
